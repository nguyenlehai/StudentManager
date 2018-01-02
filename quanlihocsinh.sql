/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : quanlihocsinh

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-12-06 16:05:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for assignments
-- ----------------------------
DROP TABLE IF EXISTS `assignments`;
CREATE TABLE `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schoolYearId` int(6) NOT NULL,
  `classId` int(10) NOT NULL,
  `subjectId` int(6) NOT NULL,
  `teacherId` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schoolYearId` (`schoolYearId`),
  KEY `classId` (`classId`),
  KEY `subjectId` (`subjectId`),
  KEY `teacherId` (`teacherId`),
  CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`schoolYearId`) REFERENCES `schoolyears` (`id`),
  CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `classes` (`id`),
  CONSTRAINT `assignments_ibfk_3` FOREIGN KEY (`subjectId`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assignments
-- ----------------------------
INSERT INTO `assignments` VALUES ('1', '1', '1', '1', '1');
INSERT INTO `assignments` VALUES ('2', '1', '1', '2', '2');

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gradeId` int(11) DEFAULT NULL,
  `schoolYearId` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `teacherId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gradeId` (`gradeId`),
  KEY `schoolYearId` (`schoolYearId`),
  KEY `teacherId` (`teacherId`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`gradeId`) REFERENCES `grades` (`id`),
  CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`schoolYearId`) REFERENCES `schoolyears` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('1', 'Hoa Hồng', '2', '1', '10', '1');
INSERT INTO `classes` VALUES ('2', 'CNTT', '2', '1', '8', '2');
INSERT INTO `classes` VALUES ('3', 'Hoa sao', '1', '1', '0', '1');
INSERT INTO `classes` VALUES ('4', '10A2', null, null, '30', null);
INSERT INTO `classes` VALUES ('5', '10A1', null, null, '30', null);
INSERT INTO `classes` VALUES ('7', '10A1', '2', '1', '30', '1');

-- ----------------------------
-- Table structure for conducts
-- ----------------------------
DROP TABLE IF EXISTS `conducts`;
CREATE TABLE `conducts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of conducts
-- ----------------------------
INSERT INTO `conducts` VALUES ('1', 'Tốt');
INSERT INTO `conducts` VALUES ('2', 'Khá');
INSERT INTO `conducts` VALUES ('3', 'Trung Bình');

-- ----------------------------
-- Table structure for grades
-- ----------------------------
DROP TABLE IF EXISTS `grades`;
CREATE TABLE `grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grades
-- ----------------------------
INSERT INTO `grades` VALUES ('1', 'Khối 6');
INSERT INTO `grades` VALUES ('2', 'Khối 10');

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES ('1', 'Noi tro');
INSERT INTO `jobs` VALUES ('2', 'Giao vien');
INSERT INTO `jobs` VALUES ('3', 'Cong nhan');
INSERT INTO `jobs` VALUES ('4', 'Lam ruong');
INSERT INTO `jobs` VALUES ('5', 'Buon ban');
INSERT INTO `jobs` VALUES ('6', 'Buon ban');
INSERT INTO `jobs` VALUES ('7', 'Giao vien');

-- ----------------------------
-- Table structure for learningcapacities
-- ----------------------------
DROP TABLE IF EXISTS `learningcapacities`;
CREATE TABLE `learningcapacities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `minPoint` float NOT NULL,
  `maxPoint` float NOT NULL,
  `controlPoint` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of learningcapacities
-- ----------------------------
INSERT INTO `learningcapacities` VALUES ('1', 'Gioi', '8', '10', '6.5');
INSERT INTO `learningcapacities` VALUES ('2', 'Kha', '6.5', '7.9', '5');
INSERT INTO `learningcapacities` VALUES ('3', 'Trung binh', '5', '6.4', '3.5');
INSERT INTO `learningcapacities` VALUES ('4', 'Yeu', '3.5', '4.9', '2');
INSERT INTO `learningcapacities` VALUES ('5', 'Kem', '0', '3.4', '0');

-- ----------------------------
-- Table structure for nations
-- ----------------------------
DROP TABLE IF EXISTS `nations`;
CREATE TABLE `nations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`name`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nations
-- ----------------------------
INSERT INTO `nations` VALUES ('1', 'Kinh');
INSERT INTO `nations` VALUES ('2', 'Hoa');
INSERT INTO `nations` VALUES ('3', 'Chăm');
INSERT INTO `nations` VALUES ('8', 'Sán Dìu');
INSERT INTO `nations` VALUES ('9', 'Kinh');

