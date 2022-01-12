-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 27, 2020 at 12:57 PM
-- Server version: 5.7.28-0ubuntu0.19.04.2
-- PHP Version: 7.2.24-0ubuntu0.19.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `health_care_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `appointment_patient_id` varchar(255) NOT NULL,
  `appointment_doctor_id` varchar(255) NOT NULL,
  `appointment_date` varchar(255) NOT NULL,
  `appointment_time` varchar(255) NOT NULL,
  `appointment_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `appointment_patient_id`, `appointment_doctor_id`, `appointment_date`, `appointment_time`, `appointment_description`) VALUES
(1, '1', '1', '27 November,2020', 'asdf', 'asdf'),
(2, '1', '1', '27 November,2020', 'asdf', 'asdf'),
(3, '1', '3', '12 November,2020', 'sdfg', 'sdfgdfsg'),
(4, '1', '3', '12 November,2020', 'sdfg', 'sdfgdfsg'),
(5, '1', '3', '11 November,2020', 'dasfa', 'sdf');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(10) UNSIGNED NOT NULL,
  `city_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`) VALUES
(1, 'Mumbai'),
(2, 'Delhi'),
(3, 'Chenai'),
(4, 'Banglore'),
(5, 'Varanasi'),
(6, 'Kolkatta');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'India'),
(2, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`) VALUES
(1, 'Query Solvers'),
(2, 'Farming Assistance '),
(3, 'patient Support'),
(4, 'Farming Experts');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL,
  `doctor_email` varchar(255) NOT NULL,
  `doctor_name` varchar(255) NOT NULL,
  `doctor_fees` varchar(255) NOT NULL,
  `doctor_qualification` varchar(255) NOT NULL,
  `doctor_contact` varchar(255) NOT NULL,
  `doctor_image` varchar(255) NOT NULL,
  `doctor_address` varchar(255) NOT NULL,
  `doctor_specialization` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `doctor_email`, `doctor_name`, `doctor_fees`, `doctor_qualification`, `doctor_contact`, `doctor_image`, `doctor_address`, `doctor_specialization`) VALUES
(1, 'dr@gmail.com', 'Dr Ram', '600', 'MD', '2000', '1.jpeg', 'You also have the ability to select different types of addresses. You can add an address as your default address, or select it as only a shipping or only a billing address. \r\n', 'Eye'),
(2, 'dr@gmail.com', 'Dr Shivani', '1100', 'MD', '500', '2.jpeg', 'You also have the ability to select different types of addresses. You can add an address as your default address, or select it as only a shipping or only a billing address. \r\n', 'ENT\r\n'),
(3, 'dr@gmail.com', 'Dr Kamal', '550', 'MD', '123456789', '3.jpeg', 'You also have the ability to select different types of addresses. You can add an address as your default address, or select it as only a shipping or only a billing address. \r\n', 'Medicine'),
(4, 'dr@gmail.com', 'Dr Shiv', '1200', 'MD', '123456789', '4.jpeg', 'You also have the ability to select different types of addresses. You can add an address as your default address, or select it as only a shipping or only a billing address. \r\n', 'Lungs'),
(5, 'dr@gmail.com', 'Dr Amita', '400', 'MD', '123456789', '5.jpeg', 'You also have the ability to select different types of addresses. You can add an address as your default address, or select it as only a shipping or only a billing address. \r\n', 'Surgeon'),
(6, 'dr@gmail.com', 'Dr Shivam', '500', 'MD', '123456789', '6.jpeg', 'You also have the ability to select different types of addresses. You can add an address as your default address, or select it as only a shipping or only a billing address. \r\n', 'Diabetics'),
(7, 'dr@gmail.com', 'Dr Hemant', '1000', 'MD', '123456789', '7.jpeg', 'You also have the ability to select different types of addresses. You can add an address as your default address, or select it as only a shipping or only a billing address. \r\n', 'Heart'),
(8, 'dr@gmail.com', 'Dr Anirudh', '600', 'MD', '123456789', '8.jpeg', 'You also have the ability to select different types of addresses. You can add an address as your default address, or select it as only a shipping or only a billing address. \r\n', 'Heart'),
(9, 'dr@gmail.com', 'Dr Shuhani', '700', 'MD', '123456789', '9.jpeg', 'You also have the ability to select different types of addresses. You can add an address as your default address, or select it as only a shipping or only a billing address. \r\n', 'Surgeon'),
(10, 'dr@gmail.com', 'Dr Amishi', '2500', 'MD', '123456789', '10.jpeg', 'You also have the ability to select different types of addresses. You can add an address as your default address, or select it as only a shipping or only a billing address. \r\n', 'Surgeon'),
(11, 'dr@gmail.com', 'Dr Ishika', '800', 'MD', '123456789', '11.jpeg', 'You also have the ability to select different types of addresses. You can add an address as your default address, or select it as only a shipping or only a billing address. \r\n', 'Heart'),
(12, 'dr@gmail.com', 'Dr Lettuce', '1400', 'MD', '123456789', '12.jpeg', 'You also have the ability to select different types of addresses. You can add an address as your default address, or select it as only a shipping or only a billing address. \r\n', 'Surgeon'),
(13, 'dr@gmail.com', 'Dr Harshika', '400', 'MD', '123456789', '13.jpeg', 'You also have the ability to select different types of addresses. You can add an address as your default address, or select it as only a shipping or only a billing address. \r\n', 'Surgeon'),
(14, 'dr@gmail.com', 'Dr Harsh', '600', 'MD', '123456789', '14.jpeg', 'You also have the ability to select different types of addresses. You can add an address as your default address, or select it as only a shipping or only a billing address. \r\n', 'Surgeon'),
(15, 'dr@gmail.com', 'Dr Sumeet', '800', 'MD', '123456789', '15.jpeg', 'You also have the ability to select different types of addresses. You can add an address as your default address, or select it as only a shipping or only a billing address. \r\n', 'Surgeon');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_role` varchar(255) NOT NULL,
  `employee_sal` varchar(100) NOT NULL,
  `employee_first_name` varchar(100) NOT NULL,
  `employee_middle_name` varchar(100) NOT NULL,
  `employee_last_name` varchar(100) NOT NULL,
  `employee_gender` varchar(100) NOT NULL,
  `employee_address` varchar(100) NOT NULL,
  `employee_village` varchar(100) NOT NULL,
  `employee_state` varchar(100) NOT NULL,
  `employee_country` varchar(100) NOT NULL,
  `employee_landline` varchar(100) NOT NULL,
  `employee_mobile` varchar(100) NOT NULL,
  `employee_email` varchar(100) NOT NULL,
  `employee_status` varchar(255) NOT NULL,
  `employee_deparment` varchar(255) NOT NULL,
  `employee_dob` varchar(255) NOT NULL,
  `employee_nationalty` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_role`, `employee_sal`, `employee_first_name`, `employee_middle_name`, `employee_last_name`, `employee_gender`, `employee_address`, `employee_village`, `employee_state`, `employee_country`, `employee_landline`, `employee_mobile`, `employee_email`, `employee_status`, `employee_deparment`, `employee_dob`, `employee_nationalty`) VALUES
(1001, '1', '1', 'Amit', 'Kumar', 'Singh', 'Male', 'A : 42/6', 'Ghaziabad', '4', '1', 'Uttar Pradesh', '09876543212', 'kaushal@gmail.com', '1', '1', '12 January, 2014', 'Indian'),
(1002, '2', '2', 'Kaushal', 'Kishore', 'Jaiswal', 'Male', 'A : 42/6', 'Ghaziabad', '1', '1', 'Uttar Pradesh', '09876543212', 'kaushal.rahuljaiswal@gmail.com', '1', '3', '7 July,1988', 'Indian'),
(1003, '3', '1', 'Sumit', 'Kumar', 'Aggarwal', 'Male', 'A : 42/6', 'Ghaziabad', '1', '1', 'Uttar Pradesh', '09876543212', 'kishore@gmail.com', '1', '1', '12 January, 1988', 'Indian'),
(1014, '2', '1', 'Anuj', 'Kumar', 'Dubej', 'Male', 'A : 42/6 Sector 62', 'Bhabua (Kaimur)', '1', '1', '9876543212', '9876543212', 'anuj@gmail.com', '1', '1', '12 January 1985', 'Indian'),
(1015, '3', '1', 'Amit', 'Kumar', 'Rastogi', 'Male', 'A : 42/6', 'Ghaziabad', '1', '1', '987654312', '8765432123', 'amit@gmail.com', '1', '3', '12 January, 1988', 'Indian'),
(1016, '3', '1', 'Neeraj', 'Kumar', 'Singh', 'Male', 'Allahabad', 'Allahabad', '4', '1', '120345613421', '9876543212', 'neeraj@gmail.com', '1', '2', '1 July,1988', 'Indian');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `login_emp_id` int(11) NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `login_password` varchar(255) NOT NULL,
  `login_level` int(11) NOT NULL DEFAULT '3',
  `login_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `login_emp_id`, `login_user`, `login_password`, `login_level`, `login_email`) VALUES
