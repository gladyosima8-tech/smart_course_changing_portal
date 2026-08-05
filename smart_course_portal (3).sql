-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2026 at 02:16 PM
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
-- Database: `smart_course_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(200) NOT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`id`, `user_id`, `action`, `table_name`, `record_id`, `details`, `ip_address`, `created_at`) VALUES
(1, NULL, 'system_ready', NULL, NULL, 'Login module CSRF and audit logging enabled', '127.0.0.1', '2026-06-15 02:48:39'),
(2, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP ::1', '::1', '2026-06-15 03:21:46'),
(3, 1, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-15 03:39:01'),
(4, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP ::1', '::1', '2026-06-15 03:39:14'),
(5, 1, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-15 03:39:24'),
(6, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: admin@portal.ac.tz from IP ::1', '::1', '2026-06-15 03:39:33'),
(7, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP ::1', '::1', '2026-06-15 03:41:55'),
(8, 1, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-15 03:42:26'),
(9, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP ::1', '::1', '2026-06-15 03:46:54'),
(10, 1, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-15 04:29:36'),
(11, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP ::1', '::1', '2026-06-15 04:31:06'),
(12, 1, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-15 04:55:42'),
(13, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP ::1', '::1', '2026-06-15 05:11:14'),
(14, 1, 'course_added', NULL, NULL, 'Added new course: ITU08212 - Bachelor in Information Technology', '::1', '2026-06-15 05:34:08'),
(15, 1, 'course_updated', NULL, NULL, 'Updated course: ITU08212 - Bachelor in Information Technology', '::1', '2026-06-15 05:34:31'),
(16, 1, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-15 05:36:30'),
(17, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP ::1', '::1', '2026-06-15 05:36:37'),
(18, 1, 'user_added', NULL, NULL, 'Added new user: John A. John (student)', '::1', '2026-06-15 05:42:07'),
(19, 1, 'user_deleted', NULL, NULL, 'Deleted user: John A. John', '::1', '2026-06-15 05:42:39'),
(20, 1, 'user_added', NULL, NULL, 'Added new user: John A. John (student)', '::1', '2026-06-15 05:42:40'),
(21, 1, 'user_deleted', NULL, NULL, 'Deleted user: John A. John', '::1', '2026-06-15 05:43:04'),
(22, 1, 'user_added', NULL, NULL, 'Added new user: John A. John (student)', '::1', '2026-06-15 05:43:05'),
(23, 1, 'user_updated', NULL, NULL, 'Updated user: John A. John', '::1', '2026-06-15 05:48:33'),
(24, 1, 'user_updated', NULL, NULL, 'Updated user: John A. John', '::1', '2026-06-15 05:48:35'),
(25, 1, 'user_deleted', NULL, NULL, 'Deleted user ID: 6', '::1', '2026-06-15 05:48:43'),
(26, 1, 'user_deleted', NULL, NULL, 'Deleted user ID: 6', '::1', '2026-06-15 05:48:48'),
(27, 1, 'user_added', NULL, NULL, 'Added new user: Hussein Abdulrahman (student)', '::1', '2026-06-15 05:49:48'),
(28, 1, 'user_updated', NULL, NULL, 'Updated user: Hussein Abdulrahman', '::1', '2026-06-15 05:50:08'),
(29, 1, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-15 05:50:15'),
(30, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: admin@portal.ac.tz from IP ::1', '::1', '2026-06-15 05:50:53'),
(31, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: admin@portal.ac.tz from IP ::1', '::1', '2026-06-15 05:58:07'),
(32, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: admin@portal.ac.tz from IP ::1', '::1', '2026-06-15 06:00:23'),
(33, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP ::1', '::1', '2026-06-15 06:00:31'),
(34, 1, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-15 06:00:37'),
(35, 2, 'login_success', NULL, NULL, 'User Dr. James Makwela logged in from IP ::1', '::1', '2026-06-15 06:02:19'),
(36, 2, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-15 06:07:31'),
(37, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP ::1', '::1', '2026-06-15 06:07:41'),
(38, 1, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-15 06:07:49'),
(39, 2, 'login_success', NULL, NULL, 'User Dr. James Makwela logged in from IP ::1', '::1', '2026-06-15 06:07:58'),
(40, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP ::1', '::1', '2026-06-21 23:36:18'),
(41, 1, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-21 23:37:47'),
(42, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: hod@portal.ac.tz from IP ::1', '::1', '2026-06-21 23:37:56'),
(43, 2, 'login_success', NULL, NULL, 'User Dr. James Makwela logged in from IP ::1', '::1', '2026-06-21 23:38:03'),
(44, 2, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-21 23:38:41'),
(45, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: S.1314/0020/2020 from IP ::1', '::1', '2026-06-21 23:40:25'),
(46, 2, 'login_success', NULL, NULL, 'User Dr. James Makwela logged in from IP ::1', '::1', '2026-06-23 04:27:32'),
(47, 2, 'profile_updated', NULL, NULL, 'HOD updated profile: GLADNESS SIMON', '::1', '2026-06-23 04:57:48'),
(48, 2, 'profile_updated', NULL, NULL, 'HOD updated profile: GLADNESS SIMON', '::1', '2026-06-23 04:59:05'),
(49, 2, 'profile_updated', NULL, NULL, 'HOD updated profile: GLADNESS SIMON', '::1', '2026-06-23 05:47:33'),
(50, 2, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-23 05:50:51'),
(51, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: S.0001/0001/2023 from IP ::1', '::1', '2026-06-23 05:57:16'),
(52, 3, 'login_success', NULL, NULL, 'User Gladness Mwanga logged in from IP ::1', '::1', '2026-06-23 06:13:16'),
(53, 3, 'profile_updated', NULL, NULL, 'Student updated profile: Gladness Mwanga Osima', '::1', '2026-06-23 06:50:32'),
(54, 3, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-23 06:50:43'),
(55, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: S.1414/0060/2022 from IP ::1', '::1', '2026-06-23 06:51:14'),
(56, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: S.1414/0060/2022 from IP ::1', '::1', '2026-06-23 06:53:05'),
(57, 3, 'login_success', NULL, NULL, 'User Gladness Mwanga Osima logged in from IP ::1', '::1', '2026-06-23 06:53:37'),
(58, 3, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-23 06:54:32'),
(59, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: hod@portal.ac.tz from IP ::1', '::1', '2026-06-23 06:54:42'),
(60, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: hod@portal.ac.tz from IP ::1', '::1', '2026-06-23 06:54:49'),
(61, 2, 'login_success', NULL, NULL, 'User GLADNESS SIMON logged in from IP ::1', '::1', '2026-06-23 06:55:25'),
(62, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP ::1', '::1', '2026-06-30 22:17:04'),
(63, 1, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-30 22:17:23'),
(64, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: hod@portal.ac.tz from IP ::1', '::1', '2026-06-30 22:17:38'),
(65, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: hod@portal.ac.tz from IP ::1', '::1', '2026-06-30 22:17:45'),
(66, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: hod@portal.ac.tz from IP ::1', '::1', '2026-06-30 22:18:13'),
(67, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: gladysimon@gmail.com from IP ::1', '::1', '2026-06-30 22:18:30'),
(68, 2, 'login_success', NULL, NULL, 'User GLADNESS SIMON logged in from IP ::1', '::1', '2026-06-30 22:18:38'),
(69, 2, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-30 22:19:00'),
(70, 3, 'login_success', NULL, NULL, 'User Gladness Mwanga Osima logged in from IP ::1', '::1', '2026-06-30 22:19:13'),
(71, 3, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-30 22:19:36'),
(72, 2, 'login_success', NULL, NULL, 'User GLADNESS SIMON logged in from IP ::1', '::1', '2026-06-30 22:31:13'),
(73, 2, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-30 22:31:17'),
(74, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP ::1', '::1', '2026-06-30 22:31:24'),
(75, 1, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-30 22:32:01'),
(76, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP ::1', '::1', '2026-06-30 22:42:54'),
(77, 1, 'logout', NULL, NULL, 'User logged out', '::1', '2026-06-30 22:43:16'),
(78, 3, 'login_success', NULL, NULL, 'User Gladness Mwanga Osima logged in from IP ::1', '::1', '2026-06-30 22:43:27'),
(79, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: mourine@gmail.com from IP 127.0.0.1', '127.0.0.1', '2026-07-08 22:50:59'),
(80, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: admin@gmail.com from IP 127.0.0.1', '127.0.0.1', '2026-07-08 22:52:12'),
(81, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: admin@gmail.com from IP 127.0.0.1', '127.0.0.1', '2026-07-08 22:52:17'),
(82, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: admin@gmail.com from IP 127.0.0.1', '127.0.0.1', '2026-07-08 22:52:18'),
(83, 2, 'login_success', NULL, NULL, 'User GLADNESS SIMON logged in from IP 127.0.0.1', '127.0.0.1', '2026-07-08 22:52:58'),
(84, 2, 'logout', NULL, NULL, 'User logged out', '127.0.0.1', '2026-07-08 22:53:21'),
(85, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: admin@gmail.com from IP 127.0.0.1', '127.0.0.1', '2026-07-08 22:53:38'),
(86, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: admin@gmail.com from IP 127.0.0.1', '127.0.0.1', '2026-07-08 22:53:48'),
(87, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: admin@gmail.com from IP 127.0.0.1', '127.0.0.1', '2026-07-08 22:54:18'),
(88, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: admin@gmail.com from IP 127.0.0.1', '127.0.0.1', '2026-07-08 22:54:35'),
(89, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: admin@gmail.com from IP 127.0.0.1', '127.0.0.1', '2026-07-08 22:54:43'),
(90, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP 127.0.0.1', '127.0.0.1', '2026-07-08 22:56:33'),
(91, 1, 'logout', NULL, NULL, 'User logged out', '127.0.0.1', '2026-07-08 23:00:18'),
(92, 7, 'login_success', NULL, NULL, 'User Hussein Abdulrahman logged in from IP 127.0.0.1', '127.0.0.1', '2026-07-08 23:15:00'),
(93, 7, 'logout', NULL, NULL, 'User logged out', '127.0.0.1', '2026-07-09 00:09:59'),
(94, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP 127.0.0.1', '127.0.0.1', '2026-07-09 00:10:45'),
(95, 1, 'logout', NULL, NULL, 'User logged out', '127.0.0.1', '2026-07-09 00:11:54'),
(96, 7, 'login_success', NULL, NULL, 'User Hussein Abdulrahman logged in from IP 127.0.0.1', '127.0.0.1', '2026-07-09 00:23:53'),
(97, 7, 'program_swap_request', NULL, NULL, 'Student requested program change from Computer Science to Business', '127.0.0.1', '2026-07-09 00:53:06'),
(98, 7, 'logout', NULL, NULL, 'User logged out', '127.0.0.1', '2026-07-09 01:01:14'),
(99, 3, 'login_success', NULL, NULL, 'User Gladness Mwanga Osima logged in from IP 127.0.0.1', '127.0.0.1', '2026-07-09 01:01:28'),
(100, 3, 'logout', NULL, NULL, 'User logged out', '127.0.0.1', '2026-07-09 01:39:02'),
(101, NULL, 'login_failed', NULL, NULL, 'Failed login attempt for: gladysimon@gmail.com from IP 127.0.0.1', '127.0.0.1', '2026-07-09 01:39:39'),
(102, 2, 'login_success', NULL, NULL, 'User GLADNESS SIMON logged in from IP 127.0.0.1', '127.0.0.1', '2026-07-09 01:39:47'),
(103, 2, 'hod_approved_program_change', NULL, NULL, 'HOD approved program change request #1 for student Hussein Abdulrahman from Computer Science to Business', '127.0.0.1', '2026-07-09 01:53:21'),
(104, 2, 'logout', NULL, NULL, 'User logged out', '127.0.0.1', '2026-07-09 02:02:17'),
(105, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP 127.0.0.1', '127.0.0.1', '2026-07-09 02:02:37'),
(106, 1, 'admin_approved_program_change', NULL, NULL, 'Admin approved program change request #1 for Hussein Abdulrahman from Computer Science to Business', '127.0.0.1', '2026-07-09 02:13:23'),
(107, 1, 'program_updated', NULL, NULL, 'Updated program: MSC-FIN-BANK - Master of Science in Finance and Banking', '127.0.0.1', '2026-07-09 02:18:22'),
(108, 1, 'logout', NULL, NULL, 'User logged out', '127.0.0.1', '2026-07-09 02:19:10'),
(109, 3, 'login_success', NULL, NULL, 'User Gladness Mwanga Osima logged in from IP 127.0.0.1', '127.0.0.1', '2026-07-09 02:19:45'),
(110, 3, 'logout', NULL, NULL, 'User logged out', '127.0.0.1', '2026-07-09 02:31:14'),
(111, 3, 'login_success', NULL, NULL, 'User Gladness Mwanga Osima logged in from IP 127.0.0.1', '127.0.0.1', '2026-07-09 02:31:18'),
(112, 3, 'logout', NULL, NULL, 'User logged out', '127.0.0.1', '2026-07-09 02:33:29'),
(113, 3, 'login_success', NULL, NULL, 'User Gladness Mwanga Osima logged in from IP 127.0.0.1', '127.0.0.1', '2026-07-09 02:33:34'),
(114, 3, 'program_swap_request', NULL, NULL, 'Student requested program change from Information Technology to Bachelor Degree in Computer Science', '127.0.0.1', '2026-07-09 02:35:04'),
(115, 3, 'logout', NULL, NULL, 'User logged out', '127.0.0.1', '2026-07-09 02:35:19'),
(116, 2, 'login_success', NULL, NULL, 'User GLADNESS SIMON logged in from IP 127.0.0.1', '127.0.0.1', '2026-07-09 02:35:30'),
(117, 2, 'logout', NULL, NULL, 'User logged out', '127.0.0.1', '2026-07-09 02:36:13'),
(118, 1, 'login_success', NULL, NULL, 'User Administrator logged in from IP 127.0.0.1', '127.0.0.1', '2026-07-09 02:36:31'),
(119, 1, 'admin_approved_program_change', NULL, NULL, 'Admin approved program change request #2 for Gladness Mwanga Osima from Information Technology to Bachelor Degree in Computer Science', '127.0.0.1', '2026-07-09 02:37:14'),
(120, 1, 'logout', NULL, NULL, 'User logged out', '127.0.0.1', '2026-07-09 02:37:30'),
(121, 3, 'login_success', NULL, NULL, 'User Gladness Mwanga Osima logged in from IP 127.0.0.1', '127.0.0.1', '2026-07-09 02:37:40'),
(122, 3, 'logout', NULL, NULL, 'User logged out', '127.0.0.1', '2026-07-09 02:56:30');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `department` varchar(100) NOT NULL,
  `level` varchar(50) DEFAULT 'Certificate',
  `credits` tinyint(4) NOT NULL DEFAULT 3,
  `capacity` int(11) NOT NULL DEFAULT 50,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `code`, `name`, `department`, `level`, `credits`, `capacity`, `created_at`) VALUES
(170, 'BTC-ACC', 'Basic Technician Certificate in Accountancy', 'Basic Technician Certificate in Accountancy', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(171, 'BTC-ACC-IT', 'Basic Technician Certificate in Accountancy with IT', 'Basic Technician Certificate in Accountancy with IT', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(172, 'BTC-AGRI', 'Basic Technician Certificate in Agricultural Value Chain Management', 'Basic Technician Certificate in Agricultural Value Chain Management', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(173, 'BTC-BUS', 'Basic Technician Certificate in Business Management', 'Basic Technician Certificate in Business Management', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(174, 'BTC-BUS-CN', 'Basic Technician Certificate in Business Management with Chinese', 'Basic Technician Certificate in Business Management with Chinese', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(175, 'BTC-CFM', 'Basic Technician Certificate in Clearing and Forwarding Management', 'Basic Technician Certificate in Clearing and Forwarding Management', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(176, 'BTC-CN', 'Basic Technician Certificate in Computer Networking', 'Basic Technician Certificate in Computer Networking', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(177, 'BTC-CIT', 'Basic Technician Certificate in Computing and Information Technology', 'Basic Technician Certificate in Computing and Information Technology', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(178, 'BTC-ECON', 'Basic Technician Certificate in Economics and Finance', 'Basic Technician Certificate in Economics and Finance', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(179, 'BTC-FIN', 'Basic Technician Certificate in Finance and Banking', 'Basic Technician Certificate in Finance and Banking', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(180, 'BTC-HR', 'Basic Technician Certificate in Human Resources Management', 'Basic Technician Certificate in Human Resources Management', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(181, 'BTC-INS', 'Basic Technician Certificate in Insurance and Risk Management', 'Basic Technician Certificate in Insurance and Risk Management', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(182, 'BTC-LIB', 'Basic Technician Certificate in Library and Information Studies', 'Basic Technician Certificate in Library and Information Studies', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(183, 'BTC-MKT', 'Basic Technician Certificate in Marketing and Public Relations', 'Basic Technician Certificate in Marketing and Public Relations', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(184, 'BTC-MAD', 'Basic Technician Certificate in Mobile Application Development', 'Basic Technician Certificate in Mobile Application Development', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(185, 'BTC-MM', 'Basic Technician Certificate in Multimedia', 'Basic Technician Certificate in Multimedia', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(186, 'BTC-PSCM', 'Basic Technician Certificate in Procurement and Supply Chain Management', 'Basic Technician Certificate in Procurement and Supply Chain Management', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(187, 'BTC-RIM', 'Basic Technician Certificate in Records and Information Management', 'Basic Technician Certificate in Records and Information Management', 'Basic Technician', 0, 0, '2026-07-09 01:30:17'),
(188, 'OD-AGRI', 'Ordinary Diploma in Agricultural Value Chain Management', 'Ordinary Diploma in Agricultural Value Chain Management', 'Ordinary Diploma', 0, 0, '2026-07-09 01:30:17'),
(189, 'OD-CFM', 'Ordinary Diploma in Clearing and Forwarding Management', 'Ordinary Diploma in Clearing and Forwarding Management', 'Ordinary Diploma', 0, 0, '2026-07-09 01:30:17'),
(190, 'DIP-ACC', 'Diploma in Accountancy', 'Diploma in Accountancy', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(191, 'DIP-ACC-IT', 'Diploma in Accountancy with IT', 'Diploma in Accountancy with IT', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(192, 'DIP-BUS', 'Diploma in Business Management', 'Diploma in Business Management', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(193, 'DIP-BUS-CN', 'Diploma in Business Management with Chinese', 'Diploma in Business Management with Chinese', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(194, 'DIP-CN', 'Diploma in Computer Networking', 'Diploma in Computer Networking', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(195, 'DIP-CS', 'Diploma in Computer Science', 'Diploma in Computer Science', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(196, 'DIP-ECON', 'Diploma in Economics and Finance', 'Diploma in Economics and Finance', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(197, 'DIP-FIN', 'Diploma in Finance and Banking', 'Diploma in Finance and Banking', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(198, 'DIP-HR', 'Diploma in Human Resources Management', 'Diploma in Human Resources Management', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(199, 'DIP-IT', 'Diploma in Information Technology', 'Diploma in Information Technology', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(200, 'DIP-INS', 'Diploma in Insurance and Risk Management', 'Diploma in Insurance and Risk Management', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(201, 'DIP-LIB', 'Diploma in Library and Information Studies', 'Diploma in Library and Information Studies', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(202, 'DIP-MKT', 'Diploma in Marketing & Public Relations', 'Diploma in Marketing & Public Relations', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(203, 'DIP-MAD', 'Diploma in Mobile Applications Development', 'Diploma in Mobile Applications Development', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(204, 'DIP-MM', 'Diploma in Multimedia', 'Diploma in Multimedia', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(205, 'DIP-PSCM', 'Diploma in Procurement and Supply Chain Management', 'Diploma in Procurement and Supply Chain Management', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(206, 'DIP-RIM', 'Diploma in Records and Information Management', 'Diploma in Records and Information Management', 'Diploma', 0, 0, '2026-07-09 01:30:17'),
(207, 'BACC-ACC', 'Bachelor Degree in Accountancy', 'Bachelor Degree in Accountancy', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(208, 'BACC-ACC-FIN', 'Bachelor Degree in Accountancy and Finance', 'Bachelor Degree in Accountancy and Finance', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(209, 'BACC-ACC-IT', 'Bachelor Degree in Accountancy with Information Technology', 'Bachelor Degree in Accountancy with Information Technology', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(210, 'BACC-AUD', 'Bachelor Degree in Auditing and Assurance', 'Bachelor Degree in Auditing and Assurance', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(211, 'BACC-BANK', 'Bachelor Degree in Banking with Apprenticeship', 'Bachelor Degree in Banking with Apprenticeship', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(212, 'BACC-BUS', 'Bachelor Degree in Business Management', 'Bachelor Degree in Business Management', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(213, 'BACC-CN', 'Bachelor Degree in Computer Networks Technologies', 'Bachelor Degree in Computer Networks Technologies', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(214, 'BACC-CS', 'Bachelor Degree in Computer Science', 'Bachelor Degree in Computer Science', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(215, 'BACC-CREDIT', 'Bachelor Degree in Credit Management', 'Bachelor Degree in Credit Management', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(216, 'BACC-CYBER', 'Bachelor Degree in Cyber Security', 'Bachelor Degree in Cyber Security', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(217, 'BACC-ECON-FIN', 'Bachelor Degree in Economics and Finance', 'Bachelor Degree in Economics and Finance', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(218, 'BACC-ECON-PM', 'Bachelor Degree in Economics and Project Management', 'Bachelor Degree in Economics and Project Management', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(219, 'BACC-ECON-TAX', 'Bachelor Degree in Economics and Taxation', 'Bachelor Degree in Economics and Taxation', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(220, 'BACC-EDU-CS', 'Bachelor Degree in Education with Computer Science', 'Bachelor Degree in Education with Computer Science', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(221, 'BACC-FIN-BANK', 'Bachelor Degree in Finance and Banking', 'Bachelor Degree in Finance and Banking', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(222, 'BACC-FIN-INV', 'Bachelor Degree in Finance and Investment', 'Bachelor Degree in Finance and Investment', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(223, 'BACC-HR', 'Bachelor Degree in Human Resources and Management', 'Bachelor Degree in Human Resources and Management', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(224, 'BACC-IT', 'Bachelor Degree in Information Technology', 'Bachelor Degree in Information Technology', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(225, 'BACC-INS', 'Bachelor Degree in Insurance and Risk Management with Apprenticeship', 'Bachelor Degree in Insurance and Risk Management with Apprenticeship', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(226, 'BACC-LIB', 'Bachelor Degree in Library Studies and Information Science', 'Bachelor Degree in Library Studies and Information Science', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(227, 'BACC-MKT', 'Bachelor Degree in Marketing and Public Relations', 'Bachelor Degree in Marketing and Public Relations', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(228, 'BACC-MMC', 'Bachelor Degree in Multimedia and Mass Communication', 'Bachelor Degree in Multimedia and Mass Communication', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(229, 'BACC-NRE', 'Bachelor Degree in Natural Resources Economics', 'Bachelor Degree in Natural Resources Economics', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(230, 'BACC-PSCM', 'Bachelor Degree in Procurement and Supply Chain Management', 'Bachelor Degree in Procurement and Supply Chain Management', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(231, 'BACC-RIM', 'Bachelor Degree in Records and Information Management', 'Bachelor Degree in Records and Information Management', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(232, 'BACC-SEC', 'Bachelor Degree in Security and Strategic Studies', 'Bachelor Degree in Security and Strategic Studies', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(233, 'BACC-THM', 'Bachelor Degree in Tourism and Hospitality Management with Apprenticeship', 'Bachelor Degree in Tourism and Hospitality Management with Apprenticeship', 'Bachelor', 0, 0, '2026-07-09 01:30:17'),
(234, 'MA-ACC', 'Master of Accountancy', 'Master of Accountancy', 'Master', 0, 0, '2026-07-09 01:30:17'),
(235, 'MA-ACC-FIN', 'Master of Accounting and Finance', 'Master of Accounting and Finance', 'Master', 0, 0, '2026-07-09 01:30:17'),
(236, 'MA-PSS', 'Master of Arts in Peace and Security Studies', 'Master of Arts in Peace and Security Studies', 'Master', 0, 0, '2026-07-09 01:30:17'),
(237, 'MBA-CM', 'Master of Business Administration in Corporate Management', 'Master of Business Administration in Corporate Management', 'Master', 0, 0, '2026-07-09 01:30:17'),
(238, 'MBA-ITM', 'Master of Business Administration in Information Technology Management', 'Master of Business Administration in Information Technology Management', 'Master', 0, 0, '2026-07-09 01:30:17'),
(239, 'MBA-LG', 'Master of Business Administration in Leadership and Governance', 'Master of Business Administration in Leadership and Governance', 'Master', 0, 0, '2026-07-09 01:30:17'),
(240, 'MBA-PDE', 'Master of Business Administration in Policy Development and Execution', 'Master of Business Administration in Policy Development and Execution', 'Master', 0, 0, '2026-07-09 01:30:17'),
(241, 'MBA-PSM', 'Master of Business Administration in Procurement and Supply Management', 'Master of Business Administration in Procurement and Supply Management', 'Master', 0, 0, '2026-07-09 01:30:17'),
(242, 'MED', 'Master of Education Management', 'Master of Education Management', 'Master', 0, 0, '2026-07-09 01:30:17'),
(243, 'MFI', 'Master of Finance and Investment', 'Master of Finance and Investment', 'Master', 0, 0, '2026-07-09 01:30:17'),
(244, 'MHR', 'Master of Human Resources Management', 'Master of Human Resources Management', 'Master', 0, 0, '2026-07-09 01:30:17'),
(245, 'MIS', 'Master of Information Security', 'Master of Information Security', 'Master', 0, 0, '2026-07-09 01:30:17'),
(246, 'MPPM', 'Master of Project Planning and Management', 'Master of Project Planning and Management', 'Master', 0, 0, '2026-07-09 01:30:17'),
(247, 'MSC-ECON-FIN', 'Master of Science in Economics and Finance', 'Master of Science in Economics and Finance', 'Master', 0, 0, '2026-07-09 01:30:17'),
(248, 'MSC-FIN-BANK', 'Master of Science in Finance and Banking', 'Master of Science in Finance and Banking', 'Master', 2, 10, '2026-07-09 01:30:17');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `enrolled_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `student_id`, `course_id`, `semester_id`, `enrolled_at`) VALUES
(24, 3, 171, 1, '2026-07-09 02:01:03'),
(25, 3, 174, 1, '2026-07-09 02:01:03'),
(26, 3, 177, 1, '2026-07-09 02:01:03'),
(27, 3, 191, 1, '2026-07-09 02:01:03'),
(28, 3, 193, 1, '2026-07-09 02:01:03'),
(29, 3, 199, 1, '2026-07-09 02:01:03'),
(30, 3, 209, 1, '2026-07-09 02:01:03'),
(31, 3, 210, 1, '2026-07-09 02:01:03'),
(32, 3, 211, 1, '2026-07-09 02:01:03'),
(33, 3, 215, 1, '2026-07-09 02:01:03'),
(34, 3, 216, 1, '2026-07-09 02:01:03'),
(35, 3, 220, 1, '2026-07-09 02:01:03'),
(36, 3, 224, 1, '2026-07-09 02:01:03'),
(37, 3, 225, 1, '2026-07-09 02:01:03'),
(38, 3, 232, 1, '2026-07-09 02:01:03'),
(39, 3, 233, 1, '2026-07-09 02:01:03'),
(40, 3, 236, 1, '2026-07-09 02:01:03'),
(41, 3, 238, 1, '2026-07-09 02:01:03'),
(42, 3, 245, 1, '2026-07-09 02:01:03'),
(55, 7, 195, 1, '2026-07-09 02:01:03'),
(56, 7, 214, 1, '2026-07-09 02:01:03'),
(57, 7, 220, 1, '2026-07-09 02:01:03');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `program_swap_requests`
--