-- ----------------------------
-- Table structure for points
-- ----------------------------
DROP TABLE IF EXISTS `points`;
CREATE TABLE `points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `semesterId` int(11) NOT NULL,
  `schoolYearId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `pointTypeId` int(11) NOT NULL,
  `pointNumber` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pointTypeId` (`pointTypeId`),
  KEY `studentId` (`studentId`),
  KEY `semesterId` (`semesterId`),
  KEY `schoolYearId` (`schoolYearId`),
  KEY `classId` (`classId`),
  KEY `subjectId` (`subjectId`),
  CONSTRAINT `points_ibfk_2` FOREIGN KEY (`semesterId`) REFERENCES `semesters` (`id`),
  CONSTRAINT `points_ibfk_3` FOREIGN KEY (`schoolYearId`) REFERENCES `schoolyears` (`id`),
  CONSTRAINT `points_ibfk_4` FOREIGN KEY (`classId`) REFERENCES `classes` (`id`),
  CONSTRAINT `points_ibfk_5` FOREIGN KEY (`subjectId`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of points
-- ----------------------------
INSERT INTO `points` VALUES ('89', '66', '1', '1', '1', '2', '1', '5');
INSERT INTO `points` VALUES ('90', '66', '1', '1', '1', '2', '2', '10');
INSERT INTO `points` VALUES ('91', '66', '1', '1', '1', '2', '3', '8');
INSERT INTO `points` VALUES ('92', '66', '1', '1', '1', '2', '4', '9');

-- ----------------------------
-- Table structure for pointtypes
-- ----------------------------
DROP TABLE IF EXISTS `pointtypes`;
CREATE TABLE `pointtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `factor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pointtypes
-- ----------------------------
INSERT INTO `pointtypes` VALUES ('1', 'Kiểm tra miệng', '1');
INSERT INTO `pointtypes` VALUES ('2', 'Kiểm tra 15 phút', '1');
INSERT INTO `pointtypes` VALUES ('3', 'Kiểm tra 1 tiết', '2');
INSERT INTO `pointtypes` VALUES ('4', 'Thi học kỳ', '1');

-- ----------------------------
-- Table structure for religions
-- ----------------------------
DROP TABLE IF EXISTS `religions`;
CREATE TABLE `religions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of religions
-- ----------------------------
INSERT INTO `religions` VALUES ('1', 'Khong');
INSERT INTO `religions` VALUES ('2', 'Phat');
INSERT INTO `religions` VALUES ('3', 'PG Hoa Hao');
INSERT INTO `religions` VALUES ('4', 'Thien Chua');
INSERT INTO `religions` VALUES ('5', 'Tin Lanh');
INSERT INTO `religions` VALUES ('6', 'Phật giáo');
INSERT INTO `religions` VALUES ('7', 'Tin Lanh');

-- ----------------------------
-- Table structure for results
-- ----------------------------
DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of results
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `codeName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'Admin', 'Admin');
INSERT INTO `roles` VALUES ('2', 'Ban giám hiệu', 'SchoolBoard');
INSERT INTO `roles` VALUES ('3', 'Giáo viên', 'Teacher');
INSERT INTO `roles` VALUES ('4', 'Nhân viên giáo vụ', 'SchoolStaff');
INSERT INTO `roles` VALUES ('5', 'Người dùng', 'User');

-- ----------------------------
-- Table structure for rules
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxAge` int(11) DEFAULT NULL,
  `minAge` int(11) DEFAULT NULL,
  `maxSize` int(11) DEFAULT NULL,
  `minSize` int(11) DEFAULT NULL,
  `maxPoint` int(11) DEFAULT NULL,
  `schoolName` varchar(255) NOT NULL,
  `schoolAddress` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rules
-- ----------------------------
INSERT INTO `rules` VALUES ('1', '20', '15', '40', '30', '10', 'THPT Lê Hồng Phong', 'Cẩm Phả - Quảng Ninh');

-- ----------------------------
-- Table structure for schoolyears
-- ----------------------------
DROP TABLE IF EXISTS `schoolyears`;
CREATE TABLE `schoolyears` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schoolyears
-- ----------------------------
INSERT INTO `schoolyears` VALUES ('1', '2017-2018');

