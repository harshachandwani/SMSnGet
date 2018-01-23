-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 14, 2013 at 05:44 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ozeki`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE IF NOT EXISTS `bus` (
  `Bus_No` varchar(10) NOT NULL,
  `Stop_No` int(11) NOT NULL,
  `Stop_Name` varchar(10) NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`Bus_No`,`Stop_No`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`Bus_No`, `Stop_No`, `Stop_Name`, `Time`) VALUES
('1', 1, 'SWR', '00:00:00'),
('1', 2, 'ABC', '00:02:00'),
('1', 3, 'BBWD', '00:04:00'),
('1', 4, 'SHV', '00:05:00'),
('2', 1, 'SHV', '00:00:00'),
('2', 2, 'ABC', '00:02:00'),
('2', 3, 'SWR', '00:05:00'),
('23UP', 1, 'MKTYD', '00:00:00'),
('23UP', 2, 'NGD', '00:04:00'),
('23UP', 3, 'CHWD', '00:08:00'),
('23UP', 4, 'SNCTY', '00:12:00'),
('23DOWN', 1, 'SNCTY', '00:00:00'),
('23DOWN', 2, 'CHWD', '00:04:00'),
('23DOWN', 3, 'NGD', '00:08:00'),
('23DOWN', 4, 'MKTYD', '00:12:00'),
('56UP', 1, 'KTRJ', '00:00:00'),
('56UP', 2, 'PDCRNR', '00:05:00'),
('56UP', 3, 'ABC', '00:10:00'),
('56UP', 4, 'NNPETH', '00:14:00'),
('56UP', 5, 'SHV', '00:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE IF NOT EXISTS `place` (
  `name` varchar(32) NOT NULL,
  `address` varchar(128) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`name`, `address`) VALUES
('COEP', 'College Of Engineering Pune, Wellesley Road, Shivajinagar, Pune - 411005'),
('VIT', 'Vishwakarma Institute of Technology 666, Upper Indiranagar, Bibwewadi, Pune - 411037'),
('MARRIOTT', 'Senapati Bapat Road,Gokhalenagar,Pune\\0x0A\\0x0A37 & 37/1, C.T.S., Bund Garden Road, Pune;'),
('BBQ', 'Solitaire Building,Near Aga Khan Palace,Kalyani Nagar,Pune'),
('INORBIT', 'Viman Nagar Chowk, Pune Nagar Rd, Vadgaon Sheri Pune\\0x0A\\0x0A35 Nagar Rd, Someshwar Nagar, Wadgaon Sheri, Pune');

-- --------------------------------------------------------

--
-- Table structure for table `time`
--

CREATE TABLE IF NOT EXISTS `time` (
  `Bus_No` varchar(10) NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`Bus_No`,`Time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time`
--

INSERT INTO `time` (`Bus_No`, `Time`) VALUES
('1', '09:30:00'),
('1', '12:00:00'),
('1', '15:00:00'),
('2', '10:00:00'),
('2', '14:00:00'),
('23DOWN', '10:00:00'),
('23DOWN', '12:00:00'),
('23DOWN', '14:00:00'),
('23DOWN', '16:00:00'),
('23DOWN', '18:00:00'),
('23DOWN', '20:00:00'),
('23UP', '09:00:00'),
('23UP', '11:00:00'),
('23UP', '13:00:00'),
('23UP', '15:00:00'),
('23UP', '17:00:00'),
('23UP', '19:00:00'),
('56UP', '08:00:00'),
('56UP', '12:00:00'),
('56UP', '16:00:00'),
('56UP', '20:00:00');
