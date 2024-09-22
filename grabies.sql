-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 22, 2024 at 11:43 AM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grabies`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int DEFAULT '0',
  `content_heading` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `button`, `button_text`, `is_active`, `content_heading`, `content_desc`, `created_at`, `updated_at`) VALUES
(1, '1694143424_banner_image.jpg', 'shop', 'shop', 0, 'Welcom to Hafiz Tayyab\'s Store', 'See how your users experience your website in realtime or view trends to see any changes in performance over time.', '2023-09-02 00:59:52', '2024-01-31 18:00:31'),
(3, '1706723260_banner_image.png', '', '', 1, 'New Arrival', '', '2023-09-02 01:42:07', '2024-01-31 17:47:40'),
(4, '1706724018_banner_image.jpg', '', '', 1, 'Grand Opeing', '', '2023-09-02 01:58:59', '2024-01-31 18:00:18');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `user_id`, `count`, `created_at`, `updated_at`) VALUES
(95, 4, 13, 1, '2023-07-03 23:40:52', '2023-07-03 23:40:52'),
(100, 9, 13, 1, '2023-07-03 23:48:19', '2023-07-03 23:48:19'),
(135, 9, 14, 1, '2023-09-03 22:28:38', '2023-09-03 22:28:38'),
(173, 5, 28, 1, '2023-09-30 04:25:35', '2023-09-30 04:25:35'),
(181, 13, 37, 1, '2024-01-31 18:03:42', '2024-01-31 18:03:42'),
(182, 10, 37, 1, '2024-01-31 18:03:45', '2024-01-31 18:03:45'),
(183, 2, 37, 1, '2024-01-31 18:03:47', '2024-01-31 18:03:47'),
(184, 9, 37, 1, '2024-01-31 18:03:50', '2024-01-31 18:03:50'),
(185, 14, 37, 1, '2024-01-31 18:03:52', '2024-01-31 18:03:52');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '0',
  `is_featured` int NOT NULL DEFAULT '0',
  `is_trending` int NOT NULL DEFAULT '0',
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `featured_img`, `is_active`, `is_featured`, `is_trending`, `image_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(33, 'Electronics', NULL, NULL, 0, 1, 1, '1694185845_category_image.jpg', '2023-05-28 00:56:25', '2024-01-31 17:15:54', NULL),
(37, 'Systems', NULL, NULL, 0, 1, 0, '1688484574_category_image.png', '2023-05-28 01:00:47', '2024-01-31 17:15:54', NULL),
(38, 'Cotton', 'Cotton is our strong area where we can proudly say that we are the best in the town or most precisely we can say the Muhajar Cloth House is one of the best in the world in Cotton fabrics.', NULL, 1, 1, 1, '1706722588_category_image.png', '2023-05-28 01:01:28', '2024-01-31 18:01:30', NULL),
(39, 'deals', NULL, NULL, 0, 0, 1, '1688753275_category_image.png', '2023-05-28 01:03:37', '2024-01-31 17:15:48', NULL),
(41, 'Watches', NULL, NULL, 0, 0, 1, '1688484707_category_image.jpg', '2023-05-28 01:05:14', '2024-01-31 17:15:47', NULL),
(45, 'Khaddar', 'Khaddar is suitable for sensitive skin. It keeps the body cool in summer as it allows air ventilation. It can absorb moisture and sweat, making it the perfect choice for summers.', NULL, 1, 1, 1, '1706720539_category_image.jpg', '2023-06-02 10:57:33', '2024-01-31 18:01:16', NULL),
(46, 'Lawn', 'The lawn\'s lightness makes it ideal for warm climates since it provides breathability and comfort when worn.', NULL, 1, 1, 1, '1706546527_category_image.jpg', '2024-01-29 16:42:07', '2024-01-31 17:15:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `content_types`
--

DROP TABLE IF EXISTS `content_types`;
CREATE TABLE IF NOT EXISTS `content_types` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
CREATE TABLE IF NOT EXISTS `gallery` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int NOT NULL DEFAULT '0',
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `value`, `product_id`, `is_active`, `created_at`, `updated_at`) VALUES
(12, '8_493750222_gallery_image.jpeg', 8, 1, '2023-06-04 03:35:06', '2023-06-04 03:35:06'),
(14, '8_1955123688_gallery_image.jpg', 8, 1, '2023-06-04 03:35:06', '2023-06-04 03:35:06'),
(15, '8_1179119380_gallery_image.jpg', 8, 1, '2023-06-04 03:35:07', '2023-06-04 03:35:07'),
(21, '9_95636850_gallery_image.jpg', 9, 1, '2023-06-10 14:09:09', '2023-06-10 14:09:09'),
(22, '9_744461474_gallery_image.png', 9, 1, '2023-06-10 14:09:09', '2023-06-10 14:09:09'),
(23, '9_1006726023_gallery_image.jpeg', 9, 1, '2023-06-10 14:09:09', '2023-06-10 14:09:09'),
(24, '9_425315191_gallery_image.jpg', 9, 1, '2023-06-10 14:09:09', '2023-06-10 14:09:09'),
(25, '9_2046102366_gallery_image.png', 9, 1, '2023-06-10 14:09:09', '2023-06-10 14:09:09'),
(26, '10_139853617_gallery_image.jpg', 10, 1, '2023-06-11 02:10:33', '2023-06-11 02:10:33'),
(27, '10_2087505767_gallery_image.jpg', 10, 1, '2023-06-11 02:10:33', '2023-06-11 02:10:33'),
(28, '10_2055217367_gallery_image.png', 10, 1, '2023-06-11 02:10:33', '2023-06-11 02:10:33'),
(29, '11_1920496449_gallery_image.png', 11, 1, '2023-07-28 09:10:19', '2023-07-28 09:10:19'),
(30, '11_346175367_gallery_image.png', 11, 1, '2023-07-28 09:10:19', '2023-07-28 09:10:19'),
(31, '5_1764203374_gallery_image.jpg', 5, 1, '2023-09-09 10:27:14', '2023-09-09 10:27:14'),
(32, '5_1901535028_gallery_image.jpg', 5, 1, '2023-09-09 10:27:14', '2023-09-09 10:27:14'),
(33, '5_811473796_gallery_image.jpg', 5, 1, '2023-09-09 10:27:14', '2023-09-09 10:27:14'),
(34, '5_1121775890_gallery_image.jpg', 5, 1, '2023-09-09 10:27:14', '2023-09-09 10:27:14'),
(35, '12_611336177_gallery_image.jpg', 12, 1, '2023-09-14 11:19:33', '2023-09-14 11:19:33'),
(36, '12_806642928_gallery_image.jpg', 12, 1, '2023-09-14 11:19:33', '2023-09-14 11:19:33'),
(37, '13_661151115_gallery_image.png', 13, 1, '2023-09-30 02:52:01', '2023-09-30 02:52:01'),
(38, '13_2139092227_gallery_image.png', 13, 1, '2023-09-30 02:52:01', '2023-09-30 02:52:01'),
(39, '13_88468499_gallery_image.png', 13, 1, '2023-09-30 02:52:32', '2023-09-30 02:52:32'),
(40, '13_725275048_gallery_image.png', 13, 1, '2023-09-30 02:52:32', '2023-09-30 02:52:32'),
(42, '14_1577133158_gallery_image.png', 14, 1, '2024-01-29 16:49:33', '2024-01-29 16:49:33'),
(43, '14_1878868889_gallery_image.jpg', 14, 1, '2024-01-29 16:49:33', '2024-01-29 16:49:33'),
(45, '14_1961811242_gallery_image.jpg', 14, 1, '2024-01-29 16:49:33', '2024-01-29 16:49:33'),
(46, '14_1326227967_gallery_image.jpeg', 14, 1, '2024-01-29 16:49:33', '2024-01-29 16:49:33'),
(47, '14_642928257_gallery_image.png', 14, 1, '2024-01-29 16:49:33', '2024-01-29 16:49:33'),
(48, '14_1852700016_gallery_image.png', 14, 1, '2024-01-29 16:49:33', '2024-01-29 16:49:33'),
(49, '2_1479531126_gallery_image.jpg', 2, 1, '2024-02-01 05:54:33', '2024-02-01 05:54:33'),
(50, '3_424168738_gallery_image.jpg', 3, 1, '2024-02-01 06:01:03', '2024-02-01 06:01:03'),
(51, '1_1986025377_gallery_image.png', 1, 1, '2024-02-03 07:24:25', '2024-02-03 07:24:25'),
(52, '1_442136511_gallery_image.png', 1, 1, '2024-02-03 07:24:25', '2024-02-03 07:24:25'),
(53, '1_1235355197_gallery_image.png', 1, 1, '2024-02-03 07:24:25', '2024-02-03 07:24:25'),
(54, '1_2098123174_gallery_image.png', 1, 1, '2024-02-03 07:24:25', '2024-02-03 07:24:25');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `reply_to` int DEFAULT NULL,
  `reply_for` int DEFAULT NULL,
  `read_at` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `reply_to`, `reply_for`, `read_at`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 1687713974, 'ddsf', 'sssd@sa.ssd', 'sadsdsd', 'sdsadsadsd', '2023-06-25 05:03:00', '2023-06-25 12:26:14'),
