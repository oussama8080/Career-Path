-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 06 mai 2026 à 14:22
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `internship_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `ipAddress` varchar(45) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `userId`, `action`, `description`, `ipAddress`, `createdAt`) VALUES
(1, NULL, 'OFFER_VIEW', 'offerId:2', NULL, '2026-04-20 13:56:02'),
(2, NULL, 'OFFER_VIEW', 'offerId:2', NULL, '2026-04-20 13:56:02'),
(3, NULL, 'OFFER_VIEW', 'offerId:3', NULL, '2026-04-21 11:17:37'),
(4, NULL, 'OFFER_VIEW', 'offerId:3', NULL, '2026-04-21 11:17:37'),
(5, NULL, 'OFFER_VIEW', 'offerId:5', NULL, '2026-04-27 11:12:47'),
(6, NULL, 'OFFER_VIEW', 'offerId:5', NULL, '2026-04-27 11:12:47');

-- --------------------------------------------------------

--
-- Structure de la table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `offerId` int(11) NOT NULL,
  `coverLetter` text DEFAULT NULL,
  `attachments` varchar(255) DEFAULT NULL,
  `status` enum('PENDING','ACCEPTED','REJECTED','WITHDRAWN') DEFAULT 'PENDING',
  `appliedDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `applications`
--

INSERT INTO `applications` (`id`, `studentId`, `offerId`, `coverLetter`, `attachments`, `status`, `appliedDate`) VALUES
(1, 6, 7, 'test from diagnostic', '', 'PENDING', '2026-04-16 22:55:49'),
(2, 6, 6, 'diag apply verify', '', 'ACCEPTED', '2026-04-16 23:06:39'),
(3, 6, 2, 'I am interested in this internship opportunity and would like to apply.', NULL, 'PENDING', '2026-04-16 23:07:37'),
(4, 6, 3, 'I am interested in this internship opportunity and would like to apply.', NULL, 'PENDING', '2026-04-16 23:07:39'),
(5, 6, 3, 'I am interested in this internship opportunity and would like to apply.', NULL, 'WITHDRAWN', '2026-04-16 23:08:07'),
(6, 6, 2, 'I am interested in this internship opportunity and would like to apply.', NULL, 'PENDING', '2026-04-16 23:08:08'),
(7, 6, 4, 'I am interested in this internship opportunity and would like to apply.', NULL, 'WITHDRAWN', '2026-04-16 23:08:09'),
(8, 6, 5, 'I am interested in this internship opportunity and would like to apply.', NULL, 'WITHDRAWN', '2026-04-16 23:08:10'),
(9, 6, 6, 'I am interested in this internship opportunity and would like to apply.', NULL, 'ACCEPTED', '2026-04-16 23:08:11'),
(10, 6, 7, 'I am interested in this internship opportunity and would like to apply.', NULL, 'ACCEPTED', '2026-04-16 23:08:12'),
(11, 6, 2, 'E2E validation apply', NULL, 'REJECTED', '2026-04-17 14:09:30'),
(12, 6, 5, 'I am interested in this internship opportunity and would like to apply.', NULL, 'REJECTED', '2026-04-20 11:34:13'),
(13, 6, 4, 'I am interested in this internship opportunity and would like to apply.', NULL, 'ACCEPTED', '2026-04-20 13:17:51');

-- --------------------------------------------------------

--
-- Structure de la table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `industry` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `website` varchar(255) DEFAULT NULL,
  `foundedYear` int(11) DEFAULT NULL,
  `employeeCount` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `companies`
--

INSERT INTO `companies` (`id`, `userId`, `name`, `industry`, `location`, `description`, `createdAt`, `website`, `foundedYear`, `employeeCount`, `phone`) VALUES
(1, 10, 'LeoTech Solutions', 'Technology', 'Casablanca, Morocco', 'LeoTech Solutions is a technology company focused on modern web development, AI-enabled products, and hands-on internship mentoring for students.', '2026-04-16 22:35:04', 'https://leotech.ma', 2018, '11-50 employees', '+212 6 12 34 56 78');

-- --------------------------------------------------------

--
-- Structure de la table `evaluations`
--

