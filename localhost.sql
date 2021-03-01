-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 01, 2021 at 11:21 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `236cst`
--
CREATE DATABASE IF NOT EXISTS `236cst` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `236cst`;

-- --------------------------------------------------------

--
-- Table structure for table `connection`
--

CREATE TABLE `connection` (
  `requester` int(10) UNSIGNED NOT NULL,
  `responder` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `invitation`
--

CREATE TABLE `invitation` (
  `requester` int(10) UNSIGNED NOT NULL,
  `responder` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `sender` int(10) UNSIGNED NOT NULL,
  `receiver` int(10) UNSIGNED NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `time_sent` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `date_posted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `postdislikes`
--

CREATE TABLE `postdislikes` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `postlikes`
--

CREATE TABLE `postlikes` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(16) COLLATE utf8_bin NOT NULL,
  `password` varbinary(60) NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `date_joined` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `connection`
--
ALTER TABLE `connection`
  ADD PRIMARY KEY (`requester`,`responder`),
  ADD KEY `responder` (`responder`);

--
-- Indexes for table `invitation`
--
ALTER TABLE `invitation`
  ADD PRIMARY KEY (`requester`,`responder`),
  ADD KEY `responder` (`responder`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `message_user_index` (`sender`,`receiver`),
  ADD KEY `receiver` (`receiver`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_posts` (`user_id`);

--
-- Indexes for table `postdislikes`
--
ALTER TABLE `postdislikes`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `postlikes`
--
ALTER TABLE `postlikes`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

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
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `connection`
--
ALTER TABLE `connection`
  ADD CONSTRAINT `connection_ibfk_1` FOREIGN KEY (`responder`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `connection_ibfk_2` FOREIGN KEY (`requester`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `invitation`
--
ALTER TABLE `invitation`
  ADD CONSTRAINT `invitation_ibfk_1` FOREIGN KEY (`requester`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `invitation_ibfk_2` FOREIGN KEY (`responder`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `postdislikes`
--
ALTER TABLE `postdislikes`
  ADD CONSTRAINT `postdislikes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `postdislikes_ibfk_3` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `postlikes`
--
ALTER TABLE `postlikes`
  ADD CONSTRAINT `postlikes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `postlikes_ibfk_3` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
--
-- Database: `256cst`
--
CREATE DATABASE IF NOT EXISTS `256cst` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `256cst`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Patrick Ulmer', 'laxulmer@gmail.com', NULL, '$2y$10$BtxxyhJO1zSkJgjqZ5J9BehJPjfXJ0n5M6LFX5QAfxDTchYg2jry.', NULL, '2021-02-17 12:53:48', '2021-02-17 12:53:48', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `activity2`
--
CREATE DATABASE IF NOT EXISTS `activity2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `activity2`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `username`, `password`) VALUES
(5, 'test', 'test'),
(7, 'patty', 'ulms'),
(8, 'patrick', 'ulmer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `activity3`
--
CREATE DATABASE IF NOT EXISTS `activity3` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `activity3`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `FirstName`, `LastName`) VALUES
(13, 'Matt', 'Ulmer'),
(14, 'Matt', 'Ulmer'),
(15, 'patrick', 'ulmer'),
(16, 'Patrick', 'Ulmer');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `Product` varchar(100) NOT NULL,
  `CustomerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);
--
-- Database: `admintest`
--
CREATE DATABASE IF NOT EXISTS `admintest` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `admintest`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(500) NOT NULL,
  `role` varchar(30) NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `updated_at`, `created_at`) VALUES
(1, 'patrick', 'laxulmer@gmail.com', '$2y$10$jnqgKgrudSlm2Gy0qEgi3ORZkDO90IpwO0sfzCA3AJpOhI5BuVgt.', 'admin', '2021-02-20', '2021-02-20 03:51:57'),
(2, 'Corrina Fanco', 'corrinafranco@gmail.com', '$2y$10$tJTZLy/i5T.3YU2oKl4jkO5RahqX6wVHalmvNDzGKDgiR6i2heX3m', 'customer', '2021-02-20', '2021-02-20 04:34:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `cst256`
--
CREATE DATABASE IF NOT EXISTS `cst256` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cst256`;

-- --------------------------------------------------------

--
-- Table structure for table `connection`
--

CREATE TABLE `connection` (
  `requester` int(10) UNSIGNED NOT NULL,
  `responder` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `invitation`
--

CREATE TABLE `invitation` (
  `requester` int(10) UNSIGNED NOT NULL,
  `responder` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `sender` int(10) UNSIGNED NOT NULL,
  `receiver` int(10) UNSIGNED NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `time_sent` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `date_posted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `postdislikes`
--

CREATE TABLE `postdislikes` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `postlikes`
--

CREATE TABLE `postlikes` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `username` varchar(16) COLLATE utf8_bin NOT NULL,
  `password` varbinary(60) NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `role` varchar(10) COLLATE utf8_bin NOT NULL,
  `created_at` varchar(50) COLLATE utf8_bin NOT NULL,
  `updated_at` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `role`, `created_at`, `updated_at`) VALUES
(1, '', 'test', 0x000021, 'Test@gmail.com', '', '', ''),
(3, '', 'nate', 0x1234, 'Nate@gmail.com', '', '', ''),
(4, 'Patrick Ulmer', 'pattyboi', 0x2432792431302464566649316335654548544f776547466750795637756369674450337a3445614b4d6b784d5864375a75396b492e4a6c585a35704b, 'laxulmer@gmail.com', 'admin', '2021-02-21 05:31:59', ''),
(5, 'Gabe N', 'Gab', 0x2432792431302443364f69354e326e2e69787134786e4555556547744f50706933597a44454342486d4c566f7071696d5867456b50646346516e6b71, 'GabeN@gmail.com', 'admin', '2021-02-21 06:05:03', '2021-02-21 06:05:03'),
(6, 'Gabe', 'gab', 0x243279243130243247555a45776d74507a7356786c2f5967596764474f4c75624b49356c544f7953776f5151306d42767330354c6d34695254634371, 'gab@gamil.com', 'admin', '2021-02-21 06:25:36', '2021-02-21 06:25:36'),
(7, 'Gabe N', 'gab', 0x2432792431302466662e593575346c69382f71634a4c6567302e337965455a723650306c55633344737453476f683366446e597a2e7a316575524171, 'gabe@gmail.com', 'admin', '2021-02-21 06:26:56', '2021-02-21 06:26:56'),
(8, 'Corrina', 'cfranc', 0x243279243130245266637948554d75346636427a3558394a2e5047544f363878556f54462e4e56444b6c4a4b5a7438676b3931556c63375a64354d61, 'corrina@gmail.com', 'admin', '2021-02-21 06:42:24', '2021-02-21 06:42:24'),
(9, 'matt', 'mattUT', 0x24327924313024732f59717a67584e37473771774f416770414f7a436537313276736841794d7335645a45374e413264345a4937786f704a78686932, 'matt@gmail.com', 'user', '2021-02-22 20:21:09', '2021-02-22 20:21:09'),
(10, 'Nate', 'demrex', 0x243279243130242e366259647453677164354159716f58776d5439722e303536486f6b75546a4970595535723533417966765a6342626e566f30436d, 'email@email.com', 'admin', '2021-02-23 18:56:38', '2021-02-23 18:56:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `connection`
--
ALTER TABLE `connection`
  ADD PRIMARY KEY (`requester`,`responder`),
  ADD KEY `responder` (`responder`);

--
-- Indexes for table `invitation`
--
ALTER TABLE `invitation`
  ADD PRIMARY KEY (`requester`,`responder`),
  ADD KEY `responder` (`responder`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `message_user_index` (`sender`,`receiver`),
  ADD KEY `receiver` (`receiver`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_posts` (`user_id`);

--
-- Indexes for table `postdislikes`
--
ALTER TABLE `postdislikes`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `postlikes`
--
ALTER TABLE `postlikes`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `connection`
--
ALTER TABLE `connection`
  ADD CONSTRAINT `connection_ibfk_1` FOREIGN KEY (`responder`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `connection_ibfk_2` FOREIGN KEY (`requester`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `invitation`
--
ALTER TABLE `invitation`
  ADD CONSTRAINT `invitation_ibfk_1` FOREIGN KEY (`requester`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `invitation_ibfk_2` FOREIGN KEY (`responder`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `postdislikes`
--
ALTER TABLE `postdislikes`
  ADD CONSTRAINT `postdislikes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `postdislikes_ibfk_3` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `postlikes`
--
ALTER TABLE `postlikes`
  ADD CONSTRAINT `postlikes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `postlikes_ibfk_3` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
--
-- Database: `csv_db`
--
CREATE DATABASE IF NOT EXISTS `csv_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `csv_db`;
--
-- Database: `dbauth`
--
CREATE DATABASE IF NOT EXISTS `dbauth` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dbauth`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Patrick Ulmer', 'laxulmer@gmail.com', NULL, '$2y$10$RsZy9WoEWMeiEZm7AYIVTu0Mj7QAxn4BaOLXOnCNOv80jVYVw9Dwy', NULL, '2021-01-21 02:24:44', '2021-01-21 02:24:44'),
(2, 'noah', 'Noah@gmail.com', NULL, '$2y$10$P9p7C8fDsxypWC0kMU1sue76CQ36PuvlK7t02IH6NCLwjO.NVDrKS', NULL, '2021-01-23 06:32:41', '2021-01-23 06:32:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `dbclcmock`
--
CREATE DATABASE IF NOT EXISTS `dbclcmock` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dbclcmock`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'nate', 'nate@gmail.com', NULL, '$2y$10$9obfALALzmMD4a8K2KnzmukJcio5Np/tc7WnIGdzNHt5KuZPWu3JW', NULL, '2021-01-24 05:57:36', '2021-01-24 05:57:36'),
(2, 'juul', 'juul@gmail.com', NULL, '$2y$10$W45ebpt7YFtPKTz.l2erUemKE.bjHkmo1OZwSe.uwY5KB8BLfMucW', NULL, '2021-02-07 09:13:26', '2021-02-07 09:13:26'),
(3, 'hello', 'hello@gmail.com', NULL, '$2y$10$npHLcKAGES7l8jxOj.Prx.unyKBF/JQL/tnfPSZNZsAqgQ7ipm6Sy', NULL, '2021-02-08 02:42:52', '2021-02-08 02:42:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `ica8`
--
CREATE DATABASE IF NOT EXISTS `ica8` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ica8`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `idcustomer` int(11) NOT NULL,
  `FIRST_NAME` varchar(50) NOT NULL,
  `LAST_NAME` varchar(50) NOT NULL,
  `AGE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`idcustomer`, `FIRST_NAME`, `LAST_NAME`, `AGE`) VALUES
(1, 'Patrick', 'Ulmer', 19),
(2, 'Corrina', 'Franco', 19),
(3, 'Manny', 'Acosta', 19),
(4, 'Lexi', 'Ulmer', 25),
(5, 'Gabe', 'Nogales', 19),
(6, 'Caleb', 'Price', 20),
(7, 'Lauren', 'Browne', 19),
(8, 'Lauren', 'Huling', 19),
(9, 'Jaelin', 'Mo', 19),
(10, 'John', 'Snow', 35);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`idcustomer`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `idcustomer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Database: `ica17`
--
CREATE DATABASE IF NOT EXISTS `ica17` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ica17`;

-- --------------------------------------------------------

--
-- Table structure for table `checking`
--

CREATE TABLE `checking` (
  `ID` int(11) NOT NULL,
  `BALANCE` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `checking`
--

INSERT INTO `checking` (`ID`, `BALANCE`) VALUES
(1, 500);

-- --------------------------------------------------------

--
-- Table structure for table `savings`
--

CREATE TABLE `savings` (
  `ID` int(11) NOT NULL,
  `BALANCE` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `savings`
--

INSERT INTO `savings` (`ID`, `BALANCE`) VALUES
(1, 2500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checking`
--
ALTER TABLE `checking`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `savings`
--
ALTER TABLE `savings`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checking`
--
ALTER TABLE `checking`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `savings`
--
ALTER TABLE `savings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `ical7`
--
CREATE DATABASE IF NOT EXISTS `ical7` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ical7`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(100) NOT NULL,
  `LAST_NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`, `FIRST_NAME`, `LAST_NAME`) VALUES
(1, 'Wilburt', 'McElory'),
(2, 'Brana', 'Sowersby'),
(3, 'Bernetta', 'McBain'),
(4, 'Clayborne', 'Greguoli'),
(5, 'Jorey', 'Khomin'),
(6, 'Ellwood', 'Wincom'),
(7, 'Alfred', 'Shurrock'),
(8, 'Barty', 'Wagge'),
(9, 'Alfy', 'Rissom'),
(10, 'Jan', 'Glitherow'),
(11, 'Rosemarie', 'Frackiewicz'),
(12, 'Amandy', 'Wharfe'),
(13, 'Hewie', 'Henmarsh'),
(14, 'Pepe', 'Gouinlock'),
(15, 'Barbee', 'Grist'),
(16, 'Fidelity', 'Roland'),
(17, 'Melesa', 'Wardel'),
(18, 'Vaclav', 'Blackwood'),
(19, 'Rena', 'Slessar'),
(20, 'Clarita', 'Skelton'),
(21, 'Aleda', 'Dunbobbin'),
(22, 'Deeann', 'Ewin'),
(23, 'Charlotte', 'Wilderspoon'),
(24, 'Rica', 'Drayson'),
(25, 'Mordy', 'Bakey'),
(26, 'Trever', 'Asaaf'),
(27, 'Shelba', 'Folomin'),
(28, 'Antonia', 'Pearne'),
(29, 'Hewet', 'Smidmor'),
(30, 'Gerri', 'Gooms'),
(31, 'Nichol', 'Trump'),
(32, 'Howey', 'Aldritt'),
(33, 'Tamara', 'Waind'),
(34, 'Janette', 'Dunlap'),
(35, 'Devin', 'Sedcole'),
(36, 'Daron', 'Redington'),
(37, 'Elisabeth', 'Kedwell'),
(38, 'Eda', 'Wyrill'),
(39, 'Samantha', 'Selland'),
(40, 'Hugibert', 'Pales'),
(41, 'Rafferty', 'Filintsev'),
(42, 'Guntar', 'Ezzell'),
(43, 'Trent', 'Bonifant'),
(44, 'Mignonne', 'Aldwinckle'),
(45, 'Barb', 'Stirling'),
(46, 'Yvette', 'Smillie'),
(47, 'Duff', 'Stenhouse'),
(48, 'Alasteir', 'Zanetto'),
(49, 'Weider', 'Reddick'),
(50, 'Willie', 'Dutton');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- Database: `ical8`
--
CREATE DATABASE IF NOT EXISTS `ical8` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ical8`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`ID`, `USER_ID`, `ADDRESS`) VALUES
(1, NULL, '6 Debs Plaza'),
(2, NULL, '7919 Rutledge Lane'),
(3, NULL, '29 Bowman Pass'),
(4, NULL, '4950 Roxbury Park'),
(5, NULL, '1 Grayhawk Lane'),
(6, NULL, '5 Hanover Center'),
(7, NULL, '359 Buena Vista Lane'),
(8, NULL, '4821 Bunting Alley'),
(9, NULL, '10215 Burrows Center'),
(10, NULL, '1 3rd Way'),
(11, NULL, '3 Gerald Point'),
(12, NULL, '101 Sunfield Trail'),
(13, NULL, '767 Weeping Birch Park'),
(14, NULL, '9426 Maywood Trail'),
(15, NULL, '1183 Corben Circle'),
(16, NULL, '6 Transport Way'),
(17, NULL, '806 Cascade Park'),
(18, NULL, '2 Rigney Junction'),
(19, NULL, '810 Continental Road'),
(20, NULL, '17 Badeau Street'),
(21, NULL, '96445 International Parkway'),
(22, NULL, '63704 Meadow Ridge Avenue'),
(23, NULL, '68 Warrior Avenue'),
(24, NULL, '06 Carpenter Street'),
(25, NULL, '41063 Moulton Junction'),
(26, NULL, '873 Erie Park'),
(27, NULL, '45 Northport Street'),
(28, NULL, '31 Kipling Court'),
(29, NULL, '78137 Hansons Avenue'),
(30, NULL, '96424 Vera Trail'),
(31, NULL, '037 Lindbergh Center'),
(32, NULL, '24 Mcbride Crossing'),
(33, NULL, '77663 Farmco Way'),
(34, NULL, '398 Artisan Center'),
(35, NULL, '35 Mandrake Place'),
(36, NULL, '263 Rieder Plaza'),
(37, NULL, '53 Cordelia Lane'),
(38, NULL, '7135 Westridge Plaza'),
(39, NULL, '02403 Farmco Alley'),
(40, NULL, '0767 Colorado Way'),
(41, NULL, '2 Fair Oaks Center'),
(42, NULL, '4 Vernon Hill'),
(43, NULL, '12 Dwight Point'),
(44, NULL, '68 Bluestem Way'),
(45, NULL, '97 Columbus Avenue'),
(46, NULL, '864 Green Park'),
(47, NULL, '8587 Ruskin Crossing'),
(48, NULL, '72 Shopko Place'),
(49, NULL, '8 Buell Center'),
(50, NULL, '2728 Washington Center'),
(51, NULL, '48458 Mallory Court'),
(52, NULL, '6768 Northport Way'),
(53, NULL, '17 Holmberg Alley'),
(54, NULL, '05 Pond Circle'),
(55, NULL, '27985 Stang Street'),
(56, NULL, '366 Homewood Circle'),
(57, NULL, '4 Coolidge Junction'),
(58, NULL, '499 New Castle Center'),
(59, NULL, '24649 Spaight Avenue'),
(60, NULL, '811 Northfield Point'),
(61, NULL, '85582 Debra Lane'),
(62, NULL, '8 6th Park'),
(63, NULL, '2192 Mayfield Court'),
(64, NULL, '40 Bluestem Drive'),
(65, NULL, '36516 Darwin Avenue'),
(66, NULL, '3 New Castle Alley'),
(67, NULL, '70 Ludington Way'),
(68, NULL, '17 Leroy Avenue'),
(69, NULL, '2 Algoma Parkway'),
(70, NULL, '30029 Rockefeller Point'),
(71, NULL, '226 Harper Drive'),
(72, NULL, '3 Kingsford Court'),
(73, NULL, '41701 Loftsgordon Trail'),
(74, NULL, '9390 Dovetail Drive'),
(75, NULL, '03 Roxbury Court'),
(76, NULL, '9689 Susan Road'),
(77, NULL, '8970 Saint Paul Lane'),
(78, NULL, '7 Montana Alley'),
(79, NULL, '8 Lien Crossing'),
(80, NULL, '6 Menomonie Terrace'),
(81, NULL, '61513 Crescent Oaks Lane'),
(82, NULL, '04335 Myrtle Crossing'),
(83, NULL, '547 Union Avenue'),
(84, NULL, '58 Arkansas Crossing'),
(85, NULL, '88 Westend Circle'),
(86, NULL, '9 Eggendart Pass'),
(87, NULL, '0 Anhalt Parkway'),
(88, NULL, '2 Roxbury Point'),
(89, NULL, '2175 Brown Junction'),
(90, NULL, '59 Lindbergh Pass'),
(91, NULL, '60446 Bunker Hill Place'),
(92, NULL, '39910 Holmberg Center'),
(93, NULL, '4 Jay Park'),
(94, NULL, '077 Fair Oaks Avenue'),
(95, NULL, '5 Fairfield Parkway'),
(96, NULL, '0 Pankratz Parkway'),
(97, NULL, '3 Lotheville Way'),
(98, NULL, '2 Mcbride Road'),
(99, NULL, '3 Bultman Drive'),
(100, NULL, '14 Esch Crossing');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `FIRST_NAME` varchar(100) DEFAULT NULL,
  `LAST_NAME` varchar(100) DEFAULT NULL,
  `USERNAME` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `FIRST_NAME`, `LAST_NAME`, `USERNAME`, `PASSWORD`) VALUES
(1, 'Cyrille', 'McGraffin', 'cmcgraffin0', 'NEDEnJcDigc'),
(2, 'Teodorico', 'Pristnor', 'tpristnor1', 'YmLyc4zui'),
(3, 'Carry', 'Lifton', 'clifton2', 'rHfPnMYUP'),
(4, 'Phillipe', 'Kisbee', 'pkisbee3', 'sABm7ttM'),
(5, 'Kattie', 'Fulbrook', 'kfulbrook4', 'AZeAZBgXGD'),
(6, 'Rodina', 'Knibbs', 'rknibbs5', '9WFC5ZsVcl'),
(7, 'Zulema', 'Scini', 'zscini6', 'sqGnUElql'),
(8, 'Nalani', 'Hintzer', 'nhintzer7', 'WhgCgi24XlYK'),
(9, 'Erasmus', 'Dunford', 'edunford8', 'dHoRW854l1H'),
(10, 'Rochella', 'Lidgley', 'rlidgley9', 'J3Ke9mO'),
(11, 'Crystal', 'Wanklyn', 'cwanklyna', 'FGw2oEXkop'),
(12, 'Elita', 'Otridge', 'eotridgeb', '21ySXXa'),
(13, 'Hali', 'Doodney', 'hdoodneyc', 'kDZNOSW1ZQ'),
(14, 'Orrin', 'Stambridge', 'ostambridged', 'I9LmjT8se'),
(15, 'Giacomo', 'Cansdill', 'gcansdille', 'CGiiryftadIM'),
(16, 'Gilberte', 'Matisse', 'gmatissef', 'bGlAkKuQ'),
(17, 'Antoni', 'Ramplee', 'arampleeg', 'JsEakZI'),
(18, 'Northrup', 'd\'Arcy', 'ndarcyh', 'Tnituq'),
(19, 'Hedwig', 'Macvey', 'hmacveyi', 'Z4at2YfOO'),
(20, 'Pauly', 'Plain', 'pplainj', 'VROv5iHTr'),
(21, 'Ulrike', 'Cantle', 'ucantlek', 'FZwf0BAGM'),
(22, 'Holli', 'Hailes', 'hhailesl', 'adOAfmY5htt'),
(23, 'Bertie', 'Mcall', 'bmcallm', 'LoQN52LR'),
(24, 'Dionysus', 'Robiot', 'drobiotn', '6MKbbPCc'),
(25, 'Laurens', 'McCard', 'lmccardo', 'JNKYI7znx'),
(26, 'Nikola', 'Casina', 'ncasinap', 'DReQDlmZ'),
(27, 'Oralee', 'Moehle', 'omoehleq', 'ozG0qFt6BM'),
(28, 'Ardra', 'Tomkins', 'atomkinsr', '4Ww68KQ'),
(29, 'Lurette', 'Tarbox', 'ltarboxs', 'uF67eWMj'),
(30, 'Kerry', 'Melvin', 'kmelvint', 'hrsrUQ'),
(31, 'Rowan', 'Lovegrove', 'rlovegroveu', 'oUKuLGteQoa'),
(32, 'Irvine', 'Pacher', 'ipacherv', 'GbNaEc5'),
(33, 'Erna', 'Brunroth', 'ebrunrothw', '0sDpGt'),
(34, 'Bidget', 'Kerner', 'bkernerx', 'Aablx6j6uPk'),
(35, 'Gunter', 'McKinnell', 'gmckinnelly', 'hXV2op5IWz77'),
(36, 'Rachael', 'Jeannon', 'rjeannonz', 'hszt3GV'),
(37, 'Moina', 'Blaxter', 'mblaxter10', 'ZtDJteRMHLnN'),
(38, 'Rori', 'Bakhrushkin', 'rbakhrushkin11', 'e5J1jxa'),
(39, 'Eddi', 'Knowles', 'eknowles12', 'FKI5DvjMe'),
(40, 'Lucille', 'Boother', 'lboother13', 'iCHTkca'),
(41, 'Kettie', 'Slocket', 'kslocket14', 'zfQT3rKhYN'),
(42, 'Layney', 'Gudger', 'lgudger15', 'qzorbj'),
(43, 'Rurik', 'Martello', 'rmartello16', 'ICURkZP'),
(44, 'Stuart', 'Aiston', 'saiston17', '4uAxl1hHsW'),
(45, 'Jorie', 'McEvilly', 'jmcevilly18', 'Qt3wFl3qj'),
(46, 'Bellanca', 'Ager', 'bager19', 'EXyMYT'),
(47, 'Wildon', 'Paradise', 'wparadise1a', 'VrH5KatWdPj'),
(48, 'Raynor', 'Bignell', 'rbignell1b', 'zd09bUCLvRNY'),
(49, 'Marcos', 'Rainon', 'mrainon1c', '8lfGg42iJ'),
(50, 'Rycca', 'Swaite', 'rswaite1d', 'hn0UQvjqvl'),
(51, 'Galina', 'Reddecliffe', 'greddecliffe1e', '8LOJhiR'),
(52, 'Stepha', 'Yankeev', 'syankeev1f', '69mlDNp0'),
(53, 'Lana', 'Scupham', 'lscupham1g', '6jlhPL'),
(54, 'Giustino', 'Bennetto', 'gbennetto1h', '5qEYkc'),
(55, 'Felipa', 'Wilcot', 'fwilcot1i', 'fMcszzl'),
(56, 'Burton', 'Gilchrest', 'bgilchrest1j', '2WvZI5s5'),
(57, 'Fabiano', 'O\'Skehan', 'foskehan1k', 'pFCKrsluz'),
(58, 'Cal', 'Lambole', 'clambole1l', 'wv10MD3'),
(59, 'Chandra', 'Whinney', 'cwhinney1m', 'BFX6lYSK'),
(60, 'Andi', 'Hacon', 'ahacon1n', 'L3mqrq0JW'),
(61, 'Olympia', 'Kiehl', 'okiehl1o', 'kiigIwCjGs'),
(62, 'Kissie', 'Ethersey', 'kethersey1p', 'MpbwRP8y'),
(63, 'Crin', 'Stamp', 'cstamp1q', 'TcOXzUJMRS'),
(64, 'Pietra', 'Denerley', 'pdenerley1r', '3xDwLW'),
(65, 'Deni', 'Mateescu', 'dmateescu1s', 'ScN9oYf'),
(66, 'Felecia', 'Norton', 'fnorton1t', 'EVBAIGLxTsVb'),
(67, 'Dru', 'Dougharty', 'ddougharty1u', 'erqjqWzz'),
(68, 'Gray', 'Harrower', 'gharrower1v', '5F39iuKZnM'),
(69, 'Debee', 'Dytham', 'ddytham1w', 'UQdQfn'),
(70, 'Arin', 'Alvis', 'aalvis1x', '1X0Yzy'),
(71, 'Faunie', 'Guiness', 'fguiness1y', 'BeY2aKJ'),
(72, 'Dallis', 'Dulany', 'ddulany1z', 'o0eLFbxhm3q'),
(73, 'Carleton', 'Regan', 'cregan20', '1jLhA0hyl8zK'),
(74, 'Ulrica', 'Cosin', 'ucosin21', 'mMeDH8jJ'),
(75, 'Lauree', 'Eckley', 'leckley22', 'MrykubQZPb4'),
(76, 'Fin', 'Blew', 'fblew23', 'YYcBq5ZqH5Gd'),
(77, 'Harlan', 'Konerding', 'hkonerding24', 'yB7TO7623s'),
(78, 'Lyndy', 'Maylor', 'lmaylor25', 'f6xCv1wyTy'),
(79, 'My', 'Plail', 'mplail26', 'u7Jkzx2LOhID'),
(80, 'Abby', 'Fellows', 'afellows27', '9PI4uwdr'),
(81, 'Angela', 'McCaig', 'amccaig28', 'FxIhuFhw'),
(82, 'Peder', 'Forton', 'pforton29', 'cvt9ffN'),
(83, 'Jehanna', 'Darrel', 'jdarrel2a', 'eqj2PQyWQxI'),
(84, 'Giffer', 'Haller', 'ghaller2b', '1Sfh6WYz2U9'),
(85, 'Camellia', 'Gettings', 'cgettings2c', '1e5jLWSQvWS'),
(86, 'Merry', 'Krebs', 'mkrebs2d', 'lJxeDr9'),
(87, 'Constantina', 'Garken', 'cgarken2e', 'DpVD4nmbp'),
(88, 'Malinde', 'Pearse', 'mpearse2f', 'hMmc7Lfcrjj'),
(89, 'Leeann', 'Buist', 'lbuist2g', 'wgxZATkLkGT'),
(90, 'Filip', 'Gossipin', 'fgossipin2h', 'iqZTLJwOi9Sc'),
(91, 'Eadith', 'Richmont', 'erichmont2i', 'LSW2CAxOg7'),
(92, 'Alvira', 'Parkes', 'aparkes2j', '83YpO5YJLzoE'),
(93, 'Rachael', 'Lauxmann', 'rlauxmann2k', '1jIn9qL3J'),
(94, 'Leonard', 'Barbisch', 'lbarbisch2l', 'EQMoNm0ot'),
(95, 'Brion', 'Simunek', 'bsimunek2m', 'AtbABIryP'),
(96, 'Hanna', 'Tomley', 'htomley2n', 'Kt4uC8'),
(97, 'Tye', 'Tungay', 'ttungay2o', 'eXHKTjoaPHFl'),
(98, 'Agustin', 'Mandres', 'amandres2p', 'WJV4ba5be0Y'),
(99, 'Nichol', 'Shellum', 'nshellum2q', '6SEDoyzE1cA'),
(100, 'Liva', 'Rouby', 'lrouby2r', 'k3uB0e6U');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `USER_ID_idx` (`USER_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- Database: `letsravedatabase`
--
CREATE DATABASE IF NOT EXISTS `letsravedatabase` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `letsravedatabase`;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `ID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`ID`, `OrderID`, `ProductID`, `Qty`) VALUES
(1, 2, 1, 3),
(2, 2, 8, 1),
(3, 3, 1, 3),
(4, 3, 8, 1),
(5, 4, 1, 3),
(6, 4, 8, 1),
(7, 5, 1, 3),
(8, 5, 8, 1),
(9, 6, 1, 3),
(10, 6, 8, 1),
(11, 7, 2, 1),
(12, 8, 2, 1),
(13, 9, 2, 1),
(14, 10, 5, 2),
(15, 10, 7, 2),
(16, 11, 3, 1),
(17, 12, 4, 1),
(18, 12, 3, 2),
(19, 13, 3, 2),
(20, 13, 8, 2),
(21, 13, 7, 2),
(22, 14, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `OrderDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CustomerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID`, `OrderDate`, `CustomerID`) VALUES
(2, '2020-12-13 22:11:57', 13),
(3, '2020-12-13 23:11:54', 13),
(4, '2020-12-13 23:14:10', 13),
(5, '2020-12-13 23:14:19', 13),
(6, '2020-12-13 23:14:30', 13),
(7, '2020-12-13 23:16:15', 13),
(8, '2020-12-13 23:16:40', 13),
(9, '2020-12-13 23:16:41', 13),
(10, '2020-12-13 23:58:21', 13),
(11, '2020-12-17 11:12:29', 15),
(12, '2020-12-20 18:00:59', 15),
(13, '2020-12-20 20:39:51', 15),
(14, '2020-12-22 17:41:11', 15);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `CONCERT_ID` int(100) NOT NULL,
  `TITLE` varchar(50) CHARACTER SET latin1 NOT NULL,
  `ARTIST` varchar(20) CHARACTER SET latin1 NOT NULL,
  `LOCATION` varchar(50) CHARACTER SET latin1 NOT NULL,
  `DESCRIPTION` varchar(1000) CHARACTER SET latin1 NOT NULL,
  `PRICE` double NOT NULL,
  `Picture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`CONCERT_ID`, `TITLE`, `ARTIST`, `LOCATION`, `DESCRIPTION`, `PRICE`, `Picture`) VALUES
(1, 'Duality', 'Adventure Club', 'Rawhide Event Center- ChandlerAZ', 'Relentless Beats presents Adventure Club: Duality – Friday on Friday, October 16, 2020 at Rawhide Event Center in Chandler, AZ. This show is 18+.', 130, 'adventure-club.jpg'),
(2, 'Bass Canyon 2021', '+Multiple Artists+', 'The Gorge Amphitheatre, WA', 'Friday August 20,2021-Sunday August 22,2021 Featuring Excision, 12th Planet, Louis the child, ekali and more!', 800, 'bass-canyon.jpg'),
(3, 'Here for now Tour', 'Louis the Child', 'The Park at Wild Hourse Pass', 'Relentless Beats presents Louis the Child: Chicago-bred duo Louis the Child devote themselves to dreaming up rhythms and melodies and textures that transcend all expectation. October 15, 2021 at The Park at Wild Horse Pass in Chandler, AZ. This show is 18+.', 75, 'louis-the-child.jpg\r\n'),
(4, 'EDC Las Vegas', '+Multiple Artists+', 'Las Vegas Motor speedway', 'We groove to the same universal beat and, together, create beautiful experiences that will never be forgotten. May 21-23,2021', 450, 'edc.jpg\r\n'),
(5, 'Bay Dreams festival', 'Flume & Pendulum', 'Trustpower Baypark, Tauranga, New Zealand', ' Bay Dreams festival on January 3 & 5 on the north and south islands. The lineup features a stellar array of names like Flume, Pendulum Trinity, Peking Duk, Blanke, GG Magree, George Maple, The Upbeats, Montell2099, Enschway, and more.', 250, 'flume.jpg\r\n'),
(6, 'Temple of Wonderland', 'Alison Wonderland', 'Red Rocks', 'Alison Wonderland Coming to Red Rocks September 15,2021', 60, 'alison-wonderland.jpg'),
(7, 'A Moment Apart', 'Odesza', 'Los Angeles State Historic park', 'Saturday, July 27th,2021.It’s ODESZA’s most ambitious Concert Experience, yet also their most human one, despite the futuristic found sounds and cinematic sweeps and flourishes. Their goals for the album are sonically grand yet surprisingly modest.\r\n', 50, 'odesza.jpg'),
(8, 'Slander', 'Slander and Dylan M', 'Tacoma Dome, Tacoma, WA', 'November 2021. Slander is coming to the Tacoma Dome with Dylan Matthew and Eptic!', 175, 'slander.jpg'),
(9, 'Steve Aoki by Salt City Sounds', 'Steve Aoki', 'The complex', 'Steve Aoki is stopping by Salt Lake City Utah for a once in a lifetime party which includes music, cake throwing and more. March 7, 2021', 15, 'steve-aoki.jpg'),
(10, 'Dillon Francis Tour', 'Dillon Francis', 'Ogden Ampatheatre', 'Dillon Francis is coming to Ogden Ampatheatre for the biggest party of the year. June 6, 2019', 50, 'dillon-francis.jpg'),
(11, 'NGHTMRE POD EXPERIENCE 2020', 'NGHTMRE', 'Wild horse arena', 'NGHTMRE and friends are bring you the ultimate quarantine concert. In pods up to 5, you and friends can party in your own section with your own rail to headbang. 18+', 300, 'nghtmre.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(15) CHARACTER SET latin1 NOT NULL,
  `LAST_NAME` varchar(15) CHARACTER SET latin1 NOT NULL,
  `USERNAME` varchar(15) CHARACTER SET latin1 NOT NULL,
  `PASSWORD` varchar(20) CHARACTER SET latin1 NOT NULL,
  `Role` int(10) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`, `FIRST_NAME`, `LAST_NAME`, `USERNAME`, `PASSWORD`, `Role`) VALUES
(1, 'a', 'a', 'a', 'a', 0),
(3, 'Patrick', 'Ulmer', 'patty', 'boy', 1),
(4, 'Gabe', 'Nogalesssss', 'Gabe', 'nogales', 1),
(7, 'Manny', 'Acosta', 'Money', 'Man', 2),
(8, 'Garrett', 'georgeeeyy', 'gmoney', 'boiz', 3),
(13, 'p', 'P', 'P', 'p', 5),
(14, 'Corrina', 'Franco', 'CF', 'CO', 5),
(15, 'Dom', 'Fabry', 'dom', 'dom', 5),
(16, 'Caleb', 'Price', 'caleb', 'P', 5),
(17, 'John', 'crispi', 'crispi', 'john', 5),
(18, 'Shad', 'Sluiter', 'shad', 'twotwoseven', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`CONCERT_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `CONCERT_ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Database: `milestone1-236`
--
CREATE DATABASE IF NOT EXISTS `milestone1-236` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `milestone1-236`;
--
-- Database: `new_schema`
--
CREATE DATABASE IF NOT EXISTS `new_schema` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `new_schema`;
--
-- Database: `patrickdatabase1`
--
CREATE DATABASE IF NOT EXISTS `patrickdatabase1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `patrickdatabase1`;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `BLOG_ID` int(11) NOT NULL,
  `BLOG_TITLE` varchar(30) NOT NULL,
  `BLOG_CONTENT` varchar(100) NOT NULL,
  `USER_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`BLOG_ID`, `BLOG_TITLE`, `BLOG_CONTENT`, `USER_NAME`) VALUES
(13, 'beats by eminem', 'music time', '123'),
(14, 'blog', 'I am very excited, this is a bad valentines day', '123'),
(15, 'my name', 'Is G eazy', 'G'),
(16, 'Bat', 'I love gotham and I hate the Joker', 'bat');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(25) NOT NULL,
  `LAST_NAME` varchar(25) NOT NULL,
  `USERNAME` varchar(25) NOT NULL,
  `PASSWORD` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`, `FIRST_NAME`, `LAST_NAME`, `USERNAME`, `PASSWORD`) VALUES
(1, 'Patrick', 'Ulmer', '123', '123'),
(2, 'G', 'eazy', 'G', 'eazy'),
(3, 'james', 'gordon', 'bat', 'man'),
(4, 'nike', 'swoosh', 'Joker', 'sux');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`BLOG_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `BLOG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
