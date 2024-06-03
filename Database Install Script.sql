-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 31, 2024 at 02:41 AM
-- Server version: 5.7.24
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cst451`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact_name` varchar(50) NOT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zipcode` varchar(5) DEFAULT NULL,
  `salesman_id` int(11) DEFAULT NULL,
  `salesman_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `contact_name`, `contact_phone`, `address1`, `address2`, `city`, `state`, `zipcode`, `salesman_id`, `salesman_name`) VALUES
(1, 'Complete Concrete Inc', 'Bob Rock', NULL, '123 Concrete Drive', 'Suite 12', 'Norfolk', 'VA', '13487', 348291, 'Jimmy Concrete Jr.'),
(2, 'Complete Concrete', 'Bill Granite', '281-249-3258', '123 Concrete Lane', NULL, NULL, NULL, '28249', 0, NULL),
(5, 'National Pavement Assoc.', 'Helen Concrete', NULL, '452 Pavement Rd', 'Office 5', 'Phoenix', 'AZ', '85412', 381291, 'Bob Bobby'),
(29, 'Test Customer', 'John Doe', NULL, '123 Main St', 'Suite 123', 'Anyville', 'AZ', '85251', 123456, 'Mark Jacobs'),
(201, 'Test Customer 1', 'Test Contact', NULL, '123 Main St', 'Suite 2', 'Anytown', 'AZ', '85215', 12345, 'Bob Smith');

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `data_id` int(11) NOT NULL,
  `report_id` int(11) DEFAULT NULL,
  `column_definition` varchar(500) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data_row`
--

CREATE TABLE `data_row` (
  `data_row_id` int(11) NOT NULL,
  `data_id` int(11) DEFAULT NULL,
  `data_detail` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_payroll`
--

