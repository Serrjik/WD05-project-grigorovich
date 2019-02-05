-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 05, 2019 at 04:53 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `WD05-project-grigorovich`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `name`, `description`) VALUES
(1, 'Сергей Григорович', 'Я веб-разработчик.');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `text` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `author_id` int(11) UNSIGNED DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `post_img` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `text`, `author_id`, `date_time`, `post_img`) VALUES
(1, 'Новый первый пост', 'Текст первого поста', 1, '2019-02-05 12:38:46', '205277309605.jpg'),
(2, 'Ещё один первый пост', 'Текст поста', 1, '2019-02-05 16:41:52', '205277309605.jpg'),
(3, 'Второй пост', 'Текст второго поста', 1, '2019-02-05 16:44:36', '471071331648.jpg'),
(4, '3-й пост', 'Текст', 1, '2019-02-05 16:48:31', '869713270369.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `surname` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `avatar_small` varchar(191) DEFAULT NULL,
  `recovery_code` varchar(191) DEFAULT NULL,
  `recovery_code_times` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `name`, `surname`, `country`, `city`, `avatar`, `avatar_small`, `recovery_code`, `recovery_code_times`) VALUES
(1, 'info@uac.com', '$2y$10$nqPT0V3S6yN2O7m.C3pDA.qW0XchH/HtwidJpLrffNNdcdaKWgbOK', 'admin', 'Сергей', 'Григорович', 'Беларусь', 'Березино', '979656711358.jpg', '48-979656711358.jpg', 'kFygG5z2UduJ6ew', 0),
(18, 'mail@mail.ru', '$2y$10$RTTcbKp45y.niAtD75Qm0egKEAmEMULIsr9KgALby4NUy.lYCkngG', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'info3@uac.com', '$2y$10$XG47VIsw4qWGPLlL3HAJUee0Q9s1rhv1cSZhMXkIQYn656DCV5Se2', 'user', 'User3', 'Третьяков', 'Россия', 'Волгоград', '528185697112.jpg', '48-528185697112.jpg', '0h5D4KQSLZm792k', 3),
(23, 'test@test.com', '$2y$10$UT21LxyqtFC/RX.NFo4Jhes3mVidnJR2LJtd4iVrPHYwZZEK8HI8y', 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'frank@telecom.ru', '$2y$10$u/tvx/.r8T8lm83Qbf4zNe/sXJ3lXIQwmNknN1Pee9FYstAbcKc0u', 'user', 'Фрэнк', 'Давыдов', 'Россия', 'Питер', '324452254963.jpg', '48-324452254963.jpg', NULL, NULL),
(28, 'delgardo@squad.com', '$2y$10$QWXxfSNdUH.65SKNgv3PQO4gA9R4n.DX/aLgQcxBJIPh82jMWNNIu', 'user', 'Дельгардо', 'Испанец', 'Испания', '', '857267536894.jpg', '48-857267536894.jpg', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_foreignkey_posts_author` (`author_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
