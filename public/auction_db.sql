-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 06, 2023 at 10:38 PM
-- Server version: 8.0.33-0ubuntu0.20.04.2
-- PHP Version: 7.4.3-4ubuntu2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auction_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auctions`
--

CREATE TABLE `auctions` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int NOT NULL DEFAULT '0',
  `bid_price` int NOT NULL DEFAULT '0',
  `start_dateTime` int NOT NULL DEFAULT '0',
  `end_dateTime` int NOT NULL DEFAULT '0',
  `min_increament` int NOT NULL DEFAULT '0',
  `is_active` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auctions`
--

INSERT INTO `auctions` (`id`, `product_id`, `bid_price`, `start_dateTime`, `end_dateTime`, `min_increament`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 7, 23243434, 1686700800, 1686960000, 0, 0, '2023-06-05 04:41:38', '2023-06-05 04:50:47'),
(2, 8, 2324, 1686700800, 1686787200, 0, 0, '2023-06-05 04:50:16', '2023-06-05 05:24:28'),
(3, 6, 23243434, 1686700800, 1686960000, 0, 1, '2023-06-05 04:51:24', '2023-06-05 04:51:24'),
(4, 2, 1234, 1680566400, 1701129600, 0, 1, '2023-06-05 08:15:36', '2023-06-05 08:20:24');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '0',
  `is_featured` int NOT NULL DEFAULT '0',
  `is_trending` int NOT NULL DEFAULT '0',
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `featured_img`, `is_active`, `is_featured`, `is_trending`, `image_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'sfdsf', 'dsfsd', NULL, 1, 0, 1, NULL, '2023-05-27 11:52:39', '2023-06-01 12:30:22', NULL),
(5, 'yesy', NULL, NULL, 0, 0, 0, NULL, '2023-05-27 11:54:50', '2023-06-01 12:30:14', NULL),
(6, 'sdfdsf', NULL, NULL, 0, 0, 0, NULL, '2023-05-27 11:55:06', '2023-05-27 11:55:06', NULL),
(8, NULL, NULL, NULL, 0, 0, 0, NULL, '2023-05-27 11:58:08', '2023-05-27 11:58:08', NULL),
(10, '0', 'sdfs', NULL, 0, 0, 0, NULL, '2023-05-27 12:00:39', '2023-05-27 12:00:39', NULL),
(11, '0', NULL, NULL, 0, 0, 0, NULL, '2023-05-27 12:00:53', '2023-05-27 12:00:53', NULL),
(12, '0', NULL, NULL, 0, 0, 0, NULL, '2023-05-27 12:01:03', '2023-05-27 12:01:03', NULL),
(13, '0', NULL, NULL, 0, 0, 0, NULL, '2023-05-27 12:02:27', '2023-06-04 06:01:25', NULL),
(14, NULL, NULL, NULL, 0, 0, 0, NULL, '2023-05-27 12:04:29', '2023-05-27 12:04:29', NULL),
(15, '1', NULL, NULL, 0, 0, 0, NULL, '2023-05-27 23:39:21', '2023-05-27 23:39:21', NULL),
(16, 'fsdf', NULL, NULL, 1, 1, 1, NULL, '2023-05-27 23:45:56', '2023-05-27 23:45:56', NULL),
(17, 'sadsad', NULL, NULL, 0, 0, 0, NULL, '2023-05-27 23:46:09', '2023-05-27 23:46:09', NULL),
(18, 'sadsasadasdsad', NULL, NULL, 1, 1, 1, NULL, '2023-05-27 23:46:20', '2023-05-27 23:46:20', NULL),
(19, 'sadsadasd', NULL, NULL, 0, 1, 0, NULL, '2023-05-27 23:50:53', '2023-05-27 23:50:53', NULL),
(20, 'sadsadasd', NULL, NULL, 0, 1, 0, NULL, '2023-05-27 23:51:34', '2023-05-27 23:51:34', NULL),
(21, 'sdsad', 'asdsad', NULL, 1, 1, 1, NULL, '2023-05-27 23:51:47', '2023-05-30 12:45:20', NULL),
(22, 'sdfsdfsf', NULL, NULL, 0, 1, 0, NULL, '2023-05-27 23:54:35', '2023-05-27 23:54:35', NULL),
(23, 'sddf', NULL, NULL, 0, 0, 0, NULL, '2023-05-27 23:55:42', '2023-05-27 23:55:42', NULL),
(24, 'sdsad', NULL, NULL, 0, 0, 0, NULL, '2023-05-27 23:56:12', '2023-05-27 23:56:12', NULL),
(25, 'sadsa', NULL, NULL, 0, 0, 0, NULL, '2023-05-27 23:56:56', '2023-05-27 23:56:56', NULL),
(26, 'sadsa', NULL, NULL, 0, 0, 0, NULL, '2023-05-27 23:57:13', '2023-05-27 23:57:13', NULL),
(27, 'sadsa', NULL, NULL, 0, 0, 0, NULL, '2023-05-27 23:57:41', '2023-05-27 23:57:41', NULL),
(28, 'sdfdf', 'dsadasd', NULL, 0, 1, 1, NULL, '2023-05-28 00:51:13', '2023-05-28 00:51:13', NULL),
(29, 'sdfdf', 'dsadasd', NULL, 0, 1, 1, NULL, '2023-05-28 00:51:55', '2023-05-28 00:51:55', NULL),
(30, 'sdfdf', 'dsadasd', NULL, 0, 1, 1, NULL, '2023-05-28 00:54:29', '2023-05-28 00:54:29', NULL),
(31, 'sdfdf', 'dsadasd', NULL, 0, 1, 1, NULL, '2023-05-28 00:55:16', '2023-05-28 00:55:16', NULL),
(32, 'sdfdf', 'dsadasd', NULL, 0, 1, 1, NULL, '2023-05-28 00:55:54', '2023-05-28 00:55:54', NULL),
(33, 'dsfdf', NULL, NULL, 1, 1, 0, NULL, '2023-05-28 00:56:25', '2023-05-28 00:56:25', NULL),
(34, 'ddsad', 'adad', NULL, 1, 1, 0, NULL, '2023-05-28 00:57:43', '2023-06-04 07:03:26', '2023-06-04 07:03:26'),
(35, 'dssfsdf', NULL, NULL, 0, 1, 1, NULL, '2023-05-28 00:58:44', '2023-06-04 07:03:21', '2023-06-04 07:03:21'),
(37, 'sfd', NULL, NULL, 1, 1, 0, NULL, '2023-05-28 01:00:47', '2023-05-28 01:00:47', NULL),
(38, 'sfd', NULL, NULL, 0, 0, 0, NULL, '2023-05-28 01:01:28', '2023-06-04 10:58:01', NULL),
(39, 'qwdssad', NULL, NULL, 0, 0, 0, NULL, '2023-05-28 01:03:37', '2023-06-04 10:57:44', NULL),
(41, 'dsfdsfsdfdsfdsfsdf', NULL, NULL, 1, 1, 1, NULL, '2023-05-28 01:05:14', '2023-06-04 06:01:29', NULL),
(44, 'sasadup-up30', 'assadup2', NULL, 1, 1, 1, '1685256507_category_image.jpeg', '2023-05-28 01:35:57', '2023-06-04 07:05:22', NULL),
(45, 'new fields', 'new desc', NULL, 1, 1, 1, '1685721453_category_image.jpeg', '2023-06-02 10:57:33', '2023-06-04 07:05:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `content_types`
--

CREATE TABLE `content_types` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int NOT NULL DEFAULT '0',
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `value`, `product_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '3_270289908_gallery_image.jpeg', 3, 1, '2023-06-03 03:24:54', '2023-06-03 03:24:54'),
(10, '3_359268851_gallery_image.jpg', 3, 1, '2023-06-04 02:46:12', '2023-06-04 02:46:12'),
(11, '8_891786550_gallery_image.jpeg', 8, 1, '2023-06-04 03:35:06', '2023-06-04 03:35:06'),
(12, '8_493750222_gallery_image.jpeg', 8, 1, '2023-06-04 03:35:06', '2023-06-04 03:35:06'),
(13, '8_502696637_gallery_image.png', 8, 1, '2023-06-04 03:35:06', '2023-06-04 03:35:06'),
(14, '8_1955123688_gallery_image.jpg', 8, 1, '2023-06-04 03:35:06', '2023-06-04 03:35:06'),
(15, '8_1179119380_gallery_image.jpg', 8, 1, '2023-06-04 03:35:07', '2023-06-04 03:35:07'),
(16, '7_1166321081_gallery_image.jpeg', 7, 1, '2023-06-04 03:36:08', '2023-06-04 03:36:08'),
(17, '7_1532996573_gallery_image.jpeg', 7, 1, '2023-06-04 03:36:08', '2023-06-04 03:36:08'),
(18, '7_288660964_gallery_image.png', 7, 1, '2023-06-04 03:36:08', '2023-06-04 03:36:08'),
(19, '7_1849881529_gallery_image.jpg', 7, 1, '2023-06-04 03:36:08', '2023-06-04 03:36:08'),
(20, '7_1798483354_gallery_image.jpg', 7, 1, '2023-06-04 03:36:08', '2023-06-04 03:36:08');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(13, '2023_05_21_085601_create_permission_tables', 2),
(15, '2014_10_12_000000_create_users_table', 4),
(16, '2023_03_02_211347_create_categories', 5),
(17, '2023_06_01_161710_create_products_table', 6),
(18, '2023_06_03_080835_create_tags_table', 7),
(19, '2023_06_03_081349_create_gallery_table', 8),
(21, '2023_06_04_155147_create_content_types_table', 9),
(22, '2023_06_04_155845_create_auctions_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(1, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 12),
(1, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 14),
(3, 'App\\Models\\User', 15),
(1, 'App\\Models\\User', 16);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'add product', 'web', '2023-05-23 12:04:05', '2023-05-23 12:04:05'),
(2, 'edit product', 'web', '2023-05-23 12:04:05', '2023-05-23 12:04:05'),
(3, 'delete product', 'web', '2023-05-23 12:04:05', '2023-05-23 12:04:05'),
(4, 'listing product', 'web', '2023-05-23 12:04:05', '2023-05-23 12:04:05'),
(5, 'add categories', 'web', '2023-05-28 11:54:29', '2023-05-28 11:54:29'),
(6, 'edit categories', 'web', '2023-05-28 11:54:29', '2023-05-28 11:54:29'),
(7, 'delete categories', 'web', '2023-05-28 11:54:29', '2023-05-28 11:54:29'),
(8, 'listing categories', 'web', '2023-05-28 11:54:29', '2023-05-28 11:54:29'),
(9, 'add users', 'web', '2023-05-28 12:21:34', '2023-05-28 12:21:34'),
(10, 'edit users', 'web', '2023-05-28 12:21:34', '2023-05-28 12:21:34'),
(11, 'delete users', 'web', '2023-05-28 12:21:34', '2023-05-28 12:21:34'),
(12, 'listing users', 'web', '2023-05-28 12:21:34', '2023-05-28 12:21:34'),
(13, 'edit permissions', 'web', '2023-05-31 09:29:10', '2023-05-31 09:29:10'),
(14, 'listing permissions', 'web', '2023-05-31 10:06:51', '2023-05-31 10:06:51'),
(15, 'listing dashboard', 'web', '2023-05-31 10:33:01', '2023-05-31 10:33:01'),
(16, 'listing auction', 'web', '2023-06-04 11:06:15', '2023-06-04 11:06:15'),
(17, 'edit auction', 'web', '2023-06-04 11:06:56', '2023-06-04 11:06:56'),
(18, 'add auction', 'web', '2023-06-04 11:07:03', '2023-06-04 11:07:03'),
(19, 'delete auction', 'web', '2023-06-04 11:07:11', '2023-06-04 11:07:11');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Title not available',
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `featured_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prod_gallery` blob,
  `tags` blob,
  `category_id` int DEFAULT NULL,
  `sale_price` int DEFAULT NULL,
  `regular_price` int DEFAULT NULL,
  `shipping_id` int DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disp_order` int DEFAULT NULL,
  `is_visible` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `short_description`, `description`, `featured_image`, `prod_gallery`, `tags`, `category_id`, `sale_price`, `regular_price`, `shipping_id`, `sku`, `disp_order`, `is_visible`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Title not available', 'desc', '<p>fsdfsdfsdfds</p>', '1_958717557_featured_image.png', NULL, NULL, 18, 10, 8, NULL, NULL, 1685779310, 1, '2023-06-03 03:01:50', '2023-06-03 03:01:50', NULL),
(2, 'title', 'short desc', '<p>description main</p>', '2_247432338_featured_image.png', NULL, NULL, NULL, 12, 4, NULL, NULL, 1685779554, 1, '2023-06-03 03:05:54', '2023-06-03 03:05:54', NULL),
(3, 'title-update2', 'des-update2', '<p>2qq2331233-update</p>', '3_713271164_featured_image.jpg', NULL, NULL, 4, 2334, 323, NULL, NULL, 1685864958, 1, '2023-06-03 03:24:54', NULL, NULL),
(4, 'final product', 'this is the short description of product', '<ol>\r\n<li>one</li>\r\n<li>two</li>\r\n<li>three\r\n<table style=\"border-collapse: collapse; width: 100%; height: 89.5624px;\" border=\"1\"><colgroup><col style=\"width: 24.9756%;\"><col style=\"width: 24.9756%;\"><col style=\"width: 24.9756%;\"><col style=\"width: 24.9756%;\"></colgroup>\r\n<tbody>\r\n<tr style=\"height: 22.3906px;\">\r\n<td style=\"height: 22.3906px;\">1</td>\r\n<td style=\"height: 22.3906px;\">2</td>\r\n<td style=\"height: 22.3906px;\">3</td>\r\n<td style=\"height: 22.3906px;\">4</td>\r\n</tr>\r\n<tr style=\"height: 22.3906px;\">\r\n<td style=\"height: 22.3906px;\">row</td>\r\n<td style=\"height: 22.3906px;\"><strong>row1</strong></td>\r\n<td style=\"height: 22.3906px;\">row1</td>\r\n<td style=\"height: 22.3906px;\">row1</td>\r\n</tr>\r\n<tr style=\"height: 22.3906px;\">\r\n<td style=\"height: 22.3906px;\">row</td>\r\n<td style=\"height: 22.3906px;\">row1</td>\r\n<td style=\"height: 22.3906px;\"><strong>row1</strong></td>\r\n<td style=\"height: 22.3906px;\">row1</td>\r\n</tr>\r\n<tr style=\"height: 22.3906px;\">\r\n<td style=\"height: 22.3906px;\">row</td>\r\n<td style=\"height: 22.3906px;\"><em>row1</em></td>\r\n<td style=\"height: 22.3906px;\">row1</td>\r\n<td style=\"height: 22.3906px;\"><em>row1</em></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</li>\r\n</ol>\r\n<p>good one</p>\r\n<p>&nbsp;</p>', NULL, NULL, NULL, 41, 500, 400, NULL, NULL, 1685790641, 1, '2023-06-03 06:10:41', '2023-06-04 01:26:40', NULL),
(5, 'ewqqe', '', '', NULL, NULL, NULL, 4, 10, 5, NULL, NULL, 1685866548, 0, '2023-06-04 03:15:48', '2023-06-04 03:15:48', NULL),
(6, 'q', 'w', '', NULL, NULL, NULL, 4, 5, 10, NULL, NULL, 1685866563, 1, '2023-06-04 03:16:03', '2023-06-04 03:46:34', NULL),
(7, 'asas-update', 'wewq', '<p>aSAs</p>', '7_398892952_featured_image.jpeg', NULL, NULL, 4, 1212, 233, NULL, NULL, 1685867768, 1, '2023-06-04 03:18:08', '2023-06-04 07:06:14', NULL),
(8, 'finela one', 'filena one des', '<p>dfdsfdsf</p>', '8_479229684_featured_image.jpg', NULL, NULL, 18, 100, 80, NULL, NULL, 1685867706, 1, '2023-06-04 03:35:07', '2023-06-04 07:06:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2023-05-21 13:15:09', '2023-05-21 13:15:09'),
(2, 'staff', 'web', '2023-05-25 10:08:24', '2023-05-25 10:08:24'),
(3, 'user', 'web', '2023-05-25 10:08:33', '2023-05-25 10:08:33');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(6, 2),
(7, 2),
(11, 2),
(13, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int NOT NULL DEFAULT '0',
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `value`, `product_id`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'erer', 3, 1, '2023-06-03 03:24:54', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(2, 'erer', 3, 1, '2023-06-03 03:24:54', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(3, 'erer', 3, 1, '2023-06-03 03:24:54', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(4, 'erer', 3, 1, '2023-06-03 03:24:54', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(5, 'er', 3, 1, '2023-06-03 03:24:54', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(6, 'df', 3, 1, '2023-06-03 03:24:54', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(7, 'ali', 4, 1, '2023-06-03 06:10:41', '2023-06-03 06:10:41', NULL),
(8, 'one', 4, 1, '2023-06-03 06:10:41', '2023-06-03 06:10:41', NULL),
(9, 'two', 4, 1, '2023-06-03 06:10:41', '2023-06-03 06:10:41', NULL),
(10, 'three', 4, 1, '2023-06-03 06:10:41', '2023-06-03 06:10:41', NULL),
(11, 'four', 4, 1, '2023-06-03 06:10:41', '2023-06-03 06:10:41', NULL),
(12, 'five', 4, 1, '2023-06-03 06:10:41', '2023-06-03 06:10:41', NULL),
(13, 'erer', 3, 1, '2023-06-04 02:40:46', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(14, 'erer', 3, 1, '2023-06-04 02:40:46', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(15, 'erer', 3, 1, '2023-06-04 02:40:46', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(16, 'erer', 3, 1, '2023-06-04 02:40:46', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(17, 'er', 3, 1, '2023-06-04 02:40:46', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(18, 'df', 3, 1, '2023-06-04 02:40:46', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(19, 'erer', 3, 1, '2023-06-04 02:43:58', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(20, 'erer', 3, 1, '2023-06-04 02:43:58', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(21, 'erer', 3, 1, '2023-06-04 02:43:58', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(22, 'erer', 3, 1, '2023-06-04 02:43:58', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(23, 'er', 3, 1, '2023-06-04 02:43:58', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(24, 'df', 3, 1, '2023-06-04 02:43:58', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(25, 'erer', 3, 1, '2023-06-04 02:43:58', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(26, 'erer', 3, 1, '2023-06-04 02:43:58', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(27, 'erer', 3, 1, '2023-06-04 02:43:58', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(28, 'erer', 3, 1, '2023-06-04 02:43:58', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(29, 'er', 3, 1, '2023-06-04 02:43:58', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(30, 'df', 3, 1, '2023-06-04 02:43:58', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(31, 'erer', 3, 1, '2023-06-04 02:44:39', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(32, 'erer', 3, 1, '2023-06-04 02:44:39', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(33, 'erer', 3, 1, '2023-06-04 02:44:39', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(34, 'erer', 3, 1, '2023-06-04 02:44:39', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(35, 'er', 3, 1, '2023-06-04 02:44:39', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(36, 'df', 3, 1, '2023-06-04 02:44:39', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(37, 'erer', 3, 1, '2023-06-04 02:44:39', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(38, 'erer', 3, 1, '2023-06-04 02:44:39', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(39, 'erer', 3, 1, '2023-06-04 02:44:39', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(40, 'erer', 3, 1, '2023-06-04 02:44:39', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(41, 'er', 3, 1, '2023-06-04 02:44:39', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(42, 'df', 3, 1, '2023-06-04 02:44:39', '2023-06-04 02:44:39', '2023-06-04 02:44:39'),
(43, 'q', 3, 1, '2023-06-04 02:45:33', '2023-06-04 02:45:53', '2023-06-04 02:45:53'),
(44, 'w', 3, 1, '2023-06-04 02:45:33', '2023-06-04 02:45:53', '2023-06-04 02:45:53'),
(45, 'e', 3, 1, '2023-06-04 02:45:33', '2023-06-04 02:45:53', '2023-06-04 02:45:53'),
(46, 'r', 3, 1, '2023-06-04 02:45:33', '2023-06-04 02:45:53', '2023-06-04 02:45:53'),
(47, 't', 3, 1, '2023-06-04 02:45:33', '2023-06-04 02:45:53', '2023-06-04 02:45:53'),
(48, 'y', 3, 1, '2023-06-04 02:45:33', '2023-06-04 02:45:53', '2023-06-04 02:45:53'),
(49, 'u', 3, 1, '2023-06-04 02:45:33', '2023-06-04 02:45:53', '2023-06-04 02:45:53'),
(50, 'i', 3, 1, '2023-06-04 02:45:33', '2023-06-04 02:45:53', '2023-06-04 02:45:53'),
(51, 'o', 3, 1, '2023-06-04 02:45:33', '2023-06-04 02:45:53', '2023-06-04 02:45:53'),
(52, 'p', 3, 1, '2023-06-04 02:45:33', '2023-06-04 02:45:53', '2023-06-04 02:45:53'),
(53, 'q', 3, 1, '2023-06-04 02:45:53', '2023-06-04 02:46:12', '2023-06-04 02:46:12'),
(54, 'w', 3, 1, '2023-06-04 02:45:53', '2023-06-04 02:46:12', '2023-06-04 02:46:12'),
(55, 'e', 3, 1, '2023-06-04 02:45:53', '2023-06-04 02:46:12', '2023-06-04 02:46:12'),
(56, 'r', 3, 1, '2023-06-04 02:45:53', '2023-06-04 02:46:12', '2023-06-04 02:46:12'),
(57, 't', 3, 1, '2023-06-04 02:45:53', '2023-06-04 02:46:12', '2023-06-04 02:46:12'),
(58, 'y', 3, 1, '2023-06-04 02:45:53', '2023-06-04 02:46:12', '2023-06-04 02:46:12'),
(59, 'u', 3, 1, '2023-06-04 02:45:53', '2023-06-04 02:46:12', '2023-06-04 02:46:12'),
(60, 'q', 3, 1, '2023-06-04 02:46:12', '2023-06-04 02:49:18', '2023-06-04 02:49:18'),
(61, 'w', 3, 1, '2023-06-04 02:46:12', '2023-06-04 02:49:18', '2023-06-04 02:49:18'),
(62, 'e', 3, 1, '2023-06-04 02:46:12', '2023-06-04 02:49:18', '2023-06-04 02:49:18'),
(63, 'r', 3, 1, '2023-06-04 02:46:12', '2023-06-04 02:49:18', '2023-06-04 02:49:18'),
(64, 't', 3, 1, '2023-06-04 02:46:12', '2023-06-04 02:49:18', '2023-06-04 02:49:18'),
(65, 'y', 3, 1, '2023-06-04 02:46:12', '2023-06-04 02:49:18', '2023-06-04 02:49:18'),
(66, 'u', 3, 1, '2023-06-04 02:46:12', '2023-06-04 02:49:18', '2023-06-04 02:49:18'),
(67, 'q', 3, 1, '2023-06-04 02:49:18', '2023-06-04 02:49:18', NULL),
(68, 'w', 3, 1, '2023-06-04 02:49:18', '2023-06-04 02:49:18', NULL),
(69, 'e', 3, 1, '2023-06-04 02:49:18', '2023-06-04 02:49:18', NULL),
(70, 'r', 3, 1, '2023-06-04 02:49:18', '2023-06-04 02:49:18', NULL),
(71, 't', 3, 1, '2023-06-04 02:49:18', '2023-06-04 02:49:18', NULL),
(72, 'y', 3, 1, '2023-06-04 02:49:18', '2023-06-04 02:49:18', NULL),
(73, 'u', 3, 1, '2023-06-04 02:49:18', '2023-06-04 02:49:18', NULL),
(74, '12sd', 8, 1, '2023-06-04 03:35:07', '2023-06-04 03:35:07', NULL),
(75, 'wewe', 8, 1, '2023-06-04 03:35:07', '2023-06-04 03:35:07', NULL),
(76, 'we', 8, 1, '2023-06-04 03:35:07', '2023-06-04 03:35:07', NULL),
(77, 'we', 8, 1, '2023-06-04 03:35:07', '2023-06-04 03:35:07', NULL),
(78, 'we', 8, 1, '2023-06-04 03:35:07', '2023-06-04 03:35:07', NULL),
(79, 'w', 8, 1, '2023-06-04 03:35:07', '2023-06-04 03:35:07', NULL),
(80, 'e', 8, 1, '2023-06-04 03:35:07', '2023-06-04 03:35:07', NULL),
(81, 'qeqq', 7, 1, '2023-06-04 03:36:08', '2023-06-04 03:36:08', NULL),
(82, 'qwew', 7, 1, '2023-06-04 03:36:08', '2023-06-04 03:36:08', NULL),
(83, 'wqeqwe', 7, 1, '2023-06-04 03:36:08', '2023-06-04 03:36:08', NULL),
(84, 'wqqe', 7, 1, '2023-06-04 03:36:08', '2023-06-04 03:36:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int NOT NULL DEFAULT '0',
  `last_active` int NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `is_active`, `last_active`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'irfan@gmail.com', '$2y$10$22QrVBSE285DGsFlb4Iil.Tg4FHobbXx3Xxuj8Vcrnz46MshBY0zC', 1, 1, NULL, NULL, '2023-05-27 08:12:02', '2023-05-27 08:12:02', NULL),
(2, 'staff', 'staff@gmail.com', '$2y$10$/Si40EEEjOFePw6zBl4ZyOgkpU7Qy0WOP1NQ0Bl20ybJPuW/daDBO', 1, 1, NULL, NULL, '2023-05-28 05:19:18', '2023-06-02 11:43:42', NULL),
(12, 'new field', 'new@gmail.com', '$2y$10$pTHIpAfT98yK7RHMvupBQ.4AZRxETid8QidSPdU2ghsAGpt1X1qve', 1, 1, NULL, NULL, '2023-06-02 11:42:44', '2023-06-02 11:45:53', '2023-06-02 11:45:53'),
(13, 'admin', 'admin@admin.com', '$2y$10$2/OP82VOBz3QEDmG9pA5eeh2dzjh0hAJyqE/b0Oyecc7aAQJEQvGq', 1, 1, NULL, NULL, '2023-06-04 10:45:15', '2023-06-04 10:45:15', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auctions`
--
ALTER TABLE `auctions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_types`
--
ALTER TABLE `content_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auctions`
--
ALTER TABLE `auctions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `content_types`
--
ALTER TABLE `content_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