CREATE TABLE `program_swap_requests` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `current_department` varchar(100) NOT NULL,
  `requested_department` varchar(100) NOT NULL,
  `reason` text NOT NULL,
  `status` enum('pending','hod_approved','hod_rejected','approved','rejected') NOT NULL DEFAULT 'pending',
  `hod_comment` text DEFAULT NULL,
  `hod_reviewed_by` int(11) DEFAULT NULL,
  `hod_reviewed_at` datetime DEFAULT NULL,
  `reg_comment` text DEFAULT NULL,
  `reg_reviewed_by` int(11) DEFAULT NULL,
  `reg_reviewed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `program_swap_requests`
--

INSERT INTO `program_swap_requests` (`id`, `student_id`, `current_department`, `requested_department`, `reason`, `status`, `hod_comment`, `hod_reviewed_by`, `hod_reviewed_at`, `reg_comment`, `reg_reviewed_by`, `reg_reviewed_at`, `created_at`, `updated_at`) VALUES
(1, 7, 'Computer Science', 'Business', 'bdhvbdfjb uhvcksd v ufcusd v ufusd', 'approved', 'Approved by HOD', 2, '2026-07-09 01:53:21', 'Approved by Registrar', 1, '2026-07-09 02:13:23', '2026-07-09 00:53:06', '2026-07-09 02:13:23'),
(2, 3, 'Information Technology', 'Bachelor Degree in Computer Science', 'dys gfdsv  gudsvud ucdvudv udhuhdsuh usdu', 'approved', NULL, NULL, NULL, 'Approved by Registrar', 1, '2026-07-09 02:37:14', '2026-07-09 02:35:04', '2026-07-09 02:37:14');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `drop_course_id` int(11) NOT NULL,
  `add_course_id` int(11) NOT NULL,
  `reason` text NOT NULL,
  `note` text DEFAULT NULL,
  `status` enum('pending','hod_approved','hod_rejected','approved','rejected') NOT NULL DEFAULT 'pending',
  `hod_comment` text DEFAULT NULL,
  `hod_reviewed_by` int(11) DEFAULT NULL,
  `hod_reviewed_at` datetime DEFAULT NULL,
  `reg_comment` text DEFAULT NULL,
  `reg_reviewed_by` int(11) DEFAULT NULL,
  `reg_reviewed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `window_open` tinyint(1) NOT NULL DEFAULT 0,
  `is_current` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`id`, `name`, `start_date`, `end_date`, `window_open`, `is_current`, `created_at`) VALUES