-- ----------------------------
-- Table structure for semesterresultbysubjects
-- ----------------------------
DROP TABLE IF EXISTS `semesterresultbysubjects`;
CREATE TABLE `semesterresultbysubjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(6) NOT NULL,
  `classId` int(10) DEFAULT NULL,
  `subjectId` int(6) DEFAULT NULL,
  `semesterId` int(3) DEFAULT NULL,
  `schoolYearId` int(6) NOT NULL,
  `averageExamScore` float DEFAULT NULL,
  `averageSubjectScore` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `semesterresultbysubjects_ibfk_1` (`studentId`),
  KEY `semesterresultbysubjects_ibfk_2` (`classId`),
  KEY `semesterresultbysubjects_ibfk_3` (`subjectId`),
  KEY `semesterresultbysubjects_ibfk_4` (`semesterId`),
  KEY `semesterresultbysubjects_ibfk_5` (`schoolYearId`),
  CONSTRAINT `semesterresultbysubjects_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `classes` (`id`),
  CONSTRAINT `semesterresultbysubjects_ibfk_3` FOREIGN KEY (`subjectId`) REFERENCES `subjects` (`id`),
  CONSTRAINT `semesterresultbysubjects_ibfk_4` FOREIGN KEY (`semesterId`) REFERENCES `semesters` (`id`),
  CONSTRAINT `semesterresultbysubjects_ibfk_5` FOREIGN KEY (`schoolYearId`) REFERENCES `schoolyears` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of semesterresultbysubjects
-- ----------------------------
INSERT INTO `semesterresultbysubjects` VALUES ('5', '66', '2', '1', '1', '1', '7.75', '8');

-- ----------------------------
-- Table structure for semesterresults
-- ----------------------------
DROP TABLE IF EXISTS `semesterresults`;
CREATE TABLE `semesterresults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(6) NOT NULL,
  `classId` int(10) NOT NULL,
  `semesterId` int(3) NOT NULL,
  `schoolYearId` int(6) NOT NULL,
  `learningCapacityId` int(6) NOT NULL,
  `conductId` int(6) NOT NULL,
  `averageSubjectScore` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `semesterresults_ibfk_5` (`learningCapacityId`),
  KEY `semesterresults_ibfk_6` (`conductId`),
  KEY `studentId` (`studentId`),
  KEY `classId` (`classId`),
  KEY `semesterId` (`semesterId`),
  KEY `schoolYearId` (`schoolYearId`),
  CONSTRAINT `semesterresults_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`),
  CONSTRAINT `semesterresults_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `classes` (`id`),
  CONSTRAINT `semesterresults_ibfk_3` FOREIGN KEY (`semesterId`) REFERENCES `semesters` (`id`),
  CONSTRAINT `semesterresults_ibfk_4` FOREIGN KEY (`schoolYearId`) REFERENCES `schoolyears` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of semesterresults
-- ----------------------------
INSERT INTO `semesterresults` VALUES ('3', '66', '2', '1', '1', '5', '0', '0');

-- ----------------------------
-- Table structure for semesters
-- ----------------------------
DROP TABLE IF EXISTS `semesters`;
CREATE TABLE `semesters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `factor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of semesters
-- ----------------------------
INSERT INTO `semesters` VALUES ('1', 'Hoc ki 1', '1');

