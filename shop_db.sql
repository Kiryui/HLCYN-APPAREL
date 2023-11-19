-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2023 at 02:50 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `stock_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`, `stock_level`) VALUES
(88, 1, 2, 'pilay', 1500, 1, '384145140_865535071628160_5995092664845625738_n.jpg', 100),
(89, 1, 3, 'bubuyog', 123, 1, '376574142_6543891305646493_4995914280888400711_n.jpg', 111),
(90, 1, 1, 'Pepe', 123, 1, '376574142_6543891305646493_4995914280888400711_n.jpg', 100);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending',
  `options` int(11) NOT NULL,
  `stock_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`, `options`, `stock_level`) VALUES
(1, 1, 'Ralph', '1234', 'gervacioralph@yahoo.com', 'Cash-on Delivery', 'flat no. 1234, 1234, 1234, 1234, 1234 - 1234', 'Pepe (123 x 10) - ', 1230, '2023-10-21', '', 0, 0),
(2, 1, 'Ralph', '87000', 'gervacioralph@yahoo.com', 'Cash-on Delivery', 'flat no. 1.0, bacoor, bacoor, jupiter, america - 12345', 'Pepe (123 x 99) - ', 12177, '2023-10-22', 'completed', 0, 0),
(8, 1, '3q45234', '1234123', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 12341234, 2134, 1341234, 1234, 142342 - 123412', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(9, 1, '2e3r52345', '2345324', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 23452345, 123412, 341234, 12341234, 12341234 - 123412', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(10, 1, '234523', '23452345', '4524@23452345', 'Cash-on Delivery', 'flat no. 2345234, 2345234, 52345234, 52345, 5234 - 3245', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(11, 1, '21234', '1234123', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 41234, 12341234, 1234, 12341234, 1234 - 123412', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(12, 1, '1234', '1234', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1234, 12341234, 1234, 1234, 1234 - 123412', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(13, 1, '1234', '1234', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1234, 1234123, 1234, 1234, 1234 - 123412', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(14, 1, '12341234', '12341234', 'sample2@yahoo.com', 'Cash-on Delivery', 'flat no. 12341234, 12341234, 123412, 1234, 34123 - 123412', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(15, 1, 'Ralph', '123', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 123, 123, 123, 123, 123 - 123', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(16, 1, 'Ralph', '123', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 123, 123, 123, 123, 123 - 123', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(17, 1, '1234', '1234', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1234, 1234, 1234, 1q2324, 1234 - 1234', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(18, 1, 'Ralph', '123', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 123, 123, 123, 123, 123 - 123', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(19, 1, '', '', '', 'Cash-on Delivery', 'flat no. , , , ,  - ', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(20, 1, '1234', '1234', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1234, 1234, 1234, 1234, Philippines - 1234', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(21, 1, '1234', '1234', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1234, 1234, 1234, 1234, 1234 - 123', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(22, 1, 'Ralph', '1234', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1`2, `123, `123, `123, `23 - 1223', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(23, 1, '1234', '1234', 'sample2@yahoo.com', 'Cash-on Delivery', 'flat no. 1234, 1234, 1234, 1234, 1234 - 234', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(24, 1, '1234', '2134', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1234, 1234, 1234, 1234, 1234 - 1234', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(25, 1, '1234', '1234', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1234, 1234, 1234, 1234, q234 - 1234', 'Pepe (123 x 1) - pilay (1500 x 1) - ', 1623, '2023-10-22', 'pending', 0, 0),
(26, 1, '1234', '1234', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1234, 1234, 1234, 1234, 1234 - 1234', 'Pepe (123 x 1) - bubuyog (123 x 1) - pilay (1500 x 1) - ', 1746, '2023-10-22', 'pending', 0, 0),
(27, 1, '3245', '2345', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 3452, 2345, 234, 2345, 2345 - 2345', 'bubuyog (123 x 1) - pilay (1500 x 1) - ', 1623, '2023-10-22', 'pending', 0, 0),
(28, 1, '1234', '1234', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1234, 1234, 1234, 1234, 1234 - 1234', 'Pepe (123 x 1) - pilay (1500 x 1) - ', 1623, '2023-10-22', 'pending', 0, 0),
(29, 1, '1234', '1234', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1234, 1234, 1234, 1234, 1234 - 1234', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(30, 1, 'Ralph', '123', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 123, 123, 123, 123, 123 - 123', 'pilay (1500 x 1) - ', 1500, '2023-10-22', 'pending', 0, 0),
(31, 1, 'Ralph', '123', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 123, 123, 123, 123, 123 - 123', 'pilay (1500 x 1) - ', 1500, '2023-10-22', 'pending', 0, 0),
(32, 1, 'Ralph', '123', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 123, 123, 123, 123, 123 - 123', 'pilay (1500 x 1) - Pepe (123 x 1) - ', 1623, '2023-10-22', 'pending', 0, 0),
(33, 1, 'Ralph', '111', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 111, 111, 111, 111, 111 - 111', 'pilay (1500 x 1) - bubuyog (123 x 1) - ', 1623, '2023-10-22', 'pending', 0, 0),
(34, 1, 'Ralph', '1', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 111, 111, 111, 111, 111 - 111', 'pilay (1500 x 1) - bubuyog (123 x 1) - ', 1623, '2023-10-22', 'pending', 0, 0),
(35, 1, 'Ralph', '1', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1, 1, 1, 1, 1 - 1', 'Pepe (123 x 1) - ', 123, '2023-10-22', 'pending', 0, 0),
(36, 1, 'Ralph', '1', 'gervacioralph@yahoo.com', 'Cash-on Delivery', 'flat no. 1, 1, 1, 1, 1 - 1', 'pilay (1500 x 1) - ', 1500, '2023-10-22', 'pending', 0, 0),
(37, 1, 'Ralph', '1', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1, 111, 1, 1, 1 - 1', 'pilay (1500 x 1) - ', 1500, '2023-10-23', 'pending', 0, 0),
(38, 1, 'Ralph', '1', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1, 1, 1, 1, 1 - 1', 'pilay (1500 x 1) - ', 1500, '2023-10-23', 'pending', 0, 0),
(39, 1, 'Ralph', '1', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1, 1, 1, 1, 1 - 1', 'pilay (1500 x 1) - ', 1500, '2023-10-23', 'pending', 0, 0),
(40, 1, 'Ralph', '1', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1, 1, 1, 1, 1 - 1', 'pilay (1500 x 1) - ', 1500, '2023-10-23', 'pending', 0, 0),
(41, 1, 'Ralph', '1', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1, 1234, 1, 123, 1 - 1', 'pilay (1500 x 1) - ', 1500, '2023-10-23', 'pending', 0, 0),
(42, 1, 'Ralph', '1', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1, 1, 1, 1, 1 - 1', 'bubuyog (123 x 1) - ', 123, '2023-10-23', 'pending', 0, 0),
(43, 1, 'Ralph', '1', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1, 1, 1, 1, 1 - 1', 'bubuyog (123 x 1) - ', 123, '2023-10-23', 'pending', 0, 0),
(44, 1, 'Ralph', '1', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1, 1, 1, 1, 1 - 1', 'bubuyog (123 x 1) - ', 123, '2023-10-23', 'pending', 0, 0),
(45, 1, 'Ralph', '1', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1, 1, 1, 1, 1 - 1', 'bubuyog (123 x 1) - ', 123, '2023-10-23', 'pending', 0, 0),
(46, 1, 'Ralph', '1', 'gervacioralph@yahoo.com', 'Cash-on Delivery', 'flat no. 1, 1, 1, 1, 1 - 1', 'bubuyog (123 x 1) - ', 123, '2023-10-23', 'pending', 0, 0),
(47, 1, 'Ralph', '1', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1, 1, 1, 1, 1 - 1', 'bubuyog (123 x 1) - ', 123, '2023-10-23', 'pending', 0, 0),
(48, 1, 'ako123', '123123', 'ako123@ytahooasd', 'Cash-on Delivery', 'flat no. 12312, 1212123, asdsad, dfaasdff, dfffa - 234312', 'pilay (1500 x 1) - bubuyog (123 x 1) - ', 1623, '2023-10-23', 'pending', 0, 0),
(49, 1, 'sdaasdads', '124213', 'asasdasd@yaaasfdads', 'Cash-on Delivery', 'flat no. 123123, adsas, 12312adsasd, sdaads, asdasd - 21231', 'Pepe (123 x 1) - ', 123, '2023-10-23', 'pending', 0, 0),
(50, 1, 'no load', '12312', 'asdad@asdasd', 'Cash-on Delivery', 'flat no. 123123, asdasd, fsdsdf, dsfasddsa, adsasd - 324534', 'Pepe (123 x 1) - pilay (1500 x 1) - ', 1623, '2023-10-23', 'pending', 0, 0),
(51, 1, 'asdads', '231321', 'asddas@das', 'Cash-on Delivery', 'flat no. asddas, adsdas, asdasd, asdasd, asddas - 232', 'Pepe (123 x 1) - ', 123, '2023-10-23', 'pending', 0, 0),
(52, 1, 'Ralph323', '23344123', 'gervacioralph@yahoo.com', 'Cash-on Delivery', 'flat no. 23, 32, 23, 23, 23 - 23', 'bubuyog (123 x 1) - ', 123, '2023-10-23', 'pending', 0, 0),
(53, 1, 'sdaads', '123', 'sdadas@asdads', 'Cash-on Delivery', 'flat no. asdasd, asdas, dasasd, sda, america - 213', 'bubuyog (123 x 1) - ', 123, '2023-10-23', 'pending', 0, 0),
(54, 1, 'asddas', '12123', 'dasda12@asda', 'Cash-on Delivery', 'flat no. dfss, dasd, asas, asdasd, asdads - 23', 'Pepe (123 x 1) - ', 123, '2023-10-23', 'pending', 0, 0),
(55, 1, 'admin', '1', 'orange@yahoo.com', 'Cash-on Delivery', 'flat no. 1, 1, 1, 1, 1 - 1', 'pilay (1500 x 1) - ', 1500, '2023-10-23', 'pending', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL,
  `stock_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`, `stock_level`) VALUES
(1, 'Pepe', '123', 123, '376574142_6543891305646493_4995914280888400711_n.jpg', '376574142_6543891305646493_4995914280888400711_n.jpg', '376574142_6543891305646493_4995914280888400711_n.jpg', 100),
(2, 'pilay', 'pilay', 1500, '384145140_865535071628160_5995092664845625738_n.jpg', '384145140_865535071628160_5995092664845625738_n.jpg', '384145140_865535071628160_5995092664845625738_n.jpg', 100),
(3, 'bubuyog', '1234', 123, '376574142_6543891305646493_4995914280888400711_n.jpg', '376574142_6543891305646493_4995914280888400711_n.jpg', '376574142_6543891305646493_4995914280888400711_n.jpg', 111);

-- --------------------------------------------------------

--
-- Table structure for table `stockman`
--

CREATE TABLE `stockman` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockman`
--

INSERT INTO `stockman` (`id`, `name`, `password`) VALUES
(1, 'stockman', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'OrangeCutiePie', 'orange@yahoo.com', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `stock_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
