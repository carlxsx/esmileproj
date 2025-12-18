-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2025 at 01:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `esmile_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Middle_Name` varchar(255) DEFAULT NULL,
  `Last_Name` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `permissions` text DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('active','suspended','inactive') NOT NULL DEFAULT 'active',
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`admin_id`, `username`, `First_Name`, `Middle_Name`, `Last_Name`, `user_id`, `permissions`, `Email`, `created_at`, `updated_at`, `status`, `last_login`) VALUES
(5, 'admin_user1', 'Robert', 'James', 'Anderson', 26, 'full', 'robert.anderson@gmail.com', '2025-01-05 12:27:36', '2025-01-05 12:27:36', 'active', NULL),
(7, 'admin111', 'Michael', 'Lee', 'Thompson', 28, 'full', 'michael.thompson@mail.com', '2025-01-05 23:44:35', '2025-01-05 23:44:35', 'active', NULL),
(8, 'admin_user2', 'Jennifer', 'Marie', 'Davis', 29, 'full', 'jennifer.davis@gmail.com', '2025-01-06 10:55:44', '2025-01-06 10:55:44', 'active', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `Appointment_ID` int(11) NOT NULL,
  `P_ID` int(11) DEFAULT NULL,
  `Appointment_date` date DEFAULT NULL,
  `Appointment_time` time DEFAULT NULL,
  `Status` varchar(50) DEFAULT 'Scheduled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `status` enum('Set Request','Approved','Cancel Requested','Cancelled') NOT NULL DEFAULT 'Set Request',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `cancel_reason` varchar(255) DEFAULT NULL,
  `payment_screenshot` varchar(255) DEFAULT NULL,
  `patient_name` varchar(255) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `treatment_fee` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `user_id`, `title`, `appointment_date`, `appointment_time`, `status`, `created_at`, `cancel_reason`, `payment_screenshot`, `patient_name`, `notes`, `treatment_fee`) VALUES