CREATE TABLE `employee_payroll` (
  `employee_payroll_id` int(11) NOT NULL,
  `time_period` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `hours_worked` double DEFAULT NULL,
  `total_pay` double DEFAULT NULL,
  `regular_pay` double DEFAULT NULL,
  `overtime_pay` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `expense_id` int(11) NOT NULL,
  `time_period_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `date_paid` date DEFAULT NULL,
  `total_cost` double DEFAULT NULL,
  `tax_cost` double DEFAULT NULL,
  `expense_cost` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `time_period_from_id` int(11) DEFAULT NULL,
  `time_period_to_id` int(11) DEFAULT NULL,
  `customer_ids` varchar(250) DEFAULT NULL,
  `types` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `revenue`
--

CREATE TABLE `revenue` (
  `revenue_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `time_period_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `date_received` date DEFAULT NULL,
  `total_revenue` double DEFAULT NULL,
  `adjustment_amount` double DEFAULT NULL,
  `adjustment_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `time_period`
--

CREATE TABLE `time_period` (
  `time_period_id` int(11) NOT NULL,
  `display_period` varchar(50) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `time_period`
--

INSERT INTO `time_period` (`time_period_id`, `display_period`, `from_date`, `to_date`) VALUES
(7, '2024 FQ1', '2024-01-01', '2024-03-31'),
(8, '2024 FQ2', '2024-04-01', '2024-06-30'),
(13, '2024 FQ3', '2024-07-01', '2024-09-30'),
(33, '2024 FQ4', '2024-10-01', '2024-12-31'),
(34, '2023 FQ1', '2023-01-01', '2023-03-31'),
(35, '2023 FQ2', '2023-04-01', '2023-06-30'),
(36, '2023 FQ3', '2023-07-01', '2023-09-30'),
(37, '2023 FQ4', '2023-10-01', '2023-12-31'),
(38, '2022 FQ1', '2022-01-01', '2022-03-31'),
(39, '2022 FQ2', '2022-04-01', '2022-06-30'),
(40, '2022 FQ3', '2022-07-01', '2022-09-30');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(50) DEFAULT NULL,
  `type_category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`type_id`, `type_name`, `type_category`) VALUES
(2, 'Service Call', 'Revenue'),
(3, 'Subscription Services', 'Revenue'),
(4, 'Emergency Service', 'Revenue'),
(5, 'Installations', 'Revenue'),
(6, 'Rent', 'Expense'),
(9, 'Expense', 'Report'),
(10, 'Revenue', 'Report'),
(11, 'Customer', 'Report'),
(12, 'Payroll', 'Report'),
(25, 'Overcharge', 'Adjustment'),
(26, 'Currency Exchange', 'Adjustment'),
(27, 'Server Cost', 'Expense'),
(32, 'Utility', 'Expense'),
(209, 'Late Delivery', 'Adjustment');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password_hash` varchar(100) DEFAULT NULL,
  `account_type` varchar(1) DEFAULT NULL,
  `hire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `name`, `email`, `password_hash`, `account_type`, `hire_date`) VALUES
(1, 'janesmith', 'Jane R. Smith', 'janesmith@company.com', '$2a$10$MsO13ZGaIgKNJvMg1BPRIeM4BVgeacebH4wp/y3TusOt.Aoh9xg8O', 'R', '2021-01-01'),
(31, 'bobsmith', 'Bob Smith', 'bobsmith@company.com', '$2a$10$A0daPridjRiU0jnTnXmkc.Nqny5chd/7aWvl/2zCsBhnryhyZfjKa', 'A', '2024-03-06'),
(1000, 'johndoe', 'John Doe Sr.', 'johndoe@company.com', '$2a$10$tZYMejv31pAQP3c5IsCwcOGHwxgK9XHtuQUmXes4tUjDgNCKGrgKK', 'R', '2024-02-14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`data_id`),
  ADD KEY `report_data_id_idx` (`report_id`);

--
-- Indexes for table `data_row`
--
ALTER TABLE `data_row`
  ADD PRIMARY KEY (`data_row_id`),
  ADD KEY `data_id_row_id_idx` (`data_id`);

--
-- Indexes for table `employee_payroll`
--
ALTER TABLE `employee_payroll`
  ADD PRIMARY KEY (`employee_payroll_id`),
  ADD KEY `time_period_idx` (`time_period`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `time_period_idx` (`time_period_id`),
  ADD KEY `type_idx` (`type_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `type_id_idx` (`type_id`),
  ADD KEY `time_period_id_idx1` (`time_period_to_id`),
  ADD KEY `time_period_id_idx` (`time_period_from_id`);

--
-- Indexes for table `revenue`
--
ALTER TABLE `revenue`
  ADD PRIMARY KEY (`revenue_id`),
  ADD KEY `time_period_id_idx` (`time_period_id`),
  ADD KEY `customer_id_idx` (`customer_id`),
  ADD KEY `type_id_idx` (`type_id`),
  ADD KEY `adjustment_type_id_idx` (`adjustment_type_id`);

--
-- Indexes for table `time_period`
--
ALTER TABLE `time_period`
  ADD PRIMARY KEY (`time_period_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_row`
--
ALTER TABLE `data_row`
  MODIFY `data_row_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_payroll`
--
ALTER TABLE `employee_payroll`
  MODIFY `employee_payroll_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revenue`
--
ALTER TABLE `revenue`
  MODIFY `revenue_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_period`
--
ALTER TABLE `time_period`
  MODIFY `time_period_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data`
--
ALTER TABLE `data`
  ADD CONSTRAINT `report_data_id` FOREIGN KEY (`report_id`) REFERENCES `report` (`report_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `data_row`
--
ALTER TABLE `data_row`
  ADD CONSTRAINT `data_id_row_id` FOREIGN KEY (`data_id`) REFERENCES `data` (`data_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee_payroll`
--
ALTER TABLE `employee_payroll`
  ADD CONSTRAINT `time_period_emp_pay` FOREIGN KEY (`time_period`) REFERENCES `time_period` (`time_period_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `time_period` FOREIGN KEY (`time_period_id`) REFERENCES `time_period` (`time_period_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `type` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `time_period_from_id` FOREIGN KEY (`time_period_from_id`) REFERENCES `time_period` (`time_period_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `time_period_to_id` FOREIGN KEY (`time_period_to_id`) REFERENCES `time_period` (`time_period_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `type_id` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `revenue`
--
ALTER TABLE `revenue`
  ADD CONSTRAINT `adjType` FOREIGN KEY (`adjustment_type_id`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `revType` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `timePeriod` FOREIGN KEY (`time_period_id`) REFERENCES `time_period` (`time_period_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
