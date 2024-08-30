-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 05 2023 г., 13:30
-- Версия сервера: 5.7.36
-- Версия PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `xweb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2023-01-05 04:04:01', '2023-01-05 04:04:01'),
(2, NULL, 1, 'Category 2', 'category-2', '2023-01-05 04:04:01', '2023-01-05 04:04:01');

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `display_name` varchar(191) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(60, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(61, 9, 'iso', 'text', 'Iso', 0, 1, 1, 1, 1, 1, '{}', 2),
(62, 9, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(63, 9, 'active', 'hidden', 'Active', 0, 1, 1, 1, 1, 1, '{}', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `display_name_singular` varchar(191) NOT NULL,
  `display_name_plural` varchar(191) NOT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `model_name` varchar(191) DEFAULT NULL,
  `policy_name` varchar(191) DEFAULT NULL,
  `controller` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-01-05 04:01:43', '2023-01-05 04:01:43'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-01-05 04:01:43', '2023-01-05 04:01:43'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-01-05 04:01:43', '2023-01-05 04:01:43'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2023-01-05 04:04:01', '2023-01-05 04:04:01'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(9, 'languages', 'languages', 'Language', 'Languages', NULL, 'App\\Models\\Language', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-01-05 06:48:37', '2023-01-05 06:48:37');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `iso` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `languages`
--

INSERT INTO `languages` (`id`, `iso`, `name`, `active`) VALUES
(1, 'hy', 'Հայերեն', NULL),
(2, 'ru', 'Русский', NULL),
(3, 'en', 'English', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ltm_translations`
--

DROP TABLE IF EXISTS `ltm_translations`;
CREATE TABLE IF NOT EXISTS `ltm_translations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(191) NOT NULL,
  `group` varchar(191) NOT NULL,
  `key` text NOT NULL,
  `value` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ltm_translations`
--

INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 0, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2023-01-05 05:19:02', '2023-01-05 09:13:15'),
(2, 0, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2023-01-05 05:19:02', '2023-01-05 09:13:15'),
(4, 0, 'en', 'pagination', 'previous', '&laquo; Previous', '2023-01-05 05:19:02', '2023-01-05 09:13:15'),
(5, 0, 'en', 'pagination', 'next', 'Next &raquo;', '2023-01-05 05:19:02', '2023-01-05 09:13:15'),
(6, 0, 'en', 'passwords', 'reset', 'Your password has been reset!', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(7, 0, 'en', 'passwords', 'sent', 'We have emailed your password reset link!', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(8, 0, 'en', 'passwords', 'throttled', 'Please wait before retrying.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(9, 0, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(10, 0, 'en', 'passwords', 'user', 'We can\'t find a user with that email address.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(11, 0, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(12, 0, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(13, 0, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(14, 0, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(15, 0, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(16, 0, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, dashes and underscores.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(17, 0, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(18, 0, 'en', 'validation', 'array', 'The :attribute must be an array.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(19, 0, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(20, 0, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(21, 0, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(22, 0, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(23, 0, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(24, 0, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(25, 0, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(26, 0, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(27, 0, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(28, 0, 'en', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(29, 0, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(30, 0, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(31, 0, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(32, 0, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(33, 0, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(34, 0, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(35, 0, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(36, 0, 'en', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(37, 0, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(38, 0, 'en', 'validation', 'file', 'The :attribute must be a file.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(39, 0, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(40, 0, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(41, 0, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(42, 0, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(43, 0, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(44, 0, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal :value.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(45, 0, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal :value kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(46, 0, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal :value characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(47, 0, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(48, 0, 'en', 'validation', 'image', 'The :attribute must be an image.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(49, 0, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(50, 0, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(51, 0, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(52, 0, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(53, 0, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(54, 0, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(55, 0, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(56, 0, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(57, 0, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(58, 0, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(59, 0, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(60, 0, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal :value.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(61, 0, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal :value kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(62, 0, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal :value characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(63, 0, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(64, 0, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(65, 0, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(66, 0, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(67, 0, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(68, 0, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(69, 0, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(70, 0, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(71, 0, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(72, 0, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(73, 0, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(74, 0, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(75, 0, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(76, 0, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(77, 0, 'en', 'validation', 'password', 'The password is incorrect.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(78, 0, 'en', 'validation', 'present', 'The :attribute field must be present.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(79, 0, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(80, 0, 'en', 'validation', 'required', 'The :attribute field is required.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(81, 0, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(82, 0, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(83, 0, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(84, 0, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(85, 0, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(86, 0, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(87, 0, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(88, 0, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(89, 0, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(90, 0, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(91, 0, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(92, 0, 'en', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(93, 0, 'en', 'validation', 'string', 'The :attribute must be a string.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(94, 0, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(95, 0, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(96, 0, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(97, 0, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(98, 0, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(99, 0, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(100, 0, 'hy', 'auth', 'failed', 'These credentials do not match our records.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(101, 0, 'hy', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(103, 0, 'hy', 'pagination', 'previous', '&laquo; Previous', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(104, 0, 'hy', 'pagination', 'next', 'Next &raquo;', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(105, 0, 'hy', 'passwords', 'reset', 'Your password has been reset!', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(106, 0, 'hy', 'passwords', 'sent', 'We have emailed your password reset link!', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(107, 0, 'hy', 'passwords', 'throttled', 'Please wait before retrying.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(108, 0, 'hy', 'passwords', 'token', 'This password reset token is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(109, 0, 'hy', 'passwords', 'user', 'We can\'t find a user with that email address.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(110, 0, 'hy', 'validation', 'accepted', 'The :attribute must be accepted.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(111, 0, 'hy', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(112, 0, 'hy', 'validation', 'after', 'The :attribute must be a date after :date.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(113, 0, 'hy', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(114, 0, 'hy', 'validation', 'alpha', 'The :attribute may only contain letters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(115, 0, 'hy', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, dashes and underscores.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(116, 0, 'hy', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(117, 0, 'hy', 'validation', 'array', 'The :attribute must be an array.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(118, 0, 'hy', 'validation', 'before', 'The :attribute must be a date before :date.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(119, 0, 'hy', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(120, 0, 'hy', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(121, 0, 'hy', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(122, 0, 'hy', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(123, 0, 'hy', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(124, 0, 'hy', 'validation', 'boolean', 'The :attribute field must be true or false.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(125, 0, 'hy', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(126, 0, 'hy', 'validation', 'date', 'The :attribute is not a valid date.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(127, 0, 'hy', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(128, 0, 'hy', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(129, 0, 'hy', 'validation', 'different', 'The :attribute and :other must be different.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(130, 0, 'hy', 'validation', 'digits', 'The :attribute must be :digits digits.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(131, 0, 'hy', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(132, 0, 'hy', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(133, 0, 'hy', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(134, 0, 'hy', 'validation', 'email', 'The :attribute must be a valid email address.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(135, 0, 'hy', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(136, 0, 'hy', 'validation', 'exists', 'The selected :attribute is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(137, 0, 'hy', 'validation', 'file', 'The :attribute must be a file.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(138, 0, 'hy', 'validation', 'filled', 'The :attribute field must have a value.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(139, 0, 'hy', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(140, 0, 'hy', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(141, 0, 'hy', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(142, 0, 'hy', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(143, 0, 'hy', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal :value.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(144, 0, 'hy', 'validation', 'gte.file', 'The :attribute must be greater than or equal :value kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(145, 0, 'hy', 'validation', 'gte.string', 'The :attribute must be greater than or equal :value characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(146, 0, 'hy', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(147, 0, 'hy', 'validation', 'image', 'The :attribute must be an image.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(148, 0, 'hy', 'validation', 'in', 'The selected :attribute is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(149, 0, 'hy', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(150, 0, 'hy', 'validation', 'integer', 'The :attribute must be an integer.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(151, 0, 'hy', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(152, 0, 'hy', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(153, 0, 'hy', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(154, 0, 'hy', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(155, 0, 'hy', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(156, 0, 'hy', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(157, 0, 'hy', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(158, 0, 'hy', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(159, 0, 'hy', 'validation', 'lte.numeric', 'The :attribute must be less than or equal :value.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(160, 0, 'hy', 'validation', 'lte.file', 'The :attribute must be less than or equal :value kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(161, 0, 'hy', 'validation', 'lte.string', 'The :attribute must be less than or equal :value characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(162, 0, 'hy', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(163, 0, 'hy', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(164, 0, 'hy', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(165, 0, 'hy', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(166, 0, 'hy', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(167, 0, 'hy', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(168, 0, 'hy', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(169, 0, 'hy', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(170, 0, 'hy', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(171, 0, 'hy', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(172, 0, 'hy', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2023-01-05 05:19:03', '2023-01-05 09:13:15'),
(173, 0, 'hy', 'validation', 'not_in', 'The selected :attribute is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(174, 0, 'hy', 'validation', 'not_regex', 'The :attribute format is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(175, 0, 'hy', 'validation', 'numeric', 'The :attribute must be a number.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(176, 0, 'hy', 'validation', 'password', 'The password is incorrect.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(177, 0, 'hy', 'validation', 'present', 'The :attribute field must be present.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(178, 0, 'hy', 'validation', 'regex', 'The :attribute format is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(179, 0, 'hy', 'validation', 'required', 'The :attribute field is required.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(180, 0, 'hy', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(181, 0, 'hy', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(182, 0, 'hy', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(183, 0, 'hy', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(184, 0, 'hy', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(185, 0, 'hy', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(186, 0, 'hy', 'validation', 'same', 'The :attribute and :other must match.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(187, 0, 'hy', 'validation', 'size.numeric', 'The :attribute must be :size.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(188, 0, 'hy', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(189, 0, 'hy', 'validation', 'size.string', 'The :attribute must be :size characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(190, 0, 'hy', 'validation', 'size.array', 'The :attribute must contain :size items.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(191, 0, 'hy', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(192, 0, 'hy', 'validation', 'string', 'The :attribute must be a string.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(193, 0, 'hy', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(194, 0, 'hy', 'validation', 'unique', 'The :attribute has already been taken.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(195, 0, 'hy', 'validation', 'uploaded', 'The :attribute failed to upload.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(196, 0, 'hy', 'validation', 'url', 'The :attribute format is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(197, 0, 'hy', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(198, 0, 'hy', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(199, 0, 'ru', 'auth', 'failed', 'These credentials do not match our records.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(200, 0, 'ru', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(202, 0, 'ru', 'pagination', 'previous', '&laquo; Previous', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(203, 0, 'ru', 'pagination', 'next', 'Next &raquo;', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(204, 0, 'ru', 'passwords', 'reset', 'Your password has been reset!', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(205, 0, 'ru', 'passwords', 'sent', 'We have emailed your password reset link!', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(206, 0, 'ru', 'passwords', 'throttled', 'Please wait before retrying.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(207, 0, 'ru', 'passwords', 'token', 'This password reset token is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(208, 0, 'ru', 'passwords', 'user', 'We can\'t find a user with that email address.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(209, 0, 'ru', 'validation', 'accepted', 'The :attribute must be accepted.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(210, 0, 'ru', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(211, 0, 'ru', 'validation', 'after', 'The :attribute must be a date after :date.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(212, 0, 'ru', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(213, 0, 'ru', 'validation', 'alpha', 'The :attribute may only contain letters.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(214, 0, 'ru', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, dashes and underscores.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(215, 0, 'ru', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(216, 0, 'ru', 'validation', 'array', 'The :attribute must be an array.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(217, 0, 'ru', 'validation', 'before', 'The :attribute must be a date before :date.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(218, 0, 'ru', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(219, 0, 'ru', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(220, 0, 'ru', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(221, 0, 'ru', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(222, 0, 'ru', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(223, 0, 'ru', 'validation', 'boolean', 'The :attribute field must be true or false.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(224, 0, 'ru', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(225, 0, 'ru', 'validation', 'date', 'The :attribute is not a valid date.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(226, 0, 'ru', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(227, 0, 'ru', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(228, 0, 'ru', 'validation', 'different', 'The :attribute and :other must be different.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(229, 0, 'ru', 'validation', 'digits', 'The :attribute must be :digits digits.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(230, 0, 'ru', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(231, 0, 'ru', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(232, 0, 'ru', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(233, 0, 'ru', 'validation', 'email', 'The :attribute must be a valid email address.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(234, 0, 'ru', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(235, 0, 'ru', 'validation', 'exists', 'The selected :attribute is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(236, 0, 'ru', 'validation', 'file', 'The :attribute must be a file.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(237, 0, 'ru', 'validation', 'filled', 'The :attribute field must have a value.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(238, 0, 'ru', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(239, 0, 'ru', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(240, 0, 'ru', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(241, 0, 'ru', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(242, 0, 'ru', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal :value.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(243, 0, 'ru', 'validation', 'gte.file', 'The :attribute must be greater than or equal :value kilobytes.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(244, 0, 'ru', 'validation', 'gte.string', 'The :attribute must be greater than or equal :value characters.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(245, 0, 'ru', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(246, 0, 'ru', 'validation', 'image', 'The :attribute must be an image.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(247, 0, 'ru', 'validation', 'in', 'The selected :attribute is invalid.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(248, 0, 'ru', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2023-01-05 05:19:03', '2023-01-05 09:13:16'),
(249, 0, 'ru', 'validation', 'integer', 'The :attribute must be an integer.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(250, 0, 'ru', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(251, 0, 'ru', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(252, 0, 'ru', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(253, 0, 'ru', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(254, 0, 'ru', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(255, 0, 'ru', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(256, 0, 'ru', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(257, 0, 'ru', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(258, 0, 'ru', 'validation', 'lte.numeric', 'The :attribute must be less than or equal :value.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(259, 0, 'ru', 'validation', 'lte.file', 'The :attribute must be less than or equal :value kilobytes.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(260, 0, 'ru', 'validation', 'lte.string', 'The :attribute must be less than or equal :value characters.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(261, 0, 'ru', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(262, 0, 'ru', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(263, 0, 'ru', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(264, 0, 'ru', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(265, 0, 'ru', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(266, 0, 'ru', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(267, 0, 'ru', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(268, 0, 'ru', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(269, 0, 'ru', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(270, 0, 'ru', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(271, 0, 'ru', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(272, 0, 'ru', 'validation', 'not_in', 'The selected :attribute is invalid.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(273, 0, 'ru', 'validation', 'not_regex', 'The :attribute format is invalid.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(274, 0, 'ru', 'validation', 'numeric', 'The :attribute must be a number.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(275, 0, 'ru', 'validation', 'password', 'The password is incorrect.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(276, 0, 'ru', 'validation', 'present', 'The :attribute field must be present.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(277, 0, 'ru', 'validation', 'regex', 'The :attribute format is invalid.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(278, 0, 'ru', 'validation', 'required', 'The :attribute field is required.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(279, 0, 'ru', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(280, 0, 'ru', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(281, 0, 'ru', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(282, 0, 'ru', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(283, 0, 'ru', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(284, 0, 'ru', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(285, 0, 'ru', 'validation', 'same', 'The :attribute and :other must match.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(286, 0, 'ru', 'validation', 'size.numeric', 'The :attribute must be :size.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(287, 0, 'ru', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(288, 0, 'ru', 'validation', 'size.string', 'The :attribute must be :size characters.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(289, 0, 'ru', 'validation', 'size.array', 'The :attribute must contain :size items.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(290, 0, 'ru', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(291, 0, 'ru', 'validation', 'string', 'The :attribute must be a string.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(292, 0, 'ru', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(293, 0, 'ru', 'validation', 'unique', 'The :attribute has already been taken.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(294, 0, 'ru', 'validation', 'uploaded', 'The :attribute failed to upload.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(295, 0, 'ru', 'validation', 'url', 'The :attribute format is invalid.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(296, 0, 'ru', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(297, 0, 'ru', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2023-01-05 05:19:04', '2023-01-05 09:13:16'),
(298, 0, 'hy', '_json', 'pt', NULL, '2023-01-05 05:20:24', '2023-01-05 05:20:24'),
(299, 0, 'hy', '_json', 'es', NULL, '2023-01-05 05:20:24', '2023-01-05 05:20:24'),
(300, 0, 'hy', '_json', 'de', NULL, '2023-01-05 05:20:24', '2023-01-05 05:20:24'),
(301, 0, 'hy', 'main', 'about-us', 'Մեր մասին', '2023-01-05 09:08:49', '2023-01-05 09:25:07'),
(302, 0, 'en', 'main', 'about-us', 'About us', '2023-01-05 09:08:55', '2023-01-05 09:25:07'),
(303, 0, 'ru', 'main', 'about-us', 'О нас', '2023-01-05 09:09:05', '2023-01-05 09:25:07'),
(304, 0, 'hy', 'main', 'home', 'Գլխավոր', '2023-01-05 09:09:46', '2023-01-05 09:25:07'),
(305, 0, 'en', 'main', 'home', 'Home', '2023-01-05 09:09:53', '2023-01-05 09:25:07'),
(306, 0, 'ru', 'main', 'home', 'Главная', '2023-01-05 09:10:10', '2023-01-05 09:25:07'),
(307, 0, 'en', 'main', 'news', 'News', '2023-01-05 09:13:15', '2023-01-05 09:25:07'),
(308, 0, 'hy', 'main', 'news', 'Նորություններ', '2023-01-05 09:13:15', '2023-01-05 09:25:07'),
(309, 0, 'ru', 'main', 'news', 'Новости', '2023-01-05 09:13:16', '2023-01-05 09:25:07'),
(310, 0, 'hy', 'main', 'contact-us', 'Հետադարձ կապ', '2023-01-05 09:24:38', '2023-01-05 09:25:07'),
(311, 0, 'en', 'main', 'contact-us', 'Contact Us', '2023-01-05 09:24:48', '2023-01-05 09:25:07'),
(312, 0, 'ru', 'main', 'contact-us', 'Контакты', '2023-01-05 09:25:03', '2023-01-05 09:25:07');

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-01-05 04:01:43', '2023-01-05 04:01:43');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `target` varchar(191) NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) DEFAULT NULL,
  `parameters` text,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2023-01-05 04:01:43', '2023-01-05 04:01:43', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2023-01-05 04:01:43', '2023-01-05 05:42:31', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2023-01-05 04:01:43', '2023-01-05 04:01:43', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2023-01-05 04:01:43', '2023-01-05 04:01:43', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2023-01-05 04:01:43', '2023-01-05 05:42:31', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 3, '2023-01-05 04:01:43', '2023-01-05 06:43:57', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 4, '2023-01-05 04:01:43', '2023-01-05 06:43:57', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 5, '2023-01-05 04:01:43', '2023-01-05 06:43:57', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 6, '2023-01-05 04:01:43', '2023-01-05 06:43:57', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2023-01-05 04:01:43', '2023-01-05 05:42:31', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 7, '2023-01-05 04:04:01', '2023-01-05 05:42:31', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 5, '2023-01-05 04:04:02', '2023-01-05 05:42:31', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 6, '2023-01-05 04:04:02', '2023-01-05 05:42:31', 'voyager.pages.index', NULL),
(14, 1, 'Translations', '/admin/translations', '_self', 'voyager-character', '#000000', 5, 1, '2023-01-05 05:42:19', '2023-01-05 05:42:31', NULL, ''),
(16, 1, 'Languages', '', '_self', 'voyager-world', '#000000', 5, 2, '2023-01-05 06:48:37', '2023-01-05 06:49:07', 'voyager.languages.index', 'null');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(28, '2014_04_02_193005_create_translations_table', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `excerpt` text,
  `body` text,
  `image` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages\\January2023\\KLLziiOqCdFJ6xo14jAB.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2023-01-05 04:04:02', '2023-01-05 04:05:31');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) NOT NULL,
  `table_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(2, 'browse_bread', NULL, '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(3, 'browse_database', NULL, '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(4, 'browse_media', NULL, '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(5, 'browse_compass', NULL, '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(6, 'browse_menus', 'menus', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(7, 'read_menus', 'menus', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(8, 'edit_menus', 'menus', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(9, 'add_menus', 'menus', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(10, 'delete_menus', 'menus', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(11, 'browse_roles', 'roles', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(12, 'read_roles', 'roles', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(13, 'edit_roles', 'roles', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(14, 'add_roles', 'roles', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(15, 'delete_roles', 'roles', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(16, 'browse_users', 'users', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(17, 'read_users', 'users', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(18, 'edit_users', 'users', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(19, 'add_users', 'users', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(20, 'delete_users', 'users', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(21, 'browse_settings', 'settings', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(22, 'read_settings', 'settings', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(23, 'edit_settings', 'settings', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(24, 'add_settings', 'settings', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(25, 'delete_settings', 'settings', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(26, 'browse_categories', 'categories', '2023-01-05 04:04:01', '2023-01-05 04:04:01'),
(27, 'read_categories', 'categories', '2023-01-05 04:04:01', '2023-01-05 04:04:01'),
(28, 'edit_categories', 'categories', '2023-01-05 04:04:01', '2023-01-05 04:04:01'),
(29, 'add_categories', 'categories', '2023-01-05 04:04:01', '2023-01-05 04:04:01'),
(30, 'delete_categories', 'categories', '2023-01-05 04:04:01', '2023-01-05 04:04:01'),
(31, 'browse_posts', 'posts', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(32, 'read_posts', 'posts', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(33, 'edit_posts', 'posts', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(34, 'add_posts', 'posts', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(35, 'delete_posts', 'posts', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(36, 'browse_pages', 'pages', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(37, 'read_pages', 'pages', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(38, 'edit_pages', 'pages', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(39, 'add_pages', 'pages', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(40, 'delete_pages', 'pages', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(46, 'browse_languages', 'languages', '2023-01-05 06:48:37', '2023-01-05 06:48:37'),
(47, 'read_languages', 'languages', '2023-01-05 06:48:37', '2023-01-05 06:48:37'),
(48, 'edit_languages', 'languages', '2023-01-05 06:48:37', '2023-01-05 06:48:37'),
(49, 'add_languages', 'languages', '2023-01-05 06:48:37', '2023-01-05 06:48:37'),
(50, 'delete_languages', 'languages', '2023-01-05 06:48:37', '2023-01-05 06:48:37');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
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
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `seo_title` varchar(191) DEFAULT NULL,
  `excerpt` text,
  `body` text NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `status` enum('PUBLISHED','DRAFT','PENDING') NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-01-05 04:04:02', '2023-01-05 04:04:02');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2023-01-05 04:01:44', '2023-01-05 04:01:44'),
(2, 'user', 'Normal User', '2023-01-05 04:01:44', '2023-01-05 04:01:44');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) NOT NULL,
  `display_name` varchar(191) NOT NULL,
  `value` text,
  `details` text,
  `type` varchar(191) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) NOT NULL,
  `column_name` varchar(191) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2023-01-05 04:04:02', '2023-01-05 04:04:02'),
(31, 'languages', 'name', 1, 'en', 'Armenian', '2023-01-05 06:53:06', '2023-01-05 06:53:06'),
(32, 'languages', 'name', 1, 'ru', 'Армянский', '2023-01-05 06:53:06', '2023-01-05 06:53:06'),
(33, 'languages', 'name', 2, 'en', 'Russian', '2023-01-05 06:53:45', '2023-01-05 06:53:45'),
(34, 'languages', 'name', 2, 'ru', 'Русский', '2023-01-05 06:53:45', '2023-01-05 06:53:45'),
(35, 'languages', 'name', 3, 'en', 'English', '2023-01-05 06:54:11', '2023-01-05 06:54:11'),
(36, 'languages', 'name', 3, 'ru', 'Англиский', '2023-01-05 06:54:11', '2023-01-05 06:54:11');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `avatar` varchar(191) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'artyom1996a@gmail.com', 'users/default.png', NULL, '$2y$10$Ip9nqIQbl0qnF9is/jZtr.dpZdu5HzGaIUJl.Svq2SPyn0tY5pA8K', 'JZxyjtuWoNwpMNeVkFyDrHYXJo0z7HEtyOMALvV9YbF3ViUZpAXIO6wlklRF', '{\"locale\":\"en\"}', '2023-01-05 04:04:01', '2023-01-05 07:16:54');

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
