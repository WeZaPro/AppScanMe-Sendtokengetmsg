-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 07, 2020 at 09:25 AM
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
-- Stand-in structure for view `count_product1`
-- (See below for the actual view)
--
CREATE TABLE `count_product1` (
`id` int(11)
,`token` varchar(400)
,`COUNT(*)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `qry_view`
-- (See below for the actual view)
--
CREATE TABLE `qry_view` (
`id` int(11)
,`token` varchar(400)
,`msg` varchar(400)
,`imgurl` varchar(400)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `qry_view1`
-- (See below for the actual view)
--
CREATE TABLE `qry_view1` (
`id` int(11)
,`products` varchar(100)
,`token` varchar(400)
,`msg` varchar(400)
);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL,
  `products` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `products`) VALUES
(1, 'productA'),
(2, 'productB'),
(3, 'productC');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_token_imgurl`
--

CREATE TABLE `tbl_token_imgurl` (
  `id` int(11) NOT NULL,
  `token` varchar(400) NOT NULL,
  `msg` varchar(400) NOT NULL,
  `imgurl` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_token_imgurl`
--

INSERT INTO `tbl_token_imgurl` (`id`, `token`, `msg`, `imgurl`) VALUES
(1, 'doM5Xuq3QROaPxRF34cZoI:APA91bGZ6kkkUw8sOIcAZ6Ox8WSOd1_qmVPBWvCnd8QjM3xW_u9kV_akXlYiqz4o5laog_eRnULt0n4r8ewy-9dZQXlbmcu_6LYek9Zn3S6EIND1Q2qorMily9KMXdNzB_bdxmW5b1yV', 'MSG1', 'URL1'),
(2, 'doM5Xuq3QROaPxRF34cZoI:APA91bGZ6kkkUw8sOIcAZ6Ox8WSOd1_qmVPBWvCnd8QjM3xW_u9kV_akXlYiqz4o5laog_eRnULt0n4r8ewy-9dZQXlbmcu_6LYek9Zn3S6EIND1Q2qorMily9KMXdNzB_bdxmW5b1yV', 'MSG2', 'URL2'),
(1, 'doM5Xuq3QROaPxRF34cZoI:APA91bGZ6kkkUw8sOIcAZ6Ox8WSOd1_qmVPBWvCnd8QjM3xW_u9kV_akXlYiqz4o5laog_eRnULt0n4r8ewy-9dZQXlbmcu_6LYek9Zn3S6EIND1Q2qorMily9KMXdNzB_bdxmW5b1yV', 'MSG3', 'URL3');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_token_msg`
--

CREATE TABLE `tbl_token_msg` (
  `id` varchar(100) NOT NULL,
  `token` varchar(400) NOT NULL,
  `msg` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `count_product1`
--
DROP TABLE IF EXISTS `count_product1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `count_product1`  AS  select `qry_view1`.`id` AS `id`,`qry_view1`.`token` AS `token`,count(0) AS `COUNT(*)` from `qry_view1` group by `qry_view1`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `qry_view`
--
DROP TABLE IF EXISTS `qry_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qry_view`  AS  select `tbl_token_imgurl`.`id` AS `id`,`tbl_token_imgurl`.`token` AS `token`,`tbl_token_imgurl`.`msg` AS `msg`,`tbl_token_imgurl`.`imgurl` AS `imgurl` from `tbl_token_imgurl` ;

-- --------------------------------------------------------

--
-- Structure for view `qry_view1`
--
DROP TABLE IF EXISTS `qry_view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qry_view1`  AS  select `tbl_token_imgurl`.`id` AS `id`,`tbl_product`.`products` AS `products`,`tbl_token_imgurl`.`token` AS `token`,`tbl_token_imgurl`.`msg` AS `msg` from (`tbl_product` join `tbl_token_imgurl` on((`tbl_token_imgurl`.`id` = `tbl_product`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_token_imgurl`
--
ALTER TABLE `tbl_token_imgurl`
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_token_imgurl`
--
ALTER TABLE `tbl_token_imgurl`
  ADD CONSTRAINT `tbl_token_imgurl_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tbl_product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
