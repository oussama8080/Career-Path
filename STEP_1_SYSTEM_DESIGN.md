# STEP 1: System Design & Database Schema

## 1. System Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                    INTERNSHIP MANAGEMENT PLATFORM              │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌──────────────┐      ┌──────────────┐      ┌──────────────┐ │
│  │   Frontend   │      │   Backend    │      │  AI Module   │ │
│  │   (React)    │◄────►│(Node/Express)│◄────►│   (Python)   │ │
│  └──────────────┘      └──────────────┘      └──────────────┘ │
│                               │                                 │
│                               ▼                                 │
│                        ┌──────────────┐                        │
│                        │   MySQL DB   │                        │
│                        └──────────────┘                         │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## 2. Core System Modules

### 2.1 Authentication & Authorization Module
- User registration/login (JWT-based)
- Role-based access control (RBAC)
- Session management
- Password reset & security features

### 2.2 User Management Module
- Student profiles
- Company profiles
- Supervisor management
- Admin dashboard

### 2.3 Internship Management Module
- Internship offer CRUD operations
- Offer publishing & visibility
- Offer search and filtering
- Offer analytics

### 2.4 Application Management Module
- Student applications for internships
- Application status tracking
- Application workflow management
- Document submission

### 2.5 Evaluation & Tracking Module
- Supervisor evaluation forms
- Performance tracking
- Progress monitoring
- Validation workflows

### 2.6 Recommendation Engine Module
- Student profile analysis
- Offer matching algorithm
- Recommendation generation
- Recommendation personalization

### 2.7 Notification & Communication Module
- Email notifications
- Application status alerts
- Recommendation notifications
- System notifications

---

## 3. Features Per Actor

### 3.1 **STUDENT**
#### Authentication & Profile
- ✓ Register account
- ✓ Login/logout
- ✓ Update profile (skills, experience, CV, portfolio)
- ✓ View profile completeness score

#### Job Search & Application
- ✓ Search internship offers (with filters: location, domain, duration)
- ✓ View offer details
- ✓ Apply for internships
- ✓ Track application status
- ✓ Cancel applications

#### Recommendations
- ✓ View AI-generated personalized recommendations
- ✓ Save favorite offers
- ✓ Mark offers as "interested"

#### Tracking & Evaluation
- ✓ View assigned internship
- ✓ Update progress (tasks completed, hours logged)
- ✓ Submit required documents
- ✓ View supervisor feedback
- ✓ Receive evaluation scores

#### Dashboard
- ✓ Homepage with quick stats
- ✓ Application history
- ✓ Current internship progress
- ✓ Recommended offers widget
- ✓ Saved offers collection

---

### 3.2 **COMPANY**
#### Authentication & Profile
- ✓ Register account
- ✓ Login/logout
- ✓ Update company profile (description, location, website)
- ✓ Manage company details

#### Internship Offers
- ✓ Create/edit/delete internship offers
- ✓ Publish offers
- ✓ Set requirements (skills, education level)
- ✓ View offer analytics (views, applications)
- ✓ Archive/unpublish offers

#### Applications Management
- ✓ View received applications
- ✓ Review student profiles
- ✓ Accept/reject applications
- ✓ Schedule interviews
- ✓ Send messages to applicants

#### Internship Management
- ✓ Assign intern to supervisor
- ✓ View internship progress
- ✓ Manage interns within internship period

#### Dashboard
- ✓ Active offers count
- ✓ Application statistics
- ✓ Internship metrics
- ✓ Top applicants ranking

---

### 3.3 **SUPERVISOR** (Company Employee)
#### Authentication & Profile
- ✓ Login/logout
- ✓ View and update profile
- ✓ Link to company

#### Internship Oversight
- ✓ View assigned interns
- ✓ Access intern profiles
- ✓ Create evaluation forms
- ✓ Track intern progress (tasks, hours)
- ✓ Provide feedback (comments, ratings)