CREATE TABLE `evaluations` (
  `id` int(11) NOT NULL,
  `internshipId` int(11) NOT NULL,
  `supervisorId` int(11) NOT NULL,
  `technicalSkills` int(11) DEFAULT NULL CHECK (`technicalSkills` >= 1 and `technicalSkills` <= 5),
  `communication` int(11) DEFAULT NULL CHECK (`communication` >= 1 and `communication` <= 5),
  `teamwork` int(11) DEFAULT NULL CHECK (`teamwork` >= 1 and `teamwork` <= 5),
  `timeManagement` int(11) DEFAULT NULL CHECK (`timeManagement` >= 1 and `timeManagement` <= 5),
  `comments` text DEFAULT NULL,
  `evaluatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `internships`
--

CREATE TABLE `internships` (
  `id` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `offerId` int(11) NOT NULL,
  `supervisorId` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `status` enum('ACTIVE','COMPLETED','CANCELLED') DEFAULT 'ACTIVE',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `internship_offers`
--

CREATE TABLE `internship_offers` (
  `id` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `status` enum('OPEN','CLOSED') DEFAULT 'OPEN',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `internship_offers`
--

INSERT INTO `internship_offers` (`id`, `companyId`, `title`, `description`, `location`, `salary`, `duration`, `requirements`, `status`, `createdAt`) VALUES
(2, 10, 'Frontend Developer Intern', 'Build reusable React components, collaborate with design, and improve UI quality.', 'Casablanca / Hybrid', 650.00, 4, 'React, JavaScript, CSS, Git', 'OPEN', '2026-04-16 22:35:04'),
(3, 10, 'Backend Node.js Intern', 'Develop REST APIs, work with MySQL, and improve backend reliability and tests.', 'Remote', 700.00, 6, 'Node.js, Express, SQL, REST APIs', 'OPEN', '2026-04-16 22:35:04'),
(4, 10, 'Data Analyst Intern', 'Prepare dashboards, clean datasets, and support business reporting decisions.', 'Casablanca', 600.00, 5, 'Excel, SQL, Power BI or Tableau', 'OPEN', '2026-04-16 22:35:04'),
(5, 10, 'QA Automation Intern', 'Create test scenarios, automate regression tests, and report quality issues clearly.', 'Remote / Hybrid', 620.00, 4, 'Testing basics, Cypress or Playwright, Git', 'OPEN', '2026-04-16 22:35:04'),
(6, 10, 'UI UX Design Intern', 'Design internship platform screens, improve user flows, and prototype key journeys.', 'Casablanca / Remote', 580.00, 3, 'Figma, UX principles, visual design', 'OPEN', '2026-04-16 22:35:04'),
(7, 10, 'DevOps Intern', 'Support CI/CD pipelines, containerized deployments, and monitoring for staging apps.', 'Remote', 750.00, 6, 'Docker, CI CD, Linux basics', 'OPEN', '2026-04-16 22:35:04');

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `type` enum('INFO','SUCCESS','WARNING','ERROR') DEFAULT 'INFO',
  `isRead` tinyint(1) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recommendations`
--

CREATE TABLE `recommendations` (
  `id` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `offerId` int(11) NOT NULL,
  `matchScore` int(11) DEFAULT NULL CHECK (`matchScore` >= 0 and `matchScore` <= 100),
  `reason` text DEFAULT NULL,
  `generatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `saved_offers`
--

CREATE TABLE `saved_offers` (
  `id` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `offerId` int(11) NOT NULL,
  `savedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `saved_recommendations`
--

CREATE TABLE `saved_recommendations` (
  `id` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `recommendationId` int(11) NOT NULL,
  `savedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `skillName` varchar(100) NOT NULL,
  `proficiency` enum('BEGINNER','INTERMEDIATE','ADVANCED','EXPERT') DEFAULT 'BEGINNER',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `bio` text DEFAULT NULL,
  `gpa` decimal(3,2) DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `faculty` varchar(255) DEFAULT NULL,
  `studyLevel` varchar(100) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `languages` text DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `students`
--

INSERT INTO `students` (`id`, `userId`, `bio`, `gpa`, `university`, `createdAt`, `faculty`, `studyLevel`, `specialization`, `skills`, `languages`, `phone`, `location`) VALUES
(1, 6, 'Hello', 3.50, 'Gafsa universty', '2026-04-13 15:26:47', 'FSGF', 'M1', 'ing', '[\"React\",\"sql\",\"java\",\"css\"]', '[\"French\",\"English\"]', '+21626842483', 'Gafsa');

-- --------------------------------------------------------

--
-- Structure de la table `supervisors`
--

CREATE TABLE `supervisors` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `role` enum('STUDENT','COMPANY','SUPERVISOR','ADMIN') NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `passwordHash`, `firstName`, `lastName`, `role`, `createdAt`, `updatedAt`) VALUES
(6, 'dallaginaji5@gmail.com', '$2a$10$TeZ2u/o9WudvowSNSh.DBeHemTlcEZ91TAMz6dJ2AUqx1Ypey/.Um', 'NAJI', 'DALLAGI', 'STUDENT', '2026-04-13 15:25:01', '2026-04-13 15:25:01'),
(7, 'fsgf@gmail.com', '$2a$10$p3bAd.tba8P/ntE/IhRjH.NXr.GQeEdHQB7HETQD5A3ti2O9s.TLa', 'mohamed', 'othmeni', 'COMPANY', '2026-04-13 15:34:41', '2026-04-13 15:34:41'),
(8, 'company_1776094823@example.com', '$2a$10$HyrCKeUcS5Qwh/MOFN3gnukbwqCgdG/8lHbrpG16vbC3BGeF6sa1i', 'Acme', 'Corp', 'COMPANY', '2026-04-13 15:40:24', '2026-04-13 15:40:24'),
(9, 'sami@gmil.com', '$2a$10$z1VOQfOdkV5ZMn32PivfO.O/7pKUkvKCsmdo/e28voH4GFlt/U5RK', 'Sami', 'Hidour', 'COMPANY', '2026-04-13 15:49:37', '2026-04-13 15:49:37'),
(10, 'leo@gmail.com', '$2a$10$9qCuzdiIk0S2imcWCeBDyOJzHYDr6UgEs2QNNhA2kSNWBgAHCSlp2', 'Leo', 'Messi', 'COMPANY', '2026-04-13 20:43:02', '2026-04-20 13:32:04');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`userId`),
  ADD KEY `idx_action` (`action`);

--
-- Index pour la table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_student` (`studentId`),
  ADD KEY `idx_offer` (`offerId`);

--
-- Index pour la table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userId` (`userId`);

--
-- Index pour la table `evaluations`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supervisorId` (`supervisorId`),
  ADD KEY `idx_internship` (`internshipId`);

--
-- Index pour la table `internships`
--
ALTER TABLE `internships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offerId` (`offerId`),
  ADD KEY `supervisorId` (`supervisorId`),
  ADD KEY `idx_student` (`studentId`),
  ADD KEY `idx_status` (`status`);

--
-- Index pour la table `internship_offers`
--
ALTER TABLE `internship_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_company` (`companyId`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`userId`),
  ADD KEY `idx_read` (`isRead`);

--
-- Index pour la table `recommendations`
--
ALTER TABLE `recommendations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offerId` (`offerId`),
  ADD KEY `idx_student` (`studentId`),
  ADD KEY `idx_score` (`matchScore`);

--
-- Index pour la table `saved_offers`
--
ALTER TABLE `saved_offers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_save` (`studentId`,`offerId`),
  ADD KEY `offerId` (`offerId`);

--
-- Index pour la table `saved_recommendations`
--
ALTER TABLE `saved_recommendations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_save` (`studentId`,`recommendationId`),
  ADD KEY `recommendationId` (`recommendationId`);

--
-- Index pour la table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_student` (`studentId`);

--
-- Index pour la table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userId` (`userId`);

--
-- Index pour la table `supervisors`
--
ALTER TABLE `supervisors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userId` (`userId`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `internships`
--
ALTER TABLE `internships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `internship_offers`
--
ALTER TABLE `internship_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `recommendations`
--
ALTER TABLE `recommendations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `saved_offers`
--
ALTER TABLE `saved_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `saved_recommendations`
--
ALTER TABLE `saved_recommendations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `supervisors`
--
ALTER TABLE `supervisors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`userId`) ON DELETE CASCADE,
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`offerId`) REFERENCES `internship_offers` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `evaluations_ibfk_1` FOREIGN KEY (`internshipId`) REFERENCES `internships` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `evaluations_ibfk_2` FOREIGN KEY (`supervisorId`) REFERENCES `supervisors` (`userId`);

--
-- Contraintes pour la table `internships`
--
ALTER TABLE `internships`
  ADD CONSTRAINT `internships_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`userId`) ON DELETE CASCADE,
  ADD CONSTRAINT `internships_ibfk_2` FOREIGN KEY (`offerId`) REFERENCES `internship_offers` (`id`),
  ADD CONSTRAINT `internships_ibfk_3` FOREIGN KEY (`supervisorId`) REFERENCES `supervisors` (`userId`);

--
-- Contraintes pour la table `internship_offers`
--
ALTER TABLE `internship_offers`
  ADD CONSTRAINT `internship_offers_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `companies` (`userId`) ON DELETE CASCADE;

--
-- Contraintes pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `recommendations`
--
ALTER TABLE `recommendations`
  ADD CONSTRAINT `recommendations_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`userId`) ON DELETE CASCADE,
  ADD CONSTRAINT `recommendations_ibfk_2` FOREIGN KEY (`offerId`) REFERENCES `internship_offers` (`id`);

--
-- Contraintes pour la table `saved_offers`
--
ALTER TABLE `saved_offers`
  ADD CONSTRAINT `saved_offers_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`userId`) ON DELETE CASCADE,
  ADD CONSTRAINT `saved_offers_ibfk_2` FOREIGN KEY (`offerId`) REFERENCES `internship_offers` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `saved_recommendations`
--
ALTER TABLE `saved_recommendations`
  ADD CONSTRAINT `saved_recommendations_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`userId`) ON DELETE CASCADE,
  ADD CONSTRAINT `saved_recommendations_ibfk_2` FOREIGN KEY (`recommendationId`) REFERENCES `recommendations` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`userId`) ON DELETE CASCADE;

--
-- Contraintes pour la table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `supervisors`
--
ALTER TABLE `supervisors`
  ADD CONSTRAINT `supervisors_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
