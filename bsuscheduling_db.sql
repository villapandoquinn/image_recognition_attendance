-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2024 at 03:25 AM
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
-- Database: `bsuscheduling_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_ID` int(11) NOT NULL,
  `department_code` varchar(11) NOT NULL,
  `department_name` varchar(50) NOT NULL,
  `department_status` enum('Active','Not Active') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_ID`, `department_code`, `department_name`, `department_status`) VALUES
(1, 'BS EE', 'BS Electrical Engineering', 'Active'),
(2, 'BS ARCH', 'BS Architecture', 'Active'),
(3, 'BS SE', 'BS Sanitary Engineering', 'Active'),
(4, 'BS ICE', 'BS Instrumentation and Control Engineering', 'Active'),
(5, 'BS PetE', 'BS Petroleum Engineering', 'Active'),
(6, 'BS CpE', 'BS Computer Engineering', 'Active'),
(7, 'BS CE', 'BS Civil Engineering', 'Active'),
(8, 'BS CHEM', 'BS Chemical Engineering', 'Active'),
(9, 'BS IT', 'BS Information Technology', 'Active'),
(10, 'BS MechE', 'BS Mechatronics Engineering', 'Active'),
(11, 'BS FE', 'BS Food Engineering', 'Active'),
(12, 'BS IE', 'BS Industrial Engineering', 'Active'),
(13, 'BS AE', 'BS Automotive Engineering', 'Active'),
(14, 'BS AeroE', 'BS Aerospace Engineering', 'Active'),
(15, 'BS CeraE', 'BS Ceramics Engineering', 'Active'),
(16, 'BS ME', 'BS Mechanical Engineering', 'Active'),
(17, 'BS TE', 'BS Transportation Engineering', 'Active'),
(18, 'BS BIO', 'BS Biomedical Engineering', 'Active'),
(19, 'BS GE', ' BS Geodetic Engineering', 'Active'),
(20, 'BS MetaE', 'BS Metallurgical Engineering', 'Active'),
(21, 'BS NAME', 'BS Naval Architecture and Marine Engineering', 'Active'),
(22, 'BS FAD', 'BS Fine Arts and Design', 'Active'),
(23, 'BS ID', 'BS Interior Design', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `device_ID` int(11) NOT NULL,
  `device_name` varchar(50) NOT NULL,
  `device_status` enum('Active','Not Active') NOT NULL DEFAULT 'Active',
  `facility_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`device_ID`, `device_name`, `device_status`, `facility_ID`) VALUES
(1, 'NBVCaa', 'Not Active', 1),
(2, 'adad', 'Not Active', 1),
(3, 'addada', 'Not Active', 1),
(4, 'dgdsgsgwqw', 'Not Active', 1),
(5, 'DEVICE 1', 'Active', 1),
(6, 'DEVICE 2', 'Active', 6),
(7, 'DEVICE 3', 'Active', 3),
(8, 'DEVICE 4', 'Active', 5),
(9, 'DEVICE 5', 'Active', 4);

-- --------------------------------------------------------

--
-- Table structure for table `event_booking`
--

CREATE TABLE `event_booking` (
  `event_ID` int(11) NOT NULL,
  `event_code` varchar(50) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_purpose` varchar(600) NOT NULL,
  `start_from` datetime NOT NULL,
  `end_to` datetime NOT NULL,
  `participants` varchar(50) NOT NULL,
  `event_status` enum('pending','approved','declined') NOT NULL DEFAULT 'pending',
  `facility_ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_booking`
--

INSERT INTO `event_booking` (`event_ID`, `event_code`, `event_name`, `event_purpose`, `start_from`, `end_to`, `participants`, `event_status`, `facility_ID`, `user_ID`) VALUES
(45, 'SCH1711935431', 'sdfghjkl;\';lkjh', 'asdkl;l\';\'l/k.j,hmgnb', '2024-04-18 09:34:00', '2024-04-18 01:34:00', 'asdfghjkl;lkjhg', 'declined', 6, 7),
(46, 'SCH1711935447', 'sdfghjkl;\';lkjh', 'asdkl;l\';\'l/k.j,hmgnb', '2024-05-16 09:34:00', '2024-05-16 01:34:00', 'asdfghjkl;lkjhg', 'declined', 6, 7),
(47, 'SCH1711935476', 'sertyujkl;', 'ertyuio sdfghjk sertyuik artgyhujkl', '2024-05-11 09:37:00', '2024-04-01 00:37:00', 'sdfghjkl;', 'approved', 5, 7),
(48, 'SCH1711935506', 'sertyujkl;', 'ertyuio sdfghjk sertyuik artgyhujkl', '2024-05-11 09:37:00', '2024-04-01 00:37:00', 'sdfghjkl;', 'approved', 5, 7),
(49, 'SCH1711935543', 'sertyujkl;', 'ertyuio sdfghjk sertyuik artgyhujkl', '2024-05-11 09:37:00', '2024-04-01 00:37:00', 'sdfghjkl;', 'declined', 5, 7),
(50, 'SCH1711935669', 'sample event fetching', 'sample sample sample sample sample sample sample s', '2024-04-19 17:40:00', '2024-04-19 19:00:00', 'sample participants', 'declined', 7, 7),
(51, 'SCH1711936267', 'another sample', 'another sample another sample another sample anoth', '2024-04-20 10:50:00', '2024-04-20 12:50:00', 'another sample participants', 'approved', 6, 7),
(52, 'SCH1711979887', 'sample event fetching search testing', 'sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample e', '2024-04-19 12:00:00', '2024-04-19 16:00:00', 'sample event fetching search testing ', 'approved', 1, 7),
(53, 'BSUsch1711987881', 'something new, thousands sample ', 'something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample ', '2024-06-18 12:11:00', '2024-06-18 17:11:00', 'something new, thousands sample ', 'approved', 3, 7),
(58, 'BSUsch1713550897', 'sample 20/04/24_2:20am ', 'sample 20/04/24_2:20am sample 20/04/24_2:20am sample 20/04/24_2:20am sample 20/04/24_2:20am sample 20/04/24_2:20am sample 20/04/24_2:20am ', '2024-04-21 07:00:00', '2024-04-21 09:00:00', 'sample 20/04/24_2:20am ', 'declined', 5, 35),
(59, 'BSUsch1713975543', 'sample test04.25', 'sample test04.25 sample test04.25 sample test04.25 sample test04.25 sample test04.25 sample test04.25 sample test04.25 sample test04.25 ', '2024-05-16 09:30:00', '2024-05-16 13:30:00', 'sample test04.25 ', 'approved', 6, 35),
(60, 'BSUsch1714214030', 'frenz jonathan villanueva alulod ', 'frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz jonathan villanueva alulod frenz ', '2024-04-30 06:33:00', '2024-04-30 10:33:00', 'frenz jonathan villanueva alulod ', 'approved', 3, 42),
(61, 'BSUsch1714365586', 'sdfghj', 'dfghjkjhgfd', '2024-04-26 16:39:00', '2024-04-29 17:39:00', 'rgthjkilkjh', 'approved', 4, 39),
(62, 'BSUsch1714824946', 'sample 04/05/24_8.14pm ', 'sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm ', '2024-05-05 11:00:00', '2024-05-05 13:00:00', 'sample 04/05/24_8.14pm ', 'pending', 4, 39),
(63, 'BSUsch1714825218', 'sample 04/05/24_8.14pm ', 'sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm ', '2024-05-05 08:00:00', '2024-05-05 09:45:00', 'sample 04/05/24_8.14pm ', 'pending', 4, 39),
(64, 'BSUsch1714825348', 'sample 04/05/24_8.14pm ', 'sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm ', '2024-05-05 08:00:00', '2024-05-05 09:00:00', 'sample 04/05/24_8.14pm ', 'pending', 8, 39),
(65, 'BSUsch1714825458', 'sample 04/05/24_8.14pm ', 'sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm ', '2024-05-06 08:00:00', '2024-05-06 09:00:00', 'sample 04/05/24_8.14pm ', 'pending', 8, 39),
(66, 'BSUsch1714825644', 'sample 04/05/24_8.14pm ', 'sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm ', '2024-05-06 08:00:00', '2024-05-06 09:00:00', 'sample 04/05/24_8.14pm ', 'pending', 1, 39),
(67, 'BSUsch1714825701', 'sample 04/05/24_8.14pm ', 'sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm ', '2024-05-06 08:00:00', '2024-05-06 09:00:00', 'sample 04/05/24_8.14pm ', 'pending', 9, 39),
(68, 'BSUsch1714825769', 'sample 04/05/24_8.14pm ', 'sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm ', '2024-05-06 08:00:00', '2024-05-06 09:00:00', 'sample 04/05/24_8.14pm ', 'pending', 5, 39),
(69, 'BSUsch1714826185', 'sample 04/05/24_8.14pm ', 'sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm ', '2024-05-06 08:00:00', '2024-05-06 09:00:00', 'sample 04/05/24_8.14pm ', 'pending', 6, 39),
(70, 'BSUsch1714826326', 'sample 04/05/24_8.14pm ', 'sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm ', '2024-05-06 08:00:00', '2024-05-06 09:00:00', 'sample 04/05/24_8.14pm ', 'pending', 10, 39),
(71, 'BSUsch1714827459', 'sample 04/05/24_8.14pm ', 'sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm sample 04/05/24_8.14pm ', '2024-05-06 08:00:00', '2024-05-06 09:00:00', 'sample 04/05/24_8.14pm ', 'pending', 3, 39),
(72, 'BSUsch1714922993', 'Fhuijj', 'Ghii', '2024-05-05 23:29:00', '2024-05-05 23:29:00', 'Fghjki', 'pending', 3, 39),
(73, 'SCH1711979887', 'sample event fetching search testing 13/05/24', 'sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample event fetching search testing sample e', '2024-05-13 12:00:00', '2024-05-13 13:00:00', 'sample event fetching search testing ', 'approved', 1, 7),
(74, 'BSUsch1715553530', 'Design and Implementation of Comprehensive Smart Facilities Scheduling System at Batangas State University', 'THESIS 2 DEFENSE SCHEDULE\r\nIn response, BatState-U is transitioning to a Smart Scheduling System, leveraging technological advancements to automate and streamline the scheduling processes. This new system features an intuitive user interface accessible via web and tablet applications, integrated data management for scheduling and user accounts, and aims to enhance operational efficiency, responsiveness, and the overall educational experience at the university.', '2024-05-13 14:30:00', '2024-05-13 16:00:00', 'Topic Proponents, Adviser, & Respective Panelists', 'pending', 8, 39),
(75, 'BSUsch1714825458', 'sample 14/05/24_8.14pm ', 'sample 14/05/24_8.14pm sample 14/05/24_8.14pm sample 14/05/24_8.14pm sample 14/05/24_8.14pm sample 14/05/24_8.14pm sample 14/05/24_8.14pm sample 14/05/24_8.14pm sample 14/05/24_8.14pm ', '2024-05-14 08:00:00', '2024-05-14 09:00:00', 'sample 14/05/24_8.14pm ', 'approved', 8, 39),
(76, 'BSUsch1714922993', 'Event Sampling and Fetching', 'Event Sampling and FetchingEvent Sampling and FetchingEvent Sampling and FetchingEvent Sampling and FetchingEvent Sampling and FetchingEvent Sampling and FetchingEvent Sampling and Fetching', '2024-05-14 23:29:00', '2024-05-14 23:29:00', 'Event Sampling and Fetching', 'pending', 12, 39),
(77, 'BSUsch1711987881', 'something new, thousands sample ', 'something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample something new, thousands sample ', '2024-05-14 12:11:00', '2024-05-14 17:11:00', 'something new, thousands sample ', 'approved', 9, 7);

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `facility_ID` int(11) NOT NULL,
  `facility_code` varchar(20) NOT NULL,
  `facility_name` varchar(50) NOT NULL,
  `building_loc` varchar(50) NOT NULL,
  `facility_capacity` int(11) NOT NULL,
  `facility_status` enum('available','reserved','disable') NOT NULL DEFAULT 'available',
  `staff` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`facility_ID`, `facility_code`, `facility_name`, `building_loc`, `facility_capacity`, `facility_status`, `staff`) VALUES
(1, 'AVR-SH', 'Audio Visual Room', 'SteerHub, 3rd floor', 300, 'available', ''),
(3, 'CONF-COT', 'Conference Room', 'COT, 2nd Floor', 150, 'available', ''),
(4, 'AVR-CEAFA', 'Audio Visual Room', 'CEAFA, 4th Floor', 300, 'available', ''),
(5, 'AMPH-CEAFA', 'Amphitheater', 'CEAFA, 3rd Floor', 600, 'available', ''),
(6, 'AMPH-SH', 'Amphitheater', 'SteerHub, 4th floor', 400, 'available', ''),
(7, 'GYM', 'GYMNASIUM', 'CE, 2nd floor', 1000, 'available', ''),
(8, 'AVR-CIT', 'Audio Visual Room', 'CIT, 2nd floor', 501, 'available', ''),
(9, 'AVR-SH', 'Audio Visual Room', 'SteerHub, 4th floor', 600, 'available', ''),
(10, 'MULTMED-CEAFE', 'Multimedia Room', 'CEAFA, 3rd Floor', 220, 'available', ''),
(11, 'CONF-CIT', 'Conference Room', 'CIT, 4th Floor', 50, 'available', ''),
(12, 'AUDI-GYM', 'Auditorium', 'GYM, 2nd Floor', 200, 'available', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_ID` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `confirm_pass` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `user_status` enum('Active','Pending','Rejected') NOT NULL DEFAULT 'Pending',
  `contact_number` int(10) NOT NULL,
  `camera_upload` varchar(500) DEFAULT NULL,
  `reset_code` int(6) NOT NULL,
  `verification_code` int(6) NOT NULL,
  `verification_status` enum('Verified','Pending') NOT NULL DEFAULT 'Pending',
  `reset_expiration` timestamp NULL DEFAULT NULL,
  `employee_ID` int(11) NOT NULL,
  `department_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_ID`, `first_name`, `last_name`, `email`, `password`, `confirm_pass`, `role`, `user_status`, `contact_number`, `camera_upload`, `reset_code`, `verification_code`, `verification_status`, `reset_expiration`, `employee_ID`, `department_ID`) VALUES
(7, 'Frenz Jonathan', 'Alulod', 'frenz@example.com', '0affd1d02bc5bc471d712de1fc346987', '', 'USER', 'Rejected', 2147483647, NULL, 0, 0, 'Pending', NULL, 123852, 2),
(8, 'Zyke Nathan', 'Villanueva', 'zyke@sample.com', '@sample123', '', 'USER', 'Rejected', 2147483647, NULL, 0, 0, '', NULL, 123258, 2),
(10, 'nathan Renz', 'villanueva', 'nathan@sample.com', '123@sample', '', 'USER', 'Rejected', 2147483647, NULL, 0, 0, '', NULL, 587412369, 6),
(12, 'Lorem Ipsum', 'Villanueva', 'lorem@sample.com', '@lorem123', '', 'USER', 'Active', 966263351, NULL, 0, 0, '', NULL, 2147483647, 6),
(13, 'Frenz Jonathan', 'Alulod', 'frenzjonathan.alulod@g.batstate-u.edu.ph', 'sampleAdmin!23', '$2y$10$PApBB60bV3iU0H8yTTgXf.9Arsm05cL9cga7aO4VhllhQyJBAC46S', 'ADMIN', 'Active', 966263351, NULL, 999691, 0, 'Verified', '0000-00-00 00:00:00', 2147483647, 6),
(14, 'Krishna Rozel', 'Hernandez', 'krishna@sample.com', 'krishnasample!23', '', 'USER', 'Active', 2147483647, NULL, 0, 0, '', NULL, 2147483647, 4),
(15, 'Krishna Rozel', 'Hernandez', 'krishna@sample.com', 'kirshnasample!23', '', 'USER', 'Active', 2147483647, NULL, 0, 0, '', NULL, 2147483647, 4),
(16, 'Krishna Rozel', 'Hernandez', 'krishna@sample.com', 'kirshnasample!23', '', 'USER', 'Rejected', 2147483647, NULL, 0, 0, '', NULL, 2147483647, 4),
(17, 'Krishna Rozel', 'Hernandez', 'krishna@sample.com', 'krishsample!23', '', 'USER', 'Active', 2147483647, NULL, 0, 0, '', NULL, 2147483647, 4),
(18, 'Krishna Rozel', 'Hernandez', 'krishna@sample.com', 'krishsample!23', '', 'USER', 'Rejected', 2147483647, NULL, 0, 0, '', NULL, 2147483647, 4),
(19, 'Frenz Jonathan', 'Alulod', 'frenzjonathan5958+test@gmail.com', '$2y$10$zCsCUQmKOwzya24TNK/F8O9vEivJVtFsTD6EUj5Pr5/LNRoVGPCXa', '$2y$10$zCsCUQmKOwzya24TNK/F8O9vEivJVtFsTD6EUj5Pr5/LNRoVGPCXa', 'USER', 'Active', 2147483647, NULL, 0, 0, '', '0000-00-00 00:00:00', 2147483647, 1),
(25, 'Karla Mae', 'Alulod', 'villanuevamara23@gmail.com', '$2y$10$QI2TeHRTquQZhYcOrwyT5ewaXHxqUe7QA4PMDGwQhnnWzDnncsroC', '$2y$10$QI2TeHRTquQZhYcOrwyT5ewaXHxqUe7QA4PMDGwQhnnWzDnncsroC', 'USER', 'Pending', 2147483647, NULL, 0, 0, '', '0000-00-00 00:00:00', 123852, 9),
(26, 'Mell Godwin', 'Barza', 'mellgodwinbarza04@gmail.com', '$2y$10$U8.jb7ftj/r/Deu0.8qdbeudAg0c7Ld9SO2/B2IQ3FYp43MkMsK7y', '$2y$10$U8.jb7ftj/r/Deu0.8qdbeudAg0c7Ld9SO2/B2IQ3FYp43MkMsK7y', 'USER', 'Pending', 2147483647, NULL, 0, 998384, '', '0000-00-00 00:00:00', 1234587, 3),
(27, 'Krishna Rozel', 'Hernandez', 'hernandezkrishna09@gmail.com', '$2y$10$qutvJ1FzEzGXuoDBaaPDy.BNY/8bhI1iPkQR7BKFYk2nGyVGdTBWm', '', 'USER', 'Active', 2147483647, NULL, 0, 346512, '', NULL, 1234587, 3),
(28, 'Aira', 'Mutya', 'airamutya0611@gmail.com', '$2y$10$YKwc9drcsVY7.TghQNkAy.u60UZaYgZLQyuikMcygIl7tIO7codeW', '', 'USER', 'Pending', 2147483647, NULL, 0, 394617, '', NULL, 1234587, 9),
(29, 'Denz Lythan', 'Avuenalliv', 'frenzjonathan8056@gmail.com', '$2y$10$jPChSVs1xm5oXs.wCLXnn.M46rvrkNESU6wm6EH/F.5Gf9Jpe4ddW', '', 'USER', 'Pending', 2147483647, NULL, 0, 160101, '', NULL, 2147483647, 6),
(30, 'Denz Lythan', 'Avuenalliv', 'frenzjonathan86@gmail.com', '$2y$10$dM0F.EDZFV/MWNd4z5XFeuFPJnS1TOJZrSFOesXPJyiCRM24AN2C2', '', 'USER', 'Pending', 2147483647, NULL, 0, 729887, '', NULL, 2147483647, 6),
(31, 'Karla Mae', 'sasasa', 'frenzjonathan5958+karla@gmail.com', '$2y$10$KuovciDyHOVPUani338qWed98tG9iVTdd3J.A/tTBXT/RJzENa3Pi', '', 'USER', 'Pending', 966263351, NULL, 0, 129146, 'Verified', NULL, 123456, 9),
(32, 'angelica', 'Alulod', 'frenzjonathan5958+lyka@gmail.com', '$2y$10$JYm1srDbPtlFSyiUqvBBdug/QpRo..2k.ldVLAPknGwGVrkXCwoOa', '', 'USER', 'Pending', 2147483647, NULL, 0, 571910, 'Verified', NULL, 2147483647, 4),
(33, 'sample', 'registration', 'frenzjonathan5958+regis@gmail.com', '$2y$10$rhBvrhosO4eb8z11raUEoO6ONQwiWUTE3CGI.UnIcaV4Qbiwrl70m', '', 'USER', 'Pending', 2147483647, NULL, 0, 956056, 'Verified', NULL, 789965326, 4),
(34, 'Aira', 'Mutya', 'airamutya0611+test2@gmail.com', '$2y$10$vnYIk2UAeUzVrnOWNk27YOT5v78VyIwTMjo14rD2VRPuJcQXQwLqy', '$2y$10$vnYIk2UAeUzVrnOWNk27YOT5v78VyIwTMjo14rD2VRPuJcQXQwLqy', 'USER', 'Active', 2147483647, NULL, 0, 209513, 'Pending', '0000-00-00 00:00:00', 2147483647, 9),
(35, 'Aira Duenas', 'Mutya', 'airamutya0611+test3@gmail.com', 'd5ea7e93f1dff863a75275426e26949f', '', 'USER', 'Active', 2147483647, NULL, 0, 484851, 'Verified', NULL, 123852796, 4),
(36, 'MellGodwin', 'Barza', 'mellgodwinbarza04+test1@gmail.com', 'Mellsample!23', '', 'USER', 'Pending', 966263351, NULL, 0, 647486, 'Verified', NULL, 123456, 1),
(37, 'Frenz Jonathan', 'Alulod', 'frenzjonathan5958@gmail.com', 'frenzsample!23', '', 'USER', 'Active', 2147483647, NULL, 193243, 566425, 'Pending', '0000-00-00 00:00:00', 1234587, 6),
(38, 'Frenz', 'Alulod', 'frenzjonathan.alulod+test1@g.batstate-u.edu.ph', 'sample!23', '', 'USER', 'Pending', 2147483647, NULL, 0, 639527, 'Verified', NULL, 2147483647, 4),
(39, 'Frenz Jonathan', 'Alulod', 'frenzjonathan5958@gmail.com', 'sample!23', '', 'USER', 'Active', 2147483647, NULL, 193243, 233106, 'Pending', '0000-00-00 00:00:00', 2147483647, 4),
(40, 'Krishna Rozel', 'Hernandez', 'frenzjonathan5958+test4@gmail.com', 'sample!23', '', 'USER', 'Pending', 2147483647, NULL, 0, 152107, 'Verified', NULL, 2147483647, 4),
(41, 'asasdgfhjk', 'sadfghjkl', 'zsdfgjh@gmail.com', 'sample!23', '', 'USER', 'Pending', 966263351, NULL, 0, 146282, 'Pending', NULL, 123456, 4),
(42, 'sample', 'sample', 'frenzjonathan5958+test5@gmail.com', 'sample!23', '', 'USER', 'Active', 2147483647, NULL, 0, 834772, 'Verified', NULL, 123258, 5),
(43, 'sample user', 'sample', 'frenz@gmail.com', 'sample!23', '', 'USER', 'Pending', 1325468543, NULL, 0, 719106, 'Pending', NULL, 123654789, 10),
(44, 'frenz sample', 'Alulod', 'Frenzjonathan8056+test1@gmail.com', 'sample!23', '', 'USER', 'Pending', 2147483647, NULL, 0, 268345, 'Verified', NULL, 2147483647, 9),
(45, 'frenz sampeTwo', 'Alulod', 'frenzjonathan8056+test2@gmail.com', 'sample!23', '', 'USER', 'Pending', 2147483647, NULL, 0, 219061, 'Verified', NULL, 123456789, 7),
(46, 'sample again', 'Alulod', 'frenzjonathan8056+test3@gmail.com', 'sample!23', '', 'USER', 'Pending', 2147483647, NULL, 0, 421337, 'Verified', NULL, 2147483647, 4),
(47, 'sample three', 'sample', 'frenzjonathan8056+test4@gmail.com', 'sample!23', '', 'USER', 'Pending', 2147483647, NULL, 0, 951563, 'Pending', NULL, 1654987, 3),
(48, 'sample three', 'sample', 'frenzjonathan8056+test5@gmail.com', '$2y$10$417loZGcJ0tUtZGUKyB4HeL8/MnrwUjopxKv4X8Ug8E/rhhmSaWKq', '', 'USER', 'Pending', 2147483647, NULL, 0, 794561, 'Pending', NULL, 1654987, 3),
(49, 'sample three', 'sample', 'frenzjonathan8056+test5@gmail.com', '$2y$10$d6KFQKyHQ9mBQ5.gqxyytel6xJSROEGhwY3StzSZiJ..YxXyBdL8G', '', 'USER', 'Pending', 2147483647, NULL, 0, 467674, 'Pending', NULL, 1654987, 3),
(50, 'sample three', 'sample', 'frenzjonathan8056+test5@gmail.com', '$2y$10$I/qzyz7orCk8ZGo9se3iseV3uyISsTYLmSE38NIoIbKNiw/V9fSEm', '', 'USER', 'Pending', 2147483647, NULL, 0, 446372, 'Pending', NULL, 1654987, 3),
(51, 'sample three', 'sample', 'frenzjonathan8056+test5@gmail.com', '$2y$10$.n5i/x7y82jlj4I4i66Dx.7YJot5uAMERiyn0kMxK90rzZ87FB.NW', '', 'USER', 'Pending', 2147483647, NULL, 0, 811202, 'Pending', NULL, 1654987, 3),
(52, 'Jonathan', 'Villanueva', 'frenzjonathan8056+test6@gmail.com', 'sample!23', '', 'USER', 'Pending', 1234567890, NULL, 0, 249816, 'Verified', NULL, 12320258, 8),
(53, 'frenz sample', 'villanueva', 'frenzjonathan5958+test50@gmail.com', 'sample!23', '', 'USER', 'Pending', 2147483647, '1714505849.jpg', 0, 955208, 'Verified', NULL, 2147483647, 6),
(54, 'Frenz Jonathan', 'Alulod', 'frenzjonathan5958+test30@gmail.com', 'sample!23', '', 'USER', 'Pending', 2147483647, '1714507062.jpg', 0, 765266, 'Verified', NULL, 1234587, 3),
(55, 'Zyke Nathan', 'Villanueva', 'frenzjonathan8056+test7@gmail.com', 'sample!23', '', 'USER', 'Pending', 2147483647, '1714582131.jpg', 0, 440319, 'Verified', NULL, 2147483647, 7),
(56, 'Zyke Nathan', 'Alulod', 'frenzjonathan8056+test8@gmail.com', 'sample!23', '', 'USER', 'Rejected', 2147483647, '1714582340.jpg', 0, 843680, 'Verified', NULL, 2147483647, 5),
(57, 'Frenz Jonathan', 'Villanueva Alulod', 'frenzjonathan5958+test15@gmail.com', 'sample!23', '', 'USER', 'Pending', 966263351, '1714822554.jpg', 0, 613246, 'Verified', NULL, 2147483647, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_facility`
--

CREATE TABLE `user_facility` (
  `user_facility_ID` int(11) NOT NULL,
  `user_ID` int(11) DEFAULT NULL,
  `facility_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_ID`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`device_ID`),
  ADD KEY `facility_ID` (`facility_ID`);

--
-- Indexes for table `event_booking`
--
ALTER TABLE `event_booking`
  ADD PRIMARY KEY (`event_ID`),
  ADD KEY `facility_ID` (`facility_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`facility_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_ID`),
  ADD KEY `department_ID` (`department_ID`);

--
-- Indexes for table `user_facility`
--
ALTER TABLE `user_facility`
  ADD PRIMARY KEY (`user_facility_ID`),
  ADD KEY `facility_ID` (`facility_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `device_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `event_booking`
--
ALTER TABLE `event_booking`
  MODIFY `event_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `facility_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `user_facility`
--
ALTER TABLE `user_facility`
  MODIFY `user_facility_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `device`
--
ALTER TABLE `device`
  ADD CONSTRAINT `device_ibfk_1` FOREIGN KEY (`facility_ID`) REFERENCES `facilities` (`facility_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_booking`
--
ALTER TABLE `event_booking`
  ADD CONSTRAINT `event_booking_ibfk_1` FOREIGN KEY (`facility_ID`) REFERENCES `facilities` (`facility_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_booking_ibfk_2` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`department_ID`) REFERENCES `department` (`department_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_facility`
--
ALTER TABLE `user_facility`
  ADD CONSTRAINT `user_facility_ibfk_1` FOREIGN KEY (`facility_ID`) REFERENCES `facilities` (`facility_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_facility_ibfk_2` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
