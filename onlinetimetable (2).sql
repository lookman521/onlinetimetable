-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2023 at 09:41 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinetimetable`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_code` varchar(1000) DEFAULT NULL,
  `course_title` varchar(1000) DEFAULT NULL,
  `dept` varchar(255) NOT NULL,
  `college` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_code`, `course_title`, `dept`, `college`) VALUES
(3, 'SEN1211  ', 'Introduction to web technologies ', ' Software and Cyber Security', '    Computing and Information Science '),
(4, 'CSC1311 ', 'Introduction To Computer Science ', ' Computer and Info Tech', '  Computing and Information Science'),
(5, 'SEN1321 ', 'Principle Of Programming ', ' Software and Cyber Security', '    Computing and Information Science '),
(6, 'CSC1321 ', 'Introduction To Problem Solving ', ' Computer and Info Tech', '  Computing and Information Science'),
(7, 'SEN2212 ', 'Software Engineering Process ', ' Software and Cyber Security', ' Computing and Information Science '),
(8, 'SEN2214 ', 'Logic And Its Applications In Computing ', ' Software and Cyber Security', '  Computing and Information Science'),
(9, 'SEN2215 ', 'Fundamentals Of Data Structures ', ' Software and Cyber Security', '  Computing and Information Science'),
(10, 'SEN2311 ', 'Introduction To Software Engineering ', ' Software and Cyber Security', '  Computing and Information Science'),
(11, 'SEN2222 ', 'Software Requirements Analysis & Specifications ', ' Software and Cyber Security', '  Computing and Information Science'),
(12, 'SEN2223 ', 'Software Construction ', ' Software and Cyber Security', '  Computing and Information Science'),
(13, 'SEN3311  ', 'Web Application Development ', ' Software and Cyber Security', '  Computing and Information Science'),
(14, 'SEN3312 ', 'Database Design And Management I ', ' Software and Cyber Security', '  Computing and Information Science'),
(15, 'SEN 3321 ', 'Structured Programming ', ' Software and Cyber Security', '  Computing and Information Science'),
(16, 'SEN 3322 ', 'Software Design and Architecture ', ' Software and Cyber Security', '  Computing and Information Science'),
(17, 'CSC4211 ', 'Human Computer Interface ', ' Computer and Info Tech', '  Computing and Information Science'),
(18, 'CSC4215 ', 'Computer System Performance and Evaluation ', ' Computer and Info Tech', '  Computing and Information Science'),
(19, 'SEN4221 ', 'Software Engineering Economics ', ' Software and Cyber Security', '  Computing and Information Science'),
(20, 'SEN4222 ', 'Market for Software Technology ', ' Software and Cyber Security', '  Computing and Information Science'),
(22, 'SEN4911', 'Project 1', 'Software and Cyber Security', 'Computing and Information Science');

-- --------------------------------------------------------

--
-- Table structure for table `invigilators`
--

CREATE TABLE `invigilators` (
  `id` int(10) NOT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invigilators`
--

INSERT INTO `invigilators` (`id`, `name`, `phone`) VALUES
(1, 'Sadik Yusuf ', ' 07032408921'),
(3, 'Abubakar Sadik ', ' 08123456789'),
(4, 'Muhammad Sani  ', ' 07033415593'),
(5, 'Sanee Itas ', '09050657828'),
(6, 'Hamza Usman ', ' 09052676889'),
(7, 'Aisha Umar ', ' 07055552679'),
(9, 'Hayat Tuge', '09037772881'),
(10, 'Sadik Bala', '88889001345');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `id` int(10) NOT NULL,
  `course_id` varchar(1000) DEFAULT NULL,
  `date_` date DEFAULT NULL,
  `day_` varchar(255) DEFAULT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `from_` varchar(255) DEFAULT NULL,
  `to_` varchar(255) DEFAULT NULL,
  `invigilator_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `course_id`, `date_`, `day_`, `venue`, `from_`, `to_`, `invigilator_id`) VALUES
(16, '20', '2023-08-31', 'Saturday', 'MLK', '13:21', '20:26', '7'),
(17, '20', '2023-08-31', 'Saturday', 'MLK', '13:21', '20:26', '6'),
(18, '20', '2023-08-31', 'Saturday', 'MLK', '13:21', '20:26', '5'),
(27, '8', '2023-08-31', 'Sunday', 'SLT', '16:43', '22:48', '6'),
(28, '8', '2023-08-31', 'Sunday', 'SLT', '16:43', '22:48', '5'),
(29, '8', '2023-08-31', 'Sunday', 'SLT', '16:43', '22:48', '4'),
(30, '8', '2023-08-31', 'Sunday', 'SLT', '16:43', '22:48', '3'),
(31, '8', '2023-08-31', 'Sunday', 'SLT', '16:43', '22:48', '1'),
(32, '11', '2023-09-08', 'Monday', 'HALL D', '10:00', '12:00', '5'),
(33, '11', '2023-09-08', 'Monday', 'HALL D', '10:00', '12:00', '4'),
(34, '11', '2023-09-08', 'Monday', 'HALL D', '10:00', '12:00', '3'),
(35, '11', '2023-09-08', 'Monday', 'HALL D', '10:00', '12:00', '1'),
(36, '10', '2023-09-09', 'Thursday', 'SLT', '08:30', '10:30', '3'),
(37, '10', '2023-09-09', 'Thursday', 'SLT', '08:30', '10:30', '1'),
(38, '17', '2023-11-01', 'Saturday', 'MULTIPURPOSE', '10:00', '12:00', '10'),
(39, '17', '2023-11-01', 'Saturday', 'MULTIPURPOSE', '10:00', '12:00', '9'),
(40, '17', '2023-11-01', 'Saturday', 'MULTIPURPOSE', '10:00', '12:00', '7'),
(41, '17', '2023-11-01', 'Saturday', 'MULTIPURPOSE', '10:00', '12:00', '1'),
(42, '22', '2023-10-30', 'Monday', 'MLK', '11:00', '13:00', '9'),
(43, '22', '2023-10-30', 'Monday', 'MLK', '11:00', '13:00', '7'),
(44, '22', '2023-10-30', 'Monday', 'MLK', '11:00', '13:00', '1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `email` varchar(1000) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `password`) VALUES
(1, 'Sanee Itas', 'saneeitas@gmail.com', 'student', 'e10adc3949ba59abbe56e057f20f883e'),
(3, 'admin', 'admin@gmail.com', 'admin', 'e10adc3949ba59abbe56e057f20f883e'),
(5, 'Muhammad Sani ', 'muhdsanee87@gmail.com', 'lecturer', 'e10adc3949ba59abbe56e057f20f883e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invigilators`
--
ALTER TABLE `invigilators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
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
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `invigilators`
--
ALTER TABLE `invigilators`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
