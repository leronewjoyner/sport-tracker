-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 20, 2024 at 06:28 PM
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
-- Database: `sport_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `coaches`
--

CREATE TABLE `coaches` (
  `Coach_ID` smallint(5) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `DOB` date NOT NULL,
  `Experience` tinyint(3) UNSIGNED DEFAULT NULL,
  `Championships` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coaches`
--

INSERT INTO `coaches` (`Coach_ID`, `Name`, `DOB`, `Experience`, `Championships`) VALUES
(1, 'Quin Snyder', '1966-10-30', 9, 0),
(2, 'Joe Mazzulla', '1988-06-30', 2, 0),
(3, 'Jacque Vaughn', '1975-02-11', 4, 0),
(4, 'Steve Clifford', '1961-09-17', 10, 0),
(5, 'Billy Donovan', '1965-05-30', 9, 0),
(6, 'J.B. Bickerstaff', '1979-03-10', 6, 0),
(7, 'Jason Kidd', '1973-03-23', 5, 0),
(8, 'Michael Malone', '1971-09-15', 12, 1),
(9, 'Monty Williams', '1971-10-08', 9, 0),
(10, 'Steve Kerr', '1965-09-27', 10, 4),
(11, 'Ime Udoka', '1977-08-09', 2, 0),
(12, 'Rick Carlisle', '1959-10-27', 21, 1),
(13, 'Tyronn Lue', '1977-05-03', 10, 1),
(14, 'Darvin Ham', '1973-07-23', 2, 0),
(15, 'Taylor Jenkins', '1984-09-12', 5, 0),
(16, 'Erik Spoelstra', '1970-11-01', 15, 2),
(17, 'Adrian Griffin', '1974-07-04', 1, 0),
(18, 'Chris Finch', '1969-11-06', 3, 0),
(19, 'Willie Green', '1981-07-28', 3, 0),
(20, 'Tom Thibodeau', '1958-01-17', 13, 0),
(21, 'Mark Daigneault', '1985-02-23', 4, 0),
(22, 'Jamahl Mosley', '1978-10-06', 3, 0),
(23, 'Nick Nurse', '1967-07-24', 10, 1),
(24, 'Frank Vogel', '1973-06-21', 13, 1),
(25, 'Chauncey Billups', '1976-09-25', 3, 0),
(26, 'Mike Brown', '1970-03-05', 12, 0),
(27, 'Gregg Popovich', '1949-01-28', 28, 5),
(28, 'Darko Rajaković', '1979-02-22', 1, 0),
(29, 'Will Hardy', '1988-01-21', 2, 0),
(30, 'Wes Unseld Jr.', '1975-09-20', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `Game_ID` smallint(5) UNSIGNED NOT NULL,
  `H_Team_ID` smallint(5) UNSIGNED NOT NULL,
  `A_Team_ID` smallint(5) UNSIGNED NOT NULL,
  `H_Team_Score` smallint(5) UNSIGNED NOT NULL,
  `A_Team_Score` smallint(5) UNSIGNED NOT NULL,
  `Game_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`Game_ID`, `H_Team_ID`, `A_Team_ID`, `H_Team_Score`, `A_Team_Score`, `Game_Date`) VALUES
(1, 10, 13, 120, 114, '2023-11-30'),
(2, 13, 10, 113, 112, '2023-12-02'),
(3, 13, 10, 121, 113, '2023-12-14'),
(4, 10, 13, 125, 130, '2024-02-14'),
(5, 10, 14, 144, 145, '2024-01-27'),
(6, 10, 14, 128, 110, '2024-02-22'),
(7, 14, 10, 121, 128, '2024-03-16'),
(8, 14, 10, 120, 134, '2024-04-09'),
(9, 10, 24, 104, 108, '2023-10-24'),
(10, 24, 10, 123, 115, '2023-11-22'),
(11, 24, 10, 119, 116, '2023-12-12'),
(12, 10, 24, 113, 112, '2024-02-10'),
(13, 26, 10, 114, 122, '2023-10-27'),
(14, 10, 26, 102, 101, '2023-11-01'),
(15, 26, 10, 124, 123, '2023-11-28'),
(16, 10, 26, 133, 134, '2024-01-25'),
(17, 14, 13, 130, 125, '2023-11-01'),
(18, 14, 13, 106, 103, '2024-01-07'),
(19, 13, 14, 127, 116, '2024-01-23'),
(20, 13, 14, 112, 116, '2024-02-28'),
(21, 24, 13, 122, 131, '2024-01-03'),
(22, 13, 24, 138, 111, '2024-01-08'),
(23, 24, 13, 92, 105, '2024-04-09'),
(24, 13, 24, 108, 124, '2024-04-10');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `Player_ID` smallint(5) UNSIGNED NOT NULL,
  `Team_ID` smallint(5) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Height` decimal(4,1) NOT NULL,
  `Weight` decimal(5,1) NOT NULL,
  `Position` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `Jersey_No` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`Player_ID`, `Team_ID`, `Name`, `Height`, `Weight`, `Position`, `DOB`, `Jersey_No`) VALUES
