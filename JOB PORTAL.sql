CREATE DATABASE JOBPORTAL;
USE JOBPORTAL;
CREATE TABLE `applications` (
  `Application_id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `experience` enum('Fresher','Experienced') NOT NULL,
  `appliedDate` date NOT NULL,
  `skills` text,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`Application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `pin` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `jobs` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `job_title` varchar(100) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `j_location` varchar(100) NOT NULL,
  `job_type` varchar(100) NOT NULL,
  `salary` varchar(100) NOT NULL,
  `experience_level` varchar(100) NOT NULL,
  `skills` varchar(100) DEFAULT NULL,
  `posted_date` date NOT NULL,
  `application_deadline` date DEFAULT NULL,
  `job_description` text NOT NULL,
  `job_category` varchar(100) DEFAULT NULL,
  `required_qualifications` text,
  `contact_information` varchar(100) DEFAULT NULL,
  `vacancy` int DEFAULT '1',
  `percentage` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `recruiter` (
  `r_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `company_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`r_id`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `seeker` (
  `seeker_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `qualification` varchar(155) DEFAULT NULL,
  `specialization` varchar(145) DEFAULT NULL,
  `tenth` decimal(5,2) DEFAULT NULL,
  `twelth` decimal(5,2) DEFAULT NULL,
  `experience` enum('experienced','fresher') DEFAULT NULL,
  `period` decimal(3,2) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `skills` text,
  PRIMARY KEY (`seeker_id`),
  KEY `id_idx` (`id`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM jobportal.applications;