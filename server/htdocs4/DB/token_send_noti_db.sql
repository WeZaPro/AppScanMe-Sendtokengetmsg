-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 09, 2020 at 02:27 PM
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
,`products` varchar(100)
,`msg` varchar(400)
,`imag_url` varchar(400)
,`COUNT(*)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `qry_view`
-- (See below for the actual view)
--
CREATE TABLE `qry_view` (
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
-- Stand-in structure for view `qry_view2`
-- (See below for the actual view)
--
CREATE TABLE `qry_view2` (
`id` int(11)
,`token` varchar(400)
,`msg` varchar(400)
,`products` varchar(100)
,`imag_url` varchar(400)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `qry_view3`
-- (See below for the actual view)
--
CREATE TABLE `qry_view3` (
`id` int(11)
,`token` varchar(400)
,`msg` varchar(400)
,`products` varchar(100)
,`imag_url` varchar(400)
,`COUNT(*)` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL,
  `products` varchar(100) NOT NULL,
  `imag_url` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `products`, `imag_url`) VALUES
(1, 'P0001', 'https://s.ftcdn.net/v2013/pics/all/curated/RKyaEDwp8J7JKeZWQPuOVWvkUjGQfpCx_cover_580.jpg?r=1a0fc22192d0c808b8bb2b9bcfbf4a45b1793687\r\n'),
(2, 'P0002', 'https://iso.500px.com/wp-content/uploads/2017/08/500px_Class_Quest_Sharon_Wan.jpg\r\n'),
(3, 'P0003', 'https://thumbs-prod.si-cdn.com/MkjHhbZiGnsl4MNFctWTlJJrxyk=/fit-in/1072x0/https://contest-public-media.si-cdn.com/90963cc1dc7b78f6afafd9494026f0e3fc439ed2.jpg\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_token_imgurl`
--

CREATE TABLE `tbl_token_imgurl` (
  `id` int(11) NOT NULL,
  `token` varchar(400) NOT NULL,
  `msg` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_token_imgurl`
--

INSERT INTO `tbl_token_imgurl` (`id`, `token`, `msg`) VALUES
(1, 'fOGF3c9vTcOgaeXEPx-Ntf:APA91bFnkn0dzUR_GsdjN7UxShQ0pSYe3QYg561Gnj5m9KdUw8zuTrA1TN-lpS7QRrJQfYzjmCHEfOLObgwES3LZYpxCEGCZdI4jXIbst68ctKvkLamFDHk_PpozYFMgKchpfYmj15Ne', '111'),
(1, 'dGBQ45k8QnerH5WobAQakK:APA91bF9JK6zdUcMKODASNM_Tl2z7FACOpaYeGhpW3F2ntd35JADQiw0QSQeNG-p5umtMXDNCqjl9J71wIw3HJW3k54IULsz0OQeUfJx7cMXpkK_WzAV3DZtbxf58G1TI_LV6nFfThDw', '11111'),
(1, 'fOGF3c9vTcOgaeXEPx-Ntf:APA91bFnkn0dzUR_GsdjN7UxShQ0pSYe3QYg561Gnj5m9KdUw8zuTrA1TN-lpS7QRrJQfYzjmCHEfOLObgwES3LZYpxCEGCZdI4jXIbst68ctKvkLamFDHk_PpozYFMgKchpfYmj15Ne', '2222'),
(3, 'dGBQ45k8QnerH5WobAQakK:APA91bF9JK6zdUcMKODASNM_Tl2z7FACOpaYeGhpW3F2ntd35JADQiw0QSQeNG-p5umtMXDNCqjl9J71wIw3HJW3k54IULsz0OQeUfJx7cMXpkK_WzAV3DZtbxf58G1TI_LV6nFfThDw', '3333');

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `count_product1`  AS  select `qry_view2`.`id` AS `id`,`qry_view2`.`token` AS `token`,`qry_view2`.`products` AS `products`,`qry_view2`.`msg` AS `msg`,`qry_view2`.`imag_url` AS `imag_url`,count(0) AS `COUNT(*)` from `qry_view2` group by `qry_view2`.`id` ;

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

-- --------------------------------------------------------

--
-- Structure for view `qry_view2`
--
DROP TABLE IF EXISTS `qry_view2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qry_view2`  AS  select `tbl_token_imgurl`.`id` AS `id`,`tbl_token_imgurl`.`token` AS `token`,`tbl_token_imgurl`.`msg` AS `msg`,`tbl_product`.`products` AS `products`,`tbl_product`.`imag_url` AS `imag_url` from (`tbl_product` join `tbl_token_imgurl` on((`tbl_token_imgurl`.`id` = `tbl_product`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `qry_view3`
--
DROP TABLE IF EXISTS `qry_view3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qry_view3`  AS  select `tbl_token_imgurl`.`id` AS `id`,`tbl_token_imgurl`.`token` AS `token`,`tbl_token_imgurl`.`msg` AS `msg`,`tbl_product`.`products` AS `products`,`tbl_product`.`imag_url` AS `imag_url`,count(0) AS `COUNT(*)` from (`tbl_product` join `tbl_token_imgurl` on((`tbl_token_imgurl`.`id` = `tbl_product`.`id`))) ;

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
