-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 10, 2019 at 04:21 PM
-- Server version: 8.0.17
-- PHP Version: 7.1.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amazon_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_account`
--

CREATE TABLE `bank_account` (
  `total_balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bank_account`
--

INSERT INTO `bank_account` (`total_balance`) VALUES
(667),
(29);

-- --------------------------------------------------------

--
-- Table structure for table `da_bank_statements`
--

CREATE TABLE `da_bank_statements` (
  `id` int(11) NOT NULL,
  `transaction_amount` mediumint(17) NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_time` time DEFAULT NULL,
  `transaction_item` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `old_item_stock` int(11) DEFAULT NULL,
  `transaction_quantity` int(11) DEFAULT NULL,
  `updated_stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `da_bank_statements`
--

INSERT INTO `da_bank_statements` (`id`, `transaction_amount`, `transaction_date`, `transaction_time`, `transaction_item`, `old_item_stock`, `transaction_quantity`, `updated_stock`) VALUES
(1, 115, NULL, NULL, '', NULL, NULL, NULL),
(2, 1, NULL, NULL, '', NULL, NULL, NULL),
(3, 1, NULL, NULL, '', NULL, NULL, NULL),
(4, 1, NULL, NULL, '', NULL, NULL, NULL),
(5, 1, NULL, NULL, '', NULL, NULL, NULL),
(6, 1, NULL, NULL, '', NULL, NULL, NULL),
(7, 234, NULL, NULL, '', NULL, NULL, NULL),
(8, 1990, NULL, NULL, '', NULL, NULL, NULL),
(9, 1, NULL, NULL, '', NULL, NULL, NULL),
(10, 5, NULL, NULL, '', NULL, NULL, NULL),
(11, 5, NULL, NULL, '', NULL, NULL, NULL),
(12, 1, NULL, NULL, '', NULL, NULL, NULL),
(13, 1, NULL, NULL, '', NULL, NULL, NULL),
(14, 25, NULL, NULL, '', NULL, NULL, NULL),
(15, 25, NULL, NULL, '', NULL, NULL, NULL),
(16, 1, NULL, NULL, 'gumball', NULL, NULL, NULL),
(17, 1, NULL, NULL, 'gumball', 1758, 1, 1757),
(18, 51533, NULL, NULL, 'candles', 1357, 1567, -210),
(19, 17500, NULL, NULL, 'macbook', 498, 498, 0),
(20, 4000, NULL, NULL, 'macbook', 3500, 2, 3498),
(21, 928, NULL, NULL, 'candles', 7000, 32, 6968),
(22, 1305, NULL, NULL, 'candles', 6968, 45, 6923),
(23, 2000, NULL, NULL, 'macbook', 0, 0, 0),
(24, 8000000, NULL, NULL, 'macbook', 3000, 3000, 0),
(25, 22793, NULL, NULL, 'Macbook Pro', 4000, 12, 3988),
(26, 1, NULL, NULL, 'Gumball', 1757, 1, 1756),
(27, 319, NULL, NULL, 'Bananas', 1500, 367, 1133),
(28, 1, '2019-09-09', '16:49:14', 'Gumball', 1756, 1, 1755),
(29, 1, '2019-09-09', '16:52:13', 'Gumball', 1755, 1, 1754),
(30, 1, '2019-09-09', '16:54:11', 'Gumball', 1754, 1, 1753),
(31, 3997, '2019-09-09', '17:02:40', 'Monitors', 1999, 20, 1979),
(32, 393744, '2019-09-09', '17:05:56', 'Monitors', 1979, 1970, 9),
(33, 1999, '2019-09-09', '17:06:09', 'Monitors', 9, 9, 0),
(34, 200, '2019-09-09', '17:06:23', 'Monitors', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(11) NOT NULL,
  `product_name` text NOT NULL,
  `dept_name` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `product_name`, `dept_name`, `price`, `quantity`) VALUES
(10, 'Gumball', 'Food', '0.56', 1753),
(11, 'Coffee', 'Food', '13.44', 1498),
(12, 'Candles', 'Housewares', '23.74', 6922),
(13, 'Macbook Pro', 'Electronics', '1899.42', 3988),
(14, 'Monitors', 'Electronics', '199.87', 2000),
(15, 'Football', 'Sport', '12.45', 420),
(16, 'Bat', 'Sport', '19.99', 8),
(17, 'Dog Food', 'Pet_Food', '17.99', 2000),
(18, 'Bananas', 'Food', '0.87', 1133),
(19, 'Silverware', 'Housewares', '8.99', 2000),
(20, 'Canon Mark II', 'Electronics', '2000.99', 200),
(21, 'Speakers', 'Electronics', '167.33', 500),
(22, 'Baseball', 'Sport', '2.99', 2000),
(23, 'Athletic Tape', 'Sport', '6.78', 1200);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `da_bank_statements`
--
ALTER TABLE `da_bank_statements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `da_bank_statements`
--
ALTER TABLE `da_bank_statements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
