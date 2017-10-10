-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2017 at 12:47 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reviewhibernate`
--

-- --------------------------------------------------------

--
-- Table structure for table `marking`
--

CREATE TABLE `marking` (
  `ReviewResult_reviewId` int(11) NOT NULL,
  `questionMarking` float NOT NULL,
  `questionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marking`
--

INSERT INTO `marking` (`ReviewResult_reviewId`, `questionMarking`, `questionNumber`) VALUES
(2, 1, 1),
(2, 1, 2),
(2, 1, 3),
(2, 1, 4),
(2, 1, 5),
(4, 3, 1),
(4, 2, 2),
(4, 3, 3),
(5, 2, 1),
(5, 1, 2),
(5, 3, 3),
(6, 0, 1),
(6, 5, 2),
(6, 5, 3),
(7, 1, 1),
(7, 1, 2),
(7, 3, 3),
(8, 2, 1),
(8, 1, 2),
(8, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `reviewlist`
--

CREATE TABLE `reviewlist` (
  `reviewListId` int(11) NOT NULL,
  `courseCode` varchar(255) DEFAULT NULL,
  `numberOfQuestion` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `reviewNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviewlist`
--

INSERT INTO `reviewlist` (`reviewListId`, `courseCode`, `numberOfQuestion`, `questionId`, `reviewNumber`) VALUES
(1, 'CSE333', 5, 1, 2),
(2, 'CSE331', 3, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `reviewresult`
--

CREATE TABLE `reviewresult` (
  `reviewId` int(11) NOT NULL,
  `courseCode` varchar(255) DEFAULT NULL,
  `numOfQues` int(11) NOT NULL,
  `userName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviewresult`
--

INSERT INTO `reviewresult` (`reviewId`, `courseCode`, `numOfQues`, `userName`) VALUES
(1, 'CSE333', 5, '25'),
(2, 'CSE333', 5, '23'),
(3, 'CSE331', 3, '23'),
(4, 'cse331', 3, 'a'),
(5, 'cse331', 3, '997'),
(6, 'CSE331', 3, '45'),
(7, 'cse331', 3, '99'),
(8, 'cse331', 3, '9');

-- --------------------------------------------------------

--
-- Table structure for table `review_collection`
--

CREATE TABLE `review_collection` (
  `ReviewList_reviewListId` int(11) NOT NULL,
  `questionMarking` float NOT NULL,
  `questionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_collection`
--

INSERT INTO `review_collection` (`ReviewList_reviewListId`, `questionMarking`, `questionNumber`) VALUES
(1, 2.5, 1),
(1, 2.5, 2),
(1, 3, 3),
(1, 2.5, 4),
(1, 2, 5),
(2, 2, 1),
(2, 2.16667, 2),
(2, 3.66667, 3);

-- --------------------------------------------------------

--
-- Table structure for table `setkey`
--

CREATE TABLE `setkey` (
  `courseCode` varchar(255) NOT NULL,
  `courseKey` varchar(255) DEFAULT NULL,
  `courseTitle` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `questionSetId` int(11) NOT NULL,
  `semester` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setkey`
--

INSERT INTO `setkey` (`courseCode`, `courseKey`, `courseTitle`, `department`, `questionSetId`, `semester`) VALUES
('CSE331', '111', 'DatabaseManagement', 'ICT', 1, '1-2'),
('CSE333', '12345', 'Database', 'CSE', 1, '3-1');

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `userName` varchar(255) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `userType` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`userName`, `department`, `email`, `firstName`, `lastName`, `password`, `userType`) VALUES
('A', 'CSE', 'abc@gmail.com', 'A', 'A', 'A', 'teacher'),
('gg', 'cse', 'as@gmail.com', NULL, NULL, 'g', 'student'),
('hhh', 'fffg', 'b@b.com', NULL, NULL, 'h', 'student'),
('rrr', 'b', 'a@a.com', 'ggg', 'ddd', 'g', 'teacher');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `marking`
--
ALTER TABLE `marking`
  ADD KEY `FK_32j3uqcthmkcfji99vm1iheci` (`ReviewResult_reviewId`);

--
-- Indexes for table `reviewlist`
--
ALTER TABLE `reviewlist`
  ADD PRIMARY KEY (`reviewListId`);

--
-- Indexes for table `reviewresult`
--
ALTER TABLE `reviewresult`
  ADD PRIMARY KEY (`reviewId`);

--
-- Indexes for table `review_collection`
--
ALTER TABLE `review_collection`
  ADD KEY `FK_g69oci79x8imthrbtxwfanro` (`ReviewList_reviewListId`);

--
-- Indexes for table `setkey`
--
ALTER TABLE `setkey`
  ADD PRIMARY KEY (`courseCode`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reviewlist`
--
ALTER TABLE `reviewlist`
  MODIFY `reviewListId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `reviewresult`
--
ALTER TABLE `reviewresult`
  MODIFY `reviewId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `marking`
--
ALTER TABLE `marking`
  ADD CONSTRAINT `FK_32j3uqcthmkcfji99vm1iheci` FOREIGN KEY (`ReviewResult_reviewId`) REFERENCES `reviewresult` (`reviewId`);

--
-- Constraints for table `review_collection`
--
ALTER TABLE `review_collection`
  ADD CONSTRAINT `FK_g69oci79x8imthrbtxwfanro` FOREIGN KEY (`ReviewList_reviewListId`) REFERENCES `reviewlist` (`reviewListId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