(2, 14, NULL, NULL, 1687713973, 'user', 'user@user.com', 'dfdfsd', 'dsfsdfdsfd', '2023-06-25 05:27:43', '2023-06-25 12:26:13'),
(3, 14, NULL, NULL, 1687713971, 'user', 'user@user.com', 'dfdfsd', 'dsfsdfdsfd', '2023-06-25 05:34:39', '2023-06-25 12:26:11'),
(7, 14, NULL, NULL, 1687713969, 'user', 'user@user.com', 'dfdfsd', 'dsfsdfdsfd', '2023-06-25 05:36:43', '2023-06-25 12:26:09'),
(8, 14, NULL, NULL, 1687713967, 'user', 'user@user.com', 'dfdfsd', 'dsfsdfdsfd', '2023-06-25 05:37:10', '2023-06-25 12:26:07'),
(10, 14, NULL, NULL, 1687709530, 'user', 'user@user.com', 'sdsad', 'sdsa', '2023-06-25 05:37:37', '2023-06-25 11:12:10'),
(11, 13, NULL, NULL, 1687714646, 'admin', 'admin@admin.com', 'ssd', 'sdsdsdsd', '2023-06-25 12:37:00', '2023-06-25 12:37:26'),
(12, 13, NULL, NULL, 1687716176, 'admin', 'admin@admin.com', 'dfdsf', 'dfdsf', '2023-06-25 12:39:13', '2023-06-25 13:02:56'),
(13, 13, NULL, NULL, 1687716174, 'admin', 'admin@admin.com', 'sdsd', 'sdsd', '2023-06-25 12:39:49', '2023-06-25 13:02:54'),
(14, 13, NULL, NULL, 1687716172, 'admin', 'admin@admin.com', 'kklk', 'ghghg', '2023-06-25 12:47:30', '2023-06-25 13:02:52'),
(15, 13, NULL, NULL, 1687716170, 'admin', 'admin@admin.com', 'dfdsf', 'dsfdsf', '2023-06-25 12:55:35', '2023-06-25 13:02:50'),
(16, 13, NULL, NULL, 1687716169, 'admin', 'admin@admin.com', 'sds', 'sdsd', '2023-06-25 12:58:07', '2023-06-25 13:02:49'),
(17, 13, NULL, NULL, 1687716166, 'admin', 'admin@admin.com', 'sddsd', 'ssdd', '2023-06-25 12:59:17', '2023-06-25 13:02:46'),
(18, NULL, NULL, NULL, 1688887859, 'sdasd', 'sadsad@sdsd.sdsd', 'asdsad', 'sadsdsad', '2023-07-05 13:34:30', '2023-07-09 02:30:59'),
(19, NULL, NULL, NULL, 1688887874, 'sdasd', 'sadsad@sdsd.sdsd', 'asdsad', 'sadsdsad', '2023-07-05 13:35:13', '2023-07-09 02:31:14'),
(20, NULL, NULL, NULL, 1688887857, 'sdasd', 'sadsad@sdsd.sdsd', 'asdsad', 'sadsdsad', '2023-07-05 13:36:02', '2023-07-09 02:30:57'),
(21, NULL, NULL, NULL, 1688887872, 'sdasd', 'sadsad@sdsd.sdsd', 'asdsad', 'sadsdsad', '2023-07-05 13:36:53', '2023-07-09 02:31:12'),
(22, NULL, NULL, NULL, 1688887855, 'wewe', 'ewwe@ssds.sdsd', 'sdsad', 'sdsadasdasdsad', '2023-07-05 13:37:20', '2023-07-09 02:30:55'),
(23, NULL, NULL, NULL, 1688887871, 'wewe', 'ewwe@ssds.sdsd', 'sdsad', 'sdsadasdasdsad', '2023-07-05 13:37:55', '2023-07-09 02:31:11'),
(24, NULL, NULL, NULL, 1688887853, 'wewe', 'ewwe@ssds.sdsd', 'sdsad', 'sdsadasdasdsad', '2023-07-05 13:38:11', '2023-07-09 02:30:53'),
(25, NULL, NULL, NULL, 1688887869, 'ssd', 'sdsd@asss.sdsd', 'sds', 'dfdsfdsf', '2023-07-05 13:45:52', '2023-07-09 02:31:09'),
(26, 14, NULL, NULL, 1688887850, 'user', 'user@user.com', 'oioioiio', 'oioioiooio', '2023-07-09 01:33:05', '2023-07-09 02:30:50'),
(27, 14, NULL, NULL, 1688887846, 'user', 'user@user.com', 'sdsd', 'sdsdsd', '2023-07-09 01:57:45', '2023-07-09 02:30:46'),
(28, 1, NULL, NULL, 1706665425, 'admin', 'irfan@gmail.com', 'yyuyu', 'kjlkjlkjljlk', '2023-09-08 11:58:59', '2024-01-31 01:43:45'),
(29, 1, NULL, NULL, 1695385574, 'admin', 'irfan@gmail.com', 'klklk', 'gfgfgf', '2023-09-08 11:59:45', '2023-09-22 07:26:14'),
(30, NULL, NULL, NULL, 1706458129, 'Tomaswoola', 'promomusicdjs33@gmail.com', '0day Promo Music', 'Hello, \r\n \r\nNew club music https://0daymusic.org \r\nDownload MP3/FLAC, Label, LIVESETS, Music Videos. \r\n \r\nPromo Music DJs', '2023-10-15 06:26:37', '2024-01-28 16:08:49'),
(31, NULL, NULL, NULL, 1706665415, 'TimothyTwise', 'yasen.krasen.13+74769@mail.ru', 'Mfheidjwhfuh HUJUHGUJH djwidjwfhuefejjifeh NUHUUUhufhedjefheuhufheudhuwfhu', 'Nguheidjiwfefhei ijiwdwjurFEJDKWIJFEIF аоушвцшургаруш ШОРГПГОШРГРПГОГРГ iryuieoieifegjejj bvncehfedjiehfu hafizcenter.com', '2023-10-21 21:04:01', '2024-01-31 01:43:35'),
(32, NULL, NULL, NULL, 1706665412, 'PhillipSniva', 'gustavo.schineider2@gmail.com', 'Earnings from email newsletters from $30,000 per month', 'Guaranteed income from email newsletters from $30,000 per month http://emailmarketing-32545570.propertyybecho.com/shop?76216', '2023-10-30 08:31:39', '2024-01-31 01:43:32'),
(33, NULL, NULL, NULL, 1706665403, 'PhillipSniva', 'gustavo.schineider2@gmail.com', 'Earnings from email newsletters from $30,000 per month', 'Guaranteed income from email newsletters from $30,000 per month http://emailmarketing-32545570.propertyybecho.com/shop?76216', '2023-10-30 08:31:41', '2024-01-31 01:43:23'),
(34, NULL, NULL, NULL, 1706665400, 'KevinSep', 'williamgonder@yahoo.com', 'IMPORTANT MESSAGE! Your earnings were $45,210.95. Withdraw this money urgently', 'IMPORTANT MESSAGE! YOU HAVE BEEN CREDITED $45,638.97. WITHDRAW THIS MONEY URGENTLY http://quickpayoutpath-5540900.musicbats.com/on?722', '2023-11-06 10:45:56', '2024-01-31 01:43:20'),
(35, NULL, NULL, NULL, 1706665396, 'KevinSep', 'williamgonder@yahoo.com', 'IMPORTANT MESSAGE! Your earnings were $45,210.95. Withdraw this money urgently', 'IMPORTANT MESSAGE! YOU HAVE BEEN CREDITED $45,638.97. WITHDRAW THIS MONEY URGENTLY http://quickpayoutpath-5540900.musicbats.com/on?722', '2023-11-06 10:45:58', '2024-01-31 01:43:16'),
(36, NULL, NULL, NULL, 1706665392, 'Eddiefam', 'ben_christopher2002@yahoo.com', 'Take the survey for a generous reward', 'Your opinion is important to us, so we are ready to pay up to $5000 - http://take-survey-72.hindisa.xyz/page-88', '2023-11-19 11:35:44', '2024-01-31 01:43:12'),
(37, NULL, NULL, NULL, 1706665387, 'Eddiefam', 'ben_christopher2002@yahoo.com', 'Take the survey for a generous reward', 'Your opinion is important to us, so we are ready to pay up to $5000 - http://take-survey-72.hindisa.xyz/page-88', '2023-11-19 11:35:46', '2024-01-31 01:43:07'),
(38, NULL, NULL, NULL, 1706665382, 'DonaldNib', 'john.loatajr@gmail.com', 'Your Path to Wealth: Earnings on Investments from $9000 per Day Demystified', 'Smart Money Moves: Earnings on Investments from $9000 per Day Made Easy https://marketplacebest888.sell.app/product/what-experts-are-silent-about-or-top-17-cryptocurrencies-that-will-soon-fly-to-the-moon?0361207', '2023-11-23 08:13:17', '2024-01-31 01:43:02'),
(39, NULL, NULL, NULL, 1706665347, 'DonaldNib', 'john.loatajr@gmail.com', 'Your Path to Wealth: Earnings on Investments from $9000 per Day Demystified', 'Smart Money Moves: Earnings on Investments from $9000 per Day Made Easy https://marketplacebest888.sell.app/product/what-experts-are-silent-about-or-top-17-cryptocurrencies-that-will-soon-fly-to-the-moon?0361207', '2023-11-23 08:13:19', '2024-01-31 01:42:27'),
(40, NULL, NULL, NULL, 1706458102, 'Stevencob', 'andreasangalang242003@gmail.com', 'START NOW: A GUIDE TO PASSIVE INCOME AT $50K PER YEAR', 'LIVING THE DREAM: $50K PASSIVE INCOME REALITIES http://bpl.kr/mRmV?1357', '2023-11-29 02:34:50', '2024-01-28 16:08:22'),
(41, NULL, NULL, NULL, 1706459537, 'Stevencob', 'andreasangalang242003@gmail.com', 'START NOW: A GUIDE TO PASSIVE INCOME AT $50K PER YEAR', 'LIVING THE DREAM: $50K PASSIVE INCOME REALITIES http://bpl.kr/mRmV?1357', '2023-11-29 02:34:52', '2024-01-28 16:32:17'),
(42, NULL, NULL, NULL, 1706458096, 'Stevevem', 'stevedjs222@gmail.com', '0day Promo Music', 'Hello, \r\n \r\nNew club music https://0daymusic.org \r\nDownload MP3/FLAC, Label, LIVESETS, Music Videos. \r\n \r\nPromo Music DJs', '2023-12-03 05:02:26', '2024-01-28 16:08:16'),
(43, NULL, NULL, NULL, 1706458077, 'Robertlault', 'yasen.krasen.13+93988@mail.ru', 'Miieefjief jiwjdwkijdwf iwkdqdjwifehfuwi kwkdwjejeieifw jwioodwijrewhe', 'Ofokfojfief jwlkfeejereghfj iewojfekfjergij wiojewjfewitghuhwrgtjgh ewjhfwqjhdfuewgtuiwe huegfrwgyewgtywegt hafizcenter.com', '2024-01-27 07:57:41', '2024-01-28 16:07:57'),
(44, NULL, NULL, NULL, 1708079668, 'BellaAveno', 'bellaAveno@gmail.com', 'Get rich quickly and efficiently', 'Invest today and become the next millionaire http://go.sekubaiz.com/0m8r', '2024-02-09 04:27:57', '2024-02-16 10:34:28'),
(45, NULL, NULL, NULL, NULL, 'IirinaNealo', 'nupquerse@gmail.com', 'Very interesting offer!', 'Hi! Have s3x in your city today.  -  https://rb.gy/9pkq6l?Nealo', '2024-02-27 22:44:02', '2024-02-27 22:44:02'),
(46, NULL, NULL, NULL, NULL, 'CharlesHot', 'cryturbom@gmail.com', 'Dc-BTC', '10% in two days, easier than making yourself a cup of coffee! \r\n \r\nhttp://dc-btc.space', '2024-03-11 07:24:35', '2024-03-11 07:24:35'),
(47, NULL, NULL, NULL, NULL, 'CharlesHot', 'cryturbom@gmail.com', 'Dc-BTC', '10% in two days, easier than making yourself a cup of coffee! \r\n \r\nhttp://dc-btc.space', '2024-03-11 07:24:40', '2024-03-11 07:24:40'),
(48, NULL, NULL, NULL, NULL, '3D_kepn', 'quofreephminspi1976@bushka345.store', '3D Printers', 'Innovate Faster with a 3D Printer \r\n3d printer <a href=http://www.3d-ruyter53.ru>http://www.3d-ruyter53.ru</a> .', '2024-03-21 06:54:27', '2024-03-21 06:54:27'),
(49, NULL, NULL, NULL, NULL, 'Katyaadverve1', 'Arorporiunny@gmail.com', 'Hey there, handsome!', 'I\'ve heard about this rooftop jazz lounge with a stunning view - would you like to check it out with me?  -   https://rb.gy/5nfvy9?Nealo', '2024-03-22 18:10:29', '2024-03-22 18:10:29'),
(50, NULL, NULL, NULL, NULL, 'citystar', 'sugarwork78@gmail.com', 'Hello', 'Incredible news! We\'ve found an excellent solution to streamline your server file management. https://srv.surge.sh/posts/filebrowser/', '2024-03-23 14:53:16', '2024-03-23 14:53:16'),
(51, NULL, NULL, NULL, NULL, 'Katyaadverve2', 'Arorporiunny@gmail.com', 'Hi love, how\'s your day?', 'Let\'s escape for the weekend to that charming bed and breakfast I found - just us, no distractions.  -   https://rb.gy/5nfvy9?Nealo', '2024-03-24 03:34:55', '2024-03-24 03:34:55'),
(52, NULL, NULL, NULL, NULL, 'Katyaadverve3', 'Bloomendale1@gmail.com', 'Hi love, how\'s your day?', 'How about we try that new wine bar everyone\'s been raving about for a cozy evening together?  -   https://u.to/DRuCIA?Nealo', '2024-03-25 15:40:11', '2024-03-25 15:40:11'),
(53, NULL, NULL, NULL, NULL, 'Katyaadverve3', 'Bloomendale2@gmail.com', 'Hello, sugar. Feeling fine?', 'Let\'s escape for the weekend to that charming bed and breakfast I found - just us, no distractions.  -   https://rb.gy/psrixq?Nealo', '2024-03-27 16:46:41', '2024-03-27 16:46:41'),
(54, NULL, NULL, NULL, NULL, 'Katyaadverve1', 'Bloomendale1@gmail.com', 'Hi love, how\'s it hanging?', 'Hello there, care to explore some sensual massage techniques?  -  https://rb.gy/psrixq?Nealo', '2024-03-29 15:53:15', '2024-03-29 15:53:15'),
(55, NULL, NULL, NULL, NULL, 'Katyaadverve1', 'Bloomendale3@gmail.com', 'Hi honey, what\'s new?', 'Hello there, care to explore some sensual massage techniques?  -  https://rb.gy/psrixq?Nealo', '2024-03-31 08:30:07', '2024-03-31 08:30:07'),
(56, NULL, NULL, NULL, NULL, 'Katyaadverve1', 'Bloomendale1@gmail.com', 'Hey hottie, what\'s shaking?', 'Hey there, care to join me for a nightcap?  -  https://u.to/CXOGIA?Nealo', '2024-04-02 03:54:57', '2024-04-02 03:54:57'),
(57, NULL, NULL, NULL, NULL, 'Katyaadverve1', 'Bloomendale3@gmail.com', 'Hey handsome, feeling lucky?', 'Hi, want to join me for a bubble bath?  -  https://rb.gy/psrixq?Nealo', '2024-04-04 08:18:50', '2024-04-04 08:18:50'),
(58, NULL, NULL, NULL, NULL, 'Katyaadverve1', 'Bloomendale2@gmail.com', 'Hi honey, what\'s new?', 'Hi, want to join me for a bubble bath?  -  https://u.to/O8_RIA?Nealo', '2024-04-04 20:31:20', '2024-04-04 20:31:20'),
(59, NULL, NULL, NULL, NULL, 'Katyaadverve2', 'Bloomendale3@gmail.com', 'Hi there, ready to charm?', 'Hey, how about we indulge in some chocolate fondue?  -  https://u.to/CXOGIA?Nealo', '2024-04-06 07:20:31', '2024-04-06 07:20:31'),
(60, NULL, NULL, NULL, NULL, 'Katyaadvervea', 'Bloomendaleb@gmail.com', 'Hi honey, let\'s make magic', 'Hi, how about we explore the art of tantric massage together?  -  https://rb.gy/psrixq?Nealo', '2024-04-08 21:59:19', '2024-04-08 21:59:19'),
(61, NULL, NULL, NULL, NULL, 'Katyaadverve1', 'Bloomendale3@gmail.com', 'Hello babe, feeling adventurous tonight?', 'Hi darling, care to join me for a sensual shower?  -  https://rb.gy/psrixq?Nealo', '2024-04-11 15:02:27', '2024-04-11 15:02:27'),
(62, NULL, NULL, NULL, NULL, 'Katyaadverve1', 'Bloomendale1@gmail.com', 'Hello dear, let\'s make memories', 'Hi, how about we explore each other\'s fantasies tonight?  -  https://rb.gy/psrixq?Nealo', '2024-04-14 05:34:42', '2024-04-14 05:34:42'),
(63, NULL, NULL, NULL, NULL, 'Katyaadvervec', 'Bloomendaleb@gmail.com', 'Hey you, feeling flirty today?', 'Hello, how about we spice things up with a little role play?  -  https://u.to/CXOGIA?Nealo', '2024-04-15 12:03:44', '2024-04-15 12:03:44'),
(64, NULL, NULL, NULL, NULL, 'Katyaadverve1', 'Bloomendale2@gmail.com', 'Hi handsome, what\'s cooking?', 'Hello darling, feeling naughty?  -  https://rb.gy/psrixq?Nealo', '2024-04-18 06:33:23', '2024-04-18 06:33:23'),
(65, NULL, NULL, NULL, NULL, 'Katyaadvervec', 'Bloomendale2@gmail.com', 'Hi sweetheart, let\'s be spontaneous', 'Hello dear, let\'s make magic  -  https://rb.gy/psrixq?Nealo', '2024-04-20 20:15:17', '2024-04-20 20:15:17'),
(66, NULL, NULL, NULL, NULL, 'Katyaadverve2', 'Bloomendale3@gmail.com', 'Hi handsome, what\'s cooking?', 'Hello dear, let\'s make magic  -  https://u.to/CXOGIA?Nealo', '2024-04-23 13:24:43', '2024-04-23 13:24:43'),
(67, NULL, NULL, NULL, NULL, 'Irenadvervec', 'aparninnabity3@gmail.com', 'I want to take you in my mouth', 'I want you to fuck me tonight, write here -  https://rb.gy/psrixq?Nealo', '2024-04-26 11:06:55', '2024-04-26 11:06:55'),
(68, NULL, NULL, NULL, NULL, 'Robertzek', 'maski8GESSY@mail.com', 'We invite you to a private crypto exchange', 'Good afternoon! We give you a promo code - ZBXM777 \r\nActivate it in your personal account after registering on www.cexasia.pro \r\nAnd you will receive up to 1000USDT on your deposit. Happy trading!', '2024-04-27 09:40:09', '2024-04-27 09:40:09'),
(69, NULL, NULL, NULL, NULL, 'Irenadverve1', 'aparninnabityb@gmail.com', 'Hi sweetheart, ready for fun?', 'Hey cutie, want to get lost in a sensual massage?-  https://rb.gy/psrixq?Nealo', '2024-04-28 09:23:37', '2024-04-28 09:23:37'),
(70, NULL, NULL, NULL, NULL, 'Irenadverve2', 'aparninnabity1@gmail.com', 'Hey there, handsome', 'Hi handsome, how about we share a steamy sauna session? -  https://u.to/CXOGIA?Nealo', '2024-04-28 17:28:43', '2024-04-28 17:28:43'),
(71, NULL, NULL, NULL, NULL, 'Irenadvervea', 'aparninnabity3@gmail.com', 'Hi sweetheart, ready for fun?', 'Hey cutie, want to get lost in a sensual massage?-  https://u.to/CXOGIA?Nealo', '2024-04-29 20:35:42', '2024-04-29 20:35:42'),
(72, NULL, NULL, NULL, NULL, 'Irenadvervec', 'aparninnabitya@gmail.com', 'Hi sweetheart, ready for fun?', 'Hey cutie, want to get lost in a sensual massage?-  https://u.to/CXOGIA?Nealo', '2024-05-03 16:50:26', '2024-05-03 16:50:26'),
(73, NULL, NULL, NULL, NULL, 'Jannes', 'jannes@pcxresponder.com', 'Do you need clients', 'Hi,\r\n\r\nWe are a provider of premium databases for companies.\r\n\r\nI want to know if you need any sort of data for your business?\r\n\r\nPlease respond to this email and let us know what you are looking for.\r\n\r\nRegards\r\nJannes', '2024-05-06 11:46:20', '2024-05-06 11:46:20'),
(74, NULL, NULL, NULL, NULL, 'Irenadvervec', 'aparninnabity3@gmail.com', 'Hey there, handsome', 'Hi handsome, how about we share a steamy sauna session? -  https://u.to/CXOGIA?Nealo', '2024-05-11 17:27:58', '2024-05-11 17:27:58'),
(75, NULL, NULL, NULL, NULL, 'Irenadvervec', 'aparninnabitya@gmail.com', 'Hello dear, feeling adventurous?', 'Hi darling, want to join me for some naked yoga? -  https://rb.gy/psrixq?Nealo', '2024-05-12 07:39:36', '2024-05-12 07:39:36'),
(76, NULL, NULL, NULL, NULL, 'Irenadvervec', 'aparninnabity3@gmail.com', 'Hey you, feeling flirty?', 'Hey, care to join me for a candlelit bubble bath?-  https://u.to/CXOGIA?Nealo', '2024-05-14 04:27:12', '2024-05-14 04:27:12'),
(77, NULL, NULL, NULL, NULL, 'Irenadverve2', 'aparninnabity2@gmail.com', 'Hey you, feeling flirty?', 'Hey, care to join me for a candlelit bubble bath?-  https://u.to/CXOGIA?Nealo', '2024-05-14 18:12:11', '2024-05-14 18:12:11'),
(78, NULL, NULL, NULL, NULL, 'Ameliaadvervea', 'BoksCosmesy1@gmail.com', 'Hey you, feeling flirty?', 'Hey, care to join me for a candlelit bubble bath? -  https://rb.gy/7xb976?Ot', '2024-05-15 08:30:49', '2024-05-15 08:30:49'),
(79, NULL, NULL, NULL, NULL, 'Ameliaadverveb', 'BoksCosmesyc@gmail.com', 'Hey you, feeling flirty?', 'Hey, care to join me for a candlelit bubble bath? -  https://rb.gy/7xb976?Ot', '2024-05-15 13:29:12', '2024-05-15 13:29:12'),
(80, NULL, NULL, NULL, NULL, 'jessicaadvervea', 'chormEmbocamsc@gmail.com', 'Hello dear, feeling adventurous?', 'Hi darling, want to join me for some naked yoga? -  https://u.to/NsOtIA?atown', '2024-05-15 17:02:14', '2024-05-15 17:02:14'),
(81, NULL, NULL, NULL, NULL, 'Ameliaadvervea', 'BoksCosmesy2@gmail.com', 'Hey you, feeling flirty?', 'Hey, care to join me for a candlelit bubble bath? -  https://rb.gy/7xb976?Ot', '2024-05-18 06:01:55', '2024-05-18 06:01:55'),
(82, NULL, NULL, NULL, NULL, 'Ameliaadverveb', 'BoksCosmesyb@gmail.com', 'Hey you, feeling flirty?', 'Hey, care to join me for a candlelit bubble bath? -  https://rb.gy/7xb976?Ot', '2024-05-19 12:32:14', '2024-05-19 12:32:14'),
(83, NULL, NULL, NULL, NULL, 'Ameliaadvervea', 'BoksCosmesyc@gmail.com', 'Hey you, feeling flirty?', 'Hey, care to join me for a candlelit bubble bath? -  https://rb.gy/7xb976?Ot', '2024-05-22 18:57:58', '2024-05-22 18:57:58'),
(84, NULL, NULL, NULL, NULL, 'jessicaadvervec', 'chormEmbocamsa@gmail.com', 'Hello dear, feeling adventurous?', 'Hi darling, want to join me for some naked yoga? -  https://u.to/NsOtIA?atown', '2024-05-23 05:13:14', '2024-05-23 05:13:14'),
(85, NULL, NULL, NULL, NULL, 'Ameliaadvervec', 'BoksCosmesyb@gmail.com', 'Hey you, feeling flirty?', 'Hey, care to join me for a candlelit bubble bath? -  https://rb.gy/7xb976?Ot', '2024-05-26 10:28:40', '2024-05-26 10:28:40'),
(86, NULL, NULL, NULL, NULL, 'jessicaadverve2', 'chormEmbocamsb@gmail.com', 'Hello dear, feeling adventurous?', 'Hi darling, want to join me for some naked yoga? -  https://u.to/NsOtIA?atown', '2024-05-31 15:29:49', '2024-05-31 15:29:49'),
(87, NULL, NULL, NULL, NULL, 'Ameliaadverve2', 'BoksCosmesyb@gmail.com', 'Hello dear, want some company?', 'Hello, how about we share some sweet treats in bed? -  https://rb.gy/7xb976?Ot', '2024-06-02 05:17:04', '2024-06-02 05:17:04'),
(88, NULL, NULL, NULL, NULL, 'Raina Sheil', 'raina.sheil@msn.com', 'hafizcenter.com on the Google & iOS Store', 'A local store or a multinational chain, we build mobile Apps at crazy prices. We convert your website into an App.\r\n\r\nAndroid ($50)\r\niOS ($50)\r\n\r\nGet your free consultation here:\r\n\r\nhttps://forms.gle/hbayvMrG3N7u2Rbu9', '2024-06-06 20:28:19', '2024-06-06 20:28:19'),
(89, NULL, NULL, NULL, NULL, 'Jaqueline Runyon', 'jaqueline.runyon@googlemail.com', 'hafizcenter.com app for $50!', 'Hi,\r\n\r\nThis is crazy, we are building mobile Apps for $50.\r\n\r\nGet your iOS and Android App!\r\n\r\nWhy are we doing this? Well, we are building a lot for cheap.\r\n\r\nVisit us PCXLeads.com', '2024-06-11 16:06:26', '2024-06-11 16:06:26'),
(90, NULL, NULL, NULL, NULL, 'mikeTress', 'p.r.osp.eri.t.yt.hemo.neyuspen@gmail.com', 'Money cannot be postponed. I earn money today and immediately online!  - https://rb.gy/9fznxm?lifag-Waf', 'If you are not afraid of changes, you are afraid to miss your chance! Earn up to 500 US dollars a day and become the master of your fate!\r\n - https://rb.gy/9fznxm?lifag1Waf', '2024-06-28 11:26:23', '2024-06-28 11:26:23'),
(91, NULL, NULL, NULL, NULL, 'AmandaOrbipt3', 'amandaordeteb@gmail.com', 'Hey stud, ready for love?', 'Hey darling, want to hang out? -  https://is.gd/2xVU7z?scustorry', '2024-06-29 07:51:13', '2024-06-29 07:51:13'),
(92, NULL, NULL, NULL, NULL, 'Shelley Espie', 'espie.shelley@outlook.com', 'Hello hafizcenter.com Owner!', 'Are you still looking at getting your website done/ completed? Contact e.solus@gmail.com', '2024-07-02 01:16:43', '2024-07-02 01:16:43'),
(93, NULL, NULL, NULL, NULL, 'James Zhang', 'zhang.ashleigh28@gmail.com', 'To the hafizcenter.com Administrator!', 'Are you still looking at getting your website\'s SEO done? Contact Now intrug@gmail.com', '2024-07-08 13:47:43', '2024-07-08 13:47:43'),
(94, NULL, NULL, NULL, NULL, 'AmandaOrbipt3', 'amandaordeteb@gmail.com', 'Hey stud, ready for love?', 'Hey darling, want to hang out? -  http://surl.li/ulebc?scustorry', '2024-07-12 19:01:52', '2024-07-12 19:01:52'),
(95, NULL, NULL, NULL, NULL, 'Twila Hillgrove', 'twila.hillgrove@msn.com', 'LeadsMax.biz shutting down', 'Hello,\r\n\r\nIt is with sad regret that after 12 years, LeadsMax.biz is shutting down.\r\n\r\nWe have made all our databases available on our website.\r\n\r\n25 Million companies\r\n527 Million People\r\n\r\nLeadsMax.biz', '2024-07-15 18:27:50', '2024-07-15 18:27:50'),
(96, NULL, NULL, NULL, NULL, 'AmandaOrbiptc', 'amandaordetea@gmail.com', 'Hey stud, ready for love?', 'Hey darling, want to hang out? -  http://surl.li/ulebc?scustorry', '2024-07-16 02:22:04', '2024-07-16 02:22:04'),
(97, NULL, NULL, NULL, NULL, 'AmandaOrbiptb', 'amandaordete3@gmail.com', 'Hey stud, ready for love?', 'Hey darling, want to hang out? -  https://rb.gy/7rnhss?unulge', '2024-07-19 02:22:43', '2024-07-19 02:22:43'),
(98, NULL, NULL, NULL, NULL, 'Annetta Pullman', 'pullman.annetta@gmail.com', 'Dear hafizcenter.com Owner.', 'Work From Home With This 100% FREE Training..., I Promise...You Will Never Look Back\r\n$500+ per day, TRUE -100% Free Training, go here:\r\n\r\nezwayto1000aday.com', '2024-07-20 18:50:44', '2024-07-20 18:50:44'),
(99, NULL, NULL, NULL, NULL, 'AmandaOrbiptb', 'amandaordete3@gmail.com', 'Hey stud, ready for love?', 'Hey darling, want to hang out? -  https://rb.gy/7rnhss?unulge', '2024-07-21 07:18:05', '2024-07-21 07:18:05'),
(100, NULL, NULL, NULL, NULL, 'AmandaOrbipta', 'amandaordete3@gmail.com', 'Ready for a Wild Night?)', 'I’ve been naughty, want to help me with that?) -  https://rb.gy/7rnhss?unulge', '2024-07-22 10:35:58', '2024-07-22 10:35:58'),
(101, NULL, NULL, NULL, NULL, 'AmandaOrbiptc', 'amandaordete3@gmail.com', 'Your Dream Girl Awaits...', 'Can’t wait to show you a good time tonight. -  https://goo.su/zARWg?scustorry', '2024-07-28 08:33:28', '2024-07-28 08:33:28'),
(102, NULL, NULL, NULL, NULL, 'LeadsMax.biz', 'octavia.maudsley85@gmail.com', 'Hello hafizcenter.com Owner.', 'Hello from LeadsMax.biz!!\r\n\r\nWe are shutting down and have made all our data available for all the countries!\r\n\r\nCome check us out and search your business and consumer data for free\r\n\r\nLeadsMax.biz', '2024-07-28 13:13:32', '2024-07-28 13:13:32'),
(103, NULL, NULL, NULL, NULL, 'SpeedyIndexBot', 'speedyindexbot@gmail.com', 'SpeedyIndexBot - 200 links for FREE.', 'https://bit.ly/3OV6orJ SpeedyIndexBot - service for indexing of links in Google. First result in 48 hours. 200 links for FREE.', '2024-07-28 20:19:19', '2024-07-28 20:19:19'),
(104, NULL, NULL, NULL, NULL, 'AmandaOrbipt2', 'amandaordete2@gmail.com', 'Ready for a Wild Night?)', 'I’ve been naughty, want to help me with that?) -  https://rb.gy/7rnhss?unulge', '2024-07-29 06:03:15', '2024-07-29 06:03:15'),
(105, NULL, NULL, NULL, NULL, 'JeffreyVaw', 'yasen.krasen.13+75249@mail.ru', 'Mjewdjwjdw jwksqkowjfjj kkepwlw3jreklm kwldewkdjr3kdw2o keo2kswlkforejw', 'Ofedkwdkjwkjdkwjdkjw jdwidjwijdwfw fjdkqwasqfoewofjewof ojqwejfqwkdokjwofjewofjewoi hafizcenter.com', '2024-07-31 20:28:33', '2024-07-31 20:28:33'),
(106, NULL, NULL, NULL, NULL, 'AmandaOrbiptb', 'amandaordete1@gmail.com', 'Ready for a Wild Night?)', 'I’ve been naughty, want to help me with that?) -  https://goo.su/zARWg?scustorry', '2024-08-02 08:23:08', '2024-08-02 08:23:08'),
(107, NULL, NULL, NULL, NULL, 'ThomasGraib', 'carlylebuffalo777@yahoo.com', 'BREAKING NEWS: $77,000 READY FOR WITHDRAWAL – CLAIM YOURS NOW!', 'Cash In Now! Withdraw Your $77,000 Today! https://script.google.com/macros/s/AKfycbyGB-sIskiYwPn1mq4KBoUZ9Nj1WEmqrFmTYUmHFv5SPDSKci_mgVRz0cCA7JyGCcAR/exec', '2024-08-05 01:21:50', '2024-08-05 01:21:50'),
(108, NULL, NULL, NULL, NULL, 'ThomasGraib', 'dragonsden1979@duck.com', 'CLAIM YOUR $50,000 JACKPOT URGENTLY', 'Exclusive Offer: Claim Your $50,000 Immediately https://aeusercontent.com/mt/lt/752C15E415A8BA80249D1566914162909/1?targetURL=https%3A%2F%2Ftelegra.ph%2Fxlerty-06-04%3F1446', '2024-08-06 14:14:21', '2024-08-06 14:14:21'),
(109, NULL, NULL, NULL, NULL, 'Robertdon', 'sdfdsfsd@fsfsfs.com', 'INSTANT ACCESS: CLAIM YOUR $50,000 TODAY', 'Immediate Response Needed: Collect Your $50,000 https://script.google.com/macros/s/AKfycbxdSFVOtg7HinEcAiF1h7T9QOGoKAYoDBU0r8dxdPrzMOBOEpZGfce1gfEA_QE6uRVn/exec', '2024-08-07 10:51:28', '2024-08-07 10:51:28'),
(110, NULL, NULL, NULL, NULL, 'Jerrypiene', 'c.spieler@web.de', 'Planning for the Future: $50,000 Per Week in Crypto Passive Income', 'From Zero to $50,000: How to Generate Weekly Passive Income with Crypto http://crit-m.com/bitrix/redirect.php?goto=https%3A%2F%2Ftelegra.ph%2Fxlerty-06-04%3F2429', '2024-08-08 20:31:48', '2024-08-08 20:31:48'),
(111, NULL, NULL, NULL, NULL, 'Jami Burns', 'burns.jami@googlemail.com', 'To the hafizcenter.com Admin!', 'Are you still looking at getting your website done/ completed? Contact e.solus@gmail.com', '2024-08-09 01:57:35', '2024-08-09 01:57:35'),
(112, NULL, NULL, NULL, NULL, 'Jerrypiene', 'rabiuabubakar99@gmail.com', 'CLAIM YOUR $50,000 JACKPOT IMMEDIATELY', 'Don\'t Wait Another Moment: Collect $50,000 Now https://script.google.com/macros/s/AKfycbyPVOR4IpTNlSfeO5q1QOqjuZpf2v5Dwj_q5X-PFqq9nG91KDopuZgmL9ugx5kucvJ_6A/exec', '2024-08-14 17:54:21', '2024-08-14 17:54:21'),
(113, NULL, NULL, NULL, NULL, 'AmandaOrbiptc', 'amandaordetea@gmail.com', 'Your Dream Girl Awaits...', 'Can’t wait to show you a good time tonight. -  https://goo.su/zARWg?scustorry', '2024-08-21 04:08:30', '2024-08-21 04:08:30'),
(114, NULL, NULL, NULL, NULL, 'AmandaOrbipta', 'amandaordete3@gmail.com', 'Ready for a Wild Night?)', 'I’ve been naughty, want to help me with that?) -  https://goo.su/zARWg?scustorry', '2024-08-24 01:32:03', '2024-08-24 01:32:03'),
(115, NULL, NULL, NULL, NULL, 'AmandaOrbipta', 'amandaordeteb@gmail.com', 'Your Dream Girl Awaits...', 'Can’t wait to show you a good time tonight. -  https://goo.su/zARWg?scustorry', '2024-08-26 05:43:11', '2024-08-26 05:43:11'),
(116, NULL, NULL, NULL, NULL, 'AmandaOrbiptb', 'amandaordete1@gmail.com', 'Can’t stop thinking about you...', 'Explore my profile, let’s make it unforgettable. -  https://goo.su/zARWg?scustorry', '2024-09-04 13:44:38', '2024-09-04 13:44:38'),
(117, NULL, NULL, NULL, NULL, 'Tedphero', 'kayleighbpsteamship@gmail.com', 'Hallo, i write about your   price for reseller', 'Sveiki, aš norėjau sužinoti jūsų kainą.', '2024-09-06 19:22:01', '2024-09-06 19:22:01'),
(118, NULL, NULL, NULL, NULL, 'AmandaOrbiptc', 'amandaordetec@gmail.com', 'Your fantasy awaits, just click....', 'Want to see more? Check my profile now. -  https://rb.gy/7rnhss?unulge', '2024-09-08 04:35:31', '2024-09-08 04:35:31'),
(119, NULL, NULL, NULL, NULL, 'AmandaOrbipt3', 'amandaordetea@gmail.com', 'Can’t stop thinking about you...', 'Explore my profile, let’s make it unforgettable. -  https://goo.su/zARWg?scustorry', '2024-09-09 07:42:15', '2024-09-09 07:42:15');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(22, '2023_06_04_155845_create_auctions_table', 10),
(23, '2023_06_08_152005_create_notifications_table', 11),
(25, '2023_06_11_073024_create_cart_table', 12),
(26, '2023_06_11_073937_create_wish_list_table', 12),
(27, '2023_06_11_164607_create_profile_table', 13),
(31, '2023_06_14_170926_create_orders_table', 14),
(32, '2023_06_14_171452_create_order_items_table', 14),
(33, '2023_06_17_105056_create_status_table', 15),
(34, '2023_06_22_150052_create_biddings_table', 16),
(35, '2023_06_25_073352_create_messages_table', 17),
(36, '2023_06_28_072309_create_shipping_table', 18),
(37, '2023_08_12_172215_create_settings_table', 19),
(38, '2023_08_15_181417_create_wishbox_table', 20),
(40, '2023_08_23_173120_create_chats_table', 22),
(43, '2023_08_30_171606_create_banners_table', 23);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(1, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 14),
(1, 'App\\Models\\User', 17),
(1, 'App\\Models\\User', 27),
(3, 'App\\Models\\User', 28),
(3, 'App\\Models\\User', 29),
(3, 'App\\Models\\User', 30),
(3, 'App\\Models\\User', 35),
(1, 'App\\Models\\User', 36),
(1, 'App\\Models\\User', 37),
(3, 'App\\Models\\User', 38),
(3, 'App\\Models\\User', 39),
(3, 'App\\Models\\User', 40);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `sync_id` int DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `sync_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0035b8dd-923e-4c26-ae56-b1373cb3d3e4', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1715761849, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-15 08:30:49', '2024-05-15 08:30:49'),
('00608cc6-3208-46eb-8ed0-86abfecd0a57', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1715710331, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve2\"}', NULL, '2024-05-14 18:12:11', '2024-05-14 18:12:11'),
('00c66b6f-6516-49bc-a806-b3c3403af013', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1717705699, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Raina Sheil\"}', NULL, '2024-06-06 20:28:19', '2024-06-06 20:28:19'),
('00cd1ba7-4858-458d-9e01-f42c2efed194', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1715792534, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadvervea\"}', NULL, '2024-05-15 17:02:14', '2024-05-15 17:02:14'),
('00de434e-95a8-457e-9a5d-27f22ed03d24', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1719647473, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-06-29 07:51:13', '2024-06-29 07:51:13'),
('015b5b37-203c-4f2d-bb68-79710d0255a0', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1722953661, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from ThomasGraib\"}', NULL, '2024-08-06 14:14:21', '2024-08-06 14:14:21'),
('0174e2e5-550c-41b8-9b10-1c3a8b30da4e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1716121934, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverveb\"}', NULL, '2024-05-19 12:32:14', '2024-05-19 12:32:14'),
('01bceab9-f906-42e3-9d5e-300089350012', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1711558001, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve3\"}', NULL, '2024-03-27 16:46:41', '2024-03-27 16:46:41'),
('02346a02-c37f-4fd2-9867-4608d591d0f5', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1710141880, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from CharlesHot\"}', NULL, '2024-03-11 07:24:40', '2024-03-11 07:24:40'),
('0242c595-5773-4602-9782-79ffa27f52c1', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1688582567, '{\"user_id\":1,\"name\":\"admin\",\"email\":\"irfan@gmail.com\",\"status\":\"4\",\"msg\":\"Message from wewe\"}', '2023-07-06 13:26:43', '2023-07-05 13:42:47', '2023-07-05 13:42:47'),
('029c0ed0-d4ca-49e6-8689-81ac292e15f6', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1713644117, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervec\"}', NULL, '2024-04-20 20:15:17', '2024-04-20 20:15:17'),
('02c5ec12-1486-40d6-ba65-0e5b9a6fe992', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, NULL, '{\"user_id\":38,\"name\":\"ahmed\",\"email\":\"shakeelaansar79@gmail.com\",\"status\":\"0\",\"msg\":\"New User ahmed has been registered\"}', NULL, '2024-04-10 14:47:48', '2024-04-10 14:47:48'),
('02d0e1da-a1da-4333-ac0a-98e64f4b40d5', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1721546285, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-07-21 07:18:05', '2024-07-21 07:18:05'),
('032b7720-f6b2-41bf-91d0-e4083a4471b8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1687930868, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order 1687930868 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-28 00:41:08', '2023-06-28 00:41:08'),
('0383a864-ff7f-46aa-8a6c-a27ef23b2ce6', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1719573983, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from mikeTress\"}', NULL, '2024-06-28 11:26:23', '2024-06-28 11:26:23'),
('041bd598-8714-46a6-bbb4-6288dd9524a8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1714129615, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-04-26 11:06:55', '2024-04-26 11:06:55'),
('044e527d-ccdc-4333-9a33-6c8d5c063044', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1696042474 Placed.\"}', '2023-09-30 08:00:22', '2023-09-30 02:54:38', '2023-09-30 02:54:38'),
('0458dcd2-d5f9-4349-a95f-a889c3290553', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1716441194, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadvervec\"}', NULL, '2024-05-23 05:13:14', '2024-05-23 05:13:14'),
('04afb9d4-a5d8-4497-995b-b3602b3224ae', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1725770131, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-09-08 04:35:31', '2024-09-08 04:35:31'),
('055da826-2ae3-4382-a4b1-721c314ef81e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1687891688, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order# 1687891688 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-27 13:48:08', '2023-06-27 13:48:08'),
('05f5b123-0f13-46a5-b59d-2b5c18923ec9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1701225290, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Stevencob\"}', NULL, '2023-11-29 02:34:50', '2023-11-29 02:34:50'),
('06080519-8c11-4f28-9b42-af22776c4f0b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1723168655, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jami Burns\"}', NULL, '2024-08-09 01:57:35', '2024-08-09 01:57:35'),
('06238a2d-754b-4d7e-b986-e52cc289230c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, NULL, '{\"user_id\":36,\"name\":\"Soft Cell\",\"email\":\"softcellzone@gmail.com\",\"status\":\"2\",\"msg\":\"Soft Cell Your Order# 1708079722 Placed.\"}', NULL, '2024-02-16 10:35:22', '2024-02-16 10:35:22'),
('07587795-420f-4096-a90a-f5d3cc404753', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1712613559, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervea\"}', NULL, '2024-04-08 21:59:19', '2024-04-08 21:59:19'),
('08169092-7e0a-4471-8a1d-e619c78e9c8c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone1@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1688842648 cancelled.\"}', NULL, '2023-10-01 17:36:37', '2023-10-01 17:36:37'),
('08fd708b-4faa-4151-9ef8-d6b9ea275ac9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, NULL, '{\"user_id\":13,\"name\":\"admin\",\"email\":\"admin@admin.com\",\"status\":\"2\",\"msg\":\"admin Your Order# 1686936146 cancelled.\"}', NULL, '2023-10-01 17:36:22', '2023-10-01 17:36:22'),
('091769d7-47af-4bdf-ae11-3225b63484e6', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1711381211, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve3\"}', NULL, '2024-03-25 15:40:11', '2024-03-25 15:40:11'),
('097cfc72-0980-4c55-ad8c-6d0c9f59f361', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1713072882, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-14 05:34:42', '2024-04-14 05:34:42'),
('09c4b7f1-123b-4acf-b57e-f8f40e055f63', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1698654699, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from PhillipSniva\"}', NULL, '2023-10-30 08:31:39', '2023-10-30 08:31:39'),
('0a38c483-988e-4cc4-b62c-e7f7d06af3be', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1721501444, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Annetta Pullman\"}', NULL, '2024-07-20 18:50:44', '2024-07-20 18:50:44'),
('0af5e4d5-f76d-46c6-8423-94a034d9502e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1711205596, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from citystar\"}', NULL, '2024-03-23 14:53:16', '2024-03-23 14:53:16'),
('0c1b1195-6306-425d-bafc-8696a7c82d2d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1721501444, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Annetta Pullman\"}', NULL, '2024-07-20 18:50:44', '2024-07-20 18:50:44'),
('0cd46090-dc1a-479a-99eb-21bebb4b94a8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, NULL, '{\"user_id\":17,\"name\":\"irfan\",\"email\":\"touchit236@gmail.com\",\"status\":\"2\",\"msg\":\"irfan Your Order# 1696042958 Placed.\"}', NULL, '2023-09-30 03:02:40', '2023-09-30 03:02:40'),
('0dd7fc64-1378-46f5-a1b7-3272c9f96c95', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1719573983, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from mikeTress\"}', NULL, '2024-06-28 11:26:23', '2024-06-28 11:26:23'),
('0eb4cc07-354d-4789-a7d8-687232d82d49', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1717305424, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverve2\"}', NULL, '2024-06-02 05:17:04', '2024-06-02 05:17:04'),
('0ebd4965-0da9-4cac-a335-051f65e013fb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1716121934, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverveb\"}', NULL, '2024-05-19 12:32:14', '2024-05-19 12:32:14'),
('0f07f3fc-5271-486c-86ae-c4fcf3488845', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1721644558, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-07-22 10:35:58', '2024-07-22 10:35:58'),
('10962849-fab3-48e4-8407-4ee3e5213e48', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1712262680, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-04 20:31:20', '2024-04-04 20:31:20'),
('116e5a0b-d9d7-47f9-b975-982abadd4fd4', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1723168655, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jami Burns\"}', NULL, '2024-08-09 01:57:35', '2024-08-09 01:57:35'),
('1182f26d-cdd4-4cec-a343-3c009a981013', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1712388031, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-04-06 07:20:31', '2024-04-06 07:20:31'),
('12416a87-d056-4837-a4b1-5937b15c96c2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1711131029, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-22 18:10:29', '2024-03-22 18:10:29'),
('126bad5d-5be1-430c-95a7-780c3956f0eb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1712613559, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervea\"}', NULL, '2024-04-08 21:59:19', '2024-04-08 21:59:19'),
('12afe7e6-5937-46e3-b814-f6eeb74b2c9b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1688667677, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order# 1688667677 has been placed by soft zone\"}', NULL, '2023-07-06 13:21:17', '2023-07-06 13:21:17'),
('145e75e6-669e-4eee-9bc9-2ae0c0702ed2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1718121986, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jaqueline Runyon\"}', NULL, '2024-06-11 16:06:26', '2024-06-11 16:06:26'),
('147bf479-f434-4229-95bf-d1cfb92d82e9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1720810912, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-07-12 19:01:52', '2024-07-12 19:01:52'),
('14c13881-29ad-4e0b-b633-997c97f8f6eb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1697351197, '{\"user_id\":1,\"name\":\"Tayyab\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Tomaswoola\"}', '2024-01-31 01:45:26', '2023-10-15 06:26:37', '2023-10-15 06:26:37'),
('14cbc726-30f8-4970-9132-d3e4b4df3d7a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1710141880, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from CharlesHot\"}', NULL, '2024-03-11 07:24:40', '2024-03-11 07:24:40'),
('153fe3af-3ef6-436a-96bc-020806423eb7', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1714755026, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-03 16:50:26', '2024-05-03 16:50:26'),
('155936c7-faa8-4470-9bbf-13a6809073a4', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1714755026, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-03 16:50:26', '2024-05-03 16:50:26'),
('159c62bd-ab96-4a25-afa3-f81bf166290a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1717705699, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Raina Sheil\"}', NULL, '2024-06-06 20:28:19', '2024-06-06 20:28:19'),
('15ef6c90-e0ad-4276-a2a3-b71daa985a0c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1719647473, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-06-29 07:51:13', '2024-06-29 07:51:13'),
('16ac812b-b5a4-4cdd-9405-72ef30b8f82d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1723027888, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Robertdon\"}', NULL, '2024-08-07 10:51:28', '2024-08-07 10:51:28'),
('17e10672-7737-4b1a-97ef-03b3d61e37eb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1700727197, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from DonaldNib\"}', '2024-01-31 01:44:41', '2023-11-23 08:13:17', '2023-11-23 08:13:17'),
('18760df4-2891-4b27-90ac-59dae5dae5ae', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1715660832, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-14 04:27:12', '2024-05-14 04:27:12'),
('18961199-51fe-4235-8d52-54b495b57a45', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1724650991, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-08-26 05:43:11', '2024-08-26 05:43:11'),
('18a442e2-cf9c-4f30-aecd-4f5ac2815ba0', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1711873807, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-31 08:30:07', '2024-03-31 08:30:07'),
('192be73a-699b-4ec5-be0d-d6f1d8cc7125', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1723149108, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jerrypiene\"}', NULL, '2024-08-08 20:31:48', '2024-08-08 20:31:48'),
('194fa9b8-ef40-460c-a290-6c1fa5993f33', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone1@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1688667312 cancelled.\"}', NULL, '2023-10-01 17:35:39', '2023-10-01 17:35:39'),
('19d883e8-04b3-4123-ad73-61f00d47a9c5', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1721501444, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Annetta Pullman\"}', NULL, '2024-07-20 18:50:44', '2024-07-20 18:50:44'),
('19e62aab-1e15-4ff4-8e1b-1d46ce157b17', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, NULL, '{\"user_id\":30,\"name\":\"Muhammad Irfan\",\"email\":\"jahdjdj@ajsjdj.sds\",\"status\":\"0\",\"msg\":\"New User Muhammad Irfan has been registered\"}', NULL, '2023-07-09 02:04:04', '2023-07-09 02:04:04'),
('1a12ab74-f388-4f9a-a541-08ac64a3e304', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1711004067, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from 3D_kepn\"}', NULL, '2024-03-21 06:54:27', '2024-03-21 06:54:27'),
('1ac6405e-d728-42b1-ab38-655b8af2166b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1725770131, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-09-08 04:35:31', '2024-09-08 04:35:31'),
('1b27277b-71a3-4146-a96d-26f06ed606eb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1719573983, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from mikeTress\"}', NULL, '2024-06-28 11:26:23', '2024-06-28 11:26:23'),
('1b314fd6-d6ca-4075-a4ce-9cc240b45f43', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone1@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1688809054 cancelled.\"}', NULL, '2023-10-01 17:36:44', '2023-10-01 17:36:44'),
('1bd15cb6-3b50-4f08-8139-478292df58d4', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1712388031, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-04-06 07:20:31', '2024-04-06 07:20:31'),
('1cb2e22e-fc11-45dc-9831-6fd8413f1a83', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, NULL, '{\"user_id\":38,\"name\":\"ahmed\",\"email\":\"shakeelaansar79@gmail.com\",\"status\":\"0\",\"msg\":\"New User ahmed has been registered\"}', NULL, '2024-04-10 14:47:48', '2024-04-10 14:47:48'),
('1d941b77-cc5f-40d7-9d54-5afa20849854', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1725650521, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Tedphero\"}', NULL, '2024-09-06 19:22:01', '2024-09-06 19:22:01'),
('1fc67cdc-0a29-4d65-98d6-3e5af8dee793', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1699267556, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from KevinSep\"}', '2024-01-31 01:45:00', '2023-11-06 10:45:56', '2023-11-06 10:45:56'),
('201340ea-0e10-4e44-8059-9c75abdb4547', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1713644117, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervec\"}', NULL, '2024-04-20 20:15:17', '2024-04-20 20:15:17'),
('206afc5a-140c-42ff-9da7-6f71ba6a5425', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1712262680, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-04 20:31:20', '2024-04-04 20:31:20'),
('209f9245-d068-4fd0-8ad5-d4d41026b442', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1719883003, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Shelley Espie\"}', NULL, '2024-07-02 01:16:43', '2024-07-02 01:16:43'),
('20d41399-13fe-43e6-aa43-f54a432f7b34', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1716441194, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadvervec\"}', NULL, '2024-05-23 05:13:14', '2024-05-23 05:13:14'),
('2140b0da-b859-43e7-ab8b-4ebc0b5b5c47', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1713072882, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-14 05:34:42', '2024-04-14 05:34:42'),
('2173b41e-2e29-4bef-a65d-360c1a35f8c2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1715499576, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-12 07:39:36', '2024-05-12 07:39:36'),
('21ba3fa1-0333-4e12-9f8b-45b99906dd19', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1722820910, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from ThomasGraib\"}', NULL, '2024-08-05 01:21:50', '2024-08-05 01:21:50'),
('21f394cd-2ec7-47b4-9528-2f18de202ec5', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1710141875, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from CharlesHot\"}', NULL, '2024-03-11 07:24:35', '2024-03-11 07:24:35'),
('225248a8-4910-4e17-9a8f-f18039b18b94', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1722820910, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from ThomasGraib\"}', NULL, '2024-08-05 01:21:50', '2024-08-05 01:21:50'),
('23a09b3f-277e-48b2-bad1-205813c970db', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1712030097, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-02 03:54:57', '2024-04-02 03:54:57'),
('23b65a21-5cef-418b-8b44-df6ff1cbcd9b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1721096524, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-07-16 02:22:04', '2024-07-16 02:22:04'),
('23fe4b52-120a-4d68-9783-be22a6eaf03e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1725867735, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-09-09 07:42:15', '2024-09-09 07:42:15'),
('24459284-2bbb-4020-b9ad-462b932d8681', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1724463123, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-08-24 01:32:03', '2024-08-24 01:32:03'),
('248f4b5e-cd09-4223-882d-249e71c31d5e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1716719320, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervec\"}', NULL, '2024-05-26 10:28:40', '2024-05-26 10:28:40'),
('24d81452-7218-49af-a11c-f00d8a2e28bc', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1700727199, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from DonaldNib\"}', '2024-01-31 01:44:37', '2023-11-23 08:13:19', '2023-11-23 08:13:19'),
('24dbc838-a5cc-49e0-a712-07a319d767dc', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1712847747, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-11 15:02:27', '2024-04-11 15:02:27'),
('25d1ea37-ccd2-4a6c-bcd2-0b04bc96b6c7', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1714422942, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervea\"}', NULL, '2024-04-29 20:35:42', '2024-04-29 20:35:42'),
('26bb07b9-1f58-4147-8f23-85b2ea1d18b3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1699267556, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from KevinSep\"}', '2024-01-31 01:45:00', '2023-11-06 10:45:56', '2023-11-06 10:45:56'),
('27069ac3-bbff-4750-bc89-5775a4081467', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, NULL, '{\"user_id\":17,\"name\":\"irfan\",\"email\":\"touchit236@gmail.com\",\"status\":\"2\",\"msg\":\"irfan Your Order# 1687019498 cancelled.\"}', NULL, '2023-10-01 17:36:30', '2023-10-01 17:36:30'),
('27d5eed4-232a-40e3-8778-f982851ad8db', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1715499576, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-12 07:39:36', '2024-05-12 07:39:36'),
('27f1a48b-65f9-4f3d-8be5-da4ab44f576f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1711251295, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-03-24 03:34:55', '2024-03-24 03:34:55'),
('2843e5fe-fd9f-4f65-832b-6816f8e1e054', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1712613559, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervea\"}', NULL, '2024-04-08 21:59:19', '2024-04-08 21:59:19'),
('28737cfd-d542-4950-bb5b-018ebe43e8fb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, NULL, '{\"user_id\":35,\"name\":\"Soft Cell\",\"email\":\"softcellzone@gmail.com\",\"status\":\"0\",\"msg\":\"New User Soft Cell has been registered\"}', NULL, '2023-10-01 13:13:40', '2023-10-01 13:13:40'),
('28b0722f-3c01-4806-92b1-f0b3557e3cf2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1711131029, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-22 18:10:29', '2024-03-22 18:10:29'),
('28d5c644-959b-4775-8266-e006e789bf6c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1720810912, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-07-12 19:01:52', '2024-07-12 19:01:52'),
('28e1a9b6-23cf-4df0-b36a-7cc7291cc373', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1714422942, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervea\"}', NULL, '2024-04-29 20:35:42', '2024-04-29 20:35:42'),
('293249c5-dbfd-435c-a134-0ae74dc7fdf2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1718121986, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jaqueline Runyon\"}', NULL, '2024-06-11 16:06:26', '2024-06-11 16:06:26'),
('2992969e-60dc-481b-b575-95c408ef0519', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, NULL, '{\"user_id\":37,\"name\":\"irfan\",\"email\":\"softhouse8219@gmail.com\",\"status\":\"0\",\"msg\":\"New User irfan has been registered\"}', '2024-01-28 16:32:46', '2024-01-28 16:13:15', '2024-01-28 16:13:15'),
('29955ec5-476b-4f29-9d85-99525f164dc3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1714210809, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Robertzek\"}', NULL, '2024-04-27 09:40:09', '2024-04-27 09:40:09'),
('29b112b7-4aaf-4b94-b7b6-f9123c4dddad', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1688808980, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order# 1688808980 has been placed by soft zone\"}', NULL, '2023-07-08 04:36:21', '2023-07-08 04:36:21'),
('2a1570cb-07af-4a1b-8b3b-888bff89f8c4', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1711727595, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-29 15:53:15', '2024-03-29 15:53:15'),
('2a323830-8a49-4279-a0f1-154a43250a37', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1687891645, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order 1687891645 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-27 13:47:25', '2023-06-27 13:47:26'),
('2a7693a3-d170-4e99-8ea3-26bc39272717', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, NULL, '{\"user_id\":39,\"name\":\"Asad\",\"email\":\"xenforo8@gmail.com\",\"status\":\"0\",\"msg\":\"New User Asad has been registered\"}', NULL, '2024-07-05 06:44:43', '2024-07-05 06:44:43'),
('2b366c98-ca78-41d1-9901-0eb685cea0e8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1723658061, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jerrypiene\"}', NULL, '2024-08-14 17:54:21', '2024-08-14 17:54:21'),
('2bab6785-b7fb-4db8-b50f-b0153bf81108', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1720446463, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from James Zhang\"}', NULL, '2024-07-08 13:47:43', '2024-07-08 13:47:43'),
('2bdc9349-a0fb-4ae0-9935-0c78b2d930c5', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1724650991, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-08-26 05:43:11', '2024-08-26 05:43:11'),
('2bde3824-614e-43db-b63d-95b1237117fa', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1725867735, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-09-09 07:42:15', '2024-09-09 07:42:15'),
('2c007a00-28e3-487f-bae9-aa3e4df01eb1', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1711381211, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve3\"}', NULL, '2024-03-25 15:40:11', '2024-03-25 15:40:11'),
('2c523b56-6a58-442e-b755-a01e9245dbc9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1710141875, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from CharlesHot\"}', NULL, '2024-03-11 07:24:35', '2024-03-11 07:24:35'),
('2d24f690-cfe4-4a97-a6cf-ee5306cb1a45', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1700393744, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Eddiefam\"}', '2024-01-31 01:44:45', '2023-11-19 11:35:44', '2023-11-19 11:35:44'),
('2f16b2e8-fd18-4734-bcf7-8d323caa7b8c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1721096524, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-07-16 02:22:04', '2024-07-16 02:22:04'),
('2fb931a8-e2a5-4b4d-a01b-ea42ca2b61db', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1715710331, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve2\"}', NULL, '2024-05-14 18:12:11', '2024-05-14 18:12:11'),
('3029d902-2227-4817-afbe-aa315c2c9985', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1715499576, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-12 07:39:36', '2024-05-12 07:39:36'),
('305fed9b-bc6f-42c3-aaae-d192c85ce974', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1721644558, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-07-22 10:35:58', '2024-07-22 10:35:58'),
('3080f33e-6cd4-47aa-9908-98d44408926c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1711381211, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve3\"}', NULL, '2024-03-25 15:40:11', '2024-03-25 15:40:11'),
('30ec3c3e-b092-425f-bbd2-db565f666e9a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1711004067, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from 3D_kepn\"}', NULL, '2024-03-21 06:54:27', '2024-03-21 06:54:27'),
('314889eb-dfa5-4554-8a04-d42ecf1bc883', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1711558001, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve3\"}', NULL, '2024-03-27 16:46:41', '2024-03-27 16:46:41'),
('31c0a168-a92c-4b58-a9f0-b9a94cf9b7cb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1725770131, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-09-08 04:35:31', '2024-09-08 04:35:31'),
('325af659-5c09-41d4-b585-e22c62214794', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1713182624, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervec\"}', NULL, '2024-04-15 12:03:44', '2024-04-15 12:03:44'),
('3299dd8a-0218-4d74-ba28-0bb38e0e1a7e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1714296217, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve1\"}', NULL, '2024-04-28 09:23:37', '2024-04-28 09:23:37'),
('32b7dd28-fb98-4cde-9add-8fc4baf3624d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1724213310, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-08-21 04:08:30', '2024-08-21 04:08:30'),
('33c52d22-2d44-4201-9b1a-fb027a268142', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1721644558, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-07-22 10:35:58', '2024-07-22 10:35:58'),
('3441003b-4d13-464f-91ab-9440a0e25d36', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1724650991, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-08-26 05:43:11', '2024-08-26 05:43:11'),
('3502cde6-96d7-434d-944b-e61ca377abef', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1699267558, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from KevinSep\"}', '2024-01-31 01:45:02', '2023-11-06 10:45:58', '2023-11-06 10:45:58'),
('35e0a192-19b7-424a-9879-5590151e1d09', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1711727595, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-29 15:53:15', '2024-03-29 15:53:15'),
('3640646d-73fb-4040-8f90-fe4ec3b1657e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, NULL, '{\"user_id\":30,\"name\":\"Muhammad Irfan\",\"email\":\"jahdjdj@ajsjdj.sds\",\"status\":\"0\",\"msg\":\"New User Muhammad Irfan has been registered\"}', NULL, '2023-07-09 02:04:04', '2023-07-09 02:04:04'),
('37ac5a85-cc50-4ad5-b954-ab0c42066e75', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone1@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1688667537 cancelled.\"}', NULL, '2023-10-01 17:35:49', '2023-10-01 17:35:49'),
('37c6ab1d-9c09-40d2-a98e-ae0df20c2255', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1722172412, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from LeadsMax.biz\"}', NULL, '2024-07-28 13:13:32', '2024-07-28 13:13:32'),
('39477bc8-2dd8-4150-adbc-bbed42ebf76f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1713878683, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-04-23 13:24:43', '2024-04-23 13:24:43'),
('3a3fb6bd-96da-437c-b066-77ec83195a31', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1712613559, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervea\"}', NULL, '2024-04-08 21:59:19', '2024-04-08 21:59:19'),
('3adefa8d-3efe-4d1c-aa52-66ceb95b049d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1722197959, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from SpeedyIndexBot\"}', NULL, '2024-07-28 20:19:19', '2024-07-28 20:19:19'),
('3b164e80-f857-43cc-8624-9d8af83f9be9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1722586988, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-08-02 08:23:08', '2024-08-02 08:23:08'),
('3b732509-f363-431e-93e4-b00ec8e90f99', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1688582738, '{\"user_id\":1,\"name\":\"admin\",\"email\":\"irfan@gmail.com\",\"status\":\"4\",\"msg\":\"Message from sddsf\"}', '2023-07-06 13:26:43', '2023-07-05 13:45:38', '2023-07-05 13:45:38'),
('3c7095ef-ed11-4521-936d-45ef982fc6fb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1716719320, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervec\"}', NULL, '2024-05-26 10:28:40', '2024-05-26 10:28:40'),
('3ca4aa76-ed4b-47ee-a94c-8d8dba2d96dd', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1699267558, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from KevinSep\"}', '2024-01-31 01:45:02', '2023-11-06 10:45:58', '2023-11-06 10:45:58'),
('3cac3f50-e89b-4ed7-84eb-3d3eca21f703', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1719573983, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from mikeTress\"}', NULL, '2024-06-28 11:26:23', '2024-06-28 11:26:23'),
('3d7342e3-c3ba-4acb-850c-b320c1add071', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1715779752, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverveb\"}', NULL, '2024-05-15 13:29:12', '2024-05-15 13:29:12'),
('3d876b0b-5e0c-4dfc-8d9a-d03c257bcac2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1723027888, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Robertdon\"}', NULL, '2024-08-07 10:51:28', '2024-08-07 10:51:28'),
('3d966e6f-ffd0-4c76-9f9d-205d4e57a291', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1716404278, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-22 18:57:58', '2024-05-22 18:57:58'),
('3e2333a6-7029-4825-8de9-f7f9a77b58b3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 14, NULL, '{\"user_id\":14,\"name\":\"user\",\"email\":\"user@user.com\",\"status\":\"2\",\"msg\":\"user Your Order# 1688312073 cancelled.\"}', NULL, '2023-10-01 17:37:13', '2023-10-01 17:37:13'),
('3e29c465-25c0-4bd4-aace-366e055384d7', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1718121986, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jaqueline Runyon\"}', NULL, '2024-06-11 16:06:26', '2024-06-11 16:06:26'),
('3e8fe9ab-cf7f-41c5-afa4-f6bcf080497a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1701225292, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Stevencob\"}', '2024-01-31 01:44:24', '2023-11-29 02:34:52', '2023-11-29 02:34:52'),
('3eea7702-296e-422c-b9d8-44344bfa2235', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1688667677, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order 1688667677 has been placed by soft zone\"}', NULL, '2023-07-06 13:21:17', '2023-07-06 13:21:17'),
('3eebe1d9-e925-44e8-8faf-ede6597e4872', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1701225290, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Stevencob\"}', NULL, '2023-11-29 02:34:50', '2023-11-29 02:34:50'),
('3f2244fd-00dd-4755-aaaf-08c2a3fc33d5', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1722457713, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from JeffreyVaw\"}', NULL, '2024-07-31 20:28:33', '2024-07-31 20:28:33'),
('3f5bdf27-004e-4b30-bd43-9503825e2edf', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1722197959, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from SpeedyIndexBot\"}', NULL, '2024-07-28 20:19:19', '2024-07-28 20:19:19'),
('412dab69-d84e-4c7c-9d7a-d5395eafbf71', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1688493642, '{\"user_id\":1,\"name\":\"admin\",\"email\":\"irfan@gmail.com\",\"status\":\"3\",\"msg\":\"Bid On Auction# 6 by admin\"}', '2023-07-06 13:26:43', '2023-07-04 13:00:42', '2023-07-04 13:00:42'),
('41b975f1-d959-42b3-9dc9-adb24c4363ba', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, NULL, '{\"user_id\":39,\"name\":\"Asad\",\"email\":\"xenforo8@gmail.com\",\"status\":\"0\",\"msg\":\"New User Asad has been registered\"}', NULL, '2024-07-05 06:44:43', '2024-07-05 06:44:43'),
('41fad1cc-da7c-48a1-83d3-4c58ce0ae80c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1715660832, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-14 04:27:12', '2024-05-14 04:27:12'),
('42e0bc29-aedc-4586-94b2-a14cf0ee668e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1714995980, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jannes\"}', NULL, '2024-05-06 11:46:20', '2024-05-06 11:46:20'),
('43101d5c-00ec-4b3d-aaae-b9a4faf66fa0', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1722586988, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-08-02 08:23:08', '2024-08-02 08:23:08'),
('436ff864-1b56-4cb9-bb18-78b1a792fe61', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1725457478, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-09-04 13:44:39', '2024-09-04 13:44:39'),
('44b167ee-d7f7-4ada-86df-ba243199eb1d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1721068070, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Twila Hillgrove\"}', NULL, '2024-07-15 18:27:50', '2024-07-15 18:27:50'),
('45176881-4d5f-45c8-ad63-d86c0acec415', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1716441194, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadvervec\"}', NULL, '2024-05-23 05:13:14', '2024-05-23 05:13:14');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `sync_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('451d71f2-5ca4-45b4-bdb2-7b75c57646d7', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1688809054, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order 1688809054 has been placed by soft zone\"}', NULL, '2023-07-08 04:37:34', '2023-07-08 04:37:34'),
('46878cce-bf87-4ec8-8ea4-5882253b44bf', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1712388031, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-04-06 07:20:31', '2024-04-06 07:20:31'),
('46a9a324-f488-42aa-9953-909331f1976f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1717169389, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadverve2\"}', NULL, '2024-05-31 15:29:49', '2024-05-31 15:29:49'),
('46d713a9-fd81-4813-91bd-2b31f356bbd0', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1711727595, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-29 15:53:15', '2024-03-29 15:53:15'),
('46f84c0a-10b9-44c0-b7be-de7fd56834be', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1687891645, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order# 1687891645 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-27 13:47:26', '2023-06-27 13:47:26'),
('472bf3e0-9b92-407c-80c3-b033c06acafe', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1715761849, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-15 08:30:49', '2024-05-15 08:30:49'),
('49094c59-53ee-4f7b-ab55-83c5b9ed73bf', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1699267556, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from KevinSep\"}', '2024-01-31 01:45:00', '2023-11-06 10:45:56', '2023-11-06 10:45:56'),
('49591ba0-a3a5-4ff6-9ad8-857a9c808ad3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1716441194, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadvervec\"}', NULL, '2024-05-23 05:13:14', '2024-05-23 05:13:14'),
('4980687c-25dd-4f8b-a9b8-d7dd7a67dd39', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1714325323, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve2\"}', NULL, '2024-04-28 17:28:43', '2024-04-28 17:28:43'),
('49b8394c-28d6-49eb-8910-63b9c79cd46a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1698654699, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from PhillipSniva\"}', NULL, '2023-10-30 08:31:39', '2023-10-30 08:31:39'),
('4a16f77b-345b-4218-8c06-9b63062466f4', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1722232995, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt2\"}', NULL, '2024-07-29 06:03:15', '2024-07-29 06:03:15'),
('4a549114-8c5d-4a07-8341-235091fa2bec', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1717305424, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverve2\"}', NULL, '2024-06-02 05:17:04', '2024-06-02 05:17:04'),
('4a63573f-f4e2-4b94-8d1c-e0f69976446b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1722953661, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from ThomasGraib\"}', NULL, '2024-08-06 14:14:21', '2024-08-06 14:14:21'),
('4b2795f9-4c9c-4c5d-be0d-c1cd39acd17d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1711251295, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-03-24 03:34:55', '2024-03-24 03:34:55'),
('4b288baa-eda5-4a4d-8096-319a06f76218', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1715710331, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve2\"}', NULL, '2024-05-14 18:12:11', '2024-05-14 18:12:11'),
('4b54ed3d-ba80-4de5-920c-f0917441a866', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1716719320, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervec\"}', NULL, '2024-05-26 10:28:40', '2024-05-26 10:28:40'),
('4b6f9e8e-a3fa-47bd-ace5-a69da0185d52', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1722457713, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from JeffreyVaw\"}', NULL, '2024-07-31 20:28:33', '2024-07-31 20:28:33'),
('4b82f7ec-0354-4a64-a10f-151fb366dac8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1713072882, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-14 05:34:42', '2024-04-14 05:34:42'),
('4be7a969-a917-4d7e-83b1-e5b905a26676', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1701579746, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Stevevem\"}', '2024-01-31 01:45:31', '2023-12-03 05:02:26', '2023-12-03 05:02:26'),
('4c27f0a5-6274-4848-8a54-8714ef934ae5', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1719883003, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Shelley Espie\"}', NULL, '2024-07-02 01:16:43', '2024-07-02 01:16:43'),
('4c5138da-522a-4efa-a684-dc617c8f7feb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1714296217, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve1\"}', NULL, '2024-04-28 09:23:37', '2024-04-28 09:23:37'),
('4cdf1e44-abb9-4c82-a088-b6361577066e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1719647473, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-06-29 07:51:13', '2024-06-29 07:51:13'),
('4ce4f71a-4280-4d24-9139-4c314f099df6', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1715779752, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverveb\"}', NULL, '2024-05-15 13:29:12', '2024-05-15 13:29:12'),
('4d8c2a5f-4003-4956-91f3-6e4e2db3d17e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1688808118, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order 1688808118 has been placed by soft zone\"}', NULL, '2023-07-08 04:21:58', '2023-07-08 04:21:58'),
('4dfd1429-2dd6-4fbe-b6b1-5b78b61c2ee3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1710141880, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from CharlesHot\"}', NULL, '2024-03-11 07:24:40', '2024-03-11 07:24:40'),
('4e5f12bd-1847-477b-a901-f709585b09e3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, NULL, '{\"user_id\":40,\"name\":\"Muhammad Irfan (Developer)\",\"email\":\"iirfandeveloper@gmail.com\",\"status\":\"0\",\"msg\":\"New User Muhammad Irfan (Developer) has been registered\"}', NULL, '2024-09-12 11:16:37', '2024-09-12 11:16:37'),
('4ee0932a-8c54-438e-9142-09be992b0eaf', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1712847747, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-11 15:02:27', '2024-04-11 15:02:27'),
('4f2b9b41-ca83-4a7c-a195-648b68e0c156', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1711381211, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve3\"}', NULL, '2024-03-25 15:40:11', '2024-03-25 15:40:11'),
('4f4fee9e-b422-4a8f-af2c-9f7e16927614', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1712218730, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-04 08:18:50', '2024-04-04 08:18:50'),
('4ffef0fb-e1a8-448e-851c-c9788e2105fc', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1709073842, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from IirinaNealo\"}', NULL, '2024-02-27 22:44:02', '2024-02-27 22:44:02'),
('5002af34-af35-4195-b2b4-a37639102f27', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1723027888, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Robertdon\"}', NULL, '2024-08-07 10:51:28', '2024-08-07 10:51:28'),
('5005586b-2725-47ce-b5c7-a332522a177e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1718121986, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jaqueline Runyon\"}', NULL, '2024-06-11 16:06:26', '2024-06-11 16:06:26'),
('500c1be8-5acc-4e4a-bf7f-f39e10842b12', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1688809054, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order# 1688809054 has been placed by soft zone\"}', NULL, '2023-07-08 04:37:35', '2023-07-08 04:37:35'),
('501cb587-47b4-40b9-9755-c42417500c0c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1688582752, '{\"user_id\":1,\"name\":\"admin\",\"email\":\"irfan@gmail.com\",\"status\":\"4\",\"msg\":\"Message from ssd\"}', '2023-07-06 13:26:43', '2023-07-05 13:45:52', '2023-07-05 13:45:52'),
('5066b20e-9f71-4aad-af3a-30c70afe3f9c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1715660832, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-14 04:27:12', '2024-05-14 04:27:12'),
('50ede7d8-e416-42e5-bf11-46eb14ec4449', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1711131029, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-22 18:10:29', '2024-03-22 18:10:29'),
('5101aabe-e66a-42cb-abe5-e4021ee591a3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1722197959, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from SpeedyIndexBot\"}', NULL, '2024-07-28 20:19:19', '2024-07-28 20:19:19'),
('51da98cc-e1ec-4ed4-b9ba-b807dfe83d7c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1711251295, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-03-24 03:34:55', '2024-03-24 03:34:55'),
('5240582f-eb66-490f-b4bd-43b4e99e3ca2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1715792534, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadvervea\"}', NULL, '2024-05-15 17:02:14', '2024-05-15 17:02:14'),
('533e3c63-6824-44af-b3c0-f075e46a653e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1688582752, '{\"user_id\":1,\"name\":\"admin\",\"email\":\"irfan@gmail.com\",\"status\":\"4\",\"msg\":\"Message from ssd\"}', '2023-07-06 13:26:43', '2023-07-05 13:45:52', '2023-07-05 13:45:52'),
('5413214e-7554-4192-9f59-e76c8f0a6c88', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1713422003, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-18 06:33:23', '2024-04-18 06:33:23'),
('5415e5af-3b01-414e-8d8d-34343942881b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1724463123, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-08-24 01:32:03', '2024-08-24 01:32:03'),
('54582744-e3da-428c-a214-ca23a3e72f2f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1722232995, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt2\"}', NULL, '2024-07-29 06:03:15', '2024-07-29 06:03:15'),
('557f4294-c0c8-45c0-ab0c-c0f3c2bec7ce', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1713878683, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-04-23 13:24:43', '2024-04-23 13:24:43'),
('55e7acdb-45ff-4bee-a44d-8e36e95dc29c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1723168655, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jami Burns\"}', NULL, '2024-08-09 01:57:35', '2024-08-09 01:57:35'),
('562ab8fd-cb7e-478c-acaa-e2791f59ae88', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1712218730, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-04 08:18:50', '2024-04-04 08:18:50'),
('566e81f0-01f2-4127-8eda-8e6adb606459', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, NULL, '{\"user_id\":40,\"name\":\"Muhammad Irfan (Developer)\",\"email\":\"iirfandeveloper@gmail.com\",\"status\":\"0\",\"msg\":\"New User Muhammad Irfan (Developer) has been registered\"}', NULL, '2024-09-12 11:16:37', '2024-09-12 11:16:37'),
('56e354ec-c59f-4643-9a2d-522dbe968e8c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1719573983, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from mikeTress\"}', NULL, '2024-06-28 11:26:23', '2024-06-28 11:26:23'),
('56ead28a-6c0c-438d-b060-e0f28e83df2d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1713878683, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-04-23 13:24:43', '2024-04-23 13:24:43'),
('57395cef-66e8-4dc4-a7ef-5f584720ba16', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1687889597, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order 1687889597 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-27 13:13:17', '2023-06-27 13:13:17'),
('57422337-4b5c-4ff4-8da8-d0598595e4d2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1711873807, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-31 08:30:07', '2024-03-31 08:30:07'),
('575bdd0c-b8c2-41c2-8038-4a7243707e27', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1687716068, '{\"user_id\":13,\"name\":\"admin\",\"email\":\"admin@admin.com\",\"status\":\"1\",\"msg\":\"New Order# 1687716068 has been placed by admin\"}', '2023-07-06 13:26:43', '2023-06-25 13:01:08', '2023-06-25 13:01:08'),
('575ec8fe-a8b5-47d8-8d6b-ccef905c6cfd', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1722155608, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-07-28 08:33:28', '2024-07-28 08:33:28'),
('5819e1e2-6460-44a9-afbf-607a0794ed85', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1724213310, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-08-21 04:08:30', '2024-08-21 04:08:30'),
('5a87d4e9-1f27-4f6e-811e-63d7ff5d40f0', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1719647473, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-06-29 07:51:13', '2024-06-29 07:51:13'),
('5ae6964c-b768-480c-a10a-8219584ca2e2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1714129615, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-04-26 11:06:55', '2024-04-26 11:06:55'),
('5af91672-3b30-4856-9eba-ca60cea8c7d1', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1708079722, '{\"user_id\":36,\"name\":\"Soft Cell\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order 1708079722 has been placed by Soft Cell\"}', NULL, '2024-02-16 10:35:22', '2024-02-16 10:35:22'),
('5b6fa3b2-46d5-49ad-ba45-bed70e3f1c2d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1712847747, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-11 15:02:27', '2024-04-11 15:02:27'),
('5c189a2f-8e47-4ac5-bee9-6e6be1c37ba1', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1716441194, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadvervec\"}', NULL, '2024-05-23 05:13:14', '2024-05-23 05:13:14'),
('5ca810b0-898d-4358-b680-a541272f8966', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1700393744, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Eddiefam\"}', '2024-01-31 01:44:45', '2023-11-19 11:35:44', '2023-11-19 11:35:44'),
('5cc9acf9-11d5-4597-9102-b99b1e8afc25', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1718121986, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jaqueline Runyon\"}', NULL, '2024-06-11 16:06:26', '2024-06-11 16:06:26'),
('5cc9af01-21a9-45e0-9940-c55a343cc27f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1722172412, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from LeadsMax.biz\"}', NULL, '2024-07-28 13:13:32', '2024-07-28 13:13:32'),
('5d18147c-7450-4575-9b29-77dea9795343', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1712218730, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-04 08:18:50', '2024-04-04 08:18:50'),
('5d32d097-dcbd-4ce0-a7c3-8ca2af084af1', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1721068070, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Twila Hillgrove\"}', NULL, '2024-07-15 18:27:50', '2024-07-15 18:27:50'),
('5d75f3b7-4c81-416b-bf70-b62d25400001', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1687930868, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order# 1687930868 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-28 00:41:09', '2023-06-28 00:41:09'),
('5de791c7-575e-48fd-a976-e214086516d9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1721068070, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Twila Hillgrove\"}', NULL, '2024-07-15 18:27:50', '2024-07-15 18:27:50'),
('5ef6fc63-8a49-4c35-bcf0-4eee4806fecb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1712030097, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-02 03:54:57', '2024-04-02 03:54:57'),
('5f897757-b155-4565-b304-b40e6fd882ab', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1725770131, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-09-08 04:35:31', '2024-09-08 04:35:31'),
('5fcf675a-7da1-418f-b9f6-3ea5efb342a3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1716012115, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-18 06:01:55', '2024-05-18 06:01:55'),
('5ffaa444-7489-4198-ac05-9abcc912a453', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1711205596, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from citystar\"}', NULL, '2024-03-23 14:53:16', '2024-03-23 14:53:16'),
('602ae349-2394-407d-994a-02777c9e9c4d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1723168655, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jami Burns\"}', NULL, '2024-08-09 01:57:35', '2024-08-09 01:57:35'),
('602dac06-f958-4492-966f-2c9677c8c5a6', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1720810912, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-07-12 19:01:52', '2024-07-12 19:01:52'),
('6065fb4e-77c7-4cdc-a5fd-7734386d2a96', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1687930828, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order 1687930828 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-28 00:40:28', '2023-06-28 00:40:28'),
('60c406e6-7fa7-4609-a759-a3efe05b683f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1715710331, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve2\"}', NULL, '2024-05-14 18:12:11', '2024-05-14 18:12:11'),
('60f0cf2c-c2cb-49ad-bfe2-acbc75d264a9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1687891746, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order 1687891746 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-27 13:49:06', '2023-06-27 13:49:06'),
('62ad72e4-efc2-4c6e-aaa3-413fea515926', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1711131029, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-22 18:10:29', '2024-03-22 18:10:29'),
('62bf3ae4-65b3-4376-aac7-1d4db77e4b0e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1722586988, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-08-02 08:23:08', '2024-08-02 08:23:08'),
('62fe4438-1a10-4c97-b366-5167a34aa221', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1711004067, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from 3D_kepn\"}', NULL, '2024-03-21 06:54:27', '2024-03-21 06:54:27'),
('62ff0244-4ef6-435a-83b2-edaa596c45ee', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1698654699, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from PhillipSniva\"}', NULL, '2023-10-30 08:31:39', '2023-10-30 08:31:39'),
('640406bb-c971-47db-9338-e3fccb3d9d45', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1688582738, '{\"user_id\":1,\"name\":\"admin\",\"email\":\"irfan@gmail.com\",\"status\":\"4\",\"msg\":\"Message from sddsf\"}', '2023-07-06 13:26:43', '2023-07-05 13:45:38', '2023-07-05 13:45:38'),
('6475575b-3de9-467e-ae38-188519809309', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1714325323, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve2\"}', NULL, '2024-04-28 17:28:43', '2024-04-28 17:28:43'),
('649de2f7-e086-420e-b4ae-a8eb0345eb95', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1716121934, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverveb\"}', NULL, '2024-05-19 12:32:14', '2024-05-19 12:32:14'),
('64da03b4-628b-4aca-8dee-3fa128dfa442', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1711558001, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve3\"}', NULL, '2024-03-27 16:46:41', '2024-03-27 16:46:41'),
('650ad37d-0de8-4198-a2c6-d3b47f7ee25a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1720446463, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from James Zhang\"}', NULL, '2024-07-08 13:47:43', '2024-07-08 13:47:43'),
('6578bf37-acea-412e-9d5a-5bdfaf4d47b1', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, NULL, '{\"user_id\":39,\"name\":\"Asad\",\"email\":\"xenforo8@gmail.com\",\"status\":\"0\",\"msg\":\"New User Asad has been registered\"}', NULL, '2024-07-05 06:44:43', '2024-07-05 06:44:43'),
('66a98b39-1ded-448a-a0ef-2c763a3fc068', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, NULL, '{\"user_id\":36,\"name\":\"Soft Cell\",\"email\":\"softcellzone@gmail.com\",\"status\":\"0\",\"msg\":\"New User Soft Cell has been registered\"}', '2024-01-31 01:45:48', '2023-10-04 15:43:02', '2023-10-04 15:43:02'),
('66cd72b0-8deb-4478-8f53-1dc447efcf2c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1723168655, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jami Burns\"}', NULL, '2024-08-09 01:57:35', '2024-08-09 01:57:35'),
('671ecffe-292c-4133-a0e5-8db7f481e772', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1700393746, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Eddiefam\"}', '2024-01-31 01:45:06', '2023-11-19 11:35:46', '2023-11-19 11:35:46'),
('67576205-f556-4842-ad06-0d31249de9a6', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1717705699, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Raina Sheil\"}', NULL, '2024-06-06 20:28:19', '2024-06-06 20:28:19'),
('67cbc702-a3f1-4faf-a29a-3c14454701c9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1709073842, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from IirinaNealo\"}', NULL, '2024-02-27 22:44:02', '2024-02-27 22:44:02'),
('67cd99a5-3622-4395-b40d-9cb83d697069', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1716404278, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-22 18:57:58', '2024-05-22 18:57:58'),
('6828b1d8-418b-401f-a2d0-d797a5823739', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1715448478, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-11 17:27:58', '2024-05-11 17:27:58'),
('684cb47d-39d5-40e6-a126-c36bbf28a2e2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1715448478, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-11 17:27:58', '2024-05-11 17:27:58'),
('685628c3-1bbd-4847-b73d-1b82a23eca12', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1717169389, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadverve2\"}', NULL, '2024-05-31 15:29:49', '2024-05-31 15:29:49'),
('687601b0-9cb4-4481-96dd-a61afdc1073a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1713644117, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervec\"}', NULL, '2024-04-20 20:15:17', '2024-04-20 20:15:17'),
('69564bd0-bf9d-4bae-91f9-f1b5fc1e8120', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, NULL, '{\"user_id\":35,\"name\":\"Soft Cell\",\"email\":\"softcellzone@gmail.com\",\"status\":\"0\",\"msg\":\"New User Soft Cell has been registered\"}', NULL, '2023-10-01 13:13:40', '2023-10-01 13:13:40'),
('6965bc82-89d8-48ac-b48d-f8acc9498308', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1721644558, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-07-22 10:35:58', '2024-07-22 10:35:58'),
('6b367881-ec11-4db1-b17c-f5e81ac0b918', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1719573983, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from mikeTress\"}', NULL, '2024-06-28 11:26:23', '2024-06-28 11:26:23'),
('6cd5a324-c12b-464b-a0af-e07d96e39d00', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1701579746, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Stevevem\"}', '2024-01-31 01:45:31', '2023-12-03 05:02:26', '2023-12-03 05:02:26'),
('6cf2f040-bf7c-4ba1-94a2-935d56785c7b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1697351197, '{\"user_id\":1,\"name\":\"Tayyab\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Tomaswoola\"}', '2024-01-31 01:45:26', '2023-10-15 06:26:37', '2023-10-15 06:26:37'),
('6cf67090-9655-4807-a3c3-564b3f151039', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1711131029, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-22 18:10:29', '2024-03-22 18:10:29'),
('6e181c03-3f83-4029-b125-9b71f84d055e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1721644558, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-07-22 10:35:58', '2024-07-22 10:35:58'),
('6e5dd2de-225f-4665-9ebd-5866af855551', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1715499576, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-12 07:39:36', '2024-05-12 07:39:36'),
('6e732c07-225f-4d66-b068-16525a6edf37', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1720810912, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-07-12 19:01:52', '2024-07-12 19:01:52'),
('6e75da1d-7522-463e-870a-edde742c4d6d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1721068070, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Twila Hillgrove\"}', NULL, '2024-07-15 18:27:50', '2024-07-15 18:27:50'),
('6e8bfae3-879b-4a3c-b836-a88a39ed698a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1719883003, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Shelley Espie\"}', NULL, '2024-07-02 01:16:43', '2024-07-02 01:16:43'),
('6f90030e-4924-4b60-870c-228b080a2a52', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, NULL, '{\"user_id\":38,\"name\":\"ahmed\",\"email\":\"shakeelaansar79@gmail.com\",\"status\":\"0\",\"msg\":\"New User ahmed has been registered\"}', NULL, '2024-04-10 14:47:48', '2024-04-10 14:47:48'),
('6f9bc84c-7045-4a08-bcae-6180ab8793e9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1709073842, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from IirinaNealo\"}', NULL, '2024-02-27 22:44:02', '2024-02-27 22:44:02'),
('6fb9bbf5-70df-4bba-a960-24ce961edade', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1711873807, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-31 08:30:07', '2024-03-31 08:30:07'),
('6ffc79fa-540c-45f3-bfbc-aa05bc59b255', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1714995980, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jannes\"}', NULL, '2024-05-06 11:46:20', '2024-05-06 11:46:20'),
('70089db2-9e1c-4d13-a75c-1301d25de64e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1724213310, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-08-21 04:08:30', '2024-08-21 04:08:30'),
('701c0d6f-7d4f-4d9d-9e58-cf385cf70860', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1700727197, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from DonaldNib\"}', '2024-01-31 01:44:41', '2023-11-23 08:13:17', '2023-11-23 08:13:17'),
('706e07aa-fbc1-4312-b64c-55a3839fb6b9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1713644117, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervec\"}', NULL, '2024-04-20 20:15:17', '2024-04-20 20:15:17'),
('71fd3a13-6453-4ee2-a051-83e23abc1adb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1722953661, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from ThomasGraib\"}', NULL, '2024-08-06 14:14:21', '2024-08-06 14:14:21'),
('72a6931a-18c9-4ea5-8387-26a54e48eb79', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1710141880, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from CharlesHot\"}', NULL, '2024-03-11 07:24:40', '2024-03-11 07:24:40'),
('73cdad18-bcd5-4af4-a105-040f827c548f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1716404278, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-22 18:57:58', '2024-05-22 18:57:58'),
('73d4829b-8e8a-492e-8016-ef028273baf2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1712262680, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-04 20:31:20', '2024-04-04 20:31:20'),
('73dd9e80-f7c8-4dde-9091-62fa0d374b45', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1720446463, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from James Zhang\"}', NULL, '2024-07-08 13:47:43', '2024-07-08 13:47:43'),
('742242e8-d893-46b7-b4d7-8d537aef5341', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1714296217, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve1\"}', NULL, '2024-04-28 09:23:37', '2024-04-28 09:23:37'),
('74910501-fd80-4de3-b175-cc7f707902f5', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1715792534, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadvervea\"}', NULL, '2024-05-15 17:02:14', '2024-05-15 17:02:14'),
('75366b46-d553-4648-8c90-a42a02954691', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1700727199, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from DonaldNib\"}', '2024-01-31 01:44:37', '2023-11-23 08:13:19', '2023-11-23 08:13:19'),
('75f0875c-1c9d-419a-9392-2783c1fb612b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1724213310, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-08-21 04:08:30', '2024-08-21 04:08:30'),
('7633bd81-f157-4bde-a591-5baa9eb78ee7', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1714995980, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jannes\"}', NULL, '2024-05-06 11:46:20', '2024-05-06 11:46:20'),
('769cf9a4-3bb0-469d-b51b-647143073b24', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1711381211, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve3\"}', NULL, '2024-03-25 15:40:11', '2024-03-25 15:40:11'),
('7721a3ce-e779-405e-9fca-073a75fbe14c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1721546285, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-07-21 07:18:05', '2024-07-21 07:18:05'),
('774d6674-ac9e-4ef5-bf78-0306258e0f4f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1716121934, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverveb\"}', NULL, '2024-05-19 12:32:14', '2024-05-19 12:32:14'),
('77b32313-3d93-45bf-a249-cf09bd4387ed', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1722457713, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from JeffreyVaw\"}', NULL, '2024-07-31 20:28:33', '2024-07-31 20:28:33'),
('77ce44d1-f1a6-4c38-9e4d-45afdb4f0993', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1712388031, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-04-06 07:20:31', '2024-04-06 07:20:31'),
('780e398d-8c4e-4f1f-a1c4-d660a843f965', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1724650991, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-08-26 05:43:11', '2024-08-26 05:43:11'),
('78158418-5ede-4ff7-9a49-a1fdc8f39c78', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1721355763, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-07-19 02:22:43', '2024-07-19 02:22:43'),
('785362ec-857e-4504-9a20-0f4dfcdc8670', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1714210809, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Robertzek\"}', NULL, '2024-04-27 09:40:09', '2024-04-27 09:40:09'),
('7980a944-13ed-4e30-afe2-da202254a814', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1725770131, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-09-08 04:35:31', '2024-09-08 04:35:31'),
('79e25372-2d1c-45e1-8082-70fb6fc9aed9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, NULL, '{\"user_id\":35,\"name\":\"Soft Cell\",\"email\":\"softcellzone@gmail.com\",\"status\":\"0\",\"msg\":\"New User Soft Cell has been registered\"}', NULL, '2023-10-01 13:13:40', '2023-10-01 13:13:40'),
('7a169dad-8c14-4372-b7cb-3c1a95fb1a1c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1725457478, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-09-04 13:44:39', '2024-09-04 13:44:39'),
('7a4dfa46-c152-4aab-97ef-375f344a2abb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1720446463, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from James Zhang\"}', NULL, '2024-07-08 13:47:43', '2024-07-08 13:47:43'),
('7b7fddbf-58dc-442d-a9b1-642c8eb14638', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1722586988, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-08-02 08:23:08', '2024-08-02 08:23:08'),
('7c003866-db90-4529-af94-5a5880343283', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1723149108, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jerrypiene\"}', NULL, '2024-08-08 20:31:48', '2024-08-08 20:31:48'),
('7c0987f1-b26f-41f9-aea2-683104c2b3de', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1711251295, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-03-24 03:34:55', '2024-03-24 03:34:55'),
('7d5aa490-e1c6-4837-9592-b989987de4b2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1711558001, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve3\"}', NULL, '2024-03-27 16:46:41', '2024-03-27 16:46:41'),
('7d6d6121-fb63-4987-8d64-d49241a2b38a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1712218730, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-04 08:18:50', '2024-04-04 08:18:50'),
('7da75929-e8f9-4924-bda4-371e4ea33eb5', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1722232995, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt2\"}', NULL, '2024-07-29 06:03:15', '2024-07-29 06:03:15'),
('7e0d8d7d-31a4-4101-9f7f-87d12278f002', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1715792534, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadvervea\"}', NULL, '2024-05-15 17:02:14', '2024-05-15 17:02:14'),
('7edbadac-2c40-42d7-9927-1afdb7eba428', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1723658061, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jerrypiene\"}', NULL, '2024-08-14 17:54:21', '2024-08-14 17:54:21'),
('7f4f4faa-b706-4458-a380-5b8e6a63f22b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1711873807, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-31 08:30:07', '2024-03-31 08:30:07'),
('7f799fc2-0729-4f12-bbe5-0d2a49d5e7b3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1722586988, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-08-02 08:23:08', '2024-08-02 08:23:08'),
('7faf6adf-1833-4b47-aaad-36cddfd6dbe0', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1722172412, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from LeadsMax.biz\"}', NULL, '2024-07-28 13:13:32', '2024-07-28 13:13:32'),
('80261059-4bec-4dac-83be-677046912ca5', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, NULL, '{\"user_id\":38,\"name\":\"ahmed\",\"email\":\"shakeelaansar79@gmail.com\",\"status\":\"0\",\"msg\":\"New User ahmed has been registered\"}', NULL, '2024-04-10 14:47:48', '2024-04-10 14:47:48'),
('81030fcc-c2f5-4882-883c-9b4599106399', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, NULL, '{\"user_id\":13,\"name\":\"admin\",\"email\":\"admin@admin.com\",\"status\":\"2\",\"msg\":\"admin Your Order# 1686936164 cancelled.\"}', NULL, '2023-10-01 17:35:12', '2023-10-01 17:35:12'),
('81316620-f28f-4235-90a7-b3f12ca987df', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1688312074, '{\"user_id\":14,\"name\":\"user\",\"email\":\"user@user.com\",\"status\":\"1\",\"msg\":\"New Order 1688312073 has been placed by user\"}', '2023-07-06 13:26:43', '2023-07-02 10:34:34', '2023-07-02 10:34:34'),
('8199f642-6fe4-4c2c-93d5-05d7dabc29df', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1723027888, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Robertdon\"}', NULL, '2024-08-07 10:51:28', '2024-08-07 10:51:28'),
('81fb1e13-e1f5-45f5-8ab5-d285768f2a44', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1713422003, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-18 06:33:23', '2024-04-18 06:33:23');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `sync_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('8230557d-f90c-4888-88de-2c4dd065b152', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1717305424, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverve2\"}', NULL, '2024-06-02 05:17:04', '2024-06-02 05:17:04'),
('825e6381-7728-4e5e-b0d0-08c08fc71819', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1725867735, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-09-09 07:42:15', '2024-09-09 07:42:15'),
('83707d64-401f-409c-b46a-46bab409bbf3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1725867735, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-09-09 07:42:15', '2024-09-09 07:42:15'),
('83783a04-8fa2-4b9f-938c-8e6f1fd4ed63', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1717705699, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Raina Sheil\"}', NULL, '2024-06-06 20:28:19', '2024-06-06 20:28:19'),
('83bfb02f-6f14-4bce-9bde-4d156aee0d65', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1719647473, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-06-29 07:51:13', '2024-06-29 07:51:13'),
('84605cbc-3b8f-474a-b548-b285d1c11f12', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1722155608, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-07-28 08:33:28', '2024-07-28 08:33:28'),
('848cd3b4-b43c-493d-9b37-2ec831e8be9d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1721644558, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-07-22 10:35:58', '2024-07-22 10:35:58'),
('84ba75ab-9eb3-4a40-8c60-c262e63a23ed', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1713182624, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervec\"}', NULL, '2024-04-15 12:03:44', '2024-04-15 12:03:44'),
('84e6c5c7-3f6c-44df-ba49-e7ade4b734f9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1724463123, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-08-24 01:32:03', '2024-08-24 01:32:03'),
('85885081-ee58-4e65-b4d7-27f3e8c61a55', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1714210809, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Robertzek\"}', NULL, '2024-04-27 09:40:09', '2024-04-27 09:40:09'),
('85cb16e5-66cd-4741-ae5d-f8c45824e468', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1722586988, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-08-02 08:23:08', '2024-08-02 08:23:08'),
('85db4533-2b2e-4778-86e4-96adc9b8c11f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1725457478, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-09-04 13:44:38', '2024-09-04 13:44:39'),
('86e7ad82-b2e6-4dde-a22d-f3ffe8f6265a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1688808980, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order 1688808980 has been placed by soft zone\"}', NULL, '2023-07-08 04:36:20', '2023-07-08 04:36:21'),
('874be046-c913-4cd8-8c7f-339290388deb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1722457713, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from JeffreyVaw\"}', NULL, '2024-07-31 20:28:33', '2024-07-31 20:28:33'),
('87d7f52a-915f-4e23-b4b7-d061e9febba3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1711205596, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from citystar\"}', NULL, '2024-03-23 14:53:16', '2024-03-23 14:53:16'),
('88bb73f4-fd5b-4877-8eec-f765391d0b1b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1715499576, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-12 07:39:36', '2024-05-12 07:39:36'),
('88f23e7f-f258-497d-b801-20028590f537', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1722820910, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from ThomasGraib\"}', NULL, '2024-08-05 01:21:50', '2024-08-05 01:21:50'),
('89a97672-0bc4-4f73-9441-97886c1bb401', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone1@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1688842843 cancelled.\"}', NULL, '2023-10-01 17:36:15', '2023-10-01 17:36:15'),
('89d480dc-073f-4929-9a53-510380cd00a6', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1711251295, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-03-24 03:34:55', '2024-03-24 03:34:55'),
('8a78b579-6ed0-48aa-a559-97ca70ac96c8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1725867735, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-09-09 07:42:15', '2024-09-09 07:42:15'),
('8ab29907-280a-4a5c-a1e2-caa11a87b449', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1716012115, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-18 06:01:55', '2024-05-18 06:01:55'),
('8c2c4827-86dc-4690-bdb4-73a34415b2a3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, NULL, '{\"user_id\":39,\"name\":\"Asad\",\"email\":\"xenforo8@gmail.com\",\"status\":\"0\",\"msg\":\"New User Asad has been registered\"}', NULL, '2024-07-05 06:44:43', '2024-07-05 06:44:43'),
('8c8fd799-191b-4591-a733-f265585a090b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1696042958, '{\"user_id\":17,\"name\":\"irfan\",\"email\":\"touchit236@gmail.com\",\"status\":\"1\",\"msg\":\"New Order# 1696042958 has been placed by irfan\"}', NULL, '2023-09-30 03:02:38', '2023-09-30 03:02:38'),
('8ce1ee7a-3a31-44a4-b39e-8e4a52dcd51d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1708079722, '{\"user_id\":36,\"name\":\"Soft Cell\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order 1708079722 has been placed by Soft Cell\"}', NULL, '2024-02-16 10:35:22', '2024-02-16 10:35:22'),
('8cf75c15-00ad-44ce-a593-c66012783bd2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1688667537, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order 1688667537 has been placed by soft zone\"}', NULL, '2023-07-06 13:18:57', '2023-07-06 13:18:57'),
('8d3c9663-dab8-4d7d-971e-5cd83d024cef', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, NULL, '{\"user_id\":40,\"name\":\"Muhammad Irfan (Developer)\",\"email\":\"iirfandeveloper@gmail.com\",\"status\":\"0\",\"msg\":\"New User Muhammad Irfan (Developer) has been registered\"}', NULL, '2024-09-12 11:16:37', '2024-09-12 11:16:37'),
('8f8351d6-55da-49c3-b68a-f1e299a6e034', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, NULL, '{\"user_id\":37,\"name\":\"irfan\",\"email\":\"softhouse8219@gmail.com\",\"status\":\"0\",\"msg\":\"New User irfan has been registered\"}', NULL, '2024-01-28 16:13:15', '2024-01-28 16:13:15'),
('8fca9655-daae-4ebc-a9de-19c29a480ae0', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, NULL, '{\"user_id\":36,\"name\":\"Soft Cell\",\"email\":\"softcellzone@gmail.com\",\"status\":\"0\",\"msg\":\"New User Soft Cell has been registered\"}', NULL, '2023-10-04 15:43:02', '2023-10-04 15:43:02'),
('90560da3-4f26-407a-b31a-cb644ae1c2b6', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1714755026, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-03 16:50:26', '2024-05-03 16:50:26'),
('906bda73-a4bf-468d-bae6-c71859752c47', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1700393744, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Eddiefam\"}', '2024-01-31 01:44:45', '2023-11-19 11:35:44', '2023-11-19 11:35:44'),
('91c01da7-f2b8-48cb-8e32-730cf4fb1c4e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1722232995, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt2\"}', NULL, '2024-07-29 06:03:15', '2024-07-29 06:03:15'),
('91e8591b-3351-47cf-94f7-4488f1d51c82', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1696042958, '{\"user_id\":17,\"name\":\"irfan\",\"email\":\"touchit236@gmail.com\",\"status\":\"1\",\"msg\":\"New Order 1696042958 has been placed by irfan\"}', NULL, '2023-09-30 03:02:38', '2023-09-30 03:02:38'),
('923be809-159c-4bb0-8d64-7d1384dd2340', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1696042840, '{\"user_id\":17,\"name\":\"irfan\",\"email\":\"touchit236@gmail.com\",\"status\":\"1\",\"msg\":\"New Order 1696042840 has been placed by irfan\"}', NULL, '2023-09-30 03:00:40', '2023-09-30 03:00:40'),
('9296494f-1454-407f-8152-78f78206bfcd', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1700727199, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from DonaldNib\"}', '2024-01-31 01:44:37', '2023-11-23 08:13:19', '2023-11-23 08:13:19'),
('93006f34-cf0f-4862-ad42-d9a6bc91c1b9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1687716068, '{\"user_id\":13,\"name\":\"admin\",\"email\":\"admin@admin.com\",\"status\":\"1\",\"msg\":\"New Order 1687716068 has been placed by admin\"}', '2023-07-06 13:26:43', '2023-06-25 13:01:08', '2023-06-25 13:01:08'),
('938881c2-88d6-4707-9bce-c2dfc8cc55ca', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1724650991, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-08-26 05:43:11', '2024-08-26 05:43:11'),
('94cf3db0-7cc8-4666-bbb4-19aec4a7deb1', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1715710331, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve2\"}', NULL, '2024-05-14 18:12:11', '2024-05-14 18:12:11'),
('94e775e0-70c8-4071-95cc-ad75c380b7ca', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1688582567, '{\"user_id\":1,\"name\":\"admin\",\"email\":\"irfan@gmail.com\",\"status\":\"4\",\"msg\":\"Message from wewe\"}', '2023-07-06 13:26:43', '2023-07-05 13:42:47', '2023-07-05 13:42:47'),
('9532ffa0-6281-49d4-9a84-91406241e40f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1688808118, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order# 1688808118 has been placed by soft zone\"}', NULL, '2023-07-08 04:21:58', '2023-07-08 04:21:58'),
('95721b20-5ad7-44b1-82a9-34bde1b8c75b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1712030097, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-02 03:54:57', '2024-04-02 03:54:57'),
('95ffa2c7-c531-4914-80c3-98bb977e2fd6', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1714422942, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervea\"}', NULL, '2024-04-29 20:35:42', '2024-04-29 20:35:42'),
('965badba-b7f0-409d-a723-ec9a52ae4f8a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1721355763, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-07-19 02:22:43', '2024-07-19 02:22:43'),
('9686e8de-4667-48ce-998c-c07e2bc88793', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1700393746, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Eddiefam\"}', '2024-01-31 01:45:06', '2023-11-19 11:35:46', '2023-11-19 11:35:46'),
('96c504fa-9a5a-4731-9bef-89488b1a827f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1697922241, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from TimothyTwise\"}', '2024-01-31 01:45:16', '2023-10-21 21:04:01', '2023-10-21 21:04:01'),
('97aa85ee-8cea-4b4e-8756-a8d19b72301c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1687715957, '{\"user_id\":13,\"name\":\"admin\",\"email\":\"admin@admin.com\",\"status\":\"4\",\"msg\":\"Message from admin\"}', '2023-07-06 13:26:43', '2023-06-25 12:59:17', '2023-06-25 12:59:17'),
('97bd3ac8-830d-4db4-8dbc-0856a4f3a616', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1708079722, '{\"user_id\":36,\"name\":\"Soft Cell\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order 1708079722 has been placed by Soft Cell\"}', NULL, '2024-02-16 10:35:22', '2024-02-16 10:35:22'),
('97ced537-c88d-42be-950e-e633374da565', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 31, NULL, '{\"user_id\":31,\"name\":\"Entertainment zone\",\"email\":\"entertainmentzone8219@gmail.com\",\"status\":\"2\",\"msg\":\"Entertainment zone Your Order# 1706549266 Placed.\"}', NULL, '2024-01-29 17:27:46', '2024-01-29 17:27:46'),
('980d90d7-7d97-4847-ab39-08411c4449bd', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1711205596, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from citystar\"}', NULL, '2024-03-23 14:53:16', '2024-03-23 14:53:16'),
('98428542-edc8-402a-aecb-8846f98078ce', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, NULL, '{\"user_id\":29,\"name\":\"Muhammad Irfan\",\"email\":\"ishsj@gmail.ddd\",\"status\":\"0\",\"msg\":\"New User Muhammad Irfan has been registered\"}', NULL, '2023-07-06 13:35:08', '2023-07-06 13:35:08'),
('9880d568-5630-4553-ad48-601c6a051d63', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1700727197, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from DonaldNib\"}', '2024-01-31 01:44:41', '2023-11-23 08:13:17', '2023-11-23 08:13:17'),
('9888ff53-8a29-4e6a-b843-589c4583fac6', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, NULL, '{\"user_id\":40,\"name\":\"Muhammad Irfan (Developer)\",\"email\":\"iirfandeveloper@gmail.com\",\"status\":\"0\",\"msg\":\"New User Muhammad Irfan (Developer) has been registered\"}', NULL, '2024-09-12 11:16:37', '2024-09-12 11:16:37'),
('9932ce40-5158-4db3-a535-8e384e0abc46', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1713644117, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervec\"}', NULL, '2024-04-20 20:15:17', '2024-04-20 20:15:17'),
('99b42368-49a0-4d6f-a68f-f4de62877cc4', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1711873807, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-31 08:30:07', '2024-03-31 08:30:07'),
('9bbc18e7-c9e4-4395-a4d0-2fe42899059b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1688312074, '{\"user_id\":14,\"name\":\"user\",\"email\":\"user@user.com\",\"status\":\"1\",\"msg\":\"New Order# 1688312073 has been placed by user\"}', '2023-07-06 13:26:43', '2023-07-02 10:34:34', '2023-07-02 10:34:34'),
('9bcf3f8b-7cf9-4b19-91f5-5a247a0bd950', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1715660832, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-14 04:27:12', '2024-05-14 04:27:12'),
('9c29451b-90cd-4563-ad19-1b9d678f928e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1711131029, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-22 18:10:29', '2024-03-22 18:10:29'),
('9cd2d485-5729-4c77-b662-6a7a631e6164', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1719647473, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-06-29 07:51:13', '2024-06-29 07:51:13'),
('9e237132-5016-4d8f-b358-d6eaa4ee0789', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1721096524, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-07-16 02:22:04', '2024-07-16 02:22:04'),
('9e7efb53-6059-4d18-b9c2-6ad8e4d879f9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1696042958, '{\"user_id\":17,\"name\":\"irfan\",\"email\":\"touchit236@gmail.com\",\"status\":\"1\",\"msg\":\"New Order 1696042958 has been placed by irfan\"}', NULL, '2023-09-30 03:02:38', '2023-09-30 03:02:38'),
('9ea1a2a1-9b2a-494b-b546-e905c678e4ff', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1715792534, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadvervea\"}', NULL, '2024-05-15 17:02:14', '2024-05-15 17:02:14'),
('9ea92b68-045f-4443-a3cc-e4b779ce7cf6', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1713878683, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-04-23 13:24:43', '2024-04-23 13:24:43'),
('9ed1c763-ed3d-4e12-9cf3-b87081bbda03', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1714755026, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-03 16:50:26', '2024-05-03 16:50:26'),
('9ee8d3f6-68d6-4782-945f-267f367d790d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1714210809, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Robertzek\"}', NULL, '2024-04-27 09:40:09', '2024-04-27 09:40:09'),
('9f384568-1592-4de1-a199-b1d707117d67', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, NULL, '{\"user_id\":37,\"name\":\"irfan\",\"email\":\"softhouse8219@gmail.com\",\"status\":\"2\",\"msg\":\"irfan Your Order# 1706459099 Placed.\"}', NULL, '2024-01-28 16:24:59', '2024-01-28 16:24:59'),
('9f66192e-87d9-4ca0-be11-6c70fdbc8494', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1722155608, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-07-28 08:33:28', '2024-07-28 08:33:28'),
('9fe4b4f9-fcb8-4ed8-95ad-111042f1f677', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1717169389, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadverve2\"}', NULL, '2024-05-31 15:29:49', '2024-05-31 15:29:49'),
('a04f6ec6-85bf-48c4-b564-0fe5f296845b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1711205596, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from citystar\"}', NULL, '2024-03-23 14:53:16', '2024-03-23 14:53:16'),
('a0549ccb-b007-4979-9a52-1ce1ca894e72', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1714325323, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve2\"}', NULL, '2024-04-28 17:28:43', '2024-04-28 17:28:43'),
('a09ec71e-3532-46a8-b126-39d28706a7d0', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1723027888, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Robertdon\"}', NULL, '2024-08-07 10:51:28', '2024-08-07 10:51:28'),
('a09f28c5-b740-4b30-8d26-4413324c713b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1722820910, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from ThomasGraib\"}', NULL, '2024-08-05 01:21:50', '2024-08-05 01:21:50'),
('a0a301d8-1e9c-4d31-a241-5dbc5b22e14e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1721096524, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-07-16 02:22:04', '2024-07-16 02:22:04'),
('a15dc36b-5c84-4932-9dab-0de8e9b31cd8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1713182624, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervec\"}', NULL, '2024-04-15 12:03:44', '2024-04-15 12:03:44'),
('a1631e36-33a2-490a-9ff3-01ae32e21e0c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1719883003, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Shelley Espie\"}', NULL, '2024-07-02 01:16:43', '2024-07-02 01:16:43'),
('a1b93098-f03d-4c57-8ee2-10a5b66f12b6', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1716719320, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervec\"}', NULL, '2024-05-26 10:28:40', '2024-05-26 10:28:40'),
('a28b6035-e08f-4fa0-880a-b73c3c2dbb6c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1725650521, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Tedphero\"}', NULL, '2024-09-06 19:22:01', '2024-09-06 19:22:01'),
('a33ba82c-1a8a-4024-ab8f-d05974096fc7', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1725650521, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Tedphero\"}', NULL, '2024-09-06 19:22:01', '2024-09-06 19:22:02'),
('a34047c0-8f3d-4e3b-becc-385a1fdba73c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1724650991, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-08-26 05:43:11', '2024-08-26 05:43:11'),
('a3658cb4-2866-4a38-9e4b-b920459957bb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1713422003, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-18 06:33:23', '2024-04-18 06:33:23'),
('a3d87d89-9770-47da-8f90-b2a3e750c027', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone1@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1687012408 cancelled.\"}', NULL, '2023-10-01 17:33:36', '2023-10-01 17:33:36'),
('a475cc9e-0b0e-4ed8-b4e4-c5738c0a42df', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, NULL, '{\"user_id\":39,\"name\":\"Asad\",\"email\":\"xenforo8@gmail.com\",\"status\":\"0\",\"msg\":\"New User Asad has been registered\"}', NULL, '2024-07-05 06:44:43', '2024-07-05 06:44:43'),
('a51177d2-ef56-4703-999a-1e10667bd17a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1723658061, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jerrypiene\"}', NULL, '2024-08-14 17:54:21', '2024-08-14 17:54:21'),
('a55441b8-f7ab-4c1c-bc85-256f917a8d26', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1713644117, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervec\"}', NULL, '2024-04-20 20:15:17', '2024-04-20 20:15:17'),
('a56308de-214c-4c88-803f-bd4cf8eb7a65', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1717705699, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Raina Sheil\"}', NULL, '2024-06-06 20:28:19', '2024-06-06 20:28:19'),
('a57948ac-e537-4c80-83cc-a510984e2cb2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1713422003, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-18 06:33:23', '2024-04-18 06:33:23'),
('a5abf912-8616-491d-b782-d09b71bbf6b7', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1713072882, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-14 05:34:42', '2024-04-14 05:34:42'),
('a5aedd4b-7e2a-4465-a9fa-f36372a96d29', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1711873807, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-31 08:30:07', '2024-03-31 08:30:07'),
('a5b0e03c-e981-4f60-a4ff-f5e709068265', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1724463123, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-08-24 01:32:03', '2024-08-24 01:32:03'),
('a5bdb5e6-77d5-4a1e-909a-b7ac82220ba6', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1723027888, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Robertdon\"}', NULL, '2024-08-07 10:51:28', '2024-08-07 10:51:28'),
('a5cb5534-bcbc-4f1d-b361-1d237455aab8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1713182624, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervec\"}', NULL, '2024-04-15 12:03:44', '2024-04-15 12:03:44'),
('a63a4b82-599d-493c-a713-907fb22f1e63', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1687930828, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order# 1687930828 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-28 00:40:28', '2023-06-28 00:40:28'),
('a65cb14b-b258-4e8b-a5ed-d9fed078825c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1720810912, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-07-12 19:01:52', '2024-07-12 19:01:52'),
('a6861225-d650-4b5e-be8e-ea44ed35255f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1714422942, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervea\"}', NULL, '2024-04-29 20:35:42', '2024-04-29 20:35:42'),
('a77b8dc4-cc26-449d-8747-7c5b4dddb6a4', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1697922241, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from TimothyTwise\"}', '2024-01-31 01:45:16', '2023-10-21 21:04:01', '2023-10-21 21:04:01'),
('a79b9071-01ca-4c8f-8d4b-7222b2f47986', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1721546285, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-07-21 07:18:05', '2024-07-21 07:18:05'),
('a7cdec54-a7f3-4da1-af28-6269a6208381', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1714210809, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Robertzek\"}', NULL, '2024-04-27 09:40:09', '2024-04-27 09:40:09'),
('a7eef18e-b55a-429f-97e1-3604afda57d8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1719883003, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Shelley Espie\"}', NULL, '2024-07-02 01:16:43', '2024-07-02 01:16:43'),
('a80dbd8e-67b9-4c86-af1c-33b543969cdf', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1723168655, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jami Burns\"}', NULL, '2024-08-09 01:57:35', '2024-08-09 01:57:35'),
('a881faa5-0142-421a-a106-61df56abb0f1', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1722820910, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from ThomasGraib\"}', NULL, '2024-08-05 01:21:50', '2024-08-05 01:21:50'),
('a8fe988d-f803-4413-8791-4ef866053c22', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1721501444, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Annetta Pullman\"}', NULL, '2024-07-20 18:50:44', '2024-07-20 18:50:44'),
('a9af11a4-37ad-4d3d-9cc3-7278bc71cd10', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1723149108, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jerrypiene\"}', NULL, '2024-08-08 20:31:48', '2024-08-08 20:31:48'),
('a9b34ce4-dd09-40d8-b477-bccf6381e0a2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1714129615, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-04-26 11:06:55', '2024-04-26 11:06:55'),
('aa6b47f0-98cb-4f5b-a433-d035d6a4d6ed', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1717305424, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverve2\"}', NULL, '2024-06-02 05:17:04', '2024-06-02 05:17:04'),
('aa72b1bc-c6ba-48ff-bd9f-ed289ffbf572', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1713878683, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-04-23 13:24:43', '2024-04-23 13:24:43'),
('aa7ba878-5fc5-4b2d-8249-2af553b77453', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, NULL, '{\"user_id\":30,\"name\":\"Muhammad Irfan\",\"email\":\"jahdjdj@ajsjdj.sds\",\"status\":\"0\",\"msg\":\"New User Muhammad Irfan has been registered\"}', NULL, '2023-07-09 02:04:04', '2023-07-09 02:04:04'),
('aa80b4e3-2141-4d82-a3f7-53b810c88b3b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1713182624, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervec\"}', NULL, '2024-04-15 12:03:44', '2024-04-15 12:03:44'),
('aa8f35fc-f207-4b4f-ac6b-1d096bd08499', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1711251295, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-03-24 03:34:55', '2024-03-24 03:34:55'),
('aaca90c1-820d-45be-af8a-66b351348283', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1718121986, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jaqueline Runyon\"}', NULL, '2024-06-11 16:06:26', '2024-06-11 16:06:26'),
('ab2f4d03-a633-4320-a702-68cf5c6c1c91', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1712847747, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-11 15:02:27', '2024-04-11 15:02:27'),
('abd2ed6c-fc3e-4208-b031-5650d32da3a9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1708079722, '{\"user_id\":36,\"name\":\"Soft Cell\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order# 1708079722 has been placed by Soft Cell\"}', NULL, '2024-02-16 10:35:22', '2024-02-16 10:35:22'),
('ad0bd610-bea9-41f4-ac4c-98e3d3f90543', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, NULL, '{\"user_id\":37,\"name\":\"irfan\",\"email\":\"softhouse8219@gmail.com\",\"status\":\"0\",\"msg\":\"New User irfan has been registered\"}', NULL, '2024-01-28 16:13:15', '2024-01-28 16:13:15'),
('adfe9c6b-2068-46f6-9773-b84a7e8b7f20', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1709073842, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from IirinaNealo\"}', NULL, '2024-02-27 22:44:02', '2024-02-27 22:44:02'),
('ae3a83a5-1d1d-49cb-b6a3-fca4ab53b299', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1712613559, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervea\"}', NULL, '2024-04-08 21:59:19', '2024-04-08 21:59:19'),
('af1f9969-e4d2-4ec6-b622-1063e0a5af67', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1721355763, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-07-19 02:22:43', '2024-07-19 02:22:43'),
('af3a45ea-400c-4e5d-a4f1-32c0bd4b4112', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1717705699, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Raina Sheil\"}', NULL, '2024-06-06 20:28:19', '2024-06-06 20:28:19'),
('af6ec0c4-dcfc-40be-b9c5-263f407c455e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone1@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1688808980 cancelled.\"}', NULL, '2023-10-01 17:36:03', '2023-10-01 17:36:03'),
('afdc1df6-3abe-4981-82b3-fe140a3dedcf', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1721546285, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-07-21 07:18:05', '2024-07-21 07:18:05'),
('b04e57bf-9d21-4de6-8254-27a3a483deb5', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, NULL, '{\"user_id\":37,\"name\":\"irfan\",\"email\":\"softhouse8219@gmail.com\",\"status\":\"0\",\"msg\":\"New User irfan has been registered\"}', NULL, '2024-01-28 16:13:15', '2024-01-28 16:13:15'),
('b08c5638-86ab-474e-be44-144c64917393', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1687889567, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order# 1687889567 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-27 13:12:48', '2023-06-27 13:12:48'),
('b0fd7500-017c-4f4b-b025-32b3528d8492', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1712847747, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-11 15:02:27', '2024-04-11 15:02:27'),
('b1040a55-35f7-46f3-b972-3b428e098f6e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1711205596, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from citystar\"}', NULL, '2024-03-23 14:53:16', '2024-03-23 14:53:16'),
('b1a11afe-c74a-4cec-bae5-205be3878976', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1687891604, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order# 1687891604 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-27 13:46:44', '2023-06-27 13:46:44'),
('b1bd0cad-1d4b-4579-8407-745e817d53d4', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1711004067, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from 3D_kepn\"}', NULL, '2024-03-21 06:54:27', '2024-03-21 06:54:27'),
('b1e2eb8d-1012-4891-bad1-6b5843aee072', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, NULL, '{\"user_id\":40,\"name\":\"Muhammad Irfan (Developer)\",\"email\":\"iirfandeveloper@gmail.com\",\"status\":\"0\",\"msg\":\"New User Muhammad Irfan (Developer) has been registered\"}', NULL, '2024-09-12 11:16:37', '2024-09-12 11:16:37'),
('b21c48cf-05c6-4c62-b485-36118edeac0a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1712847747, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-11 15:02:27', '2024-04-11 15:02:27'),
('b2918912-5591-4489-89fa-e662f476fc99', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1711727595, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-29 15:53:15', '2024-03-29 15:53:15'),
('b31be338-2221-4bf2-9acb-32877b17d6fb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1714325323, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve2\"}', NULL, '2024-04-28 17:28:43', '2024-04-28 17:28:43'),
('b378f6af-86cc-4105-bb6a-90f423dd5bcd', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1721068070, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Twila Hillgrove\"}', NULL, '2024-07-15 18:27:50', '2024-07-15 18:27:50'),
('b44badd8-31cf-428a-b9fe-50fda550a4ca', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1714296217, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve1\"}', NULL, '2024-04-28 09:23:37', '2024-04-28 09:23:37'),
('b4872056-6027-4cbb-b11d-f9cd5210a1dd', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1711727595, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-29 15:53:15', '2024-03-29 15:53:15'),
('b5487183-4132-4ff1-abe3-60dbcb03437f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1713182624, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervec\"}', NULL, '2024-04-15 12:03:44', '2024-04-15 12:03:44'),
('b56f6e47-f4e6-442d-bb17-1f37d2206f54', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1725650521, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Tedphero\"}', NULL, '2024-09-06 19:22:01', '2024-09-06 19:22:01'),
('b5b9c425-1923-4ad5-b490-549ebfdcea08', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1717169389, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadverve2\"}', NULL, '2024-05-31 15:29:49', '2024-05-31 15:29:49'),
('b7310ea9-398f-4326-aa45-9248bec3ae95', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1714755026, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-03 16:50:26', '2024-05-03 16:50:26'),
('b7350926-f6a5-409f-b681-1723cc5ddc00', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1723658061, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jerrypiene\"}', NULL, '2024-08-14 17:54:21', '2024-08-14 17:54:21'),
('b7b0d9b4-23cc-4cbd-b8fc-212b33087ef9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1715779752, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverveb\"}', NULL, '2024-05-15 13:29:12', '2024-05-15 13:29:12'),
('b7c14dc6-bac1-4dde-bea6-3bca086a0896', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1711558001, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve3\"}', NULL, '2024-03-27 16:46:41', '2024-03-27 16:46:41'),
('b7cc123d-1817-47cb-af33-c755a3929199', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1724463123, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-08-24 01:32:03', '2024-08-24 01:32:03'),
('b7f86e7d-5c3b-4054-80ef-41b45609e9be', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1725650521, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Tedphero\"}', NULL, '2024-09-06 19:22:01', '2024-09-06 19:22:01'),
('b8002716-f031-4c4d-a7b0-3cfe2d7ba23e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, NULL, '{\"user_id\":38,\"name\":\"ahmed\",\"email\":\"shakeelaansar79@gmail.com\",\"status\":\"0\",\"msg\":\"New User ahmed has been registered\"}', NULL, '2024-04-10 14:47:48', '2024-04-10 14:47:48'),
('b857a777-61f5-45ad-91de-edeb49c3bb3e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1712218730, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-04 08:18:50', '2024-04-04 08:18:50'),
('b94c582c-b57e-4e8e-ad06-bbb14ac91732', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1721546285, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-07-21 07:18:05', '2024-07-21 07:18:05'),
('b96443fd-e097-4bbe-bed3-c3addd94696a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1713072882, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-14 05:34:42', '2024-04-14 05:34:42'),
('b98609c0-427d-4d7e-861d-d8087c5428c0', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1721068070, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Twila Hillgrove\"}', NULL, '2024-07-15 18:27:50', '2024-07-15 18:27:50'),
('b9f97db8-1c29-459f-81c6-dcf8d38e7e56', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1721546285, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-07-21 07:18:05', '2024-07-21 07:18:05'),
('ba898908-f432-4e03-ad15-feb39ff1056c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1725457478, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-09-04 13:44:39', '2024-09-04 13:44:39'),
('baf5eba5-8fca-4ab3-b59e-14c803393341', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1724213310, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-08-21 04:08:30', '2024-08-21 04:08:30'),
('bb1f3b3c-04a6-4d08-ac06-6cddd1aeb486', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1693067407 Placed.\"}', '2023-09-30 08:00:22', '2023-08-26 11:30:14', '2023-08-26 11:30:14'),
('bbb9295a-1612-4c12-b322-cdeaae7ac2f2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1708079722, '{\"user_id\":36,\"name\":\"Soft Cell\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order 1708079722 has been placed by Soft Cell\"}', NULL, '2024-02-16 10:35:22', '2024-02-16 10:35:22'),
('bcb6a081-ecda-4a15-9ab8-a8851067a52c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, NULL, '{\"user_id\":36,\"name\":\"Soft Cell\",\"email\":\"softcellzone@gmail.com\",\"status\":\"0\",\"msg\":\"New User Soft Cell has been registered\"}', NULL, '2023-10-04 15:43:02', '2023-10-04 15:43:02'),
('bcbe5451-6878-4eb8-99ab-af6139edfc12', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1715779752, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverveb\"}', NULL, '2024-05-15 13:29:12', '2024-05-15 13:29:12'),
('bcfafaba-63a7-4f1d-a35b-ccb1cfd39831', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1713422003, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-18 06:33:23', '2024-04-18 06:33:23');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `sync_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('bd5ecf25-8ed3-4cb1-984a-0d7052a6e2f5', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1722232995, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt2\"}', NULL, '2024-07-29 06:03:15', '2024-07-29 06:03:15'),
('bd8608f0-ac55-438a-8459-a02d8f0c8b8a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1698654701, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from PhillipSniva\"}', '2024-01-31 01:45:28', '2023-10-30 08:31:41', '2023-10-30 08:31:41'),
('bdf37ff6-1fe6-4d63-b42d-763da32f9afb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1714995980, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jannes\"}', NULL, '2024-05-06 11:46:20', '2024-05-06 11:46:20'),
('be1d71c0-cf8c-45a4-bda1-af9b66a17e81', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1715448478, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-11 17:27:58', '2024-05-11 17:27:58'),
('bea1312c-f71f-4fb6-8d99-e2f376e6d3fd', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1716012115, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-18 06:01:55', '2024-05-18 06:01:55'),
('bec83aa8-52b2-405c-b7bb-c33dd758cab3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1720446463, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from James Zhang\"}', NULL, '2024-07-08 13:47:43', '2024-07-08 13:47:43'),
('bfaa7f8e-8863-40d4-84e8-e66878b841f9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1709073842, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from IirinaNealo\"}', NULL, '2024-02-27 22:44:02', '2024-02-27 22:44:02'),
('bff90093-f4cd-4d5d-8cc5-9882715350af', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1708079722, '{\"user_id\":36,\"name\":\"Soft Cell\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order 1708079722 has been placed by Soft Cell\"}', NULL, '2024-02-16 10:35:22', '2024-02-16 10:35:22'),
('c02b4d2e-7cb1-49da-b6cb-0df1ecd7a105', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1721501444, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Annetta Pullman\"}', NULL, '2024-07-20 18:50:44', '2024-07-20 18:50:44'),
('c0b94b88-d0a2-4cb0-aaa6-f0b15ac885c8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1687889567, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order 1687889567 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-27 13:12:48', '2023-06-27 13:12:48'),
('c0f8daee-6616-4b64-aa22-c1fdddbfa7d3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1723149108, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jerrypiene\"}', NULL, '2024-08-08 20:31:48', '2024-08-08 20:31:48'),
('c241f69f-ee18-436e-9055-a404dd5f57fd', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1710141880, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from CharlesHot\"}', NULL, '2024-03-11 07:24:40', '2024-03-11 07:24:40'),
('c2e51157-ba31-4827-837f-0cc21b034f49', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1714296217, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve1\"}', NULL, '2024-04-28 09:23:37', '2024-04-28 09:23:37'),
('c2f9efaa-b23a-4456-911d-85e9fcde2dad', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1713878683, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-04-23 13:24:43', '2024-04-23 13:24:43'),
('c369e1df-c67a-4975-bf40-164525f0da35', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1722197959, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from SpeedyIndexBot\"}', NULL, '2024-07-28 20:19:19', '2024-07-28 20:19:19'),
('c39c9920-554d-4aee-85c8-2d59f985c106', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1710141875, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from CharlesHot\"}', NULL, '2024-03-11 07:24:35', '2024-03-11 07:24:35'),
('c3b55467-8e11-4cfb-87a6-a29228113b3e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1696042840, '{\"user_id\":17,\"name\":\"irfan\",\"email\":\"touchit236@gmail.com\",\"status\":\"1\",\"msg\":\"New Order 1696042840 has been placed by irfan\"}', NULL, '2023-09-30 03:00:40', '2023-09-30 03:00:40'),
('c3d8b792-bbd0-4071-8e54-b7fbfa3893a8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1715761849, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-15 08:30:49', '2024-05-15 08:30:49'),
('c402ca50-e990-4fbd-8003-ef2dbbce9812', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1716012115, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-18 06:01:55', '2024-05-18 06:01:55'),
('c4a5bcf8-b264-4f72-8364-07a510c2b86f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1712613559, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadvervea\"}', NULL, '2024-04-08 21:59:19', '2024-04-08 21:59:19'),
('c5557487-aafb-4d21-99d0-2cb578de897c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1717305424, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverve2\"}', NULL, '2024-06-02 05:17:04', '2024-06-02 05:17:04'),
('c6452c5a-6d99-4c7a-869c-b5aa95dd4bd4', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1722155608, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-07-28 08:33:28', '2024-07-28 08:33:28'),
('c688958d-9b39-4a06-bcdd-4a04b256b750', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1712218730, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-04 08:18:50', '2024-04-04 08:18:50'),
('c6e13e33-8993-40cf-95fd-db9f15408d30', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1722820910, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from ThomasGraib\"}', NULL, '2024-08-05 01:21:50', '2024-08-05 01:21:50'),
('c7b3a5a1-687a-4ce0-b18b-6f5970fd90ca', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1698654701, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from PhillipSniva\"}', '2024-01-31 01:45:28', '2023-10-30 08:31:41', '2023-10-30 08:31:41'),
('c9061b75-6774-49d2-9026-66b9b8bf72a8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1713422003, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-18 06:33:23', '2024-04-18 06:33:23'),
('c9a8c938-6821-4e32-bcc9-503a520a376b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone1@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1688808118 cancelled.\"}', NULL, '2023-10-01 17:36:10', '2023-10-01 17:36:10'),
('ca46657c-8c5f-4e16-b0af-126c8d28f337', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1722172412, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from LeadsMax.biz\"}', NULL, '2024-07-28 13:13:32', '2024-07-28 13:13:32'),
('ca56e157-09f1-4568-80d4-e335e88df0b5', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1710141875, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from CharlesHot\"}', NULL, '2024-03-11 07:24:35', '2024-03-11 07:24:35'),
('caa6823a-a823-4d68-871c-93b74d52e421', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1712030097, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-02 03:54:57', '2024-04-02 03:54:57'),
('cac514cd-6029-4a2f-bfc6-6ff8bc465af8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1714129615, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-04-26 11:06:55', '2024-04-26 11:06:55'),
('cce141cf-db99-4ec4-8332-16dcde26a01c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1687715957, '{\"user_id\":13,\"name\":\"admin\",\"email\":\"admin@admin.com\",\"status\":\"4\",\"msg\":\"Message from admin\"}', '2023-07-06 13:26:43', '2023-06-25 12:59:17', '2023-06-25 12:59:17'),
('cd725326-a67b-4306-a7a4-19b7fc39d66d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1723658061, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jerrypiene\"}', NULL, '2024-08-14 17:54:21', '2024-08-14 17:54:21'),
('cd808cec-e23e-461c-9d0f-8e2690368b9d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1722172412, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from LeadsMax.biz\"}', NULL, '2024-07-28 13:13:32', '2024-07-28 13:13:32'),
('cdbd00c8-c655-4759-a58e-59f95fc462c1', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1712262680, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-04 20:31:20', '2024-04-04 20:31:20'),
('ce066067-411b-4fd0-b70f-f3ba0047b55c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, NULL, '{\"user_id\":39,\"name\":\"Asad\",\"email\":\"xenforo8@gmail.com\",\"status\":\"0\",\"msg\":\"New User Asad has been registered\"}', NULL, '2024-07-05 06:44:43', '2024-07-05 06:44:43'),
('ce1ec993-63f9-4582-8bc0-3782e5610d4c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1724213310, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-08-21 04:08:30', '2024-08-21 04:08:30'),
('cea1c3b4-6c51-4a37-8c60-4351724fb2c3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1712030097, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-02 03:54:57', '2024-04-02 03:54:57'),
('cee227eb-bfb2-4fa4-aaef-8c425e9fe551', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1719883003, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Shelley Espie\"}', NULL, '2024-07-02 01:16:43', '2024-07-02 01:16:43'),
('cee3f291-5d80-4c5a-b399-8e9742eeeb51', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1688667537, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone@gmail.com\",\"status\":\"1\",\"msg\":\"New Order# 1688667537 has been placed by soft zone\"}', NULL, '2023-07-06 13:18:57', '2023-07-06 13:18:57'),
('cefad959-7d69-4b5e-957b-fe5b8347ca7b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1725457478, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-09-04 13:44:39', '2024-09-04 13:44:39'),
('cf108626-6561-45c9-b987-d78c1688ffe7', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1722457713, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from JeffreyVaw\"}', NULL, '2024-07-31 20:28:33', '2024-07-31 20:28:33'),
('cf3b626e-b242-4f2e-8345-a10d587776f1', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone1@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1688667677 cancelled.\"}', NULL, '2023-10-01 17:35:55', '2023-10-01 17:35:55'),
('cf4ab180-98e3-41ea-8046-fe4256e51159', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1687891688, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order 1687891688 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-27 13:48:08', '2023-06-27 13:48:08'),
('cf86ddb1-127e-4318-972e-2df618f8fea9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1712388031, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-04-06 07:20:31', '2024-04-06 07:20:31'),
('cf979f07-9526-4408-8407-90c12849c23c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, NULL, '{\"user_id\":38,\"name\":\"ahmed\",\"email\":\"shakeelaansar79@gmail.com\",\"status\":\"0\",\"msg\":\"New User ahmed has been registered\"}', NULL, '2024-04-10 14:47:48', '2024-04-10 14:47:48'),
('d050d7d6-ef5f-412f-87d7-cffc516342c3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1697922241, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from TimothyTwise\"}', '2024-01-31 01:45:16', '2023-10-21 21:04:01', '2023-10-21 21:04:01'),
('d079adde-55f0-4fb6-8da8-4d5e07c06801', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1721355763, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-07-19 02:22:43', '2024-07-19 02:22:43'),
('d0c8c923-d20e-4ba0-a53b-6116d591d23f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1700393746, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Eddiefam\"}', '2024-01-31 01:45:06', '2023-11-19 11:35:46', '2023-11-19 11:35:46'),
('d1502800-771f-4a35-a6a1-473296e78d43', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1722232995, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt2\"}', NULL, '2024-07-29 06:03:15', '2024-07-29 06:03:15'),
('d168428f-89c9-4947-840a-8dc5a6e5962d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1721355763, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-07-19 02:22:43', '2024-07-19 02:22:43'),
('d16b06b4-4d24-4b4f-b170-22f160e6146d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1711558001, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve3\"}', NULL, '2024-03-27 16:46:41', '2024-03-27 16:46:41'),
('d2e95324-99ae-4d9b-be76-b60577e42ef5', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, NULL, '{\"user_id\":17,\"name\":\"irfan\",\"email\":\"touchit236@gmail.com\",\"status\":\"2\",\"msg\":\"irfan Your Order# 1696042840 Placed.\"}', NULL, '2023-09-30 03:00:40', '2023-09-30 03:00:40'),
('d2f145b2-2c5c-4d79-97d7-39645b2996cc', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1701225290, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Stevencob\"}', NULL, '2023-11-29 02:34:50', '2023-11-29 02:34:50'),
('d33d9c0f-c3a0-45da-b191-8e3218987bb1', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1715710331, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve2\"}', NULL, '2024-05-14 18:12:11', '2024-05-14 18:12:11'),
('d385ab35-c3c4-4fe7-b2c1-82daab80009e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1693067407 status updated.\"}', '2023-09-30 08:00:22', '2023-08-26 11:31:36', '2023-08-26 11:31:36'),
('d5450e36-6184-40d4-ae0b-4c76df0e9ecd', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1725650521, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Tedphero\"}', NULL, '2024-09-06 19:22:02', '2024-09-06 19:22:02'),
('d6c1b2fd-f0d3-4769-9abe-4ec3c307201d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1716404278, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-22 18:57:58', '2024-05-22 18:57:58'),
('d6f9dcc6-3953-4e08-a74a-e09e90863953', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1696042840, '{\"user_id\":17,\"name\":\"irfan\",\"email\":\"touchit236@gmail.com\",\"status\":\"1\",\"msg\":\"New Order# 1696042840 has been placed by irfan\"}', NULL, '2023-09-30 03:00:40', '2023-09-30 03:00:40'),
('d7edc017-56e8-4617-ac8b-512552aef1d3', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1724463123, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipta\"}', NULL, '2024-08-24 01:32:03', '2024-08-24 01:32:03'),
('d87d5950-76e9-4ea1-8b8c-feaea7f5ed06', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1710141875, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from CharlesHot\"}', NULL, '2024-03-11 07:24:35', '2024-03-11 07:24:35'),
('d8b1c419-4ade-43b4-a266-ab4e388c6d8c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1715792534, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadvervea\"}', NULL, '2024-05-15 17:02:14', '2024-05-15 17:02:14'),
('d9ce23f6-1aac-403c-a099-ef7ffc93b516', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1722953661, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from ThomasGraib\"}', NULL, '2024-08-06 14:14:21', '2024-08-06 14:14:21'),
('da2c3841-3412-455f-ac43-1885f4c3cc18', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1715499576, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-12 07:39:36', '2024-05-12 07:39:36'),
('da9138a8-37af-4020-b7cf-908b6f5d9d43', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1687891746, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order# 1687891746 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-27 13:49:06', '2023-06-27 13:49:06'),
('dba695cd-a45a-4846-9398-4be37ac2167c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1711727595, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-03-29 15:53:15', '2024-03-29 15:53:15'),
('dc71870b-f16d-43ba-9efe-c6fc67a8201b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1716719320, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervec\"}', NULL, '2024-05-26 10:28:40', '2024-05-26 10:28:40'),
('dc91f6ef-06d1-40d9-8f0a-f822f9c50069', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, NULL, '{\"user_id\":13,\"name\":\"admin\",\"email\":\"admin@admin.com\",\"status\":\"2\",\"msg\":\"admin Your Order# 1686936063 cancelled.\"}', NULL, '2023-10-01 17:35:24', '2023-10-01 17:35:24'),
('dd3ebf44-fa56-49bf-b4f2-4b34df77b8eb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1714422942, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervea\"}', NULL, '2024-04-29 20:35:42', '2024-04-29 20:35:42'),
('dddc8475-ae59-4e66-84a9-cb3dee9312b6', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1698654701, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from PhillipSniva\"}', '2024-01-31 01:45:28', '2023-10-30 08:31:41', '2023-10-30 08:31:41'),
('de30df46-094f-4984-a2af-fcb65c723745', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, NULL, '{\"user_id\":40,\"name\":\"Muhammad Irfan (Developer)\",\"email\":\"iirfandeveloper@gmail.com\",\"status\":\"0\",\"msg\":\"New User Muhammad Irfan (Developer) has been registered\"}', NULL, '2024-09-12 11:16:37', '2024-09-12 11:16:37'),
('deb023fc-17d6-4654-9f29-43cf36e1b921', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1714755026, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-03 16:50:26', '2024-05-03 16:50:26'),
('defa56b4-b40d-4f2f-a08f-b188231b483b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1725457478, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-09-04 13:44:39', '2024-09-04 13:44:39'),
('df31bda9-b758-4851-8022-03c571971e33', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1711381211, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve3\"}', NULL, '2024-03-25 15:40:11', '2024-03-25 15:40:11'),
('dfaf0fbe-24c7-4db2-8b4f-99b4d08a7c9c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1714325323, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve2\"}', NULL, '2024-04-28 17:28:43', '2024-04-28 17:28:43'),
('e01ab949-38e9-4f33-8f1f-90a3718479b8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1701225292, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Stevencob\"}', '2024-01-31 01:44:24', '2023-11-29 02:34:52', '2023-11-29 02:34:52'),
('e104ee15-a165-4aae-9b90-e77b34a56365', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1716012115, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-18 06:01:55', '2024-05-18 06:01:55'),
('e16f409a-661b-4779-b17a-df3853539b65', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1714129615, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-04-26 11:06:55', '2024-04-26 11:06:55'),
('e245046e-dbf9-4e82-a870-80c4f00f6daa', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1710141880, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from CharlesHot\"}', NULL, '2024-03-11 07:24:40', '2024-03-11 07:24:40'),
('e35cee81-c091-425f-b716-9c7e68da6962', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1722155608, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-07-28 08:33:28', '2024-07-28 08:33:28'),
('e3804b2f-ad51-4947-8e5e-19246688b650', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1714296217, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve1\"}', NULL, '2024-04-28 09:23:37', '2024-04-28 09:23:37'),
('e3da2388-ca91-4b1f-9fe8-61001f5f94ef', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1715779752, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverveb\"}', NULL, '2024-05-15 13:29:12', '2024-05-15 13:29:12'),
('e44c2e7d-4148-4e56-9edf-f24c00d15463', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1723149108, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jerrypiene\"}', NULL, '2024-08-08 20:31:48', '2024-08-08 20:31:48'),
('e494156f-a7a5-4744-a1fa-72ce67eef6a4', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1722197959, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from SpeedyIndexBot\"}', NULL, '2024-07-28 20:19:19', '2024-07-28 20:19:19'),
('e4ff6133-0d20-4275-ba1f-bad8dde8a658', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1717169389, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadverve2\"}', NULL, '2024-05-31 15:29:49', '2024-05-31 15:29:49'),
('e67829b8-6753-4678-b972-b9893e474472', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1722953661, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from ThomasGraib\"}', NULL, '2024-08-06 14:14:21', '2024-08-06 14:14:21'),
('e6f4460c-361c-4a71-aed3-e9c1914ff914', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1716121934, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverveb\"}', NULL, '2024-05-19 12:32:14', '2024-05-19 12:32:14'),
('e725e3d7-c4aa-4ec3-aa8d-b8eb1fd5897c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1710141875, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from CharlesHot\"}', NULL, '2024-03-11 07:24:35', '2024-03-11 07:24:35'),
('e7ae84d1-a75c-47b4-817e-1f5a05dd256f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1714995980, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jannes\"}', NULL, '2024-05-06 11:46:20', '2024-05-06 11:46:20'),
('e7f1277f-8841-4eb7-80ce-a502b8d054ae', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1716121934, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverveb\"}', NULL, '2024-05-19 12:32:14', '2024-05-19 12:32:14'),
('e8a77cca-7621-47b0-8dd1-e01f13e7da4b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1725867735, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-09-09 07:42:15', '2024-09-09 07:42:15'),
('e9fba634-e625-4136-aab9-1c6a74b44a1c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1716719320, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervec\"}', NULL, '2024-05-26 10:28:40', '2024-05-26 10:28:40'),
('ea1be2ab-f276-4be9-b574-37b9498d305f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1716404278, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-22 18:57:58', '2024-05-22 18:57:58'),
('ea6385e5-ccbe-4e3c-b898-1217971adb47', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1693142046 Placed.\"}', '2023-09-30 08:00:22', '2023-08-27 08:14:07', '2023-08-27 08:14:07'),
('ea7b682d-afc2-4061-8a6b-27786fc1504c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1701579746, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Stevevem\"}', '2024-01-31 01:45:31', '2023-12-03 05:02:26', '2023-12-03 05:02:26'),
('eabe9c66-013b-47dc-aa26-759d3a9770ab', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1687891604, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order 1687891604 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-27 13:46:44', '2023-06-27 13:46:44'),
('eaf61005-f1e5-46b6-8eae-6c018ec82023', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1715448478, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-11 17:27:58', '2024-05-11 17:27:58'),
('eb8ce0cf-1400-44cd-af7a-52968c554766', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone1@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1688667135 cancelled.\"}', NULL, '2023-10-01 17:33:45', '2023-10-01 17:33:45'),
('ec0a59c8-693b-4920-9da5-8df04b489ea8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1715761849, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-15 08:30:49', '2024-05-15 08:30:49'),
('ecf9ece6-698f-4928-891a-cf6f3686cb6c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1716404278, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-22 18:57:58', '2024-05-22 18:57:58'),
('ed0eabe4-ba2f-4ae8-abc9-eee5aae1f177', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1711004067, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from 3D_kepn\"}', NULL, '2024-03-21 06:54:27', '2024-03-21 06:54:27'),
('ed7e786a-a685-46c6-b8d2-0a25f1ca3ca9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1714325323, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadverve2\"}', NULL, '2024-04-28 17:28:43', '2024-04-28 17:28:43'),
('ed91c17b-e85f-4919-a0c0-674c1b2b9bd8', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1714210809, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Robertzek\"}', NULL, '2024-04-27 09:40:09', '2024-04-27 09:40:09'),
('ee77b9f7-7cd6-427b-a4e3-73eb8cf1dc38', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1714422942, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervea\"}', NULL, '2024-04-29 20:35:42', '2024-04-29 20:35:42'),
('eeacce85-f019-40fe-b2e9-cc46245f7648', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, NULL, '{\"user_id\":29,\"name\":\"Muhammad Irfan\",\"email\":\"ishsj@gmail.ddd\",\"status\":\"0\",\"msg\":\"New User Muhammad Irfan has been registered\"}', NULL, '2023-07-06 13:35:08', '2023-07-06 13:35:08'),
('eed48486-b335-4978-8aa4-368f88724f4e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1725770131, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-09-08 04:35:31', '2024-09-08 04:35:31'),
('efe1437c-380b-4e5b-a440-545a2e3fc778', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1715660832, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-14 04:27:12', '2024-05-14 04:27:12'),
('f00a6d80-6514-41f9-b4aa-fe0a7e698742', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1722155608, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-07-28 08:33:28', '2024-07-28 08:33:28'),
('f037d867-ae3f-4b58-94c0-89ee1504aa5e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1715761849, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-15 08:30:49', '2024-05-15 08:30:49'),
('f038eab3-354c-47f1-bf1d-4497bd77e20e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1722197959, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from SpeedyIndexBot\"}', NULL, '2024-07-28 20:19:19', '2024-07-28 20:19:19'),
('f0e7ffab-9a7b-4f90-92a9-9e50f777fb9d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1709073842, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from IirinaNealo\"}', NULL, '2024-02-27 22:44:02', '2024-02-27 22:44:02'),
('f0eb2d12-36aa-4430-aafa-7f2dc5a0a3e4', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1715448478, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-11 17:27:58', '2024-05-11 17:27:58'),
('f1343880-4f5e-4d70-b2fd-3c7bb9f1ac06', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1715448478, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-11 17:27:58', '2024-05-11 17:27:58'),
('f15fd8bd-396e-4052-988c-1117426a142a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1721096524, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-07-16 02:22:04', '2024-07-16 02:22:04'),
('f188c338-19a2-431e-ba13-186b75dc7dc0', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1711004067, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from 3D_kepn\"}', NULL, '2024-03-21 06:54:27', '2024-03-21 06:54:27'),
('f199d3c5-9250-497a-a85a-911cffc8ca4c', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1720810912, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbipt3\"}', NULL, '2024-07-12 19:01:52', '2024-07-12 19:01:52'),
('f1a55823-285b-48cb-a99b-a7e5e0b04538', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1721096524, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptc\"}', NULL, '2024-07-16 02:22:04', '2024-07-16 02:22:04'),
('f209c7d8-8496-4273-8b88-6e7e7ba2b315', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1717169389, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadverve2\"}', NULL, '2024-05-31 15:29:49', '2024-05-31 15:29:49'),
('f2150108-9cf3-4006-a23a-2724bd789525', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1716012115, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-18 06:01:55', '2024-05-18 06:01:55'),
('f253ded6-42ca-4355-957b-78c4b24c5375', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1721501444, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Annetta Pullman\"}', NULL, '2024-07-20 18:50:44', '2024-07-20 18:50:44'),
('f274348f-d360-4abf-bcf3-9f211720ae11', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1699267558, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from KevinSep\"}', '2024-01-31 01:45:02', '2023-11-06 10:45:58', '2023-11-06 10:45:58'),
('f2dc982d-971e-441c-abf6-4badefa817a4', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1712262680, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-04 20:31:20', '2024-04-04 20:31:20'),
('f37703aa-6b04-43f8-b669-e9811aba5107', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1720446463, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from James Zhang\"}', NULL, '2024-07-08 13:47:43', '2024-07-08 13:47:43'),
('f423b424-634f-4126-aec7-c4a0c6411fe6', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1687889597, '{\"user_id\":26,\"name\":\"user@df.cc\",\"email\":\"adm.df@dff.df\",\"status\":\"1\",\"msg\":\"New Order# 1687889597 has been placed by user@df.cc\"}', '2023-07-06 13:26:43', '2023-06-27 13:13:17', '2023-06-27 13:13:17'),
('f474b8ed-c416-48ff-953a-05614f0b799a', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1712388031, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve2\"}', NULL, '2024-04-06 07:20:31', '2024-04-06 07:20:31'),
('f4ae1d29-686b-41e0-844e-6e4d2ac1e016', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1722172412, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from LeadsMax.biz\"}', NULL, '2024-07-28 13:13:32', '2024-07-28 13:13:32'),
('f5f1ff0c-d485-4e81-a43e-0ebae2b9120e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone1@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1690563475 cancelled.\"}', NULL, '2023-10-01 17:37:22', '2023-10-01 17:37:22'),
('f5ffab74-3d2c-4841-94c8-981c65bcfb09', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1721355763, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from AmandaOrbiptb\"}', NULL, '2024-07-19 02:22:43', '2024-07-19 02:22:43'),
('f78bbe6c-6b61-4d15-8a9a-f37eaff75c53', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1723658061, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jerrypiene\"}', NULL, '2024-08-14 17:54:21', '2024-08-14 17:54:21'),
('f89ae53f-e876-4eea-b42c-0f9dab0907ce', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1714129615, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-04-26 11:06:55', '2024-04-26 11:06:55'),
('f9084b6d-3cd6-4536-94c5-8fefc8d6e651', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1712030097, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-02 03:54:57', '2024-04-02 03:54:57'),
('f92735fd-bf4a-445c-ae1c-770754353791', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1715660832, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Irenadvervec\"}', NULL, '2024-05-14 04:27:12', '2024-05-14 04:27:12'),
('f967b19d-42e0-4c9d-9b59-663ffaed43e0', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 13, 1697351197, '{\"user_id\":1,\"name\":\"Tayyab\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Tomaswoola\"}', '2024-01-31 01:45:26', '2023-10-15 06:26:37', '2023-10-15 06:26:37'),
('f9a1af44-f8c1-48aa-9e0b-ca9dc67be7a9', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1715779752, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverveb\"}', NULL, '2024-05-15 13:29:12', '2024-05-15 13:29:12'),
('f9ae670e-aafd-4cee-b9e2-49fa0154681e', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 1, 1722953661, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from ThomasGraib\"}', NULL, '2024-08-06 14:14:21', '2024-08-06 14:14:21'),
('fad10299-4e12-4629-bd18-c94fe4e54f13', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1715761849, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadvervea\"}', NULL, '2024-05-15 08:30:49', '2024-05-15 08:30:49'),
('fbb3b591-2907-4d98-bebe-5e37669fa84f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 12, 1688493642, '{\"user_id\":1,\"name\":\"admin\",\"email\":\"irfan@gmail.com\",\"status\":\"3\",\"msg\":\"Bid On Auction# 6 by admin\"}', '2023-07-06 13:26:43', '2023-07-04 13:00:43', '2023-07-04 13:00:43'),
('fbec504e-2169-488f-a35b-8cda26d75a6b', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1716441194, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from jessicaadvervec\"}', NULL, '2024-05-23 05:13:14', '2024-05-23 05:13:14'),
('fca519d5-e367-4707-b960-9d9de3cf03b2', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1712262680, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-04 20:31:20', '2024-04-04 20:31:20'),
('fcf472f8-df15-4e51-b97a-4e1fbf432062', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1714995980, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jannes\"}', NULL, '2024-05-06 11:46:20', '2024-05-06 11:46:20'),
('fd158e06-73b2-49ee-8dee-12cd675c4c8d', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1701225292, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Stevencob\"}', '2024-01-31 01:44:24', '2023-11-29 02:34:52', '2023-11-29 02:34:52'),
('fd9bb4a4-4b89-4bf1-ba98-624b94417916', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 27, 1723149108, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Jerrypiene\"}', NULL, '2024-08-08 20:31:48', '2024-08-08 20:31:48'),
('fda6be70-b2fd-4f07-869d-a22d4582b4ee', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 17, 1717305424, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Ameliaadverve2\"}', NULL, '2024-06-02 05:17:04', '2024-06-02 05:17:04'),
('ff27260d-fa05-4084-bbac-446656e2cbdb', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 28, NULL, '{\"user_id\":28,\"name\":\"soft zone\",\"email\":\"softcellzone@gmail.com\",\"status\":\"2\",\"msg\":\"soft zone Your Order# 1693142939 status updated.\"}', '2023-09-30 08:00:22', '2023-08-27 08:29:49', '2023-08-27 08:29:49'),
('ffab01ff-bff1-4d0b-9ceb-672d4d338d18', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 36, 1713072882, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from Katyaadverve1\"}', NULL, '2024-04-14 05:34:42', '2024-04-14 05:34:42'),
('ffb123b8-a61b-4325-a563-e11ec6cb2b3f', 'App\\Notifications\\userAdminNotifcation', 'App\\Models\\User', 37, 1722457713, '{\"user_id\":1,\"name\":\"Hafiz Muhammad Tayyab Kilani\",\"email\":\"hafizmtayyab999@gmail.com\",\"status\":\"4\",\"msg\":\"Message from JeffreyVaw\"}', NULL, '2024-07-31 20:28:33', '2024-07-31 20:28:33');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `order_no` int DEFAULT NULL,
  `status_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_payment` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_no`, `status_id`, `shipping_cost`, `order_payment`, `payment_id`, `note`, `payment_method`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 37, 1706459099, '2', '500', 1005, NULL, '', 'cod', '2024-01-28 16:24:59', '2024-01-28 16:24:59', NULL),
(2, 31, 1706549266, '1', '0', 12, NULL, '', 'cod', '2024-01-29 17:27:46', '2024-01-29 17:27:46', NULL),
(3, 36, 1708079722, '2', '239', 1899, NULL, '', 'cod', '2024-02-16 10:35:22', '2024-02-16 10:35:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 5, 1, '2024-01-28 16:24:59', '2024-01-28 16:24:59', NULL),
(2, 1, 12, 1, '2024-01-28 16:24:59', '2024-01-28 16:24:59', NULL),
(3, 2, 10, 1, '2024-01-29 17:27:46', '2024-01-29 17:27:46', NULL),
(4, 3, 11, 1, '2024-02-16 10:35:22', '2024-02-16 10:35:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE IF NOT EXISTS `payment_methods` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(20, 'listing orders', 'web', '2023-06-17 05:17:09', '2023-06-17 05:17:09'),
(21, 'edit orders', 'web', '2023-06-17 05:17:26', '2023-06-17 05:17:26'),
(22, 'add orders', 'web', '2023-06-17 05:17:32', '2023-06-17 05:17:32'),
(23, 'delete orders', 'web', '2023-06-17 05:17:39', '2023-06-17 05:17:39'),
(24, 'delete order stauts', 'web', '2023-06-17 06:16:22', '2023-06-17 06:16:22'),
(25, 'delete order status', 'web', '2023-06-17 06:16:42', '2023-06-17 06:16:42'),
(26, 'edit order status', 'web', '2023-06-17 06:17:11', '2023-06-17 06:17:11'),
(27, 'add order status', 'web', '2023-06-17 06:17:25', '2023-06-17 06:17:25'),
(28, 'listing order status', 'web', '2023-06-17 06:17:34', '2023-06-17 06:17:34'),
(29, 'listing roles', 'web', '2023-06-18 10:36:07', '2023-06-18 10:36:07'),
(30, 'listing trash', 'web', '2023-06-18 10:42:02', '2023-06-18 10:42:02'),
(31, 'edit trash', 'web', '2023-06-18 10:42:14', '2023-06-18 10:42:14'),
(32, 'edit extras', 'web', '2023-06-18 10:45:01', '2023-06-18 10:45:01'),
(33, 'listing extras', 'web', '2023-06-18 10:48:28', '2023-06-18 10:48:28'),
(36, 'listing messages', 'web', '2023-06-25 05:42:52', '2023-06-25 05:42:52'),
(37, 'delete messages', 'web', '2023-06-25 05:43:01', '2023-06-25 05:43:01'),
(38, 'read messages', 'web', '2023-06-25 11:10:10', '2023-06-25 11:10:10'),
(39, 'listing shipping', 'web', '2023-06-28 02:35:15', '2023-06-28 02:35:15'),
(40, 'edit shipping', 'web', '2023-06-28 02:35:26', '2023-06-28 02:35:26'),
(41, 'add shipping', 'web', '2023-06-28 02:35:33', '2023-06-28 02:35:33'),
(42, 'delete shipping', 'web', '2023-06-28 02:35:45', '2023-06-28 02:35:45'),
(45, 'add settings', 'web', '2023-08-26 23:55:43', '2023-08-26 23:55:43'),
(46, 'listing settings', 'web', '2023-08-26 23:55:59', '2023-08-26 23:55:59'),
(47, 'edit settings', 'web', '2023-08-26 23:56:05', '2023-08-26 23:56:05'),
(48, 'edit banner', 'web', '2023-09-02 00:04:23', '2023-09-02 00:04:23'),
(49, 'add banner', 'web', '2023-09-02 00:39:16', '2023-09-02 00:39:16'),
(50, 'listing banner', 'web', '2023-09-02 00:39:25', '2023-09-02 00:39:25'),
(51, 'delete banner', 'web', '2023-09-02 00:39:31', '2023-09-02 00:39:31');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
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
  `weight` int NOT NULL DEFAULT '0',
  `order_count` int NOT NULL DEFAULT '0',
  `cart_count` int NOT NULL DEFAULT '0',
  `wishList_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `short_description`, `description`, `featured_image`, `prod_gallery`, `tags`, `category_id`, `sale_price`, `regular_price`, `shipping_id`, `sku`, `disp_order`, `is_visible`, `weight`, `order_count`, `cart_count`, `wishList_count`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Matching Khaddar', 'Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons', '<p>Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons</p>', '1_456551338_featured_image.png', NULL, NULL, 45, 1899, 3000, NULL, NULL, 1706945354, 1, 800, 10, 3, 2, '2023-06-03 03:01:50', '2024-07-06 05:23:12', NULL),
(2, 'Matching Khaddar 2 Piece Suit jant', 'Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons', '<p>Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons</p>', '2_226416673_featured_image.jpg', NULL, NULL, 45, 1899, 3000, NULL, NULL, 1706766873, 1, 800, 4, 4, 1, '2023-06-03 03:05:54', '2024-07-08 09:29:04', NULL),
(3, 'Matching Khaddar 2 Piece Suit jants', 'Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons', '<h4>Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons.</h4>', '3_2131460402_featured_image.jpg', NULL, NULL, 45, 1899, 3000, NULL, NULL, 1706767263, 1, 800, 2, 4, 3, '2023-06-03 03:24:54', '2024-07-06 05:23:22', NULL),
(4, 'Matching Khaddar 2 Piece Suit jants', 'Matching Khaddar 2 Piece Suit jants', '<ol>\r\n<li>one</li>\r\n<li>two</li>\r\n<li>three\r\n<table style=\"border-collapse: collapse; width: 100%; height: 89.5624px;\" border=\"1\"><colgroup><col style=\"width: 24.9756%;\"><col style=\"width: 24.9756%;\"><col style=\"width: 24.9756%;\"><col style=\"width: 24.9756%;\"></colgroup>\r\n<tbody>\r\n<tr style=\"height: 22.3906px;\">\r\n<td style=\"height: 22.3906px;\">1</td>\r\n<td style=\"height: 22.3906px;\">2</td>\r\n<td style=\"height: 22.3906px;\">3</td>\r\n<td style=\"height: 22.3906px;\">4</td>\r\n</tr>\r\n<tr style=\"height: 22.3906px;\">\r\n<td style=\"height: 22.3906px;\">row</td>\r\n<td style=\"height: 22.3906px;\"><strong>row1</strong></td>\r\n<td style=\"height: 22.3906px;\">row1</td>\r\n<td style=\"height: 22.3906px;\">row1</td>\r\n</tr>\r\n<tr style=\"height: 22.3906px;\">\r\n<td style=\"height: 22.3906px;\">row</td>\r\n<td style=\"height: 22.3906px;\">row1</td>\r\n<td style=\"height: 22.3906px;\"><strong>row1</strong></td>\r\n<td style=\"height: 22.3906px;\">row1</td>\r\n</tr>\r\n<tr style=\"height: 22.3906px;\">\r\n<td style=\"height: 22.3906px;\">row</td>\r\n<td style=\"height: 22.3906px;\"><em>row1</em></td>\r\n<td style=\"height: 22.3906px;\">row1</td>\r\n<td style=\"height: 22.3906px;\"><em>row1</em></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</li>\r\n</ol>\r\n<p>good one</p>\r\n<p>&nbsp;</p>', '4_160695095_featured_image.jpg', NULL, NULL, 46, 1899, 3000, NULL, NULL, 1706767657, 1, 0, 2, 1, 1, '2023-06-03 06:10:41', '2024-07-06 07:27:42', NULL),
(5, 'Matching Khaddar 2 Piece Suit jants', 'Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons', '<p>Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons</p>', '5_126349695_featured_image.jpg', NULL, NULL, 45, 1899, 3000, NULL, NULL, 1706767750, 1, 800, 3, 2, 0, '2023-06-04 03:15:48', '2024-02-01 06:10:26', NULL),
(6, 'q', 'w', '', NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, 1685866563, 1, 0, 0, 2, 0, '2023-06-04 03:16:03', '2023-09-02 12:10:20', '2023-09-02 12:10:20'),
(7, 'asas-update', 'wewq', '<p>aSAs</p>', '7_398892952_featured_image.jpeg', NULL, NULL, 17, 1212, 1233, NULL, NULL, 1690552966, 1, 0, 11, 1, 0, '2023-06-04 03:18:08', '2023-09-02 12:10:08', '2023-09-02 12:10:08'),
(8, 'Matching Khaddar 2 Piece Suit jant_No15', 'Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons', '<p>Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons</p>', '8_1309148796_featured_image.jpg', NULL, NULL, 45, 1899, 3000, NULL, NULL, 1706768027, 1, 800, 6, 0, 1, '2023-06-04 03:35:07', '2024-02-01 06:13:47', NULL),
(9, 'Matching Khaddar 2 Piece Suit jant_No19', 'Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons', '<p>Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons</p>', '9_1514774430_featured_image.jpg', NULL, NULL, 45, 1899, 3000, NULL, NULL, 1706768012, 1, 800, 2, 5, 3, '2023-06-10 14:09:09', '2024-07-05 06:48:31', NULL),
(10, 'Matching Khaddar 2 Piece Suit jant_No20', 'Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons', '<p>Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons</p>', '10_1570290646_featured_image.jpg', NULL, NULL, 45, 1899, 3000, NULL, NULL, 1706767990, 1, 800, 2, 3, 2, '2023-06-11 02:10:33', '2024-02-01 06:13:10', NULL),
(11, 'Matching Khaddar 2 Piece Suit jants', 'Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons', '<p>Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons</p>', '11_241471475_featured_image.png', NULL, NULL, 46, 1899, 3000, NULL, NULL, 1706969128, 1, 800, 1, 0, 0, '2023-07-28 09:09:37', '2024-02-16 10:35:22', NULL),
(12, 'Matching Khaddar 2 Piece Suit jant_No21', 'Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons', '<p>Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons</p>', '12_327264013_featured_image.jpg', NULL, NULL, 45, 1899, 3000, NULL, NULL, 1706767973, 1, 900, 1, 2, 1, '2023-09-14 11:19:33', '2024-07-05 06:45:09', NULL),
(13, 'testing live', 'Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons', '<p>Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons</p>', '13_280831955_featured_image.jpg', NULL, NULL, 45, 1899, 3000, NULL, NULL, 1706767955, 1, 800, 1, 1, 0, '2023-09-30 02:52:32', '2024-02-01 06:12:35', NULL),
(14, 'Matching Khaddar 2 Piece Suit jant_No23', 'Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons', '<p>Khaddar fabric is all-natural fabric with the most insulation and this is indeed the best fabric for winters and for all seasons</p>', '14_233124240_featured_image.jpg', NULL, NULL, 45, 1899, 3000, NULL, NULL, 1706767930, 1, 800, 0, 1, 1, '2024-01-29 16:49:33', '2024-02-01 06:12:10', NULL),
(15, 'Elit veniam commod', 'Fugiat quia mollit', '', '15_963167536_featured_image.jpg', NULL, NULL, 38, 10, 468, NULL, NULL, 1706808108, 1, 74, 0, 0, 0, '2024-02-01 17:21:48', '2024-02-01 17:21:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comapny` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `user_id`, `profile_image`, `phone`, `comapny`, `country`, `region`, `city`, `zip`, `address_line1`, `address_line2`, `created_at`, `updated_at`) VALUES
(1, '14', '14_1220852268profile_image.jpg', '03125241234', '', 'Pakistan', 'Punjab', 'Rajanpur', '51010', 'line 1', '', '2023-06-11 12:20:04', '2023-06-16 13:03:12'),
(2, '14', NULL, '03125241234', '', 'Pakistan', 'Punjab Province', 'Sialkot', '51010', '', '', '2023-06-11 12:20:19', '2023-06-11 12:20:19'),
(3, '13', '13_46398600profile_image.png', '03216103324', '', 'Pakistan', 'Punjab', 'Rasulnagar', '51010', 'dadsdf', '', '2023-06-16 12:09:38', '2023-06-18 11:55:44'),
(4, '1', '1_2072092503profile_image.png', '023', '', 'Pakistan', 'Punjab', 'Sialkot', '32', 'line 1', '', '2023-06-16 13:04:09', '2023-08-14 06:06:05'),
(6, '17', '17_850855980profile_image.png', 'sfd', '', 'Pakistan', 'Azad Kashmir', 'Kotli District', '223', 'dads', '', '2023-06-17 09:36:37', '2024-01-31 18:15:50'),
(12, '12', NULL, '32323', '', 'Bahrain', 'Southern Governorate', 'Ar Rifā‘', '23', 'ddf', '', '2023-07-06 13:36:36', '2023-07-09 02:19:25'),
(13, '30', NULL, '22323', '', 'Pakistan', 'Sindh', 'Daromehar', '323232', '23232', '', '2023-07-09 02:06:19', '2023-07-09 02:06:19'),
(14, '28', '28_551397037profile_image.png', '0333', '', 'Pakistan', 'Azad Kashmir', 'Kotli District', '51010', 'Daska new', 'Drawing room', '2023-07-28 11:57:45', '2023-09-30 07:59:04'),
(15, '37', '37_1363846478profile_image.png', '+1 (718) 798-7438', '', 'Pakistan', 'Islamabad Capital Territory', 'Islamabad', '30686', '366 East White New Court', 'Quis qui nisi facili', '2024-01-28 16:18:28', '2024-01-28 16:18:28'),
(16, '31', NULL, '+1 (232) 743-4858', '', 'Liechtenstein', 'Schaan', 'Schaan', '53916', '74 Green Oak Avenue', 'Earum quis magna Nam', '2024-01-29 17:27:41', '2024-01-29 17:27:41'),
(17, '36', NULL, '+1 (814) 331-9289', '', 'Pakistan', 'Punjab', 'Daira Din Panah', '76915', '713 Milton Court', 'Impedit vel aut eli', '2024-02-01 17:20:01', '2024-02-01 17:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
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
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(15, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(26, 2),
(27, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `site_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_tag_line` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy_policy` text COLLATE utf8mb4_unicode_ci,
  `send_mail` int NOT NULL DEFAULT '0',
  `items_per_page` int NOT NULL DEFAULT '10',
  `prod_per_page` int NOT NULL DEFAULT '12',
  `about_page` text COLLATE utf8mb4_unicode_ci,
  `meta_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_page` mediumtext COLLATE utf8mb4_unicode_ci,
  `register_page` mediumtext COLLATE utf8mb4_unicode_ci,
  `twitter_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_contact` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_title`, `site_tag_line`, `site_logo`, `privacy_policy`, `send_mail`, `items_per_page`, `prod_per_page`, `about_page`, `meta_desc`, `login_page`, `register_page`, `twitter_link`, `instagram_link`, `facebook_link`, `whatsapp_link`, `shop_address`, `shop_email`, `shop_contact`, `created_at`, `updated_at`) VALUES
(4, 'Hafiz Center', 'Fabrics store', '1696041606_site_logo.jpeg', '', 1, 15, 12, '<p>We hope you found all of the information on <strong>Hafiz Store</strong>&nbsp;helpful, as we love to share them with you.</p>\r\n<p><strong>Hafiz Store</strong> is a Professional eCommerce Platform. Here we will provide you only interesting content, which you will like very much. We\'re dedicated to providing you the best of eCommerce, with a focus on dependability and tech and electronics products . We\'re working to turn our passion for eCommerce into a booming online website. We hope you enjoy our eCommerce as much as we enjoy offering them to you.</p>\r\n<p>Welcome to <strong>Hafiz Store</strong>&nbsp;where we share information related to technolgy and . We\'re dedicated to providing you the very best information and knowledge of the above-mentioned topics.</p>\r\n<p>If you require any more information or have any questions about our site, please feel free to contact us by email at&nbsp;.</p>', 'we sell men and women unstitched stuff and also sell Islamic dressing and caps.', 'Unlock exclusive deals and manage your orders with ease. Log in now!\r\nYour account is safe with us. Enter your email and password to securely access your information.', 'Get ready for an amazing shopping experience! Explore our wide selection of products and discover your new favorites.\r\n\r\nUnlock exclusive deals, manage your orders with ease, and enjoy a faster checkout. Register now and start shopping!', '', '', 'https://www.facebook.com/profile.php?id=61553529001396&mibextid=zLoPMf', 'https://wa.me/+923286241653', 'test', 'info@hafizcenter.com', '+92 3286241653', '2023-08-26 23:53:30', '2024-02-03 14:11:34');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

DROP TABLE IF EXISTS `shippings`;
CREATE TABLE IF NOT EXISTS `shippings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` int NOT NULL,
  `is_active` int NOT NULL,
  `weight_from` int DEFAULT '0',
  `weight_to` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `country`, `region`, `cost`, `is_active`, `weight_from`, `weight_to`, `created_at`, `updated_at`) VALUES
(1, 'Pakistan', 'Punjab', 239, 1, 1, 1050, '2023-06-28 03:14:50', '2024-02-01 04:40:11'),
(5, 'Pakistan', 'Sindh', 239, 1, 1, 1050, '2023-08-26 11:29:05', '2024-02-01 04:39:58'),
(7, 'Pakistan', 'Azad Kashmir', 239, 1, 1, 1050, '2023-09-14 11:34:08', '2024-02-01 04:40:30'),
(8, 'Pakistan', 'Khyber Pakhtunkhwa', 239, 1, 1, 1050, '2023-09-15 12:19:34', '2024-02-01 04:41:38'),
(9, 'Pakistan', 'Federally Administered Tribal Areas', 239, 1, 1, 1050, '2024-01-28 16:23:25', '2024-02-01 04:41:24'),
(10, 'Pakistan', 'Gilgit-Baltistan', 239, 1, 1, 1050, '2024-02-01 04:41:55', '2024-02-01 04:41:55'),
(11, 'Pakistan', 'Balochistan', 239, 1, 1, 1050, '2024-02-01 04:42:30', '2024-02-01 04:42:30'),
(12, 'Pakistan', 'Islamabad Capital Territory', 239, 1, 1, 1050, '2024-02-01 04:43:29', '2024-02-01 04:43:29'),
(13, 'Pakistan', 'Islamabad Capital Territory', 400, 1, 1050, 2050, '2024-02-01 17:28:22', '2024-02-01 17:28:22'),
(14, 'Pakistan', 'Gilgit-Baltistan', 400, 1, 1050, 2050, '2024-02-01 17:28:51', '2024-02-01 17:28:51'),
(15, 'Pakistan', 'Azad Kashmir', 400, 1, 1050, 2050, '2024-02-01 17:29:20', '2024-02-01 17:29:20'),
(16, 'Pakistan', 'Khyber Pakhtunkhwa', 400, 1, 1050, 2050, '2024-02-01 17:29:56', '2024-02-01 17:29:56'),
(17, 'Pakistan', 'Federally Administered Tribal Areas', 400, 1, 1050, 2050, '2024-02-01 17:30:24', '2024-02-01 17:30:24'),
(18, 'Pakistan', 'Balochistan', 400, 1, 1050, 2050, '2024-02-01 17:30:44', '2024-02-01 17:30:44'),
(19, 'Pakistan', 'Sindh', 400, 1, 1050, 2050, '2024-02-01 17:31:08', '2024-02-01 17:31:08'),
(20, 'Pakistan', 'Punjab', 400, 1, 1050, 2050, '2024-02-01 17:31:23', '2024-02-01 17:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `value`, `message`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Pending', 'Proccessing: A message is a discrete unit of communication intended by the source for consumption by some recipient or group of recipients. A message may be delivered by various means, including courier,', 1, '2023-06-17 06:35:35', '2023-06-17 09:18:51'),
(2, 'Processing', 'Packing Phase: A message is a discrete unit of communication intended by the source for consumption by some recipient or group of recipients. A message may be delivered by various means, including courier,', 1, '2023-06-17 06:35:39', '2023-06-17 09:19:18'),
(3, 'Packing Phase', 'Ready to Ship: A message is a discrete unit of communication intended by the source for consumption by some recipient or group of recipients. A message may be delivered by various means, including courier,', 1, '2023-06-17 06:36:43', '2023-06-17 09:19:37'),
(4, 'Ready to Ship', 'Shipped: A message is a discrete unit of communication intended by the source for consumption by some recipient or group of recipients. A message may be delivered by various means, including courier,', 1, '2023-06-17 06:37:28', '2023-06-17 09:20:14'),
(5, 'Shipped', 'Deliverd: A message is a discrete unit of communication intended by the source for consumption by some recipient or group of recipients. A message may be delivered by various means, including courier,', 1, '2023-06-17 06:37:31', '2023-06-17 09:21:24'),
(6, 'Deliverd', 'Deliverd: A message is a discrete unit of communication intended by the source for consumption by some recipient or group of recipients. A message may be delivered by various means, including courier,', 1, '2023-06-17 06:37:31', '2023-06-17 09:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int NOT NULL DEFAULT '0',
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(7, 'ali', 4, 1, '2023-06-03 06:10:41', '2023-09-11 22:42:02', '2023-09-11 22:42:02'),
(8, 'one', 4, 1, '2023-06-03 06:10:41', '2023-09-11 22:42:02', '2023-09-11 22:42:02'),
(9, 'two', 4, 1, '2023-06-03 06:10:41', '2023-09-11 22:42:02', '2023-09-11 22:42:02'),
(10, 'three', 4, 1, '2023-06-03 06:10:41', '2023-09-11 22:42:02', '2023-09-11 22:42:02'),
(11, 'four', 4, 1, '2023-06-03 06:10:41', '2023-09-11 22:42:02', '2023-09-11 22:42:02'),
(12, 'five', 4, 1, '2023-06-03 06:10:41', '2023-09-11 22:42:02', '2023-09-11 22:42:02'),
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
(67, 'q', 3, 1, '2023-06-04 02:49:18', '2023-09-08 11:29:04', '2023-09-08 11:29:04'),
(68, 'w', 3, 1, '2023-06-04 02:49:18', '2023-09-08 11:29:04', '2023-09-08 11:29:04'),
(69, 'e', 3, 1, '2023-06-04 02:49:18', '2023-09-08 11:29:04', '2023-09-08 11:29:04'),
(70, 'r', 3, 1, '2023-06-04 02:49:18', '2023-09-08 11:29:04', '2023-09-08 11:29:04'),
(71, 't', 3, 1, '2023-06-04 02:49:18', '2023-09-08 11:29:04', '2023-09-08 11:29:04'),
(72, 'y', 3, 1, '2023-06-04 02:49:18', '2023-09-08 11:29:04', '2023-09-08 11:29:04'),
(73, 'u', 3, 1, '2023-06-04 02:49:18', '2023-09-08 11:29:04', '2023-09-08 11:29:04'),
(74, '12sd', 8, 1, '2023-06-04 03:35:07', '2023-06-21 12:35:12', '2023-06-21 12:35:12'),
(75, 'wewe', 8, 1, '2023-06-04 03:35:07', '2023-06-21 12:35:12', '2023-06-21 12:35:12'),
(76, 'we', 8, 1, '2023-06-04 03:35:07', '2023-06-21 12:35:12', '2023-06-21 12:35:12'),
(77, 'we', 8, 1, '2023-06-04 03:35:07', '2023-06-21 12:35:12', '2023-06-21 12:35:12'),
(78, 'we', 8, 1, '2023-06-04 03:35:07', '2023-06-21 12:35:12', '2023-06-21 12:35:12'),
(79, 'w', 8, 1, '2023-06-04 03:35:07', '2023-06-21 12:35:12', '2023-06-21 12:35:12'),
(80, 'e', 8, 1, '2023-06-04 03:35:07', '2023-06-21 12:35:12', '2023-06-21 12:35:12'),
(81, 'qeqq', 7, 1, '2023-06-04 03:36:08', '2023-07-28 09:02:46', '2023-07-28 09:02:46'),
(82, 'qwew', 7, 1, '2023-06-04 03:36:08', '2023-07-28 09:02:46', '2023-07-28 09:02:46'),
(83, 'wqeqwe', 7, 1, '2023-06-04 03:36:08', '2023-07-28 09:02:46', '2023-07-28 09:02:46'),
(84, 'wqqe', 7, 1, '2023-06-04 03:36:08', '2023-07-28 09:02:46', '2023-07-28 09:02:46'),
(85, 'tag1', 9, 1, '2023-06-10 14:09:09', '2023-06-21 12:34:21', '2023-06-21 12:34:21'),
(86, 'tag2', 9, 1, '2023-06-10 14:09:09', '2023-06-21 12:34:21', '2023-06-21 12:34:21'),
(87, 'tag3', 9, 1, '2023-06-10 14:09:09', '2023-06-21 12:34:21', '2023-06-21 12:34:21'),
(88, 'tag4', 9, 1, '2023-06-10 14:09:09', '2023-06-21 12:34:21', '2023-06-21 12:34:21'),
(89, 'tag5', 9, 1, '2023-06-10 14:09:09', '2023-06-21 12:34:21', '2023-06-21 12:34:21'),
(90, 'qwe', 10, 1, '2023-06-11 02:10:33', '2023-09-08 11:28:15', '2023-09-08 11:28:15'),
(91, 'qwe', 10, 1, '2023-06-11 02:10:33', '2023-09-08 11:28:15', '2023-09-08 11:28:15'),
(92, 'qwe', 10, 1, '2023-06-11 02:10:33', '2023-09-08 11:28:15', '2023-09-08 11:28:15'),
(93, 'qwe', 10, 1, '2023-06-11 02:10:33', '2023-09-08 11:28:15', '2023-09-08 11:28:15'),
(94, 'tag1', 9, 1, '2023-06-21 12:34:21', '2023-09-09 10:23:50', '2023-09-09 10:23:50'),
(95, 'tag2', 9, 1, '2023-06-21 12:34:21', '2023-09-09 10:23:50', '2023-09-09 10:23:50'),
(96, 'tag3', 9, 1, '2023-06-21 12:34:21', '2023-09-09 10:23:50', '2023-09-09 10:23:50'),
(97, 'tag4', 9, 1, '2023-06-21 12:34:21', '2023-09-09 10:23:50', '2023-09-09 10:23:50'),
(98, 'tag5', 9, 1, '2023-06-21 12:34:21', '2023-09-09 10:23:50', '2023-09-09 10:23:50'),
(99, '12sd', 8, 1, '2023-06-21 12:35:12', '2024-01-31 16:06:07', '2024-01-31 16:06:07'),
(100, 'wewe', 8, 1, '2023-06-21 12:35:12', '2024-01-31 16:06:07', '2024-01-31 16:06:07'),
(101, 'we', 8, 1, '2023-06-21 12:35:12', '2024-01-31 16:06:07', '2024-01-31 16:06:07'),
(102, 'we', 8, 1, '2023-06-21 12:35:12', '2024-01-31 16:06:07', '2024-01-31 16:06:07'),
(103, 'we', 8, 1, '2023-06-21 12:35:12', '2024-01-31 16:06:07', '2024-01-31 16:06:07'),
(104, 'w', 8, 1, '2023-06-21 12:35:12', '2024-01-31 16:06:07', '2024-01-31 16:06:07'),
(105, 'e', 8, 1, '2023-06-21 12:35:12', '2024-01-31 16:06:07', '2024-01-31 16:06:07'),
(106, 'qeqq', 7, 1, '2023-07-28 09:02:46', '2023-07-28 09:02:46', NULL),
(107, 'qwew', 7, 1, '2023-07-28 09:02:46', '2023-07-28 09:02:46', NULL),
(108, 'wqeqwe', 7, 1, '2023-07-28 09:02:46', '2023-07-28 09:02:46', NULL),
(109, 'wqqe', 7, 1, '2023-07-28 09:02:46', '2023-07-28 09:02:46', NULL),
(110, 'abc', 11, 1, '2023-07-28 09:09:37', '2023-07-28 09:10:19', '2023-07-28 09:10:19'),
(111, 'xyz', 11, 1, '2023-07-28 09:09:37', '2023-07-28 09:10:19', '2023-07-28 09:10:19'),
(112, 'abc', 11, 1, '2023-07-28 09:10:19', '2023-07-28 11:38:41', '2023-07-28 11:38:41'),
(113, 'xyz', 11, 1, '2023-07-28 09:10:19', '2023-07-28 11:38:41', '2023-07-28 11:38:41'),
(114, 'abc', 11, 1, '2023-07-28 11:38:41', '2023-07-28 11:39:01', '2023-07-28 11:39:01'),
(115, 'xyz', 11, 1, '2023-07-28 11:38:41', '2023-07-28 11:39:01', '2023-07-28 11:39:01'),
(116, 'abc', 11, 1, '2023-07-28 11:39:01', '2024-01-31 16:10:28', '2024-01-31 16:10:28'),
(117, 'xyz', 11, 1, '2023-07-28 11:39:01', '2024-01-31 16:10:28', '2024-01-31 16:10:28'),
(118, 'qwe', 10, 1, '2023-09-08 11:28:15', '2024-01-31 16:09:24', '2024-01-31 16:09:24'),
(119, 'qwe', 10, 1, '2023-09-08 11:28:15', '2024-01-31 16:09:24', '2024-01-31 16:09:24'),
(120, 'qwe', 10, 1, '2023-09-08 11:28:15', '2024-01-31 16:09:24', '2024-01-31 16:09:24'),
(121, 'qwe', 10, 1, '2023-09-08 11:28:15', '2024-01-31 16:09:24', '2024-01-31 16:09:24'),
(122, 'q', 3, 1, '2023-09-08 11:29:04', '2023-09-08 11:30:15', '2023-09-08 11:30:15'),
(123, 'w', 3, 1, '2023-09-08 11:29:04', '2023-09-08 11:30:15', '2023-09-08 11:30:15'),
(124, 'e', 3, 1, '2023-09-08 11:29:04', '2023-09-08 11:30:15', '2023-09-08 11:30:15'),
(125, 'r', 3, 1, '2023-09-08 11:29:04', '2023-09-08 11:30:15', '2023-09-08 11:30:15'),
(126, 't', 3, 1, '2023-09-08 11:29:04', '2023-09-08 11:30:15', '2023-09-08 11:30:15'),
(127, 'y', 3, 1, '2023-09-08 11:29:04', '2023-09-08 11:30:15', '2023-09-08 11:30:15'),
(128, 'u', 3, 1, '2023-09-08 11:29:04', '2023-09-08 11:30:15', '2023-09-08 11:30:15'),
(129, 'q', 3, 1, '2023-09-08 11:30:15', '2023-09-11 21:36:02', '2023-09-11 21:36:02'),
(130, 'w', 3, 1, '2023-09-08 11:30:15', '2023-09-11 21:36:02', '2023-09-11 21:36:02'),
(131, 'e', 3, 1, '2023-09-08 11:30:15', '2023-09-11 21:36:02', '2023-09-11 21:36:02'),
(132, 'r', 3, 1, '2023-09-08 11:30:15', '2023-09-11 21:36:02', '2023-09-11 21:36:02'),
(133, 't', 3, 1, '2023-09-08 11:30:15', '2023-09-11 21:36:02', '2023-09-11 21:36:02'),
(134, 'y', 3, 1, '2023-09-08 11:30:15', '2023-09-11 21:36:02', '2023-09-11 21:36:02'),
(135, 'u', 3, 1, '2023-09-08 11:30:15', '2023-09-11 21:36:02', '2023-09-11 21:36:02'),
(136, 'tag1', 9, 1, '2023-09-09 10:23:50', '2023-09-09 10:26:17', '2023-09-09 10:26:17'),
(137, 'tag2', 9, 1, '2023-09-09 10:23:50', '2023-09-09 10:26:17', '2023-09-09 10:26:17'),
(138, 'tag3', 9, 1, '2023-09-09 10:23:50', '2023-09-09 10:26:17', '2023-09-09 10:26:17'),
(139, 'tag4', 9, 1, '2023-09-09 10:23:50', '2023-09-09 10:26:17', '2023-09-09 10:26:17'),
(140, 'tag5', 9, 1, '2023-09-09 10:23:50', '2023-09-09 10:26:17', '2023-09-09 10:26:17'),
(141, 'tag1', 9, 1, '2023-09-09 10:26:17', '2024-01-31 16:07:21', '2024-01-31 16:07:21'),
(142, 'tag2', 9, 1, '2023-09-09 10:26:17', '2024-01-31 16:07:21', '2024-01-31 16:07:21'),
(143, 'tag3', 9, 1, '2023-09-09 10:26:17', '2024-01-31 16:07:21', '2024-01-31 16:07:21'),
(144, 'tag4', 9, 1, '2023-09-09 10:26:17', '2024-01-31 16:07:21', '2024-01-31 16:07:21'),
(145, 'tag5', 9, 1, '2023-09-09 10:26:17', '2024-01-31 16:07:21', '2024-01-31 16:07:21'),
(146, 'q', 3, 1, '2023-09-11 21:36:02', '2023-09-14 12:38:25', '2023-09-14 12:38:25'),
(147, 'w', 3, 1, '2023-09-11 21:36:02', '2023-09-14 12:38:25', '2023-09-14 12:38:25'),
(148, 'e', 3, 1, '2023-09-11 21:36:02', '2023-09-14 12:38:25', '2023-09-14 12:38:25'),
(149, 'r', 3, 1, '2023-09-11 21:36:02', '2023-09-14 12:38:25', '2023-09-14 12:38:25'),
(150, 't', 3, 1, '2023-09-11 21:36:02', '2023-09-14 12:38:25', '2023-09-14 12:38:25'),
(151, 'y', 3, 1, '2023-09-11 21:36:02', '2023-09-14 12:38:25', '2023-09-14 12:38:25'),
(152, 'u', 3, 1, '2023-09-11 21:36:02', '2023-09-14 12:38:25', '2023-09-14 12:38:25'),
(153, 'ali', 4, 1, '2023-09-11 22:42:02', '2023-09-11 22:46:32', '2023-09-11 22:46:32'),
(154, 'one', 4, 1, '2023-09-11 22:42:02', '2023-09-11 22:46:32', '2023-09-11 22:46:32'),
(155, 'two', 4, 1, '2023-09-11 22:42:02', '2023-09-11 22:46:32', '2023-09-11 22:46:32'),
(156, 'three', 4, 1, '2023-09-11 22:42:02', '2023-09-11 22:46:32', '2023-09-11 22:46:32'),
(157, 'four', 4, 1, '2023-09-11 22:42:02', '2023-09-11 22:46:32', '2023-09-11 22:46:32'),
(158, 'five', 4, 1, '2023-09-11 22:42:02', '2023-09-11 22:46:32', '2023-09-11 22:46:32'),
(159, 'ali', 4, 1, '2023-09-11 22:46:32', '2024-01-29 17:05:07', '2024-01-29 17:05:07'),
(160, 'one', 4, 1, '2023-09-11 22:46:32', '2024-01-29 17:05:07', '2024-01-29 17:05:07'),
(161, 'two', 4, 1, '2023-09-11 22:46:32', '2024-01-29 17:05:07', '2024-01-29 17:05:07'),
(162, 'three', 4, 1, '2023-09-11 22:46:32', '2024-01-29 17:05:07', '2024-01-29 17:05:07'),
(163, 'four', 4, 1, '2023-09-11 22:46:32', '2024-01-29 17:05:07', '2024-01-29 17:05:07'),
(164, 'five', 4, 1, '2023-09-11 22:46:32', '2024-01-29 17:05:07', '2024-01-29 17:05:07'),
(165, 'qwety', 12, 1, '2023-09-14 11:19:33', '2024-01-31 16:11:07', '2024-01-31 16:11:07'),
(166, 'qwer', 12, 1, '2023-09-14 11:19:33', '2024-01-31 16:11:07', '2024-01-31 16:11:07'),
(167, 'q', 3, 1, '2023-09-14 12:38:25', '2024-01-31 15:58:52', '2024-01-31 15:58:52'),
(168, 'w', 3, 1, '2023-09-14 12:38:25', '2024-01-31 15:58:52', '2024-01-31 15:58:52'),
(169, 'e', 3, 1, '2023-09-14 12:38:25', '2024-01-31 15:58:52', '2024-01-31 15:58:52'),
(170, 'r', 3, 1, '2023-09-14 12:38:25', '2024-01-31 15:58:52', '2024-01-31 15:58:52'),
(171, 't', 3, 1, '2023-09-14 12:38:25', '2024-01-31 15:58:52', '2024-01-31 15:58:52'),
(172, 'y', 3, 1, '2023-09-14 12:38:25', '2024-01-31 15:58:52', '2024-01-31 15:58:52'),
(173, 'u', 3, 1, '2023-09-14 12:38:25', '2024-01-31 15:58:52', '2024-01-31 15:58:52'),
(174, 'best suit', 14, 1, '2024-01-29 16:49:33', '2024-01-30 08:04:26', '2024-01-30 08:04:26'),
(175, 'lawan suit', 14, 1, '2024-01-29 16:49:33', '2024-01-30 08:04:26', '2024-01-30 08:04:26'),
(176, 'abs', 14, 1, '2024-01-29 16:49:33', '2024-01-30 08:04:26', '2024-01-30 08:04:26'),
(177, 'ali', 4, 1, '2024-01-29 17:05:07', '2024-01-31 15:53:35', '2024-01-31 15:53:35'),
(178, 'one', 4, 1, '2024-01-29 17:05:07', '2024-01-31 15:53:35', '2024-01-31 15:53:35'),
(179, 'two', 4, 1, '2024-01-29 17:05:07', '2024-01-31 15:53:35', '2024-01-31 15:53:35'),
(180, 'three', 4, 1, '2024-01-29 17:05:07', '2024-01-31 15:53:35', '2024-01-31 15:53:35'),
(181, 'four', 4, 1, '2024-01-29 17:05:07', '2024-01-31 15:53:35', '2024-01-31 15:53:35'),
(182, 'five', 4, 1, '2024-01-29 17:05:07', '2024-01-31 15:53:35', '2024-01-31 15:53:35'),
(183, 'best suit', 14, 1, '2024-01-30 08:04:26', '2024-01-31 06:20:40', '2024-01-31 06:20:40'),
(184, 'lawan suit', 14, 1, '2024-01-30 08:04:26', '2024-01-31 06:20:40', '2024-01-31 06:20:40'),
(185, 'abs', 14, 1, '2024-01-30 08:04:26', '2024-01-31 06:20:40', '2024-01-31 06:20:40'),
(186, 'best suit', 14, 1, '2024-01-31 06:20:40', '2024-01-31 06:20:41', '2024-01-31 06:20:41'),
(187, 'lawan suit', 14, 1, '2024-01-31 06:20:40', '2024-01-31 06:20:41', '2024-01-31 06:20:41'),
(188, 'abs', 14, 1, '2024-01-31 06:20:40', '2024-01-31 06:20:41', '2024-01-31 06:20:41'),
(189, 'best suit', 14, 1, '2024-01-31 06:20:41', '2024-01-31 17:27:40', '2024-01-31 17:27:40'),
(190, 'lawan suit', 14, 1, '2024-01-31 06:20:41', '2024-01-31 17:27:40', '2024-01-31 17:27:40'),
(191, 'abs', 14, 1, '2024-01-31 06:20:41', '2024-01-31 17:27:40', '2024-01-31 17:27:40'),
(192, 'ali', 4, 1, '2024-01-31 15:53:35', '2024-01-31 16:21:16', '2024-01-31 16:21:16'),
(193, 'one', 4, 1, '2024-01-31 15:53:35', '2024-01-31 16:21:16', '2024-01-31 16:21:16'),
(194, 'two', 4, 1, '2024-01-31 15:53:35', '2024-01-31 16:21:16', '2024-01-31 16:21:16'),
(195, 'three', 4, 1, '2024-01-31 15:53:35', '2024-01-31 16:21:16', '2024-01-31 16:21:16'),
(196, 'four', 4, 1, '2024-01-31 15:53:35', '2024-01-31 16:21:16', '2024-01-31 16:21:16'),
(197, 'five', 4, 1, '2024-01-31 15:53:35', '2024-01-31 16:21:16', '2024-01-31 16:21:16'),
(198, 'q', 3, 1, '2024-01-31 15:58:52', '2024-01-31 16:38:49', '2024-01-31 16:38:49'),
(199, 'w', 3, 1, '2024-01-31 15:58:52', '2024-01-31 16:38:49', '2024-01-31 16:38:49'),
(200, 'e', 3, 1, '2024-01-31 15:58:52', '2024-01-31 16:38:49', '2024-01-31 16:38:49'),
(201, 'r', 3, 1, '2024-01-31 15:58:52', '2024-01-31 16:38:49', '2024-01-31 16:38:49'),
(202, 't', 3, 1, '2024-01-31 15:58:52', '2024-01-31 16:38:49', '2024-01-31 16:38:49'),
(203, 'y', 3, 1, '2024-01-31 15:58:52', '2024-01-31 16:38:49', '2024-01-31 16:38:49'),
(204, 'u', 3, 1, '2024-01-31 15:58:52', '2024-01-31 16:38:49', '2024-01-31 16:38:49'),
(205, '12sd', 8, 1, '2024-01-31 16:06:07', '2024-01-31 16:31:47', '2024-01-31 16:31:47'),
(206, 'wewe', 8, 1, '2024-01-31 16:06:07', '2024-01-31 16:31:47', '2024-01-31 16:31:47'),
(207, 'we', 8, 1, '2024-01-31 16:06:07', '2024-01-31 16:31:47', '2024-01-31 16:31:47'),
(208, 'we', 8, 1, '2024-01-31 16:06:07', '2024-01-31 16:31:47', '2024-01-31 16:31:47'),
(209, 'we', 8, 1, '2024-01-31 16:06:07', '2024-01-31 16:31:47', '2024-01-31 16:31:47'),
(210, 'w', 8, 1, '2024-01-31 16:06:07', '2024-01-31 16:31:47', '2024-01-31 16:31:47'),
(211, 'e', 8, 1, '2024-01-31 16:06:07', '2024-01-31 16:31:47', '2024-01-31 16:31:47'),
(212, 'tag1', 9, 1, '2024-01-31 16:07:21', '2024-01-31 16:26:10', '2024-01-31 16:26:10'),
(213, 'tag2', 9, 1, '2024-01-31 16:07:21', '2024-01-31 16:26:10', '2024-01-31 16:26:10'),
(214, 'tag3', 9, 1, '2024-01-31 16:07:21', '2024-01-31 16:26:10', '2024-01-31 16:26:10'),
(215, 'tag4', 9, 1, '2024-01-31 16:07:21', '2024-01-31 16:26:10', '2024-01-31 16:26:10'),
(216, 'tag5', 9, 1, '2024-01-31 16:07:21', '2024-01-31 16:26:10', '2024-01-31 16:26:10'),
(217, 'qwe', 10, 1, '2024-01-31 16:09:24', '2024-01-31 16:25:53', '2024-01-31 16:25:53'),
(218, 'qwe', 10, 1, '2024-01-31 16:09:24', '2024-01-31 16:25:53', '2024-01-31 16:25:53'),
(219, 'qwe', 10, 1, '2024-01-31 16:09:24', '2024-01-31 16:25:53', '2024-01-31 16:25:53'),
(220, 'qwe', 10, 1, '2024-01-31 16:09:24', '2024-01-31 16:25:53', '2024-01-31 16:25:53'),
(221, 'abc', 11, 1, '2024-01-31 16:10:28', '2024-01-31 16:22:02', '2024-01-31 16:22:02'),
(222, 'xyz', 11, 1, '2024-01-31 16:10:28', '2024-01-31 16:22:02', '2024-01-31 16:22:02'),
(223, 'qwety', 12, 1, '2024-01-31 16:11:07', '2024-01-31 16:11:22', '2024-01-31 16:11:22'),
(224, 'qwer', 12, 1, '2024-01-31 16:11:07', '2024-01-31 16:11:22', '2024-01-31 16:11:22'),
(225, 'qwety', 12, 1, '2024-01-31 16:11:22', '2024-01-31 16:19:42', '2024-01-31 16:19:42'),
(226, 'qwer', 12, 1, '2024-01-31 16:11:22', '2024-01-31 16:19:42', '2024-01-31 16:19:42'),
(227, 'qwety', 12, 1, '2024-01-31 16:19:42', '2024-01-31 17:27:24', '2024-01-31 17:27:24'),
(228, 'qwer', 12, 1, '2024-01-31 16:19:42', '2024-01-31 17:27:24', '2024-01-31 17:27:24'),
(229, 'ali', 4, 1, '2024-01-31 16:21:16', '2024-02-01 06:07:37', '2024-02-01 06:07:37'),
(230, 'one', 4, 1, '2024-01-31 16:21:16', '2024-02-01 06:07:37', '2024-02-01 06:07:37'),
(231, 'two', 4, 1, '2024-01-31 16:21:16', '2024-02-01 06:07:37', '2024-02-01 06:07:37'),
(232, 'three', 4, 1, '2024-01-31 16:21:16', '2024-02-01 06:07:37', '2024-02-01 06:07:37'),
(233, 'four', 4, 1, '2024-01-31 16:21:16', '2024-02-01 06:07:37', '2024-02-01 06:07:37'),
(234, 'five', 4, 1, '2024-01-31 16:21:16', '2024-02-01 06:07:37', '2024-02-01 06:07:37'),
(235, 'abc', 11, 1, '2024-01-31 16:22:02', '2024-01-31 18:02:47', '2024-01-31 18:02:47'),
(236, 'xyz', 11, 1, '2024-01-31 16:22:02', '2024-01-31 18:02:47', '2024-01-31 18:02:47'),
(237, 'qwe', 10, 1, '2024-01-31 16:25:53', '2024-01-31 17:27:19', '2024-01-31 17:27:19'),
(238, 'qwe', 10, 1, '2024-01-31 16:25:53', '2024-01-31 17:27:19', '2024-01-31 17:27:19'),
(239, 'qwe', 10, 1, '2024-01-31 16:25:53', '2024-01-31 17:27:19', '2024-01-31 17:27:19'),
(240, 'qwe', 10, 1, '2024-01-31 16:25:53', '2024-01-31 17:27:19', '2024-01-31 17:27:19'),
(241, 'tag1', 9, 1, '2024-01-31 16:26:10', '2024-01-31 16:28:59', '2024-01-31 16:28:59'),
(242, 'tag2', 9, 1, '2024-01-31 16:26:10', '2024-01-31 16:28:59', '2024-01-31 16:28:59'),
(243, 'tag3', 9, 1, '2024-01-31 16:26:10', '2024-01-31 16:28:59', '2024-01-31 16:28:59'),
(244, 'tag4', 9, 1, '2024-01-31 16:26:10', '2024-01-31 16:28:59', '2024-01-31 16:28:59'),
(245, 'tag5', 9, 1, '2024-01-31 16:26:10', '2024-01-31 16:28:59', '2024-01-31 16:28:59'),
(246, 'tag1', 9, 1, '2024-01-31 16:28:59', '2024-01-31 17:27:14', '2024-01-31 17:27:14'),
(247, 'tag2', 9, 1, '2024-01-31 16:28:59', '2024-01-31 17:27:14', '2024-01-31 17:27:14'),
(248, 'tag3', 9, 1, '2024-01-31 16:28:59', '2024-01-31 17:27:14', '2024-01-31 17:27:14'),
(249, 'tag4', 9, 1, '2024-01-31 16:28:59', '2024-01-31 17:27:14', '2024-01-31 17:27:14'),
(250, 'tag5', 9, 1, '2024-01-31 16:28:59', '2024-01-31 17:27:14', '2024-01-31 17:27:14'),
(251, '12sd', 8, 1, '2024-01-31 16:31:47', '2024-01-31 16:40:42', '2024-01-31 16:40:42'),
(252, 'wewe', 8, 1, '2024-01-31 16:31:47', '2024-01-31 16:40:42', '2024-01-31 16:40:42'),
(253, 'we', 8, 1, '2024-01-31 16:31:47', '2024-01-31 16:40:42', '2024-01-31 16:40:42'),
(254, 'we', 8, 1, '2024-01-31 16:31:47', '2024-01-31 16:40:42', '2024-01-31 16:40:42'),
(255, 'we', 8, 1, '2024-01-31 16:31:47', '2024-01-31 16:40:42', '2024-01-31 16:40:42'),
(256, 'w', 8, 1, '2024-01-31 16:31:47', '2024-01-31 16:40:42', '2024-01-31 16:40:42'),
(257, 'e', 8, 1, '2024-01-31 16:31:47', '2024-01-31 16:40:42', '2024-01-31 16:40:42'),
(258, 'q', 3, 1, '2024-01-31 16:38:49', '2024-01-31 16:38:53', '2024-01-31 16:38:53'),
(259, 'w', 3, 1, '2024-01-31 16:38:49', '2024-01-31 16:38:53', '2024-01-31 16:38:53'),
(260, 'e', 3, 1, '2024-01-31 16:38:49', '2024-01-31 16:38:53', '2024-01-31 16:38:53'),
(261, 'r', 3, 1, '2024-01-31 16:38:49', '2024-01-31 16:38:53', '2024-01-31 16:38:53'),
(262, 't', 3, 1, '2024-01-31 16:38:49', '2024-01-31 16:38:53', '2024-01-31 16:38:53'),
(263, 'y', 3, 1, '2024-01-31 16:38:49', '2024-01-31 16:38:53', '2024-01-31 16:38:53'),
(264, 'u', 3, 1, '2024-01-31 16:38:49', '2024-01-31 16:38:53', '2024-01-31 16:38:53'),
(265, 'q', 3, 1, '2024-01-31 16:38:53', '2024-01-31 17:20:08', '2024-01-31 17:20:08'),
(266, 'w', 3, 1, '2024-01-31 16:38:53', '2024-01-31 17:20:08', '2024-01-31 17:20:08'),
(267, 'e', 3, 1, '2024-01-31 16:38:53', '2024-01-31 17:20:08', '2024-01-31 17:20:08'),
(268, 'r', 3, 1, '2024-01-31 16:38:53', '2024-01-31 17:20:08', '2024-01-31 17:20:08'),
(269, 't', 3, 1, '2024-01-31 16:38:53', '2024-01-31 17:20:08', '2024-01-31 17:20:08'),
(270, 'y', 3, 1, '2024-01-31 16:38:53', '2024-01-31 17:20:08', '2024-01-31 17:20:08'),
(271, 'u', 3, 1, '2024-01-31 16:38:53', '2024-01-31 17:20:08', '2024-01-31 17:20:08'),
(272, '12sd', 8, 1, '2024-01-31 16:40:42', '2024-01-31 17:26:55', '2024-01-31 17:26:55'),
(273, 'wewe', 8, 1, '2024-01-31 16:40:42', '2024-01-31 17:26:55', '2024-01-31 17:26:55'),
(274, 'we', 8, 1, '2024-01-31 16:40:42', '2024-01-31 17:26:55', '2024-01-31 17:26:55'),
(275, 'we', 8, 1, '2024-01-31 16:40:42', '2024-01-31 17:26:55', '2024-01-31 17:26:55'),
(276, 'we', 8, 1, '2024-01-31 16:40:42', '2024-01-31 17:26:55', '2024-01-31 17:26:55'),
(277, 'w', 8, 1, '2024-01-31 16:40:42', '2024-01-31 17:26:55', '2024-01-31 17:26:55'),
(278, 'e', 8, 1, '2024-01-31 16:40:42', '2024-01-31 17:26:55', '2024-01-31 17:26:55'),
(279, 'q', 3, 1, '2024-01-31 17:20:08', '2024-01-31 17:29:56', '2024-01-31 17:29:56'),
(280, 'w', 3, 1, '2024-01-31 17:20:08', '2024-01-31 17:29:56', '2024-01-31 17:29:56'),
(281, 'e', 3, 1, '2024-01-31 17:20:08', '2024-01-31 17:29:56', '2024-01-31 17:29:56'),
(282, 'r', 3, 1, '2024-01-31 17:20:08', '2024-01-31 17:29:56', '2024-01-31 17:29:56'),
(283, 't', 3, 1, '2024-01-31 17:20:08', '2024-01-31 17:29:56', '2024-01-31 17:29:56'),
(284, 'y', 3, 1, '2024-01-31 17:20:08', '2024-01-31 17:29:56', '2024-01-31 17:29:56'),
(285, 'u', 3, 1, '2024-01-31 17:20:08', '2024-01-31 17:29:56', '2024-01-31 17:29:56'),
(286, 'khaddar', 8, 1, '2024-01-31 17:26:55', '2024-02-01 06:13:47', '2024-02-01 06:13:47'),
(287, 'best quality', 8, 1, '2024-01-31 17:26:55', '2024-02-01 06:13:47', '2024-02-01 06:13:47'),
(288, 'suit', 8, 1, '2024-01-31 17:26:55', '2024-02-01 06:13:47', '2024-02-01 06:13:47'),
(289, 'mens wear', 8, 1, '2024-01-31 17:26:55', '2024-02-01 06:13:47', '2024-02-01 06:13:47'),
(290, 'khaddar', 2, 1, '2024-01-31 17:27:01', '2024-02-01 05:54:33', '2024-02-01 05:54:33'),
(291, 'best quality', 2, 1, '2024-01-31 17:27:01', '2024-02-01 05:54:33', '2024-02-01 05:54:33'),
(292, 'suit', 2, 1, '2024-01-31 17:27:01', '2024-02-01 05:54:33', '2024-02-01 05:54:33'),
(293, 'mens wear', 2, 1, '2024-01-31 17:27:01', '2024-02-01 05:54:33', '2024-02-01 05:54:33'),
(294, 'khaddar', 1, 1, '2024-01-31 17:27:06', '2024-02-01 05:12:34', '2024-02-01 05:12:34'),
(295, 'best quality', 1, 1, '2024-01-31 17:27:06', '2024-02-01 05:12:34', '2024-02-01 05:12:34'),
(296, 'suit', 1, 1, '2024-01-31 17:27:06', '2024-02-01 05:12:34', '2024-02-01 05:12:34'),
(297, 'mens wear', 1, 1, '2024-01-31 17:27:06', '2024-02-01 05:12:34', '2024-02-01 05:12:34'),
(298, 'khaddar', 9, 1, '2024-01-31 17:27:14', '2024-02-01 06:13:32', '2024-02-01 06:13:32'),
(299, 'best quality', 9, 1, '2024-01-31 17:27:14', '2024-02-01 06:13:32', '2024-02-01 06:13:32'),
(300, 'suit', 9, 1, '2024-01-31 17:27:14', '2024-02-01 06:13:32', '2024-02-01 06:13:32'),
(301, 'mens wear', 9, 1, '2024-01-31 17:27:14', '2024-02-01 06:13:32', '2024-02-01 06:13:32'),
(302, 'khaddar', 10, 1, '2024-01-31 17:27:19', '2024-02-01 06:13:10', '2024-02-01 06:13:10'),
(303, 'best quality', 10, 1, '2024-01-31 17:27:19', '2024-02-01 06:13:10', '2024-02-01 06:13:10'),
(304, 'suit', 10, 1, '2024-01-31 17:27:19', '2024-02-01 06:13:10', '2024-02-01 06:13:10'),
(305, 'mens wear', 10, 1, '2024-01-31 17:27:19', '2024-02-01 06:13:10', '2024-02-01 06:13:10'),
(306, 'khaddar', 12, 1, '2024-01-31 17:27:24', '2024-02-01 06:12:53', '2024-02-01 06:12:53'),
(307, 'best quality', 12, 1, '2024-01-31 17:27:24', '2024-02-01 06:12:53', '2024-02-01 06:12:53'),
(308, 'suit', 12, 1, '2024-01-31 17:27:24', '2024-02-01 06:12:53', '2024-02-01 06:12:53'),
(309, 'mens wear', 12, 1, '2024-01-31 17:27:24', '2024-02-01 06:12:53', '2024-02-01 06:12:53'),
(310, 'khaddar', 5, 1, '2024-01-31 17:27:29', '2024-02-01 06:04:22', '2024-02-01 06:04:22'),
(311, 'best quality', 5, 1, '2024-01-31 17:27:29', '2024-02-01 06:04:22', '2024-02-01 06:04:22'),
(312, 'suit', 5, 1, '2024-01-31 17:27:29', '2024-02-01 06:04:22', '2024-02-01 06:04:22'),
(313, 'mens wear', 5, 1, '2024-01-31 17:27:29', '2024-02-01 06:04:22', '2024-02-01 06:04:22'),
(314, 'khaddar', 13, 1, '2024-01-31 17:27:35', '2024-02-01 06:12:35', '2024-02-01 06:12:35'),
(315, 'best quality', 13, 1, '2024-01-31 17:27:35', '2024-02-01 06:12:35', '2024-02-01 06:12:35'),
(316, 'suit', 13, 1, '2024-01-31 17:27:35', '2024-02-01 06:12:35', '2024-02-01 06:12:35'),
(317, 'mens wear', 13, 1, '2024-01-31 17:27:35', '2024-02-01 06:12:35', '2024-02-01 06:12:35'),
(318, 'khaddar', 14, 1, '2024-01-31 17:27:40', '2024-02-01 06:12:10', '2024-02-01 06:12:10'),
(319, 'best quality', 14, 1, '2024-01-31 17:27:40', '2024-02-01 06:12:10', '2024-02-01 06:12:10'),
(320, 'suit', 14, 1, '2024-01-31 17:27:40', '2024-02-01 06:12:10', '2024-02-01 06:12:10'),
(321, 'mens wear', 14, 1, '2024-01-31 17:27:40', '2024-02-01 06:12:10', '2024-02-01 06:12:10'),
(322, 'khaddar', 3, 1, '2024-01-31 17:29:56', '2024-02-01 06:01:03', '2024-02-01 06:01:03'),
(323, 'best quality', 3, 1, '2024-01-31 17:29:56', '2024-02-01 06:01:03', '2024-02-01 06:01:03'),
(324, 'suit', 3, 1, '2024-01-31 17:29:56', '2024-02-01 06:01:03', '2024-02-01 06:01:03'),
(325, 'mens wear', 3, 1, '2024-01-31 17:29:56', '2024-02-01 06:01:03', '2024-02-01 06:01:03'),
(326, 'khaddar', 11, 1, '2024-01-31 18:02:47', '2024-02-01 06:11:45', '2024-02-01 06:11:45'),
(327, 'best quality', 11, 1, '2024-01-31 18:02:47', '2024-02-01 06:11:45', '2024-02-01 06:11:45'),
(328, 'suit', 11, 1, '2024-01-31 18:02:47', '2024-02-01 06:11:45', '2024-02-01 06:11:45'),
(329, 'mens wear', 11, 1, '2024-01-31 18:02:47', '2024-02-01 06:11:45', '2024-02-01 06:11:45'),
(330, 'khaddar', 1, 1, '2024-02-01 05:12:34', '2024-02-01 05:15:13', '2024-02-01 05:15:13'),
(331, 'best quality', 1, 1, '2024-02-01 05:12:34', '2024-02-01 05:15:13', '2024-02-01 05:15:13'),
(332, 'suit', 1, 1, '2024-02-01 05:12:34', '2024-02-01 05:15:13', '2024-02-01 05:15:13'),
(333, 'mens wear', 1, 1, '2024-02-01 05:12:34', '2024-02-01 05:15:13', '2024-02-01 05:15:13'),
(334, 'khaddar', 1, 1, '2024-02-01 05:15:13', '2024-02-01 05:18:37', '2024-02-01 05:18:37'),
(335, 'best quality', 1, 1, '2024-02-01 05:15:13', '2024-02-01 05:18:37', '2024-02-01 05:18:37'),
(336, 'suit', 1, 1, '2024-02-01 05:15:13', '2024-02-01 05:18:37', '2024-02-01 05:18:37'),
(337, 'mens wear', 1, 1, '2024-02-01 05:15:13', '2024-02-01 05:18:37', '2024-02-01 05:18:37'),
(338, 'khaddar', 1, 1, '2024-02-01 05:18:37', '2024-02-01 05:38:07', '2024-02-01 05:38:07'),
(339, 'best quality', 1, 1, '2024-02-01 05:18:37', '2024-02-01 05:38:07', '2024-02-01 05:38:07'),
(340, 'suit', 1, 1, '2024-02-01 05:18:37', '2024-02-01 05:38:07', '2024-02-01 05:38:07'),
(341, 'mens wear', 1, 1, '2024-02-01 05:18:37', '2024-02-01 05:38:07', '2024-02-01 05:38:07'),
(342, 'khaddar', 1, 1, '2024-02-01 05:38:07', '2024-02-01 05:38:47', '2024-02-01 05:38:47'),
(343, 'best quality', 1, 1, '2024-02-01 05:38:07', '2024-02-01 05:38:47', '2024-02-01 05:38:47'),
(344, 'suit', 1, 1, '2024-02-01 05:38:07', '2024-02-01 05:38:47', '2024-02-01 05:38:47'),
(345, 'mens wear', 1, 1, '2024-02-01 05:38:07', '2024-02-01 05:38:47', '2024-02-01 05:38:47'),
(346, 'khaddar', 1, 1, '2024-02-01 05:38:47', '2024-02-03 06:45:17', '2024-02-03 06:45:17'),
(347, 'best quality', 1, 1, '2024-02-01 05:38:47', '2024-02-03 06:45:17', '2024-02-03 06:45:17'),
(348, 'suit', 1, 1, '2024-02-01 05:38:47', '2024-02-03 06:45:17', '2024-02-03 06:45:17'),
(349, 'mens wear', 1, 1, '2024-02-01 05:38:47', '2024-02-03 06:45:17', '2024-02-03 06:45:17'),
(350, 'khaddar', 2, 1, '2024-02-01 05:54:33', '2024-02-01 05:54:33', NULL),
(351, 'best quality', 2, 1, '2024-02-01 05:54:33', '2024-02-01 05:54:33', NULL),
(352, 'suit', 2, 1, '2024-02-01 05:54:33', '2024-02-01 05:54:33', NULL),
(353, 'mens wear', 2, 1, '2024-02-01 05:54:33', '2024-02-01 05:54:33', NULL),
(354, 'khaddar', 3, 1, '2024-02-01 06:01:03', '2024-02-01 06:01:03', NULL),
(355, 'best quality', 3, 1, '2024-02-01 06:01:03', '2024-02-01 06:01:03', NULL),
(356, 'suit', 3, 1, '2024-02-01 06:01:03', '2024-02-01 06:01:03', NULL),
(357, 'mens wear', 3, 1, '2024-02-01 06:01:03', '2024-02-01 06:01:03', NULL),
(358, 'khaddar', 5, 1, '2024-02-01 06:04:22', '2024-02-01 06:09:10', '2024-02-01 06:09:10'),
(359, 'best quality', 5, 1, '2024-02-01 06:04:22', '2024-02-01 06:09:10', '2024-02-01 06:09:10'),
(360, 'suit', 5, 1, '2024-02-01 06:04:22', '2024-02-01 06:09:10', '2024-02-01 06:09:10'),
(361, 'mens wear', 5, 1, '2024-02-01 06:04:22', '2024-02-01 06:09:10', '2024-02-01 06:09:10'),
(362, 'ali', 4, 1, '2024-02-01 06:07:37', '2024-02-01 06:07:37', NULL),
(363, 'one', 4, 1, '2024-02-01 06:07:37', '2024-02-01 06:07:37', NULL),
(364, 'two', 4, 1, '2024-02-01 06:07:37', '2024-02-01 06:07:37', NULL),
(365, 'three', 4, 1, '2024-02-01 06:07:37', '2024-02-01 06:07:37', NULL),
(366, 'four', 4, 1, '2024-02-01 06:07:37', '2024-02-01 06:07:37', NULL),
(367, 'five', 4, 1, '2024-02-01 06:07:37', '2024-02-01 06:07:37', NULL),
(368, 'khaddar', 5, 1, '2024-02-01 06:09:10', '2024-02-01 06:09:10', NULL),
(369, 'best quality', 5, 1, '2024-02-01 06:09:10', '2024-02-01 06:09:10', NULL),
(370, 'suit', 5, 1, '2024-02-01 06:09:10', '2024-02-01 06:09:10', NULL),
(371, 'mens wear', 5, 1, '2024-02-01 06:09:10', '2024-02-01 06:09:10', NULL),
(372, 'khaddar', 11, 1, '2024-02-01 06:11:45', '2024-02-03 14:05:28', '2024-02-03 14:05:28'),
(373, 'best quality', 11, 1, '2024-02-01 06:11:45', '2024-02-03 14:05:28', '2024-02-03 14:05:28'),
(374, 'suit', 11, 1, '2024-02-01 06:11:45', '2024-02-03 14:05:28', '2024-02-03 14:05:28'),
(375, 'mens wear', 11, 1, '2024-02-01 06:11:45', '2024-02-03 14:05:28', '2024-02-03 14:05:28'),
(376, 'khaddar', 14, 1, '2024-02-01 06:12:10', '2024-02-01 06:12:10', NULL),
(377, 'best quality', 14, 1, '2024-02-01 06:12:10', '2024-02-01 06:12:10', NULL),
(378, 'suit', 14, 1, '2024-02-01 06:12:10', '2024-02-01 06:12:10', NULL),
(379, 'mens wear', 14, 1, '2024-02-01 06:12:10', '2024-02-01 06:12:10', NULL),
(380, 'khaddar', 13, 1, '2024-02-01 06:12:35', '2024-02-01 06:12:35', NULL),
(381, 'best quality', 13, 1, '2024-02-01 06:12:35', '2024-02-01 06:12:35', NULL),
(382, 'suit', 13, 1, '2024-02-01 06:12:35', '2024-02-01 06:12:35', NULL),
(383, 'mens wear', 13, 1, '2024-02-01 06:12:35', '2024-02-01 06:12:35', NULL),
(384, 'khaddar', 12, 1, '2024-02-01 06:12:53', '2024-02-01 06:12:53', NULL),
(385, 'best quality', 12, 1, '2024-02-01 06:12:53', '2024-02-01 06:12:53', NULL),
(386, 'suit', 12, 1, '2024-02-01 06:12:53', '2024-02-01 06:12:53', NULL),
(387, 'mens wear', 12, 1, '2024-02-01 06:12:53', '2024-02-01 06:12:53', NULL),
(388, 'khaddar', 10, 1, '2024-02-01 06:13:10', '2024-02-01 06:13:10', NULL),
(389, 'best quality', 10, 1, '2024-02-01 06:13:10', '2024-02-01 06:13:10', NULL),
(390, 'suit', 10, 1, '2024-02-01 06:13:10', '2024-02-01 06:13:10', NULL),
(391, 'mens wear', 10, 1, '2024-02-01 06:13:10', '2024-02-01 06:13:10', NULL),
(392, 'khaddar', 9, 1, '2024-02-01 06:13:32', '2024-02-01 06:13:32', NULL),
(393, 'best quality', 9, 1, '2024-02-01 06:13:32', '2024-02-01 06:13:32', NULL),
(394, 'suit', 9, 1, '2024-02-01 06:13:32', '2024-02-01 06:13:32', NULL),
(395, 'mens wear', 9, 1, '2024-02-01 06:13:32', '2024-02-01 06:13:32', NULL),
(396, 'khaddar', 8, 1, '2024-02-01 06:13:47', '2024-02-01 06:13:47', NULL),
(397, 'best quality', 8, 1, '2024-02-01 06:13:47', '2024-02-01 06:13:47', NULL),
(398, 'suit', 8, 1, '2024-02-01 06:13:47', '2024-02-01 06:13:47', NULL),
(399, 'mens wear', 8, 1, '2024-02-01 06:13:47', '2024-02-01 06:13:47', NULL),
(400, 'Eos nostrum eos an', 15, 1, '2024-02-01 17:21:48', '2024-02-01 17:21:48', NULL),
(401, 'khaddar', 1, 1, '2024-02-03 06:45:17', '2024-02-03 06:57:27', '2024-02-03 06:57:27'),
(402, 'best quality', 1, 1, '2024-02-03 06:45:17', '2024-02-03 06:57:27', '2024-02-03 06:57:27'),
(403, 'suit', 1, 1, '2024-02-03 06:45:17', '2024-02-03 06:57:27', '2024-02-03 06:57:27'),
(404, 'mens wear', 1, 1, '2024-02-03 06:45:17', '2024-02-03 06:57:27', '2024-02-03 06:57:27'),
(405, 'khaddar', 1, 1, '2024-02-03 06:57:27', '2024-02-03 07:01:48', '2024-02-03 07:01:48'),
(406, 'best quality', 1, 1, '2024-02-03 06:57:27', '2024-02-03 07:01:48', '2024-02-03 07:01:48'),
(407, 'suit', 1, 1, '2024-02-03 06:57:27', '2024-02-03 07:01:48', '2024-02-03 07:01:48'),
(408, 'mens wear', 1, 1, '2024-02-03 06:57:27', '2024-02-03 07:01:48', '2024-02-03 07:01:48'),
(409, 'khaddar', 1, 1, '2024-02-03 07:01:48', '2024-02-03 07:05:08', '2024-02-03 07:05:08'),
(410, 'best quality', 1, 1, '2024-02-03 07:01:48', '2024-02-03 07:05:08', '2024-02-03 07:05:08'),
(411, 'suit', 1, 1, '2024-02-03 07:01:48', '2024-02-03 07:05:08', '2024-02-03 07:05:08'),
(412, 'mens wear', 1, 1, '2024-02-03 07:01:48', '2024-02-03 07:05:08', '2024-02-03 07:05:08'),
(413, 'khaddar', 1, 1, '2024-02-03 07:05:08', '2024-02-03 07:24:25', '2024-02-03 07:24:25'),
(414, 'best quality', 1, 1, '2024-02-03 07:05:08', '2024-02-03 07:24:25', '2024-02-03 07:24:25'),
(415, 'suit', 1, 1, '2024-02-03 07:05:08', '2024-02-03 07:24:25', '2024-02-03 07:24:25'),
(416, 'mens wear', 1, 1, '2024-02-03 07:05:08', '2024-02-03 07:24:25', '2024-02-03 07:24:25'),
(417, 'khaddar', 1, 1, '2024-02-03 07:24:25', '2024-02-03 07:29:14', '2024-02-03 07:29:14'),
(418, 'best quality', 1, 1, '2024-02-03 07:24:25', '2024-02-03 07:29:14', '2024-02-03 07:29:14'),
(419, 'suit', 1, 1, '2024-02-03 07:24:25', '2024-02-03 07:29:14', '2024-02-03 07:29:14'),
(420, 'mens wear', 1, 1, '2024-02-03 07:24:25', '2024-02-03 07:29:14', '2024-02-03 07:29:14'),
(421, 'khaddar', 1, 1, '2024-02-03 07:29:14', '2024-02-03 07:29:14', NULL),
(422, 'best quality', 1, 1, '2024-02-03 07:29:14', '2024-02-03 07:29:14', NULL),
(423, 'suit', 1, 1, '2024-02-03 07:29:14', '2024-02-03 07:29:14', NULL),
(424, 'mens wear', 1, 1, '2024-02-03 07:29:14', '2024-02-03 07:29:14', NULL),
(425, 'khaddar', 11, 1, '2024-02-03 14:05:28', '2024-02-03 14:05:28', NULL),
(426, 'best quality', 11, 1, '2024-02-03 14:05:28', '2024-02-03 14:05:28', NULL),
(427, 'suit', 11, 1, '2024-02-03 14:05:28', '2024-02-03 14:05:28', NULL),
(428, 'mens wear', 11, 1, '2024-02-03 14:05:28', '2024-02-03 14:05:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int NOT NULL DEFAULT '0',
  `last_active` int NOT NULL DEFAULT '1',
  `last_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `is_active`, `last_active`, `last_ip`, `email_verified_at`, `remember_token`, `google_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hafiz Muhammad Tayyab Kilani', 'hafizmtayyab999@gmail.com', 'eyJpdiI6InpTYnBDdy93SEFEdjVGQi9CK2VXMVE9PSIsInZhbHVlIjoiZjd2UXFaRWV0UHp6TGVRK0xIa1ZnQTNOWHVNZG9VaTRsTURjYjlGQW1mYz0iLCJtYWMiOiIyNTFlM2ViOTZkZDRlMzY5YzE4ZGY0M2I1MDFjNWRmYzUzYmYwMmE5ZjRlY2ZhYjhlMGQ0ODRhMTUwY2M5M2YwIiwidGFnIjoiIn0=', 1, 1712240277, '2404:3100:1894:adec:1:0:bec6:fff4', NULL, '5LyhV4soeXjely0XSvjHClEZnPGlf2kEVJDEJniv4xMVfgMmloyxLcukI3hS', '118256298610126295310', '2023-05-27 08:12:02', '2024-04-04 14:17:57', NULL),
(13, 'admin', 'admin@admin.com', '$2y$10$2/OP82VOBz3QEDmG9pA5eeh2dzjh0hAJyqE/b0Oyecc7aAQJEQvGq', 1, 1697989689, '39.35.82.111', NULL, 'k7ncBjbWtA60XxRttCEy3U6Cu4omnWDPp9sepCfzgUFzBRH7x9KSDhacGfQf', NULL, '2023-06-04 10:45:15', '2023-10-22 15:48:09', NULL),
(14, 'user', 'user@user.com', '$2y$10$aTcdZQde8xIdN9L/UIxH3OrY7APf8/0u/27wLJQg7fWK40PRbtI16', 1, 1693798720, '127.0.0.1', NULL, '5daf1Lev26VqHWnevBd4MpN173o6PlU7nHsbCY94v5GavMOCb1unRuEKzPIb', NULL, '2023-06-06 12:52:01', '2023-09-03 22:38:40', NULL),
(17, 'irfan', 'touchit236@gmail.com', '$2y$10$0vRvViFa//olJwe1.t31XOoYIA/aF2uCQK9RtDq4.7SlRJ2KDGzB6', 1, 1706724905, '39.43.161.111', '2023-09-30 03:01:52', NULL, NULL, '2023-06-07 12:53:38', '2024-01-31 18:15:05', NULL),
(20, 'dfd', 'sss@cc.ccc', '$2y$10$XY8wehVj2EUOwjyEDO7mROYtyCr2n/ycnvWCs14vP06vH46sFz5P.', 1, 1, '\r\n101.188.67.134', NULL, NULL, NULL, '2023-06-10 09:28:24', '2024-01-31 17:14:22', '2024-01-31 17:14:22'),
(27, 'Muhammad Irfan', 'iirfanmughal111@gmail.com', '$2y$10$Rf22rxWks6H48EGzge9WwuoimH0hpk5QW2Xujz/bD3/SbuHRMltZO', 1, 1686411178, '192.168.10.3', NULL, NULL, NULL, '2023-06-10 10:32:58', '2023-06-10 10:32:58', NULL),
(28, 'soft zone', 'softcellzone1@gmail.com', '$2y$10$/iOR0OiolD6PM5v4xVqyYOlmD145YE24A1O5Db.FnKevXul7W1xiC', 1, 1696164625, '39.35.40.60', '2023-07-03 23:04:17', 'XUEX7NpWxRWglX9ORPoGAP7kFy5zO1Zsfx1phPv6K0M6CwH8OwcGPUemfb5O', NULL, '2023-06-17 09:32:34', '2023-10-01 12:51:34', NULL),
(29, 'Muhammad Irfan', 'ishsj@gmail.ddd', '$2y$10$xZNnrNia2DHReJtfSV0VGejqHGdD2HP87BZLrNNUowvpz297BIKXO', 1, 1688668508, '192.168.10.4', NULL, NULL, NULL, '2023-07-06 13:35:08', '2024-01-29 16:57:59', NULL),
(30, 'Muhammad Irfan', 'jahdjdj@ajsjdj.sds', '$2y$10$DEjZk5U1PIf8NG18OGJD5up8nGSN7dsdwKujwl0KSAM.o2tISuGTK', 1, 1696433249, '39.35.159.219', NULL, NULL, NULL, '2023-07-09 02:04:04', '2023-10-04 15:27:29', NULL),
(31, 'Entertainment zone', 'entertainmentzone8219@gmail.com', '$2y$10$6qJsZg/E6oE2cu8IIaRJuOao4cU2rkp2N1usxeUidKwpIL8J9Qkay', 1, 1706549230, '39.43.174.105', NULL, NULL, '', '2023-10-01 10:04:25', '2024-01-29 17:27:10', NULL),
(36, 'Soft Cell', 'softcellzone@gmail.com', '$2y$10$6qJsZg/E6oE2cu8IIaRJuOao4cU2rkp2N1usxeUidKwpIL8J9Qkay', 1, 1708933837, '2400:adcc:1107:2300:30f5:dd42:39d4:28ff', NULL, NULL, '', '2023-10-04 15:43:02', '2024-02-26 07:50:37', NULL),
(37, 'irfan', 'softhouse8219@gmail.com', '$2y$10$6qJsZg/E6oE2cu8IIaRJuOao4cU2rkp2N1usxeUidKwpIL8J9Qkay', 1, 1726142108, '127.0.0.1', '2024-01-28 16:17:17', NULL, NULL, '2024-01-28 16:13:15', '2024-09-12 06:55:08', NULL),
(38, 'ahmed', 'shakeelaansar79@gmail.com', '$2y$10$sZYiz8./JCPuzsyKLf61P.Pat5TfYQLV/2d15BoYeXSNN6zYSyJ0C', 1, 1712760468, '39.35.123.91', NULL, NULL, NULL, '2024-04-10 14:47:48', '2024-04-10 14:47:48', NULL),
(39, 'Asad', 'xenforo8@gmail.com', '$2y$10$CmyItY3D9bmgWKbfdRH..e90NU3vUUjH9hhVVXDE1TZWBUsCqXfZW', 1, 1720430925, '2407:d000:603:e22c:e49b:7fc6:5719:7526', NULL, NULL, NULL, '2024-07-05 06:44:43', '2024-07-08 09:28:45', NULL),
(40, 'Muhammad Irfan (Developer)', 'iirfandeveloper@gmail.com', 'eyJpdiI6IkR1TEJ3NE5udDlCZUd3SmVpUHRsQmc9PSIsInZhbHVlIjoiT2F5SnlJSlU4c1VwZ0VaWGhJUWZDNlpFdnZIZ2F4eGlPT0RNeENTcXdSZz0iLCJtYWMiOiJiZWNlZDZlODZhNDcxNTk5Zjk2NTA1ZjM1ZDkwYjdiMzEzYjIzYTJiMjQyMDcyYmU5YzgxMTIwMWIwNzg0Mjk3IiwidGFnIjoiIn0=', 1, 1726139796, '103.173.7.7', NULL, NULL, '105787380876120465272', '2024-09-12 11:16:36', '2024-09-12 11:16:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wish_list`
--

DROP TABLE IF EXISTS `wish_list`;
CREATE TABLE IF NOT EXISTS `wish_list` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wish_list`
--

INSERT INTO `wish_list` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(43, 8, 14, '2023-06-13 10:29:03', '2023-06-13 10:29:03'),
(55, 10, 13, '2023-06-21 12:06:29', '2023-06-21 12:06:29'),
(63, 1, 17, '2023-06-23 12:43:06', '2023-06-23 12:43:06'),
(64, 3, 17, '2023-06-23 12:44:09', '2023-06-23 12:44:09'),
(79, 9, 14, '2023-07-03 23:31:00', '2023-07-03 23:31:00'),
(80, 3, 14, '2023-07-03 23:31:55', '2023-07-03 23:31:55'),
(81, 9, 13, '2023-07-03 23:45:51', '2023-07-03 23:45:51'),
(82, 10, 14, '2023-07-04 10:16:18', '2023-07-04 10:16:18'),
(87, 1, 14, '2023-07-05 09:24:00', '2023-07-05 09:24:00'),
(88, 2, 14, '2023-07-05 09:24:15', '2023-07-05 09:24:15'),
(89, 4, 28, '2023-07-06 13:10:53', '2023-07-06 13:10:53'),
(101, 10, 1, '2023-09-09 11:02:31', '2023-09-09 11:02:31'),
(105, 9, 1, '2023-09-09 11:15:53', '2023-09-09 11:15:53'),
(125, 1, 1, '2023-09-10 09:37:33', '2023-09-10 09:37:33'),
(128, 3, 1, '2023-09-10 09:43:39', '2023-09-10 09:43:39'),
(130, 3, 28, '2023-09-29 19:04:32', '2023-09-29 19:04:32'),
(131, 8, 37, '2024-01-28 16:19:00', '2024-01-28 16:19:00'),
(132, 10, 37, '2024-01-28 16:19:08', '2024-01-28 16:19:08'),
(133, 14, 37, '2024-01-29 16:53:53', '2024-01-29 16:53:53'),
(134, 12, 39, '2024-07-05 06:45:09', '2024-07-05 06:45:09'),
(137, 4, 39, '2024-07-06 07:27:42', '2024-07-06 07:27:42');

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
