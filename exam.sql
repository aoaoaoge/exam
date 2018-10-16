/*
Navicat MySQL Data Transfer

Source Server         : sa
Source Server Version : 50559
Source Host           : localhost:3306
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 50559
File Encoding         : 65001

Date: 2018-05-08 20:58:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(20) NOT NULL,
  `admin_email` varchar(20) DEFAULT NULL,
  `admin_password` varchar(20) NOT NULL,
  `admin_login_time` datetime DEFAULT NULL,
  `admin_state` char(2) DEFAULT '1',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('4', '是', null, '是', null, '0');
INSERT INTO `tb_admin` VALUES ('5', 'asd', null, 'dsa', null, '1');

-- ----------------------------
-- Table structure for tb_databackup
-- ----------------------------
DROP TABLE IF EXISTS `tb_databackup`;
CREATE TABLE `tb_databackup` (
  `databackup_id` int(20) NOT NULL AUTO_INCREMENT,
  `databackup_date` datetime NOT NULL,
  `admin_id` int(20) NOT NULL,
  `databackup_sql` varchar(50) NOT NULL,
  PRIMARY KEY (`databackup_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `tb_databackup_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `tb_admin` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_databackup
-- ----------------------------

-- ----------------------------
-- Table structure for tb_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `tb_knowledge`;
CREATE TABLE `tb_knowledge` (
  `knowledeg_id` int(20) NOT NULL AUTO_INCREMENT,
  `knowledeg_name` varchar(20) NOT NULL,
  `knowledeg_describe` varchar(20) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`knowledeg_id`),
  UNIQUE KEY `knowledeg_name` (`knowledeg_name`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `tb_knowledge_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `tb_question` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_knowledge
-- ----------------------------
INSERT INTO `tb_knowledge` VALUES ('1', '母猪的护理', '老母猪护理', '1');
INSERT INTO `tb_knowledge` VALUES ('2', '母鸡的喂养与管理', '我母鸡啦', '3');
INSERT INTO `tb_knowledge` VALUES ('3', '金龙鱼的养护', '龙鱼集运', '4');

-- ----------------------------
-- Table structure for tb_option
-- ----------------------------
DROP TABLE IF EXISTS `tb_option`;
CREATE TABLE `tb_option` (
  `option_id` int(20) NOT NULL AUTO_INCREMENT,
  `options` varchar(2) NOT NULL,
  `option_content` varchar(50) NOT NULL,
  `option_picture_url` varchar(50) DEFAULT NULL,
  `testquestion_id` int(20) NOT NULL,
  PRIMARY KEY (`option_id`),
  KEY `testquestion_id` (`testquestion_id`),
  CONSTRAINT `tb_option_ibfk_1` FOREIGN KEY (`testquestion_id`) REFERENCES `tb_testquestion` (`testquestion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_option
-- ----------------------------
INSERT INTO `tb_option` VALUES ('4', 'A', '饲料猪', null, '11');
INSERT INTO `tb_option` VALUES ('5', 'B', '猪草猪', null, '11');
INSERT INTO `tb_option` VALUES ('6', 'A', '山鸡', null, '12');
INSERT INTO `tb_option` VALUES ('7', 'B', '田鸡', null, '12');
INSERT INTO `tb_option` VALUES ('8', 'C', '野鸡', null, '12');
INSERT INTO `tb_option` VALUES ('9', 'D', '老母鸡', null, '12');
INSERT INTO `tb_option` VALUES ('14', 'A', '喂金鱼', null, '14');
INSERT INTO `tb_option` VALUES ('15', 'B', '喂草', null, '14');
INSERT INTO `tb_option` VALUES ('16', 'C', '喂饲料', null, '14');
INSERT INTO `tb_option` VALUES ('17', 'A', '示范性', null, '15');
INSERT INTO `tb_option` VALUES ('18', 'B', '需V型橙V', null, '15');
INSERT INTO `tb_option` VALUES ('19', 'C', '给特大型', null, '15');
INSERT INTO `tb_option` VALUES ('20', 'D', 'VB润滑油', null, '15');
INSERT INTO `tb_option` VALUES ('21', 'A', '法国', null, '16');
INSERT INTO `tb_option` VALUES ('22', 'B', '打个骚扰', null, '16');
INSERT INTO `tb_option` VALUES ('23', 'C', '搜嘎', null, '16');
INSERT INTO `tb_option` VALUES ('24', 'D', '新增VVD', null, '16');
INSERT INTO `tb_option` VALUES ('25', 'A', '啥关系着', null, '17');
INSERT INTO `tb_option` VALUES ('26', 'B', '适当性', null, '17');
INSERT INTO `tb_option` VALUES ('27', 'C', 'gas德邦', null, '17');
INSERT INTO `tb_option` VALUES ('28', 'D', '高达八成新', null, '17');

-- ----------------------------
-- Table structure for tb_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_question`;
CREATE TABLE `tb_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_name` varchar(20) NOT NULL,
  `question_describe` varchar(20) NOT NULL,
  PRIMARY KEY (`question_id`),
  UNIQUE KEY `question_name` (`question_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_question
-- ----------------------------
INSERT INTO `tb_question` VALUES ('1', '牲畜养护大全', 'a');
INSERT INTO `tb_question` VALUES ('3', '农技大全', '农业技能题库大全');
INSERT INTO `tb_question` VALUES ('4', '渔业养殖大全', '授人以鱼不如授人以渔');

-- ----------------------------
-- Table structure for tb_question_testquestion
-- ----------------------------
DROP TABLE IF EXISTS `tb_question_testquestion`;
CREATE TABLE `tb_question_testquestion` (
  `question_testquestion_id` int(20) NOT NULL AUTO_INCREMENT,
  `testquestion_id` int(11) NOT NULL,
  `knowledeg_id` int(11) NOT NULL,
  PRIMARY KEY (`question_testquestion_id`),
  KEY `testquestion_id` (`testquestion_id`),
  KEY `knowledeg_id` (`knowledeg_id`),
  CONSTRAINT `tb_question_testquestion_ibfk_1` FOREIGN KEY (`testquestion_id`) REFERENCES `tb_testquestion` (`testquestion_id`),
  CONSTRAINT `tb_question_testquestion_ibfk_2` FOREIGN KEY (`knowledeg_id`) REFERENCES `tb_knowledge` (`knowledeg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_question_testquestion
-- ----------------------------
INSERT INTO `tb_question_testquestion` VALUES ('14', '11', '1');
INSERT INTO `tb_question_testquestion` VALUES ('15', '12', '2');
INSERT INTO `tb_question_testquestion` VALUES ('17', '14', '3');
INSERT INTO `tb_question_testquestion` VALUES ('18', '15', '2');
INSERT INTO `tb_question_testquestion` VALUES ('19', '16', '3');
INSERT INTO `tb_question_testquestion` VALUES ('20', '17', '2');

-- ----------------------------
-- Table structure for tb_subject
-- ----------------------------
DROP TABLE IF EXISTS `tb_subject`;
CREATE TABLE `tb_subject` (
  `subject_id` int(20) NOT NULL AUTO_INCREMENT,
  `testquestion_id` int(11) NOT NULL,
  `testpaper_id` int(11) NOT NULL,
  `subject_count` double(3,0) NOT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `testquestion_id` (`testquestion_id`),
  KEY `testpaper_id` (`testpaper_id`),
  CONSTRAINT `tb_subject_ibfk_1` FOREIGN KEY (`testquestion_id`) REFERENCES `tb_testquestion` (`testquestion_id`),
  CONSTRAINT `tb_subject_ibfk_2` FOREIGN KEY (`testpaper_id`) REFERENCES `tb_testpaper` (`testpaper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_subject
-- ----------------------------

-- ----------------------------
-- Table structure for tb_testpaper
-- ----------------------------
DROP TABLE IF EXISTS `tb_testpaper`;
CREATE TABLE `tb_testpaper` (
  `testpaper_id` int(20) NOT NULL AUTO_INCREMENT,
  `testpaper_name` varchar(20) NOT NULL,
  `testpaper_fangshi` varchar(20) NOT NULL,
  `testpaper_type` varchar(20) NOT NULL,
  `testpaper_jigefenshu` double(5,2) NOT NULL,
  `testpaper_time` varchar(5) NOT NULL,
  `testpaper_zongfen` double(5,2) NOT NULL,
  `admin_id` int(20) NOT NULL,
  `testpaper_zhuangtai` varchar(2) NOT NULL DEFAULT '2',
  `testpaper_modify` datetime NOT NULL,
  PRIMARY KEY (`testpaper_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `tb_testpaper_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `tb_admin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_testpaper
-- ----------------------------
INSERT INTO `tb_testpaper` VALUES ('1', 'aa', 'bb', 'cc', '60.00', '120', '100.00', '4', '2', '2018-05-08 20:31:33');

-- ----------------------------
-- Table structure for tb_testquestion
-- ----------------------------
DROP TABLE IF EXISTS `tb_testquestion`;
CREATE TABLE `tb_testquestion` (
  `testquestion_id` int(20) NOT NULL AUTO_INCREMENT,
  `testquestion_type` varchar(1) NOT NULL,
  `testquestion_content` varchar(50) NOT NULL,
  `testquestion_refrenceanswer` varchar(50) DEFAULT NULL,
  `testquestion_answer` varchar(50) NOT NULL,
  `testquestion_source` varchar(50) DEFAULT NULL,
  `testquestion_examination` varchar(50) DEFAULT NULL,
  `testionquestion_keyword` varchar(20) DEFAULT NULL,
  `testionquestion_analysis` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`testquestion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_testquestion
-- ----------------------------
INSERT INTO `tb_testquestion` VALUES ('11', '1', '喂猪', null, 'B', '农村', '猪', '喂', '好猪肉');
INSERT INTO `tb_testquestion` VALUES ('12', '1', '喂鸡', null, 'A', '农村', '鸡种', '鸡', '好鸡');
INSERT INTO `tb_testquestion` VALUES ('14', '1', '喂鱼', null, 'A', '水族馆', '喂', '喂', '拿什么喂鱼');
INSERT INTO `tb_testquestion` VALUES ('15', '1', '发发发', null, 'D', '打发', '各乡镇', '的撒', '砂锅饭您的');
INSERT INTO `tb_testquestion` VALUES ('16', '1', '是大法官', null, 'B', '好的', '双方须知', '撒公司', '大股东宣传部');
INSERT INTO `tb_testquestion` VALUES ('17', '1', '的撒GV的出现变化', null, 'C', '十大女工作', '啥关系着d', '大概持续', '打不打工');

-- ----------------------------
-- Table structure for tb_testquestionhistory
-- ----------------------------
DROP TABLE IF EXISTS `tb_testquestionhistory`;
CREATE TABLE `tb_testquestionhistory` (
  `testpaperhistory_id` int(20) NOT NULL AUTO_INCREMENT,
  `testpaper_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  PRIMARY KEY (`testpaperhistory_id`),
  KEY `testpaper_id` (`testpaper_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tb_testquestionhistory_ibfk_1` FOREIGN KEY (`testpaper_id`) REFERENCES `tb_testpaper` (`testpaper_id`),
  CONSTRAINT `tb_testquestionhistory_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_testquestionhistory
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_email` varchar(20) DEFAULT NULL,
  `user_province` varchar(20) NOT NULL,
  `user_company` varchar(20) NOT NULL,
  `user_department` varchar(20) NOT NULL,
  `user_state` char(2) DEFAULT '1',
  `user_login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `tb_question` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '11', '123', '张三', '23456789@qq.com', '四川省', '学习', '教育部', '1', '2018-05-04 16:47:50');
INSERT INTO `tb_user` VALUES ('2', '11', '234', '李四', '2315643@qq.com', '重庆市', '三大', '维修部', '1', '2018-05-15 16:49:24');
INSERT INTO `tb_user` VALUES ('3', '11', '234', '李四', '2315643@qq.com', '重庆市', '三大', '维修部', '0', '2018-05-15 16:49:24');
INSERT INTO `tb_user` VALUES ('4', '22', '4', '4', '4', '4', '4', '4', '1', '2018-05-07 09:40:56');
INSERT INTO `tb_user` VALUES ('5', '22', '的撒', '的撒速度', null, '河北省', '的撒', '的撒', '1', null);
INSERT INTO `tb_user` VALUES ('6', '22', 'jlk', 'lkj', null, '四川省', 'kjlg', 'lkj', '1', null);
INSERT INTO `tb_user` VALUES ('7', '22', 'gdfsg', 'gdsfg', null, '四川省', 'gfdsg', 'gfdsg', '1', null);
INSERT INTO `tb_user` VALUES ('8', '3', '123456', '老农民', null, '四川省', '无', '无', '0', null);

-- ----------------------------
-- Table structure for tb_userhistory
-- ----------------------------
DROP TABLE IF EXISTS `tb_userhistory`;
CREATE TABLE `tb_userhistory` (
  `userhistory_id` int(20) NOT NULL AUTO_INCREMENT,
  `testqustion_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `userhistory_answer` varchar(50) NOT NULL,
  `userhistory_resule` varchar(2) NOT NULL,
  PRIMARY KEY (`userhistory_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tb_userhistory_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_userhistory
-- ----------------------------
