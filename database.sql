-- Créer la base de données
CREATE DATABASE IF NOT EXISTS internship_db;
USE internship_db;

-- Table users
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) UNIQUE NOT NULL,
  passwordHash VARCHAR(255) NOT NULL,
  firstName VARCHAR(100) NOT NULL,
  lastName VARCHAR(100) NOT NULL,
  role ENUM('STUDENT', 'COMPANY', 'SUPERVISOR', 'ADMIN') NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table students
CREATE TABLE students (
  id INT PRIMARY KEY AUTO_INCREMENT,
  userId INT UNIQUE NOT NULL,
  bio TEXT,
  gpa DECIMAL(3, 2),
  university VARCHAR(255),
  faculty VARCHAR(255),
  studyLevel VARCHAR(100),
  specialization VARCHAR(255),
  skills TEXT,
  languages TEXT,
  phone VARCHAR(50),
  location VARCHAR(255),
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
);

-- Table companies
CREATE TABLE companies (
  id INT PRIMARY KEY AUTO_INCREMENT,
  userId INT UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  industry VARCHAR(100),
  location VARCHAR(255),
  description TEXT,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
);

-- Table supervisors
CREATE TABLE supervisors (
  id INT PRIMARY KEY AUTO_INCREMENT,
  userId INT UNIQUE NOT NULL,
  department VARCHAR(100),
  specialization VARCHAR(100),
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
);

-- Table internship_offers
CREATE TABLE internship_offers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  companyId INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  location VARCHAR(255),
  salary DECIMAL(10, 2),
  duration INT,
  requirements TEXT,
  status ENUM('OPEN', 'CLOSED') DEFAULT 'OPEN',
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (companyId) REFERENCES companies(userId) ON DELETE CASCADE,
  INDEX idx_status (status),
  INDEX idx_company (companyId)
);

-- Table applications
CREATE TABLE applications (
  id INT PRIMARY KEY AUTO_INCREMENT,
  studentId INT NOT NULL,
  offerId INT NOT NULL,
  coverLetter TEXT,
  attachments VARCHAR(255),
  status ENUM('PENDING', 'ACCEPTED', 'REJECTED', 'WITHDRAWN') DEFAULT 'PENDING',
  appliedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (studentId) REFERENCES students(userId) ON DELETE CASCADE,
  FOREIGN KEY (offerId) REFERENCES internship_offers(id) ON DELETE CASCADE,
  INDEX idx_status (status),
  INDEX idx_student (studentId),
  INDEX idx_offer (offerId)
);

-- Table internships
CREATE TABLE internships (
  id INT PRIMARY KEY AUTO_INCREMENT,
  studentId INT NOT NULL,
  offerId INT NOT NULL,
  supervisorId INT,
  startDate DATE,
  endDate DATE,
  status ENUM('ACTIVE', 'COMPLETED', 'CANCELLED') DEFAULT 'ACTIVE',
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (studentId) REFERENCES students(userId) ON DELETE CASCADE,
  FOREIGN KEY (offerId) REFERENCES internship_offers(id),
  FOREIGN KEY (supervisorId) REFERENCES supervisors(userId),
  INDEX idx_student (studentId),
  INDEX idx_status (status)
);

-- Table evaluations
CREATE TABLE evaluations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  internshipId INT NOT NULL,
  supervisorId INT NOT NULL,
  technicalSkills INT CHECK (technicalSkills >= 1 AND technicalSkills <= 5),
  communication INT CHECK (communication >= 1 AND communication <= 5),
  teamwork INT CHECK (teamwork >= 1 AND teamwork <= 5),
  timeManagement INT CHECK (timeManagement >= 1 AND timeManagement <= 5),
  comments TEXT,
  evaluatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (internshipId) REFERENCES internships(id) ON DELETE CASCADE,
  FOREIGN KEY (supervisorId) REFERENCES supervisors(userId),
  INDEX idx_internship (internshipId)
);

-- Table recommendations
CREATE TABLE recommendations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  studentId INT NOT NULL,
  offerId INT NOT NULL,
  matchScore INT CHECK (matchScore >= 0 AND matchScore <= 100),
  reason TEXT,
  generatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (studentId) REFERENCES students(userId) ON DELETE CASCADE,
  FOREIGN KEY (offerId) REFERENCES internship_offers(id),
  INDEX idx_student (studentId),
  INDEX idx_score (matchScore)
);

-- Table saved_offers
CREATE TABLE saved_offers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  studentId INT NOT NULL,
  offerId INT NOT NULL,
  savedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY unique_save (studentId, offerId),
  FOREIGN KEY (studentId) REFERENCES students(userId) ON DELETE CASCADE,
  FOREIGN KEY (offerId) REFERENCES internship_offers(id) ON DELETE CASCADE
);

-- Table saved_recommendations
CREATE TABLE saved_recommendations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  studentId INT NOT NULL,
  recommendationId INT NOT NULL,
  savedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY unique_save (studentId, recommendationId),
  FOREIGN KEY (studentId) REFERENCES students(userId) ON DELETE CASCADE,
  FOREIGN KEY (recommendationId) REFERENCES recommendations(id) ON DELETE CASCADE
);

-- Table notifications
CREATE TABLE notifications (
  id INT PRIMARY KEY AUTO_INCREMENT,
  userId INT NOT NULL,
  title VARCHAR(255),
  message TEXT NOT NULL,
  type ENUM('INFO', 'SUCCESS', 'WARNING', 'ERROR') DEFAULT 'INFO',
  isRead BOOLEAN DEFAULT false,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE,
  INDEX idx_user (userId),
  INDEX idx_read (isRead)
);

-- Table skills
CREATE TABLE skills (
  id INT PRIMARY KEY AUTO_INCREMENT,
  studentId INT NOT NULL,
  skillName VARCHAR(100) NOT NULL,
  proficiency ENUM('BEGINNER', 'INTERMEDIATE', 'ADVANCED', 'EXPERT') DEFAULT 'BEGINNER',
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (studentId) REFERENCES students(userId) ON DELETE CASCADE,
  INDEX idx_student (studentId)
);

-- Table activity_logs
CREATE TABLE activity_logs (
  id INT PRIMARY KEY AUTO_INCREMENT,
  userId INT,
  action VARCHAR(255),
  description TEXT,
  ipAddress VARCHAR(45),
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_user (userId),
  INDEX idx_action (action)
);