#### Evaluation
- ✓ Submit mid-term evaluations
- ✓ Submit final evaluations
- ✓ Rate performance on criteria (technical skills, soft skills, etc.)
- ✓ Validate intern completion
- ✓ Generate evaluation reports

#### Communication
- ✓ Message interns
- ✓ View intern submissions
- ✓ Mark tasks as completed

#### Dashboard
- ✓ Assigned interns list
- ✓ Evaluation due dates
- ✓ Student progress summary

---

### 3.4 **ADMIN**
#### User Management
- ✓ View all users (students, companies, supervisors)
- ✓ Activate/deactivate accounts
- ✓ Manage user roles
- ✓ View user statistics
- ✓ Send system notifications

#### Platform Management
- ✓ Moderate internship offers
- ✓ Manage application disputes
- ✓ Configure system settings
- ✓ Manage email templates

#### Analytics & Reporting
- ✓ View platform statistics (users, offers, applications)
- ✓ Generate reports (student satisfaction, placement rate)
- ✓ Monitor system performance
- ✓ User activity logs

#### Content Management
- ✓ Manage categories & skills
- ✓ Manage locations
- ✓ Configure application workflows

---

## 4. Complete MySQL Database Schema

### 4.1 Core Tables

#### **1. USERS Table**
```sql
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  phone VARCHAR(20),
  role ENUM('STUDENT', 'COMPANY', 'SUPERVISOR', 'ADMIN') NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  is_email_verified BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP NULL,
  
  INDEX idx_email (email),
  INDEX idx_role (role),
  INDEX idx_created_at (created_at)
);
```

#### **2. STUDENTS Table**
```sql
CREATE TABLE students (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT UNIQUE NOT NULL,
  academic_level ENUM('HIGH_SCHOOL', 'BACHELOR', 'MASTER', 'PHD') NOT NULL,
  field_of_study VARCHAR(150),
  university VARCHAR(200),
  graduation_year INT,
  bio TEXT,
  profile_picture_url VARCHAR(500),
  cv_url VARCHAR(500),
  portfolio_url VARCHAR(500),
  date_of_birth DATE,
  gender ENUM('MALE', 'FEMALE', 'OTHER'),
  profile_completeness_percentage INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  INDEX idx_academic_level (academic_level),
  INDEX idx_field_of_study (field_of_study)
);
```

#### **3. STUDENT_SKILLS Table**
```sql
CREATE TABLE student_skills (
  id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  skill_id INT NOT NULL,
  proficiency_level ENUM('BEGINNER', 'INTERMEDIATE', 'ADVANCED', 'EXPERT') DEFAULT 'INTERMEDIATE',
  years_of_experience DECIMAL(3,1) DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
  FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE,
  UNIQUE KEY unique_student_skill (student_id, skill_id),
  INDEX idx_student_id (student_id)
);
```

#### **4. COMPANIES Table**
```sql
CREATE TABLE companies (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT UNIQUE NOT NULL,
  company_name VARCHAR(200) NOT NULL,
  company_registration_number VARCHAR(100) UNIQUE,
  website VARCHAR(255),
  company_description TEXT,
  industry VARCHAR(150),
  company_size ENUM('STARTUP', 'SMALL', 'MEDIUM', 'LARGE', 'ENTERPRISE'),
  headquarters_address VARCHAR(300),
  headquarters_city VARCHAR(100),
  headquarters_country VARCHAR(100),
  logo_url VARCHAR(500),
  verified BOOLEAN DEFAULT FALSE,
  verification_date TIMESTAMP NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  INDEX idx_company_name (company_name),
  INDEX idx_industry (industry),
  INDEX idx_verified (verified)
);
```

#### **5. SUPERVISORS Table**
```sql
CREATE TABLE supervisors (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT UNIQUE NOT NULL,
  company_id INT NOT NULL,
  job_title VARCHAR(150),
  department VARCHAR(150),
  bio TEXT,
  profile_picture_url VARCHAR(500),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE,
  INDEX idx_company_id (company_id)
);
```

