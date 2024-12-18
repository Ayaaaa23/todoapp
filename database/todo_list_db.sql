-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 18 déc. 2024 à 00:05
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `todo_list_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`id`, `name`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 'work on the project', 1, '2024-11-20 12:00:01', '2024-11-20 11:20:42', '2024-11-20 12:00:01'),
(2, 'work on the project', 1, '2024-11-20 11:47:45', '2024-11-20 11:44:18', '2024-11-20 11:47:45'),
(3, 'work on the project', 0, NULL, '2024-11-20 11:46:41', '2024-11-20 11:46:41'),
(4, 'work on the project', 0, NULL, '2024-11-20 11:59:52', '2024-11-20 11:59:52');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_11_11_111120_create_tasks_table', 1),
(6, '2024_11_15_172334_create_items_table', 1),
(7, '2024_12_17_220316_add_done_column_to_tasks_table', 2);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'token-name', '9a1acdf61d9383a64d3e6ffc53f49dcf56895817022131ad493b9e3fab2b7ad7', '[\"*\"]', NULL, '2024-12-15 17:46:04', '2024-12-15 17:46:04'),
(2, 'App\\Models\\User', 5, 'token-name', '0a913d0dccb74c87adc7f3f5c163d005774d5e27814cc8f2e5560a1fa48c7b3a', '[\"*\"]', NULL, '2024-12-17 06:01:31', '2024-12-17 06:01:31'),
(3, 'App\\Models\\User', 6, 'token-name', 'd4c1ab1eebb5b50b242f3ce1367e395e284eaf798cc3c8b9b7300a64fc782129', '[\"*\"]', NULL, '2024-12-17 22:20:25', '2024-12-17 22:20:25'),
(4, 'App\\Models\\User', 6, 'token-name', '8aa21c348be3f49390927edf087cdaa14bcf479db5f2b496494128a4822b115c', '[\"*\"]', NULL, '2024-12-17 22:21:25', '2024-12-17 22:21:25'),
(5, 'App\\Models\\User', 6, 'token-name', 'd0d62625771800a863edd52933406edd45d1c9d1ed68c3a49acf43ae955f5959', '[\"*\"]', NULL, '2024-12-17 22:25:21', '2024-12-17 22:25:21'),
(6, 'App\\Models\\User', 6, 'token-name', 'e9854af9ee7e5be587661db3373395d3d06164941d93804da879c37dec21aa22', '[\"*\"]', NULL, '2024-12-17 22:54:29', '2024-12-17 22:54:29');

-- --------------------------------------------------------

--
-- Structure de la table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `done` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `completed`, `created_at`, `updated_at`, `done`) VALUES
(2, 'finir projet PAW', 'DEADLINE A 23H59', 1, '2024-12-15 19:12:02', '2024-12-17 21:32:50', 0),
(3, 'Create an app', NULL, 0, '2024-12-15 19:20:11', '2024-12-17 21:11:27', 0),
(6, 'finir backend', NULL, 0, '2024-12-17 18:59:56', '2024-12-17 21:04:32', 0),
(8, 'Réviser Test Tp ihm', NULL, 0, '2024-12-17 20:32:55', '2024-12-17 21:04:58', 0),
(11, 'FINIR BACKEND', NULL, 0, '2024-12-17 21:05:38', '2024-12-17 21:12:55', 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'testuser@example.com', NULL, '$2y$10$Xq2AGm4LVfymwQtg4fqqZu9.FCTOCWWvnPDMjCQumJez1C8GiY6s6', NULL, '2024-12-15 16:02:31', '2024-12-15 16:02:31'),
(2, 'Exemple Utilisateur', 'exemple@utilisateur.com', NULL, '$2y$10$qoSHiHxUgFo2Ud.xrg2VPu9MXNvCe8D.Kqm5sbdvStavGCmZWExlK', NULL, '2024-12-15 16:08:34', '2024-12-15 16:08:34'),
(3, 'aya', 'exemple3@utilisateur.com', NULL, '$2y$10$wt1mG1z/0tshqH9CtNOMVeuQMG2uP1f1yp56ZBvLCpCcTYjNc8Nam', NULL, '2024-12-15 16:19:42', '2024-12-15 16:19:42'),
(4, 'jane doe', 'exemple4@utilisateur.com', NULL, '$2y$10$kqfmTrZXoeWNHuRdX1yJveOYwVT2RRHlq7km1pO0ZLQox7GDKmf/2', NULL, '2024-12-15 17:35:46', '2024-12-15 17:35:46'),
(5, 'nourline', 'appndsites@gmail.com', NULL, '$2y$10$DBY167/vz00wQAPWrYXD/eQLj24V.75fDT0qM/1B8jCgtKApSoUkC', NULL, '2024-12-17 06:01:04', '2024-12-17 06:01:04'),
(6, 'boothill23', 'BOOTHILL@gmail.com', NULL, '$2y$10$FlL9gF6gGkkG5wyGDNXeAOSAuECKa7RkYYgyu8bRLXaPqUjSzAJjW', NULL, '2024-12-17 22:20:03', '2024-12-17 22:20:03');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