(1, 'Semester 1 – 2025/2026', '2025-09-01', '2026-01-31', 1, 1, '2026-06-14 10:20:22'),
(2, 'Semester 2 – 2025/2026', '2026-02-01', '2026-06-30', 0, 0, '2026-06-14 10:20:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `index_number` varchar(30) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('student','hod','admin') NOT NULL DEFAULT 'student',
  `department` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `index_number`, `email`, `password_hash`, `role`, `department`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', NULL, 'admin@portal.ac.tz', '$2a$12$DzNpO.A/Hx2oYB7Av9m/9upbenI2GXh4WHMxMz10VQjSlnJg9I54a', 'admin', 'Registry', 1, '2026-06-14 10:20:21', '2026-06-15 03:10:55'),
(2, 'GLADNESS SIMON', NULL, 'gladysimon@gmail.com', '$2y$10$ZIVWB8va4C6MnT.cRrXpCeoM6hlvk8ZcaOXj3WXjG.dBJp/efwmKG', 'hod', 'Computer Science', 1, '2026-06-14 10:20:21', '2026-06-23 05:47:33'),
(3, 'Gladness Mwanga Osima', 'S.0001/0001/2023', 'gladness@student.ac.tz', '$2a$12$/2Yg50nnGKdBe7qzQW.eUuqal/tu9T73idWiUf98F/8qrn/EkgN.2', 'student', 'Bachelor Degree in Computer Science', 1, '2026-06-14 10:20:21', '2026-07-09 02:37:14'),
(7, 'Hussein Abdulrahman', 'S1918/0063/2019', 'husseinali2334@gmail.com', '$2y$10$ur3d7SBc68Wvi2xpq.TQeO9tSHyhxQ7M0PXpzSrpgC/QHm0WLps0q', 'student', 'Business', 1, '2026-06-15 05:49:48', '2026-07-09 02:13:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_enroll` (`student_id`,`course_id`,`semester_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `semester_id` (`semester_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `program_swap_requests`
--
ALTER TABLE `program_swap_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `hod_reviewed_by` (`hod_reviewed_by`),
  ADD KEY `reg_reviewed_by` (`reg_reviewed_by`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `semester_id` (`semester_id`),
  ADD KEY `drop_course_id` (`drop_course_id`),
  ADD KEY `add_course_id` (`add_course_id`),
  ADD KEY `hod_reviewed_by` (`hod_reviewed_by`),
  ADD KEY `reg_reviewed_by` (`reg_reviewed_by`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `index_number` (`index_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program_swap_requests`
--
ALTER TABLE `program_swap_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `audit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_ibfk_3` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`),
  ADD CONSTRAINT `requests_ibfk_3` FOREIGN KEY (`drop_course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `requests_ibfk_4` FOREIGN KEY (`add_course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `requests_ibfk_5` FOREIGN KEY (`hod_reviewed_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `requests_ibfk_6` FOREIGN KEY (`reg_reviewed_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
