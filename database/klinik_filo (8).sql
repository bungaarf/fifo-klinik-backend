-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2025 at 04:40 PM
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
-- Database: `klinik_filo`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dokters`
--

CREATE TABLE `dokters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `spesialisasi` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dokters`
--

INSERT INTO `dokters` (`id`, `user_id`, `nama`, `spesialisasi`, `created_at`, `updated_at`) VALUES
(6, 22, 'dr. Mutia', 'Dokter Umum', '2025-08-04 16:14:29', '2025-08-04 16:14:29'),
(7, 23, 'dr. Hilsa', 'Dokter Umum', '2025-08-04 16:19:02', '2025-08-04 16:19:02'),
(8, 24, 'dr. Agla', 'Dokter Umum', '2025-08-04 16:26:02', '2025-08-04 16:26:02'),
(9, 25, 'dr. Ilham', 'Dokter Umum', '2025-08-04 16:29:07', '2025-08-04 16:29:07'),
(10, 19, 'dr. Sri', 'Dokter Gigi', '2025-08-04 16:32:45', '2025-08-04 16:32:45'),
(11, 20, 'Sindi Royentika', 'Kebidanan', '2025-08-04 16:36:26', '2025-08-04 16:36:26'),
(13, 46, 'dr. Bina', 'Dokter Umum', '2025-08-12 12:38:39', '2025-08-12 12:38:39');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_dokters`
--

CREATE TABLE `jadwal_dokters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dokter_id` bigint(20) UNSIGNED NOT NULL,
  `hari` varchar(255) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwal_dokters`
--

INSERT INTO `jadwal_dokters` (`id`, `dokter_id`, `hari`, `jam_mulai`, `jam_selesai`, `created_at`, `updated_at`) VALUES
(25, 6, 'Sabtu', '08:00:00', '15:00:00', '2025-08-04 16:17:17', '2025-08-04 16:17:17'),
(26, 6, 'Selasa', '15:00:00', '21:00:00', '2025-08-04 16:18:32', '2025-08-04 16:18:32'),
(27, 6, 'Kamis', '15:00:00', '21:00:00', '2025-08-04 16:18:37', '2025-08-04 16:18:37'),
(28, 6, 'Jumat', '15:00:00', '21:00:00', '2025-08-04 16:18:40', '2025-08-04 16:18:40'),
(34, 7, 'Rabu', '15:00:00', '21:00:00', '2025-08-04 16:23:35', '2025-08-04 16:23:35'),
(35, 7, 'Senin', '08:00:00', '15:00:00', '2025-08-04 16:23:43', '2025-08-04 16:23:43'),
(36, 7, 'Selasa', '08:00:00', '15:00:00', '2025-08-04 16:23:47', '2025-08-04 16:23:47'),
(37, 7, 'Kamis', '08:00:00', '15:00:00', '2025-08-04 16:23:52', '2025-08-04 16:23:52'),
(38, 7, 'Jumat', '08:00:00', '15:00:00', '2025-08-04 16:23:57', '2025-08-04 16:23:57'),
(39, 8, 'Senin', '15:00:00', '21:00:00', '2025-08-04 16:28:01', '2025-08-04 16:28:01'),
(40, 9, 'Sabtu', '15:00:00', '21:00:00', '2025-08-04 16:38:58', '2025-08-04 16:38:58'),
(41, 10, 'Selasa', '08:00:00', '21:00:00', '2025-08-04 16:39:37', '2025-08-04 16:39:37'),
(42, 10, 'Rabu', '08:00:00', '21:00:00', '2025-08-04 16:39:40', '2025-08-04 16:39:40'),
(43, 10, 'Kamis', '08:00:00', '21:00:00', '2025-08-04 16:39:43', '2025-08-04 16:39:43'),
(44, 10, 'Sabtu', '08:00:00', '21:00:00', '2025-08-04 16:39:47', '2025-08-04 16:39:47'),
(45, 11, 'Senin', '08:00:00', '21:00:00', '2025-08-04 16:40:23', '2025-08-04 16:40:23'),
(46, 11, 'Selasa', '08:00:00', '21:00:00', '2025-08-04 16:40:26', '2025-08-04 16:40:26'),
(47, 11, 'Rabu', '08:00:00', '21:00:00', '2025-08-04 16:40:30', '2025-08-04 16:40:30'),
(48, 11, 'Kamis', '08:00:00', '21:00:00', '2025-08-04 16:40:33', '2025-08-04 16:40:33'),
(49, 11, 'Jumat', '08:00:00', '21:00:00', '2025-08-04 16:40:36', '2025-08-04 16:40:36'),
(50, 11, 'Sabtu', '08:00:00', '21:00:00', '2025-08-04 16:40:39', '2025-08-04 16:40:39'),
(55, 13, 'Rabu', '08:00:00', '15:00:00', '2025-08-12 12:39:30', '2025-08-12 12:39:30'),
(56, 6, 'Minggu', '08:00:00', '15:00:00', '2025-08-16 04:08:21', '2025-08-16 04:08:21');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_12_120526_create_dokters_table', 2),
(5, '2025_07_12_120939_create_jadwal_dokters_table', 3),
(6, '2025_07_12_121006_create_jadwal_dokters_table', 4),
(7, '2025_07_13_054132_create_pendaftaran_pasiens_table', 5),
(8, '2025_07_13_192631_add_keluhan_to_pendaftaran_pasiens_table', 6),
(9, '2025_07_15_131305_add_nomor_antrian_to_pendaftaran_pasiens_table', 7),
(10, '2025_07_15_144242_add_role_fields_to_users_table', 8),
(11, '2025_07_18_143533_add_tanggal_janji_to_pendaftaran_pasien_table', 9),
(12, '2025_07_18_143903_add_tanggal_janji_to_pendaftaran_pasien_table', 10),
(13, '2025_07_19_145928_add_user_id_to_dokters_table', 11),
(14, '2025_07_19_175933_add_waktu_pemeriksaan_to_pendaftaran_pasien_table', 12),
(15, '2025_08_04_143201_add_tipe_pendaftaran_to_pendaftaran_pasiens_table', 13),
(16, '2025_08_04_151608_add_tipe_pendaftaran_to_pendaftaran_pasiens_table', 14);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran_pasiens`
--

