-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 05, 2020 at 02:51 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `token_send_noti_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_token_imgurl`
--

CREATE TABLE `tbl_token_imgurl` (
  `id` int(100) NOT NULL,
  `token` varchar(400) NOT NULL,
  `msg` varchar(400) NOT NULL,
  `imgurl` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_token_imgurl`
--

INSERT INTO `tbl_token_imgurl` (`id`, `token`, `msg`, `imgurl`) VALUES
(1, 'cggan-tcTHO-kU4YxudNvE:APA91bGxm458MK7K4a1GxgAd8nBsqEp4nqDKXBGO4Zw2htdH0KJQ0Z2vTWMcmyLC4UAjC6WEByHiqATjPG7fJnzvXfdbwVvfwlDdIheSuuSGESqeA79kuxL90_UXCLz-CV34aWWD4W8K', 'test Message 0001', 'https://ukhuwahislamiah.com/wp-content/uploads/2017/10/butterfly_flower_01_hd_pictures_166973.jpg'),
(2, 'cggan-tcTHO-kU4YxudNvE:APA91bGxm458MK7K4a1GxgAd8nBsqEp4nqDKXBGO4Zw2htdH0KJQ0Z2vTWMcmyLC4UAjC6WEByHiqATjPG7fJnzvXfdbwVvfwlDdIheSuuSGESqeA79kuxL90_UXCLz-CV34aWWD4W8K', 'Test Message 002', 'https://s.ftcdn.net/v2013/pics/all/curated/RKyaEDwp8J7JKeZWQPuOVWvkUjGQfpCx_cover_580.jpg?r=1a0fc22192d0c808b8bb2b9bcfbf4a45b1793687');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_token_imgurl`
--
ALTER TABLE `tbl_token_imgurl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_token_imgurl`
--
ALTER TABLE `tbl_token_imgurl`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
