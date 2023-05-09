-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Bulan Mei 2023 pada 16.06
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boiler_plate`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absent_permissions`
--

CREATE TABLE `absent_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `approval_status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `photo` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `approval_statuses`
--

CREATE TABLE `approval_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `approval_statuses`
--

INSERT INTO `approval_statuses` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Disetujui', 'Pengajuan anda memenuhi syarat dan telah disetujui', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(2, 'Menunggu Persetujuan', 'Pengajuan anda diterima dan menunggu persetujuan', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(3, 'Ditolak', 'Pengajuan anda ditolak karena tidak memenuhi ketentuan!', '2023-05-04 14:10:28', '2023-05-04 14:10:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `attendes`
--

CREATE TABLE `attendes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `attende_code_id` bigint(20) UNSIGNED NOT NULL,
  `attende_status_id` bigint(20) UNSIGNED NOT NULL,
  `attend_time` datetime DEFAULT NULL,
  `latitude` double(8,2) NOT NULL DEFAULT 0.00,
  `longitude` double(8,2) NOT NULL DEFAULT 0.00,
  `address` text DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `attende_codes`
--

CREATE TABLE `attende_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `code_type_id` bigint(20) UNSIGNED NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `attende_statuses`
--

CREATE TABLE `attende_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `attende_statuses`
--

INSERT INTO `attende_statuses` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Tepat Waktu', 'tepat-waktu', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(2, 'Terlambat', 'terlambat', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(3, 'Tidak Hadir', 'tidak-hadir', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(4, 'Izin', 'izin', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(5, 'Cuti Tahunan', 'cuti-tahunan', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(6, 'Cuti Alasan Penting', 'cuti-alasan-penting', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(7, 'Cuti Bersalin', 'cuti-bersalin', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(8, 'Cuti Sakit', 'cuti-sakit', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(9, 'Cuti Diluar Tanggungan', 'cuti-diluar-tanggungan', '2023-05-04 14:10:28', '2023-05-04 14:10:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `attende_types`
--

CREATE TABLE `attende_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `attende_types`
--

INSERT INTO `attende_types` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Absen Pagi', 'absen-pagi', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(2, 'Absen Istrahat', 'absen-istrahat', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(3, 'Absen Siang', 'absen-siang', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(4, 'Absen Pulang', 'absen-pulang', '2023-05-04 14:10:28', '2023-05-04 14:10:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `departments`
--

INSERT INTO `departments` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Pimpinan', 'pimpinan', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(2, 'Pemerintahan', 'pemerintahan', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(3, 'PMD', 'pmd', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(4, 'Pelayanan Umum', 'pelayanan-umum', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(5, 'Kesra', 'kesra', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(6, 'Trantib', 'trantib', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(7, 'Kepegawaian', 'kepegawaian', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(8, 'Perencanaan', 'perencanaan', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(9, 'Kesekretariatan', 'kesekretariatan', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(10, 'Kebendaharaan', 'kebendaharaan', '2023-05-04 14:10:28', '2023-05-04 14:10:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `genders`
--

CREATE TABLE `genders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `genders`
--

INSERT INTO `genders` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Pria', 'pria', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(2, 'Wanita', 'wanita', '2023-05-04 14:10:28', '2023-05-04 14:10:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `government_employee_groups`
--

CREATE TABLE `government_employee_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rank` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `government_employee_groups`
--

