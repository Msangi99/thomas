-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 26, 2026 at 09:58 PM
-- Server version: 11.4.9-MariaDB-cll-lve
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hisgnbki_ticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE `access` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `link` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `access`
--

INSERT INTO `access` (`id`, `user_id`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 44, 'bus-operators', 'inactive', '2025-06-16 09:55:39', '2025-06-16 10:06:00'),
(4, 44, 'bus-schedule', 'active', '2025-06-16 09:57:15', '2025-06-16 09:57:15'),
(6, 44, 'cities', 'active', '2025-06-16 10:06:14', '2025-06-16 10:50:14'),
(7, 44, 'local-admins', 'active', '2025-06-16 10:50:36', '2025-06-16 10:50:36'),
(8, 45, 'bus-operators', 'inactive', '2025-06-16 10:56:26', '2025-06-16 11:47:09'),
(9, 45, 'bus-schedule', 'active', '2025-06-16 10:56:46', '2025-06-16 10:56:46'),
(10, 45, 'buses', 'active', '2025-06-16 11:00:38', '2025-06-16 11:00:38'),
(11, 48, 'bus-operators', 'active', '2025-06-17 18:09:37', '2025-06-17 18:09:37'),
(12, 48, 'bus-schedule', 'active', '2025-06-17 18:09:46', '2025-06-17 18:09:46'),
(13, 48, 'buses', 'active', '2025-06-17 18:09:55', '2025-06-17 18:09:55'),
(14, 48, 'vendors', 'active', '2025-06-17 18:10:04', '2025-06-17 18:10:04'),
(15, 49, 'buses', 'inactive', '2025-06-17 19:53:41', '2025-06-27 19:23:06'),
(16, 49, 'booking-history', 'active', '2025-06-17 19:54:05', '2025-06-17 19:54:05'),
(17, 49, 'bus-schedule', 'active', '2025-06-18 03:47:58', '2025-06-18 03:47:58'),
(18, 49, 'system-income', 'active', '2025-06-22 22:19:27', '2025-06-22 22:19:27'),
(19, 45, 'cards', 'active', '2025-06-24 13:39:22', '2025-06-24 18:56:18'),
(20, 49, 'vendors', 'inactive', '2025-06-27 16:31:27', '2025-06-27 16:34:17'),
(21, 49, 'local-admins', 'inactive', '2025-06-27 16:36:32', '2025-06-27 16:42:16'),
(22, 49, 'cities', 'inactive', '2025-06-27 16:45:50', '2025-06-27 19:23:21'),
(23, 49, 'bus-operators', 'inactive', '2025-06-27 16:45:51', '2025-06-27 16:45:51'),
(24, 49, 'insurance', 'inactive', '2025-06-27 16:47:04', '2025-06-27 19:24:47'),
(25, 49, 'payment-request', 'active', '2025-06-27 16:47:28', '2025-06-27 16:47:28'),
(26, 55, 'buses', 'active', '2025-09-13 17:36:13', '2025-09-13 17:36:13'),
(27, 55, 'cities', 'active', '2025-09-13 17:36:33', '2025-09-13 17:36:33'),
(28, 55, 'index', 'active', '2025-09-13 17:39:44', '2025-09-13 17:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `admin_transactions`
--

CREATE TABLE `admin_transactions` (
  `id` int(11) NOT NULL,
  `trans_ref_id` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_number` int(11) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin_transactions`
--

INSERT INTO `admin_transactions` (`id`, `trans_ref_id`, `amount`, `payment_number`, `payment_method`, `created_at`, `updated_at`) VALUES
(1, '7623487uhdjuw', 1000.00, 773942409, 'Airtel Money', '2025-06-24 08:52:23', '2025-06-24 11:52:23'),
(2, '892384091ijdnnfn', 300.00, 628042409, 'Halopesa', '2025-06-24 08:53:13', '2025-06-24 11:53:13'),
(3, 'qwerty456', 300.00, 789473209, 'Halopesa', '2025-06-24 10:15:58', '2025-06-24 13:15:58'),
(4, '12345', 1000.00, 789473209, 'CRDB', '2025-06-25 12:36:40', '2025-06-25 15:36:40');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet`
--

CREATE TABLE `admin_wallet` (
  `id` int(11) NOT NULL,
  `service_balance` decimal(10,2) DEFAULT 0.00,
  `commision_balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `balance` decimal(10,2) DEFAULT 0.00,
  `vat` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin_wallet`
--

INSERT INTO `admin_wallet` (`id`, `service_balance`, `commision_balance`, `balance`, `vat`, `created_at`, `updated_at`) VALUES
(1, 0.00, 0.00, 28754.88, 157.22, '2025-06-14 08:35:12', '2026-02-26 22:22:11');

-- --------------------------------------------------------

--
-- Table structure for table `balances`
--

CREATE TABLE `balances` (
  `id` int(11) NOT NULL,
  `campany_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL,
  `fees` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `balances`
--

INSERT INTO `balances` (`id`, `campany_id`, `amount`, `created_at`, `updated_at`, `fees`) VALUES
(3, 3, 17521, '2025-04-22 09:03:41', '2026-02-26 22:22:11', 200),
(6, 9, 24000, '2025-04-23 08:21:32', '2025-04-23 12:56:33', 0),
(7, 12, 0, '2025-04-26 11:17:52', '2025-04-26 14:17:52', 0),
(8, 13, 1372, '2025-05-02 10:33:27', '2025-07-22 22:48:46', 0),
(9, 17, 0, '2025-05-04 14:11:28', '2025-05-04 17:11:28', 0),
(10, 18, 0, '2025-05-05 00:52:26', '2025-05-05 03:52:26', 0),
(11, 19, 0, '2025-05-05 01:42:57', '2025-05-05 04:42:57', 0),
(12, 20, 264, '2025-05-05 14:44:44', '2025-06-18 23:40:29', 0),
(13, 23, 0, '2025-05-06 17:03:20', '2025-05-06 20:03:20', 0),
(14, 24, 280, '2025-05-06 18:54:27', '2025-05-06 23:29:48', 0),
(15, 25, 0, '2025-05-10 14:03:21', '2025-05-10 17:03:21', 0),
(16, 26, 0, '2025-05-16 08:11:06', '2025-05-16 11:11:06', 0),
(17, 27, 0, '2025-05-24 19:45:04', '2025-05-24 22:45:04', 0),
(18, 28, 0, '2025-06-17 17:43:28', '2025-06-17 20:43:28', 0),
(19, 29, 0, '2025-06-17 18:03:54', '2025-06-17 21:03:54', 0),
(20, 30, 0, '2025-06-17 20:02:38', '2025-06-17 23:02:38', 0),
(21, 31, 0, '2025-07-08 07:06:23', '2025-07-08 10:06:23', 0),
(22, 32, 0, '2025-11-08 16:42:16', '2025-11-08 11:42:16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bima`
--

CREATE TABLE `bima` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `bima_vat` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bima`
--

INSERT INTO `bima` (`id`, `booking_id`, `start_date`, `end_date`, `amount`, `bima_vat`, `created_at`, `updated_at`) VALUES
(1, 47, '2025-05-07', '2025-05-08', 100.00, 0.00, '2025-05-06 20:15:26', '2025-05-06 20:15:26'),
(2, 48, '2025-05-08', '2025-05-09', 150.00, 0.00, '2025-05-06 20:29:48', '2025-05-06 20:29:48'),
(3, 51, '2025-05-07', '2025-05-08', 3700.00, 0.00, '2025-05-07 12:53:38', '2025-05-07 12:53:38'),
(4, 84, '2025-05-29', '2025-05-30', 3700.00, 0.00, '2025-05-29 07:23:29', '2025-05-29 07:23:29'),
(5, 106, '2025-06-01', '2025-06-03', 7400.00, 0.00, '2025-06-01 19:44:50', '2025-06-01 19:44:50'),
(6, 119, '2025-06-04', '2025-06-03', 3700.00, 0.00, '2025-06-02 23:08:21', '2025-06-02 23:08:21'),
(7, 137, '2025-06-12', '2025-06-13', 3700.00, 0.00, '2025-06-12 09:51:53', '2025-06-12 09:51:53'),
(8, 164, '2025-06-20', '2025-06-21', 3700.00, 0.00, '2025-06-20 06:01:42', '2025-06-20 06:01:42'),
(9, 175, '2025-06-20', '2025-06-21', 3700.00, 0.00, '2025-06-20 11:58:58', '2025-06-20 11:58:58'),
(10, 204, '2025-06-25', '2025-06-27', 300.00, 45.76, '2025-06-22 21:11:49', '2025-06-22 21:11:49'),
(11, 205, '2025-06-25', '2025-06-25', 100.00, 15.25, '2025-06-22 23:53:59', '2025-06-22 23:53:59'),
(12, 212, '2025-07-01', '2025-07-01', 300.00, 45.76, '2025-06-30 13:58:22', '2025-06-30 13:58:22'),
(13, 646, '2026-02-13', '2026-02-16', 400.00, 61.02, '2026-02-09 19:20:57', '2026-02-09 19:20:57');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_code` varchar(50) DEFAULT NULL,
  `campany_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bus_id` bigint(20) UNSIGNED DEFAULT NULL,
  `route_id` bigint(20) UNSIGNED DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `customer_phone` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `infant_child` tinyint(1) NOT NULL DEFAULT 0,
  `age_group` varchar(255) DEFAULT NULL,
  `has_excess_luggage` tinyint(1) NOT NULL DEFAULT 0,
  `excess_luggage_fee` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `pickup_point` varchar(255) DEFAULT NULL,
  `dropping_point` varchar(255) DEFAULT NULL,
  `travel_date` date DEFAULT NULL,
  `seat` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `resaved_until` timestamp NULL DEFAULT NULL,
  `trans_status` varchar(255) DEFAULT NULL,
  `transaction_ref_id` varchar(255) DEFAULT NULL,
  `external_ref_id` varchar(255) DEFAULT NULL,
  `mfs_id` varchar(255) DEFAULT NULL,
  `verification_code` varchar(255) DEFAULT NULL,
  `bima` int(11) DEFAULT NULL,
  `bima_amount` int(11) DEFAULT NULL,
  `insuranceDate` varchar(255) DEFAULT NULL,
  `vender_id` varchar(255) DEFAULT NULL,
  `fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `service` decimal(10,2) NOT NULL DEFAULT 0.00,
  `vender_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `vender_service` decimal(10,2) NOT NULL DEFAULT 0.00,
  `vat` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` varchar(255) DEFAULT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `distance` int(11) NOT NULL DEFAULT 0,
  `busFee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fee_vat` decimal(10,2) NOT NULL DEFAULT 0.00,
  `service_vat` decimal(10,2) DEFAULT 0.00,
  `bima_vat` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(255) DEFAULT NULL,
  `tra_status` varchar(255) DEFAULT 'pending',
  `tra_rct_num` varchar(255) DEFAULT NULL,
  `tra_z_num` varchar(255) DEFAULT NULL,
  `tra_vnum` varchar(255) DEFAULT NULL,
  `tra_qr_url` text DEFAULT NULL,
  `tra_response` text DEFAULT NULL,
  `tra_error` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`created_at`, `updated_at`, `id`, `booking_code`, `campany_id`, `bus_id`, `route_id`, `schedule_id`, `customer_phone`, `customer_email`, `customer_name`, `gender`, `age`, `infant_child`, `age_group`, `has_excess_luggage`, `excess_luggage_fee`, `user_id`, `pickup_point`, `dropping_point`, `travel_date`, `seat`, `amount`, `payment_status`, `resaved_until`, `trans_status`, `transaction_ref_id`, `external_ref_id`, `mfs_id`, `verification_code`, `bima`, `bima_amount`, `insuranceDate`, `vender_id`, `fee`, `service`, `vender_fee`, `vender_service`, `vat`, `discount`, `discount_amount`, `distance`, `busFee`, `fee_vat`, `service_vat`, `bima_vat`, `payment_method`, `tra_status`, `tra_rct_num`, `tra_z_num`, `tra_vnum`, `tra_qr_url`, `tra_response`, `tra_error`) VALUES
('2025-05-14 08:07:18', '2025-09-06 13:07:47', 4, '#JZ88009637', 3, 21, 21, NULL, '255678819657', 'doniaparoma99@gmail.com', 'Abuu', NULL, NULL, 0, NULL, 0, 0, NULL, 'same', 'mbezi', '2025-04-26', 'D1', 810.00, 'Cancel', NULL, 'success', 'dgh06v8d-913', NULL, '25698343148167', 'wFVnhhpUwUpfvhs9IDpshhi6aPs2', NULL, NULL, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, 'SCH202412', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-26 02:32:33', '2025-04-26 05:33:08', 5, '#FZ11517397', 3, 7, 11, NULL, '0628042409', NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'mbezi', '2025-04-26', 'F2', 1000.00, 'Failed', NULL, NULL, '0j50jbt0-867', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-26 11:29:12', '2025-04-26 14:29:15', 6, '#LS13769866', 12, 8, 12, NULL, NULL, NULL, 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'morogoro', '2025-04-26', 'D1', 1000.00, 'Unpaid', NULL, NULL, 'ylpktgl6-127', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-26 12:06:06', '2025-04-26 15:06:07', 7, '#DJ83208211', 12, 8, 12, NULL, '076555395', 'chuobandari@gmail.com', 'Abdul Bunju', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'morogoro', '2025-04-26', 'F1', 1000.00, 'Unpaid', NULL, NULL, '5s8zpymx-259', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-26 12:49:00', '2025-04-26 15:49:01', 8, '#QC03117786', 12, 8, 12, NULL, '715020945', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'morogoro', '2025-04-26', 'C1', 1000.00, 'Unpaid', NULL, NULL, 'exm19tdy-530', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-27 12:39:48', '2025-04-27 15:40:09', 9, '#EV63313795', 12, 8, 12, NULL, '624093536', 'abjuma0000@gmail.com', 'Abdul Bunju', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'kibaha', '2025-04-27', 'C1', 1000.00, 'Failed', NULL, NULL, 'nnkorjt7-942', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-28 04:16:08', '2025-04-28 07:17:22', 10, '#WF72314153', 3, 7, 11, NULL, '765553953', 'admin@bishtelecom.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Bagamoyo', '2025-04-28', 'F2', 1000.00, 'Failed', NULL, NULL, 's7n7shk7-427', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-28 13:25:51', '2025-05-13 00:34:11', 11, '#GE60086319', 3, 7, 11, NULL, '765553953', 'admin@bishtelecom.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Bagamoyo', '2025-04-28', 'A1', 800.00, 'Paid', NULL, 'success', 'bpfh6zw2-964', NULL, '25102410589780', '9qEOHBBGnU8bJLhYGFxEGZYthyjV', NULL, NULL, NULL, '1', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-28 13:31:12', '2025-04-28 16:31:38', 12, '#SV90774494', 3, 7, 11, NULL, '765553953', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Bagamoyo', '2025-04-28', 'D1', 1000.00, 'Paid', NULL, 'success', '7cpi2tw3-915', NULL, '25902310518395', 'Uh8o22howuHVGjzT0uBTiaBkFBDi', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-29 09:30:26', '2025-04-29 12:33:17', 13, '#QI32126216', 3, 7, 11, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Bagamoyo', '2025-04-29', 'A1', 1000.00, 'Paid', NULL, 'success', '111c435l-996', NULL, '25390772247653', 'BgnZz7MsN5tjNKhEMila4Ff7YFK3', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-29 18:14:38', '2025-04-29 21:14:39', 14, '#KI00331733', 3, 5, 8, NULL, '715020945', 'chizithomas@gmail.com', 'Thomas Paul', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'same', '2025-04-30', 'E2', 1000.00, 'Unpaid', NULL, NULL, '4o7rvnwe-803', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 04:36:27', '2025-04-30 07:36:29', 15, '#WF86213515', 3, 5, 8, NULL, '789473209', 'chizithomas@gmail.com', 'thomas', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'same', '2025-04-30', 'L2', 1000.00, 'Unpaid', NULL, NULL, 'mrypex0c-424', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 05:59:25', '2025-04-30 08:59:27', 16, '#ET50503759', 3, 5, 8, NULL, '789473209', 'chizithomas@gmail.com', 'thom', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'same', '2025-04-30', 'A1', 1000.00, 'Unpaid', NULL, NULL, 'hc300l6i-970', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 06:01:20', '2025-04-30 09:03:15', 17, '#KB69824782', 3, 5, 8, NULL, '765553953', 'abjuma@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'same', '2025-04-30', 'H1', 1000.00, 'Failed', NULL, NULL, 'qrhrcgip-746', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 06:04:57', '2025-04-30 09:06:36', 18, '#FN79863802', 3, 5, 8, NULL, '076555395', 'abjuma@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'same', '2025-04-30', 'L1', 1000.00, 'Paid', NULL, 'success', 'sb1l7djj-797', NULL, '25402421176060', '3weumf0Bi3FP9UjoopsAZsxgaRN4', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 09:20:47', '2025-04-30 12:21:03', 19, '#JZ37090477', 3, 7, 11, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Moshi', '2025-04-30', 'E1', 1000.00, 'Failed', NULL, NULL, 'u5wk1jtt-292', NULL, NULL, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 09:23:20', '2025-04-30 12:23:29', 20, '#CR77906650', 3, 7, 11, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Moshi', '2025-05-02', 'E1', 1000.00, 'Failed', NULL, NULL, '40860ua6-984', NULL, NULL, NULL, 1, 7400, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 09:32:18', '2025-04-30 12:32:35', 21, '#RS71539111', 3, 7, 11, NULL, '622521917', 'doniaparoma99@gmail.com', 'pop', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Moshi', '2025-05-02', 'H1', 1000.00, 'Failed', NULL, NULL, 'c1ub1dmi-958', NULL, NULL, NULL, 1, 7400, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 09:37:57', '2025-04-30 12:38:14', 22, '#WB55313833', 3, 7, 11, NULL, '622521917', 'doniaparoma99@gmail.com', 'thom', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Moshi', '2025-05-02', 'D2', 1000.00, 'Failed', NULL, NULL, '3w83ytlk-908', NULL, NULL, NULL, 1, 7400, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 09:41:35', '2025-04-30 12:41:47', 23, '#JP60084953', 3, 7, 11, NULL, '622521917', 'restaurants@example.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Bagamoyo', '2025-05-02', 'D2', 8400.00, 'Failed', NULL, NULL, 'h42ypl6q-578', NULL, NULL, NULL, 1, 7400, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 09:43:28', '2025-04-30 12:43:35', 24, '#OW77845431', 3, 5, 8, NULL, '622521917', 'restaurant@example.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'same', '2025-04-30', 'D2', 1000.00, 'Failed', NULL, NULL, '1r5ywq6e-750', NULL, NULL, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 09:45:37', '2025-04-30 12:45:37', 25, '#BC68206337', 3, 7, 11, NULL, '715553803', 'abjuma0000@gmail.com', 'thom', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Bagamoyo', '2025-04-30', 'B1', 1000.00, 'Unpaid', NULL, NULL, 'sf55regt-160', NULL, NULL, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 10:27:55', '2025-04-30 13:28:04', 26, '#NL61959732', 3, 7, 11, NULL, '622521917', 'restaurant@example.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Moshi', '2025-05-02', 'C2', 38000.00, 'Failed', NULL, NULL, 'h0njl16n-475', NULL, NULL, NULL, 1, 37000, '2025-05-10', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 10:37:32', '2025-04-30 13:37:33', 27, '#RG55425514', 3, 7, 11, NULL, '622521917', NULL, 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Bagamoyo', '2025-05-02', 'B2', 4700.00, 'Unpaid', NULL, NULL, 'e322xmq6-636', NULL, NULL, NULL, 1, 3700, '2025-05-01', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 10:40:53', '2025-04-30 13:41:38', 28, '#NF71499376', 3, 7, 11, NULL, '622521917', 'restaurants@example.com', 'ciliely', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Moshi', '2025-05-02', 'H1', 1000.00, 'Failed', NULL, NULL, 'koy2jotq-489', NULL, NULL, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 10:48:07', '2025-04-30 13:48:07', 29, '#VZ61879210', 3, 7, 11, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Bagamoyo', '2025-05-02', 'C1', 12100.00, 'Unpaid', NULL, NULL, 'k4n6fxq9-468', NULL, NULL, NULL, 1, 11100, '2025-05-03', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-04-30 10:49:15', '2025-04-30 13:49:16', 30, '#LU82233689', 3, 7, 11, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Bagamoyo', '2025-05-02', 'C1', 79600.00, 'Unpaid', NULL, NULL, 'v5n3ngzz-459', NULL, NULL, NULL, 1, 29600, '2025-05-08', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-01 15:02:18', '2025-05-01 18:02:28', 31, '#GG42381987', 3, 7, 11, NULL, '25562804249', NULL, 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'same', '2025-05-02', 'C1', 1000.00, 'Failed', NULL, NULL, 'u0kywxt7-258', NULL, NULL, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-02 04:51:33', '2025-05-02 07:52:31', 32, '#WJ99543299', 3, 7, 11, NULL, '789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'same', '2025-05-02', 'G4', 1000.00, 'Failed', NULL, NULL, 'lgj4rouz-754', NULL, NULL, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-02 06:15:31', '2025-05-02 09:15:31', 33, '#HN72389660', 3, 7, 11, NULL, '789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'same', '2025-05-02', 'F3', 1000.00, 'Unpaid', NULL, NULL, '8z5h2j31-600', NULL, NULL, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-06 19:13:17', '2025-05-06 22:14:04', 44, '#KO47589475', 24, 15, 19, NULL, '255765553953', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Muheza', '2025-05-07', 'A1', 500.00, 'Paid', NULL, 'success', '4663tgzm-930', NULL, '25883904415559', 'C0buVTE45k1PSwf3U43AKM2q5Vgd', 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-03 11:15:21', '2025-05-03 14:16:03', 35, '#GR19222401', 13, 9, 13, NULL, '755879793', 'chizithomas@gmail.com', 'Daniel Thomas', NULL, NULL, 0, NULL, 0, 0, NULL, 'Musoma', 'Kahanara', '2025-05-03', 'D1', 1000.00, 'Paid', NULL, 'success', 'rgso6ceg-275', NULL, '25457260365531', 'TQnuBFSg6s9E1LghlZJHoOmLTLtu', 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-04 04:04:06', '2025-05-04 07:04:09', 36, '#ST40294942', 13, 10, 14, NULL, '786948007', 'chizithomas@gmail.com', 'Kelvin Mpogole', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Tinde', '2025-05-05', 'E1', 1000.00, 'Unpaid', NULL, NULL, 'xrcdu1ua-115', NULL, NULL, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-04 04:04:08', '2025-05-04 07:04:09', 37, '#DI79748737', 13, 10, 14, NULL, '786948007', 'chizithomas@gmail.com', 'Kelvin Mpogole', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Tinde', '2025-05-05', 'E1', 1000.00, 'Unpaid', NULL, NULL, 'rti19eqd-803', NULL, NULL, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-04 04:11:25', '2025-05-04 07:12:10', 38, '#VT41046188', 13, 10, 14, NULL, '786948007', 'chizithomas@gmail.com', 'Kelvin Mpogole', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Tinde', '2025-05-05', 'H3', 1000.00, 'Paid', NULL, 'success', 'rbah4mca-573', NULL, '25882887966369', 'T51CpjBh3bWSdQ4z4VH2LZJpiCxJ', 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-05 01:55:38', '2025-05-05 04:56:09', 39, '#TS33177360', 19, 12, 16, NULL, '765553953', 'abjuma0000@gmail.com', 'Abdul Bunju', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Picha ya ndege', '2025-05-05', 'A1', 500.00, 'Paid', NULL, 'success', 'w8p1xm5z-448', NULL, '25857271045281', '0CI1DiHb2qev5JvNIPkrDUUyPzIr', 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-05 15:16:17', '2025-05-05 18:16:20', 40, '#RG17444723', 20, 13, 17, NULL, '755879793', NULL, 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mtwara', 'Somanga', '2025-05-05', 'E3', 1000.00, 'Unpaid', NULL, NULL, 'sa6lcr6j-293', NULL, NULL, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-05 15:22:49', '2025-05-05 18:24:04', 41, '#VM74015290', 20, 13, 17, NULL, '755879793', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mtwara', 'Somanga', '2025-05-05', 'A1', 1000.00, 'Paid', NULL, 'success', '40xa1a9g-563', NULL, '25902378047245', '9k1qK7pwuJn2j3MSDcJEK2tbWG7U', 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-06 15:56:05', '2025-05-06 18:57:53', 42, '#RV08323104', 20, 13, 17, NULL, '717332744', 'christina.ekarist@hisgc.co.tz', 'Christina Ekarist Joseph', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Somanga', '2025-05-06', 'B4', 1000.00, 'Paid', NULL, 'success', '9m4ttvr5-558', NULL, '25491337046908', 'Hhtlzhm2YGjd0lyZvmqDZRpQn9Ku', 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-06 16:39:37', '2025-05-06 19:41:06', 43, '#LW61728849', 21, 14, 18, NULL, '25576555395', NULL, 'Abdul Bunju', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Chalinze', '2025-05-07', 'E1', 4700.00, 'Paid', NULL, 'success', 'jx886ics-488', NULL, '25503580920990', 'JbvkJASTb5L0WcF1cNqrXJw2A6t7', 1, 3700, '2025-05-07', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-06 19:44:07', '2025-05-06 22:45:09', 45, '#YP28126610', 24, 16, 20, NULL, '255765553953', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Muheza', '2025-05-07', 'A2,A1,K1,K2,L1', 550.00, 'Failed', NULL, NULL, 'u7npsgac-905', NULL, NULL, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-06 19:46:31', '2025-05-06 22:47:15', 46, '#JA25167739', 24, 16, 20, NULL, '255765553953', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Muheza', '2025-05-07', 'A2,A1,K1,K2,L1', 50.00, 'Paid', NULL, 'success', 'xufctmjj-533', NULL, '25858391401936', 'P1kSwJGhrPa720k0zL7GfC6U1Aej', 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-06 20:14:45', '2025-05-06 23:15:26', 47, '#RU47418435', 24, 16, 20, NULL, '765553953', 'abduldv@aatanchtrading.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Muheza', '2025-05-07', 'A4,A3,K4,K3', 40.00, 'Paid', NULL, 'success', 'i59k4qv3-367', NULL, '25691338646498', 'yhFRv6R4yKsMLtDT1bBkfhUdsyMO', 1, 100, '2025-05-08', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-06 20:28:21', '2025-05-06 23:29:48', 48, '#AG32768682', 24, 16, 20, NULL, '255765553953', 'abduldv@aatanchtrading.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Tanga', 'Muheza', '2025-05-08', 'A4,A3,A1,A2', 40.00, 'Paid', NULL, 'success', 'oreaqxet-866', NULL, '25383904469494', 'FoEKedW8vLxoIOGKwEeSNU05yVuH', 1, 150, '2025-05-09', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-07 12:28:10', '2025-05-07 15:30:48', 49, '#JF45945532', 3, 17, 21, NULL, '255789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Bagamoyo', '2025-05-07', 'C1', 4700.00, 'Failed', NULL, NULL, 'o59g19zn-845', NULL, NULL, NULL, 1, 3700, '2025-05-08', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-07 12:33:52', '2025-05-07 15:34:30', 50, '#ON69853761', 3, 17, 21, NULL, '789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Bagamoyo', '2025-05-07', 'C3', 4700.00, 'Failed', NULL, NULL, 'yi8yj0ol-132', NULL, NULL, NULL, 1, 3700, '2025-05-08', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-07 12:52:24', '2025-05-07 15:53:38', 51, '#MZ58182224', 3, 17, 21, NULL, '789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Bagamoyo', '2025-05-07', 'A4,J4', 1000.00, 'Paid', NULL, 'success', 'ndn08bo2-753', NULL, '25991342512828', '53fabtK6zXwnM5xJ30las1xfiPzx', 1, 3700, '2025-05-08', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-07 18:36:54', '2025-05-07 21:38:28', 52, '#UH90959325', 3, 17, 21, NULL, '717332744', 'christina.ekarist@hisgc.co.tz', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Bagamoyo', '2025-05-07', 'E1', 500.00, 'Paid', NULL, 'success', 'd9czfyp5-620', NULL, '25703498749365', 'AMtjXoALV73pGBNMSmwbOjwWSjgM', 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-08 16:48:29', '2025-05-08 19:48:31', 53, '#GZ17621132', 3, 17, 21, NULL, '754883904', 'zabron@hisgc.com', 'Zabron Mtigitu', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Bagamoyo', '2025-05-08', 'D1', 1000.00, 'Unpaid', NULL, NULL, 'zlzx52vm-990', NULL, NULL, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-08 16:48:31', '2025-05-08 19:49:29', 54, '#XD28629030', 3, 17, 21, NULL, '754883904', 'zabron@hisgc.com', 'Zabron Mtigitu', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Bagamoyo', '2025-05-08', 'D1', 500.00, 'Paid', NULL, 'success', '1mw8k1vm-192', NULL, '25383028756094', 'vWDKAN2wR5aTVcN6P1D3GVHD794v', 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-10 09:31:36', '2025-05-10 12:31:40', 55, '#FC45506826', 3, 17, 21, NULL, '786948007', 'kpslayovi@gmail.com', 'Kelvin Mpogole', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Bagamoyo', '2025-05-10', 'A1,A2', 1500.00, 'Unpaid', NULL, NULL, 'qanw7m4q-622', NULL, NULL, NULL, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-10 15:43:07', '2025-05-10 18:43:10', 56, '#OX18788262', 3, 17, 21, NULL, '255715438032', 'test@gmail.com', 'Hsjsjsj', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Bagamoyo', '2025-05-10', 'G3,F2', 5200.00, 'Unpaid', NULL, NULL, 'dvekcaei-719', NULL, NULL, NULL, 1, 3700, '2025-05-11', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-16 20:06:51', '2025-05-16 23:07:59', 60, '#LJ38332813', 3, 18, 22, NULL, '624093536', 'abjuma0000@gmail.com', 'Abdul Bunju', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-05-17', 'G1', 63100.00, 'Failed', NULL, NULL, 'xkfv7i2l-743', NULL, NULL, NULL, 1, 29600, '2025-05-24', '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-16 20:23:44', '2025-05-16 23:24:08', 61, '#VY78642178', 3, 18, 22, NULL, '624093536', 'abjuma0000@gmail.com', 'Abdul Bunju', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-05-17', 'B1', 33500.00, 'Failed', NULL, NULL, '7szqnjnh-155', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-17 07:03:18', '2025-05-17 10:04:12', 62, '#GA21415362', 3, 18, 22, NULL, '789473209', 'chizithoomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Msata', '2025-05-17', 'L4', 830.00, 'Paid', NULL, 'success', '6y4glpmr-356', NULL, '25799627050732', 'QGvs0sKEDB2UywTtm8UCxN0QYlZz', 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-17 15:44:14', '2025-05-17 18:44:17', 63, '#QB77889697', 3, 18, 22, NULL, '624093536', 'abjuma0000@gmail.com', 'Abdul Bunju', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-18', 'E1', 33500.00, 'Unpaid', NULL, NULL, 'wxtr36h9-250', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-20 14:25:42', '2025-05-20 17:25:42', 64, '#SA45159073', 3, 21, 25, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-05-21', 'E1', 33500.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-20 14:29:52', '2025-05-20 17:29:55', 65, '#YG75496205', 3, 21, 25, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-05-21', 'E1', 33500.00, 'Unpaid', NULL, NULL, 'umhtsh9b-282', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-20 19:32:49', '2025-05-20 22:32:51', 66, '#LJ25688121', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-20', 'D1', 30500.00, 'Unpaid', NULL, NULL, '2unl84o7-162', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-25 06:07:05', '2025-05-25 09:09:05', 67, '#NP19160837', 3, 23, 27, NULL, '789473209', 'chizithomas@gmail.com', 'Mariam Swai', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-05-25', 'E4', 800.00, 'Failed', NULL, NULL, 'miwss3gg-417', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-26 10:44:10', '2025-05-26 13:44:10', 68, '#YA26477290', 3, 21, 25, NULL, '755879793', 'rhoda@hisgc.co.tz', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-27', 'A2', 830.00, 'Unpaid', NULL, NULL, 'mbbis0y5-376', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-26 10:55:27', '2025-05-26 13:55:27', 69, '#YA56193355', 3, 21, 25, NULL, '755879793', 'rhoda@hisgc.co.tz', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'D3', 830.00, 'Unpaid', NULL, NULL, '16rrdaek-727', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-26 11:04:50', '2025-05-26 14:04:50', 70, '#JR48903786', 3, 21, 25, NULL, '755879793', 'rhodapeterQhisgc', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Kigoma', 'Iringa', '2025-05-28', 'D1', 500.00, 'Unpaid', NULL, NULL, '80lifkn4-980', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-26 11:24:14', '2025-05-26 14:24:58', 71, '#VI41179385', 3, 21, 25, NULL, '755879793', 'rhodapeter@hisgc.co.tz', 'Rhodes Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Kilimanjaro', 'Iringa', '2025-05-28', 'D3', 500.00, 'Paid', NULL, 'success', 'ikp5r8ma-123', NULL, '25483184759434', 'xpGmZMX2d48dNSgGGG0QvC1kR88v', 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-27 14:44:09', '2025-05-27 17:44:12', 72, '#YA68678366', 3, 21, 25, NULL, '789473209', NULL, 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dodoma', 'Arusha', '2025-05-28', 'B2', 500.00, 'Unpaid', NULL, NULL, '7fqqie4o-335', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-28 02:24:32', '2025-05-28 05:24:35', 73, '#ZS47703657', 3, 21, 25, NULL, '755879793', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-05-28', 'A2', 4200.00, 'Unpaid', NULL, NULL, 'uvtyqlvq-902', NULL, NULL, NULL, 1, 3700, '2025-05-29', '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-28 02:33:46', '2025-05-28 05:33:46', 74, '#WV11393872', 3, 21, 25, NULL, '789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-05-28', 'A2', 500.00, 'Unpaid', NULL, NULL, 'pa1m6qyc-243', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-28 02:55:20', '2025-05-28 05:55:22', 75, '#CB88915231', 3, 21, 25, NULL, '255789 473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-05-28', 'G2', 4200.00, 'Unpaid', NULL, NULL, 'bac633x3-389', NULL, NULL, NULL, 1, 3700, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-28 14:01:51', '2025-05-28 17:01:55', 76, '#UA58189514', 3, 21, 25, NULL, '789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'D2', 4200.00, 'Unpaid', NULL, NULL, 'bg62jzm1-193', NULL, NULL, NULL, 1, 3700, '2025-05-29', '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 06:50:05', '2025-05-29 09:50:09', 77, '#PB56094772', 3, 21, 25, NULL, '255765553953', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'A1', 830.00, 'Unpaid', NULL, NULL, '72mpckzj-346', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 06:56:41', '2025-05-29 09:56:42', 78, '#QE39300922', 3, 21, 25, NULL, '765553953', 'abunju@watuafrica.co.tz', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'B3', 4530.00, 'Unpaid', NULL, NULL, 'jvjqkd00-252', NULL, NULL, NULL, 1, 3700, '2025-05-30', '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 07:01:00', '2025-05-29 10:01:01', 79, '#GF47041804', 3, 21, 25, NULL, '255753020945', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'G3', 4530.00, 'Unpaid', NULL, NULL, 'justar07-378', NULL, NULL, NULL, 1, 3700, '2025-05-30', '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 07:08:18', '2025-05-29 10:09:14', 80, '#FL13808102', 3, 21, 25, NULL, '255789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'C1', 800.00, 'Failed', NULL, NULL, 'rc2gnt15-995', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 07:12:01', '2025-05-29 10:14:02', 81, '#UF43065177', 3, 21, 25, NULL, NULL, 'chizithomas@hisgc.co.tz', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'J2', 4500.00, 'Failed', NULL, NULL, 'xocu2dic-517', NULL, NULL, NULL, 1, 3700, '2025-05-30', '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 07:15:59', '2025-05-29 10:16:42', 82, '#EO76764995', 3, 21, 25, NULL, '255789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'G1', 4500.00, 'Failed', NULL, NULL, '2ddk5vzy-626', NULL, NULL, NULL, 1, 3700, '2025-05-30', '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 07:17:25', '2025-05-29 10:17:26', 83, '#SP44996382', 3, 21, 25, NULL, '785118323', 'kpslayovi@gmail.com', 'Kelvin Mpogole', NULL, NULL, 0, NULL, 0, 0, NULL, 'Segerea', 'Moshi', '2025-05-30', 'A2,A1', 600.00, 'Unpaid', NULL, NULL, '60dixrik-747', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 07:22:41', '2025-05-29 10:23:29', 84, '#WG14662012', 3, 21, 25, NULL, '765553953', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'F4', 4500.00, 'Paid', NULL, 'success', 'r3mnpptz-304', NULL, '25103694344695', 'Oj3GkbniZWbAdLJQNamz7MiCCD7q', 1, 3700, '2025-05-30', '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 07:27:06', '2025-05-29 10:27:53', 85, '#IK06421089', 3, 21, 25, NULL, '255786948007', 'chizithomas@gmail.com', 'Kelvin Mpogole', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'C3', 800.00, 'Paid', NULL, 'success', 'lru5c4df-670', NULL, '25958504450861', 'dUH0onMsJf5IqENKGs1Gyw15xXFO', 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 13:35:25', '2025-05-29 16:35:28', 86, '#MF10819706', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'C1', 830.00, 'Unpaid', NULL, NULL, '0tvwhewe-687', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 13:37:27', '2025-05-29 16:37:27', 87, '#VO38658298', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'D1', 8230.00, 'Unpaid', NULL, NULL, 'o94qb6al-223', NULL, NULL, NULL, 1, 7400, '2025-05-31', '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 19:43:23', '2025-05-29 22:44:08', 88, '#AK46578061', 3, 21, 25, NULL, '255765553953', 'abjuma0000@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'A1', 600.00, 'Paid', NULL, 'success', 'u28829bf-826', NULL, '25499745116842', 'fJbtZzsfmshrQzAzLG6GTKOPJFeD', 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 19:58:10', '2025-05-29 22:59:26', 89, '#UK24257301', 3, 21, 25, NULL, '255765553953', 'bunju@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'A4', 600.00, 'Failed', NULL, NULL, 'pqkx0bvw-842', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 20:01:40', '2025-05-29 23:02:22', 90, '#RE97864501', 3, 21, 25, NULL, '255765553953', 'bunju@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'M1', 100.00, 'Paid', NULL, 'success', '3u0gn0lr-682', NULL, '25383113248669', 'FraqGqRG3n91SESJ0oGKuZAvKKHG', 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 20:38:14', '2025-05-29 23:38:15', 91, '#QZ37241575', 3, 21, 25, NULL, '255765553953', 'bunju@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'F1', 600.00, 'Unpaid', NULL, NULL, 'kj2pkcp5-978', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-05-29 21:00:22', '2025-05-30 00:00:24', 92, '#SV11658780', 3, 21, 25, NULL, '255765553953', 'bunju@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-05-29', 'F2', 600.00, 'Unpaid', NULL, NULL, '9e47wgub-119', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-01 05:31:07', '2025-06-01 08:31:10', 93, 'VB17195230', 3, 21, 25, NULL, '255789473209', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Shekilango', 'Pumuani', '2025-06-01', 'B1', 540.00, 'Unpaid', NULL, NULL, 'xwsp2l4r-689', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-01 08:42:07', '2025-06-01 11:43:02', 94, 'UK25675034', 3, 29, 33, NULL, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Manyara', '2025-06-01', 'C4', 46.50, 'Paid', NULL, 'success', 'b8lo1yn1-204', NULL, '25999865654012', 'FqebzCpgzJbP9ftlgZM4i6qaHGBm', 0, 0, NULL, '', 3.50, 500.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-01 15:01:23', '2025-06-01 18:02:12', 95, 'BX50553560', 3, 21, 25, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-01', 'D2,E2,E1,F1', 900.00, 'Failed', NULL, NULL, 'vdvbl5vp-132', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-01 16:37:31', '2025-06-01 19:37:31', 96, 'EX62289292', 3, 29, 33, NULL, '789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Manyara', '2025-06-01', 'A4', 550.00, 'Unpaid', NULL, NULL, 'p9kmpua3-618', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-01 16:41:40', '2025-06-01 19:41:41', 97, 'UL25731293', 3, 29, 33, NULL, '789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Manyara', '2025-06-01', 'A2', 550.00, 'Unpaid', NULL, NULL, 't0tsadpc-350', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-01 16:49:41', '2025-06-01 19:49:44', 98, 'FX61384186', 3, 21, 25, NULL, '789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-01', 'E1', 4300.00, 'Unpaid', NULL, NULL, 'mbp0k6ch-278', NULL, NULL, NULL, 1, 3700, '2025-06-02', '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-01 16:57:13', '2025-06-01 19:57:15', 99, 'WY59685052', 3, 21, 25, NULL, '255789473209', 'josephine.mayai@hiisgc.co.tz', 'Josepine Mayai', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-01', 'I2', 600.00, 'Unpaid', NULL, NULL, 'i57zvkjo-969', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-01 18:17:24', '2025-06-01 21:17:27', 100, 'YF94876728', 3, 29, 33, NULL, '255755879793', 'jackob@hisgc.co.tz', 'Jackob Azard', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Manyara', '2025-06-01', 'D3', 550.00, 'Unpaid', NULL, NULL, 'q65juwzw-120', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-01 18:20:51', '2025-06-01 21:20:52', 101, 'NZ26964523', 3, 29, 33, NULL, '255755879793', 'jacob.azard@hisgc.co.tz', 'Jacob Azard', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Manyara', '2025-06-01', 'B1', 550.00, 'Unpaid', NULL, NULL, 'sotkdnvq-436', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-01 18:23:38', '2025-06-01 21:23:39', 102, 'HG94844133', 3, 29, 33, NULL, '255765553953', 'abunju@watuafrica.co.tz', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Manyara', '2025-06-01', 'C1', 7950.00, 'Unpaid', NULL, NULL, '3zu5fm56-580', NULL, NULL, NULL, 1, 7400, '2025-06-03', '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-01 18:32:12', '2025-06-01 21:32:13', 103, 'MP31385067', 3, 29, 33, NULL, '255755879793', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Manyara', '2025-06-01', 'C1', 4250.00, 'Unpaid', NULL, NULL, 'rb88b3fd-218', NULL, NULL, NULL, 1, 3700, '2025-06-02', '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-01 19:15:43', '2025-06-01 22:16:41', 104, 'RU97806917', 3, 29, 33, NULL, '255765553953', 'abjuma0000@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Manyara', '2025-06-01', 'G1', 46.50, 'Paid', NULL, 'success', '7uvplxdx-599', NULL, '25703826542740', 'LGyJZgqNZV0DHGLn7YjkGBkCJFGR', 0, 0, NULL, '37', 3.50, 500.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-01 19:39:54', '2025-06-01 22:41:47', 105, 'HX36869170', 3, 29, 33, NULL, '255715553803', 'abjuma0000@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Manyara', '2025-06-01', 'A1', 7950.00, 'Failed', NULL, NULL, 'gaxg1ilm-890', NULL, NULL, NULL, 1, 7400, '2025-06-03', '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-01 19:44:06', '2025-06-01 22:44:50', 106, 'OW03816920', 3, 29, 33, NULL, '255715553803', 'abjuma0000@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Manyara', '2025-06-01', 'A1', -471.50, 'Paid', NULL, 'success', 'eojiaq2g-353', NULL, '25299871789432', 'wmrUNfQnUIfdXWblS2bGReWI3ZOH', 1, 7400, '2025-06-03', '37', 521.50, 500.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-02 06:26:45', '2025-06-02 09:26:46', 107, 'FE28191902', 21, 28, 32, NULL, '255715553803', 'abjuma0000@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Dodoma', '2025-06-02', 'A1', 600.00, 'Unpaid', NULL, NULL, 'o8ik7svh-981', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-02 06:29:55', '2025-06-02 09:31:15', 108, 'PT25374143', 21, 28, 32, NULL, '255715553803', 'abjuma0000@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Dodoma', '2025-06-02', 'B2', 600.00, 'Failed', NULL, NULL, 'c39m21z0-412', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-02 06:32:59', '2025-06-02 09:33:41', 109, 'EZ86198516', 21, 28, 32, NULL, '255715553803', 'abjuma0000@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Dodoma', '2025-06-02', 'F1', 600.00, 'Paid', NULL, 'success', 'ms1kszqg-274', NULL, '25358637013306', 'jN1bWUGWxRPeZvPLGO0QlAP6Y3oY', 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-02 11:07:47', '2025-06-02 14:08:38', 110, 'UR53937555', 21, 14, 18, NULL, '255765553953', 'abjuma0000@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Dodoma', '2025-06-03', 'A1', 600.00, 'Paid', NULL, 'success', '1stwz5a2-941', NULL, '25791177682073', '4MFFwlmsAs1YdMip43NyHOb4GASw', 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-02 11:56:06', '2025-06-02 14:56:08', 111, 'OQ54663097', 21, 14, 18, NULL, '255765553953', 'abjuma0000@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Dodoma', '2025-06-03', 'J1', 200.00, 'Unpaid', NULL, NULL, 'ucvi9hdt-169', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-02 11:58:28', '2025-06-02 14:59:22', 112, 'ZD64400956', 21, 14, 18, NULL, '255765553953', 'bunju@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Dodoma', '2025-06-03', 'I1', 4.50, 'Paid', NULL, 'success', '037bel0w-954', NULL, '25699875879737', 'NwNgmNQhs5HAKp8wVFpWJaFANq9v', 0, 0, NULL, '37', 4.50, 90.00, 0.50, 10.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-02 13:39:42', '2025-06-02 16:40:26', 113, 'HL63206700', 21, 14, 18, NULL, '255765553953', 'abjuma0000@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Dodoma', '2025-06-03', 'E1', 100.00, 'Paid', NULL, 'success', 'yqf7ouxw-904', NULL, '25991678916058', 'L7UVH4LAxZYeBm3JN7rtitbugF3W', 0, 0, NULL, '37', 4.50, 90.00, 0.50, 10.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-02 14:00:46', '2025-06-02 17:01:33', 114, 'PI54221317', 21, 14, 18, NULL, '255765553953', 'abunju@watuafrica.co.tz', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Dodoma', '2025-06-03', 'C1', 95.00, 'Paid', NULL, 'success', 'esmf5a73-735', NULL, '25791178112703', '12JiuOunWK2CB9kADgpdDDsSClUJ', 0, 0, NULL, '37', 4.50, 90.00, 0.50, 10.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-02 14:09:30', '2025-06-02 17:10:18', 115, 'JP24432412', 3, 21, 25, NULL, '255765553953', 'abjuma0000@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-04', 'B1,D1', 186.00, 'Paid', NULL, 'success', 'x45vz06s-831', NULL, '25958631912916', 'IKIWsAbeVp3v8DmDWWbBnS2mgBV0', 0, 0, NULL, '37', 12.60, 90.00, 1.40, 10.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-02 14:28:35', '2025-06-02 17:29:19', 116, 'II76777166', 3, 21, 25, NULL, '255765553953', 'abjuma0000@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-04', 'G1', 93.00, 'Paid', NULL, 'success', 'z96zmuy9-160', NULL, '25583244120129', '3RwW5v73A8saPYChVC7IO5QnA2eq', 0, 0, NULL, '37', 6.30, 90.00, 0.70, 10.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-02 14:44:56', '2025-06-02 17:45:53', 117, 'DH10276249', 3, 21, 25, NULL, '255765553953', 'abjuma0000@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-04', 'A4', 93.00, 'Paid', NULL, 'success', '8v8xm829-232', NULL, '25383255397054', 'H2GWYpRBuUENGDhCcv2EOQbr1Jlo', 0, 0, NULL, '', 7.00, 100.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-02 23:01:40', '2025-06-03 02:02:10', 118, 'BL38578924', 3, 21, 25, NULL, '255755879793', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-04', 'D3', 3900.00, 'Failed', NULL, NULL, 'z8oja8sp-417', NULL, NULL, NULL, 1, 3700, '2025-06-03', '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-02 23:07:07', '2025-06-03 02:08:21', 119, 'QK24555405', 3, 21, 25, NULL, '255755879793', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-04', 'C4', 93.00, 'Paid', NULL, 'success', 'ly86um2u-546', NULL, '25299880620427', 'pp2Xm7kP1uOjuWv53u2YX3teO8p1', 1, 3700, '2025-06-03', '37', 6.30, 90.00, 0.70, 10.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-03 13:58:16', '2025-09-06 13:11:40', 120, 'KR42786863', 3, 21, 25, NULL, '255678165524', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-04', 'F2', 93.00, 'Cancel', NULL, 'success', 'k7djfsb7-839', NULL, '25983252209219', 'JCekfoZBlNwbom50VvGAaQzbz770', 0, 0, NULL, '', 7.00, 100.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bookings` (`created_at`, `updated_at`, `id`, `booking_code`, `campany_id`, `bus_id`, `route_id`, `schedule_id`, `customer_phone`, `customer_email`, `customer_name`, `gender`, `age`, `infant_child`, `age_group`, `has_excess_luggage`, `excess_luggage_fee`, `user_id`, `pickup_point`, `dropping_point`, `travel_date`, `seat`, `amount`, `payment_status`, `resaved_until`, `trans_status`, `transaction_ref_id`, `external_ref_id`, `mfs_id`, `verification_code`, `bima`, `bima_amount`, `insuranceDate`, `vender_id`, `fee`, `service`, `vender_fee`, `vender_service`, `vat`, `discount`, `discount_amount`, `distance`, `busFee`, `fee_vat`, `service_vat`, `bima_vat`, `payment_method`, `tra_status`, `tra_rct_num`, `tra_z_num`, `tra_vnum`, `tra_qr_url`, `tra_response`, `tra_error`) VALUES
('2025-06-04 02:46:15', '2025-06-04 05:48:07', 121, 'II86587461', 3, 21, 25, NULL, '255789473209', 'chizithomas@gmail.com', 'Joel Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-05', 'A4', 93.00, 'Paid', NULL, 'success', 'ik9xpwfw-926', NULL, '25458653067216', 'cQMnjCVWWUfpSit6MfBbXlD39NP7', 0, 0, NULL, '37', 6.30, 90.00, 0.70, 10.00, 0.00, '', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-08 07:27:30', '2025-06-08 10:28:32', 122, 'YR61988160', 21, 14, 18, NULL, '255755879793', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Dodoma', '2025-06-09', 'C1', 195.00, 'Failed', NULL, NULL, '06pg0dxj-292', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-08 07:32:25', '2025-06-08 10:33:22', 123, 'FZ68216428', 21, 14, 18, NULL, '255755879793', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Dodoma', '2025-06-09', 'D1', 195.00, 'Failed', NULL, NULL, 'dp86r68g-209', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-08 07:35:26', '2025-06-08 10:36:21', 124, 'NQ06314259', 21, 14, 18, NULL, '255755879793', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Dodoma', '2025-06-09', 'A1', 86.55, 'Paid', NULL, 'success', 'c1ez2fs3-492', NULL, '25791136580203', 'RIP6xSSrlO0rlkR289pTzzlc99Ms', 0, 0, NULL, '', 4.56, 103.90, 0.00, 0.00, 29.75, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-08 21:08:25', '2025-06-09 00:10:39', 125, 'MQ24701437', 3, 21, 25, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-09', 'B2', 196.61, 'Failed', NULL, NULL, 'nlf1jboc-828', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '123456', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-08 21:13:36', '2025-06-09 00:14:49', 126, 'TR33626049', 3, 21, 25, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-09', 'F2', 196.61, 'Failed', NULL, NULL, 'ka6ushqg-523', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '123456', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-08 21:19:15', '2025-06-09 00:20:07', 127, 'EL70897992', 3, 21, 25, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-09', 'E2', 150.85, 'Failed', NULL, NULL, '15ldl7sz-524', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '12345678', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-08 21:31:59', '2025-09-06 13:13:29', 128, 'PS47563681', 3, 21, 25, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-09', 'I2', 43.71, 'Cancel', NULL, 'success', 'sfdh3dt1-997', NULL, '25483218861794', 't2f9idqN8PyZFvBxhfRWEvcbLmrT', 0, 0, NULL, '', 3.29, 103.00, 0.00, 0.00, 22.88, '12345678', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-08 21:56:04', '2025-09-06 13:08:53', 129, 'DQ05131817', 3, 21, 25, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-09', 'E2', 87.46, 'Cancel', NULL, 'success', 'hilm11lc-115', NULL, '25899840876552', 'MD84V5AVa1cHuZ7WL51bynUzLqA4', 0, 0, NULL, '', 6.58, 103.96, 0.00, 0.00, 30.20, '7474140', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-11 13:24:49', '2025-06-11 16:25:46', 130, 'SP86898024', 13, 9, 13, NULL, '255755879793', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Musoma', 'Mwanza', '2025-06-11', 'A3', 150.00, 'Failed', NULL, NULL, 'mfu2i0gb-787', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-11 13:29:22', '2025-06-11 16:30:35', 131, 'OL10039448', 13, 9, 13, NULL, '255755879793', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Musoma', 'Mwanza', '2025-06-11', 'A2', 44.65, 'Paid', NULL, 'success', '7ktn7jac-199', NULL, '25558726548376', 'UYs4adFrtmm8ffL1c0oI7RZ81Vhc', 0, 0, NULL, '37', 2.12, 92.70, 0.24, 10.30, 22.88, NULL, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-11 14:38:23', '2025-06-11 17:39:11', 132, 'DJ99395522', 21, 28, 32, NULL, '255789473209', 'chizithomas@fmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dodoma', 'Dar es Salaam', '2025-06-11', 'A2', 92.13, 'Paid', NULL, 'success', 'shwq4y3f-108', NULL, '25358726051936', '6EIIiC6LG5S7R0WtOCLmVzmmbiGg', 0, 0, NULL, '', 4.85, 104.02, 0.00, 0.00, 30.66, '', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-12 08:57:48', '2025-06-12 11:58:34', 133, 'VW40566254', 3, 30, 34, NULL, '255789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Dodoma', '2025-06-12', 'A2', 43.71, 'Paid', NULL, 'success', 'vvgjo4qe-560', NULL, '25783345415739', 'xn99Boh4mMAPImDxZcDz85zWgRjb', 0, 0, NULL, '37', 2.96, 92.70, 0.33, 10.30, 22.88, '', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-12 09:24:54', '2025-06-12 12:26:00', 134, 'KB25948790', 3, 18, 22, NULL, '255755879793', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-12', 'B4', 3901.00, 'Failed', NULL, NULL, '64v4h7ix-362', NULL, NULL, NULL, 1, 3700, '2025-06-13', '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-12 09:29:51', '2025-06-12 12:30:48', 135, 'GC30989887', 3, 18, 22, NULL, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-12', 'A1', 3901.00, 'Failed', NULL, NULL, '772xb6gr-757', NULL, NULL, NULL, 1, 3700, '2025-06-13', '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-12 09:47:11', '2025-06-12 12:48:23', 136, 'VK28038356', 3, 18, 22, NULL, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-12', 'B1', 3901.00, 'Failed', NULL, NULL, '8i9a9zji-468', NULL, NULL, NULL, 1, 3700, '2025-06-13', '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-12 09:51:14', '2025-06-12 12:51:53', 137, 'SW69599444', 3, 18, 22, NULL, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-12', 'F3', 21.37, 'Paid', NULL, 'success', 'x1p7wxu7-452', NULL, '25658732067641', 'nPnfJssLhWtC0GJIqkOj28ArOmnk', 1, 3700, '2025-06-13', '37', 1.45, 160.22, 0.16, 17.80, 595.07, '', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-12 13:13:00', '2025-06-12 16:13:49', 138, 'QZ55446658', 21, 27, 31, NULL, '255717167353', 'panjapokea@gmail.com', 'Pokea Panja', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Morogoro', '2025-06-12', 'A2', 92.13, 'Paid', NULL, 'success', 'z7oc4gmt-750', NULL, '25791771933388', 'M0bFGMG5JoqycwgPxxqnkkvHy3ds', 0, 0, NULL, '37', 4.36, 93.62, 0.48, 10.40, 30.66, '', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-12 13:50:22', '2025-06-12 16:51:03', 139, 'YG69693222', 13, 9, 13, NULL, '255717167353', 'panjapokea@gmail.com', 'Pokea Panja', NULL, NULL, 0, NULL, 0, 0, NULL, 'Musoma', 'Mwanza', '2025-06-13', 'A1', 44.65, 'Paid', NULL, 'success', 'rbtp7zkt-492', NULL, '25658734968091', 'GVg68qp03X2zrA8vh6AVTQLGzEXG', 0, 0, NULL, '42', 2.12, 92.70, 0.24, 10.30, 22.88, '', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-13 19:03:37', '2025-06-13 22:03:46', 140, 'KZ80788130', 13, 9, 13, NULL, '255755879793', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Musoma', 'Mwanza', '2025-06-13', 'A2', 150.00, 'Failed', NULL, NULL, 'h9do25eh-433', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-13 19:08:57', '2025-06-13 22:09:47', 141, 'IW14204419', 3, 23, 27, NULL, '255789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Dodoma', '2025-06-13', 'B4', 150.00, 'Failed', NULL, NULL, 'anyx6s5k-608', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-13 19:14:09', '2025-06-13 22:14:54', 142, 'XZ84961088', 20, 19, 23, NULL, '255789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-13', 'B2', 282.06, 'Paid', NULL, 'success', 'fsq746kk-525', NULL, '25358746425351', 'FGzTlMTZAYulCrBVKA7uuk8Q4Jfg', 0, 0, NULL, '37', 13.36, 97.29, 1.48, 10.81, 61.78, '', 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-17 20:25:53', '2025-06-17 23:25:56', 143, 'FR38122329', 20, 19, 23, NULL, '255765553953', 'tchizi@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-17', 'A1', 405.00, 'Unpaid', NULL, NULL, 'uog4g84a-475', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-17 20:29:42', '2025-06-17 23:29:42', 144, 'CK88450241', 20, 19, 23, NULL, '255765553953', 'abunju@watuafrica.co.tz', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-17', 'D1', 405.00, 'Unpaid', NULL, NULL, 'ymqy2u9b-457', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-17 20:55:49', '2025-06-17 23:55:51', 145, 'IR63518851', 20, 19, 23, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-17', 'A1', 405.00, 'Unpaid', NULL, NULL, 'tmzfmbab-570', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-17 21:05:16', '2025-06-18 00:05:17', 146, 'RC30860083', 3, 18, 22, NULL, '255765553953', 'abunju@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-18', 'A1', 201.00, 'Unpaid', NULL, NULL, 'u8factuz-769', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-17 21:10:21', '2025-06-18 00:11:23', 147, 'JW76609301', 3, 18, 22, NULL, '255765553953', 'bunju@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-18', 'A1,B1,A4', 276.12, 'Paid', NULL, 'success', '036fv140-756', NULL, '25458778948121', 'uibU4Lw0Y40l3OhLLs4fQE8mlb6l', 0, 0, NULL, '', 20.78, 108.10, 0.00, 0.00, 61.78, '', 0.00, 627, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-17 22:49:54', '2025-06-18 01:49:57', 148, 'YF44369892', 20, 19, 23, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-18', 'G2', 405.00, 'Unpaid', NULL, NULL, 'to0gbnhr-395', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-18 20:39:42', '2025-06-18 23:40:29', 149, 'IL95008754', 20, 19, 23, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-18', 'B1', 282.06, 'Paid', NULL, 'success', '07xii3cz-902', NULL, '25291724939528', 'lGjhgrmeTcBgEMD9SVENdPdb0Bid', 0, 0, NULL, '', 14.85, 108.10, 0.00, 0.00, 61.78, '', 0.00, 626, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-19 01:29:40', '2025-06-19 04:30:26', 150, 'LF67217406', 3, 34, 38, NULL, '255755879793', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-19', 'A1', 276.12, 'Paid', NULL, 'success', 'lqrn7cic-814', NULL, '25199922712882', 'AiIbnl4eE96FQkqC06ppMOIPbxPc', 0, 0, NULL, '', 20.78, 108.10, 0.00, 0.00, 61.78, '', 0.00, 525, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-19 18:30:44', '2025-06-19 21:32:32', 151, 'ZE34990221', 3, 34, 38, NULL, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-19', 'A4', 405.00, 'Failed', NULL, NULL, 'ycy481va-707', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 525, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-19 18:35:57', '2025-06-19 21:36:41', 152, 'JS56675884', 3, 34, 38, NULL, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-19', 'A4', 405.00, 'Paid', NULL, 'success', 'dqittz0n-475', NULL, '25491732548548', 'P1EakxGc4dsKx3d5gSZLI0XHCvX6', 0, 0, NULL, '37', 12.71, 105.00, 0.00, 0.00, 45.76, '', 0.00, 525, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-19 19:16:24', '2025-06-19 22:17:17', 153, 'WH44292189', 3, 21, 25, NULL, '255765553953', 'abjuma0000@gmail.com', 'Abdul', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-19', 'B1', 201.00, 'Failed', NULL, NULL, 'senpvc33-357', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-19 19:19:58', '2025-06-19 22:23:25', 154, 'LD32885362', 3, 21, 25, NULL, '255765553953', 'abjuma0000@gmail.com', 'abdul', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-19', 'E1', 0.00, 'Paid', NULL, 'success', '6hqll359-994', NULL, '25599930633177', '5ZQ2gwBSMoscMiBLwQnrnLclAPuQ', 0, 0, NULL, '', 0.00, 201.00, 0.00, 0.00, 0.00, '', 0.00, 627, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-19 19:46:08', '2025-06-19 22:47:48', 155, 'PH51934424', 3, 21, 25, NULL, '255765553953', 'abjuma0000@gmail.com', 'abdul', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-19', 'A1', 40.25, 'Paid', NULL, 'success', 'gh411rnr-420', NULL, '25658795831296', 'RDRTt2FdAiCy6XPAol01UCWwlGAw', 0, 0, NULL, '', 2.12, 100.00, 0.00, 0.00, 7.63, '12345678', 50.00, 627, 50.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-19 20:09:29', '2025-06-19 23:10:44', 156, 'HE12676347', 3, 21, 25, NULL, '255765553953', 'abjuma0000@gmail.com', 'Abdul', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-19', 'A4', 80.51, 'Paid', NULL, 'success', 'pwrg41w8-219', NULL, '25558795974381', 'eA5Y5I2XAevaB0YkmqzrquLAGbFa', 0, 0, NULL, '37', 4.24, 101.00, 0.00, 0.00, 15.25, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-19 20:15:07', '2025-06-19 23:15:08', 157, 'HD70554599', 3, 21, 25, NULL, '255765553953', 'abjuma0000@gmail.com', 'Abdul', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-19', 'E4', 201.00, 'Unpaid', NULL, NULL, 'soniveb7-367', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-19 20:23:13', '2025-06-19 23:23:54', 158, 'QG79111873', 3, 21, 25, NULL, '255765553953', 'abjuma0000@gmail.com', 'Abdul', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-19', 'E4', 201.00, 'Failed', NULL, NULL, 'zovjtaj5-538', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-19 20:27:30', '2025-06-19 23:27:31', 159, 'YE40142536', 3, 21, 25, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-19', 'G2', 201.00, 'Unpaid', NULL, NULL, 'f7i4m6n2-118', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-19 20:39:19', '2025-06-19 23:39:19', 160, 'MM89922463', 3, 21, 25, NULL, '32e23r', '3r123r', 'retwer', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-19', 'K3', 201.00, 'Unpaid', NULL, NULL, 'fmqfva5m-345', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-19 21:03:38', '2025-06-20 00:03:40', 161, 'LR42797730', 3, 21, 25, NULL, '23414234', '3241234', 'retwer', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-19', 'L2', 201.69, 'Unpaid', NULL, NULL, 'bg2ecw24-514', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-19 21:06:46', '2025-06-20 00:06:47', 162, 'BS78627162', 3, 21, 25, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'J2', 201.69, 'Unpaid', NULL, NULL, 'jlizz7u6-515', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-19 21:13:56', '2025-06-20 00:13:56', 163, 'YH85895797', 3, 21, 25, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'J1', 202.00, 'Unpaid', NULL, NULL, 'mth5to1n-821', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 06:00:32', '2025-06-20 09:01:42', 164, 'TH58261408', 3, 33, 37, NULL, '255755879793', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-20', 'F4', 241.53, 'Paid', NULL, 'success', 'kezvt7ns-221', NULL, '25303986699240', 'suAQPEInR9T1gOfQ9tyYoZgqzod8', 1, 3700, '2025-06-21', '37', 12.71, 106.00, 0.00, 0.00, 45.76, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 07:59:46', '2025-06-20 10:59:48', 165, 'UZ25039998', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'B1', 150.00, 'Unpaid', NULL, NULL, 'rv83il5u-705', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '12345678', 50.00, 626, 50.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 08:03:26', '2025-06-20 11:03:27', 166, 'NI97636226', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'A1', 201.00, 'Unpaid', NULL, NULL, 'z8i0dvkg-745', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 08:08:27', '2025-06-20 11:08:40', 167, 'NU75408420', 3, 21, 25, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'K1', 201.00, 'Failed', NULL, NULL, 'rp0td5p4-831', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 08:10:40', '2025-06-20 11:10:51', 168, 'TP44570283', 3, 21, 25, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'K2', 201.00, 'Failed', NULL, NULL, 'gp2oezr2-374', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 08:13:05', '2025-06-20 11:13:06', 169, 'BZ16132815', 3, 21, 25, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'J1', 202.00, 'Unpaid', NULL, NULL, 'rbhvh2hd-601', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 08:17:09', '2025-06-20 11:18:02', 170, 'NQ95455344', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'A1', 151.00, 'Failed', NULL, NULL, 'pjyvisie-666', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '12345678', 50.00, 626, 50.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 08:28:14', '2025-06-20 11:28:48', 171, 'ER85769346', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'A1', 202.00, 'Failed', NULL, NULL, '7i012ynq-492', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '12345678', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 08:35:33', '2025-06-20 11:36:14', 172, 'EA30082544', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'A1', 80.51, 'Paid', NULL, 'success', 'sv8ozv3f-790', NULL, '25858797818496', 'VFGsW4EYmG1MlhHmCp0czo8ALRLM', 0, 0, NULL, '', 4.24, 102.00, 0.00, 0.00, 15.25, '12345678', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 09:28:03', '2025-06-20 12:28:47', 173, 'EK12084270', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'A4', 202.00, 'Failed', NULL, NULL, 'plxr069b-817', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 09:30:05', '2025-06-20 12:30:33', 174, 'NZ73339138', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'A4', 80.51, 'Paid', NULL, 'success', '8nlidlra-397', NULL, '25258798354231', 'uXWQhT2TzMAbAUUXjTBUgknCjZOG', 0, 0, NULL, '37', 3.81, 91.80, 0.42, 10.20, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 11:57:53', '2025-06-20 14:58:58', 175, 'OW82939581', 3, 34, 38, NULL, '255789473209', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Iringa', '2025-06-20', 'E4', 241.53, 'Paid', NULL, 'success', 'uvb0fv2o-232', NULL, '25358799671711', 'qMVytFtdDAL6N2y4l4xbWdmq2UtW', 1, 3700, '2025-06-21', '37', 11.44, 95.40, 1.27, 10.60, 45.76, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 19:33:25', '2025-06-20 22:34:35', 176, 'ED40011224', 3, 21, 25, NULL, '255765553953', 'abunju@watuafrica.co.tz', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'E1', 80.51, 'Paid', NULL, 'success', '0hrz715n-722', NULL, '25283316915399', 'tdh6HRFzPGj27GGGVSdll6xybVbx', 0, 0, NULL, '', 4.24, 102.00, 0.00, 0.00, 15.25, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 19:53:11', '2025-06-20 22:53:13', 177, 'PH86700831', 3, 21, 25, NULL, '255765553953', 'abunju@watuafrica.co.tz', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'M1', 202.00, 'Unpaid', NULL, NULL, 'h2973zfg-571', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 19:59:18', '2025-06-20 23:00:23', 178, 'IV14203350', 3, 21, 25, NULL, '255765553953', 'test@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'M1', 80.51, 'Paid', NULL, 'success', 'sspss7zh-919', NULL, '25183316168304', 'nLNTwxrPyfruLyL13rvpaStKoicK', 0, 0, NULL, '', 4.24, 102.00, 0.00, 0.00, 15.25, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 20:37:36', '2025-06-20 23:38:24', 179, 'ZQ24498935', 3, 21, 25, NULL, '255765553953', 'test@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-20', 'M4', 80.51, 'Paid', NULL, 'success', '82h1jgh6-325', NULL, '25599948121552', 'yWgke8O1RxTIogIGGytttAQ2J4gQ', 0, 0, NULL, '37', 3.81, 91.80, 0.42, 10.20, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 22:06:45', '2025-06-21 01:06:48', 180, 'JH46628722', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-22', 'G1', 202.00, 'Unpaid', NULL, NULL, 'esytlbya-592', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 22:32:17', '2025-06-21 01:32:19', 181, 'ZS74435431', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-21', 'F1', 202.00, 'Unpaid', NULL, NULL, 'lu9la99g-973', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 22:38:53', '2025-06-21 01:38:54', 182, 'RN90084581', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-21', 'C1', 202.00, 'Unpaid', NULL, NULL, '48pg5aij-878', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 22:47:29', '2025-06-21 01:47:42', 183, 'EZ88067563', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-21', 'M1', 202.00, 'Failed', NULL, NULL, '4srx0s7i-376', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 22:50:57', '2025-06-21 01:51:34', 184, 'AX15885611', 3, 21, 25, NULL, '715553803vil', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-21', 'F1', 51.42, 'Paid', NULL, 'success', 'j9o06jd3-762', NULL, '25583318888589', 'eu2BJLVzq6IoXe8QlNbkF76CWJUi', 0, 0, NULL, '', 0.41, 15.56, 0.00, 0.00, 45.87, '', 0.00, 627, 100.00, 2.29, 86.44, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 23:04:05', '2025-06-21 02:04:47', 185, 'AA76675751', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-21', 'A1', 80.51, 'Paid', NULL, 'success', 'j2ie56ab-708', NULL, '25491742295288', 'XQvRicyL3yLqyOn6q8yJJJY3Q07N', 0, 0, NULL, '', 3.59, 86.44, 0.00, 0.00, 15.25, '', 0.00, 627, 100.00, 0.65, 15.56, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 23:45:34', '2025-06-21 02:46:24', 186, 'LN63173068', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-21', 'M1', 80.51, 'Paid', NULL, 'success', '0nr53muk-695', NULL, '25791243769013', 'KP2jRrBmxervy2mZ8fMDPFZe1XPE', 0, 0, NULL, '', 4.24, 102.00, 0.00, 0.00, 15.25, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-20 23:51:17', '2025-06-21 02:52:00', 187, 'CA31212746', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-21', 'A4', 80.51, 'Paid', NULL, 'success', 'o6jmkae5-729', NULL, '25899941593702', 'G2Zbi4gkxDemA34WIyAEj2EnBTYh', 0, 0, NULL, '37', 3.23, 77.80, 0.36, 8.64, 15.25, '', 0.00, 0, 100.00, 0.65, 15.56, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 09:17:48', '2025-06-22 12:18:24', 188, 'MQ51295254', 3, 33, 37, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-22', 'I1', 406.00, 'Failed', NULL, NULL, '2ll9ls14-469', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 09:19:37', '2025-06-22 12:19:37', 189, 'LU61284252', 3, 33, 37, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-22', 'A1', 406.00, 'Unpaid', NULL, NULL, '0fwzsgsp-327', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 09:20:39', '2025-06-22 12:22:29', 190, 'RF95461695', 3, 33, 37, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-22', 'A1', 241.53, 'Paid', NULL, 'success', 'kair0w4m-396', NULL, '25791358100143', '6VEVFgCTl50ensEfGQtkgp1LLmXG', 0, 0, NULL, '37', 9.70, 80.85, 1.08, 8.98, 45.76, '', 0.00, 0, 300.00, 1.94, 16.17, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 10:13:57', '2025-06-22 13:14:39', 191, 'VJ30128878', 3, 33, 37, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-22', 'A4', 241.53, 'Paid', NULL, 'success', 'kq1zvu6c-650', NULL, '25103912485825', 'JeDGJrOdTgn5MKon3TKE4LRzYsPM', 0, 0, NULL, '37', 9.70, 80.08, 1.08, 8.90, 45.76, '', 0.00, 0, 300.00, 1.94, 16.02, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 10:26:03', '2025-06-22 13:26:35', 192, 'RG00776941', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-22', 'A1', 80.51, 'Paid', NULL, 'success', 'ol1d5oaa-303', NULL, '25899067696512', 'k2afhpGpDbBQiKaHh4SJVTbMGV1P', 0, 0, NULL, '', 4.24, 102.00, 0.00, 0.00, 15.25, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 10:30:36', '2025-06-22 13:30:37', 193, 'IB31062887', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-22', 'C1', 202.00, 'Unpaid', NULL, NULL, 'm21wysia-680', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 10:32:27', '2025-06-22 13:32:28', 194, 'FN22960347', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-22', 'E1', 202.00, 'Unpaid', NULL, NULL, 'ivhraiu0-271', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 10:40:24', '2025-06-22 13:40:24', 195, 'VO29408529', 3, 33, 37, NULL, NULL, NULL, 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-22', 'J2', 405.00, 'Unpaid', NULL, NULL, 'otzt1fhp-393', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 10:42:35', '2025-06-22 13:42:35', 196, 'YH69051133', 3, 33, 37, NULL, NULL, NULL, 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-22', 'D1', 405.00, 'Unpaid', NULL, NULL, '0iddqfft-297', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 10:47:37', '2025-06-22 13:47:37', 197, 'AH66729745', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-22', 'E1', 202.00, 'Unpaid', NULL, NULL, 'pk84g5lr-117', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 10:50:35', '2025-06-22 13:50:36', 198, 'HU33523840', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-06-22', 'G1', 202.00, 'Unpaid', NULL, NULL, 'vptu8v12-111', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 20:13:41', '2025-06-22 23:13:43', 199, 'RD83028053', 3, 33, 37, NULL, '255765553953', 'test@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-22', 'F1', 405.00, 'Unpaid', NULL, NULL, '13prjlrt-552', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 20:15:52', '2025-06-22 23:16:32', 200, 'FH13258403', 3, 33, 37, NULL, '255765553953', 'bunju@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-22', 'G1', 241.53, 'Paid', NULL, 'success', '3xyy0oqh-310', NULL, '25658827711731', 'dGAZs34AaAuo6zJx9QHMhYehOCMz', 0, 0, NULL, '37', 11.44, 94.50, 1.27, 10.50, 45.76, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 20:36:24', '2025-06-22 23:37:06', 201, 'KI99844848', 3, 33, 37, NULL, '255765553953', 'bunju@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-28', 'J1', 22605.00, 'Failed', NULL, NULL, 'kgn6xql1-347', NULL, NULL, NULL, 1, 22200, '2025-06-28', '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 20:46:05', '2025-06-22 23:46:06', 202, 'PC31377278', 3, 34, 38, NULL, '255765553953', 'test@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-28', 'I1', 1105.00, 'Unpaid', NULL, NULL, 'zn2s8umy-866', NULL, NULL, NULL, 1, 700, '2025-06-29', '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 21:08:53', '2025-06-23 00:08:54', 203, 'ZX94884916', 3, 34, 38, NULL, '255765553953', 'bunju@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-25', 'E1', 705.00, 'Unpaid', NULL, NULL, '5z8i6mg8-246', NULL, NULL, NULL, 1, 300, '2025-06-27', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 525, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 21:11:03', '2025-06-23 00:11:49', 204, 'AJ39253481', 3, 34, 38, NULL, '255765553953', 'bunju@gmail.com', 'thomas', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-25', 'E2', 241.53, 'Paid', NULL, 'success', '0vqcvqmo-721', NULL, '25199062721177', 'm5sFwGTi9gU4Yi2jqUU8G4pApAF0', 1, 300, '2025-06-27', '', 12.71, 105.00, 0.00, 0.00, 45.76, '', 0.00, 525, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-22 23:53:06', '2025-06-23 02:53:59', 205, 'TC74851131', 3, 34, 38, NULL, '255789473209', 'chizithomas@gmail.com', 'Daniel Thomas', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-25', 'A4', 241.53, 'Paid', NULL, 'success', '4noylpg7-307', NULL, '25803018862510', '8zeAamApEgKSr1l4mv1AmX69ejYR', 1, 100, '2025-06-25', '37', 11.44, 94.50, 1.27, 10.50, 45.76, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-24 09:29:59', '2025-06-24 12:30:46', 206, 'XF89179335', 3, 33, 37, NULL, '255765553953', 'test@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-24', 'A1', 241.53, 'Paid', NULL, 'success', 'nyjexwev-351', NULL, '25699081111477', 'NmJdvwGU74uQXF3awkEBtNCOkDNY', 0, 0, NULL, '', 12.71, 105.00, 0.00, 0.00, 45.76, '', 0.00, 525, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-24 09:38:31', '2025-06-24 12:39:14', 207, 'FF99493757', 3, 33, 37, NULL, '255765553953', 'test@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-24', 'F1', 241.53, 'Paid', NULL, 'success', 'hr3ax4a2-852', NULL, '25458847390406', 'sbTuDDUxGHmOKT4wZGAuKyR33AEp', 0, 0, NULL, '37', 11.44, 94.50, 1.27, 10.50, 45.76, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-24 09:57:10', '2025-06-24 12:58:00', 208, 'HN22258116', 3, 33, 37, NULL, '255765553953', 'bunju@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-06-24', 'D1', 241.53, 'Paid', NULL, 'success', 's4hbvp8g-435', NULL, '25203037482480', '8mU8GQMV1wwKeWFRqd7kkFuGCwQU', 0, 0, NULL, '', 12.71, 105.00, 0.00, 0.00, 45.76, '', 0.00, 525, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-25 22:42:58', '2025-06-26 01:44:42', 209, 'XG08098712', 3, 18, 22, NULL, '255789473209', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-26', 'B1', 100.00, 'Failed', NULL, NULL, 'yrv1jvnr-261', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-25 22:49:58', '2025-06-26 01:51:11', 210, 'LV03657897', 3, 18, 22, NULL, '255789473209', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-26', 'D1', 80.51, 'Paid', NULL, 'success', 'f1w01rj2-373', NULL, '25858863436536', 'yXnzv1jR7jdQwkBVbkOZ77c8p1n2', 0, 0, NULL, '', 4.24, 0.00, 0.00, 0.00, 15.25, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-30 13:47:57', '2025-06-30 16:49:41', 211, 'HC01491410', 3, 18, 22, NULL, '255789473209', 'chizithomas@gmail.com', 'Joel Thomas', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-06-30', 'C1', 80.51, 'Paid', NULL, 'success', 'ytci5nb6-424', NULL, '25199047907517', 'GFV2rMPGpAUU1Qu1riYpj1hYBipJ', 0, 0, NULL, '37', -101.69, -2448.00, 105.93, 2550.00, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-06-30 13:57:29', '2025-06-30 16:58:22', 212, 'BR33644954', 3, 18, 22, NULL, '255755879793', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-07-01', 'K2', 80.51, 'Paid', NULL, 'success', 'uu55ke2r-600', NULL, '25258802086821', 'N2JNSa7GuLqoRtYHWMRgTUSzjMeR', 1, 300, '2025-07-01', '37', -101.69, -2448.00, 105.93, 2550.00, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-01 10:47:36', '2025-07-01 13:48:48', 213, 'VO38129748', 3, 18, 22, NULL, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-07-01', 'D2', 80.51, 'Paid', NULL, 'success', 'wbbasgdo-388', NULL, '25603090870030', 'AjAaWqlHqbGOWPanGYZVKGr4O2gi', 0, 0, NULL, '37', -38.14, -918.00, 42.37, 1020.00, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-02 08:46:28', '2025-07-02 11:47:08', 214, 'BR06804068', 3, 33, 37, NULL, '255789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-07-02', 'B1', 241.53, 'Paid', NULL, 'success', 'gly1hxqc-299', NULL, '25591455434903', 'rUmu6GJr7jwxQNSGfHV6Nzpb45ns', 0, 0, NULL, '37', -305.08, -2520.00, 317.80, 2625.00, 45.76, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-02 09:22:11', '2025-07-02 12:22:14', 215, 'FM58529439', 3, 33, 37, NULL, '255755879793', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-07-02', 'A2', 405.00, 'Unpaid', NULL, NULL, 'cdkmz3b0-332', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 525, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-02 09:25:39', '2025-07-02 12:25:41', 216, 'XI65270149', 3, 33, 37, NULL, '255789473209', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-07-02', 'B2', 405.00, 'Unpaid', NULL, NULL, 'ue98vd2j-777', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 525, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-02 09:29:39', '2025-07-02 12:29:40', 217, 'XA66084517', 3, 34, 38, NULL, '255789473209', 'info@hisgc.co.tz', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-07-02', 'A2', 405.00, 'Unpaid', NULL, NULL, '0xcy76ap-503', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 525, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-03 09:22:38', '2025-07-03 12:23:35', 218, 'KD87102047', 13, 9, 13, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Musoma', 'Mwanza', '2025-07-03', 'G2', 151.00, 'Failed', NULL, NULL, '5xt88oxi-532', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 220, 50.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-03 09:30:24', '2025-07-03 12:30:36', 219, 'SG60424892', 13, 9, 13, NULL, '622521917', 'restaurant@example.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Musoma', 'Mwanza', '2025-07-03', 'G2', 151.00, 'Failed', NULL, NULL, '0onj6imw-386', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 220, 50.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-03 09:32:43', '2025-07-03 12:33:32', 220, 'EU89259285', 13, 9, 13, NULL, '622521917', 'restaurant@example.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Musoma', 'Mwanza', '2025-07-03', 'C2', 551.00, 'Failed', NULL, NULL, 'mtjeisps-426', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 220, 50.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-03 09:50:49', '2025-07-03 12:51:28', 221, 'GD29508080', 13, 9, 13, NULL, '622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Musoma', 'Mwanza', '2025-07-03', 'F2', 151.00, 'Failed', NULL, NULL, 'yxlqsd6j-711', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 50.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-03 21:06:52', '2025-07-04 00:06:53', 222, 'PT70092022', 3, 33, 37, NULL, '255789473209', 'info@hisgc.co.tz', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-07-04', 'A1', 405.00, 'Unpaid', NULL, NULL, 'l2pie5f1-736', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-03 21:10:40', '2025-07-04 00:11:51', 223, 'ZU42454048', 3, 33, 37, NULL, '255789473209', 'info@hisgc.co.tz', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-07-04', 'B2', 241.53, 'Paid', NULL, 'success', 'g5ot2hul-955', NULL, '25491971907478', 'dcOknMANr4cZHjgRojkFw2vz3x6u', 0, 0, NULL, '37', -305.08, -2520.00, 317.80, 2625.00, 45.76, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-04 06:13:09', '2025-07-04 09:13:13', 224, 'BK60398599', 3, 33, 37, NULL, '255789473209', 'chizithomas@gmail.com', 'Thomas Paul', NULL, NULL, 0, NULL, 0, 0, NULL, 'Iringa', 'Dar es Salaam', '2025-07-04', 'B3', 405.00, 'Unpaid', NULL, NULL, 'g99fsrrw-184', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-04 07:10:05', '2025-07-04 10:10:06', 225, 'PM86780916', 13, 9, 13, NULL, '715553803', 'abjuma0000@gmail.com', 'Abdul', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Musoma', '2025-07-04', 'A2', 151.00, 'Unpaid', NULL, NULL, 'rilmg7dg-517', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 50.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-04 07:14:06', '2025-07-04 10:14:07', 226, 'VR34228527', 13, 9, 13, NULL, '255765553953', 'abjuma0000@gmail.com', 'Abdul', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Musoma', '2025-07-04', 'C1', 151.00, 'Unpaid', NULL, NULL, '59m0zt74-437', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 220, 50.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-04 12:16:18', '2025-07-04 15:17:14', 227, 'LA30775705', 3, 21, 25, NULL, '622521917', 'doniaparoma99@gmail.com', 'asnat', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-07-12', 'C4', 56032.00, 'Failed', NULL, NULL, 'mrk0oj5s-823', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 55000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-06 00:18:21', '2025-07-06 03:18:24', 228, 'LH38694941', 13, 9, 13, NULL, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Musoma', '2025-07-06', 'B1', 151.00, 'Unpaid', NULL, NULL, 'q8ng6hyw-785', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 50.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-06 06:43:18', '2025-07-06 09:44:20', 229, 'GI13630387', 13, 9, 13, NULL, '255789473209', 'chizithomas@gmail.comm', 'Joel Thomas', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Musoma', '2025-07-06', 'C4', 40.25, 'Paid', NULL, 'success', '5pm7xmbz-912', NULL, '25691490599333', 'ty0n0IBG0pDdf3Jhb9Wy4sRG7X7W', 0, 0, NULL, '37', -50.85, -2424.00, 52.97, 2525.00, 7.63, '', 0.00, 0, 50.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-06 06:50:28', '2025-07-06 09:52:30', 230, 'EK38488175', 13, 9, 13, NULL, '255755879793', NULL, 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Musoma', '2025-07-06', 'A1', 151.00, 'Failed', NULL, NULL, 'sjx7yc1l-987', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 220, 50.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-06 06:57:14', '2025-07-06 09:57:55', 231, 'LG38950698', 13, 9, 13, NULL, '255755879793', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Musoma', '2025-07-06', 'C2', 151.00, 'Failed', NULL, NULL, 'bnktu6ii-809', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 220, 50.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-06 07:06:52', '2025-07-06 10:08:56', 232, 'DV81106045', 13, 9, 13, NULL, '255755879793', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Musoma', '2025-07-06', 'C1', 202.00, 'Failed', NULL, NULL, 'hnb51yjp-536', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 220, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bookings` (`created_at`, `updated_at`, `id`, `booking_code`, `campany_id`, `bus_id`, `route_id`, `schedule_id`, `customer_phone`, `customer_email`, `customer_name`, `gender`, `age`, `infant_child`, `age_group`, `has_excess_luggage`, `excess_luggage_fee`, `user_id`, `pickup_point`, `dropping_point`, `travel_date`, `seat`, `amount`, `payment_status`, `resaved_until`, `trans_status`, `transaction_ref_id`, `external_ref_id`, `mfs_id`, `verification_code`, `bima`, `bima_amount`, `insuranceDate`, `vender_id`, `fee`, `service`, `vender_fee`, `vender_service`, `vat`, `discount`, `discount_amount`, `distance`, `busFee`, `fee_vat`, `service_vat`, `bima_vat`, `payment_method`, `tra_status`, `tra_rct_num`, `tra_z_num`, `tra_vnum`, `tra_qr_url`, `tra_response`, `tra_error`) VALUES
('2025-07-06 07:11:35', '2025-07-06 10:12:10', 233, 'TI26249392', 13, 9, 13, NULL, '255755879793', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Musoma', '2025-07-06', 'C1', 80.51, 'Paid', NULL, 'success', 'amc2y9r0-621', NULL, '25383566607079', 'WmM8GqB6GmvKF9lG6PrpEnbG6PO3', 0, 0, NULL, '', 4.24, 102.00, 0.00, 0.00, 15.25, '', 0.00, 220, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-06 08:26:38', '2025-07-06 11:28:13', 234, 'LH60545206', 13, 9, 13, NULL, '765553953', 'admin@bishtelecom.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Musoma', '2025-07-06', 'A1', 80.51, 'Paid', NULL, 'success', 'ct3afj1q-660', NULL, '25483566219024', 'AAgeOAUX0NYmT8YxjNeaerz5XHUY', 0, 0, NULL, '37', -101.69, -2448.00, 105.93, 2550.00, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-06 08:32:20', '2025-07-06 11:33:12', 235, 'XX72401065', 13, 9, 13, NULL, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Musoma', '2025-07-06', 'B3', 80.51, 'Paid', NULL, 'success', 'cm6hpn03-537', NULL, '25699198258947', 'wxmjfmfChZwSpRVqZsMJJRL95McY', 0, 0, NULL, '37', -101.69, -2448.00, 105.93, 2550.00, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-12 05:45:33', '2025-07-12 08:45:34', 236, 'FC09055912', 13, 32, 36, NULL, '255789473209', NULL, 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-12', 'H1', 202.00, 'Unpaid', NULL, NULL, 'apbrjo5v-524', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 205, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-12 07:54:53', '2025-07-12 10:54:54', 237, 'TF72884181', 13, 32, 36, NULL, '255755879793', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-12', 'B1', 202.00, 'Unpaid', NULL, NULL, '7lxu1t3t-850', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 205, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-13 17:44:00', '2025-07-13 20:44:03', 238, 'TB04019904', 3, 21, 25, NULL, '715553803', 'abjuma0000@gmail.com', 'Abdul', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-13', 'C1', 56032.00, 'Unpaid', NULL, NULL, 'xw7wp7gg-743', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 55000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-18 10:31:29', '2025-07-18 13:31:31', 239, 'PJ38437429', 13, 9, 13, NULL, '255622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Musoma', 'Mwanza', '2025-07-30', 'H1', 202.00, 'Unpaid', NULL, NULL, 't9sycwzf-942', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-18 10:50:00', '2025-07-18 13:50:03', 240, 'HE78968103', 13, 9, 13, NULL, '255622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Musoma', 'Mwanza', '2025-07-30', 'F1', 202.00, 'Unpaid', NULL, NULL, 'z36c65lg-570', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-18 10:51:56', '2025-07-18 13:51:56', 241, 'SG31646935', 13, 9, 13, NULL, '255622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-30', 'F2', 202.00, 'Unpaid', NULL, NULL, '2l2cdx2e-976', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 220, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-18 10:51:56', '2025-07-18 13:51:56', 242, 'XU82126462', 13, 9, 13, NULL, '255622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-30', 'F2', 202.00, 'Unpaid', NULL, NULL, 'mii6w597-793', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 220, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-18 22:12:28', '2025-07-19 01:12:32', 243, 'PY64828456', 3, 21, 25, NULL, '255789473209', 'chizithomas@gmail.com', 'Thomas Paul', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-19', 'D1', 202.00, 'Unpaid', NULL, NULL, 'hb8t3swn-450', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-19 01:29:08', '2025-07-19 04:29:09', 244, 'OE83375293', 3, 21, 25, NULL, '255789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Shekilango', 'Moshi', '2025-07-19', 'A1,A2', 202.00, 'Unpaid', NULL, NULL, '13nbq55w-729', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-19 01:36:48', '2025-07-19 04:36:49', 245, 'NL46796468', 3, 21, 25, NULL, '255789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-19', 'C4', 202.00, 'Unpaid', NULL, NULL, 'yo7t72nh-101', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-19 08:59:27', '2025-07-19 15:02:45', 246, 'IA56814636', 13, 9, 13, NULL, NULL, NULL, 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-30', 'E2', 202.00, 'Failed', NULL, NULL, 'rphvtzrw-733', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 220, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-19 12:03:52', '2025-07-19 15:06:01', 247, 'TV13936591', 13, 9, 13, NULL, '622521917', 'doniaparoma99@gmail.com', 'asnat', NULL, NULL, 0, NULL, 0, 0, NULL, 'Musoma', 'Mwanza', '2025-07-30', 'D2', 202.00, 'Failed', NULL, NULL, 'rmiurs24-614', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 220, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-19 15:00:37', '2025-07-19 18:00:40', 248, 'AP03783050', 21, 26, 30, NULL, '255789473209', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Kihonda', 'MOSHI MJINI', '2025-07-19', 'B2', 192.00, 'Unpaid', NULL, NULL, '4u85ka4d-749', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 90.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-20 02:34:34', '2025-07-20 05:34:36', 249, 'KD43477006', 3, 18, 22, NULL, '255789473209', 'chizithomas@gmail.com', 'Thomas Paul', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 'Kibaha', '2025-07-20', 'A1', 202.00, 'Unpaid', NULL, NULL, 'qmneglrh-777', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-20 04:31:20', '2025-07-20 07:31:22', 250, 'TR81216346', 3, 18, 22, NULL, '255715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-20', 'A1', 202.00, 'Unpaid', NULL, NULL, 'vvq9ba5w-167', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-21 11:26:55', '2025-07-21 14:26:57', 251, 'HD51156925', 3, 21, 25, NULL, '255715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-21', 'D1', 202.00, 'Unpaid', NULL, NULL, 'jj4wcf59-727', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-21 11:51:34', '2025-07-21 14:51:37', 252, 'SQ89834830', 3, 21, 25, NULL, '789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-07-21', 'B1', 202.00, 'Unpaid', NULL, NULL, 'bwb0h5pq-707', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-21 12:06:58', '2025-07-21 15:07:00', 253, 'MR99113471', 21, 27, 31, NULL, '255789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Pumuani', 'Msamvu', '2025-07-21', 'C1', 202.00, 'Unpaid', NULL, NULL, '4e2l2051-960', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 669, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-21 14:17:52', '2025-07-21 17:17:54', 254, 'NY79675204', 13, 9, 13, NULL, '255622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-30', 'D2', 202.00, 'Unpaid', NULL, NULL, '7m75h7ca-654', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 220, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-21 15:52:03', '2025-07-22 09:11:10', 255, 'JQ44443850', 3, 23, 27, NULL, '780473209', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Mwanza', 'Dodoma', '2025-07-21', 'A2', 80.51, 'Paid', NULL, 'success', 'f5yvo3vk-403', NULL, 'MFS987654', 'VER123', 0, 0, NULL, '37', -101.69, -2448.00, 105.93, 2550.00, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-22 03:25:08', '2025-07-22 06:25:09', 256, 'UU31775916', 3, 18, 22, NULL, '255715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-22', 'A1', 202.00, 'Unpaid', NULL, NULL, 'z8vjtgyd-889', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-22 05:20:58', '2025-07-22 08:21:00', 257, 'TB69164356', 3, 18, 22, NULL, '255715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-22', 'A1', 202.00, 'Unpaid', NULL, NULL, 'hn9tar9z-169', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-22 05:36:12', '2025-07-22 09:05:37', 258, 'PR75725840', 3, 18, 22, NULL, '255715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-22', 'A1', 80.51, 'Paid', NULL, 'success', 'zngbk5pj-960', NULL, 'MFS987654', 'VER123', 0, 0, NULL, '', 4.24, 102.00, 0.00, 0.00, 15.25, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-22 06:59:32', '2025-07-22 09:59:35', 259, 'AZ70795535', 3, 18, 22, NULL, '255715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-22', 'A2', 202.00, 'Unpaid', NULL, NULL, 'dzf2f59e-870', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-22 07:12:50', '2025-07-22 19:36:00', 260, 'AG05811006', 3, 18, 22, NULL, '255789473209', 'chizithomas@gmail.com', 'Christina', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-07-22', 'A2', 80.51, 'Paid', NULL, 'success', 'f3im2uoo-556', NULL, 'MFS987654', 'VER123', 0, 0, NULL, '37', -101.69, -2448.00, 105.93, 2550.00, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-22 11:42:08', '2025-07-22 14:42:11', 261, 'XQ61726845', 3, 18, 22, NULL, '255789473209', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 'Mlandizi', '2025-07-22', 'A3', 202.00, 'Unpaid', NULL, NULL, 'f6u2ink2-931', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-22 11:58:19', '2025-07-22 14:58:19', 262, 'SY98998973', 3, 21, 25, NULL, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Shekilango', 'Pumuani', '2025-07-22', 'F4', 202.00, 'Unpaid', NULL, NULL, '7k0g74rn-612', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-22 19:47:21', '2025-07-22 22:48:46', 263, 'LG20121420', 13, 9, 13, NULL, '622521917', 'restaurant@example.com', 'asnat', NULL, NULL, 0, NULL, 0, 0, NULL, 'Musoma', 'Mwanza', '2025-07-30', 'F2', 80.51, 'Paid', NULL, 'success', '85j8cet7-403', NULL, '25183738601329', 'xxvUoaQmvWer9Jn6zhJESxfuSoaf', 0, 0, NULL, '', 4.24, 102.00, 0.00, 0.00, 15.25, '', 0.00, 220, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-22 20:49:42', '2025-07-22 23:50:30', 264, 'MU38720079', 21, 26, 30, NULL, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Morogoro', '2025-07-22', 'E2', 80.51, 'Paid', NULL, 'success', 'wlks2d58-793', NULL, '25691162068098', '7QpzbSSxEUsMEENNnAeJrKRyTOKe', 0, 0, NULL, '37', -101.69, -2448.00, 105.93, 2550.00, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-24 16:16:13', '2025-07-24 19:16:15', 265, 'JV46936792', 3, 18, 22, NULL, '255789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-24', 'A1', 202.00, 'Unpaid', NULL, NULL, '9y1b432y-607', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-24 16:27:01', '2025-07-24 19:27:01', 266, 'CK23220092', 3, 18, 22, NULL, '255715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-24', 'A1', 202.00, 'Unpaid', NULL, NULL, '459tuqpd-578', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-24 16:52:27', '2025-07-24 19:53:23', 267, 'TZ61752918', 3, 21, 25, NULL, '255789473209', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-07-24', 'C2', 80.51, 'Paid', NULL, 'success', 'w8vjppdm-607', NULL, '25258130225116', 'IPGFVxoCEKfuAyey11eA2FhUtoa2', 0, 0, NULL, '37', -101.69, -2448.00, 105.93, 2550.00, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-24 17:02:11', '2025-07-24 20:03:00', 268, 'NI22242006', 3, 18, 22, NULL, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-24', 'B3', 80.51, 'Paid', NULL, 'success', '7dxfty70-920', NULL, '25983744449579', 'SMxppOO6w2vgbkPlBNd9nslQikCx', 0, 0, NULL, '', 4.24, 102.00, 0.00, 0.00, 15.25, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-28 06:57:20', '2025-07-28 09:58:27', 269, 'GV63290212', 3, 21, 25, NULL, '789473209', 'chizithomas@gmail.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-07-28', 'A2', 80.51, 'Paid', NULL, 'success', 'ucsu713a-572', NULL, '25303359687400', 'smW26W7fgUJgJ6JlaYjGN2xWsv0L', 0, 0, NULL, '37', -101.69, -2448.00, 105.93, 2550.00, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-28 18:28:50', '2025-07-28 21:29:25', 270, 'FJ20005269', 3, 21, 25, NULL, '255765553953', 'abdul.it@bishtelecom.com', 'Thomas Chizi', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-28', 'A1', 80.51, 'Paid', NULL, 'success', 'b1eqvu8b-362', NULL, '25991613541503', 'I9w5EOQ3R5xv5NXVUDaQrXBRq8e7', 0, 0, NULL, '', 4.24, 102.00, 0.00, 0.00, 15.25, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-28 19:22:04', '2025-07-28 22:22:06', 271, 'KB95877557', 3, 21, 25, NULL, '255715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-28', 'B1', 202.00, 'Unpaid', NULL, NULL, '78xssaxm-212', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-28 19:27:57', '2025-07-28 22:28:37', 272, 'JJ46193584', 3, 21, 25, NULL, '255715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-07-28', 'M1', 80.51, 'Paid', NULL, 'success', '607ijkho-570', NULL, '25891613025493', 'ki6joA4mJTdJ8FtihdPy181NQwX0', 0, 0, NULL, '37', 3.18, 76.50, 1.06, 25.50, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-29 11:39:27', '2025-07-29 14:39:29', 273, 'PC85644855', 3, 18, 22, NULL, '789473209', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-07-29', 'A2', 202.00, 'Unpaid', NULL, NULL, 'bol0400p-145', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-29 11:42:37', '2025-07-29 14:43:16', 274, 'TI22448746', 3, 18, 22, NULL, '789473209', 'chizithomas@gmail.com', 'Christina Ekarist', NULL, NULL, 0, NULL, 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-07-29', 'A1', 80.51, 'Paid', NULL, 'success', 'ckytb42k-186', NULL, '25999315511122', '8eA24f1jUXlUNvrUnNHIgLjFgntn', 0, 0, NULL, '37', 2.54, 61.20, 1.69, 40.80, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-29 12:40:12', '2025-07-29 15:40:54', 275, 'AT07304180', 3, 33, 37, NULL, '789473209', 'chizithomas@gmail.com', 'Rhoda Peter', NULL, NULL, 0, NULL, 0, 0, NULL, 'mbezi', 'Kilimanjaro offices', '2025-07-29', 'C1', 402.54, 'Paid', NULL, 'success', '6wg061ps-619', NULL, '25691117419188', 'iyMvGCl16VDWY9J3GEKGACvAbq20', 0, 0, NULL, '37', 12.71, 64.80, 8.47, 43.20, 76.27, '', 0.00, 0, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-30 08:56:20', '2025-07-30 11:56:55', 276, 'OV01524598', 3, 36, 40, NULL, '255753020945', 'chizithomas@gmail.com', 'Abdul Bunju', NULL, NULL, 0, NULL, 0, 0, NULL, 'Banana', 'Mpakani', '2025-07-31', 'F2', 241.53, 'Paid', NULL, 'success', 'iajhfahz-783', NULL, '25299322181972', 'JvfB5oQdxqaF3mutM2MSzpZTjW2u', 0, 0, NULL, '37', 7.63, 63.00, 5.08, 42.00, 45.76, '', 0.00, 0, 300.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-31 19:45:56', '2025-07-31 22:45:58', 277, 'GD71522461', 3, 18, 22, NULL, '255715553803', 'abjuma0000@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-07-31', 'A1', 202.00, 'Unpaid', NULL, NULL, 'bux7m4yq-550', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-07-31 20:05:07', '2025-08-31 19:28:03', 278, 'OE95670403', 3, 21, 25, NULL, '255715553803', 'smoker@gmail.com', 'kombo jeuri', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-09-02', 'K4', 80.51, 'Cancel', NULL, 'success', 'tiwtyob1-216', NULL, '25199348847487', 'yEglYm7BpxBQ5BTpLuKxUgDyJPVE', 0, 0, NULL, '', 4.24, 102.00, 0.00, 0.00, 15.25, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-02 19:28:06', '2025-08-02 22:28:06', 279, 'GA51650572', 3, 33, 37, NULL, '255622521917', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-08-03', 'I2,I1', 1117.00, 'Unpaid', NULL, NULL, 'xnd5h9k3-844', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 525, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-25 10:17:56', '2025-08-25 13:17:56', 285, 'UT79996743', 3, 21, 25, NULL, NULL, NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-08-26', 'L2', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-25 10:16:46', '2025-08-25 13:16:46', 284, 'AR35638411', 3, 21, 25, NULL, NULL, NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-08-26', 'L2', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-25 10:14:55', '2025-08-25 13:14:55', 283, 'AC34127046', 3, 21, 25, NULL, '628042409', NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-08-26', 'L2', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-25 10:25:55', '2025-08-25 13:25:55', 286, 'SU31135281', 3, 21, 25, NULL, NULL, NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, '2025-08-26', 'L2', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-25 10:27:59', '2025-08-25 13:27:59', 287, 'FD78493294', 3, 21, 25, NULL, NULL, NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, NULL, NULL, '2025-08-26', 'L2', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-25 11:59:04', '2025-08-25 14:59:04', 288, 'YB47164908', 9, 37, 41, NULL, NULL, NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, NULL, NULL, '2025-08-25', 'J2', 121.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 20.18, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-31 18:00:58', '2025-08-31 21:00:58', 289, 'RB47971946', 3, 21, 25, NULL, NULL, NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-02', 'L3', 194.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 92.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-31 18:03:47', '2025-08-31 21:03:47', 290, 'LS24709091', 3, 21, 25, NULL, NULL, NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-02', 'L3', 194.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 92.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-31 18:04:16', '2025-08-31 21:04:16', 291, 'HV88304070', 3, 21, 25, NULL, NULL, NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-02', 'L3', 194.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 92.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-31 18:05:17', '2025-08-31 21:05:17', 292, 'VX74416919', 3, 21, 25, NULL, NULL, NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-02', 'L3', 194.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 92.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-31 18:36:04', '2025-08-31 21:36:04', 293, 'FA33063546', 3, 21, 25, NULL, NULL, NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-02', 'L3', 194.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 92.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-31 18:37:22', '2025-08-31 21:37:22', 294, 'WM06845455', 3, 21, 25, NULL, NULL, NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-02', 'L3', 194.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 92.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-31 20:02:02', '2025-08-31 23:02:02', 295, 'SG00710703', 3, 21, 25, NULL, NULL, NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-02', 'L3', 194.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 92.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-31 20:04:13', '2025-08-31 23:04:13', 296, 'LS40474621', 3, 21, 25, NULL, NULL, NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-02', 'L3', 194.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 92.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-31 20:05:39', '2025-08-31 23:05:39', 297, 'BI99621894', 3, 21, 25, NULL, NULL, NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-02', 'L3', 194.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 92.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-31 20:11:24', '2025-08-31 23:11:24', 298, 'AF24402644', 3, 21, 25, NULL, NULL, NULL, 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-02', 'L3', 194.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 92.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-31 20:12:31', '2025-09-13 13:18:56', 299, 'BD40449747', 3, 21, 25, NULL, '0676942409', 'doniaparoma99@gmail.com', 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-02', 'L3', 74.07, 'Refund', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 3.90, 102.00, 0.00, 0.00, 14.03, '', 0.00, 626, 92.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-31 20:16:13', '2025-09-13 13:11:04', 300, 'BR60730339', 3, 21, 25, NULL, '628042409', 'doniaparoma99@gmail.com', 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-02', 'L2', 74.07, 'Refund', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 3.90, 102.00, 0.00, 0.00, 14.03, '', 0.00, 626, 92.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-08-31 20:40:44', '2025-09-13 13:53:26', 301, 'ER42839017', 3, 21, 25, NULL, '628042409', 'doniaparoma99@gmail.com', 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-02', 'L1', 74.07, 'Refund', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 3.90, 102.00, 0.00, 0.00, 14.03, '', 0.00, 626, 92.00, 0.00, 0.00, 0.00, 'cash', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-03 09:13:11', '2025-09-03 13:31:56', 302, 'RT97552433', 3, 21, 25, NULL, '628042409', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-03', 'L2', 74.07, 'Cancel', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 3.90, 102.00, 0.00, 0.00, 14.03, '', 0.00, 626, 92.00, 0.00, 0.00, 0.00, 'cash', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-03 10:34:26', '2025-09-13 13:05:27', 303, 'QM13141280', 3, 21, 25, NULL, '628042409', 'doniaparoma99@gmail.com', 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-03', 'K2', 26.57, 'Refund', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 1.40, 101.00, 0.00, 0.00, 5.03, '', 0.00, 626, 33.00, 0.00, 0.00, 0.00, 'cash', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-04 11:03:04', '2025-09-13 13:04:40', 304, 'PY31492270', 3, 21, 25, NULL, '628042409', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-04', 'L1', 80.51, 'Refund', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 4.24, 101.00, 0.00, 0.00, 15.25, '', 0.00, 626, 33.00, 0.00, 0.00, 0.00, 'cash', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-04 11:05:58', '2025-09-04 14:24:59', 305, 'LM87505856', 3, 21, 25, NULL, '628042409', 'doniaparoma99@gmail.com', 'retwer', NULL, NULL, 0, NULL, 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-04', 'B1', 80.51, 'Cancel', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '52', 4.24, 101.00, 0.00, 0.00, 15.25, '', 0.00, 626, 33.00, 0.00, 0.00, 0.00, 'cash', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-06 08:55:51', '2025-09-06 11:55:51', 306, 'ZP34918395', 3, 21, 25, NULL, '628042409', 'doniaparoma99@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-09-15', 'F1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-06 09:05:53', '2025-09-29 23:53:27', 307, 'TX67590621', 3, 21, 25, NULL, '628042409', 'doniaparoma99@gmail.com', 'ibrahimu', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-09-15', 'F1', 80.51, 'Refund', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 2.54, 61.20, 1.69, 40.80, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, 'cash', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-06 09:09:23', '2025-09-06 12:09:23', 308, 'EB14677472', 3, 21, 25, NULL, '628042409', NULL, 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-09-15', 'F1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-06 09:09:28', '2025-09-06 12:09:29', 309, 'YG31434703', 3, 21, 25, NULL, '628042409', NULL, 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-09-15', 'F1', 80.51, 'Paid', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 2.54, 61.20, 1.69, 40.80, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, 'cash', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-11 20:25:28', '2025-09-13 13:01:05', 310, 'EI68177357', 3, 21, 25, NULL, '628042409', 'smoker@gmail.com', 'retwer', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-09-15', 'J1', 80.51, 'Refund', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 2.54, 61.20, 1.69, 40.80, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, 'cash', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-11 20:33:57', '2025-09-11 23:39:32', 311, 'FG50112822', 3, 21, 25, 739, '628042409', 'smoker@gmail.com', 'ibrahim', NULL, NULL, 0, NULL, 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-09-15', 'L2', 80.51, 'Cancel', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 2.54, 61.20, 1.69, 40.80, 15.25, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, 'cash', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-22 13:42:12', '2025-09-22 16:42:12', 312, 'RH89013689', 3, 21, 25, 741, NULL, NULL, 'ibrahim', 'Male', 19, 0, 'Adult', 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-30', 'J1', 128.00, 'resaved', '2025-09-23 13:42:12', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 28.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-29 19:43:23', '2025-09-29 22:43:23', 313, 'XF08371765', 3, 21, 25, 741, '628042409', 'doniaparoma99@gmail.com', 'ibrahim', 'Male', 23, 0, 'Adult', 0, 0, 52, 'Dar es Salaam', 'Arusha', '2025-09-30', 'G1', 128.00, 'resaved', '2025-09-30 19:43:23', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 28.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-29 20:09:10', '2025-10-05 00:19:49', 314, 'GR69450669', 3, 21, 25, 741, NULL, NULL, 'ibrahim', 'Male', 23, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-09-30', 'J2', 100.00, 'Unpaid', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 101.69, 0.00, 1.99, 40.80, 0.50, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-09-29 20:20:29', '2025-09-29 23:39:45', 315, 'OQ99107963', 3, 21, 25, 742, '624546789', 'doniaparoma99@gmail.com', 'ibrahim', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-10-11', 'J1', 94.53, 'Cancel', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 2.99, 61.20, 1.99, 40.80, 0.50, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, 'cash', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-10 14:01:32', '2025-10-10 17:01:32', 316, 'HA59211156', 3, 21, 25, 742, '789473209', 'chizithomas@gmail.com', 'Thomas Chizi', 'Male', 47, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-10-11', 'A40', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-13 11:07:30', '2025-10-13 14:07:30', 317, 'HS05752915', 3, 21, 25, 742, NULL, NULL, 'retwer', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-10-15', 'A15', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-16 11:53:19', '2025-10-16 14:53:19', 318, 'BN10237402', 3, 21, 25, 742, '255696646570', 'doniaparoma99@gmail.com', 'retwer', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-10-17', 'A16', 94.53, 'Paid', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 2.99, 61.20, 1.99, 40.80, 0.50, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, 'cash', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-16 12:17:09', '2025-10-16 15:17:09', 319, 'PH69920322', 3, 21, 25, 742, '255696646570', 'doniaparoma99@gmail.com', 'pop', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-10-17', 'A28', 95.00, 'Paid', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 3.00, 61.20, 2.00, 40.80, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, 'cash', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-17 21:24:16', '2025-10-18 00:24:16', 320, 'MH97504507', 3, 21, 25, 741, '255696646570', 'doniaparoma99@gmail.com', 'retwer', 'Male', 23, 0, 'Adult', 0, 0, 0, 'Dar es Salaam', 'Arusha', '2025-10-19', 'A20', 100.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-17 21:24:16', '2025-10-18 00:24:16', 321, 'RS11324445', 3, 21, 25, 742, '255696646570', 'doniaparoma99@gmail.com', 'retwer', 'Male', 23, 0, 'Adult', 0, 0, 0, 'Dar es Salaam', 'Arusha', '2025-10-20', 'A12', 100.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-17 21:41:56', '2025-10-18 00:41:56', 322, 'MZ01641428', 3, 21, 25, 741, '255696646570', 'doniaparoma99@gmail.com', 'retwer', 'Male', 23, 0, 'Adult', 0, 0, 0, 'Dar es Salaam', 'Arusha', '2025-10-19', 'A20', 100.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-17 21:41:56', '2025-10-18 00:41:56', 323, 'ZJ13017362', 3, 21, 25, 742, '255696646570', 'doniaparoma99@gmail.com', 'retwer', 'Male', 23, 0, 'Adult', 0, 0, 0, 'Dar es Salaam', 'Arusha', '2025-10-20', 'A24', 100.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-25 06:56:57', '2025-10-25 09:56:57', 324, 'ZI65306074', 3, 18, 22, 740, '255789473209', 'chizithomas@gmail.com', 'Thomas', 'Male', 47, 0, 'Adult', 0, 0, NULL, 'Tambuka lami', 'Kimara temboni', '2025-10-31', 'E1', 802.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 600, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-25 07:00:00', '2025-10-25 10:00:00', 325, 'BN63681868', 3, 18, 22, 740, NULL, NULL, 'Thomas', 'Male', 47, 0, 'Adult', 0, 0, NULL, 'Tambuka lami', 'Kimara temboni', '2025-10-31', 'E1', 802.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 600, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-25 18:25:49', '2025-10-25 21:25:49', 326, 'BX26117107', 3, 21, 25, 742, '789473209', 'chizithomas@gmail.com', 'Thomas Chizi', 'Male', 47, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-10-26', 'C1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-25 18:25:52', '2025-10-25 21:25:52', 327, 'GZ64791370', 3, 21, 25, 742, '789473209', 'chizithomas@gmail.com', 'Thomas Chizi', 'Male', 47, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-10-26', 'C1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-25 18:29:16', '2025-10-25 21:29:21', 328, 'SD82970501', 3, 21, 25, 742, '789473209', NULL, 'Thomas Chizi', 'Male', 47, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-10-26', 'C1', 202.00, 'Unpaid', NULL, NULL, '5djowhex-498', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-25 18:49:13', '2025-10-25 21:49:13', 329, 'YA11468200', 3, 30, 34, 839, '255753020945', 'info@hisgc.co.tz', 'Christina Ekarist', 'Female', 36, 1, 'Adult', 0, 0, NULL, 'Mwanza', 'Dodoma', '2025-10-26', '03', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-25 18:50:55', '2025-10-25 21:50:59', 330, 'VP67911409', 3, 30, 34, 839, NULL, NULL, 'Christina Ekarist', 'Female', 36, 1, 'Adult', 0, 0, NULL, 'Mwanza', 'Dodoma', '2025-10-26', '03', 202.00, 'Unpaid', NULL, NULL, 'jppii6lc-382', NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-25 18:57:55', '2025-10-25 21:59:21', 331, 'JG96809216', 3, 30, 34, 839, '715020945', 'info@hisgc.co.tz', 'Christina Ekarist', 'Male', 36, 1, 'Adult', 0, 0, NULL, 'Mwanza', 'Dodoma', '2025-10-26', '03', 95.00, 'Paid', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 3.00, 61.20, 2.00, 40.80, 0.00, '', 0.00, 0, 100.00, 0.00, 0.00, 0.00, 'dpo', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-25 19:27:32', '2025-10-25 22:27:32', 332, 'SW54666141', 3, 21, 25, 742, '715020945', 'info@hisgc.co.tz', 'Rhoda Peter', 'Female', 30, 1, 'Adult', 0, 0, 0, 'Dar es Salaam', 'Arusha', '2025-10-26', 'N1', 100.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-25 19:27:32', '2025-10-25 22:27:32', 333, 'FN40801494', 3, 21, 25, 741, '715020945', 'info@hisgc.co.tz', 'Rhoda Peter', 'Female', 30, 1, 'Adult', 0, 0, 0, 'Dar es Salaam', 'Arusha', '2025-10-31', 'A1', 100.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-10-29 03:46:24', '2025-10-29 06:46:24', 334, 'AQ09556782', 3, 29, 33, 903, '255789473209', 'chizithomas@gmail.com', 'Thomas Chizi', 'Male', 47, 1, 'Adult', 0, 0, NULL, 'Darajani B', 'Lubaga', '2025-10-29', 'A10', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 157, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 02:04:06', '2025-12-15 21:04:06', 335, 'OW81424996', 3, 21, 25, 742, '628042409', 'msangi2002@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-16', 'I1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 02:11:15', '2025-12-15 21:11:15', 336, 'YK79993275', 3, 21, 25, 742, NULL, NULL, 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-16', 'I1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 02:20:43', '2025-12-15 21:20:43', 337, 'DN61653360', 3, 21, 25, 742, '628042409', 'msangi2002@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-16', 'I1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 02:32:06', '2025-12-15 21:32:06', 338, 'DD89014860', 3, 21, 25, 742, '628042409', 'msangi2002@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-16', 'I1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 02:41:08', '2025-12-15 21:41:08', 339, 'ZN09656806', 3, 21, 25, 742, '628042409', 'msangi2002@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-16', 'I1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 02:48:29', '2025-12-15 21:48:29', 340, 'FT54504579', 3, 21, 25, 742, '628042409', 'msangi2002@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-16', 'I1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 02:56:46', '2025-12-15 21:56:46', 341, 'HI95916270', 3, 21, 25, 742, '255628042409', 'msangi2002@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-16', 'I1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 03:03:07', '2025-12-15 22:03:07', 342, 'YG73668017', 3, 30, 34, 890, '628042409', 'msangi2002@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Mwanza', 'Dodoma', '2025-12-17', '15,47,48,43,44', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 03:10:54', '2025-12-15 22:10:54', 343, 'KS06452655', 3, 30, 34, 890, '628042409', 'msangi2002@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Mwanza', 'Dodoma', '2025-12-17', '15,47,48,43,44', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 03:17:43', '2025-12-15 22:17:43', 344, 'UH19750434', 3, 30, 34, 890, '628042409', 'msangi2002@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Mwanza', 'Dodoma', '2025-12-17', '15,47,48,43,44', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 03:29:19', '2025-12-15 22:29:19', 345, 'LE31891414', 3, 30, 34, 890, '628042409', 'msangi2002@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Mwanza', 'Dodoma', '2025-12-17', '15,47,48,43,44', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 04:06:16', '2025-12-15 23:06:16', 346, 'FE74405816', 3, 21, 25, 742, '255715553803', 'admin@bishtelecom.com', 'kombo jeuri', 'Male', 39, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-15', 'A2,A1,C4,C3,E2', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 04:13:06', '2025-12-15 23:13:06', 347, 'NM78392346', 3, 21, 25, 742, '255715553803', 'admin@bishtelecom.com', 'kombo jeuri', 'Male', 39, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-15', 'A2,A1,C4,C3,E2', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 17:56:03', '2025-12-16 12:56:03', 348, 'RJ42014938', 3, 18, 22, 740, '255715553803', 'abjuma0000@gmail.com', 'Abdul', 'Male', 76, 0, 'Adult', 0, 0, NULL, 'Arusha bus stand', 'Kimara mwisho', '2025-12-16', 'A1,B3,C4,C1,E1', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 18:00:28', '2025-12-16 13:00:28', 349, 'IC10323576', 3, 23, 27, 777, '255715553803', 'abunju@watuafrica.co.tz', 'Abdul', 'Male', 34, 0, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-19', 'B4,C3,D4,E4,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-22', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 18:00:40', '2025-12-16 13:00:40', 350, 'YT04048752', 3, 23, 27, 777, '255715553803', 'abunju@watuafrica.co.tz', 'Abdul', 'Male', 34, 0, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-19', 'B4,C3,D4,E4,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-22', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 18:44:46', '2025-12-16 13:44:46', 351, 'KI67163161', 3, 21, 25, 742, '255715020945', 'info@hisgc.co.tz', 'thomas', 'Male', 34, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-18', 'A2', 1002.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 800, '2025-12-25', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-16 18:53:26', '2025-12-16 13:53:28', 352, 'VU87190122', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Thomas Chizi', 'Male', 37, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-18', 'A2', 202.00, 'Unpaid', NULL, NULL, '17qc8vp4-980', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:26:24', '2025-12-16 23:26:24', 353, 'CA58261119', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:26:59', '2025-12-16 23:26:59', 354, 'PL80212569', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bookings` (`created_at`, `updated_at`, `id`, `booking_code`, `campany_id`, `bus_id`, `route_id`, `schedule_id`, `customer_phone`, `customer_email`, `customer_name`, `gender`, `age`, `infant_child`, `age_group`, `has_excess_luggage`, `excess_luggage_fee`, `user_id`, `pickup_point`, `dropping_point`, `travel_date`, `seat`, `amount`, `payment_status`, `resaved_until`, `trans_status`, `transaction_ref_id`, `external_ref_id`, `mfs_id`, `verification_code`, `bima`, `bima_amount`, `insuranceDate`, `vender_id`, `fee`, `service`, `vender_fee`, `vender_service`, `vat`, `discount`, `discount_amount`, `distance`, `busFee`, `fee_vat`, `service_vat`, `bima_vat`, `payment_method`, `tra_status`, `tra_rct_num`, `tra_z_num`, `tra_vnum`, `tra_qr_url`, `tra_response`, `tra_error`) VALUES
('2025-12-17 04:27:10', '2025-12-16 23:27:10', 355, 'PM60616132', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:27:21', '2025-12-16 23:27:21', 356, 'VU49868106', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:27:32', '2025-12-16 23:27:32', 357, 'LM00204538', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:27:44', '2025-12-16 23:27:44', 358, 'FX01203215', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:27:55', '2025-12-16 23:27:55', 359, 'KL73743443', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:28:07', '2025-12-16 23:28:07', 360, 'EZ98475712', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:28:18', '2025-12-16 23:28:18', 361, 'IM95350861', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:28:29', '2025-12-16 23:28:29', 362, 'UR55866388', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:28:40', '2025-12-16 23:28:40', 363, 'BR20573144', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:28:52', '2025-12-16 23:28:52', 364, 'SR45816413', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:29:03', '2025-12-16 23:29:03', 365, 'BR07610785', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:29:14', '2025-12-16 23:29:14', 366, 'MO02341805', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:29:25', '2025-12-16 23:29:25', 367, 'VK48066430', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:29:37', '2025-12-16 23:29:37', 368, 'MG57919077', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:29:49', '2025-12-16 23:29:49', 369, 'EM37005205', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:30:00', '2025-12-16 23:30:00', 370, 'YG48915054', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:30:11', '2025-12-16 23:30:11', 371, 'YV02764187', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:30:23', '2025-12-16 23:30:23', 372, 'WZ28730068', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:30:34', '2025-12-16 23:30:34', 373, 'UG69142491', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:30:45', '2025-12-16 23:30:45', 374, 'FN52579968', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:30:56', '2025-12-16 23:30:56', 375, 'LS50046510', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:31:10', '2025-12-16 23:31:10', 376, 'BM62426724', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:31:22', '2025-12-16 23:31:22', 377, 'AD17515144', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:31:34', '2025-12-16 23:31:34', 378, 'WF14973248', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:31:45', '2025-12-16 23:31:45', 379, 'KG97982156', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:31:57', '2025-12-16 23:31:57', 380, 'IG42795265', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:32:09', '2025-12-16 23:32:09', 381, 'JW33861652', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:32:21', '2025-12-16 23:32:21', 382, 'KV04380713', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:32:32', '2025-12-16 23:32:32', 383, 'EL48103293', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:32:44', '2025-12-16 23:32:44', 384, 'WV28363412', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:32:55', '2025-12-16 23:32:55', 385, 'ML95307923', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:33:06', '2025-12-16 23:33:06', 386, 'OL99931549', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:33:17', '2025-12-16 23:33:17', 387, 'FU72014467', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:33:28', '2025-12-16 23:33:28', 388, 'AE82955896', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:33:40', '2025-12-16 23:33:40', 389, 'NZ48469502', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:33:52', '2025-12-16 23:33:52', 390, 'ZG84607021', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:34:03', '2025-12-16 23:34:03', 391, 'VV46338971', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:34:14', '2025-12-16 23:34:14', 392, 'OA00007304', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:34:25', '2025-12-16 23:34:25', 393, 'EL65607108', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:34:36', '2025-12-16 23:34:36', 394, 'IL78234721', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:34:48', '2025-12-16 23:34:48', 395, 'KJ74010644', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:34:59', '2025-12-16 23:34:59', 396, 'GH27149740', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:35:10', '2025-12-16 23:35:10', 397, 'GE77405611', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:35:21', '2025-12-16 23:35:21', 398, 'UN07669680', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:35:32', '2025-12-16 23:35:32', 399, 'ZK50729366', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:35:43', '2025-12-16 23:35:43', 400, 'UL23754037', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:35:55', '2025-12-16 23:35:55', 401, 'JL45476242', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:36:06', '2025-12-16 23:36:06', 402, 'XL35516240', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:36:17', '2025-12-16 23:36:17', 403, 'KC00635435', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:36:28', '2025-12-16 23:36:28', 404, 'RR08144105', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:36:39', '2025-12-16 23:36:39', 405, 'AA60768140', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:36:49', '2025-12-16 23:36:49', 406, 'IG05458221', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:37:04', '2025-12-16 23:37:04', 407, 'BA01716770', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:37:21', '2025-12-16 23:37:21', 408, 'JS05937313', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:37:33', '2025-12-16 23:37:33', 409, 'KH06273591', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:37:45', '2025-12-16 23:37:45', 410, 'JL29596448', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:37:57', '2025-12-16 23:37:57', 411, 'YM42745502', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:38:09', '2025-12-16 23:38:09', 412, 'VS94118779', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:38:20', '2025-12-16 23:38:20', 413, 'EL32777107', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:38:32', '2025-12-16 23:38:32', 414, 'RI96591248', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:38:43', '2025-12-16 23:38:43', 415, 'QC47119150', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:38:54', '2025-12-16 23:38:54', 416, 'NE68650431', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:39:05', '2025-12-16 23:39:05', 417, 'TT29894129', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:39:17', '2025-12-16 23:39:17', 418, 'OS37548221', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:39:29', '2025-12-16 23:39:29', 419, 'DC26012716', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:39:40', '2025-12-16 23:39:40', 420, 'SQ08969729', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:39:52', '2025-12-16 23:39:52', 421, 'DS83637035', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:40:04', '2025-12-16 23:40:04', 422, 'OU11310868', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:40:15', '2025-12-16 23:40:15', 423, 'XA36376094', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:40:26', '2025-12-16 23:40:26', 424, 'PP39410216', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:40:38', '2025-12-16 23:40:38', 425, 'XB76492490', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:40:49', '2025-12-16 23:40:49', 426, 'KJ53238588', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:41:13', '2025-12-16 23:41:13', 427, 'CW32932747', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:41:24', '2025-12-16 23:41:24', 428, 'WM79672323', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:41:36', '2025-12-16 23:41:36', 429, 'GE24663838', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:41:48', '2025-12-16 23:41:48', 430, 'OY46776466', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:42:00', '2025-12-16 23:42:00', 431, 'FN78853180', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:42:13', '2025-12-16 23:42:13', 432, 'FB49794354', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:42:25', '2025-12-16 23:42:25', 433, 'VA42789555', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:42:37', '2025-12-16 23:42:37', 434, 'TZ94226982', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:42:48', '2025-12-16 23:42:48', 435, 'PA72795396', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:42:58', '2025-12-16 23:42:58', 436, 'XB52836860', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:43:10', '2025-12-16 23:43:10', 437, 'MF82720724', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:43:21', '2025-12-16 23:43:21', 438, 'IT84120942', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:43:32', '2025-12-16 23:43:32', 439, 'PL41344544', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:43:43', '2025-12-16 23:43:43', 440, 'NI95390745', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:43:55', '2025-12-16 23:43:55', 441, 'XA16051174', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:44:06', '2025-12-16 23:44:06', 442, 'ZO44107070', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:44:17', '2025-12-16 23:44:17', 443, 'KP08341656', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:44:28', '2025-12-16 23:44:28', 444, 'UC64725937', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:44:39', '2025-12-16 23:44:39', 445, 'UF89293923', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:44:51', '2025-12-16 23:44:51', 446, 'SY74639123', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:45:03', '2025-12-16 23:45:03', 447, 'IM83580418', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:45:14', '2025-12-16 23:45:14', 448, 'FX97101553', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:45:25', '2025-12-16 23:45:25', 449, 'PD79127382', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:45:36', '2025-12-16 23:45:36', 450, 'PH15770276', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:45:47', '2025-12-16 23:45:47', 451, 'CD88362745', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:45:58', '2025-12-16 23:45:58', 452, 'KV52183389', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:46:08', '2025-12-16 23:46:08', 453, 'NQ01525665', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:46:20', '2025-12-16 23:46:20', 454, 'CZ51766882', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:46:31', '2025-12-16 23:46:31', 455, 'BY78494710', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:46:42', '2025-12-16 23:46:42', 456, 'QO45330636', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:46:54', '2025-12-16 23:46:54', 457, 'MB79617869', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:47:05', '2025-12-16 23:47:05', 458, 'GB10807091', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:47:23', '2025-12-16 23:47:23', 459, 'AL97946371', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:47:34', '2025-12-16 23:47:34', 460, 'IF61529062', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:47:45', '2025-12-16 23:47:45', 461, 'GO94016283', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:47:56', '2025-12-16 23:47:56', 462, 'VB40693901', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:48:07', '2025-12-16 23:48:07', 463, 'KQ16689922', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:48:18', '2025-12-16 23:48:18', 464, 'YN70835601', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:48:29', '2025-12-16 23:48:29', 465, 'UT69991076', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:48:41', '2025-12-16 23:48:41', 466, 'QG24695230', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:48:51', '2025-12-16 23:48:51', 467, 'RI93709761', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:49:03', '2025-12-16 23:49:03', 468, 'QA66184705', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:49:14', '2025-12-16 23:49:14', 469, 'XN99008662', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:49:27', '2025-12-16 23:49:27', 470, 'CO77878060', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bookings` (`created_at`, `updated_at`, `id`, `booking_code`, `campany_id`, `bus_id`, `route_id`, `schedule_id`, `customer_phone`, `customer_email`, `customer_name`, `gender`, `age`, `infant_child`, `age_group`, `has_excess_luggage`, `excess_luggage_fee`, `user_id`, `pickup_point`, `dropping_point`, `travel_date`, `seat`, `amount`, `payment_status`, `resaved_until`, `trans_status`, `transaction_ref_id`, `external_ref_id`, `mfs_id`, `verification_code`, `bima`, `bima_amount`, `insuranceDate`, `vender_id`, `fee`, `service`, `vender_fee`, `vender_service`, `vat`, `discount`, `discount_amount`, `distance`, `busFee`, `fee_vat`, `service_vat`, `bima_vat`, `payment_method`, `tra_status`, `tra_rct_num`, `tra_z_num`, `tra_vnum`, `tra_qr_url`, `tra_response`, `tra_error`) VALUES
('2025-12-17 04:49:39', '2025-12-16 23:49:39', 471, 'MK30758482', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:49:50', '2025-12-16 23:49:50', 472, 'CG40741749', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:50:01', '2025-12-16 23:50:01', 473, 'PU85142474', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:50:12', '2025-12-16 23:50:12', 474, 'QC74329554', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:50:23', '2025-12-16 23:50:23', 475, 'DH72628450', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:50:34', '2025-12-16 23:50:34', 476, 'TD19181973', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:50:45', '2025-12-16 23:50:45', 477, 'XY05063793', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:50:56', '2025-12-16 23:50:56', 478, 'IC18144412', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:51:07', '2025-12-16 23:51:07', 479, 'LB44456943', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:51:18', '2025-12-16 23:51:18', 480, 'YT24655632', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:51:29', '2025-12-16 23:51:29', 481, 'YJ45551808', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:51:40', '2025-12-16 23:51:40', 482, 'CW66362360', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:51:51', '2025-12-16 23:51:51', 483, 'MM26528697', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:52:01', '2025-12-16 23:52:01', 484, 'TB74785614', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:52:12', '2025-12-16 23:52:12', 485, 'RQ55573875', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:52:23', '2025-12-16 23:52:23', 486, 'WP93989518', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:52:35', '2025-12-16 23:52:35', 487, 'FW66123590', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:52:46', '2025-12-16 23:52:46', 488, 'RT86307956', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:52:58', '2025-12-16 23:52:58', 489, 'LX23602987', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:53:09', '2025-12-16 23:53:09', 490, 'RX68820622', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:53:21', '2025-12-16 23:53:21', 491, 'RF88203610', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:53:32', '2025-12-16 23:53:32', 492, 'PN55944138', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:53:44', '2025-12-16 23:53:44', 493, 'BJ50601208', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:53:56', '2025-12-16 23:53:56', 494, 'FI29296221', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:54:08', '2025-12-16 23:54:08', 495, 'ET61537741', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:54:19', '2025-12-16 23:54:19', 496, 'YN08235102', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:54:31', '2025-12-16 23:54:31', 497, 'FJ25187245', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:54:43', '2025-12-16 23:54:43', 498, 'RH97992530', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:54:55', '2025-12-16 23:54:55', 499, 'GY73303902', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:55:07', '2025-12-16 23:55:07', 500, 'CD42925960', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:55:19', '2025-12-16 23:55:19', 501, 'HI19755864', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:55:30', '2025-12-16 23:55:30', 502, 'JO83562436', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:55:41', '2025-12-16 23:55:41', 503, 'NA72955428', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:55:52', '2025-12-16 23:55:52', 504, 'CM30931043', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:56:03', '2025-12-16 23:56:03', 505, 'GV73001243', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:56:15', '2025-12-16 23:56:15', 506, 'OR99966434', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:56:27', '2025-12-16 23:56:27', 507, 'YW52547565', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:56:38', '2025-12-16 23:56:38', 508, 'QH90291770', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:56:49', '2025-12-16 23:56:49', 509, 'JJ72567446', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:57:00', '2025-12-16 23:57:00', 510, 'KV79599725', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:57:11', '2025-12-16 23:57:11', 511, 'BI10440836', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:57:22', '2025-12-16 23:57:22', 512, 'MJ80574675', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:57:37', '2025-12-16 23:57:37', 513, 'VL74746904', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:57:48', '2025-12-16 23:57:48', 514, 'EL45748351', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:57:59', '2025-12-16 23:57:59', 515, 'EZ27807253', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:58:11', '2025-12-16 23:58:11', 516, 'OX07100244', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:58:23', '2025-12-16 23:58:23', 517, 'BZ53183962', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:58:35', '2025-12-16 23:58:35', 518, 'ES63762508', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:58:46', '2025-12-16 23:58:46', 519, 'XI83026801', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:58:58', '2025-12-16 23:58:58', 520, 'IX13655997', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:59:09', '2025-12-16 23:59:09', 521, 'QY39815517', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:59:21', '2025-12-16 23:59:21', 522, 'AD94099801', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:59:32', '2025-12-16 23:59:32', 523, 'XD76285803', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:59:43', '2025-12-16 23:59:43', 524, 'OF04051427', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 04:59:54', '2025-12-16 23:59:54', 525, 'CT12879926', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:00:07', '2025-12-17 00:00:07', 526, 'BU45227767', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:00:19', '2025-12-17 00:00:19', 527, 'BW01549361', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:00:30', '2025-12-17 00:00:30', 528, 'HJ90473941', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:00:43', '2025-12-17 00:00:43', 529, 'LP90100799', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:00:54', '2025-12-17 00:00:54', 530, 'DH45244818', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:01:06', '2025-12-17 00:01:06', 531, 'KQ05911385', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:01:17', '2025-12-17 00:01:17', 532, 'UC90181725', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:01:28', '2025-12-17 00:01:28', 533, 'LX99416950', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:01:39', '2025-12-17 00:01:39', 534, 'CS30634307', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:01:51', '2025-12-17 00:01:51', 535, 'QG72789947', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:02:02', '2025-12-17 00:02:02', 536, 'KJ29064643', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:02:13', '2025-12-17 00:02:13', 537, 'RX25409762', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:02:25', '2025-12-17 00:02:25', 538, 'QW93316725', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:02:40', '2025-12-17 00:02:40', 539, 'DH12354599', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:02:51', '2025-12-17 00:02:51', 540, 'EA58085547', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:03:01', '2025-12-17 00:03:01', 541, 'DV10634627', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:03:13', '2025-12-17 00:03:13', 542, 'UK89131958', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:03:24', '2025-12-17 00:03:24', 543, 'VU39761734', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:03:35', '2025-12-17 00:03:35', 544, 'WN63398121', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:03:46', '2025-12-17 00:03:46', 545, 'BX31987333', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:03:58', '2025-12-17 00:03:58', 546, 'BS77036770', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:04:08', '2025-12-17 00:04:08', 547, 'OV58243672', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:04:20', '2025-12-17 00:04:20', 548, 'GI32474539', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:04:31', '2025-12-17 00:04:31', 549, 'DT38125183', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:04:43', '2025-12-17 00:04:43', 550, 'AJ31872644', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:04:54', '2025-12-17 00:04:54', 551, 'GO77608077', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:05:05', '2025-12-17 00:05:05', 552, 'AC72057802', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:05:16', '2025-12-17 00:05:16', 553, 'RR37234106', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:05:28', '2025-12-17 00:05:28', 554, 'IJ27374295', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 05:05:39', '2025-12-17 00:05:39', 555, 'TH26979640', 3, 23, 27, 778, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dodoma', 'Mwanza', '2025-12-16', 'A3,H3,M4,M3,I4', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 702, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:10:03', '2025-12-17 07:10:03', 556, 'BT27998867', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:10:17', '2025-12-17 07:10:17', 557, 'VE01916899', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:10:28', '2025-12-17 07:10:28', 558, 'IF46656712', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:10:39', '2025-12-17 07:10:39', 559, 'XE58350398', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:10:50', '2025-12-17 07:10:50', 560, 'MQ09057634', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:11:01', '2025-12-17 07:11:01', 561, 'WS46743418', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:11:14', '2025-12-17 07:11:14', 562, 'IP02050869', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:11:25', '2025-12-17 07:11:25', 563, 'OS81164170', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:11:40', '2025-12-17 07:11:40', 564, 'EU24452065', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:11:51', '2025-12-17 07:11:51', 565, 'PV27308130', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:12:02', '2025-12-17 07:12:02', 566, 'FU60758190', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:12:21', '2025-12-17 07:12:21', 567, 'CE86037955', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:12:32', '2025-12-17 07:12:32', 568, 'ZF46483050', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:12:43', '2025-12-17 07:12:43', 569, 'HE82991923', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:12:58', '2025-12-17 07:12:58', 570, 'RP75366527', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:13:10', '2025-12-17 07:13:10', 571, 'KC82195151', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:13:21', '2025-12-17 07:13:21', 572, 'LF35685467', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:13:33', '2025-12-17 07:13:33', 573, 'ZT49304233', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:13:44', '2025-12-17 07:13:44', 574, 'UJ16818768', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:13:55', '2025-12-17 07:13:55', 575, 'BT25635120', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:14:07', '2025-12-17 07:14:07', 576, 'TR74634737', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:14:18', '2025-12-17 07:14:18', 577, 'MN22885707', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:14:29', '2025-12-17 07:14:29', 578, 'UW19504970', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:14:41', '2025-12-17 07:14:41', 579, 'GV31477276', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:14:52', '2025-12-17 07:14:52', 580, 'BA21820988', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:15:04', '2025-12-17 07:15:04', 581, 'VX02722085', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:15:15', '2025-12-17 07:15:15', 582, 'CM12191705', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:15:27', '2025-12-17 07:15:27', 583, 'ZE61956818', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:15:38', '2025-12-17 07:15:38', 584, 'IO46080099', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:15:50', '2025-12-17 07:15:50', 585, 'VK32098722', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bookings` (`created_at`, `updated_at`, `id`, `booking_code`, `campany_id`, `bus_id`, `route_id`, `schedule_id`, `customer_phone`, `customer_email`, `customer_name`, `gender`, `age`, `infant_child`, `age_group`, `has_excess_luggage`, `excess_luggage_fee`, `user_id`, `pickup_point`, `dropping_point`, `travel_date`, `seat`, `amount`, `payment_status`, `resaved_until`, `trans_status`, `transaction_ref_id`, `external_ref_id`, `mfs_id`, `verification_code`, `bima`, `bima_amount`, `insuranceDate`, `vender_id`, `fee`, `service`, `vender_fee`, `vender_service`, `vat`, `discount`, `discount_amount`, `distance`, `busFee`, `fee_vat`, `service_vat`, `bima_vat`, `payment_method`, `tra_status`, `tra_rct_num`, `tra_z_num`, `tra_vnum`, `tra_qr_url`, `tra_response`, `tra_error`) VALUES
('2025-12-17 12:16:02', '2025-12-17 07:16:02', 586, 'UO50992284', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:16:13', '2025-12-17 07:16:13', 587, 'QZ25802660', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:16:25', '2025-12-17 07:16:25', 588, 'GF46536397', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:16:35', '2025-12-17 07:16:35', 589, 'FH19768043', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:16:47', '2025-12-17 07:16:47', 590, 'ZS24188462', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:16:59', '2025-12-17 07:16:59', 591, 'JJ32578018', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:17:10', '2025-12-17 07:17:10', 592, 'LV96479434', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:17:21', '2025-12-17 07:17:21', 593, 'NF48372046', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:17:32', '2025-12-17 07:17:32', 594, 'RI29385676', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:17:43', '2025-12-17 07:17:43', 595, 'OM41871480', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:17:54', '2025-12-17 07:17:54', 596, 'ME45678455', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:18:07', '2025-12-17 07:18:07', 597, 'WV24077607', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:18:18', '2025-12-17 07:18:18', 598, 'KH26436665', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:18:29', '2025-12-17 07:18:29', 599, 'GY66100915', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:18:40', '2025-12-17 07:18:40', 600, 'UR98813264', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:18:51', '2025-12-17 07:18:51', 601, 'ER67595398', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:19:03', '2025-12-17 07:19:03', 602, 'BA09277106', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:19:13', '2025-12-17 07:19:13', 603, 'QX28712853', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:19:24', '2025-12-17 07:19:24', 604, 'IS62567642', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:19:35', '2025-12-17 07:19:35', 605, 'QE56962316', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:19:47', '2025-12-17 07:19:47', 606, 'OM27173466', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:19:57', '2025-12-17 07:19:57', 607, 'DB96703289', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:20:09', '2025-12-17 07:20:09', 608, 'DG79959128', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:20:21', '2025-12-17 07:20:21', 609, 'RF14044993', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:20:31', '2025-12-17 07:20:31', 610, 'JD71673026', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:20:42', '2025-12-17 07:20:42', 611, 'WN78415152', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:20:53', '2025-12-17 07:20:53', 612, 'FG30909354', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:21:04', '2025-12-17 07:21:04', 613, 'BS74262488', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:21:18', '2025-12-17 07:21:18', 614, 'RN78928225', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 12:21:43', '2025-12-17 07:21:43', 615, 'JB07159421', 3, 21, 25, 742, '255789473209', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 32, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-20', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-23', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:46:55', '2025-12-17 18:46:55', 616, 'ES13948921', 3, 35, 39, 988, '628042409', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:47:31', '2025-12-17 18:47:31', 617, 'FJ38224867', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:47:43', '2025-12-17 18:47:43', 618, 'KZ74953243', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:47:54', '2025-12-17 18:47:54', 619, 'AF81997941', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:48:04', '2025-12-17 18:48:04', 620, 'HA23350746', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:48:16', '2025-12-17 18:48:16', 621, 'MB14529487', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:48:27', '2025-12-17 18:48:27', 622, 'HQ52368791', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:48:39', '2025-12-17 18:48:39', 623, 'AE97436561', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:48:50', '2025-12-17 18:48:50', 624, 'HC89137203', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:49:01', '2025-12-17 18:49:01', 625, 'RZ93394283', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:49:12', '2025-12-17 18:49:12', 626, 'NO59166781', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:49:23', '2025-12-17 18:49:23', 627, 'KX71807026', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:49:34', '2025-12-17 18:49:34', 628, 'SU32293351', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:49:45', '2025-12-17 18:49:45', 629, 'RN08251068', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:49:56', '2025-12-17 18:49:56', 630, 'MG86756290', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:50:07', '2025-12-17 18:50:07', 631, 'GN54636132', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:50:19', '2025-12-17 18:50:19', 632, 'MA74928439', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-17 23:50:24', '2025-12-17 18:50:24', 633, 'HB94940449', 3, 35, 39, 988, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Ifakara', 'Dar es Salaam', '2025-12-17', 'M1,M3,N3,L1', 1320.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 417, 1200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-18 02:02:32', '2025-12-17 21:02:32', 634, 'HE73219434', 3, 33, 37, 960, '696646570', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Iringa', '2025-12-17', 'G1,G2,F1,F2,E1', 2642.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 526, 2500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-18 02:35:10', '2025-12-17 21:35:10', 635, 'YN66811471', 3, 33, 37, 960, '696646570', NULL, 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Iringa', '2025-12-17', 'G1,G2,F1,F2,E1', 2642.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 526, 2500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-18 02:35:22', '2025-12-17 21:35:22', 636, 'DB26619152', 3, 33, 37, 960, '696646570', NULL, 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Iringa', '2025-12-17', 'G1,G2,F1,F2,E1', 2642.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 526, 2500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-18 02:36:18', '2025-12-17 21:36:18', 637, 'BV55071441', 3, 33, 37, 960, '696646570', NULL, 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Iringa', '2025-12-17', 'G1,G2,F1,F2,E1', 2642.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 526, 2500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-18 13:52:11', '2025-12-18 08:52:11', 638, 'AC71048841', 3, 21, 25, 742, '255715020945', 'chizithomas@gmail.com', 'Christina Ekarist', 'Female', 36, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-22', 'A1,A2,E2,E1,F1', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-25', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-18 13:56:31', '2025-12-18 08:56:31', 639, 'WB57762562', 3, 21, 25, 742, '255715020945', 'chizithomas@gmail.com', 'Christina Ekarist', 'Female', 36, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2025-12-22', 'A1,A2,E2,E1,F1', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-25', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2025-12-18 14:22:21', '2025-12-18 09:22:21', 640, 'YI39275829', 3, 18, 22, 740, '255715020945', 'info@hisgc.co.tz', 'Thomas Chizi', 'Male', 45, 1, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2025-12-21', 'M1,M2,N1,M3,M4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2025-12-24', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-28 20:14:36', '2026-01-28 15:14:36', 641, 'SB46725773', 3, 18, 22, 740, '255789473209', 'chizithomas@gmail.com', 'Joyce Ninahaja', 'Female', 38, 1, 'Adult', 0, 0, NULL, 'Arusha bus stand', 'Mbezi Magufuli', '2026-01-28', 'F1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-28 20:14:44', '2026-01-28 15:14:44', 642, 'TK72657657', 3, 18, 22, 740, '255789473209', 'chizithomas@gmail.com', 'Joyce Ninahaja', 'Female', 38, 1, 'Adult', 0, 0, NULL, 'Arusha bus stand', 'Mbezi Magufuli', '2026-01-28', 'F1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-01-28 20:15:52', '2026-01-28 15:15:52', 643, 'OL09778550', 3, 18, 22, 740, '255789473209', NULL, 'Joyce Ninahaja', 'Female', 38, 1, 'Adult', 0, 0, NULL, 'Arusha bus stand', 'Mbezi Magufuli', '2026-01-28', 'F1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-09 19:16:21', '2026-02-09 14:16:21', 644, 'RC53139410', 3, 18, 22, 740, NULL, NULL, 'Rhoda Peter', 'Female', 33, 1, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-13', 'A2,A1,B2,B1,C2', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2026-02-16', '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-09 19:17:55', '2026-02-09 14:17:55', 645, 'IP07990975', 3, 18, 22, 740, NULL, NULL, 'Rhoda Peter', 'Female', 33, 1, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-13', 'A2,A1,B2,B1,C2', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2026-02-16', '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-09 19:18:54', '2026-02-09 14:20:57', 646, 'TM33072369', 3, 18, 22, 740, NULL, NULL, 'Rhoda Peter', 'Female', 33, 1, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-13', 'A2,A1,B2,B1,C2', 475.00, 'Paid', NULL, 'success', NULL, NULL, NULL, NULL, 1, 400, '2026-02-16', '37', 15.00, 64.80, 10.00, 43.20, 0.00, '', 0.00, 0, 500.00, 0.00, 0.00, 0.00, 'dpo', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-09 19:24:15', '2026-02-09 14:24:15', 647, 'FI30857259', 3, 18, 22, 740, NULL, NULL, 'Rhoda Peter', 'Female', 33, 1, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-13', 'A2,A1,B2,B1,C2', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2026-02-16', '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-09 19:26:45', '2026-02-09 14:26:51', 648, 'US46694753', 3, 18, 22, 740, NULL, NULL, 'Rhoda Peter', 'Female', 33, 1, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-13', 'A2,A1,B2,B1,C2', 1008.00, 'Unpaid', NULL, NULL, 'pmqq51qp-487', NULL, NULL, NULL, 1, 400, '2026-02-16', '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-10 18:17:01', '2026-02-10 13:17:01', 649, 'ZB77105582', 3, 18, 22, 743, NULL, NULL, 'Rhoda Peter', 'Female', 34, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-14', 'A2,A1,B2,B1,C1', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2026-02-17', '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-10 18:29:42', '2026-02-10 13:29:42', 650, 'LI70094425', 3, 18, 22, 743, NULL, NULL, 'Rhoda Peter', 'Female', 34, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-14', 'A2,A1,B2,B1,C1', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2026-02-17', '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-10 18:29:50', '2026-02-10 13:29:50', 651, 'GV98180393', 3, 18, 22, 743, NULL, NULL, 'Rhoda Peter', 'Female', 34, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-14', 'A2,A1,B2,B1,C1', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2026-02-17', '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-10 18:29:57', '2026-02-10 13:29:57', 652, 'MT16303277', 3, 18, 22, 743, NULL, NULL, 'Rhoda Peter', 'Female', 34, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-14', 'A2,A1,B2,B1,C1', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2026-02-17', '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-11 18:12:05', '2026-02-11 13:12:05', 653, 'UV23806089', 3, 18, 22, 743, '715020945', 'info@hisgc.co.tz', 'Rhoda Peter', 'Female', 33, 1, 'Adult', 0, 0, NULL, 'Shekilango', 'Arusha bus stand', '2026-02-14', 'A2,A1,B2,B1,C1', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2026-02-17', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-13 18:30:20', '2026-02-13 13:30:26', 654, 'BL06773329', 3, 18, 22, 740, '255765553953', 'abduldv@aatanchtrading.com', 'kombo jeuri', 'Male', 34, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-13', 'A4', 202.00, 'Unpaid', NULL, NULL, 'ovfzauj4-582', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-13 20:04:48', '2026-02-13 15:04:48', 655, 'VV13229812', 3, 18, 22, 740, NULL, NULL, 'Thomas Chizi', 'Male', 43, 0, 'Adult', 0, 0, NULL, 'Arusha bus stand', 'Shekilango', '2026-02-17', 'A2,A1,A3,A4,B1', 1208.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 600, '2026-02-22', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-14 19:47:18', '2026-02-14 14:47:18', 656, 'RQ72685491', 3, 18, 22, 740, '715020945', 'dpo@hisgc.co.tz', 'Christina Ekarist', 'Female', 36, 1, 'Adult', 0, 0, NULL, 'Arusha bus stand', 'Kimara mwisho', '2026-02-19', 'A1,A2,B2,B1,C1', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2026-02-22', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-14 22:04:02', '2026-02-14 17:04:02', 657, 'TX19502009', 3, 21, 25, 742, '255765553953', 'abunju@watuafrica.co.tz', 'Abdul Bunju', 'Male', 38, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-14', 'B4', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-15 02:18:08', '2026-02-14 21:18:08', 658, 'KZ17369802', 3, 18, 22, 743, '255715020945', 'chizithomas@gmail.com', 'David King Thomas', 'Male', 13, 0, 'Adult', 0, 0, NULL, 'Shekilango', 'Arusha bus stand', '2026-02-16', 'A1', 402.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 200, '2026-02-17', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-15 02:20:05', '2026-02-14 21:20:05', 659, 'JU16527110', 3, 18, 22, 743, '255715020945', NULL, 'David King Thomas', 'Male', 13, 0, 'Adult', 0, 0, NULL, 'Shekilango', 'Arusha bus stand', '2026-02-16', 'A1', 402.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 200, '2026-02-17', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-15 04:02:10', '2026-02-14 23:02:10', 660, 'HE60931665', 3, 21, 25, 742, '255765553953', 'abunju@watuafrica.co.tz', 'Abdul Bunju', 'Male', 36, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-14', 'A4', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-15 04:04:05', '2026-02-14 23:04:05', 661, 'IL76402526', 3, 21, 25, 742, '255765553953', 'abunju@watuafrica.co.tz', 'Abdul Bunju', 'Male', 36, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-14', 'A4', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-16 20:22:20', '2026-02-16 15:22:20', 662, 'NZ91940947', 3, 18, 22, 743, '765553953', 'aamanzi@watuafrica.co.tz', 'abdul', 'Male', 30, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-16', 'A2', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-17 00:36:38', '2026-02-16 19:36:38', 663, 'JQ61001960', 3, 21, 25, 742, '765553953', 'abunju@watuafrica.co.tz', 'Abdul Bunju', 'Male', 13, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-16', 'E4', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-17 01:02:46', '2026-02-16 20:02:46', 664, 'NL72104968', 3, 21, 25, 742, '255765553653', 'abunju@watuafrica.co.tz', 'Abdul Bunju', 'Male', 33, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-16', 'E4', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-17 02:23:44', '2026-02-16 21:23:44', 665, 'GZ74147864', 3, 21, 25, 742, '255628042409', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-16', 'I1,J1', 303.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-17 02:26:55', '2026-02-16 21:26:55', 666, 'HH65414829', 3, 21, 25, 742, '255628042409', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-16', 'I1,J1', 303.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-17 02:29:57', '2026-02-16 21:29:57', 667, 'GT47196314', 3, 21, 25, 742, '255628042409', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-16', 'I1,J1', 303.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-17 02:33:20', '2026-02-16 21:33:20', 668, 'OK93991248', 3, 21, 25, 742, '255628042409', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-16', 'I1,J1', 303.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-17 02:37:32', '2026-02-16 21:37:32', 669, 'WS85738218', 3, 21, 25, 742, '255628042409', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-16', 'I1,J1', 303.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 200.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-17 17:50:49', '2026-02-17 12:50:49', 670, 'WF76942933', 3, 18, 22, 740, '255765553953', 'abduldv@aatanchtrading.com', 'kombo jeuri', 'Male', 34, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-17', 'B1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-17 20:33:29', '2026-02-17 15:33:29', 671, 'AI01507761', 3, 18, 22, 740, '255765553953', 'abduldv@aatanchtrading.com', 'kombo jeuri', 'Male', 34, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-17', 'B1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-18 01:15:21', '2026-02-17 20:15:21', 672, 'GA16650359', 3, 21, 25, 741, '255628042409', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-17', 'J2', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-18 20:02:28', '2026-02-18 15:02:28', 673, 'OP27666549', 3, 18, 22, 743, '715553803', 'abjuma0000@gmail.com', 'Abdul', 'Male', 87, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-18', 'A2', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-18 21:47:13', '2026-02-18 16:47:13', 674, 'MI34494260', 3, 18, 22, 743, '696646570', 'doniaparoma99@gmail.com', 'retwer', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-18', 'G1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '75', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-18 21:52:16', '2026-02-18 16:52:16', 675, 'FW66853425', 3, 18, 22, 743, '696646570', 'doniaparoma99@gmail.com', 'retwer', 'Male', 65, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-18', 'G1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '75', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-18 21:59:01', '2026-02-18 16:59:01', 676, 'CK77549755', 3, 18, 22, 743, '696646570', 'doniaparoma99@gmail.com', 'retwer', 'Male', 55, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-18', 'G1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '75', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-18 22:00:51', '2026-02-18 17:00:51', 677, 'DD26113122', 3, 18, 22, 743, '696646570', 'doniaparoma99@gmail.com', 'retwer', 'Male', 33, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-18', 'G1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '75', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-19 03:05:20', '2026-02-18 22:05:20', 678, 'XY05810146', 3, 21, 25, 742, '255628042409', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-18', 'E1,D1,C1,B1,A1', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-19 04:05:44', '2026-02-18 23:05:44', 679, 'CX59595078', 3, 21, 25, 742, '255628042409', 'doniaparoma99@gmail.com', 'ibra', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-18', 'E1,D1,C1,B1,A1', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-19 23:01:17', '2026-02-19 18:01:17', 680, 'XA75298466', 3, 18, 22, 740, '255765553953', 'abduldv@aatanchtrading.com', 'kombo jeuri', 'Male', 34, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-19', 'B1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-19 23:02:28', '2026-02-19 18:02:28', 681, 'OE73490419', 3, 18, 22, 740, '255765553953', 'abduldv@aatanchtrading.com', 'kombo jeuri', 'Male', 34, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-19', 'B1,M4,M3,N1', 507.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 400.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-19 23:03:13', '2026-02-19 18:03:13', 682, 'RX35925226', 3, 18, 22, 740, '25571553803', 'admin@gmail.com', 'kombo jeuri', 'Male', 34, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-19', 'B1,M4,M3,N1', 507.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 400.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-19 23:05:32', '2026-02-19 18:05:32', 683, 'ZU87237615', 3, 18, 22, 740, '25571553803', 'admin@gmail.com', 'kombo jeuri', 'Male', 34, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-19', 'B1,M4,M3,N1', 507.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 400.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-19 23:06:28', '2026-02-19 18:06:28', 684, 'VK46339407', 3, 18, 22, 740, '25571553803', 'admin@gmail.com', 'kombo jeuri', 'Male', 34, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-19', 'B1,M4,M3,N1', 507.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 400.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-20 14:47:51', '2026-02-20 09:47:51', 685, 'MJ65053095', 3, 18, 22, 743, '696646570', 'doniaparoma99@gmail.com', 'ree', 'Male', 22, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-20', 'E1,F1,D1,D2,E2', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '75', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-20 15:05:54', '2026-02-20 10:05:58', 686, 'BR84746460', 3, 18, 22, 743, '696646570', 'doniaparoma99@gmail.com', 'ree', 'Male', 33, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-20', 'E1,F1,D1,D2,E2', 608.00, 'Unpaid', NULL, NULL, 'xeevqtqu650', 'LCPCA4773T', NULL, NULL, 0, 0, NULL, '75', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-20 16:21:48', '2026-02-20 11:21:48', 687, 'SP26846116', 3, 18, 22, 743, '715553803', 'abjuma0000@gmail.com', 'Abdul', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-20', 'A1', 202.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 100.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-20 16:24:36', '2026-02-20 11:24:36', 688, 'AY96167010', 3, 18, 22, 743, '715553803', 'abjuma0000@gmail.com', 'Abdul', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-20', 'A1,L4,L3,L2,L1', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-20 16:25:35', '2026-02-20 11:25:35', 689, 'BK02266829', 3, 18, 22, 743, '765553953', 'abunju@watuafrica.co.tz', 'Abdul', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-20', 'A1,L4,L3,L2,L1', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-20 16:28:29', '2026-02-20 11:28:29', 690, 'VB58697249', 3, 21, 25, 741, NULL, NULL, 'Abdul', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-23', 'A4,A3,A2,A1,B4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 400, '2026-02-26', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-20 16:29:09', '2026-02-20 11:29:13', 691, 'RH65552054', 3, 21, 25, 741, '715553803', 'abjuma0000@gmail.com', 'Abdul', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-23', 'A4,A3,A2,A1,B4', 1008.00, 'Unpaid', NULL, NULL, 'uyit5wf0818', 'CLPLCPCAFV5S1', NULL, NULL, 1, 400, '2026-02-26', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-20 21:18:59', '2026-02-20 16:19:03', 692, 'HY81421680', 3, 21, 25, 742, '696646570', 'doniaparoma99@gmail.com', 'ree', 'Male', 21, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-20', 'D1,E1,E2,D2,F2', 608.00, 'Unpaid', NULL, NULL, 'tug7g3fq462', 'LCPCAZXT61', NULL, NULL, 0, 0, NULL, '75', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-20 21:19:43', '2026-02-20 16:19:43', 693, 'FA44178710', 3, 21, 25, 742, '628042409', 'doniaparoma99@gmail.com', 'ree', 'Male', 21, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-20', 'D1,E1,E2,D2,F2', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '75', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-20 21:24:03', '2026-02-20 16:24:03', 694, 'WT10901226', 3, 21, 25, 742, '755191605', 'doniaparoma99@gmail.com', 'ree', 'Male', 33, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-20', 'D1,E1,E2,D2,F2', 608.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '75', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-20 21:26:10', '2026-02-20 16:26:13', 695, 'XY01907998', 3, 21, 25, 742, '696646570', 'doniaparoma99@gmail.com', 'ree', 'Male', 22, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-20', 'D1,E1,E2,D2,F2', 608.00, 'Unpaid', NULL, NULL, 'kw83a8te433', 'LCPCA8XMMJ', NULL, NULL, 0, 0, NULL, '75', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 500.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-21 21:28:40', '2026-02-21 16:28:40', 696, 'QK95663016', 3, 21, 25, 742, '715020945', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 29, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A1', 1208.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 100, '2026-02-24', '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-21 21:30:17', '2026-02-21 16:30:17', 697, 'BK78596591', 3, 21, 25, 742, '715020945', 'chizithomas@gmail.com', 'Rhoda Peter', 'Female', 29, 1, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A1', 1208.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 1, 100, '2026-02-24', '37', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 18:49:27', '2026-02-22 13:49:27', 698, 'JU82879986', 3, 21, 25, 742, '25571553803', 'shafii@demo.com', 'Shafii Ramadhani', 'Male', 21, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-22', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 18:50:26', '2026-02-22 13:50:26', 699, 'TR71509625', 3, 21, 25, 742, '25571553803', NULL, 'Shafii Ramadhani', 'Male', 21, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-22', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 18:50:40', '2026-02-22 13:50:40', 700, 'KG42942457', 3, 21, 25, 742, '25571553803', NULL, 'Shafii Ramadhani', 'Male', 21, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-22', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 18:51:01', '2026-02-22 23:17:58', 701, 'DJ97032704', 3, 21, 25, 742, '25571553803', NULL, 'Shafii Ramadhani', 'Male', 21, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-22', 'A1', 1108.00, 'resaved', '2026-02-23 18:51:01', NULL, 'DJ970327041771791457', 'CLPLCPCA3NDZE', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `bookings` (`created_at`, `updated_at`, `id`, `booking_code`, `campany_id`, `bus_id`, `route_id`, `schedule_id`, `customer_phone`, `customer_email`, `customer_name`, `gender`, `age`, `infant_child`, `age_group`, `has_excess_luggage`, `excess_luggage_fee`, `user_id`, `pickup_point`, `dropping_point`, `travel_date`, `seat`, `amount`, `payment_status`, `resaved_until`, `trans_status`, `transaction_ref_id`, `external_ref_id`, `mfs_id`, `verification_code`, `bima`, `bima_amount`, `insuranceDate`, `vender_id`, `fee`, `service`, `vender_fee`, `vender_service`, `vat`, `discount`, `discount_amount`, `distance`, `busFee`, `fee_vat`, `service_vat`, `bima_vat`, `payment_method`, `tra_status`, `tra_rct_num`, `tra_z_num`, `tra_vnum`, `tra_qr_url`, `tra_response`, `tra_error`) VALUES
('2026-02-22 19:39:57', '2026-02-22 14:39:57', 702, 'QR69560483', 3, 21, 25, 742, '25571553803', 'admin@gmail.com', 'Shafii Ramadhan', 'Male', 21, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-22', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 19:40:09', '2026-02-22 14:40:09', 703, 'JY38675149', 3, 21, 25, 742, '25571553803', NULL, 'Shafii Ramadhan', 'Male', 21, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-22', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 19:40:25', '2026-02-22 14:40:25', 704, 'TJ00252215', 3, 21, 25, 742, '25571553803', NULL, 'Shafii Ramadhan', 'Male', 21, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-22', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 19:55:12', '2026-02-22 14:55:12', 705, 'ZO14788966', 3, 21, 25, 742, '25571553803', 'admin@gmail.com', 'Shafii', 'Male', 21, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-22', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 20:04:59', '2026-02-22 23:01:05', 706, 'DZ64118886', 3, 21, 25, 742, '255696646570', 'doniaparoma99@gmail.com', 'ree', 'Male', 22, 0, 'Adult', 0, 0, 78, 'Dar es Salaam', 'Arusha', '2026-02-22', 'C3,B3,B4,C4,D4', 5142.00, 'resaved', '2026-02-23 20:04:59', NULL, 'DZ641188861771790462', 'LCPCA9N335', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 5000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 20:09:13', '2026-02-22 15:09:24', 707, 'TK86976923', 3, 18, 22, 743, '255696646570', 'doniaparoma99@gmail.com', 'ree', 'Male', 23, 0, 'Adult', 0, 0, 78, 'Arusha', 'Dar es Salaam', '2026-02-22', 'C3,D3,D4,E4,K3', 5142.00, 'Cancel', '2026-02-23 20:09:13', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 5000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 20:10:31', '2026-02-22 15:10:31', 708, 'QU54853013', 3, 21, 25, 742, '255696646570', 'doniaparoma99@gmail.com', 'ree', 'Male', 11, 0, 'Adult', 0, 0, 78, 'Dar es Salaam', 'Arusha', '2026-02-22', 'C3,C1,I1', 3125.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 3000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 20:20:56', '2026-02-22 15:20:56', 709, 'SH47654981', 3, 21, 25, 742, '25571553803', 'admin@gmail.com', 'kombo jeuri', 'Male', 23, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-22', 'B1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 20:26:17', '2026-02-22 15:26:21', 710, 'WJ19695796', 3, 21, 25, 742, '255696646570', 'doniaparoma99@gmail.com', 'ree', 'Male', 21, 0, 'Adult', 0, 0, 78, 'Dar es Salaam', 'Arusha', '2026-02-22', 'D2,C2,C1,D1,E1', 5142.00, 'Unpaid', NULL, NULL, '6ewp0hhz876', 'LCPCA9T68D', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 5000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 20:27:37', '2026-02-22 15:27:37', 711, 'MH36590963', 3, 21, 25, 742, '25571553803', 'ABJUMA0000@GMAIL.COM', 'kombo jeuri', 'Male', 23, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-22', 'B1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 20:28:08', '2026-02-22 15:28:08', 712, 'KK96014464', 3, 21, 25, 742, '25571553803', 'admin@gmail.com', 'kombo jeuri', 'Male', 88, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-22', 'B1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 20:29:04', '2026-02-22 15:29:04', 713, 'MA79513942', 3, 21, 25, 742, '71553803', 'admin@gmail.com', 'kombo jeuri', 'Male', 23, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-22', 'B1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 20:29:59', '2026-02-22 15:30:08', 714, 'RY60990765', 3, 21, 25, 742, '255715553803', 'ABJUMA0000@GMAIL.COM', 'kombo jeuri', 'Male', 22, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-22', 'B1', 1108.00, 'Unpaid', NULL, NULL, 'jqea0jqz619', 'CLPLCPCA63913', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-22 20:36:02', '2026-02-22 15:36:02', 715, 'QI56153167', 3, 21, 25, 742, '25571553803', 'admin@gmail.com', 'kombo jeuri', 'Male', 23, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-22', 'B1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 03:05:08', '2026-02-22 22:05:08', 716, 'ZS60605849', 3, 21, 25, 741, '25571553803', 'admin@gmail.com', 'kombo jeuri', 'Male', 23, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 03:05:48', '2026-02-22 22:06:01', 717, 'FI53958559', 3, 21, 25, 741, '255715553803', 'ABJUMA0000@GMAIL.COM', 'kombo jeuri', 'Male', 23, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'A1', 1108.00, 'Unpaid', NULL, NULL, 'wol92f1z449', 'CLPLCPCA433NK', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 03:09:12', '2026-02-22 22:09:15', 718, 'PJ40135405', 3, 21, 25, 741, '255696646570', 'doniaparoma99@gmail.com', 'ree', 'Male', 22, 0, 'Adult', 0, 0, 78, 'Dar es Salaam', 'Arusha', '2026-02-23', 'B2,B1,C2', 3125.00, 'Unpaid', NULL, NULL, 'r7wvrszl479', 'LCPCARK9NE', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 3000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 03:11:36', '2026-02-22 22:11:40', 719, 'RK45951198', 3, 21, 25, 741, '255696646570', 'doniaparoma99@gmail.com', 'ree', 'Male', 22, 0, 'Adult', 0, 0, 78, 'Dar es Salaam', 'Arusha', '2026-02-23', 'B2,B1,C2', 3125.00, 'Unpaid', NULL, NULL, '5t0bcwxx448', 'LCPCAWQ2DP', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 3000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 03:12:11', '2026-02-22 22:12:14', 720, 'UN50168554', 3, 21, 25, 741, '255628042409', 'doniaparoma99@gmail.com', 'ree', 'Male', 22, 0, 'Adult', 0, 0, 78, 'Dar es Salaam', 'Arusha', '2026-02-23', 'B2,B1,C2', 3125.00, 'Unpaid', NULL, NULL, '5lyftwqm618', 'LCPCA8Y9YM', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 3000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 03:13:14', '2026-02-22 22:13:14', 721, 'WP04456775', 3, 21, 25, 741, '25571553803', 'admin@gmail.com', 'kombo jeuri', 'Male', 23, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 03:15:33', '2026-02-22 22:15:33', 722, 'TL24926724', 3, 21, 25, 741, '25571553803', 'admin@gmail.com', 'kombo jeuri', 'Male', 56, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 03:22:45', '2026-02-22 22:22:47', 723, 'RQ92593973', 3, 21, 25, 741, '255628042409', 'doniaparoma99@gmail.com', 'ree', 'Male', 22, 0, 'Adult', 0, 0, 78, 'Dar es Salaam', 'Arusha', '2026-02-23', 'B2,B1,C2', 3125.00, 'Unpaid', NULL, NULL, '2j1d6c96493', 'LCPCA1H2YJ', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 3000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 03:27:22', '2026-02-22 22:27:22', 724, 'QC08104668', 3, 21, 25, 741, '25571553803', 'admin@gmail.com', 'Shafii', 'Male', 23, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 03:28:10', '2026-02-22 22:28:32', 725, 'TY16374994', 3, 21, 25, 741, '255715553803', 'ABJUMA0000@GMAIL.COM', 'kombo jeuri', 'Male', 23, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'A1', 950.00, 'Paid', NULL, 'success', 'h06szpec350', 'CLPLCPCARKAWF', NULL, NULL, 0, 0, NULL, '', 50.00, 108.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, 'clickpesa', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 03:34:26', '2026-02-22 22:34:26', 726, 'RA44690997', 3, 18, 22, 740, '255755192605', 'doniaparoma99@gmail.com', 'ree', 'Male', 33, 0, 'Adult', 0, 0, 78, 'Arusha', 'Dar es Salaam', '2026-02-23', 'C2', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 03:35:05', '2026-02-22 22:35:23', 727, 'DR47181734', 3, 18, 22, 740, '255628042409', 'doniaparoma99@gmail.com', 'ree', 'Male', 11, 0, 'Adult', 0, 0, 78, 'Arusha', 'Dar es Salaam', '2026-02-23', 'C2', 950.00, 'Paid', NULL, 'success', 'r7h3l87t975', 'LCPCAZ8KEA', NULL, NULL, 0, 0, NULL, '', 50.00, 108.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, 'clickpesa', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 03:58:17', '2026-02-22 22:58:17', 728, 'NN37446191', 3, 21, 25, 741, '25571553803', 'admin@gmail.com', 'Shafii Dauda', 'Male', 39, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'A4', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 04:01:43', '2026-02-22 23:01:43', 729, 'DG93677263', 3, 21, 25, 741, '25571553803', 'admin@gmail.com', 'kombo jeuri', 'Male', 45, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'A4', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 04:02:52', '2026-02-22 23:03:17', 730, 'NJ76317040', 3, 21, 25, 741, '255715553803', NULL, 'kombo jeuri', 'Male', 23, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'A4', 950.00, 'Paid', NULL, 'success', '8mea7twu158', 'CLPLCPCATXVAY', NULL, NULL, 0, 0, NULL, '', 50.00, 108.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, 'clickpesa', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 04:05:43', '2026-02-22 23:05:46', 731, 'MK29725671', 3, 18, 22, 740, '255628042409', 'doniaparoma99@gmail.com', 'ree', 'Male', 20, 0, 'Adult', 0, 0, 78, 'Arusha', 'Dar es Salaam', '2026-02-23', 'F1', 1108.00, 'Unpaid', NULL, NULL, 'eoixrbsu404', 'LCPCAPDKZK', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 04:06:01', '2026-02-22 23:06:04', 732, 'WR21317257', 3, 18, 22, 740, '255628042409', 'doniaparoma99@gmail.com', 'ree', 'Male', 20, 0, 'Adult', 0, 0, 78, 'Arusha', 'Dar es Salaam', '2026-02-23', 'F1', 1108.00, 'Unpaid', NULL, NULL, 'pjxb88ec243', 'LCPCA6AJET', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 04:15:55', '2026-02-22 23:16:01', 733, 'ZU25009595', 3, 21, 25, 741, '255715553803', 'abunju@watuafrica.co.tz', 'Abdul Bunju', 'Male', 20, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'B1', 1108.00, 'Unpaid', NULL, NULL, 'riccchra239', 'CLPLCPCA754FE', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 04:16:35', '2026-02-22 23:16:41', 734, 'TC58623686', 3, 21, 25, 741, '255715553803', 'abunju@watuafrica.co.tz', 'Abdul Bunju', 'Male', 20, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'B1', 1108.00, 'Unpaid', NULL, NULL, 'elb02qz3599', 'CLPLCPCA6G8QG', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 04:21:04', '2026-02-22 23:21:23', 735, 'ZY67545852', 3, 21, 25, 741, '255715553803', 'abjuma0000@gmail.com', 'Abdul Bunju', 'Male', 90, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'C1', 950.00, 'Paid', NULL, 'success', 'h75z7asp931', 'CLPLCPCAS6B3R', NULL, NULL, 0, 0, NULL, '', 50.00, 108.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, 'clickpesa', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 04:25:20', '2026-02-22 23:31:00', 736, 'ZV19637947', 3, 21, 25, 741, '255715553803', NULL, 'Abdul Juma', 'Male', 23, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'C4', 950.00, 'Cancel', NULL, 'success', 't5zbmjv9880', 'CLPLCPCANT4JY', NULL, NULL, 0, 0, NULL, '', 50.00, 108.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, 'clickpesa', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 04:32:34', '2026-02-22 23:32:34', 737, 'CN27691107', 3, 21, 25, 741, '', NULL, 'Abdul Bunju', 'Male', 23, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'B4', 100.00, 'resaved', '2026-02-24 04:32:34', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 05:03:09', '2026-02-23 00:03:09', 738, 'BL34574599', 3, 21, 25, 741, NULL, NULL, 'Abdul Bunju', 'Male', 12, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'B4', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 05:03:09', '2026-02-23 00:03:09', 739, 'AT85709388', 3, 21, 25, 742, NULL, NULL, 'Abdul Bunju', 'Male', 12, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A1', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 22:29:11', '2026-02-23 17:29:11', 740, 'QO45102691', 3, 21, 25, 741, NULL, NULL, 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, 0, 'Dar es Salaam', 'Arusha', '2026-02-23', 'C4', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-23 22:29:11', '2026-02-23 17:29:11', 741, 'JZ67368772', 3, 21, 25, 742, NULL, NULL, 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, 0, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A1', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 00:34:32', '2026-02-23 19:34:32', 742, 'ZL99820874', 3, 21, 25, 741, NULL, NULL, 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'C4', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 00:34:32', '2026-02-23 19:34:32', 743, 'VU78836484', 3, 21, 25, 742, NULL, NULL, 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A1', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 00:37:16', '2026-02-23 19:37:16', 744, 'OE10626702', 3, 21, 25, 741, NULL, NULL, 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'C4', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 00:37:16', '2026-02-23 19:37:16', 745, 'BU03587720', 3, 21, 25, 742, NULL, NULL, 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A1', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 00:41:45', '2026-02-23 19:41:45', 746, 'HL43372280', 3, 21, 25, 741, NULL, NULL, 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'C4', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 00:41:45', '2026-02-23 19:41:45', 747, 'EU38074476', 3, 21, 25, 742, NULL, NULL, 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A1', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 00:44:31', '2026-02-23 19:44:31', 748, 'CX58731966', 3, 21, 25, 741, NULL, NULL, 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-23', 'C4', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 00:44:31', '2026-02-23 19:44:31', 749, 'VD64156061', 3, 21, 25, 742, NULL, NULL, 'Abdul Bunju', 'Male', 23, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A1', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 00:53:21', '2026-02-23 19:53:21', 750, 'JG63906327', 3, 21, 25, 742, '255715553803', 'abjuma0000@gmail.com', 'Abdul Bunju', 'Male', 23, 0, 'Adult', 0, 0, 79, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A1', 100.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 0.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 01:24:15', '2026-02-23 20:24:34', 751, 'BO78236545', 3, 21, 25, 741, '255715553803', 'mariamshafii@gmail.com', 'Mariam Shafii', 'Male', 23, 0, 'Adult', 0, 0, 80, 'Dar es Salaam', 'Arusha', '2026-02-23', 'C4', 950.00, 'Paid', NULL, 'success', '4ye721xa984', 'CLPLCPCAFP8E1', NULL, NULL, 0, 0, NULL, '', 50.00, 108.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, 'clickpesa', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 02:24:15', '2026-02-23 21:44:08', 752, 'BB33939200', 3, 21, 25, 741, '255715553803', NULL, 'Mariam Shafii', 'Male', 23, 0, 'Adult', 0, 0, 80, 'Dar es Salaam', 'Arusha', '2026-02-23', 'E1', 1108.00, 'Unpaid', NULL, NULL, 'Round699c9fe2df731', 'CLPLCPCANSDRB', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 02:28:39', '2026-02-23 21:28:39', 753, 'CI60407066', 3, 21, 25, 741, '255715553803', NULL, 'Ashfaina', 'Male', 23, 0, 'Adult', 0, 0, 80, 'Dar es Salaam', 'Arusha', '2026-02-23', 'A2', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 02:28:39', '2026-02-23 21:28:39', 754, 'PQ54604337', 3, 21, 25, 742, '255715553803', NULL, 'Ashfaina', 'Male', 12, 0, 'Adult', 0, 0, 80, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A1', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 02:43:46', '2026-02-23 21:56:28', 755, 'DR51497730', 3, 21, 25, 741, '255715553803', 'abjuma0000@gmail.com', 'Ashfaina', 'Male', 33, 0, 'Adult', 0, 0, 80, 'Dar es Salaam', 'Arusha', '2026-02-23', 'M1', 950.00, 'Paid', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '', 50.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, 'dpo', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 02:43:46', '2026-02-23 22:19:06', 756, 'AC49802367', 3, 18, 22, 742, '255715553803', NULL, 'Ashfaina', 'Male', 43, 0, 'Adult', 0, 0, 80, 'Arusha', 'Dar es Salaam', '2026-02-24', 'A4', 950.00, 'refunded', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '', 50.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, 'dpo', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 03:10:47', '2026-02-23 22:10:54', 757, 'LL07678865', 3, 18, 22, 743, '255715553803', NULL, 'Ashfaina', 'Male', 66, 0, 'Adult', 0, 0, 80, 'Arusha', 'Dar es Salaam', '2026-02-24', 'A1', 1108.00, 'Unpaid', NULL, NULL, 'j22swsqp570', 'CLPLCPCAHB1AB', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 03:11:17', '2026-02-23 22:17:50', 758, 'LM84592099', 3, 18, 22, 743, '255715553803', NULL, 'Ashfaina', 'Male', 66, 0, 'Adult', 0, 0, 80, 'Arusha', 'Dar es Salaam', '2026-02-24', 'A1', 1108.00, 'Unpaid', NULL, NULL, 'Round699ca7c862630', 'CLPLCPCAS7E84', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 03:12:05', '2026-02-23 22:12:22', 759, 'ZS78499158', 3, 18, 22, 743, '255715553803', NULL, 'Ashfaina', 'Male', 66, 0, 'Adult', 0, 0, 80, 'Arusha', 'Dar es Salaam', '2026-02-24', 'A1', 1108.00, 'Failed', NULL, NULL, 'fjrxci3z-297', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 03:17:28', '2026-02-23 22:17:28', 760, 'WO11572051', 3, 18, 22, 740, '255715553803', NULL, 'Ashfaina', 'Male', 44, 0, 'Adult', 0, 0, 80, 'Arusha', 'Dar es Salaam', '2026-02-23', 'E1', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 03:17:28', '2026-02-23 22:17:28', 761, 'ZI25862754', 3, 18, 22, 743, '255715553803', NULL, 'Ashfaina', 'Male', 55, 0, 'Adult', 0, 0, 80, 'Arusha', 'Dar es Salaam', '2026-02-24', 'E1', 1000.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 04:00:49', '2026-02-23 23:00:55', 762, 'YC79325831', 3, 21, 25, 742, '255715553803', NULL, 'Ashfaina', 'Male', 22, 1, 'Adult', 0, 0, 80, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A1', 3608.00, 'Unpaid', NULL, NULL, 'b4aim10l382', 'CLPLCPCA4GTXE', NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 04:02:27', '2026-02-23 23:02:34', 763, 'XF23208356', 3, 21, 25, 742, '255715553803', NULL, 'Ashfaina', 'Male', 22, 1, 'Adult', 0, 0, 80, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A1', 3808.00, 'Unpaid', NULL, NULL, 'z4sx82vl174', 'CLPLCPCAFE7TE', NULL, NULL, 1, 200, '2026-02-25', '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 21:48:25', '2026-02-24 16:48:25', 764, 'ND10371613', 3, 21, 25, 742, '255715553803', NULL, 'aBDUL BUNJU', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A2', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-24 21:48:37', '2026-02-24 16:48:37', 765, 'PV47419907', 3, 21, 25, 742, '255715553803', NULL, 'aBDUL BUNJU', 'Male', 23, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A2', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-25 03:11:49', '2026-02-24 22:11:49', 766, 'KX91458636', 3, 21, 25, 742, '255715553803', NULL, 'Ashfaina', 'Male', 33, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-25 03:12:56', '2026-02-24 22:12:56', 767, 'UV35470806', 3, 21, 25, 742, '255715553803', NULL, 'Ashfaina', 'Male', 22, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-25 03:15:07', '2026-02-24 22:15:07', 768, 'GA62608368', 3, 21, 25, 742, '255715553803', NULL, 'Ashfaina', 'Male', 22, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-24', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-25 18:12:54', '2026-02-25 13:13:00', 769, 'OW18591446', 3, 18, 22, 740, NULL, NULL, 'yy', 'Male', 44, 0, 'Adult', 0, 0, NULL, 'Arusha bus stand', 'Mbezi Magufuli', '2026-03-05', 'C2,C1,D2', 3125.00, 'Unpaid', NULL, NULL, '2cwdtl7s-189', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 3000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-25 18:12:55', '2026-02-25 13:13:00', 770, 'JF23234835', 3, 18, 22, 740, NULL, NULL, 'yy', 'Male', 44, 0, 'Adult', 0, 0, NULL, 'Arusha bus stand', 'Mbezi Magufuli', '2026-03-05', 'C2,C1,D2', 3125.00, 'Unpaid', NULL, NULL, 'b9e9jfu4-884', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 3000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-25 18:12:56', '2026-02-25 13:13:05', 771, 'AU79718139', 3, 18, 22, 740, NULL, NULL, 'yy', 'Male', 44, 0, 'Adult', 0, 0, NULL, 'Arusha bus stand', 'Mbezi Magufuli', '2026-03-05', 'C2,C1,D2', 3125.00, 'Failed', NULL, NULL, '0t2gw7ed-449', NULL, NULL, NULL, 0, 0, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 627, 3000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-25 20:32:25', '2026-02-25 15:32:37', 772, 'SM76612054', 3, 18, 22, 740, '715553803', 'abjuma0000@gmail.com', 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-25', 'A4', 1108.00, 'Failed', NULL, NULL, '3nodza0a-691', NULL, NULL, NULL, 0, 0, NULL, '81', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-25 20:34:24', '2026-02-25 15:34:24', 773, 'ZX59979399', 3, 18, 22, 740, '765553953', 'abunju@watuafrica.co.tz', 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-25', 'A3', 950.00, 'Paid', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 50.00, 108.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, 'cash', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-25 20:42:04', '2026-02-25 15:42:11', 774, 'LB29664218', 3, 18, 22, 740, '765553953', NULL, 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-25', 'A3', 1108.00, 'Failed', NULL, NULL, 'cm6dmduq-998', NULL, NULL, NULL, 0, 0, NULL, '81', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-25 20:44:01', '2026-02-25 15:44:01', 775, 'GG15124766', 3, 18, 22, 740, '715553803', NULL, 'Abdul Bunju', 'Male', 12, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-25', 'A2', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-25 20:54:07', '2026-02-25 15:54:07', 776, 'TJ75699897', 3, 18, 22, 740, '255715553803', 'abjuma0000@gmail.com', 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, 0, 'Arusha', 'Dar es Salaam', '2026-02-25', 'M1', 950.00, 'Paid', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 50.00, 2500.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, 'dpo', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-25 20:54:07', '2026-02-25 15:54:07', 777, 'XI40247147', 3, 21, 25, 741, '255715553803', 'abjuma0000@gmail.com', 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, 0, 'Dar es Salaam', 'Arusha', '2026-02-27', 'M1', 950.00, 'Paid', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 50.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, 'dpo', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-25 21:04:39', '2026-02-25 16:04:39', 778, 'EC78046097', 3, 18, 22, 740, '255715553803', NULL, 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, 0, 'Arusha', 'Dar es Salaam', '2026-02-25', 'M1', 950.00, 'Paid', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 50.00, 2500.00, 0.00, 0.00, 0.00, '', 0.00, 627, 1000.00, 0.00, 0.00, 0.00, 'dpo', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-25 21:04:39', '2026-02-25 16:04:39', 779, 'PH92464828', 3, 21, 25, 741, '255715553803', NULL, 'Abdul Bunju', 'Male', 22, 0, 'Adult', 0, 0, 0, 'Dar es Salaam', 'Arusha', '2026-02-27', 'M1', 950.00, 'Paid', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 50.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 626, 1000.00, 0.00, 0.00, 0.00, 'dpo', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-26 02:25:30', '2026-02-25 21:25:30', 780, 'PI07887569', 3, 18, 22, 740, '255715553803', 'admin@bishtelecom.com', 'kombo jeuri', 'Male', 22, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-25', 'A1', 950.00, 'Paid', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 50.00, 108.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, 'cash', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-26 02:30:53', '2026-02-25 21:30:53', 781, 'LD06755835', 3, 18, 22, 740, '255715553803', NULL, 'kombo jeuri', 'Male', 22, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-25', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-26 02:40:03', '2026-02-25 21:40:03', 782, 'II55424270', 3, 18, 22, 740, '25571553803', 'admin@gmail.com', 'kombo jeuri', 'Male', 11, 0, 'Adult', 0, 0, NULL, 'Arusha', 'Dar es Salaam', '2026-02-25', 'A4', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-27 02:23:24', '2026-02-26 21:23:24', 783, 'IF66177299', 3, 21, 25, 742, '715553803', NULL, 'Abdul', 'Male', 22, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Arusha', '2026-02-26', 'A1', 1108.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 1000.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-27 03:03:24', '2026-02-26 22:03:24', 784, 'EI20232544', 3, 23, 27, 1270, '715553803', NULL, 'Abdul', 'Male', 22, 0, 'Adult', 0, 0, NULL, 'Dar es Salaam', 'Morogoro', '2026-02-26', 'A4', 1008.00, 'Unpaid', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 0, 900.00, 0.00, 0.00, 0.00, NULL, 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-27 03:07:10', '2026-02-26 22:07:10', 785, 'ZD33585115', 3, 23, 27, 1270, '255765553953', NULL, 'Abdul', 'Male', 22, 0, 'Adult', 0, 0, NULL, 'Mbezi', 'Morogoro', '2026-02-26', 'A4', 855.00, 'Paid', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 45.00, 108.00, 0.00, 0.00, 0.00, '', 0.00, 0, 900.00, 0.00, 0.00, 0.00, 'cash', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-27 03:22:11', '2026-02-26 22:22:11', 786, 'IM32774073', 3, 23, 27, 1271, '255715553803', NULL, 'Abdul', 'Male', 22, 0, 'Adult', 0, 0, 0, 'Dar es Salaam', 'Morogoro', '2026-02-27', 'A1', 855.00, 'Paid', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 45.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 250, 900.00, 0.00, 0.00, 0.00, 'dpo', 'pending', NULL, NULL, NULL, NULL, NULL, NULL),
('2026-02-27 03:22:11', '2026-02-26 22:22:11', 787, 'AL94946432', 3, 23, 27, 1271, '255715553803', NULL, 'Abdul', 'Male', 22, 0, 'Adult', 0, 0, 0, 'Dar es Salaam', 'Morogoro', '2026-02-28', 'A4', 855.00, 'Paid', NULL, 'success', NULL, NULL, NULL, NULL, 0, 0, NULL, '81', 45.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 250, 900.00, 0.00, 0.00, 0.00, 'dpo', 'pending', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` int(11) NOT NULL,
  `campany_id` int(11) DEFAULT NULL,
  `bus_number` varchar(255) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `bus_features` text DEFAULT NULL,
  `bus_type` int(11) NOT NULL,
  `total_seats` int(11) NOT NULL,
  `accept_parcels` tinyint(1) NOT NULL DEFAULT 1,
  `conductor` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL,
  `driver_name` varchar(255) DEFAULT NULL,
  `driver_contact` varchar(255) DEFAULT NULL,
  `driver_name_2` varchar(255) DEFAULT NULL,
  `driver_contact_2` varchar(255) DEFAULT NULL,
  `conductor_name` varchar(255) DEFAULT NULL,
  `customer_service_name_1` varchar(255) DEFAULT NULL,
  `customer_service_contact_1` varchar(255) DEFAULT NULL,
  `customer_service_name_2` varchar(255) DEFAULT NULL,
  `customer_service_contact_2` varchar(255) DEFAULT NULL,
  `bus_model` varchar(255) DEFAULT NULL,
  `seate_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`seate_json`)),
  `customer_service_name_3` varchar(255) DEFAULT NULL,
  `customer_service_contact_3` varchar(255) DEFAULT NULL,
  `customer_service_name_4` varchar(255) DEFAULT NULL,
  `customer_service_contact_4` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `campany_id`, `bus_number`, `route_id`, `bus_features`, `bus_type`, `total_seats`, `accept_parcels`, `conductor`, `created_at`, `updated_at`, `driver_name`, `driver_contact`, `driver_name_2`, `driver_contact_2`, `conductor_name`, `customer_service_name_1`, `customer_service_contact_1`, `customer_service_name_2`, `customer_service_contact_2`, `bus_model`, `seate_json`, `customer_service_name_3`, `customer_service_contact_3`, `customer_service_name_4`, `customer_service_contact_4`) VALUES
(19, 20, 'T 909 EAU', NULL, NULL, 10, 100, 1, '0715553803', '2025-05-11 19:45:38', '2025-05-24 09:16:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 9, 'T 344 DFP', NULL, NULL, 10, 53, 1, '255628042409', '2025-04-23 08:24:02', '2025-05-06 11:09:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 12, 'T 667', NULL, NULL, 20, 53, 1, '255628042409', '2025-04-26 11:19:04', '2025-04-26 14:19:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 13, 'T 111 DDT', NULL, NULL, 10, 40, 1, '+255753020945', '2025-05-02 10:41:55', '2025-07-06 10:02:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 13, 'T 912 EEE', NULL, NULL, 30, 29, 1, '+255753020945', '2025-05-04 02:29:31', '2025-07-06 10:02:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 18, 'T 331 EFD', NULL, NULL, 30, 50, 1, '+255753020945', '2025-05-05 00:58:09', '2025-05-05 03:58:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 19, 'T 124 EAU', NULL, NULL, 20, 45, 1, '0765553953', '2025-05-05 01:44:58', '2025-05-05 04:44:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 21, 'T 990 EJK', NULL, NULL, 10, 40, 1, '+255753020945', '2025-05-06 16:23:24', '2025-05-31 03:07:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 24, 'T 999 EAU', NULL, NULL, 10, 44, 1, '0715553803', '2025-05-06 18:57:10', '2025-05-06 21:57:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 24, 'T 888 EEA', NULL, NULL, 20, 45, 1, '0715553803', '2025-05-06 19:34:14', '2025-05-06 22:34:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 3, 'T 777 EMM', NULL, 'Azam Tv', 20, 53, 1, '255788474440', '2025-05-18 01:27:50', '2026-02-26 22:45:08', 'Ibrahim', '0628042409', NULL, NULL, 'Salim juma', 'Salma', '0688454545', 'Jamila', '0692000111', 'Yutong D14', '{\"id\":null,\"cols\":5,\"name\":\"Untitled Layout\",\"rows\":13,\"seats\":[{\"id\":\"5eada6aa-d5f1-474c-88a3-60b9807b0df7\",\"col\":1,\"row\":1,\"label\":\"A4\"},{\"id\":\"72bfbcc5-97eb-45fb-9ddd-4155a23cd974\",\"col\":2,\"row\":1,\"label\":\"A3\"},{\"id\":\"ea40ebd7-6f62-42d2-97ea-b4e6e23e95a8\",\"col\":1,\"row\":13,\"label\":\"M4\"},{\"id\":\"b5104585-eb83-43ae-848f-1dc37fffe3d8\",\"col\":4,\"row\":1,\"label\":\"A2\"},{\"id\":\"fe1e98e3-b829-4d44-8cf9-a0d3506c2166\",\"col\":1,\"row\":2,\"label\":\"B4\"},{\"id\":\"507d16b1-d3b8-4445-9e9f-f705af68b76a\",\"col\":2,\"row\":2,\"label\":\"B3\"},{\"id\":\"bce705d9-c2bd-43a9-9345-737252958f5d\",\"col\":4,\"row\":12,\"label\":\"L2\"},{\"id\":\"579b0cd6-53d2-4e02-bb15-102aac156f24\",\"col\":4,\"row\":2,\"label\":\"B2\"},{\"id\":\"8a3619c8-f6c1-4584-8455-24949895e51f\",\"col\":1,\"row\":3,\"label\":\"C4\"},{\"id\":\"4607d5a8-9da6-4063-9a91-c2afd47de06a\",\"col\":2,\"row\":3,\"label\":\"C3\"},{\"id\":\"2523f2b8-47c8-4888-a411-aab1741a5d5f\",\"col\":2,\"row\":12,\"label\":\"L3\"},{\"id\":\"a2add5a7-bb2e-4d73-94e6-ef3c30496905\",\"col\":4,\"row\":3,\"label\":\"C2\"},{\"id\":\"89e89ed0-e1d3-4287-aa4e-8e538d3881e2\",\"col\":1,\"row\":4,\"label\":\"D4\"},{\"id\":\"90f0ab64-42f6-4e69-beb7-0612a03e32f1\",\"col\":2,\"row\":4,\"label\":\"D3\"},{\"id\":\"a3032301-3dab-43c2-a301-a0789cf85932\",\"col\":1,\"row\":12,\"label\":\"L4\"},{\"id\":\"026cae8d-0b46-40f5-86ad-69d9c2a35b54\",\"col\":4,\"row\":4,\"label\":\"D2\"},{\"id\":\"3c06da5c-74b8-4d54-b877-a190c54afd1c\",\"col\":2,\"row\":11,\"label\":\"K3\"},{\"id\":\"67ce3845-de2c-4132-8f17-09849901373b\",\"col\":4,\"row\":5,\"label\":\"E2\"},{\"id\":\"2aca3816-ef1e-4d5f-869b-2412108f980b\",\"col\":1,\"row\":6,\"label\":\"F4\"},{\"id\":\"3f0d82ab-3b6b-4cf1-8128-c66becee82d7\",\"col\":2,\"row\":6,\"label\":\"F3\"},{\"id\":\"d003bec1-f808-457b-921c-80f7165f5ad2\",\"col\":1,\"row\":11,\"label\":\"K4\"},{\"id\":\"b696f745-33e1-4f29-89e9-15a11bc88f07\",\"col\":4,\"row\":6,\"label\":\"F2\"},{\"id\":\"c882af86-3fb6-42ed-8049-949695483b4f\",\"col\":1,\"row\":7,\"label\":\"G4\"},{\"id\":\"b07af2c3-f1b0-4171-a5f6-407715d71a06\",\"col\":2,\"row\":7,\"label\":\"G3\"},{\"id\":\"30aacedd-5b9f-4990-a19b-1500841b37ce\",\"col\":5,\"row\":12,\"label\":\"L1\"},{\"id\":\"7ac87c1d-c26b-4f8d-963b-2ce4dd7d6380\",\"col\":4,\"row\":7,\"label\":\"G2\"},{\"id\":\"af5ce474-62ad-4563-8505-3b18345633cd\",\"col\":1,\"row\":8,\"label\":\"H4\"},{\"id\":\"fdbb1f15-aef1-4479-935b-c5fb676fce8c\",\"col\":2,\"row\":8,\"label\":\"H3\"},{\"id\":\"af870bec-bad9-42b1-940c-0c27136e08b8\",\"col\":4,\"row\":11,\"label\":\"K2\"},{\"id\":\"6472bf03-7a9f-40e1-a824-91817318f8eb\",\"col\":4,\"row\":8,\"label\":\"H2\"},{\"id\":\"608f4da5-7121-4b3c-a46b-f5ee2cec4d0a\",\"col\":1,\"row\":9,\"label\":\"I4\"},{\"id\":\"1a0d155f-50b2-4a88-be05-0605b5ee262f\",\"col\":2,\"row\":9,\"label\":\"I3\"},{\"id\":\"d1be019c-1049-473a-92cc-dc65633072b4\",\"col\":5,\"row\":11,\"label\":\"K1\"},{\"id\":\"ee8a44e6-255a-4dba-8d08-6816d1123a0f\",\"col\":4,\"row\":9,\"label\":\"I2\"},{\"id\":\"c4215c18-12fc-4b5a-a31b-8f62297e903c\",\"col\":1,\"row\":10,\"label\":\"J4\"},{\"id\":\"08ac0834-cef6-4400-b569-a48c223803ed\",\"col\":2,\"row\":10,\"label\":\"J3\"},{\"id\":\"15cef11f-21f5-4b28-a1a3-9a1411c97e4b\",\"col\":5,\"row\":10,\"label\":\"J1\"},{\"id\":\"965f4127-0c4f-4dbb-a29b-8ded546287d8\",\"col\":4,\"row\":10,\"label\":\"J2\"},{\"id\":\"ca019d70-7def-4c5c-906b-2505fe8266eb\",\"col\":5,\"row\":1,\"label\":\"A1\"},{\"id\":\"1a7b4146-86e8-43fd-b830-4157c85d8fe5\",\"col\":5,\"row\":2,\"label\":\"B1\"},{\"id\":\"35ed4a55-9aa9-43dd-a212-333db14a0a32\",\"col\":5,\"row\":3,\"label\":\"C1\"},{\"id\":\"876c6152-bd7a-4bb6-8fd4-43b92c45bb8a\",\"col\":5,\"row\":4,\"label\":\"D1\"},{\"id\":\"71e3a2de-fcfd-4fc6-ade9-495d2ea30edd\",\"col\":5,\"row\":5,\"label\":\"E1\"},{\"id\":\"ef2ff135-55bd-441c-81a6-55a444437370\",\"col\":5,\"row\":6,\"label\":\"F1\"},{\"id\":\"72a16992-7a38-47f4-9d88-672e808b38e0\",\"col\":5,\"row\":7,\"label\":\"G1\"},{\"id\":\"a79f2f44-b6c9-4806-b111-921f4665b6d1\",\"col\":5,\"row\":8,\"label\":\"H1\"},{\"id\":\"ff962744-5f96-491c-a693-037fe09897f6\",\"col\":5,\"row\":9,\"label\":\"I1\"},{\"id\":\"a3d6146f-c863-46fb-bf95-8d2fec696471\",\"col\":5,\"row\":13,\"label\":\"M1\"},{\"id\":\"5a2db58f-277f-40a5-9c95-4a3b46013350\",\"col\":4,\"row\":13,\"label\":\"M2\"},{\"id\":\"f405a3c2-a3df-426e-a1d6-d92d1c79c5df\",\"col\":3,\"row\":13,\"label\":\"N1\"},{\"id\":\"7bfc5efc-4348-42bb-80d6-d9cc20d5d010\",\"col\":2,\"row\":13,\"label\":\"M3\"}],\"aisles\":[{\"col\":3,\"row\":1},{\"col\":3,\"row\":2},{\"col\":3,\"row\":3},{\"col\":3,\"row\":4},{\"col\":3,\"row\":5},{\"col\":3,\"row\":6},{\"col\":3,\"row\":7},{\"col\":3,\"row\":8},{\"col\":3,\"row\":9},{\"col\":3,\"row\":10},{\"col\":3,\"row\":11},{\"col\":3,\"row\":12}]}', 'Francis Kalinga', '0755454945', NULL, NULL),
(18, 3, 'T 344 DFM', NULL, 'Azam tv', 10, 49, 1, '255782883904', '2025-05-07 12:35:38', '2026-02-21 16:21:02', 'Masabu Silayo', '0788181818', NULL, NULL, 'Simon Kaaya', 'Stella Yohana', '0684123433', NULL, NULL, 'Yutong D14', '{\"id\":null,\"cols\":5,\"name\":\"Untitled Layout\",\"rows\":13,\"seats\":[{\"id\":\"f6408d1c-8653-4481-9898-314fe1fbdf76\",\"col\":1,\"row\":1,\"label\":\"A4\"},{\"id\":\"945582b5-8099-4197-b62c-5b9f00caff01\",\"col\":2,\"row\":1,\"label\":\"A3\"},{\"id\":\"2650cd32-a10e-475d-bacb-5bfa2eb9177c\",\"col\":4,\"row\":1,\"label\":\"A2\"},{\"id\":\"d06f3f2b-227f-4f5a-8ea6-49da0b58bc19\",\"col\":5,\"row\":1,\"label\":\"A1\"},{\"id\":\"562f45fc-27c4-4975-921f-ec2584943a2e\",\"col\":1,\"row\":2,\"label\":\"B4\"},{\"id\":\"1ca284a3-32e0-4a02-a589-8a238af1abba\",\"col\":2,\"row\":2,\"label\":\"B3\"},{\"id\":\"dcb25f1b-dc65-4848-9b74-1a820e8aad42\",\"col\":4,\"row\":2,\"label\":\"B2\"},{\"id\":\"b47fff56-fb87-4c8c-9093-b64b829c674e\",\"col\":5,\"row\":2,\"label\":\"B1\"},{\"id\":\"41679af9-b843-4bd4-bcf1-a6e34eb28198\",\"col\":1,\"row\":3,\"label\":\"C4\"},{\"id\":\"58b286a1-aaee-4673-accb-0229c311e8bb\",\"col\":2,\"row\":3,\"label\":\"C3\"},{\"id\":\"0b3cd440-c04a-4336-a112-2555e4f95d2a\",\"col\":4,\"row\":3,\"label\":\"C2\"},{\"id\":\"fcc505d8-e57d-4389-9e0d-554a31f7e0b7\",\"col\":5,\"row\":3,\"label\":\"C1\"},{\"id\":\"3cc28dc1-cdf9-4334-b67a-1b055ffa1fa4\",\"col\":1,\"row\":4,\"label\":\"D4\"},{\"id\":\"25f0fd88-3a4a-42df-94a3-5e5fcb5875b5\",\"col\":2,\"row\":4,\"label\":\"D3\"},{\"id\":\"8b519706-a626-44ab-8657-b2c134c7a6cd\",\"col\":4,\"row\":4,\"label\":\"D2\"},{\"id\":\"e644a69c-03db-45d9-9441-8395cb60ed00\",\"col\":5,\"row\":4,\"label\":\"D1\"},{\"id\":\"efe96cec-8087-483e-afae-7d5d80cf2b91\",\"col\":4,\"row\":5,\"label\":\"E2\"},{\"id\":\"39f4b853-95ca-49a1-b716-3fda58065602\",\"col\":5,\"row\":5,\"label\":\"E1\"},{\"id\":\"50e619e0-4969-4814-99f7-78f282bc1d79\",\"col\":4,\"row\":6,\"label\":\"F2\"},{\"id\":\"6ae91c5e-75c2-4cde-bc09-14183591c9f6\",\"col\":5,\"row\":6,\"label\":\"F1\"},{\"id\":\"2cb6dc17-8577-4dff-bb74-75dded3fd4a4\",\"col\":1,\"row\":5,\"label\":\"E4\"},{\"id\":\"9f57ee66-4d2a-488d-bd7d-7eec2508b313\",\"col\":2,\"row\":5,\"label\":\"E3\"},{\"id\":\"06107cfa-968d-40ee-ba62-6596f334fe9f\",\"col\":4,\"row\":7,\"label\":\"G2\"},{\"id\":\"17074bdb-351e-4b66-828a-54cabbc18e4c\",\"col\":5,\"row\":7,\"label\":\"G1\"},{\"id\":\"255b0744-7e03-420c-96c9-67d64b6b8d7c\",\"col\":1,\"row\":8,\"label\":\"H4\"},{\"id\":\"76d3a181-f9cd-45b8-8189-6eed50e36c3f\",\"col\":2,\"row\":8,\"label\":\"H3\"},{\"id\":\"f8c9a807-f5e4-4c26-b909-b4114343f401\",\"col\":4,\"row\":8,\"label\":\"H2\"},{\"id\":\"dcd93a91-e1f1-4ca9-81b0-404d03b56ef1\",\"col\":5,\"row\":8,\"label\":\"H1\"},{\"id\":\"6efb8732-d4b9-4222-b8b9-23597c9a022f\",\"col\":1,\"row\":9,\"label\":\"I4\"},{\"id\":\"b01c6e08-72ff-449a-b5cd-8ce362a285be\",\"col\":2,\"row\":9,\"label\":\"I3\"},{\"id\":\"db74400f-7c0b-493e-a9bd-47c596e20d74\",\"col\":4,\"row\":9,\"label\":\"I2\"},{\"id\":\"461cfd2f-7355-443f-af45-87354312c373\",\"col\":5,\"row\":9,\"label\":\"I1\"},{\"id\":\"cb633b82-9169-4d7f-a5da-97e626dbb1af\",\"col\":1,\"row\":10,\"label\":\"J4\"},{\"id\":\"47264196-0997-4dce-b123-53a5b293ece6\",\"col\":2,\"row\":10,\"label\":\"J3\"},{\"id\":\"03cf017c-532a-4faf-a91c-a2616e3d0b7f\",\"col\":4,\"row\":10,\"label\":\"J2\"},{\"id\":\"dbaa9bf9-5d4c-4509-ada0-b327df484afc\",\"col\":5,\"row\":10,\"label\":\"J1\"},{\"id\":\"ed1974a3-ba15-423b-99c4-cd14198aced7\",\"col\":1,\"row\":11,\"label\":\"K4\"},{\"id\":\"29a03f34-6fa2-4ed2-94cd-00be37759aae\",\"col\":2,\"row\":11,\"label\":\"K3\"},{\"id\":\"6afe4d7c-ccaf-4536-931e-7460c8246369\",\"col\":4,\"row\":11,\"label\":\"K2\"},{\"id\":\"fe51a283-0127-4ac4-b16b-87aa197c4f26\",\"col\":5,\"row\":11,\"label\":\"K1\"},{\"id\":\"695d14ec-7f2b-4434-98c4-6c9f8a79ebdc\",\"col\":1,\"row\":12,\"label\":\"L4\"},{\"id\":\"5ccb9c4c-800f-48c8-8dde-cc6cdc17fb1f\",\"col\":2,\"row\":12,\"label\":\"L3\"},{\"id\":\"2042b476-4967-44f0-a830-c17cfc5e2008\",\"col\":4,\"row\":12,\"label\":\"L2\"},{\"id\":\"e9011670-0cd8-48d5-ae16-0208e05a9ab9\",\"col\":5,\"row\":12,\"label\":\"L1\"},{\"id\":\"abb77ad0-e5cd-4bb4-bf78-803f6475b25b\",\"col\":3,\"row\":13,\"label\":\"N1\"},{\"id\":\"b006bbe4-9a41-443b-a73e-66961b1563b2\",\"col\":1,\"row\":13,\"label\":\"M4\"},{\"id\":\"9b4e056e-a17c-41f1-a220-c7f714c7fffc\",\"col\":2,\"row\":13,\"label\":\"M3\"},{\"id\":\"d5a19ce0-8bd3-435a-87d6-7f5a4c0ffd7c\",\"col\":5,\"row\":13,\"label\":\"M1\"},{\"id\":\"38015ef2-25de-42a7-97ca-80d89164da7c\",\"col\":4,\"row\":13,\"label\":\"M2\"}],\"aisles\":[{\"col\":3,\"row\":1},{\"col\":3,\"row\":2},{\"col\":3,\"row\":3},{\"col\":3,\"row\":4},{\"col\":3,\"row\":5},{\"col\":3,\"row\":6},{\"col\":3,\"row\":7},{\"col\":3,\"row\":8},{\"col\":3,\"row\":9},{\"col\":3,\"row\":10},{\"col\":1,\"row\":6},{\"col\":2,\"row\":6},{\"col\":3,\"row\":11},{\"col\":2,\"row\":7},{\"col\":1,\"row\":7}]}', NULL, NULL, NULL, NULL),
(20, 9, 'T 345 DFL', NULL, NULL, 10, 45, 1, '255628042409', '2025-05-12 07:16:57', '2025-05-12 00:16:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 3, 'T 571 DPH', NULL, 'Television, Bites and Drinks, Free WiFi, CCTV camera', 10, 49, 1, '+255753020945', '2025-05-24 03:21:13', '2026-02-26 21:45:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"id\":null,\"cols\":5,\"name\":\"Untitled Layout\",\"rows\":13,\"seats\":[{\"id\":\"5861a77e-66d6-49d0-83b6-3f82790aa906\",\"col\":1,\"row\":1,\"label\":\"A1\"},{\"id\":\"649f3742-fed8-4e11-ae70-ad40127b0695\",\"col\":2,\"row\":1,\"label\":\"A2\"},{\"id\":\"4e8e55f8-08b0-4924-9202-2335fbfeaca3\",\"col\":4,\"row\":1,\"label\":\"A3\"},{\"id\":\"c2975219-3220-4ee6-8f6f-3c083638d568\",\"col\":5,\"row\":1,\"label\":\"A4\"},{\"id\":\"d5a307ea-0fdc-4091-a21d-5b3759985fef\",\"col\":1,\"row\":2,\"label\":\"B1\"},{\"id\":\"ce80a808-3aad-404c-8668-0edead3dca3a\",\"col\":2,\"row\":2,\"label\":\"B2\"},{\"id\":\"3c463b4d-fdbd-4c41-8350-9a1fdc3bf030\",\"col\":4,\"row\":2,\"label\":\"B3\"},{\"id\":\"84287e38-52c0-43ee-85b1-e41d004615bc\",\"col\":5,\"row\":2,\"label\":\"B4\"},{\"id\":\"8749d0eb-f8c6-4eb7-90f1-c10793fcc3d7\",\"col\":1,\"row\":3,\"label\":\"C1\"},{\"id\":\"fb176dc5-6884-493f-9fc2-d535f31eabc3\",\"col\":2,\"row\":3,\"label\":\"C2\"},{\"id\":\"591e95f5-c618-4dff-9665-f4878876d96f\",\"col\":4,\"row\":3,\"label\":\"C3\"},{\"id\":\"9ea09d0d-05d9-4d4e-bb2c-9e92feb9ec1c\",\"col\":5,\"row\":3,\"label\":\"C4\"},{\"id\":\"ddc79fd5-2a72-4e78-8204-5d00634ac5e1\",\"col\":1,\"row\":4,\"label\":\"D1\"},{\"id\":\"889af8a4-6656-4e72-8495-b6487fea8ba3\",\"col\":2,\"row\":4,\"label\":\"D2\"},{\"id\":\"79c797ca-ed0f-4d08-af2c-fbdee37419bb\",\"col\":4,\"row\":4,\"label\":\"D3\"},{\"id\":\"bba138d2-1952-4447-9f0d-12be116905e7\",\"col\":5,\"row\":4,\"label\":\"D4\"},{\"id\":\"17d91874-0f36-4929-a9bd-cc7cc56129b9\",\"col\":1,\"row\":5,\"label\":\"E1\"},{\"id\":\"3ddcdfd8-f76d-492f-ad85-12301133fdb4\",\"col\":2,\"row\":5,\"label\":\"E2\"},{\"id\":\"bfadd202-8abf-4597-8eff-e27272afd37f\",\"col\":4,\"row\":5,\"label\":\"E3\"},{\"id\":\"7d7b9d49-fc60-49d2-8a59-b583c0153034\",\"col\":5,\"row\":5,\"label\":\"E4\"},{\"id\":\"ac283ef8-8d3c-49fd-9cc7-e1f0efed5a29\",\"col\":4,\"row\":6,\"label\":\"F3\"},{\"id\":\"c167b67f-8f5b-4bd1-b464-e6242501c2e7\",\"col\":5,\"row\":6,\"label\":\"F4\"},{\"id\":\"f79c7f17-68a5-47b7-87a3-fb4fc5242174\",\"col\":4,\"row\":7,\"label\":\"G3\"},{\"id\":\"54f5c97f-1e27-42c3-8eae-533e29e5b658\",\"col\":5,\"row\":7,\"label\":\"G4\"},{\"id\":\"c2ba9ae5-76ca-40fd-9ea3-1f1485f38381\",\"col\":1,\"row\":8,\"label\":\"H1\"},{\"id\":\"8d79e517-db6d-4965-9e4c-215cda2250fa\",\"col\":2,\"row\":8,\"label\":\"H2\"},{\"id\":\"1d7f3771-c08a-4599-a2e4-6a1107944ca8\",\"col\":4,\"row\":8,\"label\":\"H3\"},{\"id\":\"692bffde-36e7-43ce-9c27-3caab1467464\",\"col\":5,\"row\":8,\"label\":\"H4\"},{\"id\":\"58138ed8-94c7-4930-a6a0-faf7802f996d\",\"col\":1,\"row\":9,\"label\":\"I1\"},{\"id\":\"4558b2ee-cf88-4926-8f94-1ef2ee724f42\",\"col\":2,\"row\":9,\"label\":\"I2\"},{\"id\":\"c5a51841-4bd8-4c7c-90ce-ef4b64144821\",\"col\":4,\"row\":9,\"label\":\"I3\"},{\"id\":\"d19c9ed7-346c-4fb7-9c53-e72f5b9edafa\",\"col\":5,\"row\":9,\"label\":\"I4\"},{\"id\":\"f3b44493-c2fa-44dd-972c-2c52ec1bf30e\",\"col\":1,\"row\":10,\"label\":\"J1\"},{\"id\":\"9a53f433-4caa-4ee1-8326-a5f5167bf4de\",\"col\":2,\"row\":10,\"label\":\"J2\"},{\"id\":\"fdd4e99c-4bbd-4057-8c2c-fa04baaa47e0\",\"col\":4,\"row\":10,\"label\":\"J3\"},{\"id\":\"7c994199-ecf3-42b3-906d-3d3eeb2f7390\",\"col\":5,\"row\":10,\"label\":\"J4\"},{\"id\":\"0e603421-dedf-47c2-b70a-387d587b5d80\",\"col\":1,\"row\":11,\"label\":\"K1\"},{\"id\":\"7a91988d-1edf-461f-ab78-8711100650ad\",\"col\":2,\"row\":11,\"label\":\"K2\"},{\"id\":\"21857580-02ab-43cd-9c10-71a7390c28cd\",\"col\":4,\"row\":11,\"label\":\"K3\"},{\"id\":\"07d4ef9f-ddab-4133-a5a2-0a47454e7268\",\"col\":5,\"row\":11,\"label\":\"K4\"},{\"id\":\"cc8f2dab-5013-4820-88de-2d402b12fd3f\",\"col\":1,\"row\":12,\"label\":\"L1\"},{\"id\":\"bf9e0414-c08e-4127-a5fe-2841e01aeb7a\",\"col\":2,\"row\":12,\"label\":\"L2\"},{\"id\":\"6c429d98-9f5a-451e-861d-a28db3a1be5c\",\"col\":4,\"row\":12,\"label\":\"L3\"},{\"id\":\"00eb1790-705e-4eb8-8fa3-f088205b1870\",\"col\":5,\"row\":12,\"label\":\"L4\"},{\"id\":\"be972b12-dc0f-4fac-8610-e4163791299c\",\"col\":1,\"row\":13,\"label\":\"M1\"},{\"id\":\"769011c5-4a6b-437b-bbe2-92001f04ec56\",\"col\":2,\"row\":13,\"label\":\"M2\"},{\"id\":\"e125e1c7-936d-4d8e-b7a1-42631f8fe7e9\",\"col\":3,\"row\":13,\"label\":\"N1\"},{\"id\":\"905dd242-94fc-457d-8e90-7782e6cf0315\",\"col\":4,\"row\":13,\"label\":\"M3\"},{\"id\":\"4b6170b1-21a1-4e6a-9efc-c57469fd32c7\",\"col\":5,\"row\":13,\"label\":\"M4\"}],\"aisles\":[{\"col\":3,\"row\":1},{\"col\":3,\"row\":2},{\"col\":3,\"row\":3},{\"col\":3,\"row\":4},{\"col\":3,\"row\":5},{\"col\":3,\"row\":6},{\"col\":3,\"row\":7},{\"col\":3,\"row\":8},{\"col\":3,\"row\":9},{\"col\":3,\"row\":10},{\"col\":3,\"row\":11},{\"col\":3,\"row\":12},{\"col\":1,\"row\":6},{\"col\":1,\"row\":7},{\"col\":2,\"row\":6},{\"col\":2,\"row\":7}]}', NULL, NULL, NULL, NULL),
(24, 20, 'T 909 EAT', NULL, NULL, 10, 45, 1, '0715553803', '2025-05-24 13:47:22', '2025-05-24 16:47:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 27, 'T 999 EAT', NULL, NULL, 10, 48, 1, '0715553803', '2025-05-24 19:45:58', '2025-05-24 22:45:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 21, 'T 101 EAN', NULL, NULL, 10, 40, 1, '+255753020945', '2025-05-30 23:48:25', '2025-05-31 02:52:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 21, 'T 988 EAG', NULL, NULL, 10, 40, 1, '+255753020945', '2025-05-30 23:56:52', '2025-05-31 03:01:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 21, 'T 256 DMD', NULL, NULL, 10, 40, 1, '+255753020945', '2025-05-31 00:06:26', '2025-05-31 03:08:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 3, 'T 996 EEE', NULL, NULL, 30, 29, 1, '+255753020945', '2025-06-01 08:09:49', '2025-10-28 16:57:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"id\": null, \"cols\": 4, \"name\": \"Untitled Layout\", \"rows\": 10, \"seats\": [{\"id\": \"7b53a0b4-007e-4199-9380-be395d21bcd3\", \"col\": 1, \"row\": 1, \"label\": \"A1\"}, {\"id\": \"8da1b39c-a16d-4fea-8569-5ab213266262\", \"col\": 3, \"row\": 1, \"label\": \"A2\"}, {\"id\": \"e7c663ba-2b34-4e83-a431-28cd68f4c99d\", \"col\": 4, \"row\": 1, \"label\": \"A3\"}, {\"id\": \"22e43cf3-2c38-4d12-9a86-2acba5880200\", \"col\": 1, \"row\": 2, \"label\": \"A4\"}, {\"id\": \"0e89e27e-bbd8-4a33-b91f-39450ac594a1\", \"col\": 3, \"row\": 2, \"label\": \"A5\"}, {\"id\": \"4eb44c25-4f71-4855-a27d-c03a199eae56\", \"col\": 4, \"row\": 2, \"label\": \"A6\"}, {\"id\": \"0932050b-e541-4675-a5a1-924c616b6f07\", \"col\": 3, \"row\": 3, \"label\": \"A7\"}, {\"id\": \"6648ba52-b52e-42da-bd9d-6ec10604440c\", \"col\": 4, \"row\": 3, \"label\": \"A8\"}, {\"id\": \"0c6d7a2f-bd5e-4024-85a3-e7189c42e5e4\", \"col\": 1, \"row\": 4, \"label\": \"A9\"}, {\"id\": \"bc870437-5800-428d-97cf-e401761fc385\", \"col\": 3, \"row\": 4, \"label\": \"A10\"}, {\"id\": \"b938e1be-edd8-4c18-a132-c43a3d1f3d7e\", \"col\": 4, \"row\": 4, \"label\": \"A11\"}, {\"id\": \"91c3be1f-fdd6-4e56-bd62-59633008529f\", \"col\": 1, \"row\": 5, \"label\": \"A12\"}, {\"id\": \"5060db9b-ca1e-407d-b404-3bbf378e6b3f\", \"col\": 3, \"row\": 5, \"label\": \"A13\"}, {\"id\": \"c4eea6a6-eeb3-422d-819b-cd6d3c9dff99\", \"col\": 4, \"row\": 5, \"label\": \"A14\"}, {\"id\": \"49107f33-464b-4401-983a-269cd3a6c5fc\", \"col\": 1, \"row\": 6, \"label\": \"A15\"}, {\"id\": \"5deee382-663f-41ef-8c9f-e16374e235d2\", \"col\": 3, \"row\": 6, \"label\": \"A16\"}, {\"id\": \"e6af1f56-28be-43fd-a727-fe5a931578bc\", \"col\": 4, \"row\": 6, \"label\": \"A17\"}, {\"id\": \"16f78ff6-d62b-4c96-a636-76a2409c8b23\", \"col\": 1, \"row\": 7, \"label\": \"A18\"}, {\"id\": \"2316632f-2084-4b7a-b72b-1996b33ddfc5\", \"col\": 3, \"row\": 7, \"label\": \"A19\"}, {\"id\": \"094a7eee-771b-49e1-a116-6c0e39703054\", \"col\": 4, \"row\": 7, \"label\": \"A20\"}, {\"id\": \"5322e0e2-6174-4786-abcd-a28080e25779\", \"col\": 1, \"row\": 8, \"label\": \"A21\"}, {\"id\": \"ed6efe1e-32c2-4da0-a4c4-f3a0d6d19f2b\", \"col\": 3, \"row\": 8, \"label\": \"A22\"}, {\"id\": \"0d77c563-0553-48fc-a1dc-6b4649c42d1c\", \"col\": 4, \"row\": 8, \"label\": \"A23\"}, {\"id\": \"b918b23f-6ebe-45de-a521-79e4a0f9f360\", \"col\": 3, \"row\": 9, \"label\": \"A25\"}, {\"id\": \"bab836ff-9e72-46dc-894c-70b14382fe0c\", \"col\": 4, \"row\": 9, \"label\": \"A26\"}, {\"id\": \"c26ea107-073c-46ea-92cf-b1732ed91eb0\", \"col\": 1, \"row\": 10, \"label\": \"A27\"}, {\"id\": \"86a3c168-5921-413f-a7cf-cfe43f8d23ca\", \"col\": 2, \"row\": 10, \"label\": \"A28\"}, {\"id\": \"edd1bef3-4402-47e0-835c-0a58ce6e10f5\", \"col\": 3, \"row\": 10, \"label\": \"A29\"}, {\"id\": \"f0e9efc6-5be0-4ce8-923c-7f6a1cba48ad\", \"col\": 4, \"row\": 10, \"label\": \"A30\"}, {\"id\": \"f8cbd7b2-6ad5-4a76-a24d-7e63d6758752\", \"col\": 1, \"row\": 9, \"label\": \"A24\"}], \"aisles\": [{\"col\": 2, \"row\": 1}, {\"col\": 2, \"row\": 2}, {\"col\": 2, \"row\": 3}, {\"col\": 2, \"row\": 4}, {\"col\": 2, \"row\": 5}, {\"col\": 2, \"row\": 6}, {\"col\": 2, \"row\": 7}, {\"col\": 2, \"row\": 8}, {\"col\": 1, \"row\": 3}, {\"col\": 2, \"row\": 9}]}', NULL, NULL, NULL, NULL),
(30, 3, 'T 211 ECA', NULL, NULL, 20, 49, 1, '+255753020945', '2025-06-08 00:58:45', '2025-10-24 06:13:52', 'Johnson Gabba', '0688987654', NULL, NULL, 'Misosi Milanzi', 'Salama Mahita', '0745565176', NULL, NULL, 'Yutong D14', '{\"id\": null, \"cols\": 5, \"name\": \"Untitled Layout\", \"rows\": 15, \"seats\": [{\"id\": \"ae6dd174-b531-48f6-8f0d-847e0cfdea10\", \"col\": 1, \"row\": 3, \"label\": \"01\"}, {\"id\": \"bdf628ce-c8ff-48a3-ac13-dc1a7fb50264\", \"col\": 2, \"row\": 3, \"label\": \"02\"}, {\"id\": \"37dccb61-8374-437a-b93e-b30cf488b5f5\", \"col\": 4, \"row\": 3, \"label\": \"04\"}, {\"id\": \"e67ae0c7-4e85-4896-a147-0718fd89abb0\", \"col\": 5, \"row\": 3, \"label\": \"03\"}, {\"id\": \"efdead2e-2d45-4930-a1a8-3d909f7bee08\", \"col\": 1, \"row\": 4, \"label\": \"05\"}, {\"id\": \"fe44ac6b-bfca-4360-a696-5bf2f884ad82\", \"col\": 2, \"row\": 4, \"label\": \"06\"}, {\"id\": \"d1fa20c1-bfe9-46e8-b828-db4a370cec6b\", \"col\": 4, \"row\": 4, \"label\": \"08\"}, {\"id\": \"b14f5724-6ddf-4e76-996c-fa689a0ea76f\", \"col\": 5, \"row\": 4, \"label\": \"07\"}, {\"id\": \"3f01fdca-0be8-4b09-8f84-4babec8f5854\", \"col\": 1, \"row\": 5, \"label\": \"09\"}, {\"id\": \"c8d4b640-4faa-4daf-be1a-b9cd2cb91780\", \"col\": 2, \"row\": 5, \"label\": \"10\"}, {\"id\": \"eb44e236-aa9a-481b-881a-275034dfdd3f\", \"col\": 4, \"row\": 5, \"label\": \"12\"}, {\"id\": \"e4f50bb4-8520-41b4-82b1-ab5038ce7fb9\", \"col\": 5, \"row\": 5, \"label\": \"11\"}, {\"id\": \"d5a66ca0-6afc-4856-b661-7584a39448ac\", \"col\": 4, \"row\": 6, \"label\": \"16\"}, {\"id\": \"2280aafc-d8db-4e83-9918-5ee80dc8ef14\", \"col\": 5, \"row\": 6, \"label\": \"15\"}, {\"id\": \"2744920d-5bfa-49c6-8e1e-a94c7ece2043\", \"col\": 4, \"row\": 7, \"label\": \"20\"}, {\"id\": \"08f8e904-ea55-4a11-b6e2-8f1c004630df\", \"col\": 5, \"row\": 7, \"label\": \"19\"}, {\"id\": \"ee09462a-a977-4822-a68d-ea393434b8ba\", \"col\": 4, \"row\": 8, \"label\": \"22\"}, {\"id\": \"ed6b2161-f82b-4dc3-b5ce-ffb92bcd60d1\", \"col\": 5, \"row\": 8, \"label\": \"21\"}, {\"id\": \"db915730-bf4f-4aeb-9029-0ae5aaad343e\", \"col\": 4, \"row\": 9, \"label\": \"24\"}, {\"id\": \"cc4ee73b-fc11-4034-a3f8-9855f78b89d2\", \"col\": 5, \"row\": 9, \"label\": \"23\"}, {\"id\": \"673c8b5f-bdcc-4d81-9ff2-f49834095567\", \"col\": 1, \"row\": 10, \"label\": \"25\"}, {\"id\": \"60255fcb-551c-436c-8d85-b333fe8390fc\", \"col\": 2, \"row\": 10, \"label\": \"26\"}, {\"id\": \"39fa0d93-3ce0-444c-ba05-8696a5d97801\", \"col\": 4, \"row\": 10, \"label\": \"28\"}, {\"id\": \"65c3ca60-ca68-48c9-9e1e-fa934d3a5dc8\", \"col\": 5, \"row\": 10, \"label\": \"27\"}, {\"id\": \"594bc786-75a0-4a97-a314-8e2d1c767d1e\", \"col\": 1, \"row\": 11, \"label\": \"29\"}, {\"id\": \"9bc9c1c9-a018-4f73-b928-a0b20d77e6f5\", \"col\": 2, \"row\": 11, \"label\": \"30\"}, {\"id\": \"bc4c0a85-450c-4164-a09c-ada0b395b84d\", \"col\": 4, \"row\": 11, \"label\": \"32\"}, {\"id\": \"2b963a1c-9ddc-483c-94b8-81ed8b95c8b2\", \"col\": 5, \"row\": 11, \"label\": \"31\"}, {\"id\": \"1a52f315-296e-4f8b-8230-85d4c74708b9\", \"col\": 1, \"row\": 12, \"label\": \"33\"}, {\"id\": \"f79f8200-0a8f-4d76-870c-259fd884f9b7\", \"col\": 2, \"row\": 12, \"label\": \"34\"}, {\"id\": \"c71a2392-379a-4d87-8dcf-df62318111b7\", \"col\": 4, \"row\": 12, \"label\": \"36\"}, {\"id\": \"8766c786-5a71-4b93-9772-b69d3a7e8c57\", \"col\": 5, \"row\": 12, \"label\": \"35\"}, {\"id\": \"6b61055b-62e8-4062-b11a-7603a79cb54e\", \"col\": 1, \"row\": 13, \"label\": \"37\"}, {\"id\": \"43860db3-6c9e-434d-ada0-0e4c86a319f9\", \"col\": 2, \"row\": 13, \"label\": \"38\"}, {\"id\": \"02ae2840-0768-4e20-9b2d-9194d4a28032\", \"col\": 5, \"row\": 15, \"label\": \"47\"}, {\"id\": \"bbcb9226-5e5e-41e1-8b2b-3e57ae355a21\", \"col\": 4, \"row\": 13, \"label\": \"40\"}, {\"id\": \"20e9eaf2-f189-48d5-b3e8-37fdddd3c4b3\", \"col\": 5, \"row\": 13, \"label\": \"39\"}, {\"id\": \"ef379e58-cede-4afb-827b-af33384e99a6\", \"col\": 1, \"row\": 14, \"label\": \"41\"}, {\"id\": \"fabdb39b-8382-4b04-9e8a-8d0440b01fbf\", \"col\": 2, \"row\": 14, \"label\": \"42\"}, {\"id\": \"f6116b50-5299-4c4e-8ccf-2843c1555bea\", \"col\": 4, \"row\": 14, \"label\": \"44\"}, {\"id\": \"b3168006-5731-4066-96c0-18f28d0325af\", \"col\": 5, \"row\": 14, \"label\": \"43\"}, {\"id\": \"3342b0b7-457b-4e7f-b7ca-cc7238deed10\", \"col\": 1, \"row\": 15, \"label\": \"45\"}, {\"id\": \"2abfd561-45ee-4aaa-97fb-c0c06669b567\", \"col\": 2, \"row\": 15, \"label\": \"46\"}, {\"id\": \"8ea209c0-f5a6-4aee-afc6-18a477255522\", \"col\": 3, \"row\": 15, \"label\": \"49\"}, {\"id\": \"ac88e293-9803-4800-acc4-dac8b6aa92fd\", \"col\": 4, \"row\": 15, \"label\": \"48\"}, {\"id\": \"0f96fc17-c912-43ae-8dba-5cb6033c6c90\", \"col\": 1, \"row\": 6, \"label\": \"13\"}, {\"id\": \"a26f2ea9-9f60-479a-95f2-f24235868d13\", \"col\": 2, \"row\": 6, \"label\": \"14\"}, {\"id\": \"2ca2a74f-7fe7-4bc3-b92d-cf65443d11e6\", \"col\": 1, \"row\": 7, \"label\": \"17\"}, {\"id\": \"e43fa252-f0a0-4475-96ce-1ebcc0bf0480\", \"col\": 2, \"row\": 7, \"label\": \"18\"}], \"aisles\": [{\"col\": 3, \"row\": 1}, {\"col\": 3, \"row\": 2}, {\"col\": 3, \"row\": 3}, {\"col\": 3, \"row\": 4}, {\"col\": 3, \"row\": 5}, {\"col\": 3, \"row\": 6}, {\"col\": 3, \"row\": 7}, {\"col\": 3, \"row\": 8}, {\"col\": 3, \"row\": 9}, {\"col\": 3, \"row\": 10}, {\"col\": 3, \"row\": 11}, {\"col\": 3, \"row\": 12}, {\"col\": 1, \"row\": 1}, {\"col\": 2, \"row\": 1}, {\"col\": 4, \"row\": 1}, {\"col\": 5, \"row\": 1}, {\"col\": 5, \"row\": 2}, {\"col\": 4, \"row\": 2}, {\"col\": 2, \"row\": 2}, {\"col\": 1, \"row\": 2}, {\"col\": 3, \"row\": 13}, {\"col\": 3, \"row\": 14}, {\"col\": 1, \"row\": 8}, {\"col\": 2, \"row\": 8}, {\"col\": 1, \"row\": 9}, {\"col\": 2, \"row\": 9}]}', NULL, NULL, NULL, NULL),
(32, 13, 'T 110 EFG', NULL, NULL, 30, 29, 1, '+255753020945', '2025-06-14 20:06:37', '2025-07-06 10:02:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 3, 'T 345 KKK', NULL, NULL, 20, 53, 1, '255628042409', '2025-06-15 13:56:10', '2025-07-29 15:12:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 3, 'T 345 MMM', NULL, NULL, 20, 53, 1, '255628042409', '2025-06-15 13:56:28', '2025-07-29 15:17:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 3, 'T 999 DTP', NULL, 'Full security, Free Wi-Fi', 10, 60, 1, '+255755879793', '2025-07-30 07:42:43', '2025-07-30 10:52:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 3, 'T 998 DTP', NULL, 'Full security, Free Wi-Fi', 10, 60, 1, '+255755879793', '2025-07-30 07:49:23', '2025-07-30 10:54:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 9, 'T 997 EFE', NULL, NULL, 10, 53, 1, '255628042409', '2025-08-25 11:48:20', '2025-08-25 14:48:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 3, 'T 777 pop', NULL, NULL, 20, 53, 1, '+255753020945', '2025-10-03 22:07:22', '2025-10-04 01:07:22', 'ibrahim', '123412341234', NULL, NULL, 'issa', 'pop', '12341234', 'ppp', '12341234', 'Yutong D14', '{\"id\": null, \"cols\": 5, \"name\": \"Yutong D14\", \"rows\": 13, \"seats\": [{\"id\": \"c6f68c96-6153-4e63-8281-04495043fb99\", \"col\": 1, \"row\": 1, \"label\": \"A1\"}, {\"id\": \"d1f27f15-4710-4c06-8641-00adb3736525\", \"col\": 2, \"row\": 1, \"label\": \"A2\"}, {\"id\": \"b8480f89-5820-4182-946e-8e7947a02149\", \"col\": 4, \"row\": 1, \"label\": \"A4\"}, {\"id\": \"c063cac9-4a79-428d-a31e-c4b4786ae0e7\", \"col\": 5, \"row\": 1, \"label\": \"A5\"}, {\"id\": \"11b38e4a-28b4-44ae-9007-519b9cd8cb51\", \"col\": 1, \"row\": 2, \"label\": \"A6\"}, {\"id\": \"ac9b8088-7026-4c14-a30a-0f9674b9e8ae\", \"col\": 2, \"row\": 2, \"label\": \"A7\"}, {\"id\": \"373d7948-db34-44ea-80ef-3112f66beb77\", \"col\": 5, \"row\": 12, \"label\": \"A8\"}, {\"id\": \"87108ada-098f-43b5-9065-c6a0d6c7ce5f\", \"col\": 4, \"row\": 2, \"label\": \"A9\"}, {\"id\": \"65042a62-3589-4a9a-8d7e-9bc40fb86ad9\", \"col\": 5, \"row\": 2, \"label\": \"A10\"}, {\"id\": \"0e72d7dd-e6a8-4c6f-9c5a-5ad263996d95\", \"col\": 1, \"row\": 3, \"label\": \"A11\"}, {\"id\": \"976487f3-20b7-4cf8-a128-64057d3176f7\", \"col\": 2, \"row\": 3, \"label\": \"A12\"}, {\"id\": \"d3a73b84-e23f-47cd-9cda-720230ab7400\", \"col\": 5, \"row\": 13, \"label\": \"A13\"}, {\"id\": \"6575311c-fe04-4f5c-b96d-03c7be93da30\", \"col\": 4, \"row\": 3, \"label\": \"A14\"}, {\"id\": \"25bbef57-5856-4d66-abea-8945cac96d45\", \"col\": 5, \"row\": 3, \"label\": \"A15\"}, {\"id\": \"3bb50c9b-0b81-4ddc-bfc6-3bdaee6a891d\", \"col\": 1, \"row\": 4, \"label\": \"A16\"}, {\"id\": \"afaa5788-d078-43c1-80ad-9f75d0df3fdc\", \"col\": 2, \"row\": 4, \"label\": \"A17\"}, {\"id\": \"52b07b68-f96a-404e-b41f-cff1b4eeb9e8\", \"col\": 1, \"row\": 13, \"label\": \"A18\"}, {\"id\": \"2280d720-db2f-41eb-8cab-9f7f905c3d5c\", \"col\": 4, \"row\": 4, \"label\": \"A19\"}, {\"id\": \"98aba689-746f-4653-92e4-26dfe6c8d5a3\", \"col\": 5, \"row\": 4, \"label\": \"A20\"}, {\"id\": \"95f360fd-88ab-4d41-8570-df5072b89192\", \"col\": 1, \"row\": 5, \"label\": \"A21\"}, {\"id\": \"dedf4dcd-afed-46f7-8056-90f21b092d18\", \"col\": 2, \"row\": 5, \"label\": \"A22\"}, {\"id\": \"6fadf2ad-3fb2-4fb4-afe8-9f95274290d2\", \"col\": 2, \"row\": 13, \"label\": \"A23\"}, {\"id\": \"22542db2-9563-40ed-9cbc-b9994bbef636\", \"col\": 4, \"row\": 5, \"label\": \"A24\"}, {\"id\": \"f8ab1ac3-dec7-49a0-92f0-ab28bc6629c4\", \"col\": 5, \"row\": 5, \"label\": \"A25\"}, {\"id\": \"c3c578d6-2d97-4c93-88cb-a349f0ef6b0f\", \"col\": 1, \"row\": 8, \"label\": \"A26\"}, {\"id\": \"47ad8684-2a61-490a-96ad-59182a237247\", \"col\": 2, \"row\": 8, \"label\": \"A27\"}, {\"id\": \"55b93b31-18b6-4922-b045-2559518e2c66\", \"col\": 3, \"row\": 13, \"label\": \"A28\"}, {\"id\": \"ac1e6089-3361-49b6-8af8-f8da2194e7fe\", \"col\": 4, \"row\": 6, \"label\": \"A29\"}, {\"id\": \"1ce02ecc-c96f-4362-9374-d660706cd7df\", \"col\": 5, \"row\": 6, \"label\": \"A30\"}, {\"id\": \"a394e7cd-6c3f-4684-b729-ef2c4531937c\", \"col\": 1, \"row\": 9, \"label\": \"A31\"}, {\"id\": \"93aecdc8-3e4d-42cb-98e2-89f5e9fd810f\", \"col\": 2, \"row\": 9, \"label\": \"A32\"}, {\"id\": \"3262825d-7fb3-4de1-a109-78e1e9b66117\", \"col\": 4, \"row\": 13, \"label\": \"A33\"}, {\"id\": \"e6843785-2939-4a1d-9878-106a07294870\", \"col\": 4, \"row\": 7, \"label\": \"A34\"}, {\"id\": \"239b2920-1b67-43b0-bff5-9963fd79f5fd\", \"col\": 5, \"row\": 7, \"label\": \"A35\"}, {\"id\": \"7d919185-f973-4121-a293-7e36b88dddb6\", \"col\": 1, \"row\": 10, \"label\": \"A36\"}, {\"id\": \"4f56f053-1d49-49d1-83d6-f85681003e8c\", \"col\": 2, \"row\": 10, \"label\": \"A37\"}, {\"id\": \"462ffc3b-a910-48a3-974c-e5e7a00b5505\", \"col\": 4, \"row\": 12, \"label\": \"A38\"}, {\"id\": \"1e73112c-f639-4ffc-aa37-e6dc6bda284d\", \"col\": 4, \"row\": 8, \"label\": \"A39\"}, {\"id\": \"cc590ea6-fbb6-428f-9761-00cf3b2999d0\", \"col\": 5, \"row\": 8, \"label\": \"A40\"}, {\"id\": \"caa3eb45-3cad-4a01-88e4-3b9a61af754a\", \"col\": 1, \"row\": 11, \"label\": \"A41\"}, {\"id\": \"bcf4efbc-0a03-449f-85da-b96e81ea6324\", \"col\": 2, \"row\": 11, \"label\": \"A42\"}, {\"id\": \"04ef2361-b067-470f-a205-b206b7389955\", \"col\": 5, \"row\": 11, \"label\": \"A43\"}, {\"id\": \"f33c3c27-7227-461f-9c7f-ffba5736ac6e\", \"col\": 4, \"row\": 9, \"label\": \"A44\"}, {\"id\": \"9e6ee97c-6046-450b-a10e-9de05862d443\", \"col\": 5, \"row\": 9, \"label\": \"A45\"}, {\"id\": \"1c26190a-7f31-449e-a3e5-159bb4fcb06b\", \"col\": 1, \"row\": 12, \"label\": \"A46\"}, {\"id\": \"282dc668-228a-40a9-83de-3ab0c7dac929\", \"col\": 2, \"row\": 12, \"label\": \"A47\"}, {\"id\": \"4abc7a0f-5432-4bcf-aee9-0ac3a3f5d645\", \"col\": 4, \"row\": 11, \"label\": \"A48\"}, {\"id\": \"80bb4b99-3551-436e-a8e4-19f2437206f6\", \"col\": 4, \"row\": 10, \"label\": \"A49\"}, {\"id\": \"f1b93a61-0c7f-4a0d-bdc1-fe29f16adb8f\", \"col\": 5, \"row\": 10, \"label\": \"A50\"}], \"aisles\": []}', NULL, NULL, NULL, NULL),
(39, 3, 'T 555 FHU', NULL, NULL, 10, 53, 1, '255628042409', '2025-10-24 01:34:56', '2025-10-24 04:35:27', 'ibrahim', '0628042409', NULL, NULL, 'asma', 'pop', '0628042409', NULL, NULL, 'yutong D14', '{\"id\": null, \"cols\": 5, \"name\": \"Untitled Layout\", \"rows\": 10, \"seats\": [{\"id\": \"c44c478d-9743-4702-93fb-fe20e4d63b36\", \"col\": 1, \"row\": 1, \"label\": \"A1\"}, {\"id\": \"656ad2ba-97c1-417d-a210-8a1a57cf4431\", \"col\": 2, \"row\": 1, \"label\": \"A2\"}, {\"id\": \"fc85f1bb-f1e4-44d5-8217-c4033c5fb455\", \"col\": 4, \"row\": 1, \"label\": \"A3\"}, {\"id\": \"0cc7535a-d5a8-4b69-a68a-6daea42c37a8\", \"col\": 5, \"row\": 1, \"label\": \"A4\"}, {\"id\": \"0a756087-b057-4e4d-a1e2-1e7b4ef8491b\", \"col\": 1, \"row\": 2, \"label\": \"A5\"}, {\"id\": \"8b8f0164-9bb2-4e5a-841c-18b12af60a56\", \"col\": 2, \"row\": 2, \"label\": \"A6\"}, {\"id\": \"b9c11a1b-4c18-4512-8b0b-d4bbdf38825b\", \"col\": 4, \"row\": 2, \"label\": \"A7\"}, {\"id\": \"5193cf22-174f-491f-8857-0df39546427f\", \"col\": 5, \"row\": 2, \"label\": \"A8\"}, {\"id\": \"480ebae8-4a0a-4db7-ac36-36148737b38d\", \"col\": 1, \"row\": 3, \"label\": \"A9\"}, {\"id\": \"80a42a75-9142-4955-9a7b-ce74a39cc48c\", \"col\": 2, \"row\": 3, \"label\": \"A10\"}, {\"id\": \"7c9045b8-57ec-4836-bd04-b6c04d3d8671\", \"col\": 4, \"row\": 3, \"label\": \"A11\"}, {\"id\": \"a58e3624-e408-424a-9ef7-ed89a5a4f28e\", \"col\": 5, \"row\": 3, \"label\": \"A12\"}, {\"id\": \"4318472a-48b5-4b89-84c3-b61090de9d80\", \"col\": 1, \"row\": 4, \"label\": \"A13\"}, {\"id\": \"2da8f506-8b09-4ac6-bc7c-5192ee260ebe\", \"col\": 2, \"row\": 4, \"label\": \"A14\"}, {\"id\": \"a046cf58-3632-4f72-8ee4-9a285a8a7b1d\", \"col\": 4, \"row\": 4, \"label\": \"A15\"}, {\"id\": \"55b01b4c-b473-4d2a-a045-c1e2b09a7620\", \"col\": 5, \"row\": 4, \"label\": \"A16\"}, {\"id\": \"f6f7bf5f-095d-416e-854a-ee8a277a43fb\", \"col\": 1, \"row\": 5, \"label\": \"A17\"}, {\"id\": \"46965d38-2a3d-4653-986b-18ebafc7d8ff\", \"col\": 2, \"row\": 5, \"label\": \"A18\"}, {\"id\": \"91fc4dae-c7b0-4007-95ba-6e0d11256656\", \"col\": 4, \"row\": 5, \"label\": \"A19\"}, {\"id\": \"499fd894-e87a-4bc0-9fad-be51197d818e\", \"col\": 5, \"row\": 5, \"label\": \"A20\"}, {\"id\": \"1e3ed02f-c1df-4ebc-af24-81fdc98a1548\", \"col\": 1, \"row\": 6, \"label\": \"A21\"}, {\"id\": \"7f4416b2-9f0e-48f5-b456-95e62ec4ae63\", \"col\": 2, \"row\": 6, \"label\": \"A22\"}, {\"id\": \"f14ac5b2-3ea4-4167-a608-ffab33edc1b8\", \"col\": 4, \"row\": 6, \"label\": \"A23\"}, {\"id\": \"9160d767-4af8-4d63-9849-38168baaf92c\", \"col\": 5, \"row\": 6, \"label\": \"A24\"}, {\"id\": \"e40e7eb6-27ac-4bcc-9c59-ef1b3f486e0f\", \"col\": 1, \"row\": 7, \"label\": \"A25\"}, {\"id\": \"b2c7ca2c-0145-454d-9575-399e948fca3b\", \"col\": 2, \"row\": 7, \"label\": \"A26\"}, {\"id\": \"cf683f11-b8e3-4eb7-863d-4cadb4983786\", \"col\": 4, \"row\": 7, \"label\": \"A27\"}, {\"id\": \"f1279246-8b97-47b3-af2e-8543d05fbf55\", \"col\": 5, \"row\": 7, \"label\": \"A28\"}, {\"id\": \"3ad72e0d-22e4-4b5d-9926-bb7211f99581\", \"col\": 4, \"row\": 9, \"label\": \"A29\"}, {\"id\": \"22c43803-ac59-4c02-aff0-b892a55d2f86\", \"col\": 2, \"row\": 9, \"label\": \"A30\"}, {\"id\": \"e460d474-467a-4db9-9aec-6cdac357303e\", \"col\": 1, \"row\": 9, \"label\": \"A31\"}, {\"id\": \"a4ad484c-a596-40e3-a4ff-9c22d7b9fd4f\", \"col\": 5, \"row\": 8, \"label\": \"A32\"}, {\"id\": \"bf5ae311-cb5d-44bb-aef4-68faaf09b896\", \"col\": 1, \"row\": 8, \"label\": \"A33\"}, {\"id\": \"b79cbff7-8e28-4b21-8305-3af8739bffc1\", \"col\": 2, \"row\": 8, \"label\": \"A34\"}, {\"id\": \"7c5bc000-1dcd-411f-9c58-38f8dce74694\", \"col\": 4, \"row\": 8, \"label\": \"A35\"}, {\"id\": \"a586a0e0-e46b-4ca6-b6d7-2acf77fca4da\", \"col\": 3, \"row\": 9, \"label\": \"A36\"}, {\"id\": \"52e30647-27ce-4484-88a6-7d81fcaff459\", \"col\": 5, \"row\": 9, \"label\": \"A37\"}], \"aisles\": []}', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bus_owner_account`
--

CREATE TABLE `bus_owner_account` (
  `id` int(11) NOT NULL,
  `campany_id` int(11) DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `tin` varchar(255) DEFAULT NULL,
  `vrn` varchar(255) DEFAULT NULL,
  `office_number` varchar(255) DEFAULT NULL,
  `box` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `bank_number` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `whatsapp_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bus_owner_account`
--

INSERT INTO `bus_owner_account` (`id`, `campany_id`, `registration_number`, `tin`, `vrn`, `office_number`, `box`, `street`, `town`, `city`, `region`, `country`, `bank_number`, `bank_name`, `whatsapp_number`, `created_at`, `updated_at`) VALUES
(1, 3, '785878800', NULL, NULL, '11', '124', 'shekilango', 'ubungo', 'ubungo', 'dar-es-salaam', 'Tanzania', NULL, NULL, '255628042409', '2025-06-23 20:44:55', '2025-07-08 10:17:35'),
(2, 28, '123456789', '00000000', '1111111111', '0712123412', NULL, 'Ubungo', 'Dar Es Salaam', 'Dar Es Salaam', 'Dar es Salaam', NULL, '123456789', 'NMB', '0765333444', '2025-06-17 17:45:35', '2025-06-17 20:45:35'),
(3, 30, '12345678', '0000000', '999999999', '0780000999', NULL, 'Kibangu', 'dar es salaam', 'Kinondoni', 'dar es salaam', NULL, '123456789', 'crdb', '0780999000', '2025-06-17 20:04:59', '2025-06-17 23:04:59'),
(4, 31, '90909090', '80009000', '890890890', '0712123412', NULL, 'Ubungo', 'Dar Es Salaam', 'Kibangu', 'Dar es Salaam', NULL, '1234567890', 'NMB', '0765333444', '2025-07-08 07:08:25', '2025-07-08 10:08:25');

-- --------------------------------------------------------

--
-- Table structure for table `campanies`
--

CREATE TABLE `campanies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_number` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `percentage` int(11) DEFAULT 0,
  `commission_amount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `campanies`
--

INSERT INTO `campanies` (`id`, `name`, `user_id`, `payment_number`, `created_at`, `updated_at`, `status`, `percentage`, `commission_amount`) VALUES
(3, 'Kilimanjaro bus', 3, 789473209, '2025-04-22 09:03:41', '2025-06-19 18:49:58', 1, 5, 0.00),
(9, 'Burdan', 9, 628042409, '2025-04-23 08:21:32', '2025-08-25 14:51:06', 1, 5, 0.00),
(18, 'Shambarahi Coach', 26, 755879793, '2025-05-05 00:52:26', '2025-05-05 03:52:26', 0, 0, 0.00),
(17, 'BM', 25, 628042409, '2025-05-04 14:11:28', '2025-05-04 17:11:28', 0, 0, 0.00),
(13, 'Sumri Bus Services', 19, NULL, '2025-05-02 10:33:27', '2025-06-08 15:23:59', 1, 5, 0.00),
(14, 'Marangu Coach', 20, 765553953, '2025-05-04 12:47:48', '2025-05-29 09:32:00', 0, 6, 0.00),
(15, 'Kimbinyiko', 21, 715553803, '2025-05-04 13:35:13', '2025-05-04 16:35:13', 0, 0, 0.00),
(19, 'Kidinilo', 27, 765553953, '2025-05-05 01:42:57', '2025-05-05 04:42:57', 0, 0, 0.00),
(20, 'Shabiby line', 28, 789473209, '2025-05-05 14:44:44', '2025-05-05 17:44:44', 1, 5, 0.00),
(21, 'Abood Bus Service', 29, 789473209, '2025-05-06 16:07:11', '2025-06-02 09:24:16', 1, 5, 0.00),
(23, 'SK', 31, 628042409, '2025-05-06 17:03:20', '2025-09-03 14:21:47', 2, 0, 0.00),
(24, 'Raha Leo', 32, 765553953, '2025-05-06 18:54:27', '2025-05-06 21:54:27', 0, 0, 0.00),
(25, 'Test Account', 33, 786948007, '2025-05-10 14:03:21', '2025-05-10 17:03:21', 0, 0, 0.00),
(26, 'Nacharo', 38, 773942409, '2025-05-16 08:11:06', '2025-05-16 11:11:06', 0, 0, 0.00),
(27, 'Golden Dear', 40, 715553803, '2025-05-24 19:45:04', '2025-05-24 22:45:04', 0, 0, 0.00),
(28, 'Kidinilo', 46, 765553953, '2025-06-17 17:43:28', '2025-06-17 20:57:38', 1, 5, 0.00),
(29, 'Eacher', 47, 123456789, '2025-06-17 18:03:54', '2025-06-17 21:03:54', 0, 0, 0.00),
(30, 'Kimbinyiko', 50, 765553953, '2025-06-17 20:02:38', '2025-06-17 23:07:08', 1, 3, 0.00),
(31, 'ABC Upper Class', 51, 765553953, '2025-07-08 07:06:23', '2025-07-08 10:06:23', 0, 0, 0.00),
(32, 'Test', 62, 782222222, '2025-11-08 16:42:16', '2025-11-08 11:42:16', 0, 0, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `cancelled_bookings`
--

CREATE TABLE `cancelled_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `campany_id` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cancelled_bookings`
--

INSERT INTO `cancelled_bookings` (`id`, `booking_id`, `amount`, `created_at`, `updated_at`, `campany_id`) VALUES
(1, '278', 72, '2025-08-31 16:28:03', '2025-08-31 16:28:03', '3'),
(2, '302', 7, '2025-09-03 10:31:56', '2025-09-03 10:31:56', '3'),
(3, '305', 8, '2025-09-04 11:24:59', '2025-09-04 11:24:59', '3'),
(4, '4', 81, '2025-09-06 10:07:47', '2025-09-06 10:07:47', '3'),
(5, '129', 9, '2025-09-06 10:08:53', '2025-09-06 10:08:53', '3'),
(6, '120', 9, '2025-09-06 10:12:45', '2025-09-06 10:12:45', '3'),
(7, '128', 4, '2025-09-06 10:13:29', '2025-09-06 10:13:29', '3'),
(8, '315', -5, '2025-09-29 20:39:45', '2025-09-29 20:39:45', '3'),
(9, '736', -50, '2026-02-23 04:31:00', '2026-02-23 04:31:00', '3');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Arusha', '2025-04-17 21:48:01', NULL),
(2, 'Dar es Salaam', '2025-04-17 21:48:01', NULL),
(3, 'Dodoma', '2025-04-17 21:48:01', NULL),
(4, 'Geita', '2025-04-17 21:48:01', NULL),
(5, 'Iringa', '2025-04-17 21:48:01', NULL),
(6, 'Kagera', '2025-04-17 21:48:01', NULL),
(7, 'Katavi', '2025-04-17 21:48:01', NULL),
(8, 'Kigoma', '2025-04-17 21:48:01', NULL),
(9, 'Kilimanjaro', '2025-04-17 21:48:01', NULL),
(10, 'Lindi', '2025-04-17 21:48:01', NULL),
(11, 'Manyara', '2025-04-17 21:48:01', NULL),
(12, 'Mara', '2025-04-17 21:48:01', NULL),
(13, 'Mbeya', '2025-04-17 21:48:01', NULL),
(14, 'Morogoro', '2025-04-17 21:48:01', NULL),
(15, 'Mtwara', '2025-04-17 21:48:01', NULL),
(16, 'Mwanza', '2025-04-17 21:48:01', NULL),
(17, 'Njombe', '2025-04-17 21:48:01', NULL),
(18, 'Pemba North', '2025-04-17 21:48:01', NULL),
(19, 'Pemba South', '2025-04-17 21:48:01', NULL),
(20, 'Pwani', '2025-04-17 21:48:01', NULL),
(21, 'Rukwa', '2025-04-17 21:48:01', NULL),
(22, 'Ruvuma', '2025-04-17 21:48:01', NULL),
(23, 'Shinyanga', '2025-04-17 21:48:01', NULL),
(24, 'Simiyu', '2025-04-17 21:48:01', NULL),
(25, 'Singida', '2025-04-17 21:48:01', NULL),
(26, 'Songwe', '2025-04-17 21:48:01', NULL),
(27, 'Tabora', '2025-04-17 21:48:01', NULL),
(28, 'Tanga', '2025-04-17 21:48:01', NULL),
(34, 'Moshi', '2025-04-17 21:48:01', NULL),
(40, 'Bukoba', '2025-04-17 21:48:01', NULL),
(41, 'Musoma', '2025-04-17 21:48:01', NULL),
(42, 'Sumbawanga', '2025-04-17 21:48:01', NULL),
(43, 'Songea', '2025-04-17 21:48:01', NULL),
(44, 'Iringa Town', '2025-04-17 21:48:01', NULL),
(45, 'Njombe Town', '2025-04-17 21:48:01', NULL),
(46, 'Babati', '2025-04-17 21:48:01', NULL),
(47, 'Lindi Town', '2025-04-17 21:48:01', NULL),
(48, 'Mtwara Town', '2025-04-17 21:48:01', NULL),
(49, 'Kilwa Masoko', '2025-04-17 21:48:01', NULL),
(50, 'Bagamoyo', '2025-04-17 21:48:01', NULL),
(51, 'Kibaha', '2025-04-17 21:48:01', NULL),
(52, 'Chake Chake', '2025-04-17 21:48:01', NULL),
(53, 'Wete', '2025-04-17 21:48:01', NULL),
(54, 'Koani', '2025-04-17 21:48:01', NULL),
(55, 'Makumbusho', '2025-04-17 21:48:01', NULL),
(56, 'Stone Town', '2025-04-17 21:48:01', NULL),
(57, 'Nungwi', '2025-04-17 21:48:01', NULL),
(58, 'Kendwa', '2025-04-17 21:48:01', NULL),
(59, 'Jambiani', '2025-04-17 21:48:01', NULL),
(60, 'Paje', '2025-04-17 21:48:01', NULL),
(61, 'Bwejuu', '2025-04-17 21:48:01', NULL),
(62, 'Mikindani', '2025-04-17 21:48:01', NULL),
(63, 'Tunduma', '2025-04-17 21:48:01', NULL),
(64, 'Kyela', '2025-04-17 21:48:01', NULL),
(65, 'Sikonge', '2025-04-17 21:48:01', NULL),
(66, 'Kahama', '2025-04-17 21:48:01', NULL),
(67, 'Nzega', '2025-04-17 21:48:01', NULL),
(68, 'Bariadi', '2025-04-17 21:48:01', NULL),
(69, 'Maswa', '2025-04-17 21:48:01', NULL),
(70, 'Meatu', '2025-04-17 21:48:01', NULL),
(71, 'Bunda', '2025-04-17 21:48:01', NULL),
(72, 'Tarime', '2025-04-17 21:48:01', NULL),
(73, 'Korogwe', '2025-04-17 21:48:01', NULL),
(74, 'Lushoto', '2025-04-17 21:48:01', NULL),
(75, 'Same', '2025-04-17 21:48:01', NULL),
(76, 'Mbulu', '2025-04-17 21:48:01', NULL),
(77, 'Karatu', '2025-04-17 21:48:01', NULL),
(78, 'Monduli', '2025-04-17 21:48:01', NULL),
(79, 'Longido', '2025-04-17 21:48:01', NULL),
(80, 'Rombo', '2025-04-17 21:48:01', NULL),
(81, 'Mwanga', '2025-04-17 21:48:01', NULL),
(82, 'Hai', '2025-04-17 21:48:01', NULL),
(83, 'Muleba', '2025-04-17 21:48:01', NULL),
(84, 'Ngara', '2025-04-17 21:48:01', NULL),
(85, 'Missenyi', '2025-04-17 21:48:01', NULL),
(86, 'Biharamulo', '2025-04-17 21:48:01', NULL),
(87, 'Chato', '2025-04-17 21:48:01', NULL),
(88, 'Mpanda', '2025-04-17 21:48:01', NULL),
(89, 'Urambo', '2025-04-17 21:48:01', NULL),
(90, 'Igunga', '2025-04-17 21:48:01', NULL),
(91, 'Manyoni', '2025-04-17 21:48:01', NULL),
(92, 'Kondoa', '2025-04-17 21:48:01', NULL),
(93, 'Mpwapwa', '2025-04-17 21:48:01', NULL),
(94, 'Kilosa', '2025-04-17 21:48:01', NULL),
(95, 'Kilombero', '2025-04-17 21:48:01', NULL),
(96, 'Ifakara', '2025-04-17 21:48:01', NULL),
(97, 'Rungwe', '2025-04-17 21:48:01', NULL),
(98, 'Tunduru', '2025-04-17 21:48:01', NULL),
(99, 'Mbinga', '2025-04-17 21:48:01', NULL),
(100, 'Makambako', '2025-04-17 21:48:01', NULL),
(101, 'Ludewa', '2025-04-17 21:48:01', NULL),
(102, 'Mafinga', '2025-04-17 21:48:01', NULL),
(103, 'Ilemela', '2025-04-17 21:48:01', NULL),
(104, 'Sengerema', '2025-04-17 21:48:01', NULL),
(105, 'Serengeti', '2025-04-17 21:48:01', NULL),
(106, 'Shinyanga Municipal', '2025-04-17 21:48:01', NULL),
(107, 'Katoro', '2025-04-17 21:48:01', NULL),
(108, 'Chemba', '2025-04-17 21:48:01', NULL),
(109, 'Gairo', '2025-04-17 21:48:01', NULL),
(110, 'Ulanga', '2025-04-17 21:48:01', NULL),
(111, 'Chunya', '2025-04-17 21:48:01', NULL),
(112, 'Momba', '2025-04-17 21:48:01', NULL),
(113, 'Namtumbo', '2025-04-17 21:48:01', NULL),
(114, 'Wanging?ombe', '2025-04-17 21:48:01', NULL),
(115, 'Misungwi', '2025-04-17 21:48:01', NULL),
(116, 'Ukerewe', '2025-04-17 21:48:01', NULL),
(117, 'Bahi', '2025-04-17 21:48:01', NULL),
(118, 'Kongwa', '2025-04-17 21:48:01', NULL),
(119, 'Malinyi', '2025-04-17 21:48:01', NULL),
(120, 'Busokelo', '2025-04-17 21:48:01', NULL),
(121, 'Ileje', '2025-04-17 21:48:01', NULL),
(122, 'Mbozi', '2025-04-17 21:48:01', NULL),
(123, 'Nyasa', '2025-04-17 21:48:01', NULL),
(124, 'Makete', '2025-04-17 21:48:01', NULL),
(125, 'Kwimba', '2025-04-17 21:48:01', NULL),
(126, 'Ushetu', '2025-04-17 21:48:01', NULL),
(127, 'Kaliua', '2025-04-17 21:48:01', NULL),
(128, 'Ikungi', '2025-04-17 21:48:01', NULL),
(129, 'Mvomero', '2025-04-17 21:48:01', NULL),
(130, 'Rorya', '2025-04-17 21:48:01', NULL),
(131, 'Butiama', '2025-04-17 21:48:01', NULL),
(132, 'Nansio', '2025-04-17 21:48:01', NULL),
(133, 'Kishapu', '2025-04-17 21:48:01', NULL),
(134, 'Kahama Town', '2025-04-17 21:48:01', NULL),
(135, 'mombo', '2025-06-05 12:02:24', '2025-06-05 15:02:24'),
(136, 'korogwe', '2025-06-05 12:12:14', '2025-06-05 15:12:14'),
(137, 'Kariakoo', '2025-06-06 20:20:13', '2025-06-06 23:20:13'),
(138, 'Mbagala', '2025-06-12 13:26:00', '2025-06-12 16:26:00'),
(139, 'Gongo la mboto', '2025-07-22 02:55:42', '2025-07-22 05:55:42'),
(140, 'Bujumbura', '2025-08-01 01:35:08', '2025-08-01 04:35:08'),
(141, 'mombasa', '2025-10-20 23:06:48', '2025-10-21 02:06:48');

-- --------------------------------------------------------

--
-- Table structure for table `coasters`
--

CREATE TABLE `coasters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `driver_user_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_user_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `plate_number` varchar(20) NOT NULL,
  `capacity` int(11) NOT NULL DEFAULT 30,
  `model` varchar(100) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `status` enum('available','on_hire','maintenance') NOT NULL DEFAULT 'available',
  `image` varchar(255) DEFAULT NULL,
  `driver_name` varchar(100) DEFAULT NULL,
  `driver_contact` varchar(20) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `last_location_update` timestamp NULL DEFAULT NULL,
  `features` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coasters`
--

INSERT INTO `coasters` (`id`, `user_id`, `driver_user_id`, `customer_user_id`, `name`, `plate_number`, `capacity`, `model`, `color`, `status`, `image`, `driver_name`, `driver_contact`, `latitude`, `longitude`, `last_location_update`, `features`, `created_at`, `updated_at`) VALUES
(2, 64, 66, 0, 'adventure', 'T 517 EEK', 30, 'Toyota coaster 2024', 'black', 'available', NULL, 'ibrahim', '0628042409', -3.36692760, 36.68173490, '2025-12-27 20:45:54', 'Ac, Wifi', '2025-12-20 05:14:34', '2025-12-27 20:45:54'),
(3, 64, 67, 0, 'leopard', 'T 517 EGU', 30, 'Toyota coaster 2024', 'black', 'available', 'coasters/n8XC1UWATXxjsxYKL3mVM1Q9p7x1EkRNrmuRDUtD.png', 'ibrahim', '0628042409', -6.79944670, 39.20626760, '2025-12-20 10:22:04', 'Ac, Wifi', '2025-12-20 05:33:33', '2025-12-20 10:22:04'),
(4, 64, 70, NULL, 'kasongo', 'T 517 EFK', 30, 'Toyota coaster 2024', 'black', 'available', 'coasters/t5pVyxdD2tjGteKjNhi0dRohNaJFABQEaK4djp0Q.png', 'ibrahim', '0628042409', -6.78268640, 39.25952040, '2025-12-21 02:23:34', 'AC, Wifi', '2025-12-20 12:31:03', '2025-12-21 02:23:34');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `used` int(11) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `code`, `used`, `percentage`, `created_at`, `updated_at`) VALUES
(1, 'SCH202412', 5, 2, '2025-06-06 11:52:39', '2025-06-06 14:52:39'),
(2, '7474140', 5, 3, '2025-06-06 12:01:02', '2025-06-06 15:01:02'),
(3, '123', 5, 3, '2025-06-06 19:14:43', '2025-06-06 22:14:43'),
(9, '11111111', 3, 10, '2025-06-22 15:27:16', '2025-06-22 18:27:16'),
(7, '123456', 3, 20, '2025-06-17 19:18:58', '2025-06-17 22:18:58'),
(8, 'SCG001', 3, 30, '2025-06-17 19:39:11', '2025-06-17 22:39:11'),
(10, '0715020945', 1, 10, '2025-07-22 02:59:06', '2025-07-22 05:59:06');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(4, '2025_05_12_184025_vender', 3),
(5, '2025_08_31_181515_table_tempwallet', 4),
(6, '2025_08_31_182202_table_cancelled_bookings', 5),
(7, '2025_08_31_185120_create_temp_wallets_table', 6),
(8, '2025_08_31_185145_create_cancelled_bookings_table', 6),
(9, '2025_08_31_191619_temp_wallet_update', 7),
(10, '2025_08_31_191944_cancelled_bookings_update', 8),
(11, '2025_08_31_232951_booking_update', 9),
(12, '2025_09_12_005151_table_refund', 10),
(13, '2025_09_12_005633_update_users_table', 11),
(14, '2025_09_20_140555_create_refund_percentages_table', 12),
(15, '2025_09_20_150408_add_age_infant_child_age_group_to_bookings_table', 13),
(16, '2025_09_21_000711_add_bus_details_to_buses_table', 14),
(17, '2025_09_22_155406_add_resave_fields_to_bookings_table', 15),
(18, '2025_10_03_010650_roundtrip_table', 16),
(19, '2025_10_03_041938_add_excess_luggage_to_bookings_table', 17),
(20, '2025_10_04_010025_bus_table', 18),
(21, '2025_10_04_234429_bus_table', 19),
(22, '2014_10_12_200000_add_two_factor_columns_to_users_table', 20),
(23, '2025_10_09_010013_add_failed_attempts_and_locked_until_to_users_table', 20),
(24, '2025_01_15_000000_add_email_verification_to_users_table', 21),
(25, '2025_10_17_003626_add_second_driver_fields_to_buses_table', 22),
(26, '2025_10_09_105858_add_two_factor_columns_to_users_table', 23),
(27, '2025_10_13_223504_add_email_verification_to_users_table', 23),
(28, '2025_11_26_000001_add_notification_flags_to_settings_table', 23),
(29, '2025_12_18_000003_create_special_hire_pricing_table', 24);

-- --------------------------------------------------------

--
-- Table structure for table `parcels`
--

CREATE TABLE `parcels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parcel_number` varchar(255) NOT NULL,
  `parcel_type` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `height` decimal(8,2) DEFAULT NULL,
  `width` decimal(8,2) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `bus_id` bigint(20) UNSIGNED NOT NULL,
  `vender_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `parcels`
--

INSERT INTO `parcels` (`id`, `parcel_number`, `parcel_type`, `description`, `amount_paid`, `weight`, `height`, `width`, `status`, `bus_id`, `vender_id`, `created_at`, `updated_at`) VALUES
(1, 'PCL-AQNLTB', 'Envelope', 'aiosoaxbcASJIcuICDVUDSIQDUIWIEUDHCD', 10000.00, NULL, NULL, NULL, 'pending', 21, 75, '2026-02-02 20:10:54', '2026-02-02 20:10:54'),
(2, 'PCL-VTGOXC', 'Box', NULL, 10000.00, NULL, NULL, NULL, 'pending', 9, 37, '2026-02-03 05:06:55', '2026-02-03 05:06:55'),
(3, 'PCL-COVZ4J', 'Envelope', 'Bahasha', 10000.00, NULL, NULL, NULL, 'pending', 21, 81, '2026-02-25 21:13:12', '2026-02-25 21:13:12');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_fees`
--

CREATE TABLE `payment_fees` (
  `id` int(11) NOT NULL,
  `campany_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `booking_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment_fees`
--

INSERT INTO `payment_fees` (`id`, `campany_id`, `amount`, `booking_id`, `created_at`, `updated_at`) VALUES
(2, 13, 500, '38', '2025-05-03 11:16:03', '2025-05-04 07:12:10'),
(3, 19, 500, '39', '2025-05-05 01:56:09', '2025-05-05 04:56:09'),
(4, 20, 500, '41', '2025-05-05 15:24:04', '2025-05-05 18:24:04'),
(5, 20, 500, '42', '2025-05-06 15:57:53', '2025-05-06 18:57:53'),
(6, 24, 500, '44', '2025-05-06 19:14:04', '2025-05-06 22:14:04'),
(7, 24, 500, '46', '2025-05-06 19:47:15', '2025-05-06 22:47:15'),
(8, 24, 500, '47', '2025-05-06 20:15:26', '2025-05-06 23:15:26'),
(9, 24, 500, '48', '2025-05-06 20:29:48', '2025-05-06 23:29:48'),
(10, 3, 500, '51', '2025-05-07 12:53:38', '2025-05-07 15:53:38'),
(11, 3, 500, '52', '2025-05-07 18:38:28', '2025-05-07 21:38:28'),
(12, 3, 500, '54', '2025-05-08 16:49:29', '2025-05-08 19:49:29'),
(13, 3, 500, '90', '2025-05-29 20:02:22', '2025-05-29 23:02:22'),
(14, 3, 500, '94', '2025-06-01 08:43:02', '2025-06-01 11:43:02'),
(15, 3, 500, '104', '2025-06-01 19:16:41', '2025-06-01 22:16:41'),
(16, 3, 500, '106', '2025-06-01 19:44:50', '2025-06-01 22:44:50'),
(17, 21, 90, '112', '2025-06-02 11:59:22', '2025-06-02 14:59:22'),
(18, 21, 90, '113', '2025-06-02 13:40:26', '2025-06-02 16:40:26'),
(19, 21, 90, '114', '2025-06-02 14:01:33', '2025-06-02 17:01:33'),
(20, 3, 90, '115', '2025-06-02 14:10:18', '2025-06-02 17:10:18'),
(21, 3, 90, '116', '2025-06-02 14:29:19', '2025-06-02 17:29:19'),
(22, 3, 100, '117', '2025-06-02 14:45:53', '2025-06-02 17:45:53'),
(23, 3, 90, '119', '2025-06-02 23:08:21', '2025-06-03 02:08:21'),
(24, 3, 100, '120', '2025-06-03 13:59:53', '2025-06-03 16:59:53'),
(25, 3, 90, '121', '2025-06-04 02:48:07', '2025-06-04 05:48:07'),
(26, 13, 93, 'OL10039448', '2025-06-11 13:30:35', '2025-06-11 16:30:35'),
(27, 21, 104, 'DJ99395522', '2025-06-11 14:39:11', '2025-06-11 17:39:11'),
(28, 3, 93, 'VW40566254', '2025-06-12 08:58:34', '2025-06-12 11:58:34'),
(29, 3, 160, 'SW69599444', '2025-06-12 09:51:53', '2025-06-12 12:51:53'),
(30, 21, 94, 'QZ55446658', '2025-06-12 13:13:49', '2025-06-12 16:13:49'),
(31, 13, 93, 'YG69693222', '2025-06-12 13:51:03', '2025-06-12 16:51:03'),
(32, 20, 97, 'XZ84961088', '2025-06-13 19:14:54', '2025-06-13 22:14:54'),
(33, 3, 108, 'JW76609301', '2025-06-17 21:11:23', '2025-06-18 00:11:23'),
(34, 20, 108, 'IL95008754', '2025-06-18 20:40:29', '2025-06-18 23:40:29'),
(35, 3, 108, 'LF67217406', '2025-06-19 01:30:26', '2025-06-19 04:30:26'),
(36, 3, 105, '152', '2025-06-19 18:36:41', '2025-06-19 21:36:41'),
(37, 3, 201, '154', '2025-06-19 19:23:25', '2025-06-19 22:23:25'),
(38, 3, 100, '155', '2025-06-19 19:47:48', '2025-06-19 22:47:48'),
(39, 3, 101, 'HE12676347', '2025-06-19 20:10:44', '2025-06-19 23:10:44'),
(40, 3, 106, 'TH58261408', '2025-06-20 06:01:42', '2025-06-20 09:01:42'),
(41, 3, 102, 'EA30082544', '2025-06-20 08:36:14', '2025-06-20 11:36:14'),
(42, 3, 92, 'NZ73339138', '2025-06-20 09:30:33', '2025-06-20 12:30:33'),
(43, 3, 95, 'OW82939581', '2025-06-20 11:58:58', '2025-06-20 14:58:58'),
(44, 3, 102, 'ED40011224', '2025-06-20 19:34:35', '2025-06-20 22:34:35'),
(45, 3, 102, 'IV14203350', '2025-06-20 20:00:23', '2025-06-20 23:00:23'),
(46, 3, 92, 'ZQ24498935', '2025-06-20 20:38:24', '2025-06-20 23:38:24'),
(47, 3, 16, 'AX15885611', '2025-06-20 22:51:34', '2025-06-21 01:51:34'),
(48, 3, 86, 'AA76675751', '2025-06-20 23:04:47', '2025-06-21 02:04:47'),
(49, 3, 102, 'LN63173068', '2025-06-20 23:46:24', '2025-06-21 02:46:24'),
(50, 3, 78, 'CA31212746', '2025-06-20 23:52:00', '2025-06-21 02:52:00'),
(51, 3, 81, 'RF95461695', '2025-06-22 09:22:29', '2025-06-22 12:22:29'),
(52, 3, 80, 'VJ30128878', '2025-06-22 10:14:39', '2025-06-22 13:14:39'),
(53, 3, 102, 'RG00776941', '2025-06-22 10:26:35', '2025-06-22 13:26:35'),
(54, 3, 95, 'FH13258403', '2025-06-22 20:16:32', '2025-06-22 23:16:32'),
(55, 3, 105, 'AJ39253481', '2025-06-22 21:11:49', '2025-06-23 00:11:49'),
(56, 3, 95, 'TC74851131', '2025-06-22 23:53:59', '2025-06-23 02:53:59'),
(57, 3, 105, 'XF89179335', '2025-06-24 09:30:46', '2025-06-24 12:30:46'),
(58, 3, 95, 'FF99493757', '2025-06-24 09:39:14', '2025-06-24 12:39:14'),
(59, 3, 105, 'HN22258116', '2025-06-24 09:58:00', '2025-06-24 12:58:00'),
(60, 3, 0, 'LV03657897', '2025-06-25 22:51:11', '2025-06-26 01:51:11'),
(61, 3, -2448, 'HC01491410', '2025-06-30 13:49:41', '2025-06-30 16:49:41'),
(62, 3, -2448, 'BR33644954', '2025-06-30 13:58:22', '2025-06-30 16:58:22'),
(63, 3, -918, 'VO38129748', '2025-07-01 10:48:48', '2025-07-01 13:48:48'),
(64, 3, -2520, 'BR06804068', '2025-07-02 08:47:08', '2025-07-02 11:47:08'),
(65, 3, -2520, 'ZU42454048', '2025-07-03 21:11:51', '2025-07-04 00:11:51'),
(66, 13, -2424, 'GI13630387', '2025-07-06 06:44:20', '2025-07-06 09:44:20'),
(67, 13, 102, 'TI26249392', '2025-07-06 07:12:11', '2025-07-06 10:12:11'),
(68, 13, -2448, 'LH60545206', '2025-07-06 08:28:13', '2025-07-06 11:28:13'),
(69, 13, -2448, 'XX72401065', '2025-07-06 08:33:12', '2025-07-06 11:33:12'),
(70, 3, 102, 'PR75725840', '2025-07-22 06:05:37', '2025-07-22 09:05:37'),
(71, 3, -2448, 'JQ44443850', '2025-07-22 06:11:10', '2025-07-22 09:11:10'),
(72, 3, -2448, 'AG05811006', '2025-07-22 16:36:00', '2025-07-22 19:36:00'),
(73, 13, 102, 'LG20121420', '2025-07-22 19:48:46', '2025-07-22 22:48:46'),
(74, 21, -2448, 'MU38720079', '2025-07-22 20:50:30', '2025-07-22 23:50:30'),
(75, 3, -2448, 'TZ61752918', '2025-07-24 16:53:23', '2025-07-24 19:53:23'),
(76, 3, 102, 'NI22242006', '2025-07-24 17:03:00', '2025-07-24 20:03:00'),
(77, 3, -2448, 'GV63290212', '2025-07-28 06:58:27', '2025-07-28 09:58:27'),
(78, 3, 102, 'FJ20005269', '2025-07-28 18:29:25', '2025-07-28 21:29:25'),
(79, 3, 77, 'JJ46193584', '2025-07-28 19:28:37', '2025-07-28 22:28:37'),
(80, 3, 61, 'TI22448746', '2025-07-29 11:43:16', '2025-07-29 14:43:16'),
(81, 3, 65, 'AT07304180', '2025-07-29 12:40:54', '2025-07-29 15:40:54'),
(82, 3, 63, 'OV01524598', '2025-07-30 08:56:55', '2025-07-30 11:56:55'),
(83, 3, 102, 'OE95670403', '2025-07-31 20:06:32', '2025-07-31 23:06:32'),
(84, 3, 102, '299', '2025-08-31 20:12:31', '2025-08-31 23:12:31'),
(85, 3, 102, '300', '2025-08-31 20:16:13', '2025-08-31 23:16:13'),
(86, 3, 102, '301', '2025-08-31 20:40:44', '2025-08-31 23:40:44'),
(87, 3, 102, '302', '2025-09-03 09:13:11', '2025-09-03 12:13:11'),
(88, 3, 101, '303', '2025-09-03 10:34:26', '2025-09-03 13:34:26'),
(89, 3, 101, '304', '2025-09-04 11:03:05', '2025-09-04 14:03:05'),
(90, 3, 101, '305', '2025-09-04 11:05:58', '2025-09-04 14:05:58'),
(91, 3, 61, '307', '2025-09-06 09:05:53', '2025-09-06 12:05:53'),
(92, 3, 61, '309', '2025-09-06 09:09:29', '2025-09-06 12:09:29'),
(93, 3, 61, '310', '2025-09-11 20:25:28', '2025-09-11 23:25:28'),
(94, 3, 61, '311', '2025-09-11 20:33:58', '2025-09-11 23:33:58'),
(95, 3, 61, '314', '2025-09-29 20:09:10', '2025-09-29 23:09:10'),
(96, 3, 61, '315', '2025-09-29 20:20:29', '2025-09-29 23:20:29'),
(97, 3, 61, '318', '2025-10-16 11:53:19', '2025-10-16 14:53:19'),
(98, 3, 61, '319', '2025-10-16 12:17:09', '2025-10-16 15:17:09'),
(99, 3, 61, '331', '2025-10-25 18:59:21', '2025-10-25 21:59:21'),
(100, 3, 65, '646', '2026-02-09 19:20:57', '2026-02-09 14:20:57'),
(101, 3, 108, '725', '2026-02-23 03:28:32', '2026-02-22 22:28:32'),
(102, 3, 108, '727', '2026-02-23 03:35:23', '2026-02-22 22:35:23'),
(103, 3, 108, '730', '2026-02-23 04:03:11', '2026-02-22 23:03:11'),
(104, 3, 108, '735', '2026-02-23 04:21:23', '2026-02-22 23:21:23'),
(105, 3, 108, '736', '2026-02-23 04:25:39', '2026-02-22 23:25:39'),
(106, 3, 108, '751', '2026-02-24 01:24:34', '2026-02-23 20:24:34'),
(107, 3, 0, '755', '2026-02-24 02:44:05', '2026-02-23 21:44:05'),
(108, 3, 0, '756', '2026-02-24 02:44:05', '2026-02-23 21:44:05'),
(109, 3, 108, '773', '2026-02-25 20:34:24', '2026-02-25 15:34:24'),
(110, 3, 2500, '776', '2026-02-25 20:54:07', '2026-02-25 15:54:07'),
(111, 3, 0, '777', '2026-02-25 20:54:07', '2026-02-25 15:54:07'),
(112, 3, 2500, '778', '2026-02-25 21:04:39', '2026-02-25 16:04:39'),
(113, 3, 0, '779', '2026-02-25 21:04:39', '2026-02-25 16:04:39'),
(114, 3, 108, '780', '2026-02-26 02:25:30', '2026-02-25 21:25:30'),
(115, 3, 108, '785', '2026-02-27 03:07:10', '2026-02-26 22:07:10'),
(116, 3, 0, '786', '2026-02-27 03:22:11', '2026-02-26 22:22:11'),
(117, 3, 0, '787', '2026-02-27 03:22:11', '2026-02-26 22:22:11');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 64, 'auth_token', 'fda6ac1e6910a19e3c20b3e19e33c57c1afb4ee92026400da21d04dac84b06fa', '[\"*\"]', '2025-12-20 01:29:10', NULL, '2025-12-20 01:28:02', '2025-12-20 01:29:10'),
(2, 'App\\Models\\User', 64, 'auth_token', 'ff7b5270294c3a0cdeeb5f40478dc2478afd2695567ec9d530509d6073e05925', '[\"*\"]', '2025-12-20 04:48:58', NULL, '2025-12-20 02:28:06', '2025-12-20 04:48:58'),
(4, 'App\\Models\\User', 67, 'driver-token', '3e7dceba9a71376447f91f88f5c5b8eed1d275427fbd07c47904ea216d8a5739', '[\"*\"]', '2025-12-20 09:01:13', NULL, '2025-12-20 05:34:05', '2025-12-20 09:01:13'),
(5, 'App\\Models\\User', 68, 'customer-token', 'bd0254dacc2df043786269670a4b461ba63dbfe6f2e3e5fae5eab347625e801a', '[\"*\"]', NULL, NULL, '2025-12-20 09:05:06', '2025-12-20 09:05:06'),
(6, 'App\\Models\\User', 68, 'customer-token', '7082deeaf40a44d9c610c9ce28d8d907183f25f26a5c8e9ed4f01ae741af0a21', '[\"*\"]', '2025-12-20 10:11:13', NULL, '2025-12-20 09:05:07', '2025-12-20 10:11:13'),
(7, 'App\\Models\\User', 68, 'customer-token', 'a1341f1bf354ee8deae9dd89dae24a394f3b6300a69e36552d51cb75409e8c9b', '[\"*\"]', '2025-12-21 04:46:37', NULL, '2025-12-20 10:21:12', '2025-12-21 04:46:37'),
(9, 'App\\Models\\User', 66, 'driver-token', '1fff1e02e62f8c612abf4af45ae4ef5295f735d8bd6f817f2e9ede52607e144c', '[\"*\"]', '2026-01-22 17:22:13', NULL, '2025-12-20 10:22:23', '2026-01-22 17:22:13'),
(10, 'App\\Models\\User', 69, 'customer-token', 'fde1d2385739cc7e7ee0e6c4b63788cc92f89a132e2e281b59d9a765430d545e', '[\"*\"]', NULL, NULL, '2025-12-20 12:24:29', '2025-12-20 12:24:29'),
(11, 'App\\Models\\User', 69, 'customer-token', '9e5fab2b4c120911092aa5fef211ba40841cdc900fa214d5fd502ffb0f167d1d', '[\"*\"]', '2025-12-21 15:06:29', NULL, '2025-12-20 12:24:31', '2025-12-21 15:06:29'),
(12, 'App\\Models\\User', 70, 'driver-token', '8cb36cbe9864f494b98ba2ab05838fabe81900ed248d8cea91424e3b8a5fed42', '[\"*\"]', '2025-12-21 02:23:34', NULL, '2025-12-20 12:35:32', '2025-12-21 02:23:34'),
(13, 'App\\Models\\User', 68, 'customer-token', '0baf2d20dc8ddd47c16f47667bf1c7aff818ee8bb1d64af57c2aa3fbb2778ead', '[\"*\"]', '2026-01-06 13:26:21', NULL, '2025-12-21 23:50:24', '2026-01-06 13:26:21');

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` int(11) NOT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `point_mode` int(11) DEFAULT NULL,
  `point` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `state` varchar(255) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`id`, `bus_id`, `route_id`, `point_mode`, `point`, `amount`, `state`, `created_at`, `updated_at`) VALUES
(68, 16, 20, 2, 'Muheza', 10, 'yes', '2025-05-06 20:26:38', '2025-05-06 23:26:38'),
(410, 19, 23, 1, 'Kibaha', 100, 'no', '2025-06-08 12:33:49', '2025-06-08 15:33:49'),
(9, 6, 10, 1, 'kibaha', 0, 'no', '2025-04-23 08:28:31', '2025-04-23 11:28:31'),
(10, 6, 10, 1, 'mlandizi', 0, 'no', '2025-04-23 08:28:31', '2025-04-23 11:28:31'),
(11, 6, 10, 1, 'chalinze', 0, 'no', '2025-04-23 08:28:31', '2025-04-23 11:28:31'),
(12, 6, 10, 2, 'chalinze', 10000, 'no', '2025-04-23 08:28:31', '2025-04-23 11:28:31'),
(13, 6, 10, 2, 'morogoro', 12000, 'no', '2025-04-23 08:28:31', '2025-04-23 11:28:31'),
(14, 6, 10, 1, 'morogoro', 0, 'yes', '2025-04-23 08:30:00', '2025-04-23 11:30:00'),
(15, 6, 10, 1, 'dumila', 0, 'yes', '2025-04-23 08:30:00', '2025-04-23 11:30:00'),
(16, 6, 10, 2, 'mlandizi', 1000, 'yes', '2025-04-23 08:30:00', '2025-04-23 11:30:00'),
(66, 15, 19, 2, 'Muheza', 500, 'no', '2025-05-06 19:02:08', '2025-05-06 22:02:08'),
(21, 8, 12, 1, 'mbezi', 0, 'no', '2025-04-26 11:20:18', '2025-04-26 14:20:18'),
(22, 8, 12, 1, 'mlandizi', 0, 'no', '2025-04-26 11:20:18', '2025-04-26 14:20:18'),
(23, 8, 12, 2, 'morogoro', 1000, 'no', '2025-04-26 11:20:18', '2025-04-26 14:20:18'),
(24, 8, 12, 2, 'dodoma', 1000, 'no', '2025-04-26 11:20:18', '2025-04-26 14:20:18'),
(25, 8, 12, 1, 'dodoma', 0, 'yes', '2025-04-26 11:21:32', '2025-04-26 14:21:32'),
(26, 8, 12, 1, 'shinyanga', 0, 'yes', '2025-04-26 11:21:32', '2025-04-26 14:21:32'),
(27, 8, 12, 2, 'kibaha', 1000, 'yes', '2025-04-26 11:21:32', '2025-04-26 14:21:32'),
(28, 8, 12, 2, 'chalinze', 1000, 'yes', '2025-04-26 11:21:32', '2025-04-26 14:21:32'),
(65, 15, 19, 2, 'Bagamoyo', 500, 'yes', '2025-05-06 19:00:20', '2025-05-06 22:00:20'),
(327, 14, 18, 2, 'Shekilango', 100, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(326, 14, 18, 2, 'Kimara mwisho', 100, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(405, 9, 13, 2, 'Nyakahoja', 45, 'no', '2025-06-08 10:12:10', '2025-06-08 13:12:10'),
(404, 9, 13, 2, 'magu', 45, 'no', '2025-06-08 10:12:10', '2025-06-08 13:12:10'),
(403, 9, 13, 1, 'lugeye', 40, 'no', '2025-06-08 10:12:10', '2025-06-08 13:12:10'),
(402, 9, 13, 1, 'Nyanguge', 40, 'no', '2025-06-08 10:12:10', '2025-06-08 13:12:10'),
(401, 9, 13, 1, 'igooma', 45, 'no', '2025-06-08 10:12:10', '2025-06-08 13:12:10'),
(400, 9, 13, 1, 'nyakato', 50, 'no', '2025-06-08 10:12:10', '2025-06-08 13:12:10'),
(399, 9, 13, 1, 'mabatini', 50, 'no', '2025-06-08 10:12:10', '2025-06-08 13:12:10'),
(398, 9, 13, 1, 'standi kuu', 50, 'no', '2025-06-08 10:12:10', '2025-06-08 13:12:10'),
(57, 11, 15, 2, 'Bagamoyo', 500, 'yes', '2025-05-05 01:13:41', '2025-05-05 04:13:41'),
(58, 12, 16, 1, 'Mbezi', 20000, 'no', '2025-05-05 01:49:00', '2025-05-05 04:49:00'),
(59, 12, 16, 2, 'Kibaha', 1000, 'no', '2025-05-05 01:49:00', '2025-05-05 04:49:00'),
(392, 10, 14, 1, 'Kahama stand', 20, 'no', '2025-06-08 10:03:18', '2025-06-08 13:03:18'),
(60, 12, 16, 2, 'Picha ya ndege', 500, 'no', '2025-05-05 01:49:00', '2025-05-05 04:49:00'),
(532, 18, 22, 2, 'Kimara mwisho', 100, 'no', '2025-10-20 01:47:46', '2025-10-20 04:47:46'),
(158, 21, 25, 1, 'Shekilango', 100, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(159, 21, 25, 1, 'Mwenge', 100, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(157, 21, 25, 2, 'Tabata', 100, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(156, 21, 25, 1, 'Segerea', 100, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(155, 21, 25, 1, 'Kinyerezi Darajani', 100, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(531, 18, 22, 2, 'Kimara temboni', 100, 'no', '2025-10-20 01:47:46', '2025-10-20 04:47:46'),
(530, 18, 22, 2, 'Mbezi Magufuli', 100, 'no', '2025-10-20 01:47:46', '2025-10-20 04:47:46'),
(529, 18, 22, 1, 'Tambuka lami', 0, 'no', '2025-10-20 01:47:46', '2025-10-20 04:47:46'),
(154, 21, 25, 1, 'Gongo la mboto', 100, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(153, 21, 25, 1, 'Pugu kona', 100, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(152, 21, 25, 1, 'Pugu inyamwezi', 100, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(151, 21, 25, 1, 'Chanika', 100, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(149, 21, 25, 2, 'Moshi', 50, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(150, 21, 25, 2, 'Kia', 55, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(148, 21, 25, 2, 'Kiboriloni', 45, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(147, 21, 25, 2, 'Pumuani', 40, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(146, 21, 25, 2, 'Njia panda', 35, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(145, 21, 25, 2, 'Same', 30, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(144, 21, 25, 2, 'Korogwe', 25, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(143, 21, 25, 2, 'Tanga', 20, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(409, 19, 23, 1, 'Shekilango', 100, 'no', '2025-06-08 12:33:49', '2025-06-08 15:33:49'),
(160, 21, 25, 1, 'Bunju', 100, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(161, 21, 25, 1, 'Bagamoyo', 95, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(162, 21, 25, 1, 'Msata', 85, 'no', '2025-05-28 17:48:14', '2025-05-28 20:48:14'),
(325, 14, 18, 2, 'Kimara temboni', 100, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(324, 14, 18, 2, 'Mezi magufuli', 100, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(323, 14, 18, 2, 'Kibaha', 90, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(322, 14, 18, 2, 'Kiluvya', 85, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(321, 14, 18, 2, 'Mlandizi', 80, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(320, 14, 18, 2, 'Chamakweza', 75, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(319, 14, 18, 2, 'Chalinze', 70, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(317, 14, 18, 1, 'Morogoro', 50, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(318, 14, 18, 2, 'Mpakani', 60, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(315, 14, 18, 1, 'Mwisho wa MJI', 90, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(316, 14, 18, 1, 'Mji Mwingine', 80, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(314, 14, 18, 1, 'Mjengo Mapya', 100, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(313, 14, 18, 1, 'Mji Mpya', 100, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(312, 14, 18, 1, 'Mwisho wa lami', 100, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(368, 28, 32, 2, 'Nanenane', 100, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(367, 28, 32, 2, 'Bunge', 100, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(366, 28, 32, 2, 'Shabiby', 100, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(365, 28, 32, 2, 'Mji mpya', 100, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(364, 28, 32, 1, 'Shekilango', 100, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(363, 28, 32, 1, 'Kimara mwisho', 100, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(362, 28, 32, 1, 'KIMARA TEMBONI', 100, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(361, 28, 32, 1, 'Mbezi magufuli', 100, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(360, 28, 32, 1, 'Kibaha', 95, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(359, 28, 32, 1, 'Mlandizi', 90, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(358, 28, 32, 1, 'Kiluvya', 85, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(357, 28, 32, 1, 'Chamakweza', 80, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(355, 28, 32, 1, 'Bwawani', 70, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(356, 28, 32, 1, 'Chalinze', 75, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(353, 28, 32, 2, 'Mji mwingine', 60, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(354, 28, 32, 1, 'Morogoro', 65, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(522, 26, 30, 2, 'Njia panda ya himo', 85, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(521, 26, 30, 2, 'Same', 80, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(520, 26, 30, 2, 'Songa mbele', 75, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(519, 26, 30, 2, 'Chakula', 70, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(518, 26, 30, 2, 'Keep left', 65, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(517, 26, 30, 2, 'Tanga', 60, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(516, 26, 30, 1, 'Msata', 65, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(515, 26, 30, 1, 'Kilama', 70, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(514, 26, 30, 1, 'Pamiho', 75, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(513, 26, 30, 1, 'Mboga', 80, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(512, 26, 30, 1, 'Msoga', 85, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(511, 26, 30, 1, 'Chalinze', 90, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(510, 26, 30, 1, 'Bwawani', 95, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(509, 26, 30, 1, 'Mpakani', 100, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(508, 26, 30, 1, 'Msamvu', 100, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(507, 26, 30, 1, 'Nanenane', 100, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(506, 26, 30, 1, 'Kihonda', 100, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(505, 26, 30, 1, 'Mjini kati', 100, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(652, 29, 33, 2, 'tambuka reli', 80, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(651, 29, 33, 2, 'Mwishoni basi', 80, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(650, 29, 33, 1, 'Ambedia', 0, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(649, 29, 33, 1, 'Proma', 0, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(648, 29, 33, 1, 'Kinyerezi', 0, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(647, 29, 33, 1, 'Darajani', 0, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(646, 29, 33, 1, 'Capripoint', 0, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(645, 29, 33, 1, 'Kwa Ally', 0, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(644, 29, 33, 1, 'Mwishoni', 0, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(643, 29, 33, 1, 'Darajani B', 0, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(642, 29, 33, 1, 'Arumeru', 0, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(641, 29, 33, 1, 'Arusha mjini', 0, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(640, 29, 33, 2, 'arusha mjini', 100, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(639, 29, 33, 2, 'arumeru', 100, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(352, 28, 32, 2, 'Mji mpya', 70, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(351, 28, 32, 2, 'Mwisho wa lami', 75, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(350, 28, 32, 2, 'Sabasaba', 100, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(349, 28, 32, 2, 'Sokoni', 100, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(346, 27, 31, 2, 'Bwawani', 100, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(345, 27, 31, 2, 'Chalinze', 95, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(344, 27, 31, 2, 'Msoga', 95, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(343, 27, 31, 2, 'mboga', 95, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(342, 27, 31, 2, 'Sijui wapi', 95, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(341, 27, 31, 2, 'Njia panda ya bagamoyo', 95, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(340, 27, 31, 2, 'Msata', 95, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(339, 27, 31, 2, 'Tanga', 90, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(338, 27, 31, 1, 'Korogwe', 90, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(337, 27, 31, 1, 'Ng\'ambo', 90, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(336, 27, 31, 1, 'Pa kula', 90, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(335, 27, 31, 1, 'Same', 95, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(334, 27, 31, 1, 'Njia panda ya himo', 95, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(333, 27, 31, 1, 'Pumuani', 95, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(332, 27, 31, 1, 'Moshi', 100, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(331, 27, 31, 1, 'Meru', 100, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(330, 27, 31, 1, 'Kia 2', 100, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(329, 27, 31, 1, 'Kia', 100, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(328, 27, 31, 1, 'Arusha road', 100, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(311, 14, 18, 1, 'Shabiby', 100, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(310, 14, 18, 1, 'Bunge', 100, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(309, 14, 18, 1, 'General', 100, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(308, 14, 18, 1, 'Nanenane', 100, 'no', '2025-06-07 22:23:40', '2025-06-08 01:23:40'),
(347, 27, 31, 2, 'Msamvu', 100, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(348, 27, 31, 2, 'Abood Offices', 100, 'no', '2025-06-07 23:38:06', '2025-06-08 02:38:06'),
(369, 28, 32, 2, 'General', 100, 'no', '2025-06-07 23:40:07', '2025-06-08 02:40:07'),
(656, 29, 33, 2, 'Mviringo', 90, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(655, 29, 33, 2, 'Mambo mapya', 90, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(654, 29, 33, 2, 'Njia panda ya uvuvio', 80, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(568, 30, 34, 2, 'General', 100, 'no', '2025-10-23 14:47:26', '2025-10-23 17:47:26'),
(567, 30, 34, 2, 'Mwhisho wa lami', 100, 'no', '2025-10-23 14:47:26', '2025-10-23 17:47:26'),
(566, 30, 34, 1, 'Mpakani', 0, 'no', '2025-10-23 14:47:26', '2025-10-23 17:47:26'),
(565, 30, 34, 1, 'Nyegezi', 0, 'no', '2025-10-23 14:47:26', '2025-10-23 17:47:26'),
(564, 30, 34, 1, 'Pamba House', 0, 'no', '2025-10-23 14:47:26', '2025-10-23 17:47:26'),
(393, 10, 14, 1, 'Majengo', 20, 'no', '2025-06-08 10:03:18', '2025-06-08 13:03:18'),
(394, 10, 14, 1, 'Isaka', 15, 'no', '2025-06-08 10:03:18', '2025-06-08 13:03:18'),
(395, 10, 14, 2, 'Tinde', 15, 'no', '2025-06-08 10:03:18', '2025-06-08 13:03:18'),
(396, 10, 14, 2, 'Shinyanga', 20, 'no', '2025-06-08 10:03:18', '2025-06-08 13:03:18'),
(397, 10, 14, 2, 'Nyegezi', 20, 'no', '2025-06-08 10:03:18', '2025-06-08 13:03:18'),
(406, 9, 13, 2, 'songambele', 50, 'no', '2025-06-08 10:12:10', '2025-06-08 13:12:10'),
(407, 9, 13, 2, 'shule kuu', 50, 'no', '2025-06-08 10:12:10', '2025-06-08 13:12:10'),
(408, 9, 13, 2, 'stendi kuu ya musoma', 50, 'no', '2025-06-08 10:12:10', '2025-06-08 13:12:10'),
(411, 19, 23, 1, 'Mlandizi', 90, 'no', '2025-06-08 12:33:49', '2025-06-08 15:33:49'),
(412, 19, 23, 1, 'Chalinze', 85, 'no', '2025-06-08 12:33:49', '2025-06-08 15:33:49'),
(413, 19, 23, 1, 'Mboga', 80, 'no', '2025-06-08 12:33:49', '2025-06-08 15:33:49'),
(414, 19, 23, 2, 'Tanga', 85, 'no', '2025-06-08 12:33:49', '2025-06-08 15:33:49'),
(415, 19, 23, 2, 'Chakulani', 90, 'no', '2025-06-08 12:33:49', '2025-06-08 15:33:49'),
(416, 19, 23, 2, 'Same', 95, 'no', '2025-06-08 12:33:49', '2025-06-08 15:33:49'),
(417, 19, 23, 2, 'Njia panda ya Himo', 100, 'no', '2025-06-08 12:33:49', '2025-06-08 15:33:49'),
(418, 24, 28, 1, 'Shabiby offices', 100, 'no', '2025-06-08 12:40:28', '2025-06-08 15:40:28'),
(419, 24, 28, 1, 'Town tambuka', 100, 'no', '2025-06-08 12:40:28', '2025-06-08 15:40:28'),
(420, 24, 28, 1, 'Kiomboi', 100, 'no', '2025-06-08 12:40:28', '2025-06-08 15:40:28'),
(421, 24, 28, 1, 'Manyoni', 90, 'no', '2025-06-08 12:40:28', '2025-06-08 15:40:28'),
(422, 24, 28, 1, 'sijui wapi', 85, 'no', '2025-06-08 12:40:28', '2025-06-08 15:40:28'),
(423, 24, 28, 2, 'mpakani', 80, 'no', '2025-06-08 12:40:28', '2025-06-08 15:40:28'),
(424, 24, 28, 2, 'Singida', 90, 'no', '2025-06-08 12:40:28', '2025-06-08 15:40:28'),
(425, 24, 28, 2, 'Manyara', 100, 'no', '2025-06-08 12:40:28', '2025-06-08 15:40:28'),
(426, 24, 28, 2, 'Njia panda', 100, 'no', '2025-06-08 12:40:28', '2025-06-08 15:40:28'),
(427, 24, 28, 2, 'stendi kuu arusha', 100, 'no', '2025-06-08 12:40:28', '2025-06-08 15:40:28'),
(463, 32, 36, 2, 'Stand kuu shinyanga', 100, 'no', '2025-06-14 20:24:33', '2025-06-14 23:24:33'),
(462, 32, 36, 1, 'stendi kuu', 100, 'no', '2025-06-14 20:24:33', '2025-06-14 23:24:33'),
(460, 32, 36, 1, 'Pamba road', 100, 'no', '2025-06-14 20:24:33', '2025-06-14 23:24:33'),
(461, 32, 36, 1, 'kona', 100, 'no', '2025-06-14 20:24:33', '2025-06-14 23:24:33'),
(459, 32, 36, 1, 'Nyegezi', 100, 'no', '2025-06-14 20:24:33', '2025-06-14 23:24:33'),
(458, 32, 36, 2, 'Igombe', 100, 'no', '2025-06-14 20:24:33', '2025-06-14 23:24:33'),
(457, 32, 36, 2, 'mpakani', 100, 'no', '2025-06-14 20:24:33', '2025-06-14 23:24:33'),
(456, 32, 36, 2, 'Mjengo Mapya', 100, 'no', '2025-06-14 20:24:33', '2025-06-14 23:24:33'),
(455, 32, 36, 2, 'Mjengoni', 100, 'no', '2025-06-14 20:24:33', '2025-06-14 23:24:33'),
(528, 18, 22, 1, 'Arusha bus stand', 0, 'no', '2025-10-20 01:47:46', '2025-10-20 04:47:46'),
(527, 18, 22, 1, 'Kilimanjaro bus offices', 0, 'no', '2025-10-20 01:47:46', '2025-10-20 04:47:46'),
(484, 33, 37, 1, 'mbezi', 500, 'no', '2025-07-29 12:33:18', '2025-07-29 15:33:18'),
(483, 33, 37, 1, 'Mbezi magufuli', 500, 'no', '2025-07-29 12:33:18', '2025-07-29 15:33:18'),
(482, 33, 37, 1, 'Shekilango', 500, 'no', '2025-07-29 12:33:18', '2025-07-29 15:33:18'),
(485, 33, 37, 1, 'Chalinze', 500, 'no', '2025-07-29 12:33:18', '2025-07-29 15:33:18'),
(486, 33, 37, 2, 'Mpakani', 500, 'no', '2025-07-29 12:33:18', '2025-07-29 15:33:18'),
(487, 33, 37, 2, 'Kibaoni', 500, 'no', '2025-07-29 12:33:18', '2025-07-29 15:33:18'),
(488, 33, 37, 2, 'Stendi kuu', 500, 'no', '2025-07-29 12:33:18', '2025-07-29 15:33:18'),
(489, 33, 37, 2, 'Kilimanjaro offices', 500, 'no', '2025-07-29 12:33:18', '2025-07-29 15:33:18'),
(490, 36, 40, 1, 'Banana', 300, 'no', '2025-07-30 08:16:11', '2025-07-30 11:16:11'),
(491, 36, 40, 1, 'Shekilango', 300, 'no', '2025-07-30 08:16:11', '2025-07-30 11:16:11'),
(492, 36, 40, 1, 'Mbezi magufuli', 300, 'no', '2025-07-30 08:16:11', '2025-07-30 11:16:11'),
(493, 36, 40, 1, 'Kibaha', 300, 'no', '2025-07-30 08:16:11', '2025-07-30 11:16:11'),
(494, 36, 40, 1, 'Mlandizi', 300, 'no', '2025-07-30 08:16:11', '2025-07-30 11:16:11'),
(495, 36, 40, 1, 'Chamakweza', 250, 'no', '2025-07-30 08:16:11', '2025-07-30 11:16:11'),
(496, 36, 40, 1, 'Chalinze', 250, 'no', '2025-07-30 08:16:11', '2025-07-30 11:16:11'),
(497, 36, 40, 1, 'Morogoro', 200, 'no', '2025-07-30 08:16:11', '2025-07-30 11:16:11'),
(498, 36, 40, 1, 'Kihemba', 150, 'no', '2025-07-30 08:16:11', '2025-07-30 11:16:11'),
(499, 36, 40, 1, 'Ruaha', 150, 'no', '2025-07-30 08:16:12', '2025-07-30 11:16:12'),
(500, 36, 40, 2, 'Chalinze', 150, 'no', '2025-07-30 08:16:12', '2025-07-30 11:16:12'),
(501, 36, 40, 2, 'Morogoro', 150, 'no', '2025-07-30 08:16:12', '2025-07-30 11:16:12'),
(502, 36, 40, 2, 'Luaha', 200, 'no', '2025-07-30 08:16:12', '2025-07-30 11:16:12'),
(503, 36, 40, 2, 'Mpakani', 300, 'no', '2025-07-30 08:16:12', '2025-07-30 11:16:12'),
(504, 36, 40, 2, 'Kibaoni', 300, 'no', '2025-07-30 08:16:12', '2025-07-30 11:16:12'),
(523, 26, 30, 2, 'MOSHI MJINI', 90, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(524, 26, 30, 2, 'Kia', 95, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(525, 26, 30, 2, 'Arusha', 100, 'no', '2025-08-01 01:22:15', '2025-08-01 04:22:15'),
(526, 35, 39, 1, 'bunju', 1000, 'no', '2025-08-01 08:42:35', '2025-08-01 11:42:35'),
(533, 18, 22, 2, 'Shekilango', 100, 'no', '2025-10-20 01:47:46', '2025-10-20 04:47:46'),
(534, 18, 22, 1, 'Shekilango', 0, 'yes', '2025-10-20 01:47:46', '2025-10-20 04:47:46'),
(535, 18, 22, 1, 'Kimara mwisho', 0, 'yes', '2025-10-20 01:47:46', '2025-10-20 04:47:46'),
(536, 18, 22, 1, 'Mbezi magufuli', 0, 'no', '2025-10-20 01:47:46', '2025-10-20 04:47:46'),
(537, 18, 22, 2, 'Tambuka lami', 100, 'yes', '2025-10-20 01:47:46', '2025-10-20 04:47:46'),
(538, 18, 22, 2, 'Arusha bus stand', 100, 'yes', '2025-10-20 01:47:46', '2025-10-20 04:47:46'),
(539, 18, 22, 2, 'aaKilimanjaro bus offices', 100, 'yes', '2025-10-20 01:47:46', '2025-10-20 04:47:46'),
(653, 29, 33, 2, 'Lubaga', 80, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(569, 30, 34, 2, 'Job Ndugai Bus stand', 100, 'no', '2025-10-23 14:47:26', '2025-10-23 17:47:26'),
(570, 30, 34, 1, 'Job Ndugai Bus stand', 0, 'yes', '2025-10-23 14:47:26', '2025-10-23 17:47:26'),
(571, 30, 34, 1, 'General', 0, 'yes', '2025-10-23 14:47:26', '2025-10-23 17:47:26'),
(572, 30, 34, 1, 'Mwisho wa Lami', 0, 'yes', '2025-10-23 14:47:26', '2025-10-23 17:47:26'),
(573, 30, 34, 2, 'Mpakani', 100, 'yes', '2025-10-23 14:47:26', '2025-10-23 17:47:26'),
(574, 30, 34, 2, 'Nyegezi', 100, 'yes', '2025-10-23 14:47:26', '2025-10-23 17:47:26'),
(575, 30, 34, 2, 'Pamba house', 100, 'yes', '2025-10-23 14:47:26', '2025-10-23 17:47:26'),
(638, 29, 33, 1, 'Arusha', 0, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(637, 29, 33, 1, 'Arumelu', 0, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(636, 29, 33, 1, 'Arusha centre', 0, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(635, 29, 33, 1, 'Pont kubwa', 0, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(634, 29, 33, 1, 'Mviringo', 0, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(633, 29, 33, 1, 'mambo mapya', 0, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(632, 29, 33, 1, 'Njia panda ya uvuvio', 0, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(631, 29, 33, 1, 'Lubaga', 0, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(630, 29, 33, 1, 'Tambuka reli', 0, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(629, 29, 33, 1, 'Mwishoni basi', 0, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(628, 29, 33, 2, 'ambedia', 80, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(627, 29, 33, 2, 'proma', 80, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(626, 29, 33, 2, 'kinyerezi', 80, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(625, 29, 33, 2, 'darajani', 80, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(624, 29, 33, 2, 'capripoint', 90, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(623, 29, 33, 2, 'kwa ally', 90, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(622, 29, 33, 2, 'mwishoni', 90, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(621, 29, 33, 2, 'darajani B', 100, 'no', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(657, 29, 33, 2, 'Ponti kubwa', 90, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(658, 29, 33, 2, 'Arusha centrr', 100, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(659, 29, 33, 2, 'Arumeru', 100, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54'),
(660, 29, 33, 2, 'Arusha', 100, 'yes', '2026-02-27 03:45:54', '2026-02-26 22:45:54');

-- --------------------------------------------------------

--
-- Table structure for table `refund`
--

CREATE TABLE `refund` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_code` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `phone` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `refund`
--

INSERT INTO `refund` (`id`, `booking_code`, `amount`, `status`, `phone`, `fullname`, `created_at`, `updated_at`) VALUES
(1, '310', '100.00', 'Rejected', NULL, 'ibrahim ashiraf', '2025-09-13 10:01:05', '2025-09-13 10:07:20'),
(2, '304', '33.00', 'Rejected', '534634564536456', 'ibrahim ashiraf', '2025-09-13 10:04:39', '2025-09-13 10:54:20'),
(3, '303', '33.00', 'Rejected', '3464564344', 'nasco jonathan', '2025-09-13 10:05:27', '2025-09-13 10:54:18'),
(4, '301', '92.00', 'Rejected', '3464564344', 'hassan mwakisu', '2025-09-13 10:08:07', '2025-09-13 10:54:16'),
(5, NULL, '92.00', 'Rejected', '3464564344', 'hassan mwakisu', '2025-09-13 10:11:04', '2025-09-13 10:54:14'),
(6, 'BD40449747', '92.00', 'Approved', '3464564344', 'hassan mwakisu', '2025-09-13 10:18:56', '2025-09-13 10:19:45'),
(7, 'ER42839017', '92.00', 'Rejected', '3464564344', 'hassan mwakisu', '2025-09-13 10:53:26', '2025-09-13 10:54:12'),
(8, 'TX67590621', '100.00', 'Approved', '534634564536456', 'ibrahim ashiraf', '2025-09-13 11:10:02', '2025-09-29 20:53:27'),
(9, 'AC49802367', '0', 'Pending', '0715553803', 'Mariam Shafii', '2026-02-24 03:19:06', '2026-02-24 03:19:06');

-- --------------------------------------------------------

--
-- Table structure for table `refund_percentages`
--

CREATE TABLE `refund_percentages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_code` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `refund_percentages`
--

INSERT INTO `refund_percentages` (`id`, `booking_code`, `amount`, `created_at`, `updated_at`) VALUES
(1, 'AC49802367', 1000.00, '2026-02-24 03:19:06', '2026-02-24 03:19:06');

-- --------------------------------------------------------

--
-- Table structure for table `roundtrip`
--

CREATE TABLE `roundtrip` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(100) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roundtrip`
--

INSERT INTO `roundtrip` (`id`, `key`, `data`, `created_at`, `updated_at`) VALUES
(22, 'Round_68df174a0ec3d', '\"{\\\"bus_id\\\":\\\"18\\\",\\\"from\\\":\\\"Arusha\\\",\\\"to\\\":\\\"Dar es Salaam\\\",\\\"route_id\\\":\\\"22\\\",\\\"pickup_point\\\":\\\"Arusha\\\",\\\"dropping_point\\\":\\\"Dar es Salaam\\\",\\\"travel_date\\\":\\\"2025-10-13\\\",\\\"dropping_point_amount\\\":100,\\\"route_distance\\\":\\\"626.00\\\",\\\"schedule_id\\\":\\\"743\\\",\\\"total_amount\\\":\\\"100\\\",\\\"seats\\\":\\\"M1\\\",\\\"customer_name\\\":\\\"retwer\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"23\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"06:00\\\",\\\"end\\\":\\\"15:00\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"dispo\\\":\\\"100\\\",\\\"discount_amount\\\":0,\\\"fees\\\":101.69491525423729,\\\"price\\\":100}\"', '2025-10-03 00:24:49', '2025-10-03 00:24:49'),
(21, 'Round_68df174a0ec3d', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2025-10-11\\\",\\\"dropping_point_amount\\\":100,\\\"route_distance\\\":\\\"627.03\\\",\\\"schedule_id\\\":\\\"742\\\",\\\"total_amount\\\":\\\"100\\\",\\\"seats\\\":\\\"B1\\\",\\\"customer_name\\\":\\\"retwer\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"23\\\",\\\"infant_child\\\":\\\"1\\\",\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"07:00\\\",\\\"end\\\":\\\"15:00\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"dispo\\\":\\\"100\\\",\\\"discount_amount\\\":0,\\\"fees\\\":101.69491525423729,\\\"price\\\":100}\"', '2025-10-03 00:22:34', '2025-10-03 00:22:34'),
(23, 'Round_68ecd683a4927', '\"{\\\"bus_id\\\":\\\"18\\\",\\\"from\\\":\\\"Arusha\\\",\\\"to\\\":\\\"Dar es Salaam\\\",\\\"route_id\\\":\\\"22\\\",\\\"pickup_point\\\":\\\"Arusha\\\",\\\"dropping_point\\\":\\\"Dar es Salaam\\\",\\\"travel_date\\\":\\\"2025-10-13\\\",\\\"dropping_point_amount\\\":100,\\\"route_distance\\\":\\\"626.00\\\",\\\"schedule_id\\\":\\\"743\\\",\\\"total_amount\\\":\\\"100\\\",\\\"seats\\\":\\\"I2\\\",\\\"customer_name\\\":\\\"retwer\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"23\\\",\\\"infant_child\\\":\\\"1\\\",\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"06:00\\\",\\\"end\\\":\\\"15:00\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":\\\"1\\\",\\\"excess_luggage_fee\\\":2500,\\\"dispo\\\":\\\"100\\\",\\\"discount_amount\\\":0,\\\"fees\\\":101.69491525423729,\\\"price\\\":2600}\"', '2025-10-13 10:37:55', '2025-10-13 10:37:55'),
(24, 'Round_68ecd683a4927', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2025-10-17\\\",\\\"dropping_point_amount\\\":100,\\\"route_distance\\\":\\\"627.03\\\",\\\"schedule_id\\\":\\\"742\\\",\\\"total_amount\\\":\\\"100\\\",\\\"seats\\\":\\\"A31\\\",\\\"customer_name\\\":\\\"retwer\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"23\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"07:00\\\",\\\"end\\\":\\\"15:00\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"100\\\",\\\"discount_amount\\\":0,\\\"fees\\\":101.69491525423729,\\\"price\\\":100}\"', '2025-10-13 10:48:06', '2025-10-13 10:48:06'),
(25, 'Round_68f2b3b52cb85', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2025-10-19\\\",\\\"dropping_point_amount\\\":100,\\\"route_distance\\\":\\\"626.00\\\",\\\"schedule_id\\\":\\\"741\\\",\\\"total_amount\\\":\\\"100\\\",\\\"seats\\\":\\\"A20\\\",\\\"customer_name\\\":\\\"retwer\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"23\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"07:00\\\",\\\"end\\\":\\\"15:00\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"100\\\",\\\"discount_amount\\\":0,\\\"fees\\\":101.69491525423729,\\\"price\\\":100}\"', '2025-10-17 21:23:01', '2025-10-17 21:23:01'),
(26, 'Round_68f2b3b52cb85', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2025-10-20\\\",\\\"dropping_point_amount\\\":100,\\\"route_distance\\\":\\\"627.03\\\",\\\"schedule_id\\\":\\\"742\\\",\\\"total_amount\\\":\\\"100\\\",\\\"seats\\\":\\\"A12\\\",\\\"customer_name\\\":\\\"retwer\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"23\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"07:00\\\",\\\"end\\\":\\\"15:00\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"100\\\",\\\"discount_amount\\\":0,\\\"fees\\\":101.69491525423729,\\\"price\\\":100}\"', '2025-10-17 21:24:05', '2025-10-17 21:24:05'),
(27, 'Round_68f2b6f1acca4', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2025-10-19\\\",\\\"dropping_point_amount\\\":100,\\\"route_distance\\\":\\\"626.00\\\",\\\"schedule_id\\\":\\\"741\\\",\\\"total_amount\\\":\\\"100\\\",\\\"seats\\\":\\\"A20\\\",\\\"customer_name\\\":\\\"retwer\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"23\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"07:00\\\",\\\"end\\\":\\\"15:00\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"100\\\",\\\"discount_amount\\\":0,\\\"fees\\\":101.69491525423729,\\\"price\\\":100}\"', '2025-10-17 21:36:49', '2025-10-17 21:36:49'),
(28, 'Round_68f2b6f1acca4', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2025-10-20\\\",\\\"dropping_point_amount\\\":100,\\\"route_distance\\\":\\\"627.03\\\",\\\"schedule_id\\\":\\\"742\\\",\\\"total_amount\\\":\\\"100\\\",\\\"seats\\\":\\\"A24\\\",\\\"customer_name\\\":\\\"retwer\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"23\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"07:00\\\",\\\"end\\\":\\\"15:00\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"100\\\",\\\"discount_amount\\\":0,\\\"fees\\\":101.69491525423729,\\\"price\\\":100}\"', '2025-10-17 21:37:57', '2025-10-17 21:37:57'),
(29, 'Round_68fd23f99a9fb', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2025-10-26\\\",\\\"dropping_point_amount\\\":100,\\\"route_distance\\\":\\\"627.03\\\",\\\"schedule_id\\\":\\\"742\\\",\\\"total_amount\\\":\\\"100\\\",\\\"seats\\\":\\\"N1\\\",\\\"customer_name\\\":\\\"Rhoda Peter\\\",\\\"gender\\\":\\\"Female\\\",\\\"age\\\":\\\"30\\\",\\\"infant_child\\\":\\\"1\\\",\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"07:00\\\",\\\"end\\\":\\\"15:00\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"100\\\",\\\"discount_amount\\\":0,\\\"fees\\\":101.69491525423728717214544303715229034423828125,\\\"price\\\":100}\"', '2025-10-25 19:24:41', '2025-10-25 19:24:41'),
(30, 'Round_68fd23f99a9fb', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2025-10-31\\\",\\\"dropping_point_amount\\\":100,\\\"route_distance\\\":\\\"626.00\\\",\\\"schedule_id\\\":\\\"741\\\",\\\"total_amount\\\":\\\"100\\\",\\\"seats\\\":\\\"A1\\\",\\\"customer_name\\\":\\\"Rhoda Peter\\\",\\\"gender\\\":\\\"Female\\\",\\\"age\\\":\\\"30\\\",\\\"infant_child\\\":\\\"1\\\",\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"07:00\\\",\\\"end\\\":\\\"15:00\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"100\\\",\\\"discount_amount\\\":0,\\\"fees\\\":101.69491525423728717214544303715229034423828125,\\\"price\\\":100}\"', '2025-10-25 19:26:52', '2025-10-25 19:26:52'),
(31, 'Round_699b6e5c8ab01', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-23\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"626.00\\\",\\\"schedule_id\\\":\\\"741\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"B4\\\",\\\"customer_name\\\":\\\"Abdul Bunju\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"12\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-23 05:00:12', '2026-02-23 05:00:12'),
(32, 'Round_699b6e5c8ab01', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-24\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"627.03\\\",\\\"schedule_id\\\":\\\"742\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"A1\\\",\\\"customer_name\\\":\\\"Abdul Bunju\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"12\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-23 05:02:47', '2026-02-23 05:02:47'),
(33, 'Round_699c63cc3e667', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-23\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"626.00\\\",\\\"schedule_id\\\":\\\"741\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"C4\\\",\\\"customer_name\\\":\\\"Abdul Bunju\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"22\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-23 22:27:24', '2026-02-23 22:27:24'),
(34, 'Round_699c63cc3e667', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-24\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"627.02\\\",\\\"schedule_id\\\":\\\"742\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"A1\\\",\\\"customer_name\\\":\\\"Abdul Bunju\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"22\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-23 22:28:40', '2026-02-23 22:28:40'),
(35, 'Round_699c80ad67582', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-23\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"626.00\\\",\\\"schedule_id\\\":\\\"741\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"C4\\\",\\\"customer_name\\\":\\\"Abdul Bunju\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"22\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-24 00:30:37', '2026-02-24 00:30:37'),
(36, 'Round_699c80ad67582', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-24\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"627.02\\\",\\\"schedule_id\\\":\\\"742\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"A1\\\",\\\"customer_name\\\":\\\"Abdul Bunju\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"22\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-24 00:34:04', '2026-02-24 00:34:04'),
(37, 'Round_699c8210bf753', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-23\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"626.00\\\",\\\"schedule_id\\\":\\\"741\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"C4\\\",\\\"customer_name\\\":\\\"Abdul Bunju\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"22\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-24 00:36:32', '2026-02-24 00:36:32'),
(38, 'Round_699c8210bf753', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-24\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"627.02\\\",\\\"schedule_id\\\":\\\"742\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"A1\\\",\\\"customer_name\\\":\\\"Abdul Bunju\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"22\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-24 00:37:08', '2026-02-24 00:37:08'),
(39, 'Round_699c82dd12ef9', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-23\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"626.00\\\",\\\"schedule_id\\\":\\\"741\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"C4\\\",\\\"customer_name\\\":\\\"Abdul Bunju\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"22\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-24 00:39:57', '2026-02-24 00:39:57'),
(40, 'Round_699c82dd12ef9', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-24\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"627.02\\\",\\\"schedule_id\\\":\\\"742\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"A1\\\",\\\"customer_name\\\":\\\"Abdul Bunju\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"22\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-24 00:41:31', '2026-02-24 00:41:31'),
(41, 'Round_699c83c043dfb', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-23\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"626.00\\\",\\\"schedule_id\\\":\\\"741\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"C4\\\",\\\"customer_name\\\":\\\"Abdul Bunju\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"22\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-24 00:43:44', '2026-02-24 00:43:44'),
(42, 'Round_699c83c043dfb', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-24\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"627.02\\\",\\\"schedule_id\\\":\\\"742\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"A1\\\",\\\"customer_name\\\":\\\"Abdul Bunju\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"23\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-24 00:44:14', '2026-02-24 00:44:14'),
(43, 'Round_699c9bf15ddc6', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-23\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"626.00\\\",\\\"schedule_id\\\":\\\"741\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"A2\\\",\\\"customer_name\\\":\\\"Ashfaina\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"23\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-24 02:26:57', '2026-02-24 02:26:57'),
(44, 'Round_699c9bf15ddc6', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-24\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":0,\\\"schedule_id\\\":\\\"742\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"A1\\\",\\\"customer_name\\\":\\\"Ashfaina\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"12\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-24 02:28:12', '2026-02-24 02:28:12'),
(45, 'Round_699c9f9d0fdab', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-23\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"626.00\\\",\\\"schedule_id\\\":\\\"741\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"M1\\\",\\\"customer_name\\\":\\\"Ashfaina\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"33\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-24 02:42:37', '2026-02-24 02:42:37'),
(46, 'Round_699c9f9d0fdab', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-24\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"627.02\\\",\\\"schedule_id\\\":\\\"742\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"A1\\\",\\\"customer_name\\\":\\\"Ashfaina\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"43\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-24 02:43:30', '2026-02-24 02:43:30'),
(47, 'Round_699ca747898e3', '\"{\\\"bus_id\\\":\\\"18\\\",\\\"from\\\":\\\"Arusha\\\",\\\"to\\\":\\\"Dar es Salaam\\\",\\\"route_id\\\":\\\"22\\\",\\\"pickup_point\\\":\\\"Arusha\\\",\\\"dropping_point\\\":\\\"Dar es Salaam\\\",\\\"travel_date\\\":\\\"2026-02-23\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"627.02\\\",\\\"schedule_id\\\":\\\"740\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"E1\\\",\\\"customer_name\\\":\\\"Ashfaina\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"44\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-24 03:15:19', '2026-02-24 03:15:19'),
(48, 'Round_699ca747898e3', '\"{\\\"bus_id\\\":\\\"18\\\",\\\"from\\\":\\\"Arusha\\\",\\\"to\\\":\\\"Dar es Salaam\\\",\\\"route_id\\\":\\\"22\\\",\\\"pickup_point\\\":\\\"Arusha\\\",\\\"dropping_point\\\":\\\"Dar es Salaam\\\",\\\"travel_date\\\":\\\"2026-02-24\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"626.00\\\",\\\"schedule_id\\\":\\\"743\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"E1\\\",\\\"customer_name\\\":\\\"Ashfaina\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"55\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-24 03:17:15', '2026-02-24 03:17:15'),
(49, 'Round_699ef06c363a5', '\"{\\\"bus_id\\\":\\\"18\\\",\\\"from\\\":\\\"Arusha\\\",\\\"to\\\":\\\"Dar es Salaam\\\",\\\"route_id\\\":\\\"22\\\",\\\"pickup_point\\\":\\\"Arusha\\\",\\\"dropping_point\\\":\\\"Dar es Salaam\\\",\\\"travel_date\\\":\\\"2026-02-25\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"627.02\\\",\\\"schedule_id\\\":\\\"740\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"M1\\\",\\\"customer_name\\\":\\\"Abdul Bunju\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"22\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":\\\"1\\\",\\\"excess_luggage_fee\\\":2500,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":3500}\"', '2026-02-25 20:51:56', '2026-02-25 20:51:56'),
(50, 'Round_699ef06c363a5', '\"{\\\"bus_id\\\":\\\"21\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Arusha\\\",\\\"route_id\\\":\\\"25\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Arusha\\\",\\\"travel_date\\\":\\\"2026-02-27\\\",\\\"dropping_point_amount\\\":\\\"1000\\\",\\\"route_distance\\\":\\\"626.00\\\",\\\"schedule_id\\\":\\\"741\\\",\\\"total_amount\\\":\\\"1000\\\",\\\"seats\\\":\\\"M1\\\",\\\"customer_name\\\":\\\"Abdul Bunju\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"22\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"1000\\\",\\\"discount_amount\\\":0,\\\"fees\\\":108.47457627118644,\\\"price\\\":1000}\"', '2026-02-25 20:53:25', '2026-02-25 20:53:25'),
(51, 'Round_69a09cd5970c2', '\"{\\\"bus_id\\\":\\\"23\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Morogoro\\\",\\\"route_id\\\":\\\"27\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Morogoro\\\",\\\"travel_date\\\":\\\"2026-02-27\\\",\\\"dropping_point_amount\\\":\\\"900\\\",\\\"route_distance\\\":\\\"250.02\\\",\\\"schedule_id\\\":\\\"1271\\\",\\\"total_amount\\\":\\\"900\\\",\\\"seats\\\":\\\"A1\\\",\\\"customer_name\\\":\\\"Abdul\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"22\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"900\\\",\\\"discount_amount\\\":0,\\\"fees\\\":107.62711864406779,\\\"price\\\":900}\"', '2026-02-27 03:19:49', '2026-02-27 03:19:49'),
(52, 'Round_69a09cd5970c2', '\"{\\\"bus_id\\\":\\\"23\\\",\\\"from\\\":\\\"Dar es Salaam\\\",\\\"to\\\":\\\"Morogoro\\\",\\\"route_id\\\":\\\"27\\\",\\\"pickup_point\\\":\\\"Dar es Salaam\\\",\\\"dropping_point\\\":\\\"Morogoro\\\",\\\"travel_date\\\":\\\"2026-02-28\\\",\\\"dropping_point_amount\\\":\\\"900\\\",\\\"route_distance\\\":\\\"250.02\\\",\\\"schedule_id\\\":\\\"1271\\\",\\\"total_amount\\\":\\\"900\\\",\\\"seats\\\":\\\"A4\\\",\\\"customer_name\\\":\\\"Abdul\\\",\\\"gender\\\":\\\"Male\\\",\\\"age\\\":\\\"22\\\",\\\"infant_child\\\":0,\\\"age_group\\\":\\\"Adult\\\",\\\"category\\\":null,\\\"start\\\":\\\"\\\",\\\"end\\\":\\\"\\\",\\\"bima\\\":0,\\\"insuranceDate\\\":null,\\\"discount\\\":\\\"\\\",\\\"cancel_amount\\\":\\\"0\\\",\\\"cancel_key\\\":\\\"\\\",\\\"has_excess_luggage\\\":0,\\\"excess_luggage_fee\\\":0,\\\"dispo\\\":\\\"900\\\",\\\"discount_amount\\\":0,\\\"fees\\\":107.62711864406779,\\\"price\\\":900}\"', '2026-02-27 03:21:49', '2026-02-27 03:21:49');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `route_start` varchar(255) DEFAULT NULL,
  `route_end` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `distance` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `bus_id`, `from`, `to`, `route_start`, `route_end`, `price`, `distance`, `created_at`, `updated_at`) VALUES
(23, 19, 'Dar es Salaam', 'Arusha', '22:55', '10:55', 300, NULL, '2025-05-11 19:45:38', '2025-05-24 09:16:42'),
(10, 6, 'Dar es Salaam', 'Dodoma', '02:09', '14:09', 40000, NULL, '2025-04-23 08:24:02', '2025-05-06 11:09:24'),
(18, 14, 'Dodoma', 'Dar es Salaam', '00:32', '13:33', 100, NULL, '2025-05-06 16:23:24', '2025-05-31 03:07:14'),
(12, 8, 'Dar es Salaam', 'Mwanza', '03:30', '17:30', 60000, NULL, '2025-04-26 11:19:04', '2025-04-26 14:19:04'),
(13, 9, 'Mwanza', 'Musoma', '06:00', '14:10', 100, NULL, '2025-05-02 10:41:55', '2025-07-06 10:02:03'),
(14, 10, 'Kahama Town', 'Mwanza', '06:00', '09:27', 100, NULL, '2025-05-04 02:29:31', '2025-07-06 10:02:47'),
(15, 11, 'Dar es Salaam', 'Tanga', '10:55', '15:55', 15000, NULL, '2025-05-05 00:58:09', '2025-05-05 03:58:09'),
(16, 12, 'Dar es Salaam', 'Morogoro', '07:00', '10:30', 20000, NULL, '2025-05-05 01:44:58', '2025-05-05 04:44:58'),
(19, 15, 'Dar es Salaam', 'Tanga', '08:00', '16:00', 30000, NULL, '2025-05-06 18:57:10', '2025-05-06 21:57:47'),
(20, 16, 'Dar es Salaam', 'Tanga', '08:00', '14:30', 35000, NULL, '2025-05-06 19:34:14', '2025-05-06 22:34:14'),
(22, 18, 'Arusha', 'Dar es Salaam', '', '', 1000, NULL, '2025-05-07 12:35:38', '2026-02-21 16:21:02'),
(24, 20, 'Dar es Salaam', 'Kagera', '03:00', '12:00', 50000, NULL, '2025-05-12 07:16:57', '2025-05-12 00:16:57'),
(25, 21, 'Dar es Salaam', 'Arusha', '', '', 1000, NULL, '2025-05-18 01:27:50', '2026-02-26 22:45:08'),
(28, 24, 'Dodoma', 'Arusha', '08:00', '16:00', 300, NULL, '2025-05-24 13:47:22', '2025-05-24 16:47:42'),
(29, 25, 'Dar es Salaam', 'Dodoma', '08:00', '12:00', 300, NULL, '2025-05-24 19:45:58', '2025-05-24 22:45:58'),
(30, 26, 'Morogoro', 'Arusha', '21:00', '06:00', 100, NULL, '2025-05-30 23:48:25', '2025-05-31 02:52:02'),
(31, 27, 'Arusha', 'Morogoro', '21:00', '06:00', 100, NULL, '2025-05-30 23:56:52', '2025-05-31 03:01:35'),
(32, 28, 'Dar es Salaam', 'Dodoma', '08:00', '09:00', 100, NULL, '2025-05-31 00:06:26', '2025-05-31 03:08:15'),
(33, 29, 'Arusha', 'Manyara', '', '', 100, NULL, '2025-06-01 08:09:49', '2025-10-28 16:57:43'),
(34, 30, 'Mwanza', 'Dodoma', '', '', 100, NULL, '2025-06-08 00:58:45', '2025-10-24 06:13:52'),
(36, 32, 'Mwanza', 'Shinyanga', '05:00', '07:00', 100, 205, '2025-06-14 20:06:37', '2025-07-06 10:02:23'),
(37, 33, 'Dar es Salaam', 'Iringa', '08:00', '16:10', 500, 526, '2025-06-15 13:56:10', '2025-07-29 15:12:30'),
(38, 34, 'Iringa', 'Dar es Salaam', '08:00', '16:10', 500, 526, '2025-06-15 13:56:28', '2025-07-29 15:17:01'),
(39, 35, 'Ifakara', 'Dar es Salaam', '06:00', '13:00', 300, 417, '2025-07-30 07:42:43', '2025-07-30 10:52:49'),
(40, 36, 'Dar es Salaam', 'Ifakara', '06:00', '13:00', 300, 419, '2025-07-30 07:49:23', '2025-07-30 10:54:25'),
(41, 37, 'Dar es Salaam', 'Arusha', '08:00', '17:00', 50000, 626, '2025-08-25 11:48:20', '2025-08-25 14:48:20'),
(42, 38, 'Dar es Salaam', 'Mwanza', '04:00', '18:00', 70000, 1153, '2025-10-03 22:07:22', '2025-10-04 01:07:22'),
(43, 39, 'Dar es Salaam', 'Tanga', '', '', 30000, 334, '2025-10-24 01:34:56', '2025-10-24 04:35:27');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bus_id` bigint(20) UNSIGNED NOT NULL,
  `route_id` int(11) NOT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `schedule_date` date DEFAULT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `bus_id`, `route_id`, `from`, `to`, `schedule_date`, `start`, `end`, `created_at`, `updated_at`) VALUES
(742, 21, 25, 'Arusha', 'Dar es Salaam', '2025-10-11', '06:18:00', '17:18:00', '2025-09-29 20:18:37', '2025-09-29 20:18:37'),
(741, 21, 25, 'Dar es Salaam', 'Arusha', '2025-09-30', '08:19:00', '18:19:00', '2025-09-22 13:19:16', '2025-09-22 13:19:16'),
(740, 18, 22, 'Arusha', 'Dar es Salaam', '2025-09-20', '08:57:00', '17:58:00', '2025-09-11 20:58:19', '2025-09-11 20:58:19'),
(743, 18, 22, 'Dar es Salaam', 'Arusha', '2025-10-13', '08:00:00', '17:00:00', '2025-10-02 22:34:29', '2025-10-02 22:34:29'),
(744, 38, 42, 'Dar es Salaam', 'Mwanza', '2025-10-10', '06:07:00', '20:08:00', '2025-10-03 22:08:16', '2025-10-03 22:08:16'),
(745, 21, 25, 'Dar es Salaam', 'Arusha', '2025-10-12', '06:00:00', '17:00:00', '2025-10-10 13:37:22', '2025-10-10 13:37:22'),
(746, 21, 25, 'Arusha', 'Dar es Salaam', '2025-10-13', '06:00:00', '17:00:00', '2025-10-10 13:37:22', '2025-10-10 13:37:22'),
(747, 21, 25, 'Dar es Salaam', 'Arusha', '2025-10-14', '06:00:00', '17:00:00', '2025-10-10 13:37:22', '2025-10-10 13:37:22'),
(748, 21, 25, 'Arusha', 'Dar es Salaam', '2025-10-15', '06:00:00', '17:00:00', '2025-10-10 13:37:22', '2025-10-10 13:37:22'),
(749, 21, 25, 'Dar es Salaam', 'Arusha', '2025-10-16', '06:00:00', '17:00:00', '2025-10-10 13:37:22', '2025-10-10 13:37:22'),
(750, 21, 25, 'Arusha', 'Dar es Salaam', '2025-10-17', '06:00:00', '17:00:00', '2025-10-10 13:37:22', '2025-10-10 13:37:22'),
(751, 21, 25, 'Dar es Salaam', 'Arusha', '2025-10-17', '21:00:00', '06:00:00', '2025-10-17 06:12:26', '2025-10-17 06:12:26'),
(752, 21, 25, 'Arusha', 'Dar es Salaam', '2025-10-18', '21:00:00', '06:00:00', '2025-10-17 06:12:26', '2025-10-17 06:12:26'),
(753, 21, 25, 'Dar es Salaam', 'Arusha', '2025-10-19', '21:00:00', '06:00:00', '2025-10-17 06:12:26', '2025-10-17 06:12:26'),
(754, 21, 25, 'Arusha', 'Dar es Salaam', '2025-10-20', '21:00:00', '06:00:00', '2025-10-17 06:12:26', '2025-10-17 06:12:26'),
(755, 21, 25, 'Dar es Salaam', 'Arusha', '2025-10-21', '21:00:00', '06:00:00', '2025-10-17 06:12:26', '2025-10-17 06:12:26'),
(756, 21, 25, 'Arusha', 'Dar es Salaam', '2025-10-22', '21:00:00', '06:00:00', '2025-10-17 06:12:26', '2025-10-17 06:12:26'),
(757, 21, 25, 'Dar es Salaam', 'Arusha', '2025-10-23', '21:00:00', '06:00:00', '2025-10-17 06:12:26', '2025-10-17 06:12:26'),
(758, 21, 25, 'Arusha', 'Dar es Salaam', '2025-10-24', '21:00:00', '06:00:00', '2025-10-17 06:12:26', '2025-10-17 06:12:26'),
(759, 21, 25, 'Dar es Salaam', 'Arusha', '2025-10-25', '21:00:00', '06:00:00', '2025-10-17 06:12:26', '2025-10-17 06:12:26'),
(760, 21, 25, 'Arusha', 'Dar es Salaam', '2025-10-26', '21:00:00', '06:00:00', '2025-10-17 06:12:26', '2025-10-17 06:12:26'),
(761, 21, 25, 'Dar es Salaam', 'Arusha', '2025-10-27', '21:00:00', '06:00:00', '2025-10-17 06:12:26', '2025-10-17 06:12:26'),
(762, 21, 25, 'Arusha', 'Dar es Salaam', '2025-10-28', '21:00:00', '06:00:00', '2025-10-17 06:12:26', '2025-10-17 06:12:26'),
(763, 18, 22, 'Arusha', 'Dar es Salaam', '2025-10-17', '21:00:00', '06:00:00', '2025-10-17 06:19:42', '2025-10-17 06:19:42'),
(764, 18, 22, 'Dar es Salaam', 'Arusha', '2025-10-18', '21:00:00', '06:00:00', '2025-10-17 06:19:42', '2025-10-17 06:19:42'),
(765, 18, 22, 'Arusha', 'Dar es Salaam', '2025-10-19', '21:00:00', '06:00:00', '2025-10-17 06:19:42', '2025-10-17 06:19:42'),
(766, 18, 22, 'Dar es Salaam', 'Arusha', '2025-10-20', '21:00:00', '06:00:00', '2025-10-17 06:19:42', '2025-10-17 06:19:42'),
(767, 18, 22, 'Arusha', 'Dar es Salaam', '2025-10-21', '21:00:00', '06:00:00', '2025-10-17 06:19:43', '2025-10-17 06:19:43'),
(768, 18, 22, 'Dar es Salaam', 'Arusha', '2025-10-22', '21:00:00', '06:00:00', '2025-10-17 06:19:43', '2025-10-17 06:19:43'),
(769, 18, 22, 'Arusha', 'Dar es Salaam', '2025-10-23', '21:00:00', '06:00:00', '2025-10-17 06:19:43', '2025-10-17 06:19:43'),
(770, 18, 22, 'Dar es Salaam', 'Arusha', '2025-10-24', '21:00:00', '06:00:00', '2025-10-17 06:19:43', '2025-10-17 06:19:43'),
(771, 18, 22, 'Arusha', 'Dar es Salaam', '2025-10-25', '21:00:00', '06:00:00', '2025-10-17 06:19:43', '2025-10-17 06:19:43'),
(772, 18, 22, 'Dar es Salaam', 'Arusha', '2025-10-26', '21:00:00', '06:00:00', '2025-10-17 06:19:43', '2025-10-17 06:19:43'),
(773, 18, 22, 'Arusha', 'Dar es Salaam', '2025-10-27', '21:00:00', '06:00:00', '2025-10-17 06:19:43', '2025-10-17 06:19:43'),
(774, 18, 22, 'Dar es Salaam', 'Arusha', '2025-10-28', '21:00:00', '06:00:00', '2025-10-17 06:19:43', '2025-10-17 06:19:43'),
(775, 18, 22, 'Arusha', 'Dar es Salaam', '2025-10-29', '21:00:00', '06:00:00', '2025-10-17 06:19:43', '2025-10-17 06:19:43'),
(776, 18, 22, 'Dar es Salaam', 'Arusha', '2025-10-30', '21:00:00', '06:00:00', '2025-10-17 06:19:43', '2025-10-17 06:19:43'),
(891, 30, 34, 'Dodoma', 'Mwanza', '2025-11-04', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(890, 30, 34, 'Mwanza', 'Dodoma', '2025-11-03', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(889, 30, 34, 'Dodoma', 'Mwanza', '2025-11-02', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(888, 30, 34, 'Mwanza', 'Dodoma', '2025-11-01', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(887, 30, 34, 'Dodoma', 'Mwanza', '2025-10-31', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(886, 30, 34, 'Mwanza', 'Dodoma', '2025-10-30', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(791, 21, 25, 'Dar es Salaam', 'Arusha', '2025-10-29', '21:00:00', '06:00:00', '2025-10-22 13:40:51', '2025-10-22 13:40:51'),
(792, 21, 25, 'Arusha', 'Dar es Salaam', '2025-10-30', '21:00:00', '06:00:00', '2025-10-22 13:40:51', '2025-10-22 13:40:51'),
(793, 21, 25, 'Dar es Salaam', 'Arusha', '2025-10-31', '21:00:00', '06:00:00', '2025-10-22 13:40:51', '2025-10-22 13:40:51'),
(794, 21, 25, 'Arusha', 'Dar es Salaam', '2025-11-01', '21:00:00', '06:00:00', '2025-10-22 13:40:51', '2025-10-22 13:40:51'),
(795, 21, 25, 'Dar es Salaam', 'Arusha', '2025-11-02', '21:00:00', '06:00:00', '2025-10-22 13:40:51', '2025-10-22 13:40:51'),
(796, 21, 25, 'Arusha', 'Dar es Salaam', '2025-11-03', '21:00:00', '06:00:00', '2025-10-22 13:40:51', '2025-10-22 13:40:51'),
(797, 21, 25, 'Dar es Salaam', 'Arusha', '2025-11-04', '21:00:00', '06:00:00', '2025-10-22 13:40:51', '2025-10-22 13:40:51'),
(798, 21, 25, 'Arusha', 'Dar es Salaam', '2025-11-05', '21:00:00', '06:00:00', '2025-10-22 13:40:51', '2025-10-22 13:40:51'),
(799, 21, 25, 'Dar es Salaam', 'Arusha', '2025-11-06', '21:00:00', '06:00:00', '2025-10-22 13:40:51', '2025-10-22 13:40:51'),
(800, 21, 25, 'Arusha', 'Dar es Salaam', '2025-11-07', '21:00:00', '06:00:00', '2025-10-22 13:40:51', '2025-10-22 13:40:51'),
(801, 21, 25, 'Dar es Salaam', 'Arusha', '2025-11-08', '21:00:00', '06:00:00', '2025-10-22 13:40:51', '2025-10-22 13:40:51'),
(802, 21, 25, 'Arusha', 'Dar es Salaam', '2025-11-09', '21:00:00', '06:00:00', '2025-10-22 13:40:51', '2025-10-22 13:40:51'),
(803, 21, 25, 'Dar es Salaam', 'Arusha', '2025-11-10', '21:00:00', '06:00:00', '2025-10-22 13:40:51', '2025-10-22 13:40:51'),
(804, 21, 25, 'Arusha', 'Dar es Salaam', '2025-11-11', '21:00:00', '06:00:00', '2025-10-22 13:40:51', '2025-10-22 13:40:51'),
(805, 21, 25, 'Dar es Salaam', 'Arusha', '2025-11-12', '21:00:00', '06:00:00', '2025-10-22 13:40:51', '2025-10-22 13:40:51'),
(806, 18, 22, 'Arusha', 'Dar es Salaam', '2025-10-31', '21:00:00', '06:00:00', '2025-10-22 13:42:15', '2025-10-22 13:42:15'),
(807, 18, 22, 'Dar es Salaam', 'Arusha', '2025-11-01', '21:00:00', '06:00:00', '2025-10-22 13:42:15', '2025-10-22 13:42:15'),
(808, 18, 22, 'Arusha', 'Dar es Salaam', '2025-11-02', '21:00:00', '06:00:00', '2025-10-22 13:42:15', '2025-10-22 13:42:15'),
(809, 18, 22, 'Dar es Salaam', 'Arusha', '2025-11-03', '21:00:00', '06:00:00', '2025-10-22 13:42:15', '2025-10-22 13:42:15'),
(810, 18, 22, 'Arusha', 'Dar es Salaam', '2025-11-04', '21:00:00', '06:00:00', '2025-10-22 13:42:15', '2025-10-22 13:42:15'),
(811, 18, 22, 'Dar es Salaam', 'Arusha', '2025-11-05', '21:00:00', '06:00:00', '2025-10-22 13:42:15', '2025-10-22 13:42:15'),
(812, 18, 22, 'Arusha', 'Dar es Salaam', '2025-11-06', '21:00:00', '06:00:00', '2025-10-22 13:42:15', '2025-10-22 13:42:15'),
(813, 18, 22, 'Dar es Salaam', 'Arusha', '2025-11-07', '21:00:00', '06:00:00', '2025-10-22 13:42:15', '2025-10-22 13:42:15'),
(814, 18, 22, 'Arusha', 'Dar es Salaam', '2025-11-08', '21:00:00', '06:00:00', '2025-10-22 13:42:15', '2025-10-22 13:42:15'),
(815, 18, 22, 'Dar es Salaam', 'Arusha', '2025-11-09', '21:00:00', '06:00:00', '2025-10-22 13:42:15', '2025-10-22 13:42:15'),
(816, 18, 22, 'Arusha', 'Dar es Salaam', '2025-11-10', '21:00:00', '06:00:00', '2025-10-22 13:42:15', '2025-10-22 13:42:15'),
(817, 18, 22, 'Dar es Salaam', 'Arusha', '2025-11-11', '21:00:00', '06:00:00', '2025-10-22 13:42:15', '2025-10-22 13:42:15'),
(818, 18, 22, 'Arusha', 'Dar es Salaam', '2025-11-12', '21:00:00', '06:00:00', '2025-10-22 13:42:15', '2025-10-22 13:42:15'),
(819, 18, 22, 'Dar es Salaam', 'Arusha', '2025-11-13', '21:00:00', '06:00:00', '2025-10-22 13:42:15', '2025-10-22 13:42:15'),
(820, 18, 22, 'Arusha', 'Dar es Salaam', '2025-11-14', '21:00:00', '06:00:00', '2025-10-22 13:42:15', '2025-10-22 13:42:15'),
(885, 30, 34, 'Dodoma', 'Mwanza', '2025-10-29', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(884, 30, 34, 'Mwanza', 'Dodoma', '2025-10-28', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(836, 30, 34, 'Dodoma', 'Mwanza', '2025-10-23', '22:00:00', '06:00:00', '2025-10-23 14:39:54', '2025-10-23 14:39:54'),
(838, 30, 34, 'Dodoma', 'Mwanza', '2025-10-25', '22:00:00', '06:00:00', '2025-10-23 14:39:54', '2025-10-23 14:39:54'),
(900, 30, 34, 'Mwanza', 'Dodoma', '2025-11-13', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(899, 30, 34, 'Dodoma', 'Mwanza', '2025-11-12', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(897, 30, 34, 'Dodoma', 'Mwanza', '2025-11-10', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(896, 30, 34, 'Mwanza', 'Dodoma', '2025-11-09', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(895, 30, 34, 'Dodoma', 'Mwanza', '2025-11-08', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(894, 30, 34, 'Mwanza', 'Dodoma', '2025-11-07', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(893, 30, 34, 'Dodoma', 'Mwanza', '2025-11-06', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(892, 30, 34, 'Mwanza', 'Dodoma', '2025-11-05', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(857, 30, 34, 'Mwanza', 'Dodoma', '2025-10-23', '22:00:00', '06:00:00', '2025-10-23 15:00:54', '2025-10-23 15:00:54'),
(858, 30, 34, 'Dodoma', 'Mwanza', '2025-10-24', '22:00:00', '06:00:00', '2025-10-23 15:00:54', '2025-10-23 15:00:54'),
(859, 30, 34, 'Mwanza', 'Dodoma', '2025-10-25', '22:00:00', '06:00:00', '2025-10-23 15:00:54', '2025-10-23 15:00:54'),
(903, 29, 33, 'Manyara', 'Arusha', '2025-10-29', '16:00:00', '18:00:00', '2025-10-28 14:30:20', '2025-10-28 14:30:20'),
(902, 29, 33, 'Arusha', 'Manyara', '2025-10-29', '13:00:00', '15:00:00', '2025-10-28 14:30:20', '2025-10-28 14:30:20'),
(901, 30, 34, 'Dodoma', 'Mwanza', '2025-11-14', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(898, 30, 34, 'Mwanza', 'Dodoma', '2025-11-11', '22:00:00', '07:00:00', '2025-10-28 13:46:18', '2025-10-28 13:46:18'),
(904, 21, 25, 'Dar es Salaam', 'Arusha', '2025-12-13', '22:00:00', '06:00:00', '2025-12-13 20:26:28', '2025-12-13 20:26:28'),
(905, 21, 25, 'Arusha', 'Dar es Salaam', '2025-12-14', '22:00:00', '06:00:00', '2025-12-13 20:26:28', '2025-12-13 20:26:28'),
(906, 21, 25, 'Dar es Salaam', 'Arusha', '2025-12-15', '22:00:00', '06:00:00', '2025-12-13 20:26:28', '2025-12-13 20:26:28'),
(907, 21, 25, 'Arusha', 'Dar es Salaam', '2025-12-16', '22:00:00', '06:00:00', '2025-12-13 20:26:28', '2025-12-13 20:26:28'),
(908, 21, 25, 'Dar es Salaam', 'Arusha', '2025-12-17', '22:00:00', '06:00:00', '2025-12-13 20:26:28', '2025-12-13 20:26:28'),
(909, 21, 25, 'Arusha', 'Dar es Salaam', '2025-12-18', '22:00:00', '06:00:00', '2025-12-13 20:26:28', '2025-12-13 20:26:28'),
(910, 21, 25, 'Dar es Salaam', 'Arusha', '2025-12-19', '22:00:00', '06:00:00', '2025-12-13 20:26:28', '2025-12-13 20:26:28'),
(911, 21, 25, 'Arusha', 'Dar es Salaam', '2025-12-20', '22:00:00', '06:00:00', '2025-12-13 20:26:28', '2025-12-13 20:26:28'),
(912, 21, 25, 'Dar es Salaam', 'Arusha', '2025-12-21', '22:00:00', '06:00:00', '2025-12-13 20:26:28', '2025-12-13 20:26:28'),
(913, 21, 25, 'Arusha', 'Dar es Salaam', '2025-12-22', '22:00:00', '06:00:00', '2025-12-13 20:26:28', '2025-12-13 20:26:28'),
(914, 21, 25, 'Dar es Salaam', 'Arusha', '2025-12-23', '22:00:00', '06:00:00', '2025-12-13 20:26:28', '2025-12-13 20:26:28'),
(915, 21, 25, 'Arusha', 'Dar es Salaam', '2025-12-24', '22:00:00', '06:00:00', '2025-12-13 20:26:28', '2025-12-13 20:26:28'),
(916, 21, 25, 'Dar es Salaam', 'Arusha', '2025-12-25', '22:00:00', '06:00:00', '2025-12-13 20:26:28', '2025-12-13 20:26:28'),
(917, 21, 25, 'Arusha', 'Dar es Salaam', '2025-12-26', '22:00:00', '06:00:00', '2025-12-13 20:26:28', '2025-12-13 20:26:28'),
(918, 18, 22, 'Arusha', 'Dar es Salaam', '2025-12-13', '22:00:00', '06:00:00', '2025-12-13 20:28:17', '2025-12-13 20:28:17'),
(919, 18, 22, 'Dar es Salaam', 'Arusha', '2025-12-14', '22:00:00', '06:00:00', '2025-12-13 20:28:17', '2025-12-13 20:28:17'),
(920, 18, 22, 'Arusha', 'Dar es Salaam', '2025-12-15', '22:00:00', '06:00:00', '2025-12-13 20:28:17', '2025-12-13 20:28:17'),
(921, 18, 22, 'Dar es Salaam', 'Arusha', '2025-12-16', '22:00:00', '06:00:00', '2025-12-13 20:28:17', '2025-12-13 20:28:17'),
(922, 18, 22, 'Arusha', 'Dar es Salaam', '2025-12-17', '22:00:00', '06:00:00', '2025-12-13 20:28:17', '2025-12-13 20:28:17'),
(923, 18, 22, 'Dar es Salaam', 'Arusha', '2025-12-18', '22:00:00', '06:00:00', '2025-12-13 20:28:17', '2025-12-13 20:28:17'),
(924, 18, 22, 'Arusha', 'Dar es Salaam', '2025-12-19', '22:00:00', '06:00:00', '2025-12-13 20:28:17', '2025-12-13 20:28:17'),
(925, 18, 22, 'Dar es Salaam', 'Arusha', '2025-12-20', '22:00:00', '06:00:00', '2025-12-13 20:28:17', '2025-12-13 20:28:17'),
(926, 18, 22, 'Arusha', 'Dar es Salaam', '2025-12-21', '22:00:00', '06:00:00', '2025-12-13 20:28:17', '2025-12-13 20:28:17'),
(927, 18, 22, 'Dar es Salaam', 'Arusha', '2025-12-22', '22:00:00', '06:00:00', '2025-12-13 20:28:17', '2025-12-13 20:28:17'),
(928, 18, 22, 'Arusha', 'Dar es Salaam', '2025-12-23', '22:00:00', '06:00:00', '2025-12-13 20:28:17', '2025-12-13 20:28:17'),
(929, 18, 22, 'Dar es Salaam', 'Arusha', '2025-12-24', '22:00:00', '06:00:00', '2025-12-13 20:28:17', '2025-12-13 20:28:17'),
(930, 18, 22, 'Arusha', 'Dar es Salaam', '2025-12-25', '22:00:00', '06:00:00', '2025-12-13 20:28:17', '2025-12-13 20:28:17'),
(931, 18, 22, 'Dar es Salaam', 'Arusha', '2025-12-26', '22:00:00', '06:00:00', '2025-12-13 20:28:17', '2025-12-13 20:28:17'),
(946, 30, 34, 'Mwanza', 'Dodoma', '2025-12-13', '20:30:00', '04:25:00', '2025-12-13 20:36:30', '2025-12-13 20:36:30'),
(947, 30, 34, 'Dodoma', 'Mwanza', '2025-12-14', '20:30:00', '04:25:00', '2025-12-13 20:36:30', '2025-12-13 20:36:30'),
(948, 30, 34, 'Mwanza', 'Dodoma', '2025-12-15', '20:30:00', '04:25:00', '2025-12-13 20:36:30', '2025-12-13 20:36:30'),
(949, 30, 34, 'Dodoma', 'Mwanza', '2025-12-16', '20:30:00', '04:25:00', '2025-12-13 20:36:30', '2025-12-13 20:36:30'),
(950, 30, 34, 'Mwanza', 'Dodoma', '2025-12-17', '20:30:00', '04:25:00', '2025-12-13 20:36:30', '2025-12-13 20:36:30'),
(951, 30, 34, 'Dodoma', 'Mwanza', '2025-12-18', '20:30:00', '04:25:00', '2025-12-13 20:36:30', '2025-12-13 20:36:30'),
(952, 30, 34, 'Mwanza', 'Dodoma', '2025-12-19', '20:30:00', '04:25:00', '2025-12-13 20:36:30', '2025-12-13 20:36:30'),
(953, 30, 34, 'Dodoma', 'Mwanza', '2025-12-20', '20:30:00', '04:25:00', '2025-12-13 20:36:30', '2025-12-13 20:36:30'),
(954, 30, 34, 'Mwanza', 'Dodoma', '2025-12-21', '20:30:00', '04:25:00', '2025-12-13 20:36:30', '2025-12-13 20:36:30'),
(955, 30, 34, 'Dodoma', 'Mwanza', '2025-12-22', '20:30:00', '04:25:00', '2025-12-13 20:36:30', '2025-12-13 20:36:30'),
(956, 30, 34, 'Mwanza', 'Dodoma', '2025-12-23', '20:30:00', '04:25:00', '2025-12-13 20:36:30', '2025-12-13 20:36:30'),
(957, 30, 34, 'Dodoma', 'Mwanza', '2025-12-24', '20:30:00', '04:25:00', '2025-12-13 20:36:30', '2025-12-13 20:36:30'),
(958, 30, 34, 'Mwanza', 'Dodoma', '2025-12-25', '20:30:00', '04:25:00', '2025-12-13 20:36:30', '2025-12-13 20:36:30'),
(959, 30, 34, 'Dodoma', 'Mwanza', '2025-12-26', '20:30:00', '04:25:00', '2025-12-13 20:36:30', '2025-12-13 20:36:30'),
(960, 33, 37, 'Dar es Salaam', 'Iringa', '2025-12-13', '23:00:00', '07:00:00', '2025-12-13 22:15:47', '2025-12-13 22:15:47'),
(961, 33, 37, 'Iringa', 'Dar es Salaam', '2025-12-14', '23:00:00', '07:00:00', '2025-12-13 22:15:47', '2025-12-13 22:15:47'),
(962, 33, 37, 'Dar es Salaam', 'Iringa', '2025-12-15', '23:00:00', '07:00:00', '2025-12-13 22:15:47', '2025-12-13 22:15:47'),
(963, 33, 37, 'Iringa', 'Dar es Salaam', '2025-12-16', '23:00:00', '07:00:00', '2025-12-13 22:15:47', '2025-12-13 22:15:47'),
(964, 33, 37, 'Dar es Salaam', 'Iringa', '2025-12-17', '23:00:00', '07:00:00', '2025-12-13 22:15:47', '2025-12-13 22:15:47'),
(965, 33, 37, 'Iringa', 'Dar es Salaam', '2025-12-18', '23:00:00', '07:00:00', '2025-12-13 22:15:47', '2025-12-13 22:15:47'),
(966, 33, 37, 'Dar es Salaam', 'Iringa', '2025-12-19', '23:00:00', '07:00:00', '2025-12-13 22:15:47', '2025-12-13 22:15:47'),
(967, 33, 37, 'Iringa', 'Dar es Salaam', '2025-12-20', '23:00:00', '07:00:00', '2025-12-13 22:15:47', '2025-12-13 22:15:47'),
(968, 33, 37, 'Dar es Salaam', 'Iringa', '2025-12-21', '23:00:00', '07:00:00', '2025-12-13 22:15:47', '2025-12-13 22:15:47'),
(969, 33, 37, 'Iringa', 'Dar es Salaam', '2025-12-22', '23:00:00', '07:00:00', '2025-12-13 22:15:47', '2025-12-13 22:15:47'),
(970, 33, 37, 'Dar es Salaam', 'Iringa', '2025-12-23', '23:00:00', '07:00:00', '2025-12-13 22:15:47', '2025-12-13 22:15:47'),
(971, 33, 37, 'Iringa', 'Dar es Salaam', '2025-12-24', '23:00:00', '07:00:00', '2025-12-13 22:15:47', '2025-12-13 22:15:47'),
(972, 33, 37, 'Dar es Salaam', 'Iringa', '2025-12-25', '23:00:00', '07:00:00', '2025-12-13 22:15:47', '2025-12-13 22:15:47'),
(973, 33, 37, 'Iringa', 'Dar es Salaam', '2025-12-26', '23:00:00', '07:00:00', '2025-12-13 22:15:47', '2025-12-13 22:15:47'),
(974, 34, 38, 'Iringa', 'Dar es Salaam', '2025-12-13', '23:00:00', '07:00:00', '2025-12-13 22:17:49', '2025-12-13 22:17:49'),
(975, 34, 38, 'Dar es Salaam', 'Iringa', '2025-12-14', '23:00:00', '07:00:00', '2025-12-13 22:17:49', '2025-12-13 22:17:49'),
(976, 34, 38, 'Iringa', 'Dar es Salaam', '2025-12-15', '23:00:00', '07:00:00', '2025-12-13 22:17:49', '2025-12-13 22:17:49'),
(977, 34, 38, 'Dar es Salaam', 'Iringa', '2025-12-16', '23:00:00', '07:00:00', '2025-12-13 22:17:49', '2025-12-13 22:17:49'),
(978, 34, 38, 'Iringa', 'Dar es Salaam', '2025-12-17', '23:00:00', '07:00:00', '2025-12-13 22:17:49', '2025-12-13 22:17:49'),
(979, 34, 38, 'Dar es Salaam', 'Iringa', '2025-12-18', '23:00:00', '07:00:00', '2025-12-13 22:17:49', '2025-12-13 22:17:49'),
(980, 34, 38, 'Iringa', 'Dar es Salaam', '2025-12-19', '23:00:00', '07:00:00', '2025-12-13 22:17:49', '2025-12-13 22:17:49'),
(981, 34, 38, 'Dar es Salaam', 'Iringa', '2025-12-20', '23:00:00', '07:00:00', '2025-12-13 22:17:49', '2025-12-13 22:17:49'),
(982, 34, 38, 'Iringa', 'Dar es Salaam', '2025-12-21', '23:00:00', '07:00:00', '2025-12-13 22:17:49', '2025-12-13 22:17:49'),
(983, 34, 38, 'Dar es Salaam', 'Iringa', '2025-12-22', '23:00:00', '07:00:00', '2025-12-13 22:17:49', '2025-12-13 22:17:49'),
(984, 34, 38, 'Iringa', 'Dar es Salaam', '2025-12-23', '23:00:00', '07:00:00', '2025-12-13 22:17:49', '2025-12-13 22:17:49'),
(985, 34, 38, 'Dar es Salaam', 'Iringa', '2025-12-24', '23:00:00', '07:00:00', '2025-12-13 22:17:49', '2025-12-13 22:17:49'),
(986, 34, 38, 'Iringa', 'Dar es Salaam', '2025-12-25', '23:00:00', '07:00:00', '2025-12-13 22:17:49', '2025-12-13 22:17:49'),
(987, 34, 38, 'Dar es Salaam', 'Iringa', '2025-12-26', '23:00:00', '07:00:00', '2025-12-13 22:17:49', '2025-12-13 22:17:49'),
(988, 35, 39, 'Ifakara', 'Dar es Salaam', '2025-12-13', '21:00:00', '05:30:00', '2025-12-13 22:19:52', '2025-12-13 22:19:52'),
(989, 35, 39, 'Dar es Salaam', 'Ifakara', '2025-12-14', '21:00:00', '05:30:00', '2025-12-13 22:19:52', '2025-12-13 22:19:52'),
(990, 35, 39, 'Ifakara', 'Dar es Salaam', '2025-12-15', '21:00:00', '05:30:00', '2025-12-13 22:19:52', '2025-12-13 22:19:52'),
(991, 35, 39, 'Dar es Salaam', 'Ifakara', '2025-12-16', '21:00:00', '05:30:00', '2025-12-13 22:19:52', '2025-12-13 22:19:52'),
(992, 35, 39, 'Ifakara', 'Dar es Salaam', '2025-12-17', '21:00:00', '05:30:00', '2025-12-13 22:19:52', '2025-12-13 22:19:52'),
(993, 35, 39, 'Dar es Salaam', 'Ifakara', '2025-12-18', '21:00:00', '05:30:00', '2025-12-13 22:19:52', '2025-12-13 22:19:52'),
(994, 35, 39, 'Ifakara', 'Dar es Salaam', '2025-12-19', '21:00:00', '05:30:00', '2025-12-13 22:19:52', '2025-12-13 22:19:52'),
(995, 35, 39, 'Dar es Salaam', 'Ifakara', '2025-12-20', '21:00:00', '05:30:00', '2025-12-13 22:19:52', '2025-12-13 22:19:52'),
(996, 35, 39, 'Ifakara', 'Dar es Salaam', '2025-12-21', '21:00:00', '05:30:00', '2025-12-13 22:19:52', '2025-12-13 22:19:52'),
(997, 35, 39, 'Dar es Salaam', 'Ifakara', '2025-12-22', '21:00:00', '05:30:00', '2025-12-13 22:19:52', '2025-12-13 22:19:52'),
(998, 35, 39, 'Ifakara', 'Dar es Salaam', '2025-12-23', '21:00:00', '05:30:00', '2025-12-13 22:19:52', '2025-12-13 22:19:52'),
(999, 35, 39, 'Dar es Salaam', 'Ifakara', '2025-12-24', '21:00:00', '05:30:00', '2025-12-13 22:19:52', '2025-12-13 22:19:52'),
(1000, 35, 39, 'Ifakara', 'Dar es Salaam', '2025-12-25', '21:00:00', '05:30:00', '2025-12-13 22:19:52', '2025-12-13 22:19:52'),
(1001, 35, 39, 'Dar es Salaam', 'Ifakara', '2025-12-26', '21:00:00', '05:30:00', '2025-12-13 22:19:52', '2025-12-13 22:19:52'),
(1002, 36, 40, 'Dar es Salaam', 'Ifakara', '2025-12-13', '21:00:00', '05:30:00', '2025-12-13 22:22:49', '2025-12-13 22:22:49'),
(1003, 36, 40, 'Ifakara', 'Dar es Salaam', '2025-12-14', '21:00:00', '05:30:00', '2025-12-13 22:22:49', '2025-12-13 22:22:49'),
(1004, 36, 40, 'Dar es Salaam', 'Ifakara', '2025-12-15', '21:00:00', '05:30:00', '2025-12-13 22:22:49', '2025-12-13 22:22:49'),
(1005, 36, 40, 'Ifakara', 'Dar es Salaam', '2025-12-16', '21:00:00', '05:30:00', '2025-12-13 22:22:49', '2025-12-13 22:22:49'),
(1006, 36, 40, 'Dar es Salaam', 'Ifakara', '2025-12-17', '21:00:00', '05:30:00', '2025-12-13 22:22:49', '2025-12-13 22:22:49'),
(1007, 36, 40, 'Ifakara', 'Dar es Salaam', '2025-12-18', '21:00:00', '05:30:00', '2025-12-13 22:22:49', '2025-12-13 22:22:49'),
(1008, 36, 40, 'Dar es Salaam', 'Ifakara', '2025-12-19', '21:00:00', '05:30:00', '2025-12-13 22:22:49', '2025-12-13 22:22:49'),
(1009, 36, 40, 'Ifakara', 'Dar es Salaam', '2025-12-20', '21:00:00', '05:30:00', '2025-12-13 22:22:49', '2025-12-13 22:22:49'),
(1010, 36, 40, 'Dar es Salaam', 'Ifakara', '2025-12-21', '21:00:00', '05:30:00', '2025-12-13 22:22:49', '2025-12-13 22:22:49'),
(1011, 36, 40, 'Ifakara', 'Dar es Salaam', '2025-12-22', '21:00:00', '05:30:00', '2025-12-13 22:22:49', '2025-12-13 22:22:49'),
(1012, 36, 40, 'Dar es Salaam', 'Ifakara', '2025-12-23', '21:00:00', '05:30:00', '2025-12-13 22:22:49', '2025-12-13 22:22:49'),
(1013, 36, 40, 'Ifakara', 'Dar es Salaam', '2025-12-24', '21:00:00', '05:30:00', '2025-12-13 22:22:49', '2025-12-13 22:22:49'),
(1014, 36, 40, 'Dar es Salaam', 'Ifakara', '2025-12-25', '21:00:00', '05:30:00', '2025-12-13 22:22:49', '2025-12-13 22:22:49'),
(1015, 36, 40, 'Ifakara', 'Dar es Salaam', '2025-12-26', '21:00:00', '05:30:00', '2025-12-13 22:22:49', '2025-12-13 22:22:49'),
(1016, 38, 42, 'Dar es Salaam', 'Mwanza', '2025-12-13', '00:00:00', '10:00:00', '2025-12-13 22:25:47', '2025-12-13 22:25:47'),
(1017, 38, 42, 'Mwanza', 'Dar es Salaam', '2025-12-14', '00:00:00', '10:00:00', '2025-12-13 22:25:47', '2025-12-13 22:25:47'),
(1018, 38, 42, 'Dar es Salaam', 'Mwanza', '2025-12-15', '00:00:00', '10:00:00', '2025-12-13 22:25:47', '2025-12-13 22:25:47'),
(1019, 38, 42, 'Mwanza', 'Dar es Salaam', '2025-12-16', '00:00:00', '10:00:00', '2025-12-13 22:25:47', '2025-12-13 22:25:47'),
(1020, 38, 42, 'Dar es Salaam', 'Mwanza', '2025-12-17', '00:00:00', '10:00:00', '2025-12-13 22:25:47', '2025-12-13 22:25:47'),
(1021, 38, 42, 'Mwanza', 'Dar es Salaam', '2025-12-18', '00:00:00', '10:00:00', '2025-12-13 22:25:47', '2025-12-13 22:25:47'),
(1022, 38, 42, 'Dar es Salaam', 'Mwanza', '2025-12-19', '00:00:00', '10:00:00', '2025-12-13 22:25:47', '2025-12-13 22:25:47'),
(1023, 38, 42, 'Mwanza', 'Dar es Salaam', '2025-12-20', '00:00:00', '10:00:00', '2025-12-13 22:25:47', '2025-12-13 22:25:47'),
(1024, 38, 42, 'Dar es Salaam', 'Mwanza', '2025-12-21', '00:00:00', '10:00:00', '2025-12-13 22:25:47', '2025-12-13 22:25:47'),
(1025, 38, 42, 'Mwanza', 'Dar es Salaam', '2025-12-22', '00:00:00', '10:00:00', '2025-12-13 22:25:47', '2025-12-13 22:25:47'),
(1026, 38, 42, 'Dar es Salaam', 'Mwanza', '2025-12-23', '00:00:00', '10:00:00', '2025-12-13 22:25:47', '2025-12-13 22:25:47'),
(1027, 38, 42, 'Mwanza', 'Dar es Salaam', '2025-12-24', '00:00:00', '10:00:00', '2025-12-13 22:25:47', '2025-12-13 22:25:47'),
(1028, 38, 42, 'Dar es Salaam', 'Mwanza', '2025-12-25', '00:00:00', '10:00:00', '2025-12-13 22:25:47', '2025-12-13 22:25:47'),
(1029, 38, 42, 'Mwanza', 'Dar es Salaam', '2025-12-26', '00:00:00', '10:00:00', '2025-12-13 22:25:47', '2025-12-13 22:25:47'),
(1030, 39, 43, 'Dar es Salaam', 'Tanga', '2025-12-13', '23:00:00', '04:35:00', '2025-12-13 22:28:51', '2025-12-13 22:28:51'),
(1031, 39, 43, 'Tanga', 'Dar es Salaam', '2025-12-14', '23:00:00', '04:35:00', '2025-12-13 22:28:51', '2025-12-13 22:28:51'),
(1032, 39, 43, 'Dar es Salaam', 'Tanga', '2025-12-15', '23:00:00', '04:35:00', '2025-12-13 22:28:51', '2025-12-13 22:28:51'),
(1033, 39, 43, 'Tanga', 'Dar es Salaam', '2025-12-16', '23:00:00', '04:35:00', '2025-12-13 22:28:51', '2025-12-13 22:28:51'),
(1034, 39, 43, 'Dar es Salaam', 'Tanga', '2025-12-17', '23:00:00', '04:35:00', '2025-12-13 22:28:51', '2025-12-13 22:28:51'),
(1035, 39, 43, 'Tanga', 'Dar es Salaam', '2025-12-18', '23:00:00', '04:35:00', '2025-12-13 22:28:51', '2025-12-13 22:28:51'),
(1036, 39, 43, 'Dar es Salaam', 'Tanga', '2025-12-19', '23:00:00', '04:35:00', '2025-12-13 22:28:51', '2025-12-13 22:28:51'),
(1037, 39, 43, 'Tanga', 'Dar es Salaam', '2025-12-20', '23:00:00', '04:35:00', '2025-12-13 22:28:51', '2025-12-13 22:28:51'),
(1038, 39, 43, 'Dar es Salaam', 'Tanga', '2025-12-21', '23:00:00', '04:35:00', '2025-12-13 22:28:51', '2025-12-13 22:28:51'),
(1039, 39, 43, 'Tanga', 'Dar es Salaam', '2025-12-22', '23:00:00', '04:35:00', '2025-12-13 22:28:51', '2025-12-13 22:28:51'),
(1040, 39, 43, 'Dar es Salaam', 'Tanga', '2025-12-23', '23:00:00', '04:35:00', '2025-12-13 22:28:51', '2025-12-13 22:28:51'),
(1041, 39, 43, 'Tanga', 'Dar es Salaam', '2025-12-24', '23:00:00', '04:35:00', '2025-12-13 22:28:51', '2025-12-13 22:28:51'),
(1042, 39, 43, 'Dar es Salaam', 'Tanga', '2025-12-25', '23:00:00', '04:35:00', '2025-12-13 22:28:51', '2025-12-13 22:28:51'),
(1043, 39, 43, 'Tanga', 'Dar es Salaam', '2025-12-26', '23:00:00', '04:35:00', '2025-12-13 22:28:51', '2025-12-13 22:28:51'),
(1044, 21, 25, 'Dar es Salaam', 'Arusha', '2025-12-27', '22:00:00', '06:00:00', '2025-12-26 17:35:30', '2025-12-26 17:35:30'),
(1045, 21, 25, 'Arusha', 'Dar es Salaam', '2025-12-28', '22:00:00', '06:00:00', '2025-12-26 17:35:30', '2025-12-26 17:35:30'),
(1046, 21, 25, 'Dar es Salaam', 'Arusha', '2025-12-29', '22:00:00', '06:00:00', '2025-12-26 17:35:30', '2025-12-26 17:35:30'),
(1047, 21, 25, 'Arusha', 'Dar es Salaam', '2025-12-30', '22:00:00', '06:00:00', '2025-12-26 17:35:30', '2025-12-26 17:35:30'),
(1048, 21, 25, 'Dar es Salaam', 'Arusha', '2025-12-31', '22:00:00', '06:00:00', '2025-12-26 17:35:30', '2025-12-26 17:35:30'),
(1049, 21, 25, 'Arusha', 'Dar es Salaam', '2026-01-01', '22:00:00', '06:00:00', '2025-12-26 17:35:30', '2025-12-26 17:35:30'),
(1050, 21, 25, 'Dar es Salaam', 'Arusha', '2026-01-02', '22:00:00', '06:00:00', '2025-12-26 17:35:30', '2025-12-26 17:35:30'),
(1051, 21, 25, 'Arusha', 'Dar es Salaam', '2026-01-03', '22:00:00', '06:00:00', '2025-12-26 17:35:30', '2025-12-26 17:35:30'),
(1052, 21, 25, 'Dar es Salaam', 'Arusha', '2026-01-04', '22:00:00', '06:00:00', '2025-12-26 17:35:30', '2025-12-26 17:35:30'),
(1053, 21, 25, 'Arusha', 'Dar es Salaam', '2026-01-05', '22:00:00', '06:00:00', '2025-12-26 17:35:30', '2025-12-26 17:35:30'),
(1054, 21, 25, 'Dar es Salaam', 'Arusha', '2026-01-06', '22:00:00', '06:00:00', '2025-12-26 17:35:30', '2025-12-26 17:35:30'),
(1055, 21, 25, 'Arusha', 'Dar es Salaam', '2026-01-07', '22:00:00', '06:00:00', '2025-12-26 17:35:30', '2025-12-26 17:35:30'),
(1056, 21, 25, 'Dar es Salaam', 'Arusha', '2026-01-08', '22:00:00', '06:00:00', '2025-12-26 17:35:30', '2025-12-26 17:35:30'),
(1057, 18, 22, 'Arusha', 'Dar es Salaam', '2025-12-27', '22:00:00', '06:00:00', '2025-12-26 17:36:11', '2025-12-26 17:36:11'),
(1058, 18, 22, 'Dar es Salaam', 'Arusha', '2025-12-28', '22:00:00', '06:00:00', '2025-12-26 17:36:11', '2025-12-26 17:36:11'),
(1059, 18, 22, 'Arusha', 'Dar es Salaam', '2025-12-29', '22:00:00', '06:00:00', '2025-12-26 17:36:11', '2025-12-26 17:36:11'),
(1060, 18, 22, 'Dar es Salaam', 'Arusha', '2025-12-30', '22:00:00', '06:00:00', '2025-12-26 17:36:11', '2025-12-26 17:36:11'),
(1061, 18, 22, 'Arusha', 'Dar es Salaam', '2025-12-31', '22:00:00', '06:00:00', '2025-12-26 17:36:11', '2025-12-26 17:36:11'),
(1062, 18, 22, 'Dar es Salaam', 'Arusha', '2026-01-01', '22:00:00', '06:00:00', '2025-12-26 17:36:11', '2025-12-26 17:36:11'),
(1063, 18, 22, 'Arusha', 'Dar es Salaam', '2026-01-02', '22:00:00', '06:00:00', '2025-12-26 17:36:11', '2025-12-26 17:36:11'),
(1064, 18, 22, 'Dar es Salaam', 'Arusha', '2026-01-03', '22:00:00', '06:00:00', '2025-12-26 17:36:11', '2025-12-26 17:36:11'),
(1065, 18, 22, 'Arusha', 'Dar es Salaam', '2026-01-04', '22:00:00', '06:00:00', '2025-12-26 17:36:11', '2025-12-26 17:36:11'),
(1066, 18, 22, 'Dar es Salaam', 'Arusha', '2026-01-05', '22:00:00', '06:00:00', '2025-12-26 17:36:11', '2025-12-26 17:36:11'),
(1067, 18, 22, 'Arusha', 'Dar es Salaam', '2026-01-06', '22:00:00', '06:00:00', '2025-12-26 17:36:11', '2025-12-26 17:36:11'),
(1068, 18, 22, 'Dar es Salaam', 'Arusha', '2026-01-07', '22:00:00', '06:00:00', '2025-12-26 17:36:11', '2025-12-26 17:36:11'),
(1069, 18, 22, 'Arusha', 'Dar es Salaam', '2026-01-08', '22:00:00', '06:00:00', '2025-12-26 17:36:11', '2025-12-26 17:36:11'),
(1083, 30, 34, 'Mwanza', 'Dodoma', '2025-12-27', '20:30:00', '04:25:00', '2025-12-26 17:37:58', '2025-12-26 17:37:58'),
(1084, 30, 34, 'Dodoma', 'Mwanza', '2025-12-28', '20:30:00', '04:25:00', '2025-12-26 17:37:58', '2025-12-26 17:37:58'),
(1085, 30, 34, 'Mwanza', 'Dodoma', '2025-12-29', '20:30:00', '04:25:00', '2025-12-26 17:37:58', '2025-12-26 17:37:58'),
(1086, 30, 34, 'Dodoma', 'Mwanza', '2025-12-30', '20:30:00', '04:25:00', '2025-12-26 17:37:58', '2025-12-26 17:37:58'),
(1087, 30, 34, 'Mwanza', 'Dodoma', '2025-12-31', '20:30:00', '04:25:00', '2025-12-26 17:37:58', '2025-12-26 17:37:58'),
(1088, 30, 34, 'Dodoma', 'Mwanza', '2026-01-01', '20:30:00', '04:25:00', '2025-12-26 17:37:58', '2025-12-26 17:37:58'),
(1089, 30, 34, 'Mwanza', 'Dodoma', '2026-01-02', '20:30:00', '04:25:00', '2025-12-26 17:37:58', '2025-12-26 17:37:58'),
(1090, 30, 34, 'Dodoma', 'Mwanza', '2026-01-03', '20:30:00', '04:25:00', '2025-12-26 17:37:58', '2025-12-26 17:37:58'),
(1091, 30, 34, 'Mwanza', 'Dodoma', '2026-01-04', '20:30:00', '04:25:00', '2025-12-26 17:37:58', '2025-12-26 17:37:58'),
(1092, 30, 34, 'Dodoma', 'Mwanza', '2026-01-05', '20:30:00', '04:25:00', '2025-12-26 17:37:58', '2025-12-26 17:37:58'),
(1093, 30, 34, 'Mwanza', 'Dodoma', '2026-01-06', '20:30:00', '04:25:00', '2025-12-26 17:37:58', '2025-12-26 17:37:58'),
(1094, 30, 34, 'Dodoma', 'Mwanza', '2026-01-07', '20:30:00', '04:25:00', '2025-12-26 17:37:58', '2025-12-26 17:37:58'),
(1095, 30, 34, 'Mwanza', 'Dodoma', '2026-01-08', '20:30:00', '04:25:00', '2025-12-26 17:37:58', '2025-12-26 17:37:58'),
(1096, 33, 37, 'Dar es Salaam', 'Iringa', '2025-12-27', '23:00:00', '07:00:00', '2025-12-26 17:39:37', '2025-12-26 17:39:37'),
(1097, 33, 37, 'Iringa', 'Dar es Salaam', '2025-12-28', '23:00:00', '07:00:00', '2025-12-26 17:39:37', '2025-12-26 17:39:37'),
(1098, 33, 37, 'Dar es Salaam', 'Iringa', '2025-12-29', '23:00:00', '07:00:00', '2025-12-26 17:39:37', '2025-12-26 17:39:37'),
(1099, 33, 37, 'Iringa', 'Dar es Salaam', '2025-12-30', '23:00:00', '07:00:00', '2025-12-26 17:39:37', '2025-12-26 17:39:37'),
(1100, 33, 37, 'Dar es Salaam', 'Iringa', '2025-12-31', '23:00:00', '07:00:00', '2025-12-26 17:39:37', '2025-12-26 17:39:37'),
(1101, 33, 37, 'Iringa', 'Dar es Salaam', '2026-01-01', '23:00:00', '07:00:00', '2025-12-26 17:39:37', '2025-12-26 17:39:37'),
(1102, 33, 37, 'Dar es Salaam', 'Iringa', '2026-01-02', '23:00:00', '07:00:00', '2025-12-26 17:39:37', '2025-12-26 17:39:37'),
(1103, 33, 37, 'Iringa', 'Dar es Salaam', '2026-01-03', '23:00:00', '07:00:00', '2025-12-26 17:39:37', '2025-12-26 17:39:37'),
(1104, 33, 37, 'Dar es Salaam', 'Iringa', '2026-01-04', '23:00:00', '07:00:00', '2025-12-26 17:39:37', '2025-12-26 17:39:37'),
(1105, 33, 37, 'Iringa', 'Dar es Salaam', '2026-01-05', '23:00:00', '07:00:00', '2025-12-26 17:39:37', '2025-12-26 17:39:37'),
(1106, 33, 37, 'Dar es Salaam', 'Iringa', '2026-01-06', '23:00:00', '07:00:00', '2025-12-26 17:39:37', '2025-12-26 17:39:37'),
(1107, 33, 37, 'Iringa', 'Dar es Salaam', '2026-01-07', '23:00:00', '07:00:00', '2025-12-26 17:39:37', '2025-12-26 17:39:37'),
(1108, 33, 37, 'Dar es Salaam', 'Iringa', '2026-01-08', '23:00:00', '07:00:00', '2025-12-26 17:39:37', '2025-12-26 17:39:37'),
(1109, 34, 38, 'Iringa', 'Dar es Salaam', '2025-12-27', '23:00:00', '07:00:00', '2025-12-26 17:40:44', '2025-12-26 17:40:44'),
(1110, 34, 38, 'Dar es Salaam', 'Iringa', '2025-12-28', '23:00:00', '07:00:00', '2025-12-26 17:40:44', '2025-12-26 17:40:44'),
(1111, 34, 38, 'Iringa', 'Dar es Salaam', '2025-12-29', '23:00:00', '07:00:00', '2025-12-26 17:40:44', '2025-12-26 17:40:44'),
(1112, 34, 38, 'Dar es Salaam', 'Iringa', '2025-12-30', '23:00:00', '07:00:00', '2025-12-26 17:40:44', '2025-12-26 17:40:44'),
(1113, 34, 38, 'Iringa', 'Dar es Salaam', '2025-12-31', '23:00:00', '07:00:00', '2025-12-26 17:40:44', '2025-12-26 17:40:44'),
(1114, 34, 38, 'Dar es Salaam', 'Iringa', '2026-01-01', '23:00:00', '07:00:00', '2025-12-26 17:40:44', '2025-12-26 17:40:44'),
(1115, 34, 38, 'Iringa', 'Dar es Salaam', '2026-01-02', '23:00:00', '07:00:00', '2025-12-26 17:40:44', '2025-12-26 17:40:44'),
(1116, 34, 38, 'Dar es Salaam', 'Iringa', '2026-01-03', '23:00:00', '07:00:00', '2025-12-26 17:40:44', '2025-12-26 17:40:44'),
(1117, 34, 38, 'Iringa', 'Dar es Salaam', '2026-01-04', '23:00:00', '07:00:00', '2025-12-26 17:40:44', '2025-12-26 17:40:44'),
(1118, 34, 38, 'Dar es Salaam', 'Iringa', '2026-01-05', '23:00:00', '07:00:00', '2025-12-26 17:40:44', '2025-12-26 17:40:44'),
(1119, 34, 38, 'Iringa', 'Dar es Salaam', '2026-01-06', '23:00:00', '07:00:00', '2025-12-26 17:40:44', '2025-12-26 17:40:44'),
(1120, 34, 38, 'Dar es Salaam', 'Iringa', '2026-01-07', '23:00:00', '07:00:00', '2025-12-26 17:40:44', '2025-12-26 17:40:44'),
(1121, 34, 38, 'Iringa', 'Dar es Salaam', '2026-01-08', '23:00:00', '07:00:00', '2025-12-26 17:40:44', '2025-12-26 17:40:44'),
(1122, 35, 39, 'Ifakara', 'Dar es Salaam', '2025-12-27', '21:00:00', '05:30:00', '2025-12-26 17:41:46', '2025-12-26 17:41:46'),
(1123, 35, 39, 'Dar es Salaam', 'Ifakara', '2025-12-28', '21:00:00', '05:30:00', '2025-12-26 17:41:46', '2025-12-26 17:41:46'),
(1124, 35, 39, 'Ifakara', 'Dar es Salaam', '2025-12-29', '21:00:00', '05:30:00', '2025-12-26 17:41:46', '2025-12-26 17:41:46'),
(1125, 35, 39, 'Dar es Salaam', 'Ifakara', '2025-12-30', '21:00:00', '05:30:00', '2025-12-26 17:41:46', '2025-12-26 17:41:46'),
(1126, 35, 39, 'Ifakara', 'Dar es Salaam', '2025-12-31', '21:00:00', '05:30:00', '2025-12-26 17:41:46', '2025-12-26 17:41:46'),
(1127, 35, 39, 'Dar es Salaam', 'Ifakara', '2026-01-01', '21:00:00', '05:30:00', '2025-12-26 17:41:46', '2025-12-26 17:41:46'),
(1128, 35, 39, 'Ifakara', 'Dar es Salaam', '2026-01-02', '21:00:00', '05:30:00', '2025-12-26 17:41:46', '2025-12-26 17:41:46'),
(1129, 35, 39, 'Dar es Salaam', 'Ifakara', '2026-01-03', '21:00:00', '05:30:00', '2025-12-26 17:41:46', '2025-12-26 17:41:46'),
(1130, 35, 39, 'Ifakara', 'Dar es Salaam', '2026-01-04', '21:00:00', '05:30:00', '2025-12-26 17:41:46', '2025-12-26 17:41:46'),
(1131, 35, 39, 'Dar es Salaam', 'Ifakara', '2026-01-05', '21:00:00', '05:30:00', '2025-12-26 17:41:46', '2025-12-26 17:41:46'),
(1132, 35, 39, 'Ifakara', 'Dar es Salaam', '2026-01-06', '21:00:00', '05:30:00', '2025-12-26 17:41:46', '2025-12-26 17:41:46'),
(1133, 35, 39, 'Dar es Salaam', 'Ifakara', '2026-01-07', '21:00:00', '05:30:00', '2025-12-26 17:41:46', '2025-12-26 17:41:46'),
(1134, 35, 39, 'Ifakara', 'Dar es Salaam', '2026-01-08', '21:00:00', '05:30:00', '2025-12-26 17:41:46', '2025-12-26 17:41:46'),
(1135, 36, 40, 'Dar es Salaam', 'Ifakara', '2025-12-27', '21:00:00', '05:30:00', '2025-12-26 17:43:23', '2025-12-26 17:43:23'),
(1136, 36, 40, 'Ifakara', 'Dar es Salaam', '2025-12-28', '21:00:00', '05:30:00', '2025-12-26 17:43:23', '2025-12-26 17:43:23'),
(1137, 36, 40, 'Dar es Salaam', 'Ifakara', '2025-12-29', '21:00:00', '05:30:00', '2025-12-26 17:43:23', '2025-12-26 17:43:23'),
(1138, 36, 40, 'Ifakara', 'Dar es Salaam', '2025-12-30', '21:00:00', '05:30:00', '2025-12-26 17:43:23', '2025-12-26 17:43:23'),
(1139, 36, 40, 'Dar es Salaam', 'Ifakara', '2025-12-31', '21:00:00', '05:30:00', '2025-12-26 17:43:23', '2025-12-26 17:43:23'),
(1140, 36, 40, 'Ifakara', 'Dar es Salaam', '2026-01-01', '21:00:00', '05:30:00', '2025-12-26 17:43:23', '2025-12-26 17:43:23'),
(1141, 36, 40, 'Dar es Salaam', 'Ifakara', '2026-01-02', '21:00:00', '05:30:00', '2025-12-26 17:43:23', '2025-12-26 17:43:23'),
(1142, 36, 40, 'Ifakara', 'Dar es Salaam', '2026-01-03', '21:00:00', '05:30:00', '2025-12-26 17:43:23', '2025-12-26 17:43:23'),
(1143, 36, 40, 'Dar es Salaam', 'Ifakara', '2026-01-04', '21:00:00', '05:30:00', '2025-12-26 17:43:23', '2025-12-26 17:43:23'),
(1144, 36, 40, 'Ifakara', 'Dar es Salaam', '2026-01-05', '21:00:00', '05:30:00', '2025-12-26 17:43:23', '2025-12-26 17:43:23'),
(1145, 36, 40, 'Dar es Salaam', 'Ifakara', '2026-01-06', '21:00:00', '05:30:00', '2025-12-26 17:43:23', '2025-12-26 17:43:23'),
(1146, 36, 40, 'Ifakara', 'Dar es Salaam', '2026-01-07', '21:00:00', '05:30:00', '2025-12-26 17:43:23', '2025-12-26 17:43:23'),
(1147, 36, 40, 'Dar es Salaam', 'Ifakara', '2026-01-08', '21:00:00', '05:30:00', '2025-12-26 17:43:23', '2025-12-26 17:43:23'),
(1148, 38, 42, 'Dar es Salaam', 'Mwanza', '2025-12-27', '00:00:00', '10:00:00', '2025-12-26 17:44:33', '2025-12-26 17:44:33'),
(1149, 38, 42, 'Mwanza', 'Dar es Salaam', '2025-12-28', '00:00:00', '10:00:00', '2025-12-26 17:44:33', '2025-12-26 17:44:33'),
(1150, 38, 42, 'Dar es Salaam', 'Mwanza', '2025-12-29', '00:00:00', '10:00:00', '2025-12-26 17:44:33', '2025-12-26 17:44:33'),
(1151, 38, 42, 'Mwanza', 'Dar es Salaam', '2025-12-30', '00:00:00', '10:00:00', '2025-12-26 17:44:33', '2025-12-26 17:44:33'),
(1152, 38, 42, 'Dar es Salaam', 'Mwanza', '2025-12-31', '00:00:00', '10:00:00', '2025-12-26 17:44:33', '2025-12-26 17:44:33'),
(1153, 38, 42, 'Mwanza', 'Dar es Salaam', '2026-01-01', '00:00:00', '10:00:00', '2025-12-26 17:44:33', '2025-12-26 17:44:33'),
(1154, 38, 42, 'Dar es Salaam', 'Mwanza', '2026-01-02', '00:00:00', '10:00:00', '2025-12-26 17:44:33', '2025-12-26 17:44:33'),
(1155, 38, 42, 'Mwanza', 'Dar es Salaam', '2026-01-03', '00:00:00', '10:00:00', '2025-12-26 17:44:33', '2025-12-26 17:44:33'),
(1156, 38, 42, 'Dar es Salaam', 'Mwanza', '2026-01-04', '00:00:00', '10:00:00', '2025-12-26 17:44:33', '2025-12-26 17:44:33'),
(1157, 38, 42, 'Mwanza', 'Dar es Salaam', '2026-01-05', '00:00:00', '10:00:00', '2025-12-26 17:44:33', '2025-12-26 17:44:33'),
(1158, 38, 42, 'Dar es Salaam', 'Mwanza', '2026-01-06', '00:00:00', '10:00:00', '2025-12-26 17:44:33', '2025-12-26 17:44:33'),
(1159, 38, 42, 'Mwanza', 'Dar es Salaam', '2026-01-07', '00:00:00', '10:00:00', '2025-12-26 17:44:33', '2025-12-26 17:44:33'),
(1160, 38, 42, 'Dar es Salaam', 'Mwanza', '2026-01-08', '00:00:00', '10:00:00', '2025-12-26 17:44:33', '2025-12-26 17:44:33'),
(1161, 39, 43, 'Dar es Salaam', 'Tanga', '2025-12-27', '23:00:00', '04:35:00', '2025-12-26 17:45:32', '2025-12-26 17:45:32'),
(1162, 39, 43, 'Tanga', 'Dar es Salaam', '2025-12-28', '23:00:00', '04:35:00', '2025-12-26 17:45:32', '2025-12-26 17:45:32'),
(1163, 39, 43, 'Dar es Salaam', 'Tanga', '2025-12-29', '23:00:00', '04:35:00', '2025-12-26 17:45:32', '2025-12-26 17:45:32'),
(1164, 39, 43, 'Tanga', 'Dar es Salaam', '2025-12-30', '23:00:00', '04:35:00', '2025-12-26 17:45:32', '2025-12-26 17:45:32'),
(1165, 39, 43, 'Dar es Salaam', 'Tanga', '2025-12-31', '23:00:00', '04:35:00', '2025-12-26 17:45:32', '2025-12-26 17:45:32'),
(1166, 39, 43, 'Tanga', 'Dar es Salaam', '2026-01-01', '23:00:00', '04:35:00', '2025-12-26 17:45:32', '2025-12-26 17:45:32'),
(1167, 39, 43, 'Dar es Salaam', 'Tanga', '2026-01-02', '23:00:00', '04:35:00', '2025-12-26 17:45:32', '2025-12-26 17:45:32'),
(1168, 39, 43, 'Tanga', 'Dar es Salaam', '2026-01-03', '23:00:00', '04:35:00', '2025-12-26 17:45:32', '2025-12-26 17:45:32'),
(1169, 39, 43, 'Dar es Salaam', 'Tanga', '2026-01-04', '23:00:00', '04:35:00', '2025-12-26 17:45:32', '2025-12-26 17:45:32'),
(1170, 39, 43, 'Tanga', 'Dar es Salaam', '2026-01-05', '23:00:00', '04:35:00', '2025-12-26 17:45:32', '2025-12-26 17:45:32'),
(1171, 39, 43, 'Dar es Salaam', 'Tanga', '2026-01-06', '23:00:00', '04:35:00', '2025-12-26 17:45:32', '2025-12-26 17:45:32'),
(1172, 39, 43, 'Tanga', 'Dar es Salaam', '2026-01-07', '23:00:00', '04:35:00', '2025-12-26 17:45:32', '2025-12-26 17:45:32'),
(1173, 39, 43, 'Dar es Salaam', 'Tanga', '2026-01-08', '23:00:00', '04:35:00', '2025-12-26 17:45:32', '2025-12-26 17:45:32'),
(1174, 21, 25, 'Dar es Salaam', 'Arusha', '2026-01-24', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1175, 21, 25, 'Arusha', 'Dar es Salaam', '2026-01-25', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1176, 21, 25, 'Dar es Salaam', 'Arusha', '2026-01-26', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1177, 21, 25, 'Arusha', 'Dar es Salaam', '2026-01-27', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1178, 21, 25, 'Dar es Salaam', 'Arusha', '2026-01-28', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1179, 21, 25, 'Arusha', 'Dar es Salaam', '2026-01-29', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1180, 21, 25, 'Dar es Salaam', 'Arusha', '2026-01-30', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1181, 21, 25, 'Arusha', 'Dar es Salaam', '2026-01-31', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1182, 21, 25, 'Dar es Salaam', 'Arusha', '2026-02-01', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1183, 21, 25, 'Arusha', 'Dar es Salaam', '2026-02-02', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1184, 21, 25, 'Dar es Salaam', 'Arusha', '2026-02-03', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1185, 21, 25, 'Arusha', 'Dar es Salaam', '2026-02-04', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1186, 21, 25, 'Dar es Salaam', 'Arusha', '2026-02-05', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1187, 21, 25, 'Arusha', 'Dar es Salaam', '2026-02-06', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1188, 21, 25, 'Dar es Salaam', 'Arusha', '2026-02-07', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1189, 21, 25, 'Arusha', 'Dar es Salaam', '2026-02-08', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1190, 21, 25, 'Dar es Salaam', 'Arusha', '2026-02-09', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1191, 21, 25, 'Arusha', 'Dar es Salaam', '2026-02-10', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1192, 21, 25, 'Dar es Salaam', 'Arusha', '2026-02-11', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1193, 21, 25, 'Arusha', 'Dar es Salaam', '2026-02-12', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1194, 21, 25, 'Dar es Salaam', 'Arusha', '2026-02-13', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1195, 21, 25, 'Arusha', 'Dar es Salaam', '2026-02-14', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1196, 21, 25, 'Dar es Salaam', 'Arusha', '2026-02-15', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1197, 21, 25, 'Arusha', 'Dar es Salaam', '2026-02-16', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1198, 21, 25, 'Dar es Salaam', 'Arusha', '2026-02-17', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1199, 21, 25, 'Arusha', 'Dar es Salaam', '2026-02-18', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1200, 21, 25, 'Dar es Salaam', 'Arusha', '2026-02-19', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1201, 21, 25, 'Arusha', 'Dar es Salaam', '2026-02-20', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1202, 21, 25, 'Dar es Salaam', 'Arusha', '2026-02-21', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1203, 21, 25, 'Arusha', 'Dar es Salaam', '2026-02-22', '22:00:00', '07:30:00', '2026-01-24 13:50:33', '2026-01-24 13:50:33'),
(1204, 18, 22, 'Arusha', 'Dar es Salaam', '2026-01-24', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1205, 18, 22, 'Dar es Salaam', 'Arusha', '2026-01-25', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1206, 18, 22, 'Arusha', 'Dar es Salaam', '2026-01-26', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1207, 18, 22, 'Dar es Salaam', 'Arusha', '2026-01-27', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1208, 18, 22, 'Arusha', 'Dar es Salaam', '2026-01-28', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1209, 18, 22, 'Dar es Salaam', 'Arusha', '2026-01-29', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1210, 18, 22, 'Arusha', 'Dar es Salaam', '2026-01-30', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1211, 18, 22, 'Dar es Salaam', 'Arusha', '2026-01-31', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1212, 18, 22, 'Arusha', 'Dar es Salaam', '2026-02-01', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1213, 18, 22, 'Dar es Salaam', 'Arusha', '2026-02-02', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1214, 18, 22, 'Arusha', 'Dar es Salaam', '2026-02-03', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1215, 18, 22, 'Dar es Salaam', 'Arusha', '2026-02-04', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1216, 18, 22, 'Arusha', 'Dar es Salaam', '2026-02-05', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1217, 18, 22, 'Dar es Salaam', 'Arusha', '2026-02-06', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1218, 18, 22, 'Arusha', 'Dar es Salaam', '2026-02-07', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1219, 18, 22, 'Dar es Salaam', 'Arusha', '2026-02-08', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1220, 18, 22, 'Arusha', 'Dar es Salaam', '2026-02-09', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1221, 18, 22, 'Dar es Salaam', 'Arusha', '2026-02-10', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1222, 18, 22, 'Arusha', 'Dar es Salaam', '2026-02-11', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1223, 18, 22, 'Dar es Salaam', 'Arusha', '2026-02-12', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1224, 18, 22, 'Arusha', 'Dar es Salaam', '2026-02-13', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1225, 18, 22, 'Dar es Salaam', 'Arusha', '2026-02-14', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1226, 18, 22, 'Arusha', 'Dar es Salaam', '2026-02-15', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1227, 18, 22, 'Dar es Salaam', 'Arusha', '2026-02-16', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1228, 18, 22, 'Arusha', 'Dar es Salaam', '2026-02-17', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1229, 18, 22, 'Dar es Salaam', 'Arusha', '2026-02-18', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1230, 18, 22, 'Arusha', 'Dar es Salaam', '2026-02-19', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1231, 18, 22, 'Dar es Salaam', 'Arusha', '2026-02-20', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1232, 18, 22, 'Arusha', 'Dar es Salaam', '2026-02-21', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1233, 18, 22, 'Dar es Salaam', 'Arusha', '2026-02-22', '22:00:00', '07:30:00', '2026-01-24 13:52:58', '2026-01-24 13:52:58'),
(1234, 21, 25, 'Dar es Salaam', 'Arusha', '2026-02-23', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1235, 21, 25, 'Arusha', 'Dar es Salaam', '2026-02-24', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1236, 21, 25, 'Dar es Salaam', 'Arusha', '2026-02-25', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1237, 21, 25, 'Arusha', 'Dar es Salaam', '2026-02-26', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1238, 21, 25, 'Dar es Salaam', 'Arusha', '2026-02-27', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1239, 21, 25, 'Arusha', 'Dar es Salaam', '2026-02-28', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1240, 21, 25, 'Dar es Salaam', 'Arusha', '2026-03-01', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29');
INSERT INTO `schedules` (`id`, `bus_id`, `route_id`, `from`, `to`, `schedule_date`, `start`, `end`, `created_at`, `updated_at`) VALUES
(1241, 21, 25, 'Arusha', 'Dar es Salaam', '2026-03-02', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1242, 21, 25, 'Dar es Salaam', 'Arusha', '2026-03-03', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1243, 21, 25, 'Arusha', 'Dar es Salaam', '2026-03-04', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1244, 21, 25, 'Dar es Salaam', 'Arusha', '2026-03-05', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1245, 21, 25, 'Arusha', 'Dar es Salaam', '2026-03-06', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1246, 21, 25, 'Dar es Salaam', 'Arusha', '2026-03-07', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1247, 21, 25, 'Arusha', 'Dar es Salaam', '2026-03-08', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1248, 21, 25, 'Dar es Salaam', 'Arusha', '2026-03-09', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1249, 21, 25, 'Arusha', 'Dar es Salaam', '2026-03-10', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1250, 21, 25, 'Dar es Salaam', 'Arusha', '2026-03-11', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1251, 21, 25, 'Arusha', 'Dar es Salaam', '2026-03-12', '22:00:00', '07:30:00', '2026-02-12 18:42:29', '2026-02-12 18:42:29'),
(1252, 18, 22, 'Arusha', 'Dar es Salaam', '2026-02-23', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1253, 18, 22, 'Dar es Salaam', 'Arusha', '2026-02-24', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1254, 18, 22, 'Arusha', 'Dar es Salaam', '2026-02-25', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1255, 18, 22, 'Dar es Salaam', 'Arusha', '2026-02-26', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1256, 18, 22, 'Arusha', 'Dar es Salaam', '2026-02-27', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1257, 18, 22, 'Dar es Salaam', 'Arusha', '2026-02-28', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1258, 18, 22, 'Arusha', 'Dar es Salaam', '2026-03-01', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1259, 18, 22, 'Dar es Salaam', 'Arusha', '2026-03-02', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1260, 18, 22, 'Arusha', 'Dar es Salaam', '2026-03-03', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1261, 18, 22, 'Dar es Salaam', 'Arusha', '2026-03-04', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1262, 18, 22, 'Arusha', 'Dar es Salaam', '2026-03-05', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1263, 18, 22, 'Dar es Salaam', 'Arusha', '2026-03-06', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1264, 18, 22, 'Arusha', 'Dar es Salaam', '2026-03-07', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1265, 18, 22, 'Dar es Salaam', 'Arusha', '2026-03-08', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1266, 18, 22, 'Arusha', 'Dar es Salaam', '2026-03-09', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1267, 18, 22, 'Dar es Salaam', 'Arusha', '2026-03-10', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1268, 18, 22, 'Arusha', 'Dar es Salaam', '2026-03-11', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51'),
(1269, 18, 22, 'Dar es Salaam', 'Arusha', '2026-03-12', '22:00:00', '07:30:00', '2026-02-12 18:43:51', '2026-02-12 18:43:51');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(100) NOT NULL,
  `payload` varchar(255) NOT NULL,
  `last_activity` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `international` decimal(10,2) NOT NULL,
  `local` decimal(10,2) NOT NULL,
  `service` decimal(10,2) DEFAULT 0.00,
  `service_percentage` int(11) NOT NULL DEFAULT 0,
  `enable_customer_sms_notifications` tinyint(1) NOT NULL DEFAULT 1,
  `enable_customer_email_notifications` tinyint(1) NOT NULL DEFAULT 1,
  `enable_conductor_sms_notifications` tinyint(1) NOT NULL DEFAULT 1,
  `enable_conductor_email_notifications` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `international`, `local`, `service`, `service_percentage`, `enable_customer_sms_notifications`, `enable_customer_email_notifications`, `enable_conductor_sms_notifications`, `enable_conductor_email_notifications`, `created_at`, `updated_at`) VALUES
(1, 300.00, 100.00, 100.00, 1, 1, 1, 0, 1, '2025-06-24 08:14:40', '2026-02-20 22:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `special_hire_orders`
--

CREATE TABLE `special_hire_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `coaster_id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `pickup_location` varchar(255) NOT NULL,
  `pickup_latitude` decimal(10,8) DEFAULT NULL,
  `pickup_longitude` decimal(11,8) DEFAULT NULL,
  `dropoff_location` varchar(255) NOT NULL,
  `dropoff_latitude` decimal(10,8) DEFAULT NULL,
  `dropoff_longitude` decimal(11,8) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `hire_time` time NOT NULL,
  `return_date` date DEFAULT NULL,
  `return_time` time DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `customer_user_id` int(11) UNSIGNED NOT NULL,
  `passengers_count` int(11) NOT NULL DEFAULT 1,
  `distance_km` decimal(10,2) NOT NULL DEFAULT 0.00,
  `base_price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `price_per_km` decimal(10,2) NOT NULL DEFAULT 0.00,
  `km_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `surcharge_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `surcharge_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` enum('pending','paid','refunded') NOT NULL DEFAULT 'pending',
  `order_status` enum('pending','confirmed','in_progress','completed','cancelled') NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `special_hire_orders`
--

INSERT INTO `special_hire_orders` (`id`, `order_code`, `user_id`, `coaster_id`, `customer_name`, `customer_phone`, `customer_email`, `pickup_location`, `pickup_latitude`, `pickup_longitude`, `dropoff_location`, `dropoff_latitude`, `dropoff_longitude`, `hire_date`, `hire_time`, `return_date`, `return_time`, `purpose`, `customer_user_id`, `passengers_count`, `distance_km`, `base_price`, `price_per_km`, `km_amount`, `surcharge_percent`, `surcharge_amount`, `total_amount`, `payment_method`, `payment_status`, `order_status`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'SH-20251220-001', 64, 2, 'msangi', '628042409', 'msangi@gmail.com', 'dar', NULL, NULL, 'mombo', NULL, NULL, '2025-12-20', '04:58:00', NULL, NULL, NULL, 68, 30, 0.00, 100000.00, 2500.00, 25000.00, 35.00, 43750.00, 168750.00, 'cash', 'paid', 'completed', NULL, '2025-12-20 09:58:40', '2025-12-20 11:46:39'),
(2, 'SH-20251220-002', 64, 3, 'Amina kidege', '071212121212', 'akakoyi@gmail.com', 'ubungo', NULL, NULL, 'bagamoyo', NULL, NULL, '2025-12-21', '07:30:00', NULL, NULL, NULL, 69, 20, 0.00, 100000.00, 2500.00, 25000.00, 15.00, 18750.00, 143750.00, NULL, 'pending', 'pending', NULL, '2025-12-20 12:27:24', '2025-12-20 12:27:24'),
(3, 'SH-20251220-003', 64, 4, 'Amina kidege', '071212121212', 'akakoyi@gmail.com', 'Kimara', NULL, NULL, 'Bagamoyo', NULL, NULL, '2025-12-20', '07:50:00', NULL, NULL, NULL, 69, 20, 0.00, 100000.00, 2500.00, 25000.00, 15.00, 18750.00, 143750.00, NULL, 'pending', 'cancelled', NULL, '2025-12-20 12:39:41', '2025-12-21 02:20:52'),
(4, 'SH-20251220-004', 64, 2, 'msangi', '628042409', 'msangi@gmail.com', 'ubungo', NULL, NULL, 'arusha', NULL, NULL, '2025-12-20', '19:58:00', NULL, NULL, NULL, 68, 30, 0.00, 100000.00, 2500.00, 25000.00, 35.00, 43750.00, 168750.00, NULL, 'pending', 'cancelled', NULL, '2025-12-21 00:58:50', '2025-12-21 01:00:51'),
(5, 'SH-20251220-005', 64, 4, 'msangi', '628042409', 'msangi@gmail.com', 'ubungo', NULL, NULL, 'arusha', NULL, NULL, '2025-12-20', '20:00:00', NULL, NULL, NULL, 68, 30, 0.00, 100000.00, 2500.00, 25000.00, 35.00, 43750.00, 168750.00, NULL, 'pending', 'cancelled', NULL, '2025-12-21 01:00:32', '2025-12-21 01:03:54'),
(6, 'SH-20251220-006', 64, 3, 'msangi', '628042409', 'msangi@gmail.com', 'dar es salaam', NULL, NULL, 'mombo', NULL, NULL, '2025-12-20', '20:04:00', NULL, NULL, NULL, 68, 30, 0.00, 100000.00, 2500.00, 25000.00, 35.00, 43750.00, 168750.00, NULL, 'pending', 'pending', NULL, '2025-12-21 01:05:14', '2025-12-21 01:05:14');

-- --------------------------------------------------------

--
-- Table structure for table `special_hire_pricing`
--

CREATE TABLE `special_hire_pricing` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coaster_id` bigint(20) UNSIGNED NOT NULL,
  `base_price` decimal(12,2) NOT NULL DEFAULT 100000.00,
  `price_per_km` decimal(10,2) NOT NULL DEFAULT 2500.00,
  `min_km` int(11) NOT NULL DEFAULT 10,
  `weekend_surcharge_percent` decimal(5,2) NOT NULL DEFAULT 15.00,
  `night_surcharge_percent` decimal(5,2) NOT NULL DEFAULT 20.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `special_hire_pricing`
--

INSERT INTO `special_hire_pricing` (`id`, `coaster_id`, `base_price`, `price_per_km`, `min_km`, `weekend_surcharge_percent`, `night_surcharge_percent`, `created_at`, `updated_at`) VALUES
(2, 2, 100000.00, 2500.00, 10, 15.00, 20.00, '2025-12-20 05:14:34', '2025-12-20 05:14:34'),
(3, 3, 100000.00, 2500.00, 10, 15.00, 20.00, '2025-12-20 05:33:33', '2025-12-20 05:33:33'),
(4, 4, 100000.00, 2500.00, 10, 15.00, 20.00, '2025-12-20 12:31:03', '2025-12-20 12:31:03');

-- --------------------------------------------------------

--
-- Table structure for table `stend`
--

CREATE TABLE `stend` (
  `id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_balance`
--

CREATE TABLE `system_balance` (
  `id` int(11) NOT NULL,
  `campany_id` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `system_balance`
--

INSERT INTO `system_balance` (`id`, `campany_id`, `balance`, `created_at`, `updated_at`) VALUES
(2, 13, NULL, '2025-05-03 11:16:03', '2025-05-04 07:12:10'),
(3, 19, 25, '2025-05-05 01:56:09', '2025-05-05 04:56:09'),
(4, 20, 50, '2025-05-05 15:24:04', '2025-05-05 18:24:04'),
(5, 20, 50, '2025-05-06 15:57:53', '2025-05-06 18:57:53'),
(6, 24, 50, '2025-05-06 19:14:04', '2025-05-06 22:14:04'),
(7, 24, 28, '2025-05-06 19:47:15', '2025-05-06 22:47:15'),
(8, 24, 32, '2025-05-06 20:15:26', '2025-05-06 23:15:26'),
(9, 24, 35, '2025-05-06 20:29:48', '2025-05-06 23:29:48'),
(10, 3, 260, '2025-05-07 12:53:38', '2025-05-07 15:53:38'),
(11, 3, 50, '2025-05-07 18:38:28', '2025-05-07 21:38:28'),
(12, 3, 50, '2025-05-08 16:49:29', '2025-05-08 19:49:29'),
(13, 3, 42, '2025-05-29 20:02:22', '2025-05-29 23:02:22'),
(14, 3, 4, '2025-06-01 08:43:02', '2025-06-01 11:43:02'),
(15, 3, 4, '2025-06-01 19:16:41', '2025-06-01 22:16:41'),
(16, 3, 522, '2025-06-01 19:44:50', '2025-06-01 22:44:50'),
(17, 21, 5, '2025-06-02 11:59:22', '2025-06-02 14:59:22'),
(18, 21, 5, '2025-06-02 13:40:26', '2025-06-02 16:40:26'),
(19, 21, 5, '2025-06-02 14:01:33', '2025-06-02 17:01:33'),
(20, 3, 13, '2025-06-02 14:10:18', '2025-06-02 17:10:18'),
(21, 3, 6, '2025-06-02 14:29:19', '2025-06-02 17:29:19'),
(22, 3, 7, '2025-06-02 14:45:53', '2025-06-02 17:45:53'),
(23, 3, 6, '2025-06-02 23:08:21', '2025-06-03 02:08:21'),
(24, 3, 7, '2025-06-03 13:59:53', '2025-06-03 16:59:53'),
(25, 3, 6, '2025-06-04 02:48:07', '2025-06-04 05:48:07'),
(26, 21, 5, '2025-06-08 07:36:21', '2025-06-08 10:36:21'),
(27, 3, 3, '2025-06-08 21:33:13', '2025-06-09 00:33:13'),
(28, 3, 7, '2025-06-08 21:57:37', '2025-06-09 00:57:37'),
(29, 13, 2, '2025-06-11 13:30:35', '2025-06-11 16:30:35'),
(30, 21, 5, '2025-06-11 14:39:11', '2025-06-11 17:39:11'),
(31, 3, 3, '2025-06-12 08:58:34', '2025-06-12 11:58:34'),
(32, 3, 1, '2025-06-12 09:51:53', '2025-06-12 12:51:53'),
(33, 21, 4, '2025-06-12 13:13:49', '2025-06-12 16:13:49'),
(34, 13, 2, '2025-06-12 13:51:03', '2025-06-12 16:51:03'),
(35, 20, 13, '2025-06-13 19:14:54', '2025-06-13 22:14:54'),
(36, 3, 21, '2025-06-17 21:11:23', '2025-06-18 00:11:23'),
(37, 20, 15, '2025-06-18 20:40:29', '2025-06-18 23:40:29'),
(38, 3, 21, '2025-06-19 01:30:26', '2025-06-19 04:30:26'),
(39, 3, 13, '2025-06-19 18:36:41', '2025-06-19 21:36:41'),
(40, 3, 0, '2025-06-19 19:23:25', '2025-06-19 22:23:25'),
(41, 3, 2, '2025-06-19 19:47:48', '2025-06-19 22:47:48'),
(42, 3, 4, '2025-06-19 20:10:44', '2025-06-19 23:10:44'),
(43, 3, 13, '2025-06-20 06:01:42', '2025-06-20 09:01:42'),
(44, 3, 4, '2025-06-20 08:36:14', '2025-06-20 11:36:14'),
(45, 3, 4, '2025-06-20 09:30:33', '2025-06-20 12:30:33'),
(46, 3, 11, '2025-06-20 11:58:58', '2025-06-20 14:58:58'),
(47, 3, 4, '2025-06-20 19:34:35', '2025-06-20 22:34:35'),
(48, 3, 4, '2025-06-20 20:00:23', '2025-06-20 23:00:23'),
(49, 3, 4, '2025-06-20 20:38:24', '2025-06-20 23:38:24'),
(50, 3, 0, '2025-06-20 22:51:34', '2025-06-21 01:51:34'),
(51, 3, 4, '2025-06-20 23:04:47', '2025-06-21 02:04:47'),
(52, 3, 4, '2025-06-20 23:46:24', '2025-06-21 02:46:24'),
(53, 3, 3, '2025-06-20 23:52:00', '2025-06-21 02:52:00'),
(54, 3, 10, '2025-06-22 09:22:29', '2025-06-22 12:22:29'),
(55, 3, 10, '2025-06-22 10:14:39', '2025-06-22 13:14:39'),
(56, 3, 4, '2025-06-22 10:26:35', '2025-06-22 13:26:35'),
(57, 3, 11, '2025-06-22 20:16:32', '2025-06-22 23:16:32'),
(58, 3, 13, '2025-06-22 21:11:49', '2025-06-23 00:11:49'),
(59, 3, 11, '2025-06-22 23:53:59', '2025-06-23 02:53:59'),
(60, 3, 13, '2025-06-24 09:30:46', '2025-06-24 12:30:46'),
(61, 3, 11, '2025-06-24 09:39:14', '2025-06-24 12:39:14'),
(62, 3, 13, '2025-06-24 09:58:00', '2025-06-24 12:58:00'),
(63, 3, 4, '2025-06-25 22:51:11', '2025-06-26 01:51:11'),
(64, 3, -102, '2025-06-30 13:49:41', '2025-06-30 16:49:41'),
(65, 3, -102, '2025-06-30 13:58:22', '2025-06-30 16:58:22'),
(66, 3, -38, '2025-07-01 10:48:48', '2025-07-01 13:48:48'),
(67, 3, -305, '2025-07-02 08:47:08', '2025-07-02 11:47:08'),
(68, 3, -305, '2025-07-03 21:11:51', '2025-07-04 00:11:51'),
(69, 13, -51, '2025-07-06 06:44:20', '2025-07-06 09:44:20'),
(70, 13, 4, '2025-07-06 07:12:10', '2025-07-06 10:12:10'),
(71, 13, -102, '2025-07-06 08:28:13', '2025-07-06 11:28:13'),
(72, 13, -102, '2025-07-06 08:33:12', '2025-07-06 11:33:12'),
(73, 3, 4, '2025-07-22 06:05:37', '2025-07-22 09:05:37'),
(74, 3, -102, '2025-07-22 06:11:10', '2025-07-22 09:11:10'),
(75, 3, -102, '2025-07-22 16:36:00', '2025-07-22 19:36:00'),
(76, 13, 4, '2025-07-22 19:48:46', '2025-07-22 22:48:46'),
(77, 21, -102, '2025-07-22 20:50:30', '2025-07-22 23:50:30'),
(78, 3, -102, '2025-07-24 16:53:23', '2025-07-24 19:53:23'),
(79, 3, 4, '2025-07-24 17:03:00', '2025-07-24 20:03:00'),
(80, 3, -102, '2025-07-28 06:58:27', '2025-07-28 09:58:27'),
(81, 3, 4, '2025-07-28 18:29:25', '2025-07-28 21:29:25'),
(82, 3, 3, '2025-07-28 19:28:37', '2025-07-28 22:28:37'),
(83, 3, 3, '2025-07-29 11:43:16', '2025-07-29 14:43:16'),
(84, 3, 13, '2025-07-29 12:40:54', '2025-07-29 15:40:54'),
(85, 3, 8, '2025-07-30 08:56:55', '2025-07-30 11:56:55'),
(86, 3, 4, '2025-07-31 20:06:32', '2025-07-31 23:06:32'),
(87, 3, 4, '2025-08-31 20:12:31', '2025-08-31 23:12:31'),
(88, 3, 4, '2025-08-31 20:16:13', '2025-08-31 23:16:13'),
(89, 3, 4, '2025-08-31 20:40:44', '2025-08-31 23:40:44'),
(90, 3, 4, '2025-09-03 09:13:11', '2025-09-03 12:13:11'),
(91, 3, 1, '2025-09-03 10:34:26', '2025-09-03 13:34:26'),
(92, 3, 4, '2025-09-04 11:03:05', '2025-09-04 14:03:05'),
(93, 3, 4, '2025-09-04 11:05:58', '2025-09-04 14:05:58'),
(94, 3, 3, '2025-09-06 09:05:53', '2025-09-06 12:05:53'),
(95, 3, 3, '2025-09-06 09:09:29', '2025-09-06 12:09:29'),
(96, 3, 3, '2025-09-11 20:25:28', '2025-09-11 23:25:28'),
(97, 3, 3, '2025-09-11 20:33:58', '2025-09-11 23:33:58'),
(98, 3, 3, '2025-09-29 20:09:10', '2025-09-29 23:09:10'),
(99, 3, 3, '2025-09-29 20:20:29', '2025-09-29 23:20:29'),
(100, 3, 3, '2025-10-16 11:53:19', '2025-10-16 14:53:19'),
(101, 3, 3, '2025-10-16 12:17:09', '2025-10-16 15:17:09'),
(102, 3, 3, '2025-10-25 18:59:21', '2025-10-25 21:59:21'),
(103, 3, 15, '2026-02-09 19:20:57', '2026-02-09 14:20:57'),
(104, 3, 50, '2026-02-23 03:28:32', '2026-02-22 22:28:32'),
(105, 3, 50, '2026-02-23 03:35:23', '2026-02-22 22:35:23'),
(106, 3, 50, '2026-02-23 04:03:11', '2026-02-22 23:03:11'),
(107, 3, 50, '2026-02-23 04:21:23', '2026-02-22 23:21:23'),
(108, 3, 50, '2026-02-23 04:25:39', '2026-02-22 23:25:39'),
(109, 3, 50, '2026-02-24 01:24:34', '2026-02-23 20:24:34'),
(110, 3, 50, '2026-02-24 02:44:05', '2026-02-23 21:44:05'),
(111, 3, 50, '2026-02-24 02:44:05', '2026-02-23 21:44:05'),
(112, 3, 50, '2026-02-25 20:34:24', '2026-02-25 15:34:24'),
(113, 3, 50, '2026-02-25 20:54:07', '2026-02-25 15:54:07'),
(114, 3, 50, '2026-02-25 20:54:07', '2026-02-25 15:54:07'),
(115, 3, 50, '2026-02-25 21:04:39', '2026-02-25 16:04:39'),
(116, 3, 50, '2026-02-25 21:04:39', '2026-02-25 16:04:39'),
(117, 3, 50, '2026-02-26 02:25:30', '2026-02-25 21:25:30'),
(118, 3, 45, '2026-02-27 03:07:10', '2026-02-26 22:07:10'),
(119, 3, 45, '2026-02-27 03:22:11', '2026-02-26 22:22:11'),
(120, 3, 45, '2026-02-27 03:22:11', '2026-02-26 22:22:11');

-- --------------------------------------------------------

--
-- Table structure for table `temp_wallets`
--

CREATE TABLE `temp_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `user_key` varchar(255) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_wallets`
--

INSERT INTO `temp_wallets` (`id`, `user_id`, `user_key`, `amount`, `created_at`, `updated_at`, `status`) VALUES
(1, '52', NULL, 72, '2025-08-31 16:28:03', '2025-09-04 11:24:59', '0'),
(2, '37', 'miamia', 100, '2025-09-06 10:07:47', '2025-09-29 20:39:45', '0'),
(3, NULL, 'yyyyy', 39, '2025-09-06 10:13:29', '2025-09-06 10:13:29', '0'),
(4, NULL, 'DMBAGMZ', 100, '2025-09-11 20:39:32', '2025-09-11 20:39:32', '0'),
(5, '79', NULL, 1000, '2026-02-23 04:31:00', '2026-02-23 04:31:00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `campany_id` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT 0,
  `payment_method` varchar(255) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `payment_number` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `reference_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL,
  `vender_id` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `campany_id`, `user_id`, `payment_method`, `amount`, `payment_number`, `status`, `reference_number`, `created_at`, `updated_at`, `vender_id`) VALUES
(1, 3, 3, 'MPesa', 45000, 765553953, 'Cancelled', NULL, '2025-04-30 07:56:56', '2025-04-30 19:32:49', 0),
(2, 3, 3, 'bank', 3000, 1, 'Completed', NULL, '2025-04-30 08:17:39', '2025-04-30 11:52:00', 0),
(3, 3, 3, 'MixxBYYass', 1000, 1, 'Cancelled', NULL, '2025-05-01 11:14:31', '2025-05-05 19:35:51', 0),
(4, 20, 28, 'AirtelMoney', 300, NULL, 'Completed', NULL, '2025-05-05 15:57:10', '2025-05-05 19:35:34', 0),
(7, 24, 32, 'MPesa', 250, NULL, 'Completed', NULL, '2025-05-06 20:02:50', '2025-05-06 23:03:07', 0),
(8, 24, 32, 'MPesa', 100, NULL, 'Completed', NULL, '2025-05-06 20:03:28', '2025-05-06 23:03:42', 0),
(9, 24, 32, 'MPesa', 100, NULL, 'Cancelled', NULL, '2025-05-06 20:04:06', '2025-05-06 23:04:19', 0),
(10, 3, 3, 'bank', 1500, NULL, 'Completed', NULL, '2025-05-08 02:22:53', '2025-05-08 05:28:17', 0),
(11, 3, 3, 'MPesa', 6301, NULL, 'Completed', NULL, '2025-05-14 22:57:24', '2025-05-18 23:46:16', 37),
(14, 0, 37, 'MPesa', 500, 628042409, 'Completed', NULL, '2025-05-15 20:22:31', '2025-05-15 23:29:04', 37),
(15, 3, 3, 'MPesa', 1000, NULL, 'Completed', 'WERT123', '2025-05-17 07:31:34', '2025-06-26 08:43:46', 0),
(16, 3, 3, 'MPesa', 6300, NULL, 'Completed', 'T 145 ERT', '2025-05-18 20:45:29', '2025-06-26 08:59:05', 0),
(17, 0, 37, 'MPesa', 40, 628042409, 'Completed', NULL, '2025-05-18 21:17:54', '2025-05-19 00:18:32', 37),
(18, 0, 37, 'AirtelMoney', 10, 628042409, 'Completed', 'DANIEL', '2025-05-21 02:11:25', '2025-06-26 08:52:41', 37),
(19, 0, 37, 'MPesa', 40, 628042409, 'pending', NULL, '2025-05-27 14:53:32', '2025-05-27 17:53:32', 37),
(20, 0, 37, 'bank', 13, 628042409, 'Completed', NULL, '2025-05-30 03:42:32', '2025-06-02 13:39:17', 37),
(21, 3, 3, 'MPesa', 200, NULL, 'Completed', 'tjtrshrsthstryreyert', '2025-06-01 16:13:19', '2025-06-02 12:06:42', 0),
(22, 0, 37, 'MPesa', 20, 628042409, 'Completed', NULL, '2025-06-01 19:28:07', '2025-06-01 22:33:27', 37),
(23, 0, 37, 'MPesa', 10, 628042409, 'Completed', NULL, '2025-06-02 06:06:20', '2025-06-02 09:08:29', 37),
(24, 0, 37, 'MPesa', 10, 628042409, 'Completed', 'fxgjdfjfncfjcf', '2025-06-02 06:12:15', '2025-06-02 09:13:02', 37),
(26, 3, 3, 'MPesa', 100, 789473209, 'Completed', 'agadfbvzsdjsgg', '2025-06-06 17:35:51', '2025-06-06 20:36:26', 0),
(27, 13, 19, 'MPesa', 50, NULL, 'Completed', 'tyyuyttttttre', '2025-06-09 01:52:06', '2025-06-10 11:03:43', 0),
(28, 3, 3, 'MPesa', 1941, 789473209, 'Completed', 'UAYS7898ASA', '2025-06-20 19:43:54', '2025-06-20 22:45:20', 0),
(29, 3, 3, 'MPesa', 1, 789473209, 'Completed', '1234567', '2025-06-20 19:45:53', '2025-06-20 22:46:10', 0),
(30, 3, 3, 'bank', 200, 789473209, 'Completed', '1234567890', '2025-06-25 08:20:26', '2025-06-25 11:24:30', 0),
(31, 0, 37, 'bank', 100, 628042409, 'pending', NULL, '2025-07-21 23:06:07', '2025-07-22 02:06:07', 37);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` varchar(255) DEFAULT NULL,
  `verification_expires_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contact` int(11) DEFAULT 0,
  `status` enum('accept','cancel','pending') NOT NULL DEFAULT 'pending',
  `campany_id` int(11) DEFAULT NULL,
  `failed_attempts` int(11) NOT NULL DEFAULT 0,
  `locked_until` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `role`, `email_verified_at`, `verification_code`, `verification_expires_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`, `contact`, `status`, `campany_id`, `failed_attempts`, `locked_until`) VALUES
(3, 'ibrahim ashiraf', 'doniaparoma99@gmail.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$JSdERb6QrEqKDq2jUkdkAeIUEVk3bDCVt5WA2InMpTx/MB9eorZaC', 'eyJpdiI6InhPR0huZnE4ZFgrTHhJZ0dTRFFvZnc9PSIsInZhbHVlIjoiditkY0VuUk9BN0NHYTNYSEt1SkY1cGM5cmZZb0VYaUJwMTA0R01uVGJBZz0iLCJtYWMiOiJjM2M3NzUxMjdhNDc1MjhmNTRjZDIxMDFjNGUyMGQ1ZTY0YzE4ZTU0YTZmMzg3ZDY2MzVhMTkwZmQ0MzRmMjUzIiwidGFnIjoiIn0=', 'eyJpdiI6Ii9hdWZ1bmVJYi9uUzEyUDRrTWVhUnc9PSIsInZhbHVlIjoidnBMb251akJTMGNrbUMzSmxTWnYrS3JkZjVRUmx5c29kQ0NyaiszZUE3YUlZMlB4bGRpZnU2azBMNFBJZXVNbE9wNit1TlQxTXhycmdRcEo5V08vZndudDJzM2phUEtsZC8vUVNVVEJka1FLdDF1SGNsanJsKy9UaGhCNlF6RWZ0WjNkNmZqTWoranpFR2ZTOFFIT204N3JudGxPTFVWc2wrOURkOURNSzB6b1JCNVNkK1RBRGRKYWg4TjRld05JME13cDlmVTRMQ08wa3htZGdrVk55ZkhxRTA5eXFBZVhOMUVSTkhCK1VXcTYxaHBwa0RaY0pUQ3pOUWhSaitReSs1RXQ5Wm9UdjJmVXlXRXdSWDZQWkE9PSIsIm1hYyI6IjkwZTlhYzUxNDBkNzMyMzY2NDlkMjY1MDI0MzRlY2IxMmRlNGIxNDJiY2YzYjE3NmJjNmRmYjMyNmY5M2Q5YWIiLCJ0YWciOiIifQ==', '2026-02-27 02:36:53', NULL, '2025-04-22 09:03:41', '2026-02-27 02:36:53', 628042409, '', NULL, 0, NULL),
(9, 'salim mbaga', 'pop@example.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$6zM0XzVC53imYiePdixaj.Ph.SV5ejPZbK3.G2u2qfzdlDs23FnuC', NULL, NULL, NULL, NULL, '2025-04-23 08:21:32', '2025-04-23 08:21:32', 0, '', NULL, 0, NULL),
(10, 'Mjomba', 'mjomba@gmail.com', NULL, 'traveler', NULL, NULL, NULL, '$2y$12$2x2jl1u91eWoyc5lVo.uvuJrlXKMnurI.hQXTlcZ/ijNWnlhYX4JS', NULL, NULL, NULL, NULL, '2025-04-23 08:43:17', '2025-04-23 08:43:17', 0, '', NULL, 0, NULL),
(11, 'uncle pop', 'uncle@gmail.com', NULL, 'traveler', NULL, NULL, NULL, '$2y$12$fHwJfIb5wj9CGFmKow.jL.vzW7UtiLO4w8btG/W24AKLAEAJQDltK', NULL, NULL, NULL, NULL, '2025-04-23 09:47:26', '2025-04-23 09:47:26', 0, '', NULL, 0, NULL),
(13, 'Thomas Chizi', 'admin@gmail.com', NULL, 'admin', NULL, NULL, NULL, '$2y$12$HcniV.T/Vd5Q/BI9rLSwfOOlTlZPH0o.Y8LihclToCxx3lDlzgDla', 'eyJpdiI6InNZSGRobFdlR0FCcnN6MUsxQWRsN1E9PSIsInZhbHVlIjoiSnhOMDhVSjcxZmY2dWFkUzZpTG1TdGxOZ0NjcTJiUUoyUE9SeWphaHZpND0iLCJtYWMiOiJmN2NhOGVjYWNkZmM1ZTZiOGQ4MTU2M2JhOGY2NGJjMWQ4YzcyYTNhMmQxMzZkMmVjNDkxOWMwN2ZjMzY4NzFmIiwidGFnIjoiIn0=', 'eyJpdiI6IjFNaTdqSzFZU3ltNVFGeFFDSVIrSXc9PSIsInZhbHVlIjoiOW1oeUFYZkZKdDc5TUNTN1VDWG9TRU8yb053aytLOEVyNEd4TzREMnpMTHJPMVVYc09laFduZW9xRDdmOGpRSWpudWhBUm9XUGd6UDh2WDYwSVluMGpxbFZSQWxjUXRLSmZ2ZUp2Z0VIWERtS09aeS8wdjJ2bG5Ia0hXQ0txaUZwajhmRmE0eGk4ZWNYMFVMM3BBQXhWNFJGbndEY1AxYW44dHlrZ1RyTW9ETmcra3FNYzJ5UGlLY3dlRkcxb1NLM3IzaXRaVzhJMWdPdjk5U2F0Q1psUWpCZG1pZ3hnVnMyVjYwQVByMnJSYTQ3ZHBlaDZ2NFBjRThkTVVOTnlEVTUvN3diS2daQlpUTU5VSnRwczhCUFE9PSIsIm1hYyI6IjQxZTU5YjZhZWFhYzhiMDgyYmJmODkxZTY2YWQ5M2VjZGRjMzNjOThlZmE3NmZlNWJjZDg4ZGE5NTNkMDZkMDIiLCJ0YWciOiIifQ==', NULL, NULL, '2025-04-26 07:16:12', '2026-02-25 03:28:20', 715020945, '', NULL, 0, NULL),
(16, 'kimotco', 'kimotco@gmail.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$F1SF8g9gwD8xPG.Lm32MI.DbbJitdNXv8ZJKyUDSFu65DBcGSbXla', NULL, NULL, NULL, NULL, '2025-04-26 11:17:52', '2025-04-26 11:17:52', 0, '', NULL, 0, NULL),
(17, 'Abdul Bunju', 'abduldv@aatanchtrading.com', NULL, 'traveler', NULL, NULL, NULL, '$2y$12$aAaT65/a78Zf5rJFD4HGEOAwOW/rTxY9CmwBsNT05dBoE7Cnx0zju', NULL, NULL, NULL, NULL, '2025-04-28 13:29:07', '2025-04-28 13:29:07', 0, '', NULL, 0, NULL),
(18, 'Thomas Chizi', 'chizithomas@gmail.com', NULL, 'traveler', NULL, NULL, NULL, '$2y$12$MaJEytnkP4V/MJq7bSKfGewacwm1ep3kS5f26ZEBUC1XBhOpPKcfa', NULL, NULL, NULL, NULL, '2025-05-02 07:17:04', '2025-12-14 15:27:32', 0, '', NULL, 2, NULL),
(19, 'Thomas Paul Chizi', 'info@hisgc.co.tz', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$bni3Q4G13KuvH8NJ8vonFO6Vx.gTJ3ghREmw7GJcBdcR2pxdThBVm', NULL, NULL, NULL, NULL, '2025-05-02 10:33:27', '2025-05-02 10:33:27', 0, '', NULL, 0, NULL),
(20, 'Abdul Bunju', 'admin@bishtelecom.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$t6W2mNC8mI3w4/Fs3N7URurkx4JSwpsdYtOrQgGY./G942YKMjEVO', NULL, NULL, NULL, NULL, '2025-05-04 12:47:48', '2025-05-04 12:47:48', 0, '', NULL, 0, NULL),
(21, 'Donia Paroma', 'abdul@gmail.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$683xFZdSEzjWXCe/0U1beOe/awprSLt/YDz5oh.tWrYhBeyYZd29S', NULL, NULL, NULL, NULL, '2025-05-04 13:35:13', '2025-05-04 13:35:13', 0, '', NULL, 0, NULL),
(25, 'said', 'said@gmail.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$Ap/A6wv9dzkKuT9Xbh5iPe7HbXpm4zADfVodblVnumHFeymFxyRCW', NULL, NULL, NULL, NULL, '2025-05-04 14:11:28', '2025-05-04 14:11:28', 0, '', NULL, 0, NULL),
(26, 'Mohammed Shambarahi', 'accounts@hisgc.co.tz', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$i/hsRUH48LK09th.izrbqex5VT4nD.se6kfIhf6Pd2cTGVmMYmaIW', NULL, NULL, NULL, NULL, '2025-05-05 00:52:26', '2025-05-05 00:52:26', 0, '', NULL, 0, NULL),
(27, 'Juma Nkamia', 'chuobandari@gmail.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$V/6blX88g5sc/yRNdxVNQeF54gk829TifjrghN3ZxoPNKtw4kUohG', NULL, NULL, NULL, NULL, '2025-05-05 01:42:57', '2025-05-05 01:42:57', 0, '', NULL, 0, NULL),
(28, 'Joel Thomas', 'thomas@hisgc.co.tz', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$bni3Q4G13KuvH8NJ8vonFO6Vx.gTJ3ghREmw7GJcBdcR2pxdThBVm', NULL, NULL, NULL, NULL, '2025-05-05 14:44:44', '2025-05-05 14:44:44', 0, '', NULL, 0, NULL),
(29, 'James Jacob', 'james@hisgc.co.tz', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$bni3Q4G13KuvH8NJ8vonFO6Vx.gTJ3ghREmw7GJcBdcR2pxdThBVm', NULL, NULL, NULL, NULL, '2025-05-06 16:07:11', '2025-05-06 16:07:11', 0, '', NULL, 0, NULL),
(31, 'SK', 'sk@gmail.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$6cXfr3UGP7mTlQEIOsURju0RjfFalhLJqbQECAy0R3wX7KuLuB1yC', NULL, NULL, NULL, NULL, '2025-05-06 17:03:20', '2025-05-06 17:03:20', 0, '', NULL, 0, NULL),
(32, 'Abdul Bunju', 'dully@gmail.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$mcKHAxhOmopCUh33Ohd8pu00r0mwcbHqwfo5xv2Mqr1cLDhOJ8/Xy', NULL, NULL, NULL, NULL, '2025-05-06 18:54:27', '2025-05-06 18:54:27', 628042409, '', NULL, 0, NULL),
(33, 'Kelvin George', 'kpslayovi@gmail.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$psojnhsrv24BXYN8s/huHuFqlaMXlb9emy9ppBzzsk9HhE8CC0AD2', NULL, NULL, NULL, NULL, '2025-05-10 14:03:21', '2025-05-10 14:03:21', 0, '', NULL, 0, NULL),
(37, 'popsmoke', 'popsmoke@gmail.com', NULL, 'vender', NULL, NULL, NULL, '$2y$12$XaRS6CquGU8UXO1rJbvEuOQhBs4PYnbmd4esP89nLPdZEliXEJiJC', 'eyJpdiI6Ijl3Q3lManNYRm51V0ViWVMxMHVkenc9PSIsInZhbHVlIjoiQzFvTFVUbEFrY0M4ZjM2NStSVkRlZW9QYXpLeXhYQkZkcXZoZ29ZTW9rTT0iLCJtYWMiOiI5MGU3YTM2MGViOTFkZGZhOGQyZDBkM2E3NGFkNWRkYjBhNzlhOGNmNGE1Y2Y5Y2NiOTYxYzEzY2RiZTRkY2IyIiwidGFnIjoiIn0=', 'eyJpdiI6Im5pdlYyM1k1V0hOVWZZR2c4ZFBjalE9PSIsInZhbHVlIjoiUllnMlZSM2Z0blU1Z3hHTDhHS0cxR1hHUmYzTVFtZ1h2V1FBQnB0aDgzcVg4c3locHRJQlM4QW1EeFFqcjdyQi84bW1yVGhDT3Z3R2tYTmxobU9acXZEWjRZZVBCTC96NFRFbjZOaWxoM2hISE0xQVBuYjJrVjQ1RG9lNS9XVTJ1cWNLR1BaUWRSai9hd2hEd00yNG9DVW1vekU3RGtCcVhuelZEZXNuY3pqODVoRlVqMGQyYjNYdUJFM1pjWGpsR0dRL25HY2RTTTlaWkRUdDJBdEFLeHlBaUVjRTE3bFU0dTUxM1RxNHNmQ3k3b1F4Q3laUFN0TEdzU1NQZXc1K040cUJVcE5iak9KQ2orTUp0K3Z3THc9PSIsIm1hYyI6IjZhZThkYzZiZGY2ODlhODAzMjQwNjc3M2M5OTViMDc4NWRhZDJkYWY4OWQ2M2Y1MzIzYTZiMmNkNzQ0NTQ5M2UiLCJ0YWciOiIifQ==', '2026-02-27 10:50:48', NULL, '2025-05-13 06:22:24', '2026-02-27 10:50:48', 628042409, 'accept', NULL, 0, NULL),
(38, 'ruger', 'ruger@gmail.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$LjygKVv4fAfG7oAYC/YnTOvqHAF87M3Jgjs4SK6U4maRqHXCVG.eW', NULL, NULL, NULL, NULL, '2025-05-16 08:11:06', '2025-05-16 08:11:06', 628042409, '', NULL, 0, NULL),
(39, 'David Thomas', 'dt2013@hisgc.co.tz', NULL, 'vender', NULL, NULL, NULL, '$2y$12$FhSL1SXOVgtRlS0Bjyr4jeZywKHC9kDyfuChXFCFeo2e0aH.J5rc6', NULL, NULL, NULL, NULL, '2025-05-17 01:35:26', '2025-07-22 02:57:44', 713020945, 'pending', NULL, 0, NULL),
(40, 'Abdul Bunju', 'mariam@gmail.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$9Z1C9tOs2Otu3zkTqh/f/uyeUjj1CC0zITa6rpFrGdIhMcsIL6vAu', NULL, NULL, NULL, NULL, '2025-05-24 19:45:04', '2025-06-17 17:47:31', 765553953, '', NULL, 0, NULL),
(41, 'Abdul Bunju', 'abjuma10@gmail.com', NULL, 'vender', NULL, NULL, NULL, '$2y$12$1uGjwiisMaPiEq4Ux6KE6ezIiXa7tTrBytdFOnXt9C4u9taNBN/lK', NULL, NULL, NULL, NULL, '2025-06-08 19:30:31', '2025-06-16 10:53:30', 715553803, 'accept', NULL, 0, NULL),
(42, 'Pokea Panja', 'panjapokea@gmail.com', NULL, 'vender', NULL, NULL, NULL, '$2y$12$PhYouZoSWXCHp.pSQygCIOgpa7Ovj1MFPk0ygCTY2HbuiJ0EhWcB6', NULL, NULL, NULL, NULL, '2025-06-12 13:00:01', '2025-06-13 11:31:31', 717167353, 'pending', NULL, 0, NULL),
(44, 'mombo', 'b@gmail.com', NULL, 'admin', NULL, NULL, NULL, '$2y$12$HcniV.T/Vd5Q/BI9rLSwfOOlTlZPH0o.Y8LihclToCxx3lDlzgDla', 'eyJpdiI6Imk3TWhZWldlclhMcW83Sm10QjRvZnc9PSIsInZhbHVlIjoiQlp3czZaQ2U0Y1JvTC9FRkxFai9OMENqaHFlb1AwQkJ4OHhnWXlrbWZ0dz0iLCJtYWMiOiIwN2IxNTZiZTAwMTU4YjBhMWEwNTdjMWE4ZjdmZTdhM2UxOTBiODM4OTczODY4NzE4ZWIwMTAwYzZhYzNmOGEwIiwidGFnIjoiIn0=', 'eyJpdiI6ImNTbkY5Sno2bHpYbEthTGpRc3AybWc9PSIsInZhbHVlIjoiZm5yUGp2T1dGSlh0QnpyTlZtZ2VTN3NBOE9oMm96OU5LbFdVWnIvNDlUSDV6Y1FVdU9VMVpwN1VkVmluemtrS3FTMW1Pd2RzbEl2bHlFaTRaeTR1RGF5d044YzZiL04wMzRNRmsweXVydTJ1S1pRQVR1eHF3MUhpZnhOem40Z0VnK0lqc0Q4WGNFSnBTSVFoOVBzZVVTd09CSm5PellubnNydGRTOFU2S3VCMmpqM2l4V1ZWbVV0ZG9PZS85Q0tvY1UvSElOWkt6T0o4ZmhhaEJlNGFSNU42dWZqa2ZOZ3FkODJpcUlrSjdKVXRlNjFvQkRwdWZXZHRJL0VJMWhnd3JjczRaS2NWb3dyTSsxek56OEpmUWc9PSIsIm1hYyI6IjgyMmZlNGRhMGExMTAxNGMyNzUzMzVmZmEyZDk1MWQxZTQ2NTYwZTgwMjA0NWZiZGFjZjczMjlmMzRjMjI1YjUiLCJ0YWciOiIifQ==', NULL, NULL, '2025-06-16 09:02:27', '2026-02-24 16:55:04', 628042409, 'accept', NULL, 0, NULL),
(45, 'joj', 'joj@gmail.com', NULL, 'admin', NULL, NULL, NULL, '$2y$12$aLOfgXDju4/xyO4Kmpc3ZOjlpvw7q71cWLr0nDvr8fRE.3z3ElmaS', NULL, NULL, NULL, NULL, '2025-06-16 10:55:06', '2025-06-16 10:55:06', 628042409, 'accept', NULL, 0, NULL),
(46, 'mariam shafy', 'monicamruma@gmail.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$qsUL52UdNgDLLuTJ5DBdWuV/O2y.1.04ZltteRarfarjiX8D1OXG2', NULL, NULL, NULL, NULL, '2025-06-17 17:43:27', '2025-06-17 17:43:27', 765553953, 'pending', NULL, 0, NULL),
(47, 'Abdul Bunju', 'abjuma0000@gmail.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$lOEHcGglRLjTFJ6uhe6ZrOxBabWm3LgahlZYdpNvGlr3jk4RcwFJS', NULL, NULL, NULL, NULL, '2025-06-17 18:03:54', '2025-06-17 18:07:02', 715553803, 'pending', NULL, 0, NULL),
(49, 'Christina Ekarist Joseph', 'christina.ekarist@hisgc.co.tz', NULL, 'admin', NULL, NULL, NULL, '$2y$12$Gy8lMudaXEO1jGLYtfbOUuOzwOXjWQtGMJjAdQWe6s.Pwe5iM2rOm', NULL, NULL, NULL, NULL, '2025-06-17 19:50:33', '2025-10-10 13:08:18', 715020945, 'accept', NULL, 0, NULL),
(50, 'James Jacob', 'james@gmail.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$PpdFy29mie55ETc9q8VnbuAs7XBGKYabzkk1b4M5z2aZBr5QqZW76', NULL, NULL, NULL, NULL, '2025-06-17 20:02:38', '2025-06-17 20:02:38', 788112112, 'pending', NULL, 0, NULL),
(51, 'Test User', 'test@demousr.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$6Km00KB3MucLEI./xhBiguFTDV8TP6T9R8EoZJ0HDP8P58mbe8lJi', NULL, NULL, NULL, NULL, '2025-07-08 07:06:23', '2025-07-08 07:06:23', 715553803, 'pending', NULL, 0, NULL),
(53, 'image', 'po@gmail.com', NULL, 'local_bus_owner', NULL, NULL, NULL, '$2y$12$ESLT8aHx6f/ruCPH3HABKuWZ2F1SSPH6JYQ/1fo8K1Q1gjOO3Y3Yy', NULL, NULL, NULL, NULL, '2025-09-12 21:10:34', '2025-09-12 21:10:34', 628042409, 'accept', NULL, 0, NULL),
(55, 'salmin niga', 'niga@gmail.com', NULL, 'local_bus_owner', NULL, NULL, NULL, '$2y$12$jB92JLYhBi7gnU8O2SpUje9yk9bA/ja6PhVOcNUJCmeYYtUwaR2c6', NULL, NULL, NULL, NULL, '2025-09-12 22:17:01', '2025-10-10 15:16:08', 628042409, 'accept', 3, 0, NULL),
(58, 'oga', 'oga@gmail.com', NULL, 'local_bus_owner', NULL, NULL, NULL, '$2y$12$XShIcrbS5/Q54kdhyteLT.BEeVvv6y/mtBsc3BAvxK4X6H5o4KMTu', NULL, NULL, NULL, NULL, '2025-09-12 23:26:43', '2025-09-12 23:27:04', 628042409, 'accept', 3, 0, NULL),
(59, 'Seleman', 'seleman@gmail.com', NULL, 'customer', NULL, '158696', '2025-10-18 14:35:57', '$2y$12$ntYGXiChbAXX9ygFj3PsoONPsbNlTIrI.wgzhq9BZmd7bbKOOjXb2', NULL, NULL, NULL, NULL, '2025-10-18 14:19:48', '2025-10-18 14:20:57', 696646570, 'pending', NULL, 0, NULL),
(60, 'Thomas Chizi', 'tchizi@hisgc.co.tz', NULL, 'customer', NULL, NULL, NULL, '$2y$12$TsxQbJTMr6AkqyLGFJ/jOelId9QUcIyR2U3fyxv28jSNSCskJnSPe', NULL, NULL, NULL, NULL, '2025-10-21 02:18:16', '2025-10-21 02:18:16', 715020945, 'pending', NULL, 0, NULL),
(61, 'Thomas Chizi', 'md@hisgc.co.tz', NULL, 'customer', NULL, NULL, NULL, '$2y$12$vdY0u8fvkB5.yZRv.03/CuGE6qsWxB6r9gWaLPBcAnEPx3fSxUavq', NULL, NULL, NULL, NULL, '2025-10-26 08:02:09', '2025-10-26 08:02:09', 715020945, 'pending', NULL, 0, NULL),
(62, 'occopy', 'occupythenett@gmail.com', NULL, 'bus_campany', NULL, NULL, NULL, '$2y$12$XxbWCbGtsdS7bnhafUqBnuKhByOXAjuiedDGZpfWa91ZPtRPh1QCO', 'eyJpdiI6Ii8xMGYxWnVRZGZNTHJ2OHVRYjFVanc9PSIsInZhbHVlIjoiVGsrODRjZnV6Y1BTOHozU2x6T2lwK094eS91NTViWjUwOXRrOW5iMFhtTT0iLCJtYWMiOiIxOTA4YzBmMDAyZDczNTFjZDg5NTY2MmFkMTBiNDUyMWQ2YjRiNjU4NDc2ZDA1ODc4Nzc0ZDEzNDYxMGQ3ZDM3IiwidGFnIjoiIn0=', 'eyJpdiI6Ik1sNmFrOGdhbUhhRTQ5VmdQTVJYdVE9PSIsInZhbHVlIjoiVzU4NVdRa0w2QTVQK0RaZXRISjkyWkIwcUxFUDhtTFd4eUtOa2dDRWtYWlR3L3RZWWo4ck5vellEZ0Y2VnBxSkhnM2F0SStPaEJYelNEbjhnY1JMN0hha3dKbk5yZWYxa2xPQndqS29VL292Q21TaGFCZU9oS2o2bTFOVnhBNERvZVVjbHFramF5VG1heHJHMmNTTWt5Y0M2M3huWTRzbUUyVzJteVBVeW9oTzg3d0IyTDZ6T2l5NVEyYTgwYjB0R0xRalpzbWRET3JJc1hKMDUycXRpeldwOTVMd3VZaGh3bWdoVm5HL0czdUo4Nmc5M05YTzU1YURrY1hlN29JSU9TN1BxRE93c3VJcE9jWlhWRGZvRXc9PSIsIm1hYyI6IjIyOGI0MDU4OGUwYjY1NTlmZjI5OGIwNGQ4OTM1NTMwYTgyNjE5NmYwYzhjYThlOTU1ODc1OGQ3NDdiMzYyNTEiLCJ0YWciOiIifQ==', '2025-11-09 02:50:04', NULL, '2025-11-08 16:42:16', '2025-11-09 02:50:04', 7000000, 'pending', NULL, 0, NULL),
(63, 'bug bag', 'occupythenettt@gmail.com', NULL, 'customer', NULL, '284866', '2025-11-09 02:52:02', '$2y$12$5PxrPKeKP3mz8VknN/ppS.U/7GPg5pU8k0.vspN6ObnZJCcyvqa3S', NULL, NULL, NULL, NULL, '2025-11-09 02:22:47', '2025-11-09 02:37:02', 70000001, 'pending', NULL, 0, NULL),
(64, 'shirima', 'shirima@gmail.com', NULL, 'special_hire', NULL, NULL, NULL, '$2y$12$F/yDZlKhNSDoSAhv98DqCOE89QtrUaOAriTIHBTtEZyXvVZgeBYx6', NULL, NULL, NULL, NULL, '2025-12-19 02:36:42', '2025-12-19 02:36:42', 628042409, 'accept', NULL, 0, NULL),
(65, 'ibrahim', 'driver@gmail.com', NULL, 'driver', NULL, NULL, NULL, '$2y$12$QIx6ScdJZ6bJ7Cki8dbsH.sAJmUh1fR5MLHtZZ9T47J843VXyrhKq', NULL, NULL, NULL, NULL, '2025-12-20 05:02:20', '2025-12-20 05:02:20', 628042409, 'pending', NULL, 0, NULL),
(66, 'ibrahim', 'driver2@gmail.com', NULL, 'driver', NULL, NULL, NULL, '$2y$12$jZaFiguZX5DQaIhY0oM2XOOi5qVWQKXpS79RQ8t8zgev0HbFA0peO', NULL, NULL, NULL, NULL, '2025-12-20 05:14:34', '2025-12-20 05:14:34', 628042409, 'pending', NULL, 0, NULL),
(67, 'ibrahim', 'driver3@gmail.com', NULL, 'driver', NULL, NULL, NULL, '$2y$12$4scOxMQYk.N3i1XRU8tSsetTEZZhDdr/xFufEfKWsEkABMe9X/wPO', NULL, NULL, NULL, NULL, '2025-12-20 05:33:33', '2025-12-20 05:33:33', 628042409, 'pending', NULL, 0, NULL),
(68, 'msangi', 'msangi@gmail.com', '628042409', 'customer', NULL, NULL, NULL, '$2y$12$5AR1B2If1uZ5AcqEddkQ/.L.GKldVsB4zDW.Xg36Q0z6LzE0wArEC', NULL, NULL, NULL, NULL, '2025-12-20 09:05:06', '2025-12-20 09:58:24', 628042409, 'pending', NULL, 0, NULL),
(69, 'Amina kidege', 'akakoyi@gmail.com', '071212121212', 'customer', NULL, NULL, NULL, '$2y$12$yLclbgDEdOWAXYeoza.tk.1PIY/1ZC2zl0ajrYDOI3YaLZ.A5cspu', NULL, NULL, NULL, NULL, '2025-12-20 12:24:29', '2025-12-20 12:24:29', 0, 'pending', NULL, 0, NULL),
(70, 'ibrahim', 'abdul1@gmail.com', NULL, 'driver', NULL, NULL, NULL, '$2y$12$qq/N5lJk320hjSmza9w1P.YjiqIRQrY0q7AfhRDFfkZwAmo9OzPb.', NULL, NULL, NULL, NULL, '2025-12-20 12:31:03', '2025-12-20 12:31:03', 628042409, 'pending', NULL, 0, NULL),
(71, 'Thomas Paul', 'highlink-hq@hotmail.com', NULL, 'customer', NULL, NULL, NULL, '$2y$12$UEbzQ/yihwCZYF0pqESvcO/wMswLMH7wi7AGQfkbCoKZm69S7LrZu', NULL, NULL, NULL, NULL, '2025-12-25 16:53:21', '2025-12-25 16:53:21', 715020945, 'pending', NULL, 0, NULL),
(72, 'john Subaru', 'subaru49@gmail.com', NULL, 'customer', NULL, NULL, NULL, '$2y$12$Grd4ZYxR6w1.ETU7QNTvGuDsCwd.b6R7l4o8voqjgv2hv8cLDfUpC', NULL, NULL, NULL, NULL, '2025-12-29 01:32:54', '2025-12-29 01:32:54', 777667557, 'pending', NULL, 0, NULL),
(75, 'ibrahim ashiraf', 'msangi2002@gmail.com', NULL, 'vender', NULL, NULL, NULL, '$2y$12$vGaBBiDV78oEv8kfz1sT7esLz1VzlQNrtDLUBFNsvXGww7FDuDFye', 'eyJpdiI6InpnektlZ0wvSTVQeDVISDNtbVlXWFE9PSIsInZhbHVlIjoiMEJBMVhETVhoWHcrVVV6a1VRai9sM1ZKQ0hOcTlNdngyaUdPbTlHQVJxbz0iLCJtYWMiOiJjMmI3YTZlMTM2Y2ZkMGEyZTk2MTFmZDE4ZmQ5Y2E2YjQzMzhjODUwZWEyMzM0Y2JjZDZkY2NhOTEzNDYzODVjIiwidGFnIjoiIn0=', 'eyJpdiI6Ild0NHZORXhhMDNzczBVWmhlbHdxeWc9PSIsInZhbHVlIjoiWHpJNmNVMmtoZTJXcjdxUm5zdzJtamt3c0UzenEvMTZVQm1MbkV6bmt0bHdxYmJ3NGFsc1FzNDJKMXQ4TzBpTG5xT25ZUkxUWDFmZmNlSy9BMXdXK1g0bnFRVWs5WWxwSW9pV1NCdytoR3ZYNFhXLzN0Rzg0amFqdWtyaC84YlJjMUVNYzFMbENtKytScVZGcmljZzBNWkExWklDOTdQUEw4MHNuTGlaZFozbDR4c3FPVUx6Zm9kdzdiY0tHODd2c2VPRmRGK3h4R0pmSTVXZTZEMndja0dVV1hTMmRWdHJJZG0xVVIvV25yVUZock43R0pvZkhBTlpUYVpYZGRlN0QrdjJ5dk5mcXBlL3dVOVZ4bG5lZEE9PSIsIm1hYyI6IjJmN2Q3ZTY1NDVhOTI4NTUxNTA3MTViMGRiNGRjODVmNGJlMmQ4MmU4NDQ1NzlkMjM3OGIwZThlNWVhOWQ1NjciLCJ0YWciOiIifQ==', NULL, 'in3Tysaci6vZ2IwMYjyTJAJncnXLJ2VyRLmTh8We2RPDd74GGWVLlzKUpmsX', '2026-02-02 19:55:44', '2026-02-22 16:23:52', 696646570, 'accept', NULL, 0, NULL),
(78, 'ibrareverbo', 'ibrareverbo@gmail.com', NULL, 'customer', NULL, '420187', '2026-02-22 17:34:42', '$2y$12$HcniV.T/Vd5Q/BI9rLSwfOOlTlZPH0o.Y8LihclToCxx3lDlzgDla', NULL, NULL, NULL, 'PBb7SqoRMvTjzooxNhIOV8HSX4cjnViUD3XMPven0gWCbUQ5kDg7j7NVF8BP', '2026-02-22 17:19:18', '2026-02-22 17:19:42', 696646570, 'accept', NULL, 0, NULL),
(79, 'Shafii Ramadhani', 'shafii@demo.com', NULL, 'customer', NULL, NULL, NULL, '$2y$12$7o29t7h4URXDeY1VSVFlC.YCeIw/.3EQjkwkF8EiUAc/QERgLPuQa', NULL, NULL, NULL, NULL, '2026-02-22 17:42:38', '2026-02-22 17:42:38', 715100100, 'accept', NULL, 0, NULL),
(80, 'Mariam Shafii', 'mariamshafii@gmail.com', NULL, 'customer', NULL, NULL, NULL, '$2y$12$o1ZDgeVpnDreY6v4VVsRCu0OMSzR1PG2j00vhjgkLfFW4I8WGQBbC', NULL, NULL, NULL, NULL, '2026-02-24 01:19:34', '2026-02-24 01:19:34', 710200300, 'accept', NULL, 0, NULL),
(81, 'ThomasTom', 'thomas@demo.com', NULL, 'vender', NULL, NULL, NULL, '$2y$12$56S7gzWD2Q.81thwiw0m3.PQNGv733SJCTY1kEcvU2R3jAPus1xVm', 'eyJpdiI6IloySzdjSUJ1QWRaS1VXNE5ySy9BZXc9PSIsInZhbHVlIjoiM25PVXgyTUFqbW9ibklER2wvcFlhTXhUZjRTS3NocGxBSFNwUVUwYmlrWT0iLCJtYWMiOiI3YjNhMjNmNTZmOGJkYzYyNDU3OTBkODViYjJkMjI2Nzc3ZjQ3NGZmNjgxZDU4ZmRmNjdmYzhiOTA5OTI1M2YyIiwidGFnIjoiIn0=', 'eyJpdiI6IkxkaUhrZCtNeHF2dXQzSFpBT20rT1E9PSIsInZhbHVlIjoiZlpmczYydUtFZHpnVUpNWTB0QXZVcnpTVXFlLzBYVkQ2azhDb1JRUHg1Ri9CTmhwSUZ4MHpsajRRbklUZ1YwY1d2bFV4NnFXdjRCUjhGN2gwdzFQUWtNOGRnUlgwbHI0eU1SSUpjVXh1YVN2NkdSRHlUNEV0ZzNuQWx3OTUwQWJBdjdtY0E5NlFVeHlIVWU4cVltenMzZ0hrVzVJK1ZESi9JeXBZcm5QZVpnZDRJTXYzbzAxZFFzRlArMUdWSkVDdEtKMDVUUm1IcVN0UlgrdHhXNnVDREVSK01IM3M1QXNXeU9JdDB6OGpHS1VwOTJWU1pxQVNzRHpjWm51bk1QWlFHNEpoVUJtWDdUT3ZhMkNFSWllTnc9PSIsIm1hYyI6IjBjNTIyYWRkZTQ5Nzk0YjM1OWRmMDBmNTg3NDMzOTE5ODE3ZWY5ZDk4MzA0NDZmODY1YmIyOGRmYmE4ZGM1MDciLCJ0YWciOiIifQ==', '2026-02-27 02:20:08', NULL, '2026-02-24 15:49:53', '2026-02-27 02:20:08', 610100100, 'accept', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vender_account`
--

CREATE TABLE `vender_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tin` varchar(255) DEFAULT NULL,
  `house_number` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `altenative_number` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_number` varchar(255) DEFAULT NULL,
  `percentage` int(11) DEFAULT 0,
  `work` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vender_account`
--

INSERT INTO `vender_account` (`id`, `user_id`, `tin`, `house_number`, `street`, `town`, `city`, `province`, `country`, `altenative_number`, `bank_name`, `bank_number`, `percentage`, `work`, `created_at`, `updated_at`) VALUES
(1, 37, '1000000', '56', 'mjini', 'Dar es salaam', 'Dar es salaam', 'ilala', 'Tanzania', '5646757478', 'NMB', '8866999278', 40, 'mombo', '2025-06-05 10:36:24', '2025-07-29 14:34:54'),
(2, 41, '123456789', '21', 'Kibangu', 'Dar Es Salaam', 'Dar Es Salaam', 'Dar es Salaam', 'Tanzania', '0765553953', 'NMB', '123456789', 10, '', '2025-06-08 19:32:14', '2025-06-25 07:21:57'),
(3, 81, '10002000', '23', 'Kisiwani', 'Dar Es Salaam', 'Ubungo', 'Dar Es Salaam', 'Tanzania', '0720100200', 'CRDB', '100012909009', 0, 'Mbezi', '2026-02-25 21:14:56', '2026-02-25 16:14:56');

-- --------------------------------------------------------

--
-- Table structure for table `vender_balances`
--

CREATE TABLE `vender_balances` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `user_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT 'Create Time',
  `updated_at` varchar(255) DEFAULT NULL,
  `fees` int(11) DEFAULT 0,
  `payment_number` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vender_balances`
--

INSERT INTO `vender_balances` (`id`, `user_id`, `amount`, `created_at`, `updated_at`, `fees`, `payment_number`) VALUES
(1, 37, 33439, '2025-05-12 23:22:24', '2026-02-09 14:20:57', 0, 628042409),
(2, 39, 0, '2025-05-17 04:35:26', '2025-05-17 04:35:26', 0, NULL),
(3, 41, 0, '2025-06-08 22:30:31', '2025-06-08 22:32:14', 0, 715553803),
(4, 42, 10, '2025-06-12 16:00:01', '2025-06-12 16:51:03', 0, NULL),
(5, 75, 0, '2026-02-02 14:55:44', '2026-02-02 14:55:44', 0, NULL),
(6, 81, -3224, '2026-02-24 10:49:53', '2026-02-26 22:22:11', 0, 765553953);

-- --------------------------------------------------------

--
-- Table structure for table `vender_transactions`
--

CREATE TABLE `vender_transactions` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `vender_balance_id` int(11) NOT NULL COMMENT 'Vender Balance ID',
  `transaction_id` int(11) NOT NULL COMMENT 'Transaction ID',
  `amount` decimal(10,2) NOT NULL COMMENT 'Transaction Amount',
  `created_at` datetime DEFAULT NULL COMMENT 'Create Time',
  `updated_at` datetime DEFAULT NULL COMMENT 'Create Time'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vender_transactions`
--

INSERT INTO `vender_transactions` (`id`, `vender_balance_id`, `transaction_id`, `amount`, `created_at`, `updated_at`) VALUES
(2, 1, 11, 100.00, '2025-05-13 00:22:37', '2025-05-13 00:22:37');

-- --------------------------------------------------------

--
-- Table structure for table `via`
--

CREATE TABLE `via` (
  `id` int(11) NOT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `via`
--

INSERT INTO `via` (`id`, `bus_id`, `route_id`, `name`, `created_at`, `updated_at`) VALUES
(22, 16, 20, 'Mbezi', '2025-05-06 19:35:02', '2025-05-06 22:35:02'),
(24, 19, 23, 'Chalinze', '2025-05-11 19:46:26', '2025-05-24 09:16:13'),
(5, 6, 10, 'Morogoro Road', '2025-04-23 08:28:31', '2025-04-23 11:28:31'),
(6, 6, 10, 'Morogoro Road', '2025-04-23 08:30:00', '2025-04-23 11:30:00'),
(21, 15, 19, 'Bagamoyo', '2025-05-06 19:02:08', '2025-05-06 22:02:08'),
(20, 15, 19, 'Bagamoyo', '2025-05-06 19:00:20', '2025-05-06 22:00:20'),
(9, 8, 12, 'Morogoro Road', '2025-04-26 11:20:18', '2025-04-26 14:20:18'),
(10, 8, 12, 'Morogoro Road', '2025-04-26 11:21:32', '2025-04-26 14:21:32'),
(19, 14, 18, 'Morogoro', '2025-05-06 16:29:46', '2025-05-06 19:29:46'),
(12, 9, 13, 'Magu', '2025-05-02 11:01:59', '2025-05-02 14:01:59'),
(13, 9, 13, 'Magu', '2025-05-03 09:01:29', '2025-05-03 12:01:29'),
(14, 9, 13, 'Magu', '2025-05-03 09:09:17', '2025-05-03 12:09:17'),
(15, 10, 14, 'Tinde', '2025-05-04 02:34:17', '2025-05-04 05:34:17'),
(16, 11, 15, 'Bagamoyo', '2025-05-05 01:01:13', '2025-05-05 04:01:13'),
(17, 12, 16, 'Mbezi', '2025-05-05 01:49:00', '2025-05-05 04:49:00'),
(25, 18, 22, 'Chalinze', '2025-05-17 06:23:41', '2025-05-17 19:51:02'),
(26, 21, 25, 'Chalinze', '2025-05-18 01:54:55', '2025-05-18 04:54:55'),
(28, 28, 32, 'Morogoro', '2025-05-31 00:51:52', '2025-05-31 03:51:52'),
(29, 26, 30, 'Chalinze', '2025-05-31 01:34:33', '2025-05-31 04:34:33'),
(30, 29, 33, 'Arusha Road', '2025-06-01 08:12:31', '2025-06-01 11:12:31'),
(31, 27, 31, 'php', '2025-06-07 22:18:08', '2025-06-08 01:18:08'),
(32, 30, 34, 'Singida', '2025-06-08 01:07:37', '2025-06-08 04:07:37'),
(33, 24, 28, 'Singida', '2025-06-08 12:40:28', '2025-06-08 15:40:28'),
(34, 32, 36, 'Shinyanga road', '2025-06-14 20:22:19', '2025-06-14 23:22:19'),
(35, 33, 37, 'Morogoro Road', '2025-06-15 14:03:22', '2025-06-15 17:03:22'),
(36, 36, 40, 'Morogoro', '2025-07-30 08:16:11', '2025-07-30 11:16:11'),
(37, 35, 39, 'Morogoro Road', '2025-08-01 08:42:35', '2025-08-01 11:42:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_transactions`
--
ALTER TABLE `admin_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet`
--
ALTER TABLE `admin_wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `balances`
--
ALTER TABLE `balances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bima`
--
ALTER TABLE `bima`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `booking_code` (`booking_code`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus_owner_account`
--
ALTER TABLE `bus_owner_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campanies`
--
ALTER TABLE `campanies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancelled_bookings`
--
ALTER TABLE `cancelled_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coasters`
--
ALTER TABLE `coasters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coasters_driver_user_id_index` (`driver_user_id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parcels`
--
ALTER TABLE `parcels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parcel_number` (`parcel_number`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_fees`
--
ALTER TABLE `payment_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund`
--
ALTER TABLE `refund`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_percentages`
--
ALTER TABLE `refund_percentages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roundtrip`
--
ALTER TABLE `roundtrip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bus_id` (`bus_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `special_hire_orders`
--
ALTER TABLE `special_hire_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `special_hire_pricing`
--
ALTER TABLE `special_hire_pricing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `special_hire_pricing_coaster_id_foreign` (`coaster_id`);

--
-- Indexes for table `stend`
--
ALTER TABLE `stend`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `system_balance`
--
ALTER TABLE `system_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_wallets`
--
ALTER TABLE `temp_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vender_account`
--
ALTER TABLE `vender_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vender_balances`
--
ALTER TABLE `vender_balances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vender_transactions`
--
ALTER TABLE `vender_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `via`
--
ALTER TABLE `via`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access`
--
ALTER TABLE `access`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `admin_transactions`
--
ALTER TABLE `admin_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_wallet`
--
ALTER TABLE `admin_wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `balances`
--
ALTER TABLE `balances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `bima`
--
ALTER TABLE `bima`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=788;

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `bus_owner_account`
--
ALTER TABLE `bus_owner_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `campanies`
--
ALTER TABLE `campanies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `cancelled_bookings`
--
ALTER TABLE `cancelled_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `coasters`
--
ALTER TABLE `coasters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `parcels`
--
ALTER TABLE `parcels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_fees`
--
ALTER TABLE `payment_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=661;

--
-- AUTO_INCREMENT for table `refund`
--
ALTER TABLE `refund`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `refund_percentages`
--
ALTER TABLE `refund_percentages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roundtrip`
--
ALTER TABLE `roundtrip`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1275;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `special_hire_orders`
--
ALTER TABLE `special_hire_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `special_hire_pricing`
--
ALTER TABLE `special_hire_pricing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stend`
--
ALTER TABLE `stend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system_balance`
--
ALTER TABLE `system_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `temp_wallets`
--
ALTER TABLE `temp_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `vender_account`
--
ALTER TABLE `vender_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vender_balances`
--
ALTER TABLE `vender_balances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vender_transactions`
--
ALTER TABLE `vender_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `via`
--
ALTER TABLE `via`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `special_hire_pricing`
--
ALTER TABLE `special_hire_pricing`
  ADD CONSTRAINT `special_hire_pricing_coaster_id_foreign` FOREIGN KEY (`coaster_id`) REFERENCES `coasters` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
