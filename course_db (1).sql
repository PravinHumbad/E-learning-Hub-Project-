-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2024 at 05:17 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

CREATE TABLE `bookmark` (
  `user_id` varchar(20) NOT NULL,
  `playlist_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` varchar(20) NOT NULL,
  `content_id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` int(10) NOT NULL,
  `message` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `playlist_id` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `video` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'deactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `tutor_id`, `playlist_id`, `title`, `description`, `video`, `thumb`, `date`, `status`) VALUES
('CpmzaWNBV2ojGijy1sGc', 'VmqVrnzzsFMbFpDPjS2M', 'eAG0bffNFahZFFPH3LvS', 'hello wold ', 'simple java program to print hello world', 'iPiYgWmNESTfA4pcgWzp.mp4', 'gvT3GVrKGrexxffVbRw0.jpg', '2024-04-02', 'active'),
('Df6mhZCzaubBlyRDXw4S', 'izG02SQvID7xNuOwQKup', 'Noz9qs7cSP6BVImrIFvg', ' #1 - Getting Started with Java', 'Java Programming', 'efqnUI3iKgZB78vSu7Jh.mp4', 'rkVbcShIWaEPxWSmytHc.png', '2024-04-11', 'active'),
('04yq4rhjV2rUWPIjp6M7', 'izG02SQvID7xNuOwQKup', 'Noz9qs7cSP6BVImrIFvg', '#2 - Variables and Data Types', 'Java Programming ', '8OWAv87uWqPr8yq5qHf0.mp4', 'rKeBHqk1bvTjEnGPIkM4.png', '2024-04-11', 'active'),
('S091qDlzKsYrwW6lTCfE', 'izG02SQvID7xNuOwQKup', 'Noz9qs7cSP6BVImrIFvg', '#3 - Arithmetic and Assignment Operators', 'Java Programming ', '815TqbcvHqLl0vHbKgsQ.mp4', 'pV0XEi6IHTl3T3i9H61g.png', '2024-04-11', 'active'),
('5pfhLcPdqgrjuHQxciQm', 'izG02SQvID7xNuOwQKup', 'Noz9qs7cSP6BVImrIFvg', ' #4 - String Manipulation (1)', 'Java Programming', 'U3nqRiHcAfb9aiwGj6Fe.mp4', 'kWofeH9vfl32bMKDR4Nh.png', '2024-04-11', 'active'),
('tKotvWNTbBjSn9MwMvaS', 'izG02SQvID7xNuOwQKup', 'Noz9qs7cSP6BVImrIFvg', '#5 - Conditional Statements', 'Java Programming ', 'Z5mnMmTBwo9mIW5gc95a.mp4', 'UKoTHevWsnCQpoRAcKqF.png', '2024-04-11', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `user_id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `content_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'deactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `playlist`
--

INSERT INTO `playlist` (`id`, `tutor_id`, `title`, `description`, `thumb`, `date`, `status`) VALUES
('eAG0bffNFahZFFPH3LvS', 'VmqVrnzzsFMbFpDPjS2M', 'java', 'java', 'YzRuR7NuRdRKJkj2UWov.jpg', '2024-04-02', 'active'),
('Noz9qs7cSP6BVImrIFvg', 'izG02SQvID7xNuOwQKup', 'java', 'java', '4BWgsIt1gA0fW9ZztiEH.png', '2024-04-02', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `question` varchar(500) NOT NULL,
  `option1` varchar(500) NOT NULL,
  `option2` varchar(500) NOT NULL,
  `option3` varchar(500) NOT NULL,
  `option4` varchar(500) NOT NULL,
  `correct_answer` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`question`, `option1`, `option2`, `option3`, `option4`, `correct_answer`) VALUES
('Who invented Java Programming?', ' Guido van Rossum', 'James Gosling', 'Dennis Ritchie', 'Bjarne Stroustrup', 'James Gosling'),
('Which of the following is not an OOPS concept in Java?', 'Polymorphism', 'Inheritance', 'Compilation', 'Encapsulation', 'Compilation'),
('Which one of the following is not an access modifier?', 'Protected', 'Void', 'Public', 'Private', 'Void');

-- --------------------------------------------------------

--
-- Table structure for table `tutors`
--

CREATE TABLE `tutors` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `profession` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tutors`
--

INSERT INTO `tutors` (`id`, `name`, `profession`, `email`, `password`, `image`) VALUES
('izG02SQvID7xNuOwQKup', 'Pravin Rajendra Humbad', 'teacher', 'pravin@gmail.com', '9a0cf5157c8e889dbceeaa2c4f9a8327d8c2ebe6', 'qulAQ5ZaSK2p2EEptFZV.jpg'),
('VmqVrnzzsFMbFpDPjS2M', 'Nitin Gaikwad', 'teacher', 'nitin@gmail.com', '44d16cbe12265f91d76bad742da61ab7194c0e5a', 'PSyCQzSGE8Y68D2dWGuf.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `image`) VALUES
('AL09T57Op7Xr02hF7k1u', 'Vitthal Jadhav', 'vitthal@gmail.com', '5d0646773eff28f1444a714add5e581e3e32b708', 'gbLnZcxca9mhnrVK1Dxd.jpg'),
('isg1G1J6708ENFkHRTdf', 'Nitin Gaikwad', 'nitin@gmail.com', '44d16cbe12265f91d76bad742da61ab7194c0e5a', 'kRz3UG0z42RWbZ2kMEtI.jpeg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