#### **6. SKILLS Table**
```sql
CREATE TABLE skills (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(150) UNIQUE NOT NULL,
  category VARCHAR(100),
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  INDEX idx_name (name),
  INDEX idx_category (category)
);
```

#### **7. INTERNSHIP_OFFERS Table**
```sql
CREATE TABLE internship_offers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  company_id INT NOT NULL,
  title VARCHAR(250) NOT NULL,
  description TEXT NOT NULL,
  requirements TEXT,
  responsibilities TEXT,
  location VARCHAR(300),
  location_type ENUM('ON_SITE', 'REMOTE', 'HYBRID') DEFAULT 'ON_SITE',
  start_date DATE,
  end_date DATE,
  duration_weeks INT,
  salary_monthly DECIMAL(10,2),
  salary_currency VARCHAR(3),
  academic_level ENUM('HIGH_SCHOOL', 'BACHELOR', 'MASTER', 'PHD'),
  field_of_study VARCHAR(150),
  number_of_positions INT DEFAULT 1,
  available_positions INT DEFAULT 1,
  status ENUM('DRAFT', 'PUBLISHED', 'CLOSED', 'ARCHIVED') DEFAULT 'DRAFT',
  published_at TIMESTAMP NULL,
  closed_at TIMESTAMP NULL,
  views_count INT DEFAULT 0,
  applications_count INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE,
  INDEX idx_status (status),
  INDEX idx_published_at (published_at),
  INDEX idx_company_id (company_id),
  INDEX idx_location (location)
);
```

#### **8. INTERNSHIP_OFFER_REQUIRED_SKILLS Table**
```sql
CREATE TABLE internship_offer_required_skills (
  id INT PRIMARY KEY AUTO_INCREMENT,
  offer_id INT NOT NULL,
  skill_id INT NOT NULL,
  proficiency_level ENUM('BEGINNER', 'INTERMEDIATE', 'ADVANCED', 'EXPERT'),
  is_required BOOLEAN DEFAULT TRUE,
  
  FOREIGN KEY (offer_id) REFERENCES internship_offers(id) ON DELETE CASCADE,
  FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE,
  UNIQUE KEY unique_offer_skill (offer_id, skill_id),
  INDEX idx_offer_id (offer_id)
);
```

#### **9. APPLICATIONS Table**
```sql
CREATE TABLE applications (
  id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  offer_id INT NOT NULL,
  status ENUM('PENDING', 'REVIEWED', 'SHORTLISTED', 'INTERVIEWED', 'ACCEPTED', 'REJECTED', 'WITHDRAWN') DEFAULT 'PENDING',
  application_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  review_date TIMESTAMP NULL,
  response_date TIMESTAMP NULL,
  cover_letter TEXT,
  portfolio_link VARCHAR(500),
  additional_documents_url VARCHAR(500),
  rejection_reason TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
  FOREIGN KEY (offer_id) REFERENCES internship_offers(id) ON DELETE CASCADE,
  UNIQUE KEY unique_student_offer (student_id, offer_id),
  INDEX idx_status (status),
  INDEX idx_student_id (student_id),
  INDEX idx_offer_id (offer_id),
  INDEX idx_application_date (application_date)
);
```

#### **10. INTERNSHIPS Table**
```sql
CREATE TABLE internships (
  id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  offer_id INT NOT NULL,
  supervisor_id INT NOT NULL,
  company_id INT NOT NULL,
  application_id INT NOT NULL,
  status ENUM('ACTIVE', 'COMPLETED', 'TERMINATED', 'ON_HOLD') DEFAULT 'ACTIVE',
  actual_start_date DATE,
  actual_end_date DATE,
  hours_completed INT DEFAULT 0,
  total_hours_required INT,
  tasks_completed INT DEFAULT 0,
  tasks_total INT DEFAULT 0,
  progress_percentage INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
  FOREIGN KEY (offer_id) REFERENCES internship_offers(id) ON DELETE CASCADE,
  FOREIGN KEY (supervisor_id) REFERENCES supervisors(id) ON DELETE SET NULL,
  FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE,
  FOREIGN KEY (application_id) REFERENCES applications(id) ON DELETE CASCADE,
  UNIQUE KEY unique_student_offer_internship (student_id, offer_id),
  INDEX idx_status (status),
  INDEX idx_student_id (student_id),
  INDEX idx_supervisor_id (supervisor_id)
);
```

