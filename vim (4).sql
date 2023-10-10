-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2023 at 06:45 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vim`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '5c428d8875d2948607f3e3fe134d71b4', '2017-10-30 11:42:58');

-- --------------------------------------------------------

--
-- Table structure for table `tblbookings`
--

CREATE TABLE `tblbookings` (
  `id` int(27) NOT NULL,
  `EventType` varchar(100) NOT NULL,
  `Venue` varchar(100) NOT NULL,
  `Stime` time NOT NULL,
  `Etime` time NOT NULL,
  `Date` date NOT NULL,
  `AdminRemark` text NOT NULL,
  `AdminRemarkDate` date DEFAULT NULL,
  `Description` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `IsRead` varchar(50) NOT NULL,
  `Client_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbookings`
--

INSERT INTO `tblbookings` (`id`, `EventType`, `Venue`, `Stime`, `Etime`, `Date`, `AdminRemark`, `AdminRemarkDate`, `Description`, `Status`, `IsRead`, `Client_ID`) VALUES
(1, 'Cinematography', 'tyyyj', '00:00:02', '00:00:09', '2023-09-24', 'Granted', '2023-10-04', 'rrrre', '1', '1', 6),
(2, 'Social Media Campaign', 'iyhui', '00:00:02', '00:00:03', '2023-10-12', '', NULL, 'vhjvjh', '0', '0', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tblclients`
--

CREATE TABLE `tblclients` (
  `id` int(27) NOT NULL,
  `Cl_Id` int(11) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `EmailId` varchar(30) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Phonenumber` int(15) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblclients`
--

INSERT INTO `tblclients` (`id`, `Cl_Id`, `FirstName`, `LastName`, `EmailId`, `Password`, `Phonenumber`, `Status`, `Gender`) VALUES
(1, 90, 'Ken', 'Muciri', 'ken@gmail.com', '1e9e9a787de1a1a5d4508bf9b1ed3175', 723456798, '1', 'Male'),
(2, 101, 'Leila', 'Khalid', 'leila@gmail.com', '1f7ff802df649315948fcdf33e87a86a', 721908765, '1', 'Female'),
(3, 45, 'Keith ', 'Seth', 'keith@gmail.com', '8c8b7878db796ff68adf8e578005486f', 754327689, '1', 'Male'),
(5, 80110, 'Edward', 'Dume', 'edu@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 790444446, '1', 'Male'),
(6, 123, 'Edward', 'Dume', 'Emannuel.emurgat@icta.go.ke', '827ccb0eea8a706c4c34a16891f84e7b', 790444446, '1', 'Female'),
(7, 4678, 'asdaf', 'sssf', 'WEQS@GMAIL.COM', '827ccb0eea8a706c4c34a16891f84e7b', 790444446, '1', 'Other'),
(8, 23333, 'Emanuel', '32245', 'imannuel.emurgat@icta.go.ke', '827ccb0eea8a706c4c34a16891f84e7b', 701006454, '1', 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `tbleventype`
--

CREATE TABLE `tbleventype` (
  `id` int(27) NOT NULL,
  `EventType` varchar(60) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Sprice` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbleventype`
--

INSERT INTO `tbleventype` (`id`, `EventType`, `Description`, `Sprice`) VALUES
(3, 'Facebook Reels', 'live', 20000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbookings`
--
ALTER TABLE `tblbookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblclients`
--
ALTER TABLE `tblclients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbleventype`
--
ALTER TABLE `tbleventype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbookings`
--
ALTER TABLE `tblbookings`
  MODIFY `id` int(27) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblclients`
--
ALTER TABLE `tblclients`
  MODIFY `id` int(27) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbleventype`
--
ALTER TABLE `tbleventype`
  MODIFY `id` int(27) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