(1, 1001, 'admin', 'test', 1, 'admin@gmail.com'),
(2, 1002, 'expert', 'test', 2, 'reporter@gmail.com'),
(3, 1003, 'farmer', 'test', 3, 'employee@gmail.com'),
(21, 1014, 'anuj', 'test', 3, 'anuj@gmail.com'),
(22, 1015, 'kasuhal', '123456', 4, 'amit@gmail.com'),
(23, 1016, 'neeraj', 'test', 3, 'neeraj@gmail.com'),
(24, 0, '11', '12', 2, '6'),
(25, 0, '11', '12', 2, '6'),
(26, 0, '11', '12', 2, '6'),
(27, 1017, '11', '12', 2, '6'),
(28, 1018, '11', '12', 2, '6'),
(29, 1019, '11', '12', 2, '6'),
(30, 1020, 'rrr', 'rrr', 3, '2345');

-- --------------------------------------------------------

--
-- Table structure for table `mode`
--

CREATE TABLE `mode` (
  `mode_id` int(11) NOT NULL,
  `mode_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mode`
--

INSERT INTO `mode` (`mode_id`, `mode_title`) VALUES
(1, 'Train'),
(2, 'Bus'),
(3, 'Car'),
(4, 'Flight');

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

CREATE TABLE `month` (
  `month_id` int(11) NOT NULL,
  `month_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `month`
--

INSERT INTO `month` (`month_id`, `month_name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `patient_mobile` varchar(255) NOT NULL,
  `patient_email` varchar(255) NOT NULL,
  `patient_password` varchar(255) NOT NULL,
  `patient_address` varchar(255) NOT NULL,
  `patient_city` varchar(255) NOT NULL,
  `patient_state` varchar(255) NOT NULL,
  `patient_pincode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `patient_name`, `patient_mobile`, `patient_email`, `patient_password`, `patient_address`, `patient_city`, `patient_state`, `patient_pincode`) VALUES
(1, 'Amit Kumar', '9876543212', 'amit@gmail.com', 'test', 'Allahabad', 'Mumbai', '4', '201301'),
(2, 'Kaushal Kishore', '9183769868', 'kaushal.rahuljaiswal@gmail.com', 'test', 'A : 42/6 Sector 62', 'Noida', '2', '26101'),
(3, 'Amit', '9876543212', 'rahul@gmail.com', 'test', 'Test', 'Test', '3', 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_title`) VALUES
(2, 'Expert'),
(3, 'Farmer');

-- --------------------------------------------------------

--
-- Table structure for table `salutions`
--

CREATE TABLE `salutions` (
  `sl_id` int(11) NOT NULL,
  `sl_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salutions`
--

INSERT INTO `salutions` (`sl_id`, `sl_name`) VALUES
(1, 'Mr.'),
(2, 'Mrs.');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `skill_id` int(11) NOT NULL,
  `skill_emp_id` int(11) NOT NULL,
  `skill_name` varchar(255) NOT NULL,
  `skill_grade` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_name`) VALUES
(1, 'Maharastra'),
(2, 'Gujrat'),
(3, 'Bihar'),
(4, 'Uttar Pradesh'),
(5, 'Delhi'),
(6, 'Haryana');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status_name`) VALUES
(1, 'Active'),
(2, 'Blocked');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `mode`
--
ALTER TABLE `mode`
  ADD PRIMARY KEY (`mode_id`);

--
-- Indexes for table `month`
--
ALTER TABLE `month`
  ADD PRIMARY KEY (`month_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `salutions`
--
ALTER TABLE `salutions`
  ADD PRIMARY KEY (`sl_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1017;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `mode`
--
ALTER TABLE `mode`
  MODIFY `mode_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `month`
--
ALTER TABLE `month`
  MODIFY `month_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salutions`
--
ALTER TABLE `salutions`
  MODIFY `sl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