(1, 7, 'Check-up', '2024-12-19', '11:00:00', 'Cancel Requested', '2024-12-18 06:21:04', 'Change of plans', NULL, '', NULL, 0.00),
(2, 7, 'Check-up', '2024-12-19', '12:00:00', 'Set Request', '2024-12-18 06:31:52', NULL, NULL, '', NULL, 0.00),
(20, 6, 'Check-up', '2025-01-10', '09:00:00', 'Approved', '2025-01-06 11:01:47', NULL, NULL, '', NULL, 0.00),
(23, 7, 'Whitening', '2025-01-24', '11:00:00', 'Approved', '2025-01-23 05:35:34', NULL, NULL, '', NULL, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `contact_submissions`
--

CREATE TABLE `contact_submissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `submission_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_submissions`
--

INSERT INTO `contact_submissions` (`id`, `name`, `email`, `subject`, `message`, `submission_timestamp`) VALUES
(4, 'John Smith', 'john.smith@mail.com', 'General Inquiry', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris.\r\n', '2024-12-16 09:17:17');

-- --------------------------------------------------------

--
-- Table structure for table `dentist_details`
--

CREATE TABLE `dentist_details` (
  `dentist_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `First_Name` varchar(255) DEFAULT NULL,
  `Middle_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Sex` enum('Male','Female','other','') DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Mobile_no` char(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `license_number` varchar(50) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `contact_info` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dentist_details`
--

INSERT INTO `dentist_details` (`dentist_id`, `username`, `First_Name`, `Middle_Name`, `Last_Name`, `Sex`, `DOB`, `Email`, `Mobile_no`, `user_id`, `license_number`, `specialization`, `contact_info`) VALUES
(1, 'dentist', 'Sarah', 'Anne', 'Wilson', 'Female', '1985-03-15', 'sarah.wilson@gmail.com', '09477686482', 2, '277634', 'orthodontist', '09477686482'),
(3, 'dentist11', 'David', 'Mark', 'Rodriguez', 'Male', '1990-06-22', 'david.rodriguez@mail.com', '09293305078', 27, '1231231263', 'orthodontics', '09293305078');

-- --------------------------------------------------------

--
-- Table structure for table `followup_checkups`
--

CREATE TABLE `followup_checkups` (
  `FollowUp_ID` int(11) NOT NULL,
  `P_ID` int(11) DEFAULT NULL,
  `T_no` int(11) DEFAULT NULL,
  `Appointment_ID` int(11) DEFAULT NULL,
  `FollowUp_date` date DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `Status` varchar(50) DEFAULT 'Scheduled',
  `FollowUp_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_type`
--

CREATE TABLE `medicine_type` (
  `medicine_id` int(11) NOT NULL,
  `medicine_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_details`
--

CREATE TABLE `patient_details` (
  `P_ID` int(11) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Middle_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Mobile_no` varchar(14) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telephone_no` varchar(8) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city_municipality` varchar(255) DEFAULT NULL,
  `barangay` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `blood_type` varchar(10) DEFAULT NULL CHECK (`blood_type` in ('A+','A-','B+','B-','AB+','AB-','O+','O-','Not Sure')),
  `allergies` text DEFAULT NULL,
  `diseases` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_details`
--

INSERT INTO `patient_details` (`P_ID`, `First_Name`, `Middle_Name`, `Last_Name`, `DOB`, `Mobile_no`, `Sex`, `Email`, `Telephone_no`, `Password`, `region`, `province`, `city_municipality`, `barangay`, `user_id`, `username`, `height`, `weight`, `blood_type`, `allergies`, `diseases`) VALUES
(2, 'Emma', 'Grace', 'Johnson', '1995-04-12', '09194503018', 'female', 'emma.johnson@gmail.com', '02-888-1', '$2y$10$UgjWR83o1CMylh94yRka3.qe/zgr0k4WZHWR2k1LTdU8iXIhi6NAq', '03', 'BULACAN', 'SAN JOSE DEL MONTE CITY', 'FRANCISCO HOMES-GUIJO', 6, 'emma_j', 5.4, 58, 'A+', NULL, NULL),
(3, 'Lucas', 'James', 'Martinez', '1988-09-25', '09451623548', 'male', 'lucas.martinez@mail.com', '5613794', '$2y$10$r258hWeap.3n/x7sefe5AOpsmN/wNxsSDeuylEuQhO..SEf8/vGzS', 'NCR', 'NATIONAL CAPITAL REGION - THIRD DISTRICT', 'CALOOCAN CITY', 'BARANGAY 18', 7, 'lucas_m', 5.9, 75, 'O+', NULL, NULL),
(7, 'Sophia', 'Marie', 'Taylor', '1992-11-08', '09461378451', 'female', 'sophia.taylor@gmail.com', '6497234', '$2y$10$8Rs35NwPqeIjcvopbCb7cubsMBbVcoUrKy8JIkycsyF/wH5Ce6kNe', '10', 'BUKIDNON', 'LIBONA', 'SANTA FE', 17, 'sophia_t', 5.5, 52, 'B+', NULL, NULL);

--
-- Triggers `patient_details`
--
DELIMITER $$
CREATE TRIGGER `after_patient_insert` AFTER INSERT ON `patient_details` FOR EACH ROW BEGIN
    INSERT INTO users (user_id, username, password, role, Email, created_at)
    VALUES (NEW.user_id, NEW.username, NEW.Password, 'patient', NEW.Email, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescription_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `dosage` varchar(50) DEFAULT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `T_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `Report_ID` int(11) NOT NULL,
  `T_no` int(11) NOT NULL,
  `P_ID` int(11) NOT NULL,
  `Treatment_Description` text DEFAULT NULL,
  `Execution_Date` date NOT NULL,
  `Execution_Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `T_no` int(11) NOT NULL,
  `P_ID` int(11) DEFAULT NULL,
  `Note` text DEFAULT NULL,
  `Material_list` text DEFAULT NULL,
  `Fees` decimal(10,2) DEFAULT NULL,
  `Treatment` varchar(255) DEFAULT NULL,
  `T_date` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT 'Scheduled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treat_master`
--

CREATE TABLE `treat_master` (
  `T_no` int(11) NOT NULL,
  `Treatment_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('patient','dentist','admin') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `created_at`, `Email`) VALUES
(1, 'admin1', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'admin', '2024-12-12 23:06:54', 'admin1@example.com'),
(2, 'dentist', '123', 'dentist', '2024-12-13 18:57:58', 'sarah.wilson@gmail.com'),
(6, 'emma_j', '$2y$10$yVI2cntZ/ZAZIvT2P1qKqejDaxNmuRmg0n7yLtpBJTPnfbtwz.uCS', 'patient', '2024-12-16 09:42:25', 'emma.johnson@gmail.com'),
(7, 'lucas_m', '$2y$10$ZgwNd/ZOAnXOOCi.Qa4ueefczI.bUqfGcJ0tSNAxKtdgMdh2mNRoi', 'patient', '2024-12-16 09:45:42', 'lucas.martinez@mail.com'),
(17, 'sophia_t', '$2y$10$k4QEE8E2V5OkIT0.bow.u.PlV62qMC6cAptQXqBoxEyIN41n6t5Hi', 'patient', '2024-12-18 15:51:07', 'sophia.taylor@gmail.com'),
(26, 'admin_user1', '$2y$10$0ewmL.uUdvI0V4dANwHdieXhJ3mNcdr9ZUYj1jW/bPzs0W9Ati0LS', 'admin', '2025-01-05 12:27:36', 'robert.anderson@gmail.com'),
(27, 'dentist11', '$2y$10$KGg.suYYG5m7s366NGIOK.TsEcE4S.2/AVq3NL4tjqYupI2aQ/8mW', 'dentist', '2025-01-05 23:43:07', 'david.rodriguez@mail.com'),
(28, 'admin111', '$2y$10$p3Llt6oT2LZzWyrHNnSRrenILtKYVKaneAfuQBntinv0pidHaw8h2', 'admin', '2025-01-05 23:44:35', 'michael.thompson@mail.com'),
(29, 'admin_user2', '$2y$10$UWxVjsVvbnOztu83lYdeZuU.hUMcJvXbSIJDBgMKJ9nn0sW.SbAuO', 'admin', '2025-01-06 10:55:44', 'jennifer.davis@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`Appointment_ID`),
  ADD KEY `P_ID` (`P_ID`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dentist_details`
--
ALTER TABLE `dentist_details`
  ADD PRIMARY KEY (`dentist_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `followup_checkups`
--
ALTER TABLE `followup_checkups`
  ADD PRIMARY KEY (`FollowUp_ID`),
  ADD KEY `P_ID` (`P_ID`),
  ADD KEY `T_no` (`T_no`),
  ADD KEY `Appointment_ID` (`Appointment_ID`);

--
-- Indexes for table `medicine_type`
--
ALTER TABLE `medicine_type`
  ADD PRIMARY KEY (`medicine_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_details`
--
ALTER TABLE `patient_details`
  ADD PRIMARY KEY (`P_ID`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `medicine_id` (`medicine_id`),
  ADD KEY `fk_prescription_treatment` (`T_no`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`Report_ID`),
  ADD KEY `T_no` (`T_no`),
  ADD KEY `P_ID` (`P_ID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`T_no`),
  ADD KEY `P_ID` (`P_ID`);

--
-- Indexes for table `treat_master`
--
ALTER TABLE `treat_master`
  ADD PRIMARY KEY (`T_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `Appointment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `contact_submissions`
--
ALTER TABLE `contact_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dentist_details`
--
ALTER TABLE `dentist_details`
  MODIFY `dentist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `followup_checkups`
--
ALTER TABLE `followup_checkups`
  MODIFY `FollowUp_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine_type`
--
ALTER TABLE `medicine_type`
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `patient_details`
--
ALTER TABLE `patient_details`
  MODIFY `P_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `Report_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `T_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD CONSTRAINT `admin_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `patient_details` (`P_ID`);

--
-- Constraints for table `dentist_details`
--
ALTER TABLE `dentist_details`
  ADD CONSTRAINT `dentist_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `followup_checkups`
--
ALTER TABLE `followup_checkups`
  ADD CONSTRAINT `followup_checkups_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `patient_details` (`P_ID`),
  ADD CONSTRAINT `followup_checkups_ibfk_2` FOREIGN KEY (`T_no`) REFERENCES `treatment` (`T_no`),
  ADD CONSTRAINT `followup_checkups_ibfk_3` FOREIGN KEY (`Appointment_ID`) REFERENCES `appointment` (`Appointment_ID`);

--
-- Constraints for table `patient_details`
--
ALTER TABLE `patient_details`
  ADD CONSTRAINT `patient_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `fk_prescription_treatment` FOREIGN KEY (`T_no`) REFERENCES `treatment` (`T_no`),
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine_type` (`medicine_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`T_no`) REFERENCES `treatment` (`T_no`),
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`P_ID`) REFERENCES `patient_details` (`P_ID`);

--
-- Constraints for table `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `patient_details` (`P_ID`);

--
-- Constraints for table `treat_master`
--
ALTER TABLE `treat_master`
  ADD CONSTRAINT `treat_master_ibfk_1` FOREIGN KEY (`T_no`) REFERENCES `treatment` (`T_no`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