-- ----------------------------
-- Table structure for studentclasses
-- ----------------------------
DROP TABLE IF EXISTS `studentclasses`;
CREATE TABLE `studentclasses` (
  `id` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `studentclasses_ibfk_1` (`classId`),
  KEY `studentclasses_ibfk_2` (`studentId`),
  CONSTRAINT `studentclasses_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `classes` (`id`),
  CONSTRAINT `studentclasses_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentclasses
-- ----------------------------
INSERT INTO `studentclasses` VALUES ('2', '1', '2');
INSERT INTO `studentclasses` VALUES ('6', '2', '2');
INSERT INTO `studentclasses` VALUES ('7', '2', '3');
INSERT INTO `studentclasses` VALUES ('8', '2', '4');
INSERT INTO `studentclasses` VALUES ('9', '1', '5');
INSERT INTO `studentclasses` VALUES ('10', '1', '6');
INSERT INTO `studentclasses` VALUES ('11', '1', '7');
INSERT INTO `studentclasses` VALUES ('12', '2', '8');
INSERT INTO `studentclasses` VALUES ('13', '2', '10');

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(30) NOT NULL,
  `gender` int(1) DEFAULT NULL,
  `birthDay` date DEFAULT NULL,
  `placeOfBirth` varchar(50) DEFAULT NULL,
  `nationId` int(6) DEFAULT NULL,
  `religionId` int(6) DEFAULT NULL,
  `fatherName` varchar(30) DEFAULT NULL,
  `fatherJobId` int(6) DEFAULT NULL,
  `motherName` varchar(30) DEFAULT NULL,
  `motherJobId` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `students_ibfk_3` (`nationId`) USING BTREE,
  KEY `fatherJobId` (`fatherJobId`),
  KEY `religionId` (`religionId`),
  KEY `motherJobId` (`motherJobId`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`fatherJobId`) REFERENCES `jobs` (`id`),
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`nationId`) REFERENCES `nations` (`id`),
  CONSTRAINT `students_ibfk_3` FOREIGN KEY (`religionId`) REFERENCES `religions` (`id`),
  CONSTRAINT `students_ibfk_4` FOREIGN KEY (`motherJobId`) REFERENCES `jobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('2', 'Nguyen Ngoc An', '0', '0000-00-00', 'Ben Tre', '1', '2', 'Biet chet lien', '3', 'Biet chet lien', '1');
INSERT INTO `students` VALUES ('3', 'Le Hoang Anh', '0', '0000-00-00', 'Cho Moi', '1', '4', 'Biet chet lien', '5', 'Biet chet lien', '5');
INSERT INTO `students` VALUES ('4', 'Huynh Thien Chi', '0', '0000-00-00', 'Dong Thap', '1', '3', 'Biet chet lien', '2', 'Biet chet lien', '4');
INSERT INTO `students` VALUES ('5', 'Ly Ngoc Duy', '0', '0000-00-00', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('6', 'Huynh Ngoc Diep', '1', '0000-00-00', 'Ben Tre', '1', '2', 'Biet chet lien', '3', 'Biet chet lien', '1');
INSERT INTO `students` VALUES ('7', 'Tran Thi Hue', '1', '0000-00-00', 'Cho Moi', '1', '4', 'Biet chet lien', '5', 'Biet chet lien', '5');
INSERT INTO `students` VALUES ('8', 'Nguyen Thanh Huy', '0', '0000-00-00', 'Dong Thap', '1', '3', 'Biet chet lien', '2', 'Biet chet lien', '4');
INSERT INTO `students` VALUES ('9', 'Tran Phuoc Lap', '0', '0000-00-00', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('10', 'Truong Thi Nga', '1', '0000-00-00', 'Ben Tre', '1', '2', 'Biet chet lien', '3', 'Biet chet lien', '1');
INSERT INTO `students` VALUES ('11', 'Nguyen Thi Nga', '1', '0000-00-00', 'Cho Moi', '1', '4', 'Biet chet lien', '5', 'Biet chet lien', '5');
INSERT INTO `students` VALUES ('12', 'Tran Thi Hong Nghi', '1', '0000-00-00', 'Dong Thap', '1', '3', 'Biet chet lien', '2', 'Biet chet lien', '4');
INSERT INTO `students` VALUES ('13', 'Huynh Thi My Ngoc', '1', '0000-00-00', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('14', 'Tran Thi My Nhan', '1', '0000-00-00', 'Ben Tre', '1', '2', 'Biet chet lien', '3', 'Biet chet lien', '1');
INSERT INTO `students` VALUES ('15', 'Truong Thi Ngoc Nhung', '1', '0000-00-00', 'Cho Moi', '1', '4', 'Biet chet lien', '5', 'Biet chet lien', '5');
INSERT INTO `students` VALUES ('16', 'Huynh Quoc Phuong', '0', '0000-00-00', 'Dong Thap', '1', '3', 'Biet chet lien', '2', 'Biet chet lien', '4');
INSERT INTO `students` VALUES ('17', 'Ly Ngoc Phuong', '1', '0000-00-00', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('18', 'Nguyen Thi Phuong', '1', '0000-00-00', 'Ben Tre', '1', '2', 'Biet chet lien', '3', 'Biet chet lien', '1');
INSERT INTO `students` VALUES ('19', 'Nguyen Phu Quoc', '0', '0000-00-00', 'Cho Moi', '1', '4', 'Biet chet lien', '5', 'Biet chet lien', '5');
INSERT INTO `students` VALUES ('20', 'Vo Thien Quoc', '0', '0000-00-00', 'Dong Thap', '1', '3', 'Biet chet lien', '2', 'Biet chet lien', '4');
INSERT INTO `students` VALUES ('21', 'Tran Van Rang', '0', '0000-00-00', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('22', 'Vo Huu Tanh', '0', '0000-00-00', 'Ben Tre', '1', '2', 'Biet chet lien', '3', 'Biet chet lien', '1');
INSERT INTO `students` VALUES ('23', 'Le Minh Tam', '0', '0000-00-00', 'Cho Moi', '1', '4', 'Biet chet lien', '5', 'Biet chet lien', '5');
INSERT INTO `students` VALUES ('24', 'Nguyen Duc Tam', '0', '0000-00-00', 'Dong Thap', '1', '3', 'Biet chet lien', '2', 'Biet chet lien', '4');
INSERT INTO `students` VALUES ('25', 'Nguyen Thanh Tam', '0', '0000-00-00', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('26', 'Tran Ngoc Minh Tan', '0', '0000-00-00', 'Ben Tre', '1', '2', 'Biet chet lien', '3', 'Biet chet lien', '1');
INSERT INTO `students` VALUES ('27', 'Duong Kim Thanh', '1', '0000-00-00', 'Cho Moi', '1', '4', 'Biet chet lien', '5', 'Biet chet lien', '5');
INSERT INTO `students` VALUES ('28', 'Vang Si Thanh', '0', '0000-00-00', 'Dong Thap', '1', '3', 'Biet chet lien', '2', 'Biet chet lien', '4');
INSERT INTO `students` VALUES ('29', 'Do Thi Bich Thao', '1', '0000-00-00', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('30', 'Ho Minh Thien', '0', '0000-00-00', 'Ben Tre', '1', '2', 'Biet chet lien', '3', 'Biet chet lien', '1');
INSERT INTO `students` VALUES ('31', 'Nguyen Thi Anh Thu', '1', '0000-00-00', 'Cho Moi', '1', '4', 'Biet chet lien', '5', 'Biet chet lien', '5');
INSERT INTO `students` VALUES ('32', 'Pham Nguyen B.Trinh', '1', '0000-00-00', 'Dong Thap', '1', '3', 'Biet chet lien', '2', 'Biet chet lien', '4');
INSERT INTO `students` VALUES ('33', 'Vo Ngoc Trinh', '1', '0000-00-00', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('34', 'Nguyen Huynh Minh Tri', '0', '0000-00-00', 'Ben Tre', '1', '2', 'Biet chet lien', '3', 'Biet chet lien', '1');
INSERT INTO `students` VALUES ('35', 'Do Xuan Trinh', '0', '0000-00-00', 'Cho Moi', '1', '4', 'Biet chet lien', '5', 'Biet chet lien', '5');
INSERT INTO `students` VALUES ('36', 'Nguyen Hieu Trung', '0', '0000-00-00', 'Dong Thap', '1', '3', 'Biet chet lien', '2', 'Biet chet lien', '4');
INSERT INTO `students` VALUES ('37', 'Nguyen Thanh Trung', '0', '0000-00-00', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('38', 'Tran Thanh Truc', '1', '0000-00-00', 'Ben Tre', '1', '2', 'Biet chet lien', '3', 'Biet chet lien', '1');
INSERT INTO `students` VALUES ('39', 'Cao Minh Tuan', '0', '0000-00-00', 'Cho Moi', '1', '4', 'Biet chet lien', '5', 'Biet chet lien', '5');
INSERT INTO `students` VALUES ('40', 'Nguyen Hoang Tuan', '0', '0000-00-00', 'Dong Thap', '1', '3', 'Biet chet lien', '2', 'Biet chet lien', '4');
INSERT INTO `students` VALUES ('41', 'Truong Minh Tuyen', '0', '0000-00-00', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('42', 'Le Thanh Tung', '0', '0000-00-00', 'Ben Tre', '1', '2', 'Biet chet lien', '3', 'Biet chet lien', '1');
INSERT INTO `students` VALUES ('43', 'Pham Thi Bich Vi', '1', '0000-00-00', 'Cho Moi', '1', '4', 'Biet chet lien', '5', 'Biet chet lien', '5');
INSERT INTO `students` VALUES ('44', 'Dang Quang Vinh', '0', '0000-00-00', 'Dong Thap', '1', '3', 'Biet chet lien', '2', 'Biet chet lien', '4');
INSERT INTO `students` VALUES ('45', 'Au Ngoc Vu', '0', '0000-00-00', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('46', 'Ho Thanh Vu', '0', '0000-00-00', 'Ben Tre', '1', '2', 'Biet chet lien', '3', 'Biet chet lien', '1');
INSERT INTO `students` VALUES ('47', 'Phan Quoc Vuong', '0', '0000-00-00', 'Cho Moi', '1', '4', 'Biet chet lien', '5', 'Biet chet lien', '5');
INSERT INTO `students` VALUES ('48', 'Tran Anh', '0', '0001-01-01', 'Cho Moi', '1', '6', null, '1', null, '1');
INSERT INTO `students` VALUES ('49', 'Tran Anh', '0', '0001-01-01', 'Cho Moi', '1', '6', null, '1', null, '1');
INSERT INTO `students` VALUES ('50', 'Tran Anh', '0', '0001-01-01', 'Cho Moi', '1', '6', null, '1', null, '1');
INSERT INTO `students` VALUES ('51', 'Tran Anh', '0', '0001-01-01', 'Cho Moi', '1', '6', null, '1', null, '1');
INSERT INTO `students` VALUES ('52', 'Tran Anh', '0', '0001-01-01', 'Cho Moi', '1', '6', null, '1', null, '1');
INSERT INTO `students` VALUES ('53', 'Tran Anh', '0', '0001-01-01', 'Cho Moi', '1', '6', null, '1', null, '1');
INSERT INTO `students` VALUES ('54', 'Tran Anh', '0', '0001-01-01', 'Cho Moi', '1', '6', null, '1', null, '1');
INSERT INTO `students` VALUES ('55', 'Tran Anh', '0', '0001-01-01', 'Cho Moi', '1', '6', null, '1', null, '1');
INSERT INTO `students` VALUES ('56', 'Tran Anh', '0', '0001-01-01', 'Cho Moi', '1', '6', null, '1', null, '1');
INSERT INTO `students` VALUES ('57', 'Tran Anh', '0', '0001-01-01', 'Cho Moi', '1', '6', null, '1', null, '1');
INSERT INTO `students` VALUES ('58', 'Tran Anh', '0', '0001-01-01', 'Cho Moi', '1', '6', null, '1', null, '1');
INSERT INTO `students` VALUES ('59', 'Tran Anh', '0', '2011-11-01', 'Cho Moi', '1', '6', null, '1', null, '1');
INSERT INTO `students` VALUES ('60', 'Tran Anh', '0', '2011-11-01', 'Cho Moi', '1', '6', null, '1', null, '1');
INSERT INTO `students` VALUES ('61', 'Tran Anh', '0', '2011-11-01', 'Cho Moi', '1', '6', null, '1', null, '1');
INSERT INTO `students` VALUES ('63', 'Nguyen Van Tu2', '0', '0001-01-01', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('64', 'Nguyen Van Tu2', '0', '0001-01-01', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('65', 'Nguyen Van Tu2', '0', '1999-12-20', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('66', 'Nguyen Van Tu2', '0', '1999-12-20', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('67', 'Nguyen Van Tu2', '0', '2000-12-20', 'Long Xuyen', '1', '5', 'Biet chet lien', '5', 'Biet chet lien', '2');
INSERT INTO `students` VALUES ('68', 'Nguyen Van Tu2', '0', '2000-12-20', 'Long Xuyen', '1', '7', 'Biet chet lien', '6', 'Biet chet lien', '7');

-- ----------------------------
-- Table structure for subjects
-- ----------------------------
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `lessionSize` int(11) DEFAULT NULL,
  `factor` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subjects
-- ----------------------------
INSERT INTO `subjects` VALUES ('1', 'Toan Hoc', '90', '2');
INSERT INTO `subjects` VALUES ('2', 'Vat Ly', '60', '1');
INSERT INTO `subjects` VALUES ('3', 'Hoa Hoc', '60', '1');
INSERT INTO `subjects` VALUES ('4', 'Sinh Hoc', '60', '1');
INSERT INTO `subjects` VALUES ('5', 'Ngu Van', '90', '2');
INSERT INTO `subjects` VALUES ('6', 'Lich Su', '45', '1');
INSERT INTO `subjects` VALUES ('7', 'Dia Ly', '45', '1');
INSERT INTO `subjects` VALUES ('8', 'Anh Van', '45', '1');
INSERT INTO `subjects` VALUES ('9', 'GD Cong Dan', '30', '1');
INSERT INTO `subjects` VALUES ('10', 'Tin Hoc', '30', '1');
INSERT INTO `subjects` VALUES ('11', 'The Duc', '30', '1');
INSERT INTO `subjects` VALUES ('12', 'Quoc Phong', '30', '1');
INSERT INTO `subjects` VALUES ('13', 'Cong Nghe', '30', '1');

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `subjectId` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teachers_ibfk_1` (`subjectId`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES ('1', 'Cô giáo 1', 'Hà Nội', '01234556', '1', null);
INSERT INTO `teachers` VALUES ('2', 'Thầy Thành', 'Hà Nội', '12345', '1', null);
INSERT INTO `teachers` VALUES ('3', 'Cô giáo 3', 'Hà Nội', '123456789', null, null);
INSERT INTO `teachers` VALUES ('4', 'Cô giáo 3', 'Hà Nội', '123456789', null, null);
INSERT INTO `teachers` VALUES ('5', 'Cô giáo 3', 'Hà Nội', '123456789', null, null);
INSERT INTO `teachers` VALUES ('6', 'Cô giáo 3', 'Hà Nội', '123456789', null, null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  `isLocked` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role` (`roleId`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('8', 'Admin', 'admin@localhost.com', 'admin', '123456', '1', '0');
INSERT INTO `users` VALUES ('17', 'Ban giám hiệu 1', 'bgh1@localhost.com', 'bgh01', '123456', '2', '0');
INSERT INTO `users` VALUES ('18', 'Giáo viên 1', 'gv1@localhost.com', 'gv01', '123456', '3', '0');
INSERT INTO `users` VALUES ('19', 'Giáo vụ 1', 'giaovu@localhost.com', 'giaovu', '123456', '4', '0');
INSERT INTO `users` VALUES ('20', 'Giáo viên 2', 'gv2@localhost.com', 'gv02', '123456', '3', '0');
INSERT INTO `users` VALUES ('21', 'Cô giáo 3', null, '123456789', '123456', '3', '0');
INSERT INTO `users` VALUES ('22', 'Đào Thị Minh Nguyệt', 'daonguyet06035@gmail.com', 'nmincl3', '123456', '5', '0');

-- ----------------------------
-- Table structure for yearresults
-- ----------------------------
DROP TABLE IF EXISTS `yearresults`;
CREATE TABLE `yearresults` (
  `id` int(11) NOT NULL,
  `studentId` int(6) NOT NULL,
  `classId` int(10) NOT NULL,
  `schoolYearId` int(6) NOT NULL AUTO_INCREMENT,
  `learningCapacityId` int(6) NOT NULL,
  `conductId` int(6) NOT NULL,
  `averageScore` float NOT NULL,
  `resultId` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `classId` (`classId`),
  KEY `schoolYearId` (`schoolYearId`),
  KEY `learningCapacityId` (`learningCapacityId`),
  KEY `conductId` (`conductId`),
  KEY `resultId` (`resultId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yearresults
-- ----------------------------
INSERT INTO `yearresults` VALUES ('0', '66', '2', '1', '5', '0', '0', '1');

-- ----------------------------
-- Table structure for yearresultsubjects
-- ----------------------------
DROP TABLE IF EXISTS `yearresultsubjects`;
CREATE TABLE `yearresultsubjects` (
  `id` int(11) NOT NULL,
  `studentId` int(6) NOT NULL,
  `classId` int(10) NOT NULL,
  `subjectId` int(6) NOT NULL,
  `schoolyearId` int(6) NOT NULL AUTO_INCREMENT,
  `reExamScore` float DEFAULT NULL,
  `averageScore` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `classId` (`classId`),
  KEY `subjectId` (`subjectId`),
  KEY `schoolyearId` (`schoolyearId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yearresultsubjects
-- ----------------------------
INSERT INTO `yearresultsubjects` VALUES ('0', '66', '2', '1', '1', '0', '8');
