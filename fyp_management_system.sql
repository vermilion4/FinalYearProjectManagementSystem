-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 16, 2020 at 03:51 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fyp_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `area_interest`
--

CREATE TABLE IF NOT EXISTS `area_interest` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `area_interest`
--

INSERT INTO `area_interest` (`id`, `name`) VALUES
(1, 'Select Area of Interest'),
(2, 'Accountancy'),
(3, 'Expert System'),
(4, 'Multimedia'),
(5, 'Banking and Finance'),
(6, 'Civil Engineering'),
(7, 'Electrical Engineering'),
(8, 'Auditing'),
(9, 'Building Technology'),
(10, 'Education'),
(11, 'Estate Management'),
(12, 'Computer Science'),
(13, 'Political Science');

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `batchId` int(255) NOT NULL AUTO_INCREMENT,
  `batchName` varchar(255) NOT NULL,
  `startingDate` date DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT '0' COMMENT '0= inactive , 1= active',
  `sdpPart` tinyint(1) DEFAULT '1' COMMENT '0 or 1',
  `createdDtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`batchId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='batchDeadlinesInfo' AUTO_INCREMENT=20 ;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batchId`, `batchName`, `startingDate`, `isActive`, `sdpPart`, `createdDtm`) VALUES
(18, 'Harmattan 2016', '2016-02-07', 1, 2, '2019-04-04 14:51:21'),
(19, 'Rain 2016', '2016-04-28', 1, 1, '2019-04-04 14:51:31');

-- --------------------------------------------------------

--
-- Table structure for table `batch_settings`
--

CREATE TABLE IF NOT EXISTS `batch_settings` (
  `id` int(11) NOT NULL,
  `batchId` int(11) NOT NULL DEFAULT '0',
  `male_female_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=no;1=yes',
  `sdp1_grading` tinyint(1) NOT NULL DEFAULT '0',
  `internal_evaluation` tinyint(1) NOT NULL DEFAULT '0',
  `sdp2_grading` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `batch_settings`
--

