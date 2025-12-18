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
(5, 'lolokaba?', 'lokoloko', 'lokaloka', 'lokaloko', 26, 'full', 'lokaloko@gmail.com', '2025-01-05 12:27:36', '2025-01-05 12:27:36', 'active', NULL),
(7, 'admin111', 'Ash ', 'shoo', 'Ketchum', 28, 'full', 'ash@mail.com', '2025-01-05 23:44:35', '2025-01-05 23:44:35', 'active', NULL),
(8, 'trynaten', 'magdalena', 'biglangbuka', 'buka', 29, 'full', 'magda69@gmail.com', '2025-01-06 10:55:44', '2025-01-06 10:55:44', 'active', NULL);

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
(4, 8, 'Check-up', '2024-12-19', '13:00:00', 'Set Request', '2024-12-18 11:22:51', NULL, NULL, '', NULL, 0.00),
(5, 8, 'hello there!', '2024-12-18', '21:25:00', 'Cancel Requested', '2024-12-18 11:23:09', 'Other', NULL, '', NULL, 0.00),
(6, 8, 'Cavity Filling', '2024-12-20', '14:00:00', 'Set Request', '2024-12-18 13:42:51', NULL, NULL, '', NULL, 0.00),
(7, 17, 'Toothache', '2024-12-20', '14:00:00', 'Set Request', '2024-12-18 16:00:48', NULL, NULL, '', NULL, 0.00),
(10, 11, 'Check-up', '2025-01-15', '15:00:00', 'Set Request', '2024-12-18 16:30:29', NULL, NULL, '', NULL, 0.00),
(11, 49, 'Check-up', '2024-12-20', '14:00:00', 'Set Request', '2024-12-19 15:58:45', NULL, NULL, '', NULL, 0.00),
(12, 17, 'Check-up', '2025-01-01', '10:00:00', 'Set Request', '2024-12-19 16:19:48', NULL, NULL, '', NULL, 0.00),
(13, 10, 'Cavity Filling', '2025-01-02', '11:00:00', 'Set Request', '2024-12-19 16:31:53', NULL, NULL, '', NULL, 0.00),
(14, 10, 'Cavity Filling', '2025-01-02', '11:00:00', 'Set Request', '2024-12-19 16:32:19', NULL, NULL, '', NULL, 0.00),
(15, 17, 'Whitening', '2024-12-24', '14:00:00', 'Approved', '2024-12-19 16:42:58', NULL, NULL, '', NULL, 0.00),
(16, 17, 'Check-up', '2024-12-24', '15:00:00', 'Approved', '2024-12-19 16:43:08', NULL, NULL, '', NULL, 0.00),
(17, 23, 'Check-up', '2024-12-21', '14:00:00', 'Approved', '2024-12-19 16:53:21', NULL, NULL, '', NULL, 0.00),
(18, 23, 'Toothache', '2024-12-20', '12:00:00', 'Approved', '2024-12-19 16:53:33', NULL, NULL, '', NULL, 0.00),
(19, 10, 'Cavity Filling', '2025-01-07', '13:00:00', 'Set Request', '2025-01-06 00:23:41', NULL, NULL, '', NULL, 0.00),
(20, 6, 'Check-up', '2025-01-10', '09:00:00', 'Approved', '2025-01-06 11:01:47', NULL, NULL, '', NULL, 0.00),
(21, 7, 'Check-up', '2025-01-09', '08:00:00', 'Set Request', '2025-01-08 12:07:45', NULL, NULL, '', NULL, 0.00),
(22, 7, 'Check-up', '2025-02-06', '16:00:00', 'Set Request', '2025-01-08 12:09:01', NULL, NULL, '', NULL, 0.00),
(23, 7, 'Whitening', '2025-01-24', '11:00:00', 'Approved', '2025-01-23 05:35:34', NULL, NULL, '', NULL, 0.00),
(24, 7, 'Check-up', '2025-01-25', '12:00:00', 'Set Request', '2025-01-23 05:57:46', NULL, NULL, '', NULL, 0.00),
(25, 7, 'Check-up', '2025-01-31', '08:00:00', 'Set Request', '2025-01-23 07:16:00', NULL, NULL, '', NULL, 0.00),
(26, 7, 'Check-up', '2025-01-31', '17:00:00', 'Set Request', '2025-01-23 07:22:30', NULL, 'uploads/payments/image.png', '', NULL, 0.00),
(27, 17, 'Check-up', '2025-01-30', '16:00:00', 'Set Request', '2025-01-29 10:31:35', NULL, 'uploads/payments/migga.jpg', '', NULL, 0.00),
(29, 17, 'Cavity Filling', '2025-01-31', '10:00:00', 'Approved', '2025-01-30 15:22:22', NULL, NULL, 'Snow  White', 'try', 0.00),
(30, 17, 'Cleaning', '2025-02-03', '08:00:00', 'Approved', '2025-01-30 15:26:58', NULL, NULL, 'Snow  White', 'test', 0.00);

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
(1, 'Carl Adrian Cabral', 'carladriancabral1@gmail.com', 'hey there', '123', '2024-12-16 09:07:46'),
(2, 'Carl Adrian Cabral', 'carladriancabral1@gmail.com', 'hey there', '123', '2024-12-16 09:15:21'),
(3, 'Carl Adrian Cabral', 'carladriancabral1@gmail.com', 'hey there', 'dddfasdfasdfasdf', '2024-12-16 09:15:34'),
(4, 'lay brawn', 'king@mail.com', 'asdlasdjk', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris.\r\n', '2024-12-16 09:17:17');

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
(1, 'dentist', 'djfnb', 'skdjfk', 'jdsfjd', 'Male', '2025-01-30', 'ikjkjk@gmail.com', '09477686482', 2, '277634', 'orthodontist', 'nothing'),
(3, 'dentist11', 'dentist', 'nice', 'trillo', 'Male', '2025-01-06', 'teeth@mail.com', '09293305078', 27, '1231231263', 'orthodontics', '09293305078');

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
(2, 'LeBron', 'hayme', 'James', '2004-12-06', '09194503018', 'male', 'carladriancabral1@gmail.com', '+02-88-8', '$2y$10$UgjWR83o1CMylh94yRka3.qe/zgr0k4WZHWR2k1LTdU8iXIhi6NAq', '03', 'BULACAN', 'SAN JOSE DEL MONTE CITY', 'FRANCISCO HOMES-GUIJO', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Carl', 'Atag', 'Cabral', '2004-12-06', '09194503018', 'male', 'carladriancabral1@gmail.com', '09194503', '$2y$10$r258hWeap.3n/x7sefe5AOpsmN/wNxsSDeuylEuQhO..SEf8/vGzS', '03', 'BULACAN', 'SAN JOSE DEL MONTE CITY', 'FRANCISCO HOMES-GUIJO', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Carl', 'Atag', 'Cabral', '2004-12-06', '09194503018', 'male', 'carladriancabral1@gmail.com', '09194503', '$2y$10$8Rs35NwPqeIjcvopbCb7cubsMBbVcoUrKy8JIkycsyF/wH5Ce6kNe', '03', 'BULACAN', 'SAN JOSE DEL MONTE CITY', 'FRANCISCO HOMES-GUIJO', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Sissy', 'Leal', 'Briones', '2024-12-14', '123123123', 'female', 'yeahyeah@gmail.com', '+87000', '$2y$10$GXSemXE3dsX3RaH8PJ7Or.gOsbYw2aEAgK2tZA8DuKpaCLezvvn3.', '10', 'BUKIDNON', 'LIBONA', 'SANTA FE', NULL, 'sissy', NULL, NULL, NULL, NULL, NULL),
(15, 'Alden', NULL, 'Recharge', '2024-12-15', '956548987', 'male', 'aldub@gmail.com', '98456516', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Maine', NULL, 'Cyberpunk', '2024-12-02', '95462186', 'male', 'maine@gmail.com', '45613215', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Stephen', NULL, 'Theline', '2024-02-14', '56542132156', 'male', 'three@gmail.com', '1295447', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Mark ', NULL, 'Borromeo', '2024-03-21', '95462145670', 'male', 'imissyou@gmail.com', '685175', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'David', NULL, 'Martinez', '2024-07-25', '09293305077', 'male', 'dead@gmail.com', '9546287', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Adam', NULL, 'Smasher', '2019-02-27', '65731945683', 'male', 'tarantado@gmail.com', '9543168', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'hash', NULL, 'brown', '2024-07-25', '56134897510', 'female', '123@hotline.com', '4631587', '$2y$10$vP7lg/LCqCC0Xf8w0bU2OezwU1XYllNW6gpl9EIBomUgmMuKvG8d2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'hash', NULL, 'brown', '2024-07-25', '56134897510', 'female', '123@hotline.com', '4631587', '$2y$10$..BelU5AiGvkm6i53JehrO2O4EmGsr8m3/zr4maQSvxyBMLRFA6L6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'last', NULL, 'patient', '2024-01-01', '09158561321', 'female', 'hey@gmail.com', '6519735', '$2y$10$23dWQ385dGqevy9xMjcB5ehNaB.R2rwXuIgRNro52uoYF5DmEbGzK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'user', NULL, 'name', '2024-12-15', '09456135846', 'male', 'user@gmail.com', '6549815', '$2y$10$zgcnusz7Ka9fROskPGQMD.jDAxwE6VVptbkfCnAb5UEfCDokscIs6', NULL, NULL, NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL),
(26, 'traverse', NULL, 'scott', '2024-12-16', '09456231547', 'female', 'itslit@yeah.com', '5613487', '$2y$10$XJW6CNYEEJfQaa93MQ2Cnum9gHsIgJdAjqaHv2aAQ16L.Fxp9rZBu', NULL, NULL, NULL, NULL, NULL, 'yessir', NULL, NULL, NULL, NULL, NULL),
(28, 'pasyente', NULL, 'ako', '2024-12-16', '09164532648', 'female', 'helpme@gmail.com', '4315689', '$2y$10$bzMvQEklMyMSHbFwJtr25.E.W04qWo4QaDuSsxPMMv7m.ORHoN7TC', '11', 'COMPOSTELA VALLEY', 'COMPOSTELA', 'SAN MIGUEL', NULL, 'pasyente', NULL, NULL, NULL, NULL, NULL),
(29, 'pasyente', NULL, 'ako', '2024-12-16', '09164532648', 'female', 'helpme@gmail.com', '4315689', '$2y$10$L1rSWk63MWyVu896AHVFz.0.dpy.LMl/OJxpLph0wavqh3p1IxmcK', '11', 'COMPOSTELA VALLEY', 'COMPOSTELA', 'SAN MIGUEL', NULL, 'pasyente', NULL, NULL, NULL, NULL, NULL),
(31, 'last', NULL, 'na', '2024-12-11', '09157643215', 'male', 'no@no.com', '4631567', '$2y$10$yVI2cntZ/ZAZIvT2P1qKqejDaxNmuRmg0n7yLtpBJTPnfbtwz.uCS', 'CAR', 'KALINGA', 'PINUKPUK', 'MALAGNAT', 6, 'try', NULL, NULL, NULL, NULL, NULL),
(34, 'adad', NULL, 'patient', '2024-12-16', '09451326048', 'female', 'world@mail.com', '4561278', '$2y$10$fgl8R5Bju5KG9DIuOmgTdeWGc2ZtJzLynipnNYFd6Q0e5bxw27GzK', NULL, NULL, NULL, NULL, 12, 'world', NULL, NULL, NULL, NULL, NULL),
(35, 'Von Cedric', NULL, 'Rañola', '2024-12-17', '123', 'male', 'voncedric@example.com', '123', '$2y$10$bIlzVybU99yT1w/VkxqO3OoGTeOYQ6WnD3uQoXQspbeoY0DrCPLH.', 'NCR', 'TAGUIG - PATEROS', 'TAGUIG', 'SAN MIGUEL', 13, 'voncedric', NULL, NULL, NULL, NULL, NULL),
(36, 'carl', NULL, 'pogi', '2024-12-17', '09456123456', 'female', 'heyhey@mail.com', '6546547', '$2y$10$BWTchV50HGJFnzYhLHOns.5yke8N8ksYzdYb08sGOsoUJGgfQRQGK', 'CAR', 'KALINGA', 'RIZAL (LIWAN)', 'SAN PASCUAL', 14, 'von', NULL, NULL, NULL, NULL, NULL),
(37, 'shiva', NULL, 'pogi', '2024-12-17', '65465465478', 'female', 'askj@mail.com', '4564564', '$2y$10$vqBpqw5JjhHAM3sCU5xRceNaO/.IF67ej2sGJogFDYRY9/RusSiHi', NULL, NULL, NULL, NULL, 15, 'shiva', NULL, NULL, NULL, NULL, NULL),
(38, 'Carlos', NULL, 'Adriano', '2024-12-18', '09451623548', 'male', 'test@gmail.com', '5613794', '$2y$10$bleU2rFXwoTC2BOSVvO6ZOvc2HaMMuulYziwbhWeOWSWMW6Nf2Sbi', 'CAR', 'MOUNTAIN PROVINCE', 'SAGADA', 'TETEPAN NORTE', 16, 'adriano', NULL, NULL, NULL, NULL, NULL),
(39, 'Snow ', NULL, 'White', '2024-12-13', '09451326485', 'female', 'pretty@gmail.com', '0945132', '$2y$10$k4QEE8E2V5OkIT0.bow.u.PlV62qMC6cAptQXqBoxEyIN41n6t5Hi', 'CAR', 'MOUNTAIN PROVINCE', 'TADIAN', 'SUMADEL', 17, 'snow', NULL, NULL, NULL, NULL, NULL),
(43, 'Sydney', NULL, 'Sweeney', '2024-12-19', '09451638452', 'female', 'sydney@mail.com', '5946531', '$2y$10$BoRHDwSsVt4k00CZ4.AEWu3BrvHRNrjJUhLEtUoT8l9ecF72RTQTy', '10', 'CAMIGUIN', 'CATARMAN', 'TANGARO', 21, 'hawt', 5.25, 55, 'Not Sure', NULL, NULL),
(44, 'Ana', NULL, 'De Armas', '2024-12-19', '09461378451', 'female', 'dang@gmail.com', '6497234', '$2y$10$4Vn7Zy.q1vCHIvfT/MVePeCK1T3nXFkAw3Pq/jEc4rnh3XJDeVrx2', NULL, NULL, NULL, NULL, 22, 'hot', 5.33333, 54, 'A-', NULL, NULL),
(45, 'Bella', NULL, 'Thorne', '2024-12-20', '09456814953', 'female', 'lang@gmail.com', '9465138', '$2y$10$pYdL.IICkhOCigTcSzx3jOZWC93ssAqRuP319om31QXHBbCkuUyr.', 'CAR', 'KALINGA', 'TANUDAN', 'UPPER LUBO', 23, 'bella', 5.5, 49, 'O+', NULL, NULL),
(47, 'sasasa', NULL, 'sasasa', '2025-01-10', '09776646733', 'male', 'dijskn@gmail.com', '123123', '$2y$10$9IMNuVlaNOBX03imn1n0t./PcKb7SL8FDucznKzpGApHeP.XQFJ36', 'NCR', 'NATIONAL CAPITAL REGION - THIRD DISTRICT', 'CALOOCAN CITY', 'BARANGAY 18', 25, 'kwanyawa', 5.91667, 84, 'B+', NULL, NULL),
(48, 'gema', NULL, 'adona', '2003-02-15', '08665476532', 'female', 'gema@gmail.com', '477583', '$2y$10$QhgAF99r.K0l2pUGhFEyMOZZFUwLQ1//nDp9KJSWKaUZ3GxRTZWxi', 'NCR', 'NATIONAL CAPITAL REGION - THIRD DISTRICT', 'CALOOCAN CITY', 'BARANGAY 15', 30, 'gemarose', 5.5, 55, 'AB+', NULL, NULL),
(49, 'Samantha', 'Angeles', 'Carino', '2006-10-21', '09776548731', 'female', 'sam@gmail.com', '1663834', '$2y$10$BlwtoXmAEX2ZUBe2Ga./Y.4g0RJoWPBs0pm9Y3eiWgZzodhbojRw6', 'NCR', 'NATIONAL CAPITAL REGION - THIRD DISTRICT', 'CALOOCAN CITY', 'BARANGAY 180', 31, 'samsam@gmail.com', 5.5, 50, 'AB+', NULL, NULL),
(50, 'Peter', 'low', 'Parker', '2025-01-29', '09154816532', 'Male', 'peter@mail.com', '5445846', '$2y$10$ETTHXfSaHV9BxDPGjICeuu4fQb43WGeVMVluMnuMIGnyjWgJOxS0u', '09', 'ZAMBOANGA DEL SUR', 'MOLAVE', 'MALOLOY-ON (POB.)', 32, 'spiderman', 5.5, 75, 'O+', NULL, NULL),
(51, 'miles', 'yeah', 'morales', '2025-02-03', '09154286184', 'male', 'miles@mail.com', '5917845', '$2y$10$KGId2KmTSWtM7nv.estr1O7oz8CtAnI8Ag8BBGPIHNA2hSxlF/Q3q', 'ARMM', 'LANAO DEL SUR', 'LUMBATAN', 'MADAYA', 33, 'miles', 5.66667, 72, 'O+', NULL, NULL);

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
(1, 'admin1', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'admin', '2024-12-12 23:06:54', 'carladriancabral1@gmail.com'),
(2, 'dentist', '123', 'dentist', '2024-12-13 18:57:58', 'carladriancabral1@gmail.com'),
(6, 'try', '$2y$10$yVI2cntZ/ZAZIvT2P1qKqejDaxNmuRmg0n7yLtpBJTPnfbtwz.uCS', 'patient', '2024-12-16 09:42:25', 'no@no.com'),
(7, 'patient', '$2y$10$ZgwNd/ZOAnXOOCi.Qa4ueefczI.bUqfGcJ0tSNAxKtdgMdh2mNRoi', 'patient', '2024-12-16 09:45:42', 'tryagain@gmail.com'),
(8, 'testing', '$2y$10$mWman90raKL.kWQK8UD7KO3sQJAoZpqrL6p/2024ehKusT6XDnYSC', 'patient', '2024-12-16 12:58:02', 'asdasdas@gmail.com'),
(9, 'dentist1', '123', 'dentist', '2024-12-16 13:00:25', 'dentist@mail.com'),
(10, 'dentits', '$2y$10$xTGeitrlk1corUZHv0aqCeJPevvBbqe5EcXzFm9LqIjt4SryH/dvi', 'dentist', '2024-12-16 13:13:46', 'dennistrillo@gmail.com'),
(11, 'yadmin', '$2y$10$9da3sH/vj1Fj8CVcAWS/AekxJVs2yEBjdPiZjL0EEeevDeT0QzTda', 'admin', '2024-12-16 15:36:08', 'carL@gmail.com'),
(12, 'world', '$2y$10$fgl8R5Bju5KG9DIuOmgTdeWGc2ZtJzLynipnNYFd6Q0e5bxw27GzK', 'patient', '2024-12-16 15:50:00', 'world@mail.com'),
(13, 'voncedric', '$2y$10$bIlzVybU99yT1w/VkxqO3OoGTeOYQ6WnD3uQoXQspbeoY0DrCPLH.', 'patient', '2024-12-16 16:14:43', 'voncedric@example.com'),
(14, 'von', '$2y$10$BWTchV50HGJFnzYhLHOns.5yke8N8ksYzdYb08sGOsoUJGgfQRQGK', 'patient', '2024-12-17 01:37:04', 'heyhey@mail.com'),
(15, 'shiva', '$2y$10$vqBpqw5JjhHAM3sCU5xRceNaO/.IF67ej2sGJogFDYRY9/RusSiHi', 'patient', '2024-12-17 01:39:13', 'askj@mail.com'),
(16, 'adriano', '$2y$10$bleU2rFXwoTC2BOSVvO6ZOvc2HaMMuulYziwbhWeOWSWMW6Nf2Sbi', 'patient', '2024-12-18 15:43:44', 'test@gmail.com'),
(17, 'snow', '$2y$10$k4QEE8E2V5OkIT0.bow.u.PlV62qMC6cAptQXqBoxEyIN41n6t5Hi', 'patient', '2024-12-18 15:51:07', 'pretty@gmail.com'),
(20, '', '123', 'patient', '2024-12-18 15:58:35', 'pretty@gmail.com'),
(21, 'hawt', '$2y$10$BoRHDwSsVt4k00CZ4.AEWu3BrvHRNrjJUhLEtUoT8l9ecF72RTQTy', 'patient', '2024-12-18 19:54:11', 'sydney@mail.com'),
(22, 'hot', '$2y$10$4Vn7Zy.q1vCHIvfT/MVePeCK1T3nXFkAw3Pq/jEc4rnh3XJDeVrx2', 'patient', '2024-12-18 19:59:52', 'dang@gmail.com'),
(23, 'bella', '$2y$10$pYdL.IICkhOCigTcSzx3jOZWC93ssAqRuP319om31QXHBbCkuUyr.', 'patient', '2024-12-19 16:51:54', 'lang@gmail.com'),
(25, 'kwanyawa', '$2y$10$9IMNuVlaNOBX03imn1n0t./PcKb7SL8FDucznKzpGApHeP.XQFJ36', 'patient', '2025-01-05 12:23:15', 'dijskn@gmail.com'),
(26, 'lolokaba?', '$2y$10$0ewmL.uUdvI0V4dANwHdieXhJ3mNcdr9ZUYj1jW/bPzs0W9Ati0LS', 'admin', '2025-01-05 12:27:36', 'lokaloko@gmail.com'),
(27, 'dentist11', '$2y$10$KGg.suYYG5m7s366NGIOK.TsEcE4S.2/AVq3NL4tjqYupI2aQ/8mW', 'dentist', '2025-01-05 23:43:07', 'teeth@mail.com'),
(28, 'admin111', '$2y$10$p3Llt6oT2LZzWyrHNnSRrenILtKYVKaneAfuQBntinv0pidHaw8h2', 'admin', '2025-01-05 23:44:35', 'ash@mail.com'),
(29, 'trynaten', '$2y$10$UWxVjsVvbnOztu83lYdeZuU.hUMcJvXbSIJDBgMKJ9nn0sW.SbAuO', 'admin', '2025-01-06 10:55:44', 'magda69@gmail.com'),
(30, 'gemarose', '$2y$10$QhgAF99r.K0l2pUGhFEyMOZZFUwLQ1//nDp9KJSWKaUZ3GxRTZWxi', 'patient', '2025-01-06 11:13:46', 'gema@gmail.com'),
(31, 'samsam@gmail.com', '$2y$10$BlwtoXmAEX2ZUBe2Ga./Y.4g0RJoWPBs0pm9Y3eiWgZzodhbojRw6', 'patient', '2025-01-06 11:32:09', 'sam@gmail.com'),
(32, 'spiderman', '$2y$10$ETTHXfSaHV9BxDPGjICeuu4fQb43WGeVMVluMnuMIGnyjWgJOxS0u', 'patient', '2025-02-06 09:26:52', 'peter@mail.com'),
(33, 'miles', '$2y$10$KGId2KmTSWtM7nv.estr1O7oz8CtAnI8Ag8BBGPIHNA2hSxlF/Q3q', 'patient', '2025-02-06 09:33:17', 'miles@mail.com');

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
