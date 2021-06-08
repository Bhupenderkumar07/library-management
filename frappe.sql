-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2021 at 08:55 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `frappe`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `authors` varchar(100) NOT NULL,
  `average_rating` float NOT NULL,
  `isbn` varchar(45) NOT NULL,
  `isbn13` bigint(20) NOT NULL,
  `language_code` varchar(20) NOT NULL,
  `num_pages` int(11) NOT NULL,
  `ratings_count` int(11) NOT NULL,
  `text_reviews_count` int(11) NOT NULL,
  `publication_date` date NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `stock` int(5) NOT NULL DEFAULT 1,
  `total` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `authors`, `average_rating`, `isbn`, `isbn13`, `language_code`, `num_pages`, `ratings_count`, `text_reviews_count`, `publication_date`, `publisher`, `stock`, `total`) VALUES
(2, 'Harry Potter and the Order of the Phoenix (Harry Potter  #5)', 'J.K. Rowling/Mary GrandPré', 4.49, '0439358078', 9780439358071, 'eng', 870, 2153167, 29221, '2004-09-01', 'Scholastic Inc.', 1, 1),
(8, 'Harry Potter Boxed Set  Books 1-5 (Harry Potter  #1-5)', 'J.K. Rowling/Mary GrandPré', 4.78, '0439682584', 9780439682589, 'eng', 2690, 41428, 164, '2004-09-13', 'Scholastic', 1, 3),
(2002, 'Harry Potter Schoolbooks Box Set: Two Classic Books from the Library of Hogwarts School of Witchcraft and Wizardry', 'J.K. Rowling', 4.4, '043932162X', 9780439321624, 'eng', 240, 11515, 139, '2001-11-01', 'Arthur A. Levine', 1, 1),
(41909, 'Harry Potter ve Sırlar Odası (Harry Potter  #2)', 'J.K. Rowling/Sevin Okyay', 4.42, '3570211029', 9783570211021, 'tur', 403, 1000, 41, '2001-10-01', 'Yapı Kredi Yayınları', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `member_name` varchar(20) NOT NULL,
  `member_phone` int(10) NOT NULL,
  `member_email` varchar(50) NOT NULL,
  `member_address` varchar(50) NOT NULL,
  `outstanding_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `member_name`, `member_phone`, `member_email`, `member_address`, `outstanding_amount`, `total_amount`) VALUES
(63, 'bhupender', 2147483647, 'bhupenderkumarcr@gmail.com', 'ahmedabad', 200, 3579),
(66, 'bhup', 78456941, 'b@gmail.com', 'jhansi', 140, 0),
(67, 'bhup', 78456941, 'b@gmail.com', 'jhansi', 490, 100);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `issue_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `rent` int(11) DEFAULT 0,
  `rent_paid` varchar(4) DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `book_id`, `member_id`, `issue_date`, `return_date`, `rent`, `rent_paid`) VALUES
(80, 8, 66, '2021-06-07', '2021-06-09', 100, 'yes'),
(82, 8, 67, '2021-06-10', '2021-06-08', 100, 'yes'),
(83, 2, 67, '2021-06-08', '2021-06-08', 350, 'no'),
(84, 8, 67, '2021-06-08', NULL, 0, 'no'),
(85, 8, 63, '2021-06-09', NULL, 0, 'no');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `member_fk` (`member_id`),
  ADD KEY `book_fk` (`book_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `book_fk` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `member_fk` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
