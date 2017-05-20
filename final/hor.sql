-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 19, 2017 at 10:32 AM
-- Server version: 10.0.29-MariaDB-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hor`
--

-- --------------------------------------------------------

--
-- Table structure for table `Announce`
--

CREATE TABLE `Announce` (
  `AnnounceId` int(11) NOT NULL,
  `announceDes` varchar(1000) DEFAULT NULL,
  `announceTime` date NOT NULL,
  `announceTitle` varchar(100) DEFAULT NULL,
  `Dormitory_dormId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Announce`
--

INSERT INTO `Announce` (`AnnounceId`, `announceDes`, `announceTime`, `announceTitle`, `Dormitory_dormId`) VALUES
(1, 'ปิดปรับปรุงระบบประปา วันที่ 5 พ.ค. 60', '2017-04-16', 'ตัดน้ำ', 1),
(2, 'ปิดปรับปรุงระบบไฟฟ้า วันที่ 10 พ.ค. 60', '2017-04-30', 'ตัดไฟ', 1),
(3, 'มีการซ้อมหนีไฟของหอวันที่ 12 พ.ค. 60', '2017-04-18', 'ซ้อมหนีไฟ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Cause`
--

CREATE TABLE `Cause` (
  `causeId` int(11) NOT NULL,
  `expense_expensesId` int(11) NOT NULL,
  `Problem_problemId` int(11) NOT NULL,
  `status_statusId` int(11) NOT NULL,
  `Room_roomId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Cause`
--

INSERT INTO `Cause` (`causeId`, `expense_expensesId`, `Problem_problemId`, `status_statusId`, `Room_roomId`) VALUES
(58, 58, 1, 1, 1),
(59, 59, 8, 3, 1),
(60, 60, 2, 2, 1),
(61, 61, 1, 2, 2),
(62, 62, 10, 1, 2),
(63, 63, 27, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `chargeId` int(11) NOT NULL,
  `chargeName` varchar(45) DEFAULT NULL,
  `chargePrice` double DEFAULT NULL,
  `Document_docId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `charges`
--

INSERT INTO `charges` (`chargeId`, `chargeName`, `chargePrice`, `Document_docId`) VALUES
(1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Document`
--

CREATE TABLE `Document` (
  `docId` int(11) NOT NULL,
  `docName` varchar(45) DEFAULT NULL,
  `docTime` date DEFAULT NULL,
  `User_userId` bigint(13) NOT NULL,
  `DocumentType_docTypeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Document`
--

INSERT INTO `Document` (`docId`, `docName`, `docTime`, `User_userId`, `DocumentType_docTypeId`) VALUES
(1, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `DocumentType`
--

CREATE TABLE `DocumentType` (
  `docTypeId` int(11) NOT NULL,
  `docTypeName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DocumentType`
--

INSERT INTO `DocumentType` (`docTypeId`, `docTypeName`) VALUES
(1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Dormitory`
--

CREATE TABLE `Dormitory` (
  `dormId` int(11) NOT NULL,
  `dormName` varchar(45) DEFAULT NULL,
  `dormType` varchar(45) DEFAULT NULL,
  `dormAddress` varchar(45) DEFAULT NULL,
  `countRoom` varchar(45) DEFAULT NULL,
  `visitorNo` mediumtext,
  `User_userId` bigint(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Dormitory`
--

INSERT INTO `Dormitory` (`dormId`, `dormName`, `dormType`, `dormAddress`, `countRoom`, `visitorNo`, `User_userId`) VALUES
(1, 'h1', NULL, NULL, NULL, NULL, 1),
(2, '55 Home', 'Apartment', 'ซ.ประชาอุทิศ 91/3 ถ.ประชาอุทิศ \r\nทุ่งครุ กรุง', '165 ห้อง', 'หอพักนักศึกษา แยกชายหญิง. \nมีลิฟต์ มีระบบคีย์การดทุกชั้นเพื่อความปลอดภัย. มี รปภ ที่จอดรถยนต์ รถมอเตอร์ไซด์ \nมีเครื่องซักผ้าบริการทุกชั้น\nWifi ฟรีทุกห้อง\nรับรองความเร็วอินเทอร์เน็ต\nพร้อมเคเบิล ทุกห้อง \nหอพักใหม่ พึ่งเปิด  ห้องพักใหม่ทุกห้อง\n----------------------------------------------------------  \nPromotion \nนักศึกษา ที่ทำสัญญา 1 ปี ลด ค่าเช่า 50% \nช่วงปิดเทอม(กรณี กลับต่างจังหวัด ไม่ได้เข้าพัก). มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี', 789452312),
(3, 'Sawasdeetaweesuk', 'Apartment', 'เลขที่ 92/11 ซอยสุขุมวิท 31 แขวงคลองตันเหนือ ', '250 ห้อง', 'ติดถนนใหญ่ประชาอุทิศ\r\nห่างจากมหาลัยบางมดเพียง 300 ม.\r\nและทางด่วนสุขสวัสดิ์เพียง 1.5 กม.\r\nห้องชุดขนาดกระทัดรัดในราคาเบาๆ \r\nเหมาะกับการลงทุน\r\nเพื่อปล่อยเช่าระยะยาว\r\nรับผลตอบแทนคุ้มกว่าฝากธนาคาร\r\n------------------------------------------------------\r\nสิ่งอำนวยความสะดวก \r\nสระว่ายน้ำ ฟิตเนส และห้องสมุด', 45978645),
(4, 'The Privacy Pracha Uthit - Suksawat', 'Condominium', 'ซ.ประชาอุทิศ 23 ถ.ประชาอุทิศ ราษฎร์บูรณะ กรุง', '237 ห้อง', 'เดอะ ไพรเวซี่ ประชาอุทิศ - สุขสวัสดิ์\r\nThe Privacy Pracha Uthit - Suksawat\r\n------------------------------------------------------	\r\nที่อยู่โครงการ	ซ.ประชาอุทิศ 23 ถ.ประชาอุทิศ ราษฎร์บูรณะ ราษฎร์บูรณะ กรุงเทพมหานคร\r\n------------------------------------------------------\r\nประเภทห้องในโครงการ	\r\n1 Bedroom (24.0 - 33.0 ตร.ม.)\r\n2 Bedroom (50.0 - 0.0 ตร.ม.)\r\nจำนวนตึกในโครงการ | 3 ตึก\r\nจำนวนชั้น | 8 ชั้น\r\nจำนวนห้องในโครงการ | 237 ห้อง', 3110801114662),
(203, 'Lumpini express ', 'Apartment', 'ซ.ประชาอุทิศ45 เขตทุ่งครุ กรุงเทพฯ', '300 ห้อง', 'ใกล้มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี', 1100801111111);

-- --------------------------------------------------------

--
-- Table structure for table `DormitoryFacilityDorm`
--

CREATE TABLE `DormitoryFacilityDorm` (
  `facilityDormId` int(11) NOT NULL,
  `facilityName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DormitoryFacilityDorm`
--

INSERT INTO `DormitoryFacilityDorm` (`facilityDormId`, `facilityName`) VALUES
(1, 'ยามรักษาความปลอดภัย'),
(2, 'ลิฟต์'),
(3, 'ระบบคีย์การ์ดบันทึกการเข้าออก'),
(4, 'จานดาวเทียม'),
(5, 'ที่จอดรถ'),
(6, 'ฟิตเนส'),
(7, 'เครื่องซักผ้าอัตโนมัติ'),
(8, 'เครื่องบริการน้ำดื่มอัตโนมัติ'),
(9, 'บริการซักรีด'),
(10, 'ร้านอาหาร');

-- --------------------------------------------------------

--
-- Table structure for table `DormitoryFacilityDorm_has_Dormitory`
--

CREATE TABLE `DormitoryFacilityDorm_has_Dormitory` (
  `DormitoryFacilityDorm_facilityDormId` int(11) NOT NULL,
  `Dormitory_dormId` int(11) NOT NULL,
  `Dormitory_User_userId` bigint(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DormitoryFacilityDorm_has_Dormitory`
--

INSERT INTO `DormitoryFacilityDorm_has_Dormitory` (`DormitoryFacilityDorm_facilityDormId`, `Dormitory_dormId`, `Dormitory_User_userId`) VALUES
(1, 203, 1100801111111),
(2, 203, 1100801111111),
(3, 203, 1100801111111),
(4, 203, 1100801111111),
(5, 203, 1100801111111),
(6, 203, 1100801111111),
(7, 203, 1100801111111),
(8, 203, 1100801111111),
(9, 203, 1100801111111),
(10, 203, 1100801111111);

-- --------------------------------------------------------

--
-- Table structure for table `DormitoryFacilityRoom`
--

CREATE TABLE `DormitoryFacilityRoom` (
  `facilityRoomId` int(11) NOT NULL,
  `facilityName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DormitoryFacilityRoom`
--

INSERT INTO `DormitoryFacilityRoom` (`facilityRoomId`, `facilityName`) VALUES
(1, 'เครื่องปรับอากาศ'),
(2, 'เครื่องทำน้ำอุ่น'),
(3, 'โต๊ะ-เก้าอี้'),
(4, 'ตู้'),
(5, 'เตียง'),
(6, 'อินเตอร์เน็ต');

-- --------------------------------------------------------

--
-- Table structure for table `DormitoryFacilityRoom_has_Dormitory`
--

CREATE TABLE `DormitoryFacilityRoom_has_Dormitory` (
  `DormitoryFacilityRoom_facilityRoomId` int(11) NOT NULL,
  `Dormitory_dormId` int(11) NOT NULL,
  `Dormitory_User_userId` bigint(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DormitoryFacilityRoom_has_Dormitory`
--

INSERT INTO `DormitoryFacilityRoom_has_Dormitory` (`DormitoryFacilityRoom_facilityRoomId`, `Dormitory_dormId`, `Dormitory_User_userId`) VALUES
(1, 203, 1100801111111),
(2, 203, 1100801111111),
(3, 203, 1100801111111),
(4, 203, 1100801111111),
(5, 203, 1100801111111),
(6, 203, 1100801111111);

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `expensesId` int(11) NOT NULL,
  `expensePrice` double DEFAULT NULL,
  `expenseDes` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`expensesId`, `expensePrice`, `expenseDes`) VALUES
(58, NULL, NULL),
(59, NULL, NULL),
(60, NULL, NULL),
(61, NULL, NULL),
(62, NULL, NULL),
(63, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `MeetingDorm`
--

CREATE TABLE `MeetingDorm` (
  `meetId` int(11) NOT NULL,
  `meetingDatetime` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `MeetingDorm_has_User`
--

CREATE TABLE `MeetingDorm_has_User` (
  `MeetingDorm_meetId` int(11) NOT NULL,
  `User_userId` bigint(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Popular dorm`
--

CREATE TABLE `Popular dorm` (
  `popId` int(11) NOT NULL,
  `sumPoint` double DEFAULT NULL,
  `Rate_rateId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Problem`
--

CREATE TABLE `Problem` (
  `problemId` int(11) NOT NULL,
  `problemName` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Problem`
--

INSERT INTO `Problem` (`problemId`, `problemName`) VALUES
(1, 'ลูกบิดประตูชำรุด'),
(2, 'หน้าต่างแตก'),
(3, 'มุ้งลวดขาด'),
(4, 'ฝ้า/เพดานชำรุด'),
(5, 'WiFi ชำรุด'),
(6, 'เต้าเสียบชำรุด'),
(7, 'สวิทช์ไฟชำรุด'),
(8, 'หลอดไฟชำรุด'),
(9, 'แอร์ชำรุด'),
(10, 'Remote แอร์ชำรุด'),
(11, 'TV ชำรุด'),
(12, 'Remote TV ชำรุด'),
(13, 'พัดลมชำรุด'),
(14, 'ตู้เย็นชำรุด'),
(15, 'เตียงชำรุด'),
(16, 'ฝูกชำรุด'),
(17, 'ตู้เสื้อผ้าชำรุด'),
(18, 'โต๊ะชำรุด'),
(19, 'เก้าอี้ชำรุด'),
(20, 'กระจกแตก'),
(21, 'อ่างล้างหน้าชำรุด'),
(22, 'ก๊อกน้ำชำรุด'),
(23, 'ฝักบัวชำรุด'),
(24, 'เครื่องทำน้ำอุ่นชำรุด'),
(25, 'สายฉีดชำระชำรุด'),
(26, 'โถสุขภัณฑ์ชำรุด'),
(27, 'ท่อน้ำลั่ว');

-- --------------------------------------------------------

--
-- Table structure for table `Rate`
--

CREATE TABLE `Rate` (
  `rateId` int(11) NOT NULL,
  `rate` double DEFAULT NULL,
  `Dormitory_dormId` int(11) NOT NULL,
  `User_userId` bigint(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RecordProblem`
--

CREATE TABLE `RecordProblem` (
  `id` bigint(13) NOT NULL,
  `problemPast` int(2) NOT NULL DEFAULT '0',
  `problemCurrent` int(2) NOT NULL DEFAULT '0',
  `problemNow` int(1) NOT NULL DEFAULT '0',
  `Cause_causeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `RecordProblem`
--

INSERT INTO `RecordProblem` (`id`, `problemPast`, `problemCurrent`, `problemNow`, `Cause_causeId`) VALUES
(53, 3, 2, 1, 58),
(54, 1, 3, 1, 59),
(55, 1, 1, 1, 60),
(56, 2, 2, 1, 61),
(57, 1, 1, 1, 62),
(58, 0, 4, 1, 63);

-- --------------------------------------------------------

--
-- Table structure for table `Renter`
--

CREATE TABLE `Renter` (
  `renterId` int(11) NOT NULL,
  `roomNo` int(11) NOT NULL,
  `User_userId` bigint(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Renter`
--

INSERT INTO `Renter` (`renterId`, `roomNo`, `User_userId`) VALUES
(1, 1, 2),
(2, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Renter_has_Room`
--

CREATE TABLE `Renter_has_Room` (
  `Renter_renterId` int(11) NOT NULL,
  `Room_roomId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Renter_has_Room`
--

INSERT INTO `Renter_has_Room` (`Renter_renterId`, `Room_roomId`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Room`
--

CREATE TABLE `Room` (
  `roomId` int(11) NOT NULL,
  `roomNo` int(11) DEFAULT NULL,
  `Dormitory_dormId` int(11) NOT NULL,
  `charges_chargeId` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Room`
--

INSERT INTO `Room` (`roomId`, `roomNo`, `Dormitory_dormId`, `charges_chargeId`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 601, 2, 1),
(4, 602, 3, 1),
(5, 603, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roomType`
--

CREATE TABLE `roomType` (
  `typeId` int(11) NOT NULL,
  `typeName` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `roomTypecol` varchar(45) DEFAULT NULL,
  `Room_roomId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `statusId` int(11) NOT NULL,
  `statusName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`statusId`, `statusName`) VALUES
(1, 'รอดำเนินการ'),
(2, 'กำลังดำเนินการ'),
(3, 'เสร็จสิ้น');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `userId` bigint(13) NOT NULL,
  `userFirstName` varchar(45) DEFAULT NULL,
  `userLastName` varchar(45) DEFAULT NULL,
  `userGender` char(1) DEFAULT NULL COMMENT 'ช/ญ',
  `userAdd` varchar(1500) DEFAULT NULL,
  `userTel` bigint(10) DEFAULT NULL,
  `userEmail` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `userType` varchar(7) NOT NULL COMMENT 'admin/student/search/waiting'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`userId`, `userFirstName`, `userLastName`, `userGender`, `userAdd`, `userTel`, `userEmail`, `password`, `userType`) VALUES
(1, 'ทรัมธ์', 'รักไทย', 'ช', NULL, NULL, 'admin@admin.com', 'admin', 'admin'),
(2, 'ยิ่งลักษณ์', 'ชินวัช', 'ญ', NULL, NULL, 'a@a.a', 'a', 'student'),
(3, 'ประยุทธ์', 'จันทร์โอชา', 'ช', NULL, NULL, 'b@b.b', 'b', 'student'),
(45978645, 'สวัสดี', 'ประเทศไทย', 'ช', NULL, NULL, 's@s.s', 's', 'admin'),
(789452312, 'Xmen', 'XXX', 'ญ', NULL, NULL, 'x@x.x', 'x', 'admin'),
(57130500300, 'มัทธนา', 'พาธี', 'ช', '123 ซ.ทุ่งครุ เขตทุ่งครุ กรุงเทพฯ', 814414491, 'matthana@hotmail.com', 'matthana', 'student'),
(57130500400, 'ขุนช้าง', 'ณ บางช้าง', 'ช', '111 ซ.เจริญนคร11 คลองสาน กรุงเทพฯ', 824414190, 'khunchang@gmail.com', 'khungchang', 'student'),
(57130500500, 'มณฑา', 'พุทธมณฑล', 'ญ', '75 ซ.พุทธบูชา45 เขตทุ่งครุ กรุงเทพฯ ', 889919876, 'Montha@yahoo.com', 'Montha', 'student'),
(57130500600, 'กรรณิกา', 'ลำลูกกา', 'ญ', '276/2 คลอง2 ลำลูกกา ปทุมธานี', 876541199, 'Kannika@gmail.com', 'kannika', 'student'),
(1100801111111, 'นาหลวง', 'พาหุรัด', 'ช', '170 ซ.ประชาอุทิศ11 กทม ', 864411112, 'Nalung@hotmail.com', 'nalung', 'admin'),
(3110801114662, 'ปราณี', 'ลุมพินี', 'ญ', '10/2 ซ.พุทธบูชา20 ทุ่งครุ กรุงเทพ', 859111150, 'Paranee@gmail.com', 'paranee', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Announce`
--
ALTER TABLE `Announce`
  ADD PRIMARY KEY (`AnnounceId`),
  ADD KEY `Dormitory_dormId` (`Dormitory_dormId`);

--
-- Indexes for table `Cause`
--
ALTER TABLE `Cause`
  ADD PRIMARY KEY (`causeId`) USING BTREE,
  ADD KEY `Problem_problemId` (`Problem_problemId`),
  ADD KEY `status_statusId` (`status_statusId`),
  ADD KEY `Room_roomId` (`Room_roomId`) USING BTREE,
  ADD KEY `expense_expensesId` (`expense_expensesId`) USING BTREE;

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`chargeId`) USING BTREE,
  ADD KEY `fk_charges_Document1_idx` (`Document_docId`);

--
-- Indexes for table `Document`
--
ALTER TABLE `Document`
  ADD PRIMARY KEY (`docId`) USING BTREE,
  ADD KEY `fk_Document_User1_idx` (`User_userId`),
  ADD KEY `fk_Document_DocumentType1_idx` (`DocumentType_docTypeId`);

--
-- Indexes for table `DocumentType`
--
ALTER TABLE `DocumentType`
  ADD PRIMARY KEY (`docTypeId`);

--
-- Indexes for table `Dormitory`
--
ALTER TABLE `Dormitory`
  ADD PRIMARY KEY (`dormId`,`User_userId`),
  ADD KEY `fk_Dormitory_User1_idx` (`User_userId`);

--
-- Indexes for table `DormitoryFacilityDorm`
--
ALTER TABLE `DormitoryFacilityDorm`
  ADD PRIMARY KEY (`facilityDormId`);

--
-- Indexes for table `DormitoryFacilityDorm_has_Dormitory`
--
ALTER TABLE `DormitoryFacilityDorm_has_Dormitory`
  ADD KEY `fk_DormitoryFacilityDorm_has_Dormitory_Dormitory1_idx` (`Dormitory_dormId`,`Dormitory_User_userId`),
  ADD KEY `fk_DormitoryFacilityDorm_has_Dormitory_DormitoryFacilityDor_idx` (`DormitoryFacilityDorm_facilityDormId`);

--
-- Indexes for table `DormitoryFacilityRoom`
--
ALTER TABLE `DormitoryFacilityRoom`
  ADD PRIMARY KEY (`facilityRoomId`);

--
-- Indexes for table `DormitoryFacilityRoom_has_Dormitory`
--
ALTER TABLE `DormitoryFacilityRoom_has_Dormitory`
  ADD KEY `fk_DormitoryFacilityRoom_has_Dormitory_Dormitory1_idx` (`Dormitory_dormId`,`Dormitory_User_userId`),
  ADD KEY `fk_DormitoryFacilityRoom_has_Dormitory_DormitoryFacilityRoo_idx` (`DormitoryFacilityRoom_facilityRoomId`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`expensesId`);

--
-- Indexes for table `MeetingDorm`
--
ALTER TABLE `MeetingDorm`
  ADD PRIMARY KEY (`meetId`);

--
-- Indexes for table `MeetingDorm_has_User`
--
ALTER TABLE `MeetingDorm_has_User`
  ADD KEY `fk_MeetingDorm_has_User_User1_idx` (`User_userId`),
  ADD KEY `fk_MeetingDorm_has_User_MeetingDorm1_idx` (`MeetingDorm_meetId`);

--
-- Indexes for table `Popular dorm`
--
ALTER TABLE `Popular dorm`
  ADD PRIMARY KEY (`popId`) USING BTREE,
  ADD KEY `fk_Popular dorm_Rate1_idx` (`Rate_rateId`);

--
-- Indexes for table `Problem`
--
ALTER TABLE `Problem`
  ADD PRIMARY KEY (`problemId`);

--
-- Indexes for table `Rate`
--
ALTER TABLE `Rate`
  ADD PRIMARY KEY (`rateId`),
  ADD KEY `fk_Rate_Dormitory1_idx` (`Dormitory_dormId`),
  ADD KEY `fk_Rate_User1_idx` (`User_userId`);

--
-- Indexes for table `RecordProblem`
--
ALTER TABLE `RecordProblem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Cause_causeId` (`Cause_causeId`);

--
-- Indexes for table `Renter`
--
ALTER TABLE `Renter`
  ADD PRIMARY KEY (`renterId`),
  ADD KEY `fk_Renter_User1_idx` (`User_userId`);

--
-- Indexes for table `Renter_has_Room`
--
ALTER TABLE `Renter_has_Room`
  ADD KEY `fk_Renter_has_Room_Room1_idx` (`Room_roomId`),
  ADD KEY `fk_Renter_has_Room_Renter_idx` (`Renter_renterId`);

--
-- Indexes for table `Room`
--
ALTER TABLE `Room`
  ADD PRIMARY KEY (`roomId`) USING BTREE,
  ADD KEY `fk_Room_charges1_idx` (`charges_chargeId`),
  ADD KEY `fk_Room_Dormitory1_idx` (`Dormitory_dormId`) USING BTREE;

--
-- Indexes for table `roomType`
--
ALTER TABLE `roomType`
  ADD PRIMARY KEY (`typeId`) USING BTREE,
  ADD KEY `fk_roomType_Room1_idx` (`Room_roomId`) USING BTREE;

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`statusId`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Announce`
--
ALTER TABLE `Announce`
  MODIFY `AnnounceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `Cause`
--
ALTER TABLE `Cause`
  MODIFY `causeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `chargeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Document`
--
ALTER TABLE `Document`
  MODIFY `docId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `DocumentType`
--
ALTER TABLE `DocumentType`
  MODIFY `docTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Dormitory`
--
ALTER TABLE `Dormitory`
  MODIFY `dormId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;
--
-- AUTO_INCREMENT for table `DormitoryFacilityDorm`
--
ALTER TABLE `DormitoryFacilityDorm`
  MODIFY `facilityDormId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `DormitoryFacilityRoom`
--
ALTER TABLE `DormitoryFacilityRoom`
  MODIFY `facilityRoomId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `expensesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `MeetingDorm`
--
ALTER TABLE `MeetingDorm`
  MODIFY `meetId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Popular dorm`
--
ALTER TABLE `Popular dorm`
  MODIFY `popId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Problem`
--
ALTER TABLE `Problem`
  MODIFY `problemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `Rate`
--
ALTER TABLE `Rate`
  MODIFY `rateId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RecordProblem`
--
ALTER TABLE `RecordProblem`
  MODIFY `id` bigint(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `Renter`
--
ALTER TABLE `Renter`
  MODIFY `renterId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Room`
--
ALTER TABLE `Room`
  MODIFY `roomId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `roomType`
--
ALTER TABLE `roomType`
  MODIFY `typeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `statusId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `userId` bigint(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3110801114663;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Announce`
--
ALTER TABLE `Announce`
  ADD CONSTRAINT `Announce_ibfk_1` FOREIGN KEY (`Dormitory_dormId`) REFERENCES `Dormitory` (`dormId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Cause`
--
ALTER TABLE `Cause`
  ADD CONSTRAINT `Cause_ibfk_1` FOREIGN KEY (`expense_expensesId`) REFERENCES `expense` (`expensesId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Cause_ibfk_2` FOREIGN KEY (`Problem_problemId`) REFERENCES `Problem` (`problemId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Cause_ibfk_3` FOREIGN KEY (`status_statusId`) REFERENCES `status` (`statusId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Cause_ibfk_4` FOREIGN KEY (`Room_roomId`) REFERENCES `Room` (`roomId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `charges`
--
ALTER TABLE `charges`
  ADD CONSTRAINT `charges_ibfk_1` FOREIGN KEY (`Document_docId`) REFERENCES `Document` (`docId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Document`
--
ALTER TABLE `Document`
  ADD CONSTRAINT `Document_ibfk_1` FOREIGN KEY (`DocumentType_docTypeId`) REFERENCES `DocumentType` (`docTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Document_ibfk_2` FOREIGN KEY (`User_userId`) REFERENCES `User` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Dormitory`
--
ALTER TABLE `Dormitory`
  ADD CONSTRAINT `Dormitory_ibfk_1` FOREIGN KEY (`User_userId`) REFERENCES `User` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `DormitoryFacilityDorm_has_Dormitory`
--
ALTER TABLE `DormitoryFacilityDorm_has_Dormitory`
  ADD CONSTRAINT `DormitoryFacilityDorm_has_Dormitory_ibfk_1` FOREIGN KEY (`DormitoryFacilityDorm_facilityDormId`) REFERENCES `DormitoryFacilityDorm` (`facilityDormId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `DormitoryFacilityDorm_has_Dormitory_ibfk_2` FOREIGN KEY (`Dormitory_dormId`,`Dormitory_User_userId`) REFERENCES `Dormitory` (`dormId`, `User_userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `DormitoryFacilityRoom_has_Dormitory`
--
ALTER TABLE `DormitoryFacilityRoom_has_Dormitory`
  ADD CONSTRAINT `DormitoryFacilityRoom_has_Dormitory_ibfk_1` FOREIGN KEY (`DormitoryFacilityRoom_facilityRoomId`) REFERENCES `DormitoryFacilityRoom` (`facilityRoomId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `DormitoryFacilityRoom_has_Dormitory_ibfk_2` FOREIGN KEY (`Dormitory_dormId`,`Dormitory_User_userId`) REFERENCES `Dormitory` (`dormId`, `User_userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `MeetingDorm_has_User`
--
ALTER TABLE `MeetingDorm_has_User`
  ADD CONSTRAINT `MeetingDorm_has_User_ibfk_1` FOREIGN KEY (`MeetingDorm_meetId`) REFERENCES `MeetingDorm` (`meetId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `MeetingDorm_has_User_ibfk_2` FOREIGN KEY (`User_userId`) REFERENCES `User` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Popular dorm`
--
ALTER TABLE `Popular dorm`
  ADD CONSTRAINT `Popular dorm_ibfk_1` FOREIGN KEY (`Rate_rateId`) REFERENCES `Rate` (`rateId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Rate`
--
ALTER TABLE `Rate`
  ADD CONSTRAINT `Rate_ibfk_1` FOREIGN KEY (`Dormitory_dormId`) REFERENCES `Dormitory` (`dormId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Rate_ibfk_2` FOREIGN KEY (`User_userId`) REFERENCES `User` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `RecordProblem`
--
ALTER TABLE `RecordProblem`
  ADD CONSTRAINT `RecordProblem_ibfk_1` FOREIGN KEY (`Cause_causeId`) REFERENCES `Cause` (`causeId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Renter`
--
ALTER TABLE `Renter`
  ADD CONSTRAINT `Renter_ibfk_1` FOREIGN KEY (`User_userId`) REFERENCES `User` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Renter_has_Room`
--
ALTER TABLE `Renter_has_Room`
  ADD CONSTRAINT `Renter_has_Room_ibfk_1` FOREIGN KEY (`Renter_renterId`) REFERENCES `Renter` (`renterId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Renter_has_Room_ibfk_2` FOREIGN KEY (`Room_roomId`) REFERENCES `Room` (`roomId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Room`
--
ALTER TABLE `Room`
  ADD CONSTRAINT `Room_ibfk_1` FOREIGN KEY (`charges_chargeId`) REFERENCES `charges` (`chargeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Room_ibfk_2` FOREIGN KEY (`Dormitory_dormId`) REFERENCES `Dormitory` (`dormId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `roomType`
--
ALTER TABLE `roomType`
  ADD CONSTRAINT `roomType_ibfk_1` FOREIGN KEY (`Room_roomId`) REFERENCES `Room` (`roomId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
