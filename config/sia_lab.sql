-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2025 at 11:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sia_lab`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `unit_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('stock','pending','low_stock') DEFAULT 'stock',
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff`
--

CREATE TABLE `tbl_staff` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff_id` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `age` int(10) UNSIGNED DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_staff`
--

INSERT INTO `tbl_staff` (`id`, `staff_id`, `password`, `first_name`, `middle_name`, `last_name`, `position`, `address`, `age`, `start_date`, `salary`) VALUES
(1, '1213213', '$2y$10$aRw9xYR1JsFa1QV1sMc0MOLcfBE08JFwL.qQ6wgaw13c7BcREJErC', 'staff1', 'staff', 'staff', 'wadad', 'adad', 20, '2025-07-25', 0.02),
(2, '121321333', '$2y$10$I4DC.sMqY8GnF..YY5QeQOgv8Ajuq2YziS6xwt5CwEPZd23yZd8um', 'staff1', 'staff', 'staff', 'wadad', 'adad', 20, '2025-07-25', 0.02),
(3, '12345', '$2y$10$WIuLQVd7bEuhTGjGIsqKE.YW4GN82HWfzTQfJtHQBWD4jrbQLS0ym', 'staff1', 'staff', 'staff', 'wadad', 'adad', 20, '2025-07-25', 0.02),
(4, '1234567', '$2y$10$C0uDYWFedKCQNAZv2/czmem3hIX555QCtQuWaEUiV8Y0PJVNXtgIG', 'ad', 'adad', 'adad', 'wadad', 'adad', 18, '2025-07-16', 0.01),
(5, '1213213213', '$2y$10$Y6q/nTlEVrC2govd1pe/OuDmXO2gbHi272dr4nK3xDiD4c8ogZ2aG', 'staff1', 'adad', 'staff', 'wadad', 'adad', 18, '2025-08-01', 0.01),
(6, '1213213333', '$2y$10$vtTCondAjiu4SzFQj4lfY.RbEeZftZHkndMYRU/yTqsgaXB.wSyNO', 'awdad', 'adad', 'adad', 'wadad', 'adad', 18, '2025-07-24', 0.02),
(7, '54321', '$2y$10$oHWisgxRNLF7ZiEE8mdgpetAZoduZDcd/IdoPTCY8TIfnitZtHVza', 'adrian', 'curry', 'matsu', '69', 'adwqa', 59, '2025-07-23', 1000.00),
(8, '586366', '$2y$10$cgZ90fWIxQABYd8/.1MjMOXh7o1GsoZa5tagGZq/0p8xBZsOGRwW.', 'ad', 'staff', 'wad', 'wadad', 'adad', 18, '2025-07-31', 0.01),
(9, '2023', '$2y$10$nXWPU5rWNIYd5yOkiUzmb.Ttyle5Lizu1ps1A2FOp5wlMKgg1CTYm', 'dave', 'buscay', 'magno', 'hr', 'dwadwad', 18, '2025-07-25', 10000.00),
(10, '2023-56883', '$2y$10$.ZLp1Ea5LbRONWjpUdamb.lnv8rS1N7FQgsl6XOX3hIDVjs4z2HHW', 'dave', 'buscay', 'magno', 'wadad', 'adad', 18, '2025-07-24', 0.02),
(11, '123456789000', '$2y$10$YPZ2CQr8mMHiTZ6PCejLPuhl6QgQyg21BXjO1TwAa.ac2qtAPIUni', 'john', 'doe', 'doe', 'dadwad', 'awdad', 20, '2025-07-23', 0.11),
(12, '123456788', '$2y$10$ut2cDZC7r4e9Sp16Bk9wEe3Tyt9wpmHve8O.j.clCF3DA4o7QSo0q', 'ad', 'staff', 'magno', '69', 'adwqa', 18, '2025-07-25', 0.05),
(14, '56883-2203', '$2y$10$4EbEXBOtDkXpYVYYJTOfR.XS/xfViDM8kzaeo39449YKV9AM4B0X2', 'staff1', 'curry', 'staff', 'qe2qe', 'dwadwad', 18, '2025-07-23', 0.01),
(15, '52366-5555', '$2y$10$sDeM3bKlK3YHZHBvEPdY/O8LmBXhPyCn.cHE1DBpSq1ippr1BgsXC', 'hello', 'dave', 'magno', 'any', 'thing', 18, '2025-07-16', 0.01),
(16, '789456', '$2y$10$jtbj4WRYnY4InmAM9E/tTuNxwirZpp94H.GbWeDnjx9c4bTPQ4ZUC', 'DaveMagno2730', 'DaveMagno2730', 'DaveMagno2730', 'DaveMagno2730', 'DaveMagno2730', 18, '2025-07-23', 0.01),
(17, '58999999', '$2y$10$Ko9vttd0bS4295TH0bU7C.E2fis7OBx3ZAD6jBEE5zqBM./ZX7bdO', 'adwa', 'awdawd', 'adwad', 'awdwad', 'awdawd', 18, '2025-07-18', 0.01),
(20, '1234567890', '$2y$10$4zX/3.qZHqbk3UhFy01beekk75UUQlIgSmORDtnJGRX4CvV7O6816', 'ad', 'curry', 'dwad', 'any', 'dwadwad', 19, '2025-07-16', 0.01),
(21, '5688883', '$2y$10$Hcn1Gg8OG6cyeuwrjyQuOOWWoQxgMq7.AaUDQqhRHa/69s8PMPFPO', 'doguh', 'nut', 'due', '69', 'daveadwad', 19, '2005-11-05', 100000.00),
(22, '123458488484', '$2y$10$E6KVzZZydlq5KXh9w4KrKOVn/Flq7nFKhbLgfM1LXk1ZLmoBbrM0W', 'dave', 'buscay', 'magno', '69', 'dad', 23, '2001-11-02', 588888.00),
(23, '56883-2024', '$2y$10$WWVT.tI5oAhTukG/DwjEj.2tjoH3VUcAZ5m/6Tkfd/rnKOV3VBym2', 'dough', 'nut', 'cole', '60', 'daereds', 23, '2003-11-02', 200555.00),
(24, '123456677', '$2y$10$liVRSeiu80wKQ3H20P6.hOfB.mAxieO7pb7XSef93GXzHnBqrzAzO', 'dave', 'awdad', 'adawd', 'd', 'dadwad', 18, '2025-07-17', 0.01),
(25, '1232344', '$2y$10$MHYZdYJk4fM6FFfpvumnTeLaBispTCXOPq5W8Cojkhp/Kes6hoEry', 'dave', 'adad', 'adad', '69', 'adwqa', 18, '2025-07-25', 0.02),
(26, 'awdawd', '$2y$10$eienDy8SYAd7QfzodeNulOhAuFf9FlfCnciwzMto7ZWDduBteiIpG', 'adwadad', 'wawdawd', 'awadaw', 'dadwad', 'adwad', 18, '2025-07-25', 0.05),
(27, '12345799449', '$2y$10$95MZu82uNDg69ZbcfgvO7uVnBefjGCQ1vsdHyCCi7FTm0PGaVBXWC', 'Adadwa', 'dawdad', 'wadad', 'adwad', 'awdwadw', 21, '2025-07-24', 232333.00),
(28, '56883', '$2y$10$JUCcYX2o8dyrJblZ1yvl7eJC6xvzpPPW.IWfR7cBJdFjRSvoMnlbO', 'dave', 'curry', 'staff', 'wadad', 'dawd', 21, '2025-07-17', 12313.00),
(29, '100000', '$2y$10$d/J9ftT5ILqxtJ7/vhM5yu49tZJZhW1OQaxBjPbGzhvDPWXl45UIq', 'dave', 'oed', 'oed', 'oed', 'doe', 24, '5555-02-02', 10000000.00),
(30, '596666', '$2y$10$ZOzKguwsbwV79Sb8Gwk3tuHm2qfXUUi3E5frDR3IONvgkyKpQWYV2', 'john', 'doe', 'malakas', '69', 'adawdad', 21, '2025-07-16', 20000.00),
(31, '202222', '$2y$10$0RtCO3gChBtISBp1QrUCY.O1yv/D3j04bKmRqCTUOgmdpgrEsSos6', 'donny', 'macho', 'echano', '69', 'dadwad', 95, '2005-05-27', 1000000.00),
(33, '56223', '$2y$10$Ms1sk3yqPginEIEL6ZSlE.v36fWVsyYTYjlGFet93PnNjrHZD0m2C', 'dadad', 'adad', 'dadw', 'adw', 'adwawd', 19, '2002-01-05', 2000.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff_logs`
--

CREATE TABLE `tbl_staff_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `action` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_staff_logs`
--

INSERT INTO `tbl_staff_logs` (`id`, `staff_id`, `action`, `description`, `ip_address`, `created_at`) VALUES
(1, 33, 'LOGIN', 'Staff logged in successfully', '::1', '2025-07-04 15:17:23');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','staff') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `password`, `role`) VALUES
(1234, 'staff', 'staff123', 'staff'),
(56883, 'admin', 'admin123', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_code` (`product_code`);

--
-- Indexes for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`);

--
-- Indexes for table `tbl_staff_logs`
--
ALTER TABLE `tbl_staff_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_staff_logs`
--
ALTER TABLE `tbl_staff_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56884;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_staff_logs`
--
ALTER TABLE `tbl_staff_logs`
  ADD CONSTRAINT `tbl_staff_logs_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `tbl_staff` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