INSERT INTO `batch_settings` (`id`, `batchId`, `male_female_group`, `sdp1_grading`, `internal_evaluation`, `sdp2_grading`) VALUES
(1, 18, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `batch_tasks`
--

CREATE TABLE IF NOT EXISTS `batch_tasks` (
  `taskId` int(11) NOT NULL AUTO_INCREMENT,
  `batchId` int(11) DEFAULT NULL,
  `sdpPart` tinyint(1) DEFAULT '1',
  `taskName` text,
  `taskDetail` text,
  `taskWeek` int(11) DEFAULT NULL,
  `taskDeadline` datetime DEFAULT NULL,
  `templateId` int(11) DEFAULT NULL,
  `hasDeliverable` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1=has deliverable',
  `createdDtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`taskId`),
  KEY `FK_batch_tasks_batch` (`batchId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `batch_tasks`
--

INSERT INTO `batch_tasks` (`taskId`, `batchId`, `sdpPart`, `taskName`, `taskDetail`, `taskWeek`, `taskDeadline`, `templateId`, `hasDeliverable`, `createdDtm`) VALUES
(1, 18, 1, 'Deliverable 01: Project Team List', '<p>\r\n\r\n</p><ul><li>Use <b>â€œTemplate-01â€</b> to fill in the details of project team members and submit hard copy to Project Coordinator .</li><li>Due Date: Monday, 25th April 2016 (Before 3:30pm)</li></ul>\r\n\r\n<br><p></p>', 3, '2016-04-25 15:30:00', 4, 1, '2016-04-21 22:48:26'),
(2, 19, 1, 'Start your project', '<p>Start your project<br></p>', 1, '2019-05-31 00:00:00', NULL, 1, '2019-05-11 19:41:45');

-- --------------------------------------------------------

--
-- Table structure for table `batch_templates`
--

CREATE TABLE IF NOT EXISTS `batch_templates` (
  `templateId` int(11) NOT NULL AUTO_INCREMENT,
  `batchId` int(11) DEFAULT NULL,
  `templateName` varchar(100) DEFAULT NULL,
  `templateLocation` varchar(150) DEFAULT NULL,
  `uploadedDtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`templateId`),
  KEY `FK_batch_templates_batch` (`batchId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `batch_templates`
--

INSERT INTO `batch_templates` (`templateId`, `batchId`, `templateName`, `templateLocation`, `uploadedDtm`) VALUES
(3, 18, 'Handbook-Version-2-0.pdf', 'Handbook-Version-2-0.pdf', '2016-04-21 21:26:59'),
(4, 18, 'Template -  01 - Project Team.doc', 'Template -  01 - Project Team.doc', '2016-04-21 21:27:02'),
(5, 18, 'Template -  02 - Inital Proposal.doc', 'Template -  02 - Inital Proposal.doc', '2016-04-21 21:27:06'),
(6, 18, 'Template -  04 - Proposal  Plan.doc', 'Template -  04 - Proposal  Plan.doc', '2016-04-21 21:27:56'),
(7, 18, 'Template -  05 - Project Report.doc', 'Template -  05 - Project Report.doc', '2016-04-21 21:27:59'),
(8, 18, '2019 template', '2019 template.jpg', '2019-08-28 17:22:38');

-- --------------------------------------------------------

--
-- Table structure for table `external_examiner`
--

CREATE TABLE IF NOT EXISTS `external_examiner` (
  `examinerId` int(255) NOT NULL AUTO_INCREMENT,
  `examinerName` varchar(100) NOT NULL,
  `examinerEmail` varchar(255) NOT NULL,
  `examinerPhone` varchar(50) NOT NULL,
  `examinerPassword` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`examinerId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='examinerGroupInfo' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `external_examiner`
--

INSERT INTO `external_examiner` (`examinerId`, `examinerName`, `examinerEmail`, `examinerPhone`, `examinerPassword`, `company`, `designation`, `isActive`) VALUES
(1, 'Bill Gates', 'gates@microsoft.com', '1234567890', '123', 'Microsoft', 'CEO', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE IF NOT EXISTS `faculty` (
  `facultyId` int(255) NOT NULL AUTO_INCREMENT,
  `facultyName` varchar(255) NOT NULL,
  `facultyPhoneNo` varchar(50) NOT NULL,
  `facultyEmail` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `facultyImage` varchar(255) DEFAULT NULL,
  `facultyPassword` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) DEFAULT '0',
  `isActive` tinyint(4) NOT NULL,
  `isCoordinator` tinyint(1) DEFAULT NULL,
  `createdDtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`facultyId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Faculty Details' AUTO_INCREMENT=28 ;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`facultyId`, `facultyName`, `facultyPhoneNo`, `facultyEmail`, `designation`, `facultyImage`, `facultyPassword`, `isAdmin`, `isActive`, `isCoordinator`, `createdDtm`) VALUES
(0, 'Super Admin', '', 'superadmin@fypms.com', '--', NULL, '123', 1, 1, 0, '2019-04-04 14:00:21'),
(18, 'Saud Khan', '+233458541454', 'sak@yahoo.com', 'Coordinator', 'NULL', '123', 0, 1, 1, '2019-05-11 14:28:08'),
(19, 'Muhammad Tunde', '12345678', 'mt@gmail.com', 'Supervisor', NULL, '123', 0, 1, NULL, '2019-04-04 14:57:50'),
(20, 'Uzair Muhammad', '12345678', 'muzair@gmail.com', 'Supervisor', NULL, '123', 1, 1, NULL, '2019-05-10 16:32:09'),
(21, 'Philip Mike', '12345678', 'philip@gmail.com', 'Supervisor', NULL, '123', 0, 1, NULL, '2019-05-11 07:02:40'),
(22, 'Obed Joe', '12345678', 'obed@gmail.com', 'Supervisor', NULL, '123', 0, 1, NULL, '2019-05-11 07:02:26'),
(23, 'Henry Mike', '12345678', 'henry@gmail.com', 'Supervisor', NULL, '123', 0, 1, NULL, '2019-04-04 14:58:01'),
(24, 'Charles Edmund', '08076565435', 'charles@gmail.com', 'Dr', NULL, '123', 0, 1, 1, '2019-05-11 14:48:04'),
(25, 'Anthony Wayne', '23376565435', 'aw@yahoo.com', 'Mr', NULL, '123', 0, 1, 1, '2019-05-11 14:47:54'),
(26, 'Felicia Ibrahim', '23376565098', 'fi@yahoo.com', 'Mrs', NULL, '123', 0, 1, 1, '2019-05-11 14:48:12'),
(27, 'Adams Francis', '23370065435', 'af@gmail.com', 'Mr', NULL, '123', 0, 1, 1, '2019-05-11 14:47:46');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_student_group`
--

CREATE TABLE IF NOT EXISTS `faculty_student_group` (
  `facultyStudentId` int(255) NOT NULL AUTO_INCREMENT,
  `groupId` int(255) NOT NULL,
  `facultyId` int(255) NOT NULL,
  PRIMARY KEY (`facultyStudentId`),
  KEY `fk_group_id` (`groupId`),
  KEY `fk_faculty_id` (`facultyId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='facultyGroupInfo' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `faculty_student_group`
--

INSERT INTO `faculty_student_group` (`facultyStudentId`, `groupId`, `facultyId`) VALUES
(2, 1, 21),
(3, 4, 23),
(4, 6, 23),
(5, 7, 20),
(6, 8, 18);

-- --------------------------------------------------------

--
-- Table structure for table `faculty_student_request`
--

CREATE TABLE IF NOT EXISTS `faculty_student_request` (
  `requestId` int(11) NOT NULL AUTO_INCREMENT,
  `facultyId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `requestDtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`requestId`),
  KEY `FK_faculty_student_request_faculty` (`facultyId`),
  KEY `FK_faculty_student_request_faculty_student_group` (`groupId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `faculty_student_request`
--


-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE IF NOT EXISTS `grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `sdpPart` int(11) DEFAULT NULL,
  `comments` text,
  `grade` varchar(50) DEFAULT NULL,
  `gradedBy` int(11) DEFAULT NULL COMMENT 'User id of user',
  `gradeDtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_grades_student` (`studentId`),
  KEY `FK_grades_student_group` (`groupId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `studentId`, `groupId`, `sdpPart`, `comments`, `grade`, `gradedBy`, `gradeDtm`) VALUES
(4, 14, 1, 2, '', 'A', 1, '2016-04-22 01:31:52'),
(5, 15, 1, 2, '', 'A', 1, '2016-04-22 01:31:52'),
(6, 21, 1, 2, '', 'B', 1, '2016-04-22 01:31:53'),
(7, 14, 1, 1, '', 'A', 21, '2016-04-22 01:34:28'),
(8, 15, 1, 1, '', 'A', 21, '2016-04-22 01:34:28'),
(9, 21, 1, 1, '', 'B+', 21, '2016-04-22 01:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `group_requests`
--

CREATE TABLE IF NOT EXISTS `group_requests` (
  `requestId` int(255) NOT NULL AUTO_INCREMENT,
  `studentId` int(255) NOT NULL,
  `groupId` int(255) NOT NULL,
  PRIMARY KEY (`requestId`),
  KEY `FK_group_requests_student` (`studentId`),
  KEY `FK_group_requests_student_group` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `group_requests`
--


-- --------------------------------------------------------

--
-- Table structure for table `group_uploads`
--

CREATE TABLE IF NOT EXISTS `group_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `taskId` int(11) NOT NULL,
  `uploadFile` varchar(50) NOT NULL,
  `uploadedBy` int(11) NOT NULL COMMENT 'userId of uploader',
  `uploadedDtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_group_uploads_faculty_student_group` (`groupId`),
  KEY `FK_group_uploads_batch_tasks` (`taskId`),
  KEY `FK_group_uploads_student` (`uploadedBy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `group_uploads`
--

INSERT INTO `group_uploads` (`id`, `groupId`, `taskId`, `uploadFile`, `uploadedBy`, `uploadedDtm`) VALUES
(1, 1, 1, 'group_1_deliverable_1.doc', 15, '2016-04-21 22:49:18'),
(2, 7, 2, 'group_7_deliverable_2.jpg', 102, '2019-05-11 19:43:11'),
(3, 8, 1, 'group_8_deliverable_1.jpg', 103, '2020-02-16 16:18:54');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_logs`
--

CREATE TABLE IF NOT EXISTS `meeting_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supervisor_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `meeting_title` varchar(50) NOT NULL,
  `meeting_dtm` datetime NOT NULL,
  `comments` text,
  `meeting_status` enum('Pending','Done','Cancelled','Postponed') NOT NULL DEFAULT 'Pending',
  `created_dtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_meeting_logs_faculty` (`supervisor_id`),
  KEY `FK_meeting_logs_faculty_student_group` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Maintain all meeting logs of supervisors with students' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `meeting_logs`
--

INSERT INTO `meeting_logs` (`id`, `supervisor_id`, `group_id`, `meeting_title`, `meeting_dtm`, `comments`, `meeting_status`, `created_dtm`) VALUES
(1, 21, 1, 'Meeting 01 - Group Formation', '2016-04-30 15:30:00', '', 'Done', '2016-04-21 23:16:54');

-- --------------------------------------------------------

--
-- Table structure for table `project_repository`
--

CREATE TABLE IF NOT EXISTS `project_repository` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batchId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_project_repository_batch` (`batchId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `project_repository`
--

INSERT INTO `project_repository` (`id`, `batchId`) VALUES
(1, 18);

-- --------------------------------------------------------

--
-- Table structure for table `repository_users`
--

CREATE TABLE IF NOT EXISTS `repository_users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL DEFAULT '0',
  `user_email` varchar(50) NOT NULL DEFAULT '0',
  `user_password` varchar(50) DEFAULT NULL,
  `access_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1= full-access '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `repository_users`
--


-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `studentId` int(255) NOT NULL AUTO_INCREMENT,
  `studentName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `studentCMS` varchar(50) CHARACTER SET utf8 NOT NULL,
  `studentEmail` varchar(255) CHARACTER SET utf8 NOT NULL,
  `studentPhoneNo` varchar(50) CHARACTER SET utf8 NOT NULL,
  `studentGender` varchar(10) CHARACTER SET utf8 NOT NULL,
  `studentPassword` varchar(255) CHARACTER SET utf8 NOT NULL,
  `studentImage` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `groupId` int(255) DEFAULT NULL,
  `isLeader` int(1) DEFAULT NULL,
  `batchId` int(4) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `createdDtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`studentId`),
  KEY `FK_student_batch` (`batchId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='FYP Student Records' AUTO_INCREMENT=104 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentId`, `studentName`, `studentCMS`, `studentEmail`, `studentPhoneNo`, `studentGender`, `studentPassword`, `studentImage`, `groupId`, `isLeader`, `batchId`, `isActive`, `createdDtm`) VALUES
(14, 'John Doe', '7757', 'muneeb_420@gmail.com', '01234565', 'male', '123', '56fff928b82971.36534035.jpg', 1, NULL, 18, 1, '2019-04-04 14:05:24'),
(15, 'Umair Qamar', '10776', 'umairqamar@live.com', '03458541454', 'male', '123', '57178d49d31f15.75642865.jpg', 1, 1, 18, 1, '2016-04-03 14:30:06'),
(21, 'David Jones', '7471', 'dj@live.com', '+2330900039339', 'male', '123', '56fff9374231d1.64504225.jpg', 1, NULL, 18, 1, '2019-05-02 12:47:09'),
(43, 'Aizaz Ahmed Abbasi', '7736', 'aizaz@gmail.com', '923211234567', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-10 15:28:47'),
(44, 'Felix Edmund', '8781', 'felix@gmail.com', '1234567', 'male', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:47:48'),
(45, 'Alicia Esther', '7740', 'AE@gmail.com', '033569870', 'female', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:48:18'),
(46, 'John Mike', '7759', 'jm@hotmail.com', '03356980', 'male', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:51:02'),
(47, 'Moses Abed', '8658', 'ma@gmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:54:05'),
(48, 'Philip Desmond', '8627', 'pd@yahoo.com', '033564897', 'male', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:48:38'),
(49, 'Usman Javaid', '8939', 'usman@gmail.com', '03369872', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:07:23'),
(50, 'Sheraz Anwar', '8660', 'sheraz@hotmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:08:05'),
(51, 'Aisha Kuffor', '8617', 'ak@yahoo.com', '0336589741', 'female', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:49:10'),
(52, 'Ayesha Hashim', '9214', 'ayesha@yahoo.com', '033658970', 'female', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:09:52'),
(53, 'Mariya Sajjad', '9331', 'mariya@gmail.com', '033658970', 'female', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:11:07'),
(54, 'Hannah Arif', '9231', 'hina@gmail.com', '03325689', 'female', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:52:34'),
(55, 'Muhammad Adeen Riaz', '8659', 'adeen@yahoo.com', '033658970', 'male', '123', NULL, 4, 1, 18, 1, '2016-04-14 23:12:34'),
(56, 'Jamal Musa', '8621', 'jamal@hotmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:49:45'),
(57, 'Mike Chris', '8857', 'mc@hotmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:50:06'),
(58, 'Terry Mike', '7735', 'tm@yahoo.com', '0335698741', 'male', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:51:25'),
(59, 'Haseeb Ahmed', '7337', 'haseeb@yahoo.com', '03236116360', 'male', '123', NULL, 9, 1, 18, 1, '2020-02-16 15:58:34'),
(60, 'Muhammad Naeem', '7752', 'naeem@hotmail.com', '03135122852', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:18:17'),
(61, 'Tunde Philip', '8990', 'tp@yahoo.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:53:46'),
(62, 'Ali Haq', '8647', 'ali@gmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:19:46'),
(63, 'Waleed Khalid', '8940', 'waleed@yahoo.com', '03445986007', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:21:41'),
(64, 'Wayne Philip', '9011', 'wp@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:51:55'),
(65, 'Christopher Mitchel', '7530', 'cm@gmail.com', '03004368436', 'male', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:53:00'),
(66, 'Ashley Ben', '8861', 'ab@hotmail.com', '0335698712', 'male', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:52:18'),
(67, 'Abdul Samad', '8648', 'samad@gmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:30:51'),
(68, 'Jack Rodney', '9305', 'jr@gmail.com', '023115864977', 'male', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:53:25'),
(69, 'Michael Philip', '7655', 'mp@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2019-05-02 12:50:42'),
(70, 'Ali Murtaza', '9268', 'ali@hotmail.com', '03361445566', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:36:26'),
(71, 'Mehran Ali', '8023', 'mehranali8023@hotmail.com', '03315613839', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:38:52'),
(72, 'Syed Wasif Raza', '7414', 'swasif@gmail.com', '03341561011', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:41:07'),
(73, 'Muhammad Jamal', '8691', 'jamal@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:42:32'),
(74, 'Hannan Javaid', '9764', 'hannan@gmail.com', '03356890', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:44:19'),
(75, 'Muhammad Ahmed', '9759', 'ahmed@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:45:09'),
(76, 'Muhamad Awais Aryan', '9215', 'awasia@hotmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:45:59'),
(77, 'Muhammad Ahmed Javaid', '9251', 'ahmed@gmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:47:03'),
(78, 'Syed Kazim Raza', '9264', 'kazim@gmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:48:02'),
(79, 'Khizar Iqbal', '9574', 'redprince007@gmail.com', '03337390718', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:49:56'),
(80, 'Umair Daud Raja', '9380', 'daud@gmail.com', '033568970', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:51:03'),
(81, 'Aqib Javed', '9808', 'aqib@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:52:13'),
(82, 'Abdul Basit', '9675', 'basitkhan565@yahoo.com', '03135769291', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:54:24'),
(83, 'Ebad Majeed', '9189', 'ebad@gmail.com', '033569872', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:55:08'),
(84, 'Irfan Khaliq', '9556', 'irfan@gmail.com', '03254698', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:55:48'),
(85, 'Zubair Ali', '9272', 'zubair@gmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:57:44'),
(86, 'Faizan Hameed', '9548', 'faizan@hotmail.com', '032569871', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-14 23:58:32'),
(87, 'Danish Hussain', '9525', 'danish@hotmail.com', '03315458369', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-15 00:00:37'),
(88, 'Ahmed Aizaz Abid', '9402', 'aizaz@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-15 00:04:32'),
(89, 'Muhammad Ashhar', '9184', 'ashaar@hotmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-15 00:11:45'),
(90, 'Ishaq Ibrahim', '9220', 'isac@yahoo.com', '03315810211', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-15 00:13:45'),
(91, 'Mohsin Tanveer', '9260', 'mohsin@hotmail.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-15 00:16:38'),
(92, 'Muhammad Saeed Ur Rehman', '9269', 'saeed@yahoo.com', '033658970', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-15 00:20:13'),
(93, 'Umair Sharif', '9258', 'sharif@yahoo.com', '033569870', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-15 00:21:57'),
(94, 'Shoaib Nawaz', '9155', 'nawaz@yahoo.com', '033569810', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-15 00:24:16'),
(95, 'Sheikh Awais Ali', '7531', 'sheikhawais@gmail.com', '03015631656', 'male', '123', NULL, NULL, NULL, 18, 1, '2016-04-15 00:26:36'),
(96, 'Hina Zameer', '9271', 'zameer@gmail.com', '0335698721', 'female', '123', NULL, 5, NULL, 18, 1, '2016-04-15 00:27:33'),
(97, 'Madiha Arooj', '9270', 'madiha@gmail.com', '03358976', 'female', '123', NULL, 5, 1, 18, 1, '2016-04-15 00:28:45'),
(98, 'Maryam Ilyas', '9807', 'maryam@gmail.com', '033569870', 'female', '123', NULL, NULL, NULL, 18, 1, '2016-04-15 00:58:18'),
(99, 'Sundas Manzoor', '9734', 'sundas@hotmail.com', '033569870', 'female', '123', NULL, NULL, NULL, 18, 1, '2016-04-15 00:59:34'),
(100, 'Ifrah Komal', '9584', 'irfah@gmail.com', '033569870', 'female', '123', NULL, NULL, NULL, 18, 1, '2016-04-15 01:00:34'),
(101, 'Francis Terry', '9008', 'ft@yahoo.com', '09032343432', 'male', '123', NULL, 6, 1, 19, 1, '2019-05-10 16:01:55'),
(102, 'Esther Obi', '2332', 'eobi@gmail.com', '09032343432', 'female', '123', NULL, 7, 1, 19, 1, '2019-05-11 13:56:59'),
(103, 'Godswill Damian', '20176', 'damian@yahoo.com', '09089876765', 'male', 'damian', NULL, 8, 1, 18, 1, '2019-12-18 13:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `student_group`
--

CREATE TABLE IF NOT EXISTS `student_group` (
  `groupId` int(255) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(255) DEFAULT NULL,
  `batchId` int(11) DEFAULT NULL,
  `sdpPart` int(1) NOT NULL DEFAULT '1' COMMENT 'Here to check before deleting group',
  `groupLimit` int(1) NOT NULL DEFAULT '3',
  `inGroup` int(255) NOT NULL DEFAULT '1',
  `leaderId` int(255) NOT NULL,
  `createdDtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`groupId`),
  KEY `FK_student_group_batch` (`batchId`),
  KEY `FK_student_group_student` (`leaderId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='groupInfo' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `student_group`
--

INSERT INTO `student_group` (`groupId`, `projectName`, `batchId`, `sdpPart`, `groupLimit`, `inGroup`, `leaderId`, `createdDtm`) VALUES
(1, 'Design and Implementation of a project allocation management system', 18, 1, 3, 3, 15, '2019-04-04 14:49:05'),
(4, 'Design and Implementation of a digital library system', 18, 1, 3, 1, 55, '2019-04-04 14:48:07'),
(5, 'Online food ordering system', 18, 1, 3, 2, 97, '2019-04-04 14:49:37'),
(6, 'Design and Implementation of restaurant management system', 19, 1, 3, 1, 101, '2019-05-10 16:01:55'),
(7, 'Inventory management for a company', 19, 1, 3, 1, 102, '2019-05-11 13:56:59'),
(8, 'Property rating as a source of local government revenue in Ghana', 18, 1, 3, 1, 103, '2019-12-18 13:02:29'),
(9, 'Library management', 18, 1, 3, 1, 59, '2020-02-16 15:58:31');

-- --------------------------------------------------------

--
-- Table structure for table `student_group_request`
--

CREATE TABLE IF NOT EXISTS `student_group_request` (
  `requestId` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL COMMENT 'Request sent by',
  `groupId` int(11) NOT NULL COMMENT 'Request sent to group',
  `requestDtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`requestId`),
  KEY `FK_student_group_request_student` (`studentId`),
  KEY `FK_student_group_request_student_group` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Requests sent to join a group a stored here temporarilty' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `student_group_request`
--


-- --------------------------------------------------------

--
-- Table structure for table `suggested_topics`
--

CREATE TABLE IF NOT EXISTS `suggested_topics` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `aid` int(4) NOT NULL,
  `name` varchar(500) NOT NULL,
  `assigned` int(4) NOT NULL,
  `supervisorFaculty` int(4) NOT NULL,
  `supervisorFacultyName` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`),
  KEY `supervisorFaculty` (`supervisorFaculty`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `suggested_topics`
--

INSERT INTO `suggested_topics` (`id`, `aid`, `name`, `assigned`, `supervisorFaculty`, `supervisorFacultyName`) VALUES
(1, 2, 'Inventory management for a company', 1, 20, 'Uzair Muhammad'),
(2, 2, 'The effect of internal control system as a tool to for preventing and detecting fraud', 0, 21, 'Philip Mike'),
(3, 2, 'Debt management of Ghana commercial bank in Ghana', 0, 22, 'Obed Joe'),
(4, 2, 'The role financial institution in improving banks performance', 0, 19, 'Muhammad Tunde'),
(5, 2, 'E-taxation administration Ghana', 0, 18, 'Saud Khan'),
(6, 2, 'An empirical assessment of firm in Ghana ', 0, 23, 'Henry Mike'),
(7, 3, 'Expert System for automobile diagnosis', 0, 21, 'Philip Mike'),
(8, 3, 'Artificial Intelligence syste for malaria diagnosis', 0, 19, 'Muhammad Tunde'),
(9, 3, 'Expert System for clinical diagnosis', 0, 25, 'Anthony Wayne'),
(10, 3, 'Expert System for treatment of breast cancer', 0, 24, 'Charles Edmund'),
(11, 4, 'Animated cartoon movies for advert', 0, 25, 'Anthony Wayne'),
(12, 4, 'Animation for corporate branding', 0, 26, 'Felicia Ibrahim'),
(13, 5, 'Current and future imperatives and prevention and management in financial services industry ', 0, 26, 'Felicia Ibrahim'),
(14, 5, 'Fraud and forgeries in banking industry-causes, effect and The way forward', 0, 26, 'Felicia Ibrahim'),
(15, 5, 'The impact of Ghanaian stock exchange in the developing of Ghana', 0, 24, 'Charles Edmund'),
(16, 5, 'The role of budgeting in the private sector management', 0, 24, 'Charles Edmund'),
(17, 6, 'Causes of road pavement failure and possible solution', 0, 27, 'Adams Francis'),
(18, 6, 'Domestic waste management system in Ghana', 0, 27, 'Adams Francis'),
(19, 7, 'Construction of light sensitive alarm', 0, 24, 'Charles Edmund'),
(20, 7, 'Construction of electronic board', 0, 24, 'Charles Edmund'),
(21, 7, 'Design and implementation of automatic battery charger', 0, 27, 'Adams Francis'),
(22, 8, 'The role of audit in small scale industries', 0, 26, 'Felicia Ibrahim'),
(23, 8, 'Audit price strategy system', 0, 26, 'Felicia Ibrahim'),
(24, 8, 'The role of internal audit in managing fraud in Ghana', 0, 26, 'Felicia Ibrahim'),
(25, 8, 'The influence of employee behaviour on the internal audit of an organization', 0, 26, 'Felicia Ibrahim'),
(26, 9, 'Housing finance management system', 0, 22, 'Obed Joe'),
(27, 9, 'Residential building management system', 0, 22, 'Obed Joe'),
(28, 10, 'Taboo and women', 0, 27, 'Adams Francis'),
(29, 10, 'Effect of unemployment on computer graduates', 0, 27, 'Adams Francis'),
(30, 11, 'Property rating as a source of local government revenue in Ghana', 1, 18, 'Saud Khan'),
(31, 11, 'The effect of slum on rental property value', 0, 18, 'Saud Khan'),
(32, 12, 'Design and implementation of library system', 0, 24, 'Charles Edmund'),
(33, 12, 'Design and implementation of cargo shippment', 0, 24, 'Charles Edmund'),
(34, 13, 'Women empowerment in Ghanaian politics', 0, 19, 'Muhammad Tunde'),
(35, 13, 'The impact of public opinion on public policy in Ghana', 0, 19, 'Muhammad Tunde');

-- --------------------------------------------------------

--
-- Table structure for table `timeline_faculty`
--

CREATE TABLE IF NOT EXISTS `timeline_faculty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `details` text,
  `type` varchar(50) DEFAULT NULL,
  `batchId` int(11) DEFAULT NULL,
  `sdpPart` int(11) DEFAULT NULL,
  `createdDtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_timeline_faculty_batch` (`batchId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='timeline for faculty' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `timeline_faculty`
--

INSERT INTO `timeline_faculty` (`id`, `title`, `details`, `type`, `batchId`, `sdpPart`, `createdDtm`) VALUES
(4, 'Batch Upgraded', 'Spring 2016has been upgraded to Senior Design Project Part 2', 'info', 18, 2, '2016-04-23 01:10:17');

-- --------------------------------------------------------

--
-- Table structure for table `timeline_student`
--

CREATE TABLE IF NOT EXISTS `timeline_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `details` text,
  `type` varchar(50) DEFAULT NULL,
  `taskId` int(11) DEFAULT NULL,
  `batchId` int(11) DEFAULT NULL,
  `sdpPart` int(11) DEFAULT NULL,
  `createdDtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_timeline_student_batch_tasks` (`taskId`),
  KEY `FK_timeline_student_batch_tasks_2` (`batchId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Timeline for students' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `timeline_student`
--

INSERT INTO `timeline_student` (`id`, `title`, `details`, `type`, `taskId`, `batchId`, `sdpPart`, `createdDtm`) VALUES
(1, '<i class="fa fa-info-circle" aria-hidden="true"></i> Info', 'Zeeshan Sabir is now supervising group FYP Management System', 'info', NULL, 18, 1, '2016-04-23 00:57:34'),
(2, '<i class="fa fa-info-circle" aria-hidden="true"></i> Info', 'Hajra Murtaza is now supervising group RSATS', 'info', NULL, 18, 1, '2016-04-23 00:57:33'),
(3, 'Deliverable 01: Project Team List', '<p>\r\n\r\n</p><ul><li>Use <b>â€œTemplate-01â€</b> to fill in the details of project team members and submit hard copy to Project Coordinator .</li><li>Due Date: Monday, 25th April 2016 (Before 3:30pm)</li></ul>\r\n\r\n<br><p></p>', 'task', 1, 18, 1, '2016-04-21 22:48:26'),
(7, 'Batch Upgraded', 'Spring 2016has been upgraded to Senior Design Project Part 2', 'info', NULL, 18, 2, '2016-04-23 01:10:17'),
(8, 'Start your project', '<p>Start your project<br></p>', 'task', 2, 19, 1, '2019-05-11 19:41:45');

-- --------------------------------------------------------

--
-- Table structure for table `work_load`
--

CREATE TABLE IF NOT EXISTS `work_load` (
  `loadId` int(255) NOT NULL AUTO_INCREMENT,
  `facultyId` int(255) NOT NULL,
  `totalLoad` int(255) NOT NULL,
  `currentLoad` int(11) DEFAULT '0',
  PRIMARY KEY (`loadId`),
  KEY `FK_work_load_faculty` (`facultyId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='workload_Info' AUTO_INCREMENT=19 ;

--
-- Dumping data for table `work_load`
--

INSERT INTO `work_load` (`loadId`, `facultyId`, `totalLoad`, `currentLoad`) VALUES
(9, 18, 5, 0),
(10, 19, 5, 0),
(11, 20, 2, 0),
(12, 21, 5, 1),
(13, 22, 5, 0),
(14, 23, 5, 1),
(15, 24, 5, 0),
(16, 25, 5, 0),
(17, 26, 5, 0),
(18, 27, 5, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batch_tasks`
--
ALTER TABLE `batch_tasks`
  ADD CONSTRAINT `FK_batch_tasks_batch` FOREIGN KEY (`batchId`) REFERENCES `batch` (`batchId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `batch_templates`
--
ALTER TABLE `batch_templates`
  ADD CONSTRAINT `FK_batch_templates_batch` FOREIGN KEY (`batchId`) REFERENCES `batch` (`batchId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `faculty_student_group`
--
ALTER TABLE `faculty_student_group`
  ADD CONSTRAINT `fk_faculty_id` FOREIGN KEY (`facultyId`) REFERENCES `faculty` (`facultyId`),
  ADD CONSTRAINT `fk_group_id` FOREIGN KEY (`groupId`) REFERENCES `student_group` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `faculty_student_request`
--
ALTER TABLE `faculty_student_request`
  ADD CONSTRAINT `FK_faculty_student_request_faculty` FOREIGN KEY (`facultyId`) REFERENCES `faculty` (`facultyId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_faculty_student_request_faculty_student_group` FOREIGN KEY (`groupId`) REFERENCES `faculty_student_group` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `FK_grades_student` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_grades_student_group` FOREIGN KEY (`groupId`) REFERENCES `student_group` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `group_requests`
--
ALTER TABLE `group_requests`
  ADD CONSTRAINT `FK_group_requests_student` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_group_requests_student_group` FOREIGN KEY (`groupId`) REFERENCES `student_group` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `group_uploads`
--
ALTER TABLE `group_uploads`
  ADD CONSTRAINT `FK_group_uploads_batch_tasks` FOREIGN KEY (`taskId`) REFERENCES `batch_tasks` (`taskId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_group_uploads_faculty_student_group` FOREIGN KEY (`groupId`) REFERENCES `faculty_student_group` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_group_uploads_student` FOREIGN KEY (`uploadedBy`) REFERENCES `student` (`studentId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `meeting_logs`
--
ALTER TABLE `meeting_logs`
  ADD CONSTRAINT `FK_meeting_logs_faculty` FOREIGN KEY (`supervisor_id`) REFERENCES `faculty` (`facultyId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_meeting_logs_faculty_student_group` FOREIGN KEY (`group_id`) REFERENCES `faculty_student_group` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `project_repository`
--
ALTER TABLE `project_repository`
  ADD CONSTRAINT `FK_project_repository_batch` FOREIGN KEY (`batchId`) REFERENCES `batch` (`batchId`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `FK_student_batch` FOREIGN KEY (`batchId`) REFERENCES `batch` (`batchId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_group`
--
ALTER TABLE `student_group`
  ADD CONSTRAINT `FK_student_group_student` FOREIGN KEY (`leaderId`) REFERENCES `student` (`studentId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_group_request`
--
ALTER TABLE `student_group_request`
  ADD CONSTRAINT `FK_student_group_request_student` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_student_group_request_student_group` FOREIGN KEY (`groupId`) REFERENCES `student_group` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `suggested_topics`
--
ALTER TABLE `suggested_topics`
  ADD CONSTRAINT `suggested_topics_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `area_interest` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `suggested_topics_ibfk_2` FOREIGN KEY (`supervisorFaculty`) REFERENCES `faculty` (`facultyId`) ON DELETE CASCADE;

--
-- Constraints for table `timeline_faculty`
--
ALTER TABLE `timeline_faculty`
  ADD CONSTRAINT `FK_timeline_faculty_batch` FOREIGN KEY (`batchId`) REFERENCES `batch` (`batchId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `timeline_student`
--
ALTER TABLE `timeline_student`
  ADD CONSTRAINT `FK_timeline_student_batch_tasks` FOREIGN KEY (`taskId`) REFERENCES `batch_tasks` (`taskId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_timeline_student_batch_tasks_2` FOREIGN KEY (`batchId`) REFERENCES `batch` (`batchId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `work_load`
--
ALTER TABLE `work_load`
  ADD CONSTRAINT `FK_work_load_faculty` FOREIGN KEY (`facultyId`) REFERENCES `faculty` (`facultyId`) ON DELETE NO ACTION ON UPDATE NO ACTION;
