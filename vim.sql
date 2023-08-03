-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2023 at 04:15 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `EventType` varchar(100) NOT NULL,
  `Venue` varchar(100) NOT NULL,
  `Stime` time NOT NULL,
  `Etime` time NOT NULL,
  `Date` date NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `IsRead` varchar(50) NOT NULL,
  `empid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblclients`
--

CREATE TABLE `tblclients` (
  `EmpId` int(11) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `EmailId` varchar(30) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Phonenumber` int(15) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclients`
--

INSERT INTO `tblclients` (`EmpId`, `FirstName`, `LastName`, `EmailId`, `Password`, `Phonenumber`, `Status`, `Gender`) VALUES
(90, 'Ken', 'Muciri', 'ken@gmail.com', '1e9e9a787de1a1a5d4508bf9b1ed3175', 723456798, '1', 'Male'),
(101, 'Leila', 'Khalid', 'leila@gmail.com', '1f7ff802df649315948fcdf33e87a86a', 721908765, '1', 'Female'),
(45, 'Keith ', 'Seth', 'keith@gmail.com', '8c8b7878db796ff68adf8e578005486f', 754327689, '1', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `tbleventype`
--

CREATE TABLE `tbleventype` (
  `EventType` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Sprice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbleventype`
--

INSERT INTO `tbleventype` (`EventType`, `Description`, `Sprice`) VALUES
('Live Media Coverage', '1 Hour Session', 35650),
('Cinematography', 'Motion-Picture Photography', 45900),
('Podcast', 'A feature on a podcast', 24500),
('Photography', 'Product/Photoshoot', 35540),
('Blog', 'A blog feature', 67890),
('Social Media Campaign', '3 Weekly posts, a Reel, Short and Tiktok Video', 98500),
('Vlog', 'A vlog feature', 78450);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
