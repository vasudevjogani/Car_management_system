-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2023 at 08:53 PM
-- Server version: 8.0.32
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `menshut`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `firstName` varchar(125) NOT NULL,
  `lastName` varchar(125) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(25) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `confirmCode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `firstName`, `lastName`, `email`, `mobile`, `address`, `password`, `type`, `confirmCode`) VALUES
(5, 'admin', 'admin', 'admin@gmail.com', '01677876551', 'admin', 'admin', 'manager', '0');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `uid` int DEFAULT NULL,
  `ofname` text NOT NULL,
  `pid` int NOT NULL,
  `quantity` int NOT NULL,
  `oplace` text NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `dstatus` varchar(10) NOT NULL DEFAULT 'no',
  `odate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ddate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `uid`, `ofname`, `pid`, `quantity`, `oplace`, `mobile`, `dstatus`, `odate`, `ddate`) VALUES
(12, 17, 'test', 25, 1, 'test', '99999999', 'no', '2023-06-12 18:47:43', '2023-06-20');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `pName` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `description` text NOT NULL,
  `available` int NOT NULL,
  `category` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `pCode` varchar(20) NOT NULL,
  `picture` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `pName`, `price`, `description`, `available`, `category`, `item`, `pCode`, `picture`, `date`) VALUES
(22, 'Audi R8', 22135, 'Audi R8 only in £22,135 .', 2, 'audi', 'Premium Car', 'A-R8', 'audi.jpg', '2023-06-09 17:19:51'),
(23, 'BMW 2023', 50405, 'BMW 2023 from £50,405', 2, 'bmw', 'Premium Car', 'BMW-2023', 'bmw.jpg', '2023-06-09 17:23:17'),
(24, 'Mercedes Benz', 39005, 'Mercedes Benz from £39005 . ', 2, 'mercedes', 'Premium Car', 'M-B', 'mercedes.jpg', '2023-06-09 17:29:47'),
(25, 'Ferrari 2023', 166296, 'Ferrari 2023 from £166296', 1, 'ferrari', 'Premium', 'F-2023', 'ferrari.jpg', '2023-06-09 17:31:25'),
(27, 'Audi A4', 46720, 'Audi A4 Premium Sedan Car with Mileage of 10 Kmpl', 2, 'audi', 'Sedan', 'A-A4', 'audi_a4.jpg', '2023-06-12 18:06:01'),
(28, 'Audi Q7', 36045, 'Audi Q7 - SUV Premium Car with Mileage of 15.4 Kmpl', 2, 'audi', 'SUV', 'A-Q7', 'audi_q7.jpg', '2023-06-12 18:10:34'),
(29, 'BMW X5', 34332, 'BMW X5 - SUV Premium Car with Mileage of 16 KMPL', 2, 'bmw', 'SUV', 'BMW-X5', 'bmw_x5.png', '2023-06-12 18:12:30'),
(30, 'BMW X6', 32654, 'BMW X6 - Premium Sedan with Mileage of 11 KMPL', 2, 'bmw', 'Sedan', 'BMW-X6', 'bmw_x6.jpg', '2023-06-12 18:13:56'),
(31, 'BMW X7', 31024, 'BMW X7 - Premium SUV with Mileage of 15 KMPL', 2, 'bmw', 'SUV', 'BMW X-7', 'bmw_x7.jpg', '2023-06-12 18:16:10');

-- --------------------------------------------------------

--
-- Table structure for table `product_level`
--

