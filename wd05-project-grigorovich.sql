-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 03, 2019 at 11:51 PM
-- Server version: 8.0.12
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wd05-project-grigorovich`
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
  `avatar_small` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `name`, `surname`, `country`, `city`, `avatar`, `avatar_small`) VALUES
(1, 'info@uac.com', '$2y$10$EiWdvpEalZxusZm6NOwlKO4nCUJq811DV48bo5az1fo6pNdBRLRqm', 'admin', 'Сергей', 'Григорович', 'Беларусь', 'Березино', '979656711358.jpg', '48-979656711358.jpg'),
(18, 'mail@mail.ru', '$2y$10$RTTcbKp45y.niAtD75Qm0egKEAmEMULIsr9KgALby4NUy.lYCkngG', 'user', NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'info3@uac.com', '$2y$10$XG47VIsw4qWGPLlL3HAJUee0Q9s1rhv1cSZhMXkIQYn656DCV5Se2', 'user', 'User3', 'Третьяков', 'Россия', 'Волгоград', '528185697112.jpg', '48-528185697112.jpg'),
(23, 'test@test.com', '$2y$10$UT21LxyqtFC/RX.NFo4Jhes3mVidnJR2LJtd4iVrPHYwZZEK8HI8y', 'user', NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'frank@telecom.ru', '$2y$10$u/tvx/.r8T8lm83Qbf4zNe/sXJ3lXIQwmNknN1Pee9FYstAbcKc0u', 'user', 'Фрэнк', 'Давыдов', 'Россия', 'Питер', '324452254963.jpg', '48-324452254963.jpg'),
(28, 'delgardo@squad.com', '$2y$10$QWXxfSNdUH.65SKNgv3PQO4gA9R4n.DX/aLgQcxBJIPh82jMWNNIu', 'user', 'Дельгардо', 'Испанец', 'Испания', '', '857267536894.jpg', '48-857267536894.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
