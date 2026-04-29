-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2026 at 09:59 AM
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
-- Database: `uks_project_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `activity_type` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `old_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_data`)),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-admin@gmail.com|127.0.0.1', 'i:1;', 1777444854),
('laravel-cache-admin@gmail.com|127.0.0.1:timer', 'i:1777444854;', 1777444854);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kunjungans`
--

CREATE TABLE `kunjungans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_kunjungan` date NOT NULL,
  `keluhan` text NOT NULL,
  `diagnosa` text DEFAULT NULL,
  `tindakan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kunjungans`
--

INSERT INTO `kunjungans` (`id`, `siswa_id`, `user_id`, `tanggal_kunjungan`, `keluhan`, `diagnosa`, `tindakan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2026-04-22', 'Mual,muntah,pusing', NULL, 'sarapan dan diberi paracetamol karena pusing', '2026-04-22 00:41:30', '2026-04-22 00:41:30'),
(3, 3, 1, '2026-04-22', 'Sakit maag', NULL, 'Obat maag dan minum yang cukup', '2026-04-22 07:33:38', '2026-04-22 07:33:38'),
(5, 1, 1, '2026-04-24', 'muntah', NULL, 'istirahat', '2026-04-24 04:21:13', '2026-04-24 04:21:13');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2023_01_01_000000_create_roles_table', 1),
(2, '2023_01_01_000001_create_users_table', 1),
(3, '2023_01_01_000002_create_siswas_table', 1),
(4, '2023_01_01_000003_create_obats_table', 1),
(5, '2023_01_01_000004_create_kunjungans_table', 1),
(6, '2023_01_01_000005_create_obat_masuks_table', 1),
(7, '2023_01_01_000006_create_obat_keluars_table', 1),
(8, '2023_01_01_000007_create_activity_log_table', 1),
(9, '2026_04_13_172659_create_sessions_table', 1),
(10, '2026_04_13_182311_create_cache_table', 1),
(11, '2026_04_21_233930_add_details_to_siswas_table', 1),
(12, '2026_04_22_004110_add_foto_to_siswas_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `obats`
--

CREATE TABLE `obats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_obat` varchar(255) NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `expired_date` date DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `obats`
--

INSERT INTO `obats` (`id`, `kode_obat`, `nama_obat`, `satuan`, `stok`, `expired_date`, `foto`, `created_at`, `updated_at`) VALUES
(1, 'OBT-7795', 'Vitamin C', 'Tablet', 60, '2027-04-18', 'foto-obat/PCjVJYtuQYKAtmyJqw3hSFC4ypgh4Mqm7u4QVunH.png', '2026-04-21 16:47:41', '2026-04-28 01:20:24'),
(4, 'OBT-2866', 'Panadol Merah', 'Strip', 35, '2027-06-20', 'foto-obat/xt8Kk4aDcP6sg3kuYcxihjQQ1BY3ieUfbIrNoyyv.png', '2026-04-21 16:47:41', '2026-04-28 01:23:15'),
(5, 'OBT-71205', 'Promag obat maag', 'Strip', 200, '2027-12-15', 'foto-obat/lWhrHPRXd3ugPOWaPr971d8q8jKa0NdqGuBeqbOA.png', '2026-04-21 16:47:41', '2026-04-28 01:22:39'),
(7, 'OBT-19329', 'Panadol biru', 'Tablet', 92, '2026-12-15', 'foto-obat/eyf3UHqhrJBa4nB2kDQYD54dqrWfBGNlDv6RDmLe.png', '2026-04-21 16:47:41', '2026-04-28 01:21:43'),
(8, 'OBT-88353', 'Betadine', 'Botol', 100, '2027-07-22', 'foto-obat/BAsFN2YLSO51DQszWPThKwJw60ZwEVwV1Nxp4WVT.png', '2026-04-21 16:47:41', '2026-04-28 01:24:17'),
(9, 'OBT-92564', 'Plester', 'Strip', 83, '2028-03-28', 'foto-obat/9GLsbR6fgzLjxOfTbUbapRPzw5LMYVivaxCPB5Pw.png', '2026-04-21 16:47:41', '2026-04-28 01:25:59'),
(10, 'OBT-75962', 'Tablet Tambah Darah', 'Kapsul', 109, '2027-03-13', 'foto-obat/SSDzqvzyxQcBnguzZBS772UXRzH1If1jFXSC6iTk.png', '2026-04-21 16:47:41', '2026-04-28 01:27:42'),
(11, 'OBT-18235', 'Obat Batuk Berdahak', 'Botol', 161, '2026-08-12', 'foto-obat/NVU8dEHtvAegkZflMMfSZV7WOWKGikHWdmpfyjzy.png', '2026-04-21 16:47:41', '2026-04-28 01:29:13'),
(12, 'OBT-94877', 'Komix Batuk Pilek', 'Sachet', 101, '2027-06-01', 'foto-obat/GHCVHxdjXUfFTh8oeCJmUX2EBKT4rCmqT4LlAc4U.png', '2026-04-21 16:47:41', '2026-04-28 01:34:23'),
(47, 'OBT-93965', 'sed Obat Batuk', 'Kapsul', 141, '2026-06-29', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(48, 'OBT-89168', 'dolorem Vitamin C', 'Tablet', 49, '2028-01-20', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(49, 'OBT-72802', 'ea Paracetamol', 'Botol', 142, '2027-12-25', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(50, 'OBT-95132', 'molestias Vitamin C', 'Botol', 140, '2026-07-01', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(51, 'OBT-85355', 'sint Paracetamol', 'Tablet', 83, '2027-04-12', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(52, 'OBT-18617', 'voluptatem Vitamin C', 'Kapsul', 96, '2026-08-02', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(53, 'OBT-36390', 'ut Paracetamol', 'Kapsul', 118, '2027-06-14', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(54, 'OBT-85055', 'maiores Paracetamol', 'Tablet', 113, '2027-01-07', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(55, 'OBT-49875', 'a Amoxicillin', 'Botol', 83, '2028-02-10', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(56, 'OBT-66848', 'ut Vitamin C', 'Botol', 60, '2027-09-14', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(57, 'OBT-14759', 'similique Obat Batuk', 'Tablet', 149, '2027-12-20', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(58, 'OBT-97198', 'et Paracetamol', 'Botol', 38, '2027-03-11', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(59, 'OBT-2760', 'error Amoxicillin', 'Kapsul', 67, '2027-01-11', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(60, 'OBT-39122', 'vel Amoxicillin', 'Kapsul', 123, '2027-09-04', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(61, 'OBT-19692', 'sed Paracetamol', 'Strip', 42, '2027-07-01', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(62, 'OBT-42658', 'voluptates Vitamin C', 'Botol', 179, '2027-08-26', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(63, 'OBT-95392', 'quia Vitamin C', 'Strip', 147, '2028-03-07', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(64, 'OBT-29068', 'eos Obat Batuk', 'Kapsul', 145, '2027-12-02', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(65, 'OBT-27870', 'quia Amoxicillin', 'Botol', 176, '2026-06-16', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(66, 'OBT-18641', 'eos Paracetamol', 'Tablet', 14, '2028-01-17', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(67, 'OBT-63389', 'ut Paracetamol', 'Kapsul', 156, '2027-11-19', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(68, 'OBT-8650', 'veritatis Obat Batuk', 'Strip', 118, '2027-10-07', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(69, 'OBT-17589', 'doloremque Paracetamol', 'Kapsul', 192, '2028-01-31', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(70, 'OBT-3730', 'quo Obat Batuk', 'Strip', 64, '2027-07-05', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(71, 'OBT-8314', 'corporis Paracetamol', 'Tablet', 175, '2028-03-20', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(72, 'OBT-79376', 'optio Obat Batuk', 'Strip', 131, '2027-05-09', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(73, 'OBT-19114', 'repudiandae Vitamin C', 'Strip', 51, '2026-07-24', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(74, 'OBT-56483', 'ipsam Amoxicillin', 'Botol', 198, '2028-03-22', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(75, 'OBT-2498', 'aut Amoxicillin', 'Botol', 61, '2026-11-09', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(76, 'OBT-25475', 'ex Paracetamol', 'Botol', 123, '2028-01-22', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(77, 'OBT-16350', 'quibusdam Paracetamol', 'Strip', 39, '2027-09-02', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(78, 'OBT-16333', 'deserunt Vitamin C', 'Tablet', 15, '2028-01-29', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(79, 'OBT-53483', 'ullam Paracetamol', 'Tablet', 70, '2026-10-06', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(80, 'OBT-44961', 'esse Vitamin C', 'Botol', 163, '2028-02-11', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(81, 'OBT-9114', 'assumenda Amoxicillin', 'Strip', 54, '2028-01-26', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(82, 'OBT-58423', 'et Amoxicillin', 'Botol', 166, '2027-03-04', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(83, 'OBT-239', 'iusto Obat Batuk', 'Kapsul', 151, '2027-05-10', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(84, 'OBT-52885', 'ut Obat Batuk', 'Tablet', 151, '2027-11-06', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(85, 'OBT-31803', 'consequatur Vitamin C', 'Botol', 102, '2027-12-01', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(86, 'OBT-17533', 'est Vitamin C', 'Botol', 25, '2028-04-19', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(87, 'OBT-46924', 'quia Obat Batuk', 'Botol', 55, '2027-06-28', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(88, 'OBT-24051', 'fugit Amoxicillin', 'Tablet', 139, '2027-09-09', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(89, 'OBT-80168', 'amet Amoxicillin', 'Botol', 120, '2028-01-25', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(90, 'OBT-8968', 'nihil Paracetamol', 'Kapsul', 152, '2028-01-29', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(91, 'OBT-71180', 'dolores Paracetamol', 'Tablet', 69, '2026-07-01', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(92, 'OBT-36723', 'sit Amoxicillin', 'Tablet', 87, '2027-04-03', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(93, 'OBT-73521', 'possimus Amoxicillin', 'Kapsul', 110, '2027-01-10', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(94, 'OBT-97283', 'temporibus Amoxicillin', 'Tablet', 52, '2027-08-02', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(95, 'OBT-71579', 'non Amoxicillin', 'Kapsul', 86, '2027-03-10', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(96, 'OBT-42515', 'ipsum Obat Batuk', 'Botol', 200, '2027-03-09', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(97, 'OBT-83745', 'architecto Obat Batuk', 'Tablet', 153, '2026-09-15', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(98, 'OBT-39850', 'dicta Paracetamol', 'Tablet', 127, '2027-11-15', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(99, 'OBT-98054', 'minima Vitamin C', 'Kapsul', 65, '2027-05-09', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41'),
(100, 'OBT-99340', 'aliquam Obat Batuk', 'Kapsul', 148, '2027-06-28', NULL, '2026-04-21 16:47:41', '2026-04-21 16:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `obat_keluars`
--

CREATE TABLE `obat_keluars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `obat_id` bigint(20) UNSIGNED NOT NULL,
  `kunjungan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `obat_masuks`
--

CREATE TABLE `obat_masuks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `obat_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2026-04-21 16:47:38', '2026-04-21 16:47:38'),
(2, 'petugas', 'Petugas UKS', '2026-04-21 16:47:38', '2026-04-21 16:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('E6KshlKrbrPIFHR97DJOePJaigSbX9XheAWukMeN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic25mblNiWVVDM0hYUGVEZUxDSHVaTXQzVEprVkNycGFrcVA2elQ3NiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMSI7czo1OiJyb3V0ZSI7Tjt9fQ==', 1777448897);

-- --------------------------------------------------------

--
-- Table structure for table `siswas`
--

CREATE TABLE `siswas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nisn` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `kelas` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(255) NOT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswas`
--

INSERT INTO `siswas` (`id`, `nisn`, `nama`, `foto`, `kelas`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `no_telepon`, `created_at`, `updated_at`) VALUES
(1, '0096664277', 'ADITYA WIRIA ATMAJA', 'siswa/FzNuSUKGrtFtIGehpoGeMqXlu5qjY8KkvH9pkKiL.jpg', 'XI RPL A', 'L', 'Bandung', '2009-03-25', 'Alamat Aditya No. 1', '081234567890', '2026-04-21 17:00:05', '2026-04-22 07:19:49'),
(3, '0087985977', 'AHMAD ALIF FADILLAH', 'siswa/X2FNvE5CPeTV9ZsL5CThnc4ArqBnJpPCoPtlBVP5.jpg', 'XI RPL A', 'L', 'Bandung', '2008-02-26', 'Alamat Ahmad No. 3', '081234567892', '2026-04-21 17:00:05', '2026-04-28 01:16:46'),
(4, '0083930412', 'ALRIZKY FILARDHI BUDIMAN', 'siswa/gA7K3x75rrzDyatP5hYfqmgtZ2Bob427vUoXYuVI.jpg', 'XI RPL A', 'L', 'Bandung', '2008-12-14', 'Alamat Alrizky No. 4', '081234567893', '2026-04-21 17:00:05', '2026-04-22 07:18:18'),
(5, '0095794387', 'AULIA FADHILLAH', NULL, 'XI RPL A', 'P', 'Bandung', '2009-01-12', 'Alamat Aulia No. 5', '081234567894', '2026-04-21 17:00:05', '2026-04-21 17:22:10'),
(6, '0095794389', 'NAILA NUR AINI MULYAWATI', NULL, 'XI RPL A', 'P', 'BANDUNG', '2026-02-24', 'KEBON KOPI', '0812345678917', '2026-04-24 04:44:35', '2026-04-24 04:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 2,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin User', 'admin@example.com', NULL, '$2y$12$U5zL3bdOU9HcCp6M5D07P.dbUkj.M4dPjO.jdotZMth46YWeQCdyO', NULL, '2026-04-21 16:47:38', '2026-04-21 16:47:38'),
(2, 2, 'Petugas UKS', 'petugas@example.com', NULL, '$2y$12$UgFwS6LY.9oZcS8t9XyW4.CR0QYu2RQeOhkhVkAh7PY6hh08fOC3e', NULL, '2026-04-21 16:47:38', '2026-04-21 16:47:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_user_id_foreign` (`user_id`),
  ADD KEY `activity_log_subject_type_subject_id_index` (`subject_type`,`subject_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `kunjungans`
--
ALTER TABLE `kunjungans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kunjungans_siswa_id_foreign` (`siswa_id`),
  ADD KEY `kunjungans_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obats`
--
ALTER TABLE `obats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `obats_kode_obat_unique` (`kode_obat`);

--
-- Indexes for table `obat_keluars`
--
ALTER TABLE `obat_keluars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obat_keluars_obat_id_foreign` (`obat_id`),
  ADD KEY `obat_keluars_kunjungan_id_foreign` (`kunjungan_id`);

--
-- Indexes for table `obat_masuks`
--
ALTER TABLE `obat_masuks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obat_masuks_obat_id_foreign` (`obat_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `siswas`
--
ALTER TABLE `siswas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `siswas_nisn_unique` (`nisn`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kunjungans`
--
ALTER TABLE `kunjungans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `obats`
--
ALTER TABLE `obats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `obat_keluars`
--
ALTER TABLE `obat_keluars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `obat_masuks`
--
ALTER TABLE `obat_masuks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `siswas`
--
ALTER TABLE `siswas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `activity_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kunjungans`
--
ALTER TABLE `kunjungans`
  ADD CONSTRAINT `kunjungans_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kunjungans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `obat_keluars`
--
ALTER TABLE `obat_keluars`
  ADD CONSTRAINT `obat_keluars_kunjungan_id_foreign` FOREIGN KEY (`kunjungan_id`) REFERENCES `kunjungans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `obat_keluars_obat_id_foreign` FOREIGN KEY (`obat_id`) REFERENCES `obats` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `obat_masuks`
--
ALTER TABLE `obat_masuks`
  ADD CONSTRAINT `obat_masuks_obat_id_foreign` FOREIGN KEY (`obat_id`) REFERENCES `obats` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
