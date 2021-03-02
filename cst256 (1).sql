-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 02, 2021 at 04:41 AM
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
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `user_id` int(11) NOT NULL,
  `college` varchar(20) NOT NULL,
  `gpa` decimal(10,0) NOT NULL,
  `degree` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `entitygroup`
--

CREATE TABLE `entitygroup` (
  `groupID` int(11) NOT NULL,
  `created_by` int(100) NOT NULL,
  `grouptitle` varchar(40) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `joblistings`
--

CREATE TABLE `joblistings` (
  `listingID` int(11) NOT NULL,
  `companyname` varchar(50) NOT NULL,
  `title` varchar(30) NOT NULL,
  `salary` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `entitygroup`
--
ALTER TABLE `entitygroup`
  ADD PRIMARY KEY (`groupID`);

--
-- Indexes for table `invitation`
--
ALTER TABLE `invitation`
  ADD PRIMARY KEY (`requester`,`responder`),
  ADD KEY `responder` (`responder`);

--
-- Indexes for table `joblistings`
--
ALTER TABLE `joblistings`
  ADD PRIMARY KEY (`listingID`);

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
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entitygroup`
--
ALTER TABLE `entitygroup`
  MODIFY `groupID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `joblistings`
--
ALTER TABLE `joblistings`
  MODIFY `listingID` int(11) NOT NULL AUTO_INCREMENT;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