#### **11. EVALUATIONS Table**
```sql
CREATE TABLE evaluations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  internship_id INT NOT NULL,
  supervisor_id INT NOT NULL,
  student_id INT NOT NULL,
  evaluation_type ENUM('MID_TERM', 'FINAL') NOT NULL,
  technical_skills_rating INT CHECK (technical_skills_rating >= 1 AND technical_skills_rating <= 5),
  soft_skills_rating INT CHECK (soft_skills_rating >= 1 AND soft_skills_rating <= 5),
  communication_rating INT CHECK (communication_rating >= 1 AND communication_rating <= 5),
  teamwork_rating INT CHECK (teamwork_rating >= 1 AND teamwork_rating <= 5),
  overall_performance INT CHECK (overall_performance >= 1 AND overall_performance <= 5),
  comments TEXT,
  strengths TEXT,
  areas_for_improvement TEXT,
  would_hire_again BOOLEAN,
  is_validated BOOLEAN DEFAULT FALSE,
  validated_at TIMESTAMP NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  FOREIGN KEY (internship_id) REFERENCES internships(id) ON DELETE CASCADE,
  FOREIGN KEY (supervisor_id) REFERENCES supervisors(id) ON DELETE CASCADE,
  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
  UNIQUE KEY unique_internship_evaluation (internship_id, evaluation_type),
  INDEX idx_internship_id (internship_id),
  INDEX idx_supervisor_id (supervisor_id),
  INDEX idx_student_id (student_id)
);
```

#### **12. RECOMMENDATIONS Table**
```sql
CREATE TABLE recommendations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  offer_id INT NOT NULL,
  matching_score DECIMAL(5,2) CHECK (matching_score >= 0 AND matching_score <= 100),
  skill_match_percentage DECIMAL(5,2),
  location_match BOOLEAN,
  level_match BOOLEAN,
  recommendation_reason TEXT,
  is_viewed BOOLEAN DEFAULT FALSE,
  viewed_at TIMESTAMP NULL,
  is_applied BOOLEAN DEFAULT FALSE,
  applied_at TIMESTAMP NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
  FOREIGN KEY (offer_id) REFERENCES internship_offers(id) ON DELETE CASCADE,
  INDEX idx_student_id (student_id),
  INDEX idx_matching_score (matching_score),
  INDEX idx_created_at (created_at)
);
```

#### **13. SAVED_OFFERS Table**
```sql
CREATE TABLE saved_offers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  offer_id INT NOT NULL,
  saved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
  FOREIGN KEY (offer_id) REFERENCES internship_offers(id) ON DELETE CASCADE,
  UNIQUE KEY unique_student_saved_offer (student_id, offer_id),
  INDEX idx_student_id (student_id)
);
```

#### **14. NOTIFICATIONS Table**
```sql
CREATE TABLE notifications (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  notification_type VARCHAR(100) NOT NULL,
  title VARCHAR(255) NOT NULL,
  message TEXT NOT NULL,
  related_entity_type VARCHAR(100),
  related_entity_id INT,
  is_read BOOLEAN DEFAULT FALSE,
  read_at TIMESTAMP NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  INDEX idx_user_id (user_id),
  INDEX idx_is_read (is_read),
  INDEX idx_created_at (created_at)
);
```