(1, 10, 'Stephen Curry', 6.2, 185.0, 'PG', '1988-03-14', 30),
(2, 10, 'Klay Thompson', 6.6, 215.0, 'SG', '1990-02-08', 11),
(3, 10, 'Draymond Green', 6.6, 230.0, 'PF', '1990-03-04', 23),
(4, 10, 'Andrew Wiggins', 6.7, 197.0, 'SF', '1995-02-23', 22),
(5, 10, 'Chris Paul', 6.0, 175.0, 'PG', '1985-05-06', 3),
(6, 10, 'Kevon Looney', 6.9, 222.0, 'C', '1996-02-06', 5),
(7, 10, 'Jonathan Kuminga', 6.7, 210.0, 'SF', '2002-10-06', 0),
(8, 10, 'Gary Payton II', 6.3, 180.0, 'PG', '1992-05-01', 0),
(9, 10, 'Moses Moody', 6.6, 205.0, 'SG', '2002-03-31', 4),
(10, 10, 'Patrick Baldwin Jr.', 6.9, 220.0, 'SF', '2002-11-18', 7),
(11, 10, 'Dario Šarić', 6.1, 240.0, 'PF', '1994-07-30', 10),
(12, 10, 'Trayce Jackson-Davis', 6.9, 240.0, 'PF', '1999-01-20', 32),
(13, 10, 'Ryan Rollins', 6.4, 185.0, 'SG', '2001-09-09', 4),
(14, 13, 'Kawhi Leonard', 6.7, 225.0, 'SF', '1991-06-29', 2),
(15, 13, 'Paul George', 6.8, 220.0, 'SG', '1990-05-02', 13),
(16, 13, 'Russell Westbrook', 6.3, 200.0, 'PG', '1988-11-12', 0),
(17, 13, 'Ivica Zubac', 7.0, 240.0, 'C', '1997-03-18', 40),
(18, 13, 'Norman Powell', 6.3, 215.0, 'SG', '1993-05-25', 24),
(19, 13, 'Marcus Morris Sr.', 6.7, 218.0, 'PF', '1989-09-02', 31),
(20, 13, 'Terance Mann', 6.5, 210.0, 'SG', '1996-10-18', 14),
(21, 13, 'Bones Hyland', 6.3, 169.0, 'PG', '1999-01-15', 10),
(22, 13, 'Robert Covington', 6.7, 209.0, 'SF', '1990-12-14', 33),
(23, 13, 'Kendrick Nunn', 6.2, 189.0, 'PG', '1995-08-03', 1),
(24, 13, 'Jason Preston', 6.3, 190.0, 'PG', '1999-05-10', 0),
(25, 13, 'Moses Brown', 7.2, 250.0, 'C', '1999-10-13', 10),
(26, 13, 'Aminu Mohammed', 6.5, 185.0, 'SG', '2001-09-18', 15),
(27, 14, 'LeBron James', 6.9, 250.0, 'SF', '1984-12-30', 6),
(28, 14, 'Anthony Davis', 6.1, 253.0, 'PF', '1993-03-11', 3),
(29, 14, 'Angelo Russell', 6.4, 193.0, 'PG', '1996-02-23', 1),
(30, 14, 'Austin Reaves', 6.5, 197.0, 'SG', '1998-05-29', 15),
(31, 14, 'Rui Hachimura', 6.8, 230.0, 'PF', '1998-02-08', 28),
(32, 14, 'Jared Vanderbilt', 6.8, 214.0, 'PF', '1999-04-03', 8),
(33, 14, 'Troy Brown Jr.', 6.6, 219.0, 'SF', '1999-07-28', 7),
(34, 14, 'Mo Bamba', 7.0, 231.0, 'C', '1998-05-21', 5),
(35, 14, 'Gabriel Nunez', 6.9, 230.0, 'PF', '1995-06-14', 4),
(36, 14, 'Scottie Pippen Jr.', 6.3, 185.0, 'PG', '1999-10-26', 11),
(37, 14, 'Max Christie', 6.6, 189.0, 'SG', '2003-07-02', 10),
(38, 14, 'Devontae Cacok', 6.6, 220.0, 'SF', '1996-03-08', 1),
(39, 24, 'Kevin Durant', 6.1, 240.0, 'SF', '1988-09-29', 35),
(40, 24, 'Devin Booker', 6.5, 206.0, 'SG', '1996-10-30', 1),
(41, 24, 'Bradley Beal', 6.4, 207.0, 'SG', '1993-06-28', 3),
(42, 24, 'Jusuf Nurkić', 6.1, 290.0, 'C', '1994-08-23', 27),
(43, 24, 'Grayson Allen', 6.4, 198.0, 'SG', '1995-10-08', 12),
(44, 24, 'Damion Lee', 6.5, 210.0, 'SG', '1992-10-21', 10),
(45, 24, 'T.J. Warren', 6.8, 225.0, 'SF', '1993-09-05', 1),
(46, 24, 'Keita Bates-Diop', 6.8, 219.0, 'SF', '1996-01-23', 31),
(47, 24, 'Yuta Watanabe', 6.9, 230.0, 'SF', '1994-10-13', 18),
(48, 24, 'Darius Bazley', 6.8, 208.0, 'SF', '2000-06-05', 7),
(49, 24, 'Isaiah Todd', 6.9, 219.0, 'PF', '2001-11-12', 0),
(50, 24, 'Josh Okogie', 6.4, 210.0, 'SG', '1998-05-01', 3),
(51, 26, 'De Aaron Fox', 6.3, 194.0, 'PG', '1997-12-20', 5),
(52, 26, 'Domantas Sabonis', 6.9, 240.0, 'C', '1996-03-03', 10),
(53, 26, 'Keegan Murray', 6.8, 225.0, 'SF', '2000-08-19', 13),
(54, 26, 'Harrison Barnes', 6.8, 225.0, 'SF', '1992-05-30', 40),
(55, 26, 'Malik Monk', 6.3, 200.0, 'SG', '1998-02-04', 0),
(56, 26, 'Kevin Huerter', 6.7, 225.0, 'SG', '1998-01-01', 9),
(57, 26, 'Richaun Holmes', 6.1, 240.0, 'C', '1993-10-15', 22),
(58, 26, 'Davion Mitchell', 6.0, 205.0, 'PG', '1998-09-05', 15),
(59, 26, 'Trey Lyles', 6.8, 225.0, 'PF', '1996-11-05', 41),
(60, 26, 'KZ Okpala', 6.8, 215.0, 'SF', '1999-06-02', 0),
(61, 26, 'Neemias Queta', 7.0, 250.0, 'C', '1999-01-02', 88),
(62, 26, 'Matthew Dellavedova', 6.3, 200.0, 'PG', '1990-09-08', 18),
(63, 13, 'James Harden', 6.5, 220.0, 'PG', '1989-08-26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `player_stats`
--

CREATE TABLE `player_stats` (
  `Stat_ID` smallint(5) UNSIGNED NOT NULL,
  `Game_ID` smallint(5) UNSIGNED NOT NULL,
  `Player_ID` smallint(5) UNSIGNED DEFAULT NULL,
  `Points` smallint(5) UNSIGNED NOT NULL,
  `Assists` smallint(5) UNSIGNED NOT NULL,
  `Rebounds` smallint(5) UNSIGNED NOT NULL,
  `Steals` smallint(5) UNSIGNED NOT NULL,
  `Blocks` smallint(5) UNSIGNED NOT NULL,
  `Fouls` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_stats`
--

INSERT INTO `player_stats` (`Stat_ID`, `Game_ID`, `Player_ID`, `Points`, `Assists`, `Rebounds`, `Steals`, `Blocks`, `Fouls`) VALUES
(1, 1, 15, 15, 10, 1, 0, 0, 5),
(2, 1, 63, 18, 7, 3, 1, 0, 3),
(3, 1, 14, 23, 0, 7, 2, 0, 2),
(4, 1, 20, 9, 1, 5, 1, 0, 1),
(5, 1, 17, 18, 0, 13, 0, 1, 1),
(6, 1, 16, 14, 6, 11, 0, 0, 1),
(7, 1, 18, 5, 0, 0, 1, 0, 1),
(8, 1, NULL, 10, 2, 2, 0, 0, 2),
(9, 1, NULL, 0, 1, 1, 0, 0, 2),
(10, 1, NULL, 0, 0, 0, 0, 0, 2),
(11, 1, 2, 22, 2, 6, 0, 1, 2),
(12, 1, 1, 26, 8, 7, 1, 1, 2),
(13, 1, 3, 13, 5, 5, 0, 0, 5),
(14, 1, 9, 13, 1, 3, 0, 1, 2),
(15, 1, 6, 2, 2, 5, 0, 0, 2),
(16, 1, NULL, 13, 2, 8, 0, 0, 2),
(17, 1, 11, 13, 5, 5, 1, 0, 2),
(18, 1, 7, 17, 3, 6, 1, 1, 0),
(19, 1, NULL, 1, 2, 2, 0, 0, 1),
(20, 2, 1, 22, 11, 4, 0, 0, 0),
(21, 2, 2, 17, 2, 6, 1, 0, 3),
(22, 2, 3, 21, 4, 9, 0, 1, 2),
(23, 2, 9, 21, 2, 5, 2, 0, 3),
(24, 2, 11, 6, 3, 2, 1, 0, 2),
(25, 2, NULL, 12, 3, 6, 1, 2, 2),
(26, 2, 6, 7, 3, 8, 0, 1, 1),
(27, 2, 7, 6, 0, 2, 0, 0, 0),
(28, 2, NULL, 0, 3, 0, 0, 0, 2),
(29, 2, 14, 20, 7, 8, 1, 0, 2),
(30, 2, 15, 25, 6, 6, 1, 0, 5),
(31, 2, 63, 21, 9, 5, 1, 0, 4),
(32, 2, 20, 3, 2, 2, 1, 0, 1),
(33, 2, 17, 12, 1, 7, 0, 3, 4),
(34, 2, 18, 12, 0, 1, 0, 0, 1),
(35, 2, NULL, 12, 1, 4, 1, 2, 3),
(36, 2, 16, 8, 2, 6, 0, 1, 0),
(37, 2, NULL, 0, 3, 1, 0, 0, 1),
(38, 3, NULL, 4, 2, 7, 3, 1, 2),
(39, 3, NULL, 17, 4, 4, 0, 0, 3),
(40, 3, NULL, 30, 5, 1, 2, 0, 1),
(41, 3, NULL, 8, 5, 7, 1, 0, 2),
(42, 3, NULL, 15, 1, 5, 1, 0, 4),
(43, 3, NULL, 12, 3, 2, 0, 0, 4),
(44, 3, NULL, 9, 0, 3, 0, 1, 5),
(45, 3, NULL, 5, 1, 6, 0, 0, 2),
(46, 3, NULL, 11, 1, 5, 1, 0, 1),
(47, 3, NULL, 2, 0, 3, 0, 0, 0),
(48, 3, NULL, 28, 15, 7, 1, 4, 3),
(49, 3, NULL, 27, 2, 8, 1, 1, 2),
(50, 3, NULL, 10, 2, 8, 0, 2, 5),
(51, 3, NULL, 18, 1, 4, 0, 0, 2),
(52, 3, NULL, 2, 2, 3, 1, 0, 1),
(53, 3, NULL, 21, 2, 5, 1, 0, 3),
(54, 3, NULL, 9, 2, 4, 0, 1, 0),
(55, 3, NULL, 4, 1, 1, 1, 1, 2),
(56, 3, NULL, 2, 0, 0, 1, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `Team_ID` smallint(5) UNSIGNED NOT NULL,
  `Team_Name` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Arena` varchar(100) NOT NULL,
  `Coach_ID` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`Team_ID`, `Team_Name`, `City`, `Arena`, `Coach_ID`) VALUES
(1, 'Atlanta Hawks', 'Atlanta', 'State Farm Arena', 1),
(2, 'Boston Celtics', 'Boston', 'TD Garden', 2),
(3, 'Brooklyn Nets', 'Brooklyn', 'Barclays Center', 3),
(4, 'Charlotte Hornets', 'Charlotte', 'Spectrum Center', 4),
(5, 'Chicago Bulls', 'Chicago', 'United Center', 5),
(6, 'Cleveland Cavaliers', 'Cleveland', 'Rocket Mortgage FieldHouse', 6),
(7, 'Dallas Mavericks', 'Dallas', 'American Airlines Center', 7),
(8, 'Denver Nuggets', 'Denver', 'Ball Arena', 8),
(9, 'Detroit Pistons', 'Detroit', 'Little Caesars Arena', 9),
(10, 'Golden State Warriors', 'San Francisco', 'Chase Center', 10),
(11, 'Houston Rockets', 'Houston', 'Toyota Center', 11),
(12, 'Indiana Pacers', 'Indianapolis', 'Gainbridge Fieldhouse', 12),
(13, 'Los Angeles Clippers', 'Los Angeles', 'Crypto.com Arena', 13),
(14, 'Los Angeles Lakers', 'Los Angeles', 'Crypto.com Arena', 14),
(15, 'Memphis Grizzlies', 'Memphis', 'FedExForum', 15),
(16, 'Miami Heat', 'Miami', 'Kaseya Center', 16),
(17, 'Milwaukee Bucks', 'Milwaukee', 'Fiserv Forum', 17),
(18, 'Minnesota Timberwolves', 'Minneapolis', 'Target Center', 18),
(19, 'New Orleans Pelicans', 'New Orleans', 'Smoothie King Center', 19),
(20, 'New York Knicks', 'New York', 'Madison Square Garden', 20),
(21, 'Oklahoma City Thunder', 'Oklahoma City', 'Paycom Center', 21),
(22, 'Orlando Magic', 'Orlando', 'Amway Center', 22),
(23, 'Philadelphia 76ers', 'Philadelphia', 'Wells Fargo Center', 23),
(24, 'Phoenix Suns', 'Phoenix', 'Footprint Center', 24),
(25, 'Portland Trail Blazers', 'Portland', 'Moda Center', 25),
(26, 'Sacramento Kings', 'Sacramento', 'Golden 1 Center', 26),
(27, 'San Antonio Spurs', 'San Antonio', 'Frost Bank Center', 27),
(28, 'Toronto Raptors', 'Toronto', 'Scotiabank Arena', 28),
(29, 'Utah Jazz', 'Salt Lake City', 'Delta Center', 29),
(30, 'Washington Wizards', 'Washington, D.C.', 'Capital One Arena', 30);

-- --------------------------------------------------------

--
-- Table structure for table `team_stats`
--

CREATE TABLE `team_stats` (
  `Team_Stat_ID` smallint(5) UNSIGNED NOT NULL,
  `Team_ID` smallint(5) UNSIGNED NOT NULL,
  `Wins` smallint(5) UNSIGNED NOT NULL,
  `Losses` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_stats`
--

INSERT INTO `team_stats` (`Team_Stat_ID`, `Team_ID`, `Wins`, `Losses`) VALUES
(1, 1, 36, 46),
(2, 2, 64, 18),
(3, 3, 32, 50),
(4, 4, 21, 61),
(5, 5, 39, 43),
(6, 6, 48, 34),
(7, 7, 50, 32),
(8, 8, 57, 25),
(9, 9, 14, 68),
(10, 10, 46, 36),
(11, 11, 41, 41),
(12, 12, 47, 35),
(13, 13, 51, 31),
(14, 14, 47, 35),
(15, 15, 27, 55),
(16, 16, 46, 36),
(17, 17, 49, 33),
(18, 18, 56, 26),
(19, 19, 49, 33),
(20, 20, 50, 32),
(21, 21, 57, 25),
(22, 22, 47, 35),
(23, 23, 47, 35),
(24, 24, 49, 33),
(25, 25, 21, 61),
(26, 26, 46, 36),
(27, 27, 22, 60),
(28, 28, 25, 57),
(29, 29, 31, 51),
(30, 30, 15, 67);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coaches`
--
ALTER TABLE `coaches`
  ADD PRIMARY KEY (`Coach_ID`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`Game_ID`),
  ADD KEY `H_Team_ID` (`H_Team_ID`),
  ADD KEY `A_Team_ID` (`A_Team_ID`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`Player_ID`),
  ADD KEY `Team_ID` (`Team_ID`);

--
-- Indexes for table `player_stats`
--
ALTER TABLE `player_stats`
  ADD PRIMARY KEY (`Stat_ID`),
  ADD KEY `Game_ID` (`Game_ID`),
  ADD KEY `Player_ID` (`Player_ID`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`Team_ID`),
  ADD KEY `fk_coach` (`Coach_ID`);

--
-- Indexes for table `team_stats`
--
ALTER TABLE `team_stats`
  ADD PRIMARY KEY (`Team_Stat_ID`),
  ADD KEY `Team_ID` (`Team_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `Game_ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `Player_ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `player_stats`
--
ALTER TABLE `player_stats`
  MODIFY `Stat_ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `Team_ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `team_stats`
--
ALTER TABLE `team_stats`
  MODIFY `Team_Stat_ID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_ibfk_1` FOREIGN KEY (`H_Team_ID`) REFERENCES `teams` (`Team_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `games_ibfk_2` FOREIGN KEY (`A_Team_ID`) REFERENCES `teams` (`Team_ID`) ON DELETE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `teams` (`Team_ID`) ON DELETE CASCADE;

--
-- Constraints for table `player_stats`
--
ALTER TABLE `player_stats`
  ADD CONSTRAINT `player_stats_ibfk_1` FOREIGN KEY (`Game_ID`) REFERENCES `games` (`Game_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_stats_ibfk_2` FOREIGN KEY (`Player_ID`) REFERENCES `players` (`Player_ID`) ON DELETE CASCADE;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `fk_coach` FOREIGN KEY (`Coach_ID`) REFERENCES `coaches` (`Coach_ID`);

--
-- Constraints for table `team_stats`
--
ALTER TABLE `team_stats`
  ADD CONSTRAINT `team_stats_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `teams` (`Team_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