CREATE TABLE `pendaftaran_pasiens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `dokter_id` bigint(20) UNSIGNED NOT NULL,
  `poli` varchar(255) NOT NULL,
  `tipe_pendaftaran` enum('BPJS','Umum') NOT NULL,
  `keluhan` text DEFAULT NULL,
  `waktu_daftar` timestamp NULL DEFAULT NULL,
  `waktu_pemeriksaan` timestamp NULL DEFAULT NULL,
  `tanggal_janji` date DEFAULT NULL,
  `status` enum('menunggu','diperiksa','selesai') NOT NULL DEFAULT 'menunggu',
  `nomor_antrian` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pendaftaran_pasiens`
--

INSERT INTO `pendaftaran_pasiens` (`id`, `user_id`, `dokter_id`, `poli`, `tipe_pendaftaran`, `keluhan`, `waktu_daftar`, `waktu_pemeriksaan`, `tanggal_janji`, `status`, `nomor_antrian`, `created_at`, `updated_at`) VALUES
(63, 17, 8, 'Umum', 'Umum', 'saya pusing', '2025-08-04 16:54:48', '2025-08-04 16:56:10', '2025-08-04', 'selesai', 'PU8-01', '2025-08-04 16:54:48', '2025-08-04 16:56:14'),
(68, 17, 6, 'Umum', 'Umum', 'demam', '2025-08-04 20:08:02', NULL, '2025-08-05', 'menunggu', 'PU6-01', '2025-08-04 20:08:02', '2025-08-04 20:08:02'),
(69, 26, 8, 'Umum', 'Umum', 'Demam tinggi sejak kemarin malam', '2025-08-11 10:34:07', '2025-08-11 11:42:54', '2025-08-11', 'selesai', 'PU8-01', '2025-08-11 10:34:07', '2025-08-11 11:42:57'),
(70, 27, 8, 'Umum', 'BPJS', 'Batuk kering dan tenggorokan gatal', '2025-08-11 11:26:44', '2025-08-11 11:43:43', '2025-08-11', 'selesai', 'PU8-02', '2025-08-11 11:26:44', '2025-08-11 11:43:46'),
(71, 28, 8, 'Umum', 'Umum', 'Sakit kepala berulang', '2025-08-11 11:28:10', '2025-08-11 11:43:49', '2025-08-11', 'selesai', 'PU8-03', '2025-08-11 11:28:10', '2025-08-11 11:44:23'),
(72, 29, 8, 'Umum', 'BPJS', 'Nyeri perut bagian bawah', '2025-08-11 11:29:07', '2025-08-11 11:44:26', '2025-08-11', 'selesai', 'PU8-04', '2025-08-11 11:29:07', '2025-08-11 11:44:30'),
(73, 30, 8, 'Umum', 'Umum', 'Pusing saat berdiri', '2025-08-11 11:29:50', '2025-08-11 11:44:33', '2025-08-11', 'selesai', 'PU8-05', '2025-08-11 11:29:50', '2025-08-11 11:44:37'),
(74, 31, 8, 'Umum', 'BPJS', 'Mual dan muntah', '2025-08-11 11:30:44', '2025-08-11 11:44:40', '2025-08-11', 'selesai', 'PU8-06', '2025-08-11 11:30:44', '2025-08-11 11:44:48'),
(75, 32, 8, 'Umum', 'Umum', 'Sakit gigi kiri bawah', '2025-08-11 11:31:34', '2025-08-11 11:49:26', '2025-08-11', 'selesai', 'PU8-07', '2025-08-11 11:31:34', '2025-08-11 11:49:29'),
(76, 33, 8, 'Umum', 'BPJS', 'Nyeri dada saat bernapas', '2025-08-11 11:32:26', '2025-08-11 11:49:32', '2025-08-11', 'selesai', 'PU8-08', '2025-08-11 11:32:26', '2025-08-11 11:49:35'),
(77, 34, 8, 'Umum', 'Umum', 'Pegal-pegal seluruh badan', '2025-08-11 11:33:08', '2025-08-11 11:49:39', '2025-08-11', 'selesai', 'PU8-09', '2025-08-11 11:33:08', '2025-08-11 11:49:42'),
(78, 35, 8, 'Umum', 'BPJS', 'Susah tidur beberapa hari terakhir', '2025-08-11 11:34:04', '2025-08-11 11:49:46', '2025-08-11', 'selesai', 'PU8-10', '2025-08-11 11:34:04', '2025-08-11 11:49:53'),
(79, 36, 8, 'Umum', 'Umum', 'Luka di kaki sulit sembuh', '2025-08-11 11:35:32', '2025-08-11 11:49:49', '2025-08-11', 'selesai', 'PU8-11', '2025-08-11 11:35:32', '2025-08-11 11:49:56'),
(80, 37, 8, 'Umum', 'BPJS', 'Sesak napas saat beraktivitas', '2025-08-11 11:36:18', '2025-08-11 11:49:59', '2025-08-11', 'selesai', 'PU8-12', '2025-08-11 11:36:18', '2025-08-11 11:50:01'),
(81, 38, 8, 'Umum', 'BPJS', 'Nyeri sendi lutut kanan', '2025-08-11 11:37:09', '2025-08-11 11:50:05', '2025-08-11', 'selesai', 'PU8-13', '2025-08-11 11:37:09', '2025-08-11 11:50:08'),
(82, 39, 8, 'Umum', 'BPJS', 'Mimisan tanpa sebab jelas', '2025-08-11 11:37:53', '2025-08-11 11:50:12', '2025-08-11', 'selesai', 'PU8-14', '2025-08-11 11:37:53', '2025-08-11 11:50:15'),
(83, 40, 8, 'Umum', 'BPJS', 'Gatal-gatal di seluruh tubuh', '2025-08-11 11:38:53', '2025-08-11 11:50:18', '2025-08-11', 'selesai', 'PU8-15', '2025-08-11 11:38:53', '2025-08-11 11:50:21'),
(84, 41, 8, 'Umum', 'BPJS', 'Diare sejak pagi', '2025-08-11 11:39:49', '2025-08-11 11:50:25', '2025-08-11', 'selesai', 'PU8-16', '2025-08-11 11:39:49', '2025-08-11 11:50:28'),
(85, 42, 8, 'Umum', 'BPJS', 'Bengkak pada pergelangan kaki', '2025-08-11 11:40:31', '2025-08-11 11:50:32', '2025-08-11', 'selesai', 'PU8-17', '2025-08-11 11:40:31', '2025-08-11 11:50:35'),
(86, 43, 8, 'Umum', 'BPJS', 'Telinga terasa penuh dan berdengung', '2025-08-11 11:41:11', '2025-08-11 11:50:39', '2025-08-11', 'selesai', 'PU8-18', '2025-08-11 11:41:11', '2025-08-11 11:50:42'),
(87, 44, 8, 'Umum', 'BPJS', 'Telinga terasa penuh dan berdengung', '2025-08-11 11:41:46', '2025-08-11 11:50:46', '2025-08-11', 'selesai', 'PU8-19', '2025-08-11 11:41:46', '2025-08-11 11:50:49'),
(88, 45, 8, 'Umum', 'BPJS', 'Hilang nafsu makan', '2025-08-11 11:42:32', '2025-08-11 11:50:54', '2025-08-11', 'selesai', 'PU8-20', '2025-08-11 11:42:32', '2025-08-11 11:50:57'),
(89, 26, 13, 'Umum', 'Umum', 'Mata merah dan berair', '2025-08-12 12:40:31', '2025-08-13 01:16:48', '2025-08-13', 'selesai', 'PU13-01', '2025-08-12 12:40:31', '2025-08-13 01:16:58'),
(90, 27, 13, 'Umum', 'BPJS', 'Sakit tenggorokan saat menelan', '2025-08-12 12:41:08', '2025-08-13 01:17:43', '2025-08-13', 'menunggu', 'PU13-02', '2025-08-12 12:41:08', '2025-08-13 01:29:18'),
(91, 28, 13, 'Umum', 'BPJS', 'Kulit bersisik di tangan', '2025-08-12 12:41:49', NULL, '2025-08-13', 'menunggu', 'PU13-03', '2025-08-12 12:41:49', '2025-08-12 12:41:49'),
(92, 29, 13, 'Umum', 'BPJS', 'Nyeri bahu setelah berolahraga', '2025-08-12 12:43:52', NULL, '2025-08-13', 'menunggu', 'PU13-04', '2025-08-12 12:43:52', '2025-08-12 12:43:52'),
(93, 30, 13, 'Umum', 'BPJS', 'Keringat berlebihan di malam hari', '2025-08-12 12:44:33', NULL, '2025-08-13', 'menunggu', 'PU13-05', '2025-08-12 12:44:33', '2025-08-12 12:44:33'),
(94, 31, 13, 'Umum', 'BPJS', 'Bibir pecah-pecah parah', '2025-08-12 12:45:27', NULL, '2025-08-13', 'menunggu', 'PU13-06', '2025-08-12 12:45:27', '2025-08-12 12:45:27'),
(95, 32, 13, 'Umum', 'BPJS', 'Sakit perut setelah makan pedas', '2025-08-12 12:46:00', NULL, '2025-08-13', 'menunggu', 'PU13-07', '2025-08-12 12:46:00', '2025-08-12 12:46:00'),
(96, 33, 13, 'Umum', 'BPJS', 'Perut kembung terus menerus', '2025-08-12 12:47:31', NULL, '2025-08-13', 'menunggu', 'PU13-08', '2025-08-12 12:47:31', '2025-08-12 12:47:31'),
(97, 34, 13, 'Umum', 'BPJS', 'Nyeri pada pergelangan tangan', '2025-08-12 12:48:08', NULL, '2025-08-13', 'menunggu', 'PU13-09', '2025-08-12 12:48:08', '2025-08-12 12:48:08'),
(98, 35, 13, 'Umum', 'Umum', 'Gusi sering berdarah', '2025-08-12 12:48:48', NULL, '2025-08-13', 'menunggu', 'PU13-10', '2025-08-12 12:48:48', '2025-08-12 12:48:48'),
(99, 36, 13, 'Umum', 'BPJS', 'Kepala terasa berat saat bangun tidur', '2025-08-12 12:49:27', NULL, '2025-08-13', 'menunggu', 'PU13-11', '2025-08-12 12:49:27', '2025-08-12 12:49:27'),
(100, 37, 13, 'Umum', 'BPJS', 'Tangan sering kesemutan', '2025-08-12 12:50:00', NULL, '2025-08-13', 'menunggu', 'PU13-12', '2025-08-12 12:50:00', '2025-08-12 12:50:00'),
(101, 38, 13, 'Umum', 'BPJS', 'Rambut rontok berlebihan', '2025-08-12 12:50:52', NULL, '2025-08-13', 'menunggu', 'PU13-13', '2025-08-12 12:50:52', '2025-08-12 12:50:52'),
(102, 39, 13, 'Umum', 'Umum', 'Nyeri pinggang setelah duduk lama', '2025-08-12 12:51:31', NULL, '2025-08-13', 'menunggu', 'PU13-14', '2025-08-12 12:51:31', '2025-08-12 12:51:31'),
(103, 40, 13, 'Umum', 'BPJS', 'Muka bengkak di pagi hari', '2025-08-12 12:52:17', NULL, '2025-08-13', 'menunggu', 'PU13-15', '2025-08-12 12:52:17', '2025-08-12 12:52:17'),
(104, 41, 13, 'Umum', 'BPJS', 'Sering buang air kecil di malam hari', '2025-08-12 12:52:56', NULL, '2025-08-13', 'menunggu', 'PU13-16', '2025-08-12 12:52:56', '2025-08-12 12:52:56'),
(105, 42, 13, 'Umum', 'BPJS', 'Luka bakar ringan di jari', '2025-08-12 12:53:33', NULL, '2025-08-13', 'menunggu', 'PU13-17', '2025-08-12 12:53:33', '2025-08-12 12:53:33'),
(106, 43, 13, 'Umum', 'BPJS', 'Kulit memar tanpa sebab jelas', '2025-08-12 12:54:04', NULL, '2025-08-13', 'menunggu', 'PU13-18', '2025-08-12 12:54:04', '2025-08-12 12:54:04'),
(107, 44, 13, 'Umum', 'BPJS', 'Demam disertai menggigil', '2025-08-12 12:54:39', NULL, '2025-08-13', 'menunggu', 'PU13-19', '2025-08-12 12:54:39', '2025-08-12 12:54:39'),
(108, 45, 13, 'Umum', 'BPJS', 'Sakit di bagian leher belakang', '2025-08-12 12:55:17', NULL, '2025-08-13', 'menunggu', 'PU13-20', '2025-08-12 12:55:17', '2025-08-12 12:55:17'),
(110, 47, 7, 'Umum', 'BPJS', 'Nyeri dada saat menarik napas panjang', '2025-08-13 01:39:06', '2025-08-13 01:50:59', '2025-08-13', 'menunggu', 'PU7-01', '2025-08-13 01:39:06', '2025-08-13 01:51:03'),
(111, 48, 7, 'Umum', 'BPJS', 'Susah tidur beberapa hari terakhir', '2025-08-13 01:39:43', NULL, '2025-08-13', 'menunggu', 'PU7-02', '2025-08-13 01:39:43', '2025-08-13 01:39:43'),
(112, 49, 7, 'Umum', 'BPJS', 'Perut mulas di pagi hari', '2025-08-13 01:40:21', NULL, '2025-08-13', 'menunggu', 'PU7-03', '2025-08-13 01:40:21', '2025-08-13 01:40:21'),
(113, 50, 7, 'Umum', 'BPJS', 'Telinga terasa penuh dan berdengung', '2025-08-13 01:41:01', NULL, '2025-08-13', 'menunggu', 'PU7-04', '2025-08-13 01:41:01', '2025-08-13 01:41:01'),
(114, 51, 7, 'Umum', 'BPJS', 'Mual saat mencium bau tertentu', '2025-08-13 01:41:33', NULL, '2025-08-13', 'menunggu', 'PU7-05', '2025-08-13 01:41:33', '2025-08-13 01:41:33'),
(115, 52, 7, 'Umum', 'BPJS', 'Pegal-pegal di seluruh tubuh', '2025-08-13 01:42:15', NULL, '2025-08-13', 'menunggu', 'PU7-06', '2025-08-13 01:42:15', '2025-08-13 01:42:15'),
(116, 53, 7, 'Umum', 'BPJS', 'Sakit kepala sebelah (migrain)', '2025-08-13 01:42:50', NULL, '2025-08-13', 'menunggu', 'PU7-07', '2025-08-13 01:42:50', '2025-08-13 01:42:50'),
(117, 54, 7, 'Umum', 'BPJS', 'Nafsu makan menurun drastis', '2025-08-13 01:43:26', NULL, '2025-08-13', 'menunggu', 'PU7-08', '2025-08-13 01:43:26', '2025-08-13 01:43:26'),
(118, 55, 7, 'Umum', 'BPJS', 'Sesak napas saat berjalan cepat', '2025-08-13 01:43:57', NULL, '2025-08-13', 'menunggu', 'PU7-09', '2025-08-13 01:43:57', '2025-08-13 01:43:57'),
(119, 56, 7, 'Umum', 'Umum', 'Nyeri sendi lutut ketika naik tangga', '2025-08-13 01:44:32', NULL, '2025-08-13', 'menunggu', 'PU7-10', '2025-08-13 01:44:32', '2025-08-13 01:44:32'),
(120, 57, 7, 'Umum', 'Umum', 'Mata berkunang-kunang', '2025-08-13 01:45:04', NULL, '2025-08-13', 'menunggu', 'PU7-11', '2025-08-13 01:45:04', '2025-08-13 01:45:04'),
(121, 58, 7, 'Umum', 'BPJS', 'Sariawan berulang', '2025-08-13 01:45:44', NULL, '2025-08-13', 'menunggu', 'PU7-12', '2025-08-13 01:45:44', '2025-08-13 01:45:44'),
(122, 59, 7, 'Umum', 'BPJS', 'Punggung terasa kaku', '2025-08-13 01:46:20', NULL, '2025-08-13', 'menunggu', 'PU7-13', '2025-08-13 01:46:20', '2025-08-13 01:46:20'),
(123, 60, 7, 'Umum', 'BPJS', 'Gatal di seluruh badan pada malam hari', '2025-08-13 01:46:57', NULL, '2025-08-13', 'menunggu', 'PU7-14', '2025-08-13 01:46:57', '2025-08-13 01:46:57'),
(124, 61, 7, 'Umum', 'Umum', 'Batuk berdahak kuning', '2025-08-13 01:47:34', NULL, '2025-08-13', 'menunggu', 'PU7-15', '2025-08-13 01:47:34', '2025-08-13 01:47:34'),
(125, 62, 7, 'Umum', 'BPJS', 'Kaki bengkak di sore hari', '2025-08-13 01:48:07', NULL, '2025-08-13', 'menunggu', 'PU7-16', '2025-08-13 01:48:07', '2025-08-13 01:48:07'),
(126, 63, 7, 'Umum', 'BPJS', 'Pusing ketika berdiri terlalu cepat', '2025-08-13 01:48:39', NULL, '2025-08-13', 'menunggu', 'PU7-17', '2025-08-13 01:48:39', '2025-08-13 01:48:39'),
(127, 64, 7, 'Umum', 'BPJS', 'Perih di ulu hati', '2025-08-13 01:49:09', NULL, '2025-08-13', 'menunggu', 'PU7-18', '2025-08-13 01:49:09', '2025-08-13 01:49:09'),
(128, 65, 7, 'Umum', 'BPJS', 'Gatal di kulit kepala', '2025-08-13 01:50:02', NULL, '2025-08-13', 'menunggu', 'PU7-19', '2025-08-13 01:50:02', '2025-08-13 01:50:02'),
(129, 66, 7, 'Umum', 'BPJS', 'Suara serak berkepanjangan', '2025-08-13 01:50:36', NULL, '2025-08-13', 'menunggu', 'PU7-20', '2025-08-13 01:50:36', '2025-08-13 01:50:36'),
(130, 16, 6, 'Umum', 'BPJS', 'saya pusing', '2025-08-15 09:43:40', NULL, '2025-08-15', 'menunggu', 'PU6-01', '2025-08-15 09:43:40', '2025-08-15 09:43:40'),
(131, 17, 6, 'Umum', 'BPJS', 'saya pusing', '2025-08-16 03:56:43', NULL, '2025-08-16', 'menunggu', 'PU6-01', '2025-08-16 03:56:43', '2025-08-16 03:56:43'),
(132, 16, 6, 'Umum', 'BPJS', 'saya pusing', '2025-08-16 04:10:36', NULL, '2025-08-17', 'menunggu', 'PU6-01', '2025-08-16 04:10:36', '2025-08-16 04:10:36'),
(135, 17, 6, 'Umum', 'BPJS', 'saya pusing', '2025-08-16 04:35:49', NULL, '2025-08-17', 'menunggu', 'PU6-02', '2025-08-16 04:35:49', '2025-08-16 04:35:49');

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
('0xLgX9SZmuwE1cTC3HmB77CpzMwVOlovgJI9iBBW', NULL, '127.0.0.1', 'PostmanRuntime/7.45.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUdTV0RHdWlkZUtMS1FVajRMTUhOTjJtMnM1dXFZUmp6UTZxcThpMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755002301),
('HZUkLztenK8llvqBuBOLjLgBeH9dI5PqPbLIv6BN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkRScUlURmtQNnNZM0U5NXg2QjBTbGhSWFg0ZW1UTDVHRnNjS3g0WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1754341202),
('l2FmRLsKBEKBCTO5LjwrQGAgy0PwlntjeA01P0kZ', NULL, '127.0.0.1', 'PostmanRuntime/7.44.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVl3REpNNEZwYlZoWUVjc21PV2Zsenk3cXdVcG1rU3dnb0NJdXBCUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1752306491),
('lgh2vnVX4f4gNLSsqeRZ2yDrKXpSrRUdhO2WAQBP', NULL, '127.0.0.1', 'PostmanRuntime/7.45.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUpVMWJJS1RZWjY4R2p4eUk4WWJPMWYzTzJ5TzlDaGpSSmhGTzM5eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1754907608),
('vbO58HYkS940PVX7RuclacM2ABnyvynV5gfREn1b', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1Q3UHQxSzE3OVNBZU1aUGpmUU05ZlNodjhQZ0RtSTFIdUI0TnRCeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755317038),
('WKdxgdpkD2OCsU2It8sPNEEDpjHIab2X7Rh5nxw0', NULL, '127.0.0.1', 'PostmanRuntime/7.44.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnFSOTNUVjFtcExpOXN6TW0xeGVDcHdWaWxaM05UYnZLT2N5dG5GOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1752996681),
('X9AjpfPlxLBrLDpjwnitZexzo0CRf4gE7MuxMXni', NULL, '127.0.0.1', 'PostmanRuntime/7.44.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHRwaHhBd2V5NEdTVWZzUVlFcWgyRWNZMTU4NXY2MGxGWFJuNllzYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1752323156);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(255) NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `nik` varchar(255) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'pasien',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `nik`, `no_telp`, `role`, `created_at`, `updated_at`) VALUES
(5, 'Dian Prasetyo', 'dian@example.com', '$2y$12$1xD5VUAejrtloGQ27zrGQuLALfLBt6xtgL/iNi8rH2q01HdnjZ28m', 'Laki-laki', 'Surabaya', '1992-07-09', 'Jl. Kenanga No. 12', '3576012309876543', '081234567891', 'pasien', '2025-07-12 00:58:54', '2025-07-12 00:58:54'),
(16, 'Gaizka Wisnu', 'karamissuu@gmail.com', '$2y$12$aR7MnTPS2dA3AxLwPnD0PuV6WShXrbEhKio5AxPeUzwbI4/f7OFKK', 'Laki-laki', 'Jakarta', '2003-12-18', 'Sarijadi', '3173031812030005', '0895331942686', 'pasien', '2025-07-13 11:43:33', '2025-07-13 11:43:33'),
(17, 'Bunga Rizka Fadillah', 'bungarizka886@gmail.com', '$2y$12$SNHT4k/kqVUVRQ7wo4yfpODNYGclGwTNhFKKLaurshGnGndtKpUXO', 'Perempuan', 'Bogor', '2004-04-02', 'Sarijadi', '3173030204040005', '0895331942767', 'pasien', '2025-07-15 07:18:47', '2025-07-15 07:18:47'),
(18, 'dr. Bariza Sabhrina', 'bariza@gmail.com', '$2y$12$Ry.GKXBMwXnEuHHBZG6GO.udJbWJjDtqLM9dggS3m4/ZejnSe2c6W', 'Perempuan', 'Bandung', '1994-04-15', 'Bandung', '3173030150494000', '0895331942768', 'dokter', '2025-07-15 08:06:00', '2025-07-15 08:06:00'),
(19, 'drg. Sri ', 'sri@gmail.com', '$2y$12$Hz1gf16KOYSqDw/U0GMIkunLe0fL1qjR1VnnEQRNUFtKbO.m2UARy', 'Perempuan', 'Surabaya', '1990-01-23', 'Bandung', '3173032301900005', '0895331942761', 'dokter', '2025-07-15 08:07:14', '2025-07-15 08:07:14'),
(20, 'Sindi Royentika', 'sindi@gmail.com', '$2y$12$SCFS3KDWu/Kbt7eXOa2xgORNfzudOKaFM9t.v04Rju6kDMshCJ3ha', 'Perempuan', 'Yogyakarta', '1996-07-08', 'Bandung', '3173030807960005', '0895331942762', 'dokter', '2025-07-15 08:08:24', '2025-07-15 08:08:24'),
(22, 'dr. Mutia', 'mutia@gmail.com', '$2y$12$3YdVULKbE7agMEknjYSQ7u1I9APNTUJxc/QIT3FmYvX4fISx2LEtq', 'Perempuan', 'Jakarta', '1991-12-08', 'Bandung', '3173030807960002', '0895331942763', 'dokter', '2025-08-04 16:16:02', '2025-08-04 16:16:02'),
(23, 'dr. Hilsa', 'hilsa@gmail.com', '$2y$12$b4hDnHDsKXGKKcG8mADRher4Gy/UrHMvI75dp0HXO2EUreTcXk7fW', 'Perempuan', 'Bogor', '1995-12-19', 'Bandung', '3173031912199501', '0895331942764', 'dokter', '2025-08-04 16:20:19', '2025-08-04 16:20:19'),
(24, 'dr. Agla', 'agla@gmail.com', '$2y$12$kjjlok/mh9pg.W9VoHs1COmhlQcjlm5GPD2Sb0/hppKAxdI68LUi.', 'Perempuan', 'Bandung', '1997-08-21', 'Bandung', '3173032108199701', '0895331942765', 'dokter', '2025-08-04 16:26:58', '2025-08-04 16:26:58'),
(25, 'dr. Ilham', 'ilham@gmail.com', '$2y$12$9moFEz/xvOvRlmj9CpASBO299ibkKiwH1YYV3Kx02oYE/LmI/d21S', 'Laki-laki', 'Jakarta', '1998-01-15', 'Bandung', '3173031501199801', '0895331942766', 'dokter', '2025-08-04 16:30:05', '2025-08-04 16:30:05'),
(26, 'Andi Pratama', 'andi@gmail.com', '$2y$12$cB4qu83CyCT8tuOv/NZy2ubKV3VVKZbeBeyuh.dxYMFLmg3tpT2y6', 'Laki-laki', 'Jakarta', '1995-04-12', 'Jl. Merdeka No. 1, Jakarta', '3271019504010001', '081234567890', 'pasien', '2025-08-11 10:06:30', '2025-08-11 10:06:30'),
(27, 'Siti Aisyah', 'siti@gmail.com', '$2y$12$zG87TfpbTtb69uJP9burFO4OQGiiHzGkx9syl7U.ehJjXOgoxkOqy', 'Perempuan', 'Bandung', '1997-08-20', 'Jl. Asia Afrika No. 12, Bandung', '3272019708200002', '081298765432', 'pasien', '2025-08-11 10:06:49', '2025-08-11 10:06:49'),
(28, 'Budi Santoso', 'budi@gmail.com', '$2y$12$kEDAXyAV/F3eTZOCW7xsou6pIDYM2meuWM3QYbgkdNUwZglz6QeTi', 'Laki-laki', 'Surabaya', '1990-01-15', 'Jl. Pemuda No. 5, Surabaya', '3578019001150003', '081312345678', 'pasien', '2025-08-11 10:06:59', '2025-08-11 10:06:59'),
(29, 'Rina Marlina', 'rina@gmail.com', '$2y$12$UN8F4gLXD3vrHlxvxOmuOOqIMzD7kxidGvAOEgiyvcb7/8/1UQ/Cu', 'Perempuan', 'Medan', '1992-09-25', 'Jl. Gatot Subroto No. 23, Medan', '1271019209250004', '081378945612', 'pasien', '2025-08-11 10:07:10', '2025-08-11 10:07:10'),
(30, 'Fajar Nugroho', 'fajar@gmail.com', '$2y$12$FRNB11LjCDHWLKXJnEQDTe/0DmCmjwVhJgmS/cXmW7gip.0y.4maa', 'Laki-laki', 'Yogyakarta', '1994-05-30', 'Jl. Malioboro No. 45, Yogyakarta', '3471019405300005', '081355667788', 'pasien', '2025-08-11 10:07:19', '2025-08-11 10:07:19'),
(31, 'Dewi Anggraini', 'dewi@gmail.com', '$2y$12$9OJHfXfll9mIute087Xxsez11/nyk9pScBtS0ExvOwR9MFYku65Ai', 'Perempuan', 'Palembang', '1996-02-18', 'Jl. Sudirman No. 89, Palembang', '1671019602180006', '081288776655', 'pasien', '2025-08-11 10:07:28', '2025-08-11 10:07:28'),
(32, 'Rahmat Hidayat', 'rahmat@gmail.com', '$2y$12$YKVl7gjQ2xUToMcllvOqgOCL/Kr7fyml3UGl.o4qxrSfCD8fr315K', 'Laki-laki', 'Makassar', '1989-07-10', 'Jl. Pettarani No. 8, Makassar', '7371018907100007', '081277889900', 'pasien', '2025-08-11 10:07:36', '2025-08-11 10:07:36'),
(33, 'Lina Suryani', 'lina@gmail.com', '$2y$12$T7nmpbhPI3jGiPdogM/St.PfKq/E0s6FAU0w/AJkd1R8ME9qh/7pm', 'Perempuan', 'Semarang', '1998-11-05', 'Jl. Pandanaran No. 7, Semarang', '3371019811050008', '081234556677', 'pasien', '2025-08-11 10:07:46', '2025-08-11 10:07:46'),
(34, 'Ahmad Fauzi', 'ahmad@gmail.com', '$2y$12$cst1.fgbp/QIvqzFbUU7QuwFmwwTv1sxWtuUJlxzymSlTcZI8JkgS', 'Laki-laki', 'Banjarmasin', '1991-03-08', 'Jl. A. Yani No. 15, Banjarmasin', '6371019103080009', '081211223344', 'pasien', '2025-08-11 10:07:57', '2025-08-11 10:07:57'),
(35, 'Putri Anindya', 'putri@gmail.com', '$2y$12$HXXzQMupZOPGKvrPeYyd4.29OdWFAusnkakT.gc.XT44QMvv3J6tq', 'Perempuan', 'Denpasar', '1999-06-17', 'Jl. Teuku Umar No. 33, Denpasar', '5171019906170010', '081266554433', 'pasien', '2025-08-11 10:08:06', '2025-08-11 10:08:06'),
(36, 'Rizky Saputra', 'rizky@gmail.com', '$2y$12$5itXwsn.pp7cF8hrt1YNMOJ7GolqQBKYzuFnvymgc8QYsa9GySHgS', 'Laki-laki', 'Malang', '1993-10-21', 'Jl. Ijen No. 12, Malang', '3573019310210011', '081277665544', 'pasien', '2025-08-11 10:08:14', '2025-08-11 10:08:14'),
(37, 'Mega Lestari', 'mega@gmail.com', '$2y$12$DVDndnEAOUcFvTrb4SEk8eGNA12.aWafsOlP3kz.kdqoxkumFNhdu', 'Perempuan', 'Padang', '1994-12-02', 'Jl. Sudirman No. 14, Padang', '1371019412020012', '081233445566', 'pasien', '2025-08-11 10:08:25', '2025-08-11 10:08:25'),
(38, 'Hendra Kurniawan', 'hendra@gmail.com', '$2y$12$sXJ4c2C7K1PzorgoEZYu.OgfC.8bKMH2y5IZ0mH0Z8.1Tvnkaa6Me', 'Laki-laki', 'Pontianak', '1988-09-14', 'Jl. Ahmad Yani No. 9, Pontianak', '6171018809140013', '081244556677', 'pasien', '2025-08-11 10:08:33', '2025-08-11 10:08:33'),
(39, 'Yuni Rahmawati', 'yuni@gmail.com', '$2y$12$f2KFyqLgSD2CQA/FMnoFA.Ti8.bimvhGIerjBhXnf3rpiE0ZiFjUm', 'Perempuan', 'Manado', '1997-01-09', 'Jl. Sam Ratulangi No. 8, Manado', '7171019701090014', '081255667788', 'pasien', '2025-08-11 10:08:40', '2025-08-11 10:08:40'),
(40, 'Dimas Prakoso', 'dimas@gmail.com', '$2y$12$1f5r1TobFQ.5U4OEOaEvae7UwEIHImmD2F2knyEvO6Kl1d.y9jveK', 'Laki-laki', 'Palangkaraya', '1995-07-28', 'Jl. Diponegoro No. 6, Palangkaraya', '6271019507280015', '081266778899', 'pasien', '2025-08-11 10:08:49', '2025-08-11 10:08:49'),
(41, 'Aulia Fitri', 'aulia@gmail.com', '$2y$12$ki0CXH59ry2SmAae/oaJZuslxfbm7ud6l8l97eQLOZ6ymvdrwYypC', 'Perempuan', 'Tangerang', '1998-04-03', 'Jl. Daan Mogot No. 45, Tangerang', '3671019804030016', '081277889911', 'pasien', '2025-08-11 10:08:58', '2025-08-11 10:08:58'),
(42, 'Bayu Saputra', 'bayu@gmail.com', '$2y$12$rKocf8wUCiNUqBqiTE8B0O5Y.uG4UkXj5V8RrnKAUvcA/.z6p/NN2', 'Laki-laki', 'Bekasi', '1996-08-16', 'Jl. Ahmad Yani No. 10, Bekasi', '3275019608160017', '081233322211', 'pasien', '2025-08-11 10:09:09', '2025-08-11 10:09:09'),
(43, 'Citra Ayu', 'citra@gmail.com', '$2y$12$xmuJ6jyr.inYDAjJuM5hpuntBclsHT0IrLE.hwdee74Qvrt83zioO', 'Perempuan', 'Cirebon', '1999-02-22', 'Jl. Siliwangi No. 3, Cirebon', '3273019902220018', '081244443322', 'pasien', '2025-08-11 10:09:17', '2025-08-11 10:09:17'),
(44, 'Gilang Ramadhan', 'gilang@gmail.com', '$2y$12$DTL8.lWMIWrGqqrKTgNAs.urJJHPGccobWjvba2CpbqE8M.u2HKea', 'Laki-laki', 'Bogor', '1993-11-12', 'Jl. Pajajaran No. 22, Bogor', '3271019311120019', '081277766655', 'pasien', '2025-08-11 10:09:26', '2025-08-11 10:09:26'),
(45, 'Nadia Safitri', 'nadia@gmail.com', '$2y$12$CW01VYrR.lFmi6C299zNiOjJIi7RuUfuN3YsPDAQPMpwLL5752Dpa', 'Perempuan', 'Depok', '1995-05-19', 'Jl. Margonda No. 5, Depok', '3276019505190020', '081255544433', 'pasien', '2025-08-11 10:09:34', '2025-08-11 10:09:34'),
(46, 'dr. Bina', 'bina@gmail.com', '$2y$12$RUdRxCZiBl4WlJ7XZmcoauKNS1S2yjzuzlqdejmFzS2z6tFJuXdHS', 'Laki-laki', 'bandung', '1995-05-29', 'Jl. Margonda No. 5, Depok', '3276019505190021', '081255544434', 'dokter', '2025-08-12 12:38:32', '2025-08-12 12:38:32'),
(47, 'Agus Setiawan', 'agus@gmail.com', '$2y$12$DN.CEpbnaMsOA.nlnynhFOcw4VisR650oRJSpfPKOAMSy8izt.0PW', 'Laki-laki', 'Jakarta', '1990-06-11', 'Jl. Sudirman No. 77, Jakarta', '3271019006110021', '081222334455', 'pasien', '2025-08-13 01:09:10', '2025-08-13 01:09:10'),
(48, 'Desi Marlina', 'desi@gmail.com', '$2y$12$fzN1mDq0m.50zE6jtr7/4u5vqnrmTGgqIcxw8hpccuaFQUWTOJe3W', 'Perempuan', 'Bandung', '1994-09-14', 'Jl. Riau No. 19, Bandung', '3273019409140022', '081223344556', 'pasien', '2025-08-13 01:09:10', '2025-08-13 01:09:10'),
(49, 'Roni Pratama', 'roni@gmail.com', '$2y$12$Fe6PwN9PDjwmn5QSFDqnRu7zv9Y3U4LDe8Xyayl1v3uTOehPVIcQ2', 'Laki-laki', 'Surabaya', '1992-03-29', 'Jl. Diponegoro No. 33, Surabaya', '3578019203290023', '081224455667', 'pasien', '2025-08-13 01:09:11', '2025-08-13 01:09:11'),
(50, 'Fitriani Lestari', 'fitriani@gmail.com', '$2y$12$iH2cKkSaD/CJ37Zl6VBBQuBGmJvyuZrOXohLcc4PahJ7bbEJdE6i2', 'Perempuan', 'Medan', '1996-07-18', 'Jl. Sisingamangaraja No. 5, Medan', '1271019607180024', '081225566778', 'pasien', '2025-08-13 01:09:11', '2025-08-13 01:09:11'),
(51, 'Fikri Maulana', 'fikri@gmail.com', '$2y$12$UabD0is7U0vqve7gMXtZEeeP/JQYTd3BtN90MIFB4qS5u/HTCAu.G', 'Laki-laki', 'Makassar', '1991-10-03', 'Jl. Perintis Kemerdekaan No. 7, Makassar', '7371019100030025', '081226677889', 'pasien', '2025-08-13 01:09:12', '2025-08-13 01:09:12'),
(52, 'Nur Aisyah', 'nuraisyah@gmail.com', '$2y$12$eVzunSQu2ifbPuECA9oHlewf7LJCEL2WifzDnMQNTcaeMWuHLXk2m', 'Perempuan', 'Semarang', '1993-12-25', 'Jl. Pandanaran No. 2, Semarang', '3371019312250026', '081227788990', 'pasien', '2025-08-13 01:09:12', '2025-08-13 01:09:12'),
(53, 'Taufik Hidayat', 'taufik@gmail.com', '$2y$12$RuAaN1DxEtXOvwYQwy2AfusG573GVkCAqJz1GKHUyrMOPH3UxGjOW', 'Laki-laki', 'Yogyakarta', '1989-05-05', 'Jl. Kaliurang No. 88, Yogyakarta', '3471018905050027', '081228899001', 'pasien', '2025-08-13 01:09:12', '2025-08-13 01:09:12'),
(54, 'Rosa Amelia', 'rosa@gmail.com', '$2y$12$BmCSlAjw6MFaEoUe2U1I8utsoLMQnfD6FtGqNMWkkSA36FeRO6P9.', 'Perempuan', 'Palembang', '1997-11-15', 'Jl. Demang Lebar Daun No. 9, Palembang', '1671019711150028', '081229900112', 'pasien', '2025-08-13 01:09:13', '2025-08-13 01:09:13'),
(55, 'Yoga Prasetyo', 'yoga@gmail.com', '$2y$12$7twbhN03s/cDVC/CB3egUee9BtfiCVoC95f5e5YHB2tBZtZDE7adW', 'Laki-laki', 'Banjarmasin', '1995-04-09', 'Jl. Pangeran Antasari No. 3, Banjarmasin', '6371019504090029', '081230011223', 'pasien', '2025-08-13 01:09:13', '2025-08-13 01:09:13'),
(56, 'Melati Sari', 'melati@gmail.com', '$2y$12$icHoEWpICK/7lYpSHXrgU.m.joc1w6v0VYq5EQnsltJFrXni0TX8y', 'Perempuan', 'Denpasar', '1999-08-26', 'Jl. Gatot Subroto No. 10, Denpasar', '5171019908260030', '081231122334', 'pasien', '2025-08-13 01:09:14', '2025-08-13 01:09:14'),
(57, 'Heri Santoso', 'heri@gmail.com', '$2y$12$nDlDg96.K6NG2IKLeJR6Uu/AgZQg5bWFVb1ro/wUlTle9Gk/vzBJK', 'Laki-laki', 'Malang', '1992-02-07', 'Jl. Simpang Balapan No. 4, Malang', '3573019202070031', '081232233445', 'pasien', '2025-08-13 01:09:14', '2025-08-13 01:09:14'),
(58, 'Kartika Dewi', 'kartika@gmail.com', '$2y$12$AaK9iV2Gfovzx5nqvN78guF17WsEPiX4YUliVlN/3JSAPH2C0rv26', 'Perempuan', 'Padang', '1994-06-13', 'Jl. Veteran No. 6, Padang', '1371019406130032', '081233344556', 'pasien', '2025-08-13 01:09:14', '2025-08-13 01:09:14'),
(59, 'Slamet Riyadi', 'slamet@gmail.com', '$2y$12$m1v74tb.VNOzI4UjlzkJ2.BNSnJpLmyCagWcDI1MLkrmGGj9xuKpm', 'Laki-laki', 'Pontianak', '1988-01-23', 'Jl. Tanjungpura No. 11, Pontianak', '6171018801230033', '081234455667', 'pasien', '2025-08-13 01:09:15', '2025-08-13 01:09:15'),
(60, 'Lestari Wulandari', 'lestari@gmail.com', '$2y$12$6SPjFRgXo3jNxdi8vd76hOgk47M/09ccobAZ78UsQ5ry4Mc.XlGl2', 'Perempuan', 'Manado', '1996-09-08', 'Jl. Sam Ratulangi No. 20, Manado', '7171019609080034', '081235566778', 'pasien', '2025-08-13 01:09:16', '2025-08-13 01:09:16'),
(61, 'Andika Saputra', 'andika@gmail.com', '$2y$12$qkV6G/46GeF0BVXiXGwqnuPcKxsuccXoZfYFg0DdzGm.JE.7VjGxe', 'Laki-laki', 'Palangkaraya', '1991-07-04', 'Jl. Yos Sudarso No. 2, Palangkaraya', '6271019107040035', '081236677889', 'pasien', '2025-08-13 01:09:16', '2025-08-13 01:09:16'),
(62, 'Cindy Oktavia', 'cindy@gmail.com', '$2y$12$yrOvce5nzCIql31OWzdYWO/Bf.xKMtDiBFKBbg8VfjN/JSu2KdyzC', 'Perempuan', 'Tangerang', '1998-12-19', 'Jl. MH Thamrin No. 8, Tangerang', '3671019812190036', '081237788990', 'pasien', '2025-08-13 01:09:17', '2025-08-13 01:09:17'),
(63, 'Bambang Sugiarto', 'bambang@gmail.com', '$2y$12$kqMSYQKTiPl96XG2iIuni.qEcT5JsRF3/Ju5JKRfzYJc8W07zmSpi', 'Laki-laki', 'Bekasi', '1993-05-28', 'Jl. Raya Pekayon No. 9, Bekasi', '3275019305280037', '081238899001', 'pasien', '2025-08-13 01:09:17', '2025-08-13 01:09:17'),
(64, 'Nita Puspita', 'nita@gmail.com', '$2y$12$CUA7C4Vpts8o2ULFbrQSWO1eD2UsPZ82zoqkMe.hkQHt9lfXjYYQG', 'Perempuan', 'Cirebon', '1995-11-11', 'Jl. Kartini No. 12, Cirebon', '3273019511110038', '081239900112', 'pasien', '2025-08-13 01:09:18', '2025-08-13 01:09:18'),
(65, 'Deni Kurniawan', 'deni@gmail.com', '$2y$12$ieQmRb2R6sCvuqBKEm.bweLE3biLoeCkEwvdu9IGeyaIHHwJ9Npuu', 'Laki-laki', 'Bogor', '1990-03-14', 'Jl. Ahmad Yani No. 3, Bogor', '3271019003140039', '081240011223', 'pasien', '2025-08-13 01:09:19', '2025-08-13 01:09:19'),
(66, 'Rani Anggraini', 'rani@gmail.com', '$2y$12$Rg0P.jhPT8Ch7ET5DK9d6ee4u3i6mtSzXvIaaszylRyMsar4XYala', 'Perempuan', 'Depok', '1997-02-02', 'Jl. Raya Sawangan No. 5, Depok', '3276019702020040', '081241122334', 'pasien', '2025-08-13 01:09:19', '2025-08-13 01:09:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `dokters`
--
ALTER TABLE `dokters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dokters_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jadwal_dokters`
--
ALTER TABLE `jadwal_dokters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadwal_dokters_dokter_id_foreign` (`dokter_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pendaftaran_pasiens`
--
ALTER TABLE `pendaftaran_pasiens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pendaftaran_pasiens_user_id_foreign` (`user_id`),
  ADD KEY `pendaftaran_pasiens_dokter_id_foreign` (`dokter_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_nik_unique` (`nik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokters`
--
ALTER TABLE `dokters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwal_dokters`
--
ALTER TABLE `jadwal_dokters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pendaftaran_pasiens`
--
ALTER TABLE `pendaftaran_pasiens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokters`
--
ALTER TABLE `dokters`
  ADD CONSTRAINT `dokters_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jadwal_dokters`
--
ALTER TABLE `jadwal_dokters`
  ADD CONSTRAINT `jadwal_dokters_dokter_id_foreign` FOREIGN KEY (`dokter_id`) REFERENCES `dokters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pendaftaran_pasiens`
--
ALTER TABLE `pendaftaran_pasiens`
  ADD CONSTRAINT `pendaftaran_pasiens_dokter_id_foreign` FOREIGN KEY (`dokter_id`) REFERENCES `dokters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pendaftaran_pasiens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