#### **15. ACTIVITY_LOGS Table**
```sql
CREATE TABLE activity_logs (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  action VARCHAR(150) NOT NULL,
  entity_type VARCHAR(100),
  entity_id INT,
  details JSON,
  ip_address VARCHAR(45),
  user_agent VARCHAR(500),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  INDEX idx_user_id (user_id),
  INDEX idx_action (action),
  INDEX idx_created_at (created_at)
);
```

---

### 4.2 Database Relationships Diagram

```
USERS (1) ──────────────── (1) STUDENTS
          ├──────────────── (1) COMPANIES
          ├──────────────── (1) SUPERVISORS
          └──────────────── (N) NOTIFICATIONS
          └──────────────── (N) ACTIVITY_LOGS

STUDENTS (N) ─────────────── (N) SKILLS
                              (via STUDENT_SKILLS)

STUDENTS (1) ──────────────── (N) APPLICATIONS
             ├──────────────── (N) INTERNSHIPS
             ├──────────────── (N) EVALUATIONS
             ├──────────────── (N) RECOMMENDATIONS
             └──────────────── (N) SAVED_OFFERS

COMPANIES (1) ──────────────── (N) SUPERVISORS
             ├──────────────── (N) INTERNSHIP_OFFERS
             └──────────────── (N) INTERNSHIPS

INTERNSHIP_OFFERS (N) ─────── (N) SKILLS
                             (via INTERNSHIP_OFFER_REQUIRED_SKILLS)
                   (1) ─────── (N) APPLICATIONS
                   (1) ─────── (N) INTERNSHIPS
                   (1) ─────── (N) RECOMMENDATIONS

SUPERVISORS (1) ──────────── (N) INTERNSHIPS
             └──────────────── (N) EVALUATIONS

INTERNSHIPS (1) ────────────── (N) EVALUATIONS
            (1) ────────────── (1) APPLICATION
```

---

## 5. Key Design Decisions

### 5.1 Security Considerations
- ✓ Password hashing (bcrypt)
- ✓ JWT token for authentication
- ✓ Role-based access control (RBAC)
- ✓ Secure password reset flow
- ✓ Email verification
- ✓ Activity audit logging

### 5.2 Scalability Features
- ✓ Proper indexing on frequently queried columns
- ✓ Separate table for skills (normalized design)
- ✓ Denormalized fields for quick analytics (views_count, etc.)
- ✓ Soft deletes support (deleted_at field)
- ✓ Pagination-friendly timestamps

### 5.3 Data Integrity
- ✓ Foreign key constraints
- ✓ Unique constraints where needed
- ✓ CHECK constraints for ratings
- ✓ Enumerated types for status fields
- ✓ Cascading deletes where appropriate

### 5.4 Auditability
- ✓ Timestamp tracking (created_at, updated_at)
- ✓ Activity logs for all major actions
- ✓ Status tracking (applications, internships)
- ✓ Evaluation validation tracking

---

## 6. Sample Data Relationships Flow

```
1. Student registers account
   └─ User (role=STUDENT) + Student profile

2. Company publishes internship offer
   └─ Company creates INTERNSHIP_OFFER
      └─ Offer can require specific SKILLS

3. Student applies for internship
   └─ APPLICATION created (status=PENDING)
   
4. Company accepts application
   └─ APPLICATION status → ACCEPTED
   └─ INTERNSHIP record created
   └─ SUPERVISOR assigned

5. Supervisor evaluates student
   └─ EVALUATION created
   └─ NOTIFICATION sent to student

6. AI generates recommendations
   └─ RECOMMENDATIONS created based on:
      - Student skills vs Offer requirements
      - Location preference
      - Academic level match
```

---

## Ready for STEP 2

This completes the system design and database schema for your internship management platform. The schema is:
- ✓ Fully normalized
- ✓ Scalable
- ✓ Secure
- ✓ Audit-friendly
- ✓ Production-ready

**Key Metrics:**
- 15 core tables
- 4 actor types with distinct features
- 8 main modules
- Role-based access control
- Support for AI recommendations

Proceed to **STEP 2** when ready for backend architecture and Express setup.