CREATE TABLE `product_level` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `v_shape` varchar(10) NOT NULL DEFAULT 'no',
  `polo` varchar(10) NOT NULL DEFAULT 'no',
  `clean_text` varchar(10) NOT NULL DEFAULT 'no',
  `design` varchar(10) NOT NULL DEFAULT 'no',
  `chain` varchar(10) NOT NULL DEFAULT 'no',
  `leather` varchar(10) NOT NULL DEFAULT 'no',
  `hook` varchar(10) NOT NULL DEFAULT 'no',
  `color` varchar(10) NOT NULL DEFAULT 'no',
  `formal` varchar(10) NOT NULL DEFAULT 'no',
  `converse` varchar(10) NOT NULL DEFAULT 'no',
  `loafer` varchar(10) NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_level`
--

INSERT INTO `product_level` (`id`, `product_id`, `v_shape`, `polo`, `clean_text`, `design`, `chain`, `leather`, `hook`, `color`, `formal`, `converse`, `loafer`) VALUES
(1, 1, 'yes', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(2, 2, 'no', 'no', 'no', 'no', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no'),
(3, 3, 'no', 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'yes'),
(4, 4, 'no', 'no', 'no', 'no', 'no', 'yes', 'yes', 'no', 'no', 'no', 'no'),
(5, 5, 'no', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(6, 6, 'no', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(7, 7, 'yes', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(8, 8, 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(9, 9, 'yes', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(10, 10, 'yes', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(14, 14, 'no', 'no', 'no', 'no', 'no', 'yes', 'yes', 'no', 'no', 'no', 'no'),
(12, 12, 'yes', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(13, 13, 'no', 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'yes'),
(15, 15, 'no', 'no', 'no', 'no', 'no', 'yes', 'no', 'yes', 'no', 'no', 'no'),
(16, 16, 'no', 'no', 'no', 'no', 'no', 'yes', 'yes', 'yes', 'no', 'no', 'no'),
(17, 17, 'no', 'no', 'no', 'no', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no'),
(18, 18, 'no', 'no', 'no', 'no', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no'),
(19, 19, 'no', 'no', 'no', 'yes', 'yes', 'yes', 'no', 'no', 'no', 'no', 'no'),
(20, 20, 'no', 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'yes', 'no'),
(21, 21, 'no', 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'yes', 'no', 'no'),
(22, 22, 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(23, 23, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no'),
(24, 24, 'no', 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'no'),
(25, 25, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'yes', 'no', 'no'),
(26, 26, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(27, 27, 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(28, 28, 'yes', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
(29, 29, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no'),
(30, 30, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no'),
(31, 31, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no', 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `product_view`
--

CREATE TABLE `product_view` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_view`
--

INSERT INTO `product_view` (`id`, `user_id`, `product_id`, `date`) VALUES
(1, 9, 9, '2018-09-22 02:19:30'),
(2, 9, 7, '2018-09-27 02:47:43'),
(3, 9, 12, '2018-09-22 03:20:59'),
(4, 9, 10, '2018-09-29 03:07:11'),
(5, 9, 5, '2018-09-22 03:19:19'),
(6, 9, 8, '2018-09-21 15:57:50'),
(7, 9, 6, '2018-09-22 02:12:54'),
(8, 9, 1, '2018-09-22 03:03:36'),
(9, 16, 12, '2023-06-09 16:46:31'),
(10, 16, 1, '2023-06-09 16:49:39'),
(11, 16, 22, '2023-06-12 18:35:02'),
(12, 16, 28, '2023-06-12 18:33:48'),
(13, 16, 27, '2023-06-12 18:36:27'),
(14, 17, 27, '2023-06-12 18:47:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `online` varchar(1) NOT NULL DEFAULT '0',
  `activation` varchar(3) NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `mobile`, `reg_time`, `online`, `activation`) VALUES
(17, 'test', 'test@gmail.com', 'test', '$5$rounds=535000$HZ9U9UbUnfV3iqZd$qBXki715zLQvu7z/vxYut23HXAcy5yZVzkHZMRVm08B', '99999999999', '2023-06-12 18:46:17', '1', 'yes'),
(16, 'Aman', 'aman@gmail.com', 'aman', '$5$rounds=535000$dmGhktgCtoxWbab.$EsIVH1JymgzYzef6ORRiCpCeB9hWXis95f0KoC8Zt60', '00000000000', '2023-06-09 10:56:36', '1', 'yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_level`
--
ALTER TABLE `product_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_view`
--
ALTER TABLE `product_view`
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
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `product_level`
--
ALTER TABLE `product_level`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `product_view`
--
ALTER TABLE `product_view`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