INSERT INTO `government_employee_groups` (`id`, `rank`, `group`, `created_at`, `updated_at`) VALUES
(1, 'Juru Muda', 'I/A', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(2, 'Juru Muda Tingkat 1', 'I/B', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(3, 'Juru', 'I/C', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(4, 'Juru Tingkat 1', 'I/D', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(5, 'Pengatur Muda', 'II/A', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(6, 'Pengatur Muda Tingkat 1', 'II/B', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(7, 'Pengatur', 'II/C', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(8, 'Pengatur Tingkat 1', 'II/D', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(9, 'Penata Muda', 'III/A', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(10, 'Penata Muda Tingkat 1', 'III/B', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(11, 'Penata', 'III/C', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(12, 'Penata Tingkat 1', 'III/D', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(13, 'Pembina', 'IV/A', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(14, 'Pembina Tingkat 1', 'IV/B', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(15, 'Pembina Utama Muda', 'IV/C', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(16, 'Pembina Utama Madya', 'IV/D', '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(17, 'Pembina Utama', 'IV/E', '2023-05-04 14:10:28', '2023-05-04 14:10:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `leave_categories`
--

CREATE TABLE `leave_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `points` double(8,2) NOT NULL,
  `limit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `leave_categories`
--

INSERT INTO `leave_categories` (`id`, `name`, `points`, `limit`, `created_at`, `updated_at`) VALUES
(1, 'Cuti Tahunan', 100.00, 12, '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(2, 'Cuti Alasan Penting', 97.50, 60, '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(3, 'Cuti Bersalin', 97.50, 90, '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(4, 'Cuti Sakit', 97.50, 545, '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(5, 'Cuti Diluar Tanggungan', 0.00, 90, '2023-05-04 14:10:28', '2023-05-04 14:10:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2014_11_06_131203_create_genders_table', 1),
(3, '2014_11_06_131606_create_departments_table', 1),
(4, '2014_11_06_131700_create_users_table', 1),
(5, '2016_01_01_000000_add_voyager_user_fields', 1),
(6, '2016_01_01_000000_create_data_types_table', 1),
(7, '2016_05_19_173453_create_menu_table', 1),
(8, '2016_10_21_190000_create_roles_table', 1),
(9, '2016_10_21_190000_create_settings_table', 1),
(10, '2016_11_30_135954_create_permission_table', 1),
(11, '2016_11_30_141208_create_permission_role_table', 1),
(12, '2016_12_26_201236_data_types__add__server_side', 1),
(13, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(14, '2017_01_14_005015_create_translations_table', 1),
(15, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(16, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(17, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(18, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(19, '2017_08_05_000000_add_group_to_settings_table', 1),
(20, '2017_11_26_013050_add_user_role_relationship', 1),
(21, '2017_11_26_015000_create_user_roles_table', 1),
(22, '2018_03_11_000000_add_user_settings', 1),
(23, '2018_03_14_000000_add_details_to_data_types_table', 1),
(24, '2018_03_16_000000_make_settings_value_nullable', 1),
(25, '2019_08_19_000000_create_failed_jobs_table', 1),
(26, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(27, '2020_11_06_132251_create_attende_types_table', 1),
(28, '2020_11_06_132319_create_attende_statuses_table', 1),
(29, '2020_11_06_132431_create_attende_codes_table', 1),
(30, '2020_11_06_132453_create_attendes_table', 1),
(31, '2020_11_06_135612_create_absent_permissions_table', 1),
(32, '2020_11_18_033614_create_holidays_table', 1),
(33, '2020_12_08_191855_create_outstations_table', 1),
(34, '2020_12_08_204630_create_notifications_table', 1),
(35, '2021_01_07_224603_create_leave_categories_table', 1),
(36, '2021_01_07_224658_create_paid_leaves_table', 1),
(37, '2021_01_08_100545_create_government_employee_groups_table', 1),
(38, '2021_01_08_100920_add_government_employee_group_id_to_users_table', 1),
(39, '2021_01_25_133347_create_approval_statuses_table', 1),
(40, '2021_01_25_133709_add_approval_status_id_column_to_absent_permissions_table', 1),
(41, '2021_01_25_133736_add_approval_status_id_column_to_outstations_table', 1),
(42, '2021_01_25_133810_add_approval_status_id_column_to_paid_leaves_table', 1),
(43, '2021_02_01_165053_add_date_of_birth_column_to_users_table', 1),
(44, '2022_03_31_104359_add_is_active_to_users_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `outstations`
--

CREATE TABLE `outstations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `approval_status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `photo` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `paid_leaves`
--

CREATE TABLE `paid_leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `leave_category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `approval_status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `photo` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `due_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `phone` varchar(255) DEFAULT NULL,
  `nip` varchar(255) DEFAULT NULL,
  `government_employee_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `position` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `date_of_birth`, `avatar`, `phone`, `nip`, `government_employee_group_id`, `gender_id`, `department_id`, `position`, `status`, `email_verified_at`, `password`, `remember_token`, `settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Admin', 'admin@mail.com', '2020-01-01', 'users/default.png', '82123456789', '704170751', NULL, 1, 1, 'Admin', 'PNS', NULL, '$2y$10$3B30dEj9E6AXIg/ToIV/h.kG/VBe8Px1mBPr7STaZItcasrGO8gR2', 'OStgwr7hqc', NULL, 1, '2023-05-04 14:10:28', '2023-05-04 14:10:28'),
(2, NULL, 'user', 'rizki@mail.com', '2002-03-12', 'users/default.png', '085731544494', '098456722', NULL, 1, 4, 'user', 'PNS', NULL, '$2y$10$jK7Q3F2hMv43eAli9vhfauStL.t2/VjuVWlo7R2M5BM/QUXwuLMqe', 'OStgwr7hqc', NULL, 1, '2023-05-04 14:10:28', '2023-05-04 14:10:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absent_permissions`
--
ALTER TABLE `absent_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absent_permissions_user_id_foreign` (`user_id`),
  ADD KEY `absent_permissions_approval_status_id_foreign` (`approval_status_id`);

--
-- Indeks untuk tabel `approval_statuses`
--
ALTER TABLE `approval_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `attendes`
--
ALTER TABLE `attendes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendes_user_id_foreign` (`user_id`),
  ADD KEY `attendes_attende_code_id_foreign` (`attende_code_id`),
  ADD KEY `attendes_attende_status_id_foreign` (`attende_status_id`);

--
-- Indeks untuk tabel `attende_codes`
--
ALTER TABLE `attende_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attende_codes_code_unique` (`code`),
  ADD KEY `attende_codes_code_type_id_foreign` (`code_type_id`);

--
-- Indeks untuk tabel `attende_statuses`
--
ALTER TABLE `attende_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `attende_types`
--
ALTER TABLE `attende_types`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indeks untuk tabel `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indeks untuk tabel `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `government_employee_groups`
--
ALTER TABLE `government_employee_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `leave_categories`
--
ALTER TABLE `leave_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indeks untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indeks untuk tabel `outstations`
--
ALTER TABLE `outstations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `outstations_user_id_foreign` (`user_id`),
  ADD KEY `outstations_approval_status_id_foreign` (`approval_status_id`);

--
-- Indeks untuk tabel `paid_leaves`
--
ALTER TABLE `paid_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paid_leaves_leave_category_id_foreign` (`leave_category_id`),
  ADD KEY `paid_leaves_user_id_foreign` (`user_id`),
  ADD KEY `paid_leaves_approval_status_id_foreign` (`approval_status_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indeks untuk tabel `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indeks untuk tabel `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_nip_unique` (`nip`),
  ADD KEY `users_gender_id_foreign` (`gender_id`),
  ADD KEY `users_department_id_foreign` (`department_id`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_government_employee_group_id_foreign` (`government_employee_group_id`);

--
-- Indeks untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absent_permissions`
--
ALTER TABLE `absent_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `approval_statuses`
--
ALTER TABLE `approval_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `attendes`
--
ALTER TABLE `attendes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `attende_codes`
--
ALTER TABLE `attende_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `attende_statuses`
--
ALTER TABLE `attende_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `attende_types`
--
ALTER TABLE `attende_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `genders`
--
ALTER TABLE `genders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `government_employee_groups`
--
ALTER TABLE `government_employee_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `leave_categories`
--
ALTER TABLE `leave_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `outstations`
--
ALTER TABLE `outstations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `paid_leaves`
--
ALTER TABLE `paid_leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `absent_permissions`
--
ALTER TABLE `absent_permissions`
  ADD CONSTRAINT `absent_permissions_approval_status_id_foreign` FOREIGN KEY (`approval_status_id`) REFERENCES `approval_statuses` (`id`),
  ADD CONSTRAINT `absent_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `attendes`
--
ALTER TABLE `attendes`
  ADD CONSTRAINT `attendes_attende_code_id_foreign` FOREIGN KEY (`attende_code_id`) REFERENCES `attende_codes` (`id`),
  ADD CONSTRAINT `attendes_attende_status_id_foreign` FOREIGN KEY (`attende_status_id`) REFERENCES `attende_statuses` (`id`),
  ADD CONSTRAINT `attendes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `attende_codes`
--
ALTER TABLE `attende_codes`
  ADD CONSTRAINT `attende_codes_code_type_id_foreign` FOREIGN KEY (`code_type_id`) REFERENCES `attende_types` (`id`);

--
-- Ketidakleluasaan untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `outstations`
--
ALTER TABLE `outstations`
  ADD CONSTRAINT `outstations_approval_status_id_foreign` FOREIGN KEY (`approval_status_id`) REFERENCES `approval_statuses` (`id`),
  ADD CONSTRAINT `outstations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `paid_leaves`
--
ALTER TABLE `paid_leaves`
  ADD CONSTRAINT `paid_leaves_approval_status_id_foreign` FOREIGN KEY (`approval_status_id`) REFERENCES `approval_statuses` (`id`),
  ADD CONSTRAINT `paid_leaves_leave_category_id_foreign` FOREIGN KEY (`leave_category_id`) REFERENCES `leave_categories` (`id`),
  ADD CONSTRAINT `paid_leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `users_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`),
  ADD CONSTRAINT `users_government_employee_group_id_foreign` FOREIGN KEY (`government_employee_group_id`) REFERENCES `government_employee_groups` (`id`),
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ketidakleluasaan untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
