/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : db_pims

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2015-04-19 21:54:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_course
-- ----------------------------
DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course` (
  `id` int(11) NOT NULL auto_increment COMMENT '自增id',
  `course_id` varchar(20) default NULL COMMENT '课程id',
  `name` varchar(20) default NULL COMMENT '课程名称',
  `hours` varchar(20) default NULL COMMENT '课程时数',
  `credit` varchar(20) default NULL COMMENT '课程学分',
  `nature` varchar(20) default NULL COMMENT '课程性质',
  `is_del` tinyint(2) default '0' COMMENT '是否删除，0为未删除，1为删除',
  PRIMARY KEY  (`id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_course
-- ----------------------------

-- ----------------------------
-- Table structure for tb_depart
-- ----------------------------
DROP TABLE IF EXISTS `tb_depart`;
CREATE TABLE `tb_depart` (
  `id` int(11) NOT NULL auto_increment COMMENT '自增id',
  `depart_id` varchar(20) default NULL COMMENT '部门id',
  `depart_name` varchar(20) default NULL COMMENT '部门名称',
  `is_del` tinyint(2) default '0' COMMENT '是否删除，0为未删除，1为删除',
  PRIMARY KEY  (`id`),
  KEY `depart_id` (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_depart
-- ----------------------------
INSERT INTO `tb_depart` VALUES ('2', '123', '我是中午呢', '0');

-- ----------------------------
-- Table structure for tb_research
-- ----------------------------
DROP TABLE IF EXISTS `tb_research`;
CREATE TABLE `tb_research` (
  `id` int(11) NOT NULL auto_increment COMMENT '自增，研究id',
  `teacher_id` varchar(20) default NULL COMMENT '员工id',
  `direction` varchar(255) default NULL COMMENT '研究方向',
  `situation` varchar(255) default NULL COMMENT '课题研究情况',
  `patent` varchar(255) default NULL COMMENT '专利',
  `other` varchar(255) default NULL COMMENT '论文及著作发表情况',
  `is_del` tinyint(2) default '0' COMMENT '是否删除，0为未删除，1为删除',
  PRIMARY KEY  (`id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `tb_research_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `tb_staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_research
-- ----------------------------

-- ----------------------------
-- Table structure for tb_staff
-- ----------------------------
DROP TABLE IF EXISTS `tb_staff`;
CREATE TABLE `tb_staff` (
  `id` int(11) NOT NULL auto_increment COMMENT '自增长id',
  `staff_id` varchar(20) default NULL COMMENT '员工编号',
  `name` varchar(32) default NULL COMMENT '姓名',
  `sex` tinyint(2) default NULL COMMENT '性别',
  `educational` tinyint(2) default NULL COMMENT '学历，0小学以下，1初中，2高中，3中专，4大专，5大学，6研究生，7博士生，8博士后，9社会人士，10其他',
  `depart_id` varchar(20) default NULL COMMENT '部门id',
  `college` varchar(20) default NULL COMMENT '毕业院校',
  `health` varchar(20) default NULL COMMENT '健康情况',
  `job_name` varchar(20) default NULL COMMENT '职称',
  `position` varchar(20) default NULL COMMENT '职务',
  `rewards_punishment` varchar(255) default NULL COMMENT '奖惩',
  `state` tinyint(2) default '0' COMMENT '0在职，1转出，2辞职，3退休',
  `is_del` tinyint(2) default '0' COMMENT '是否删除，0为未删除，1为删除',
  PRIMARY KEY  (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `depart_id` (`depart_id`),
  CONSTRAINT `tb_staff_ibfk_1` FOREIGN KEY (`depart_id`) REFERENCES `tb_depart` (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 3072 kB; (`staff_id`) REFER `db_pims/tb_depart`';

-- ----------------------------
-- Records of tb_staff
-- ----------------------------
INSERT INTO `tb_staff` VALUES ('1', '12', '12', '1', '1', '123', '123', '1', '123', '123', '123', '0', '0');
INSERT INTO `tb_staff` VALUES ('2', '2342', '34234', '0', '10', '123', '123', '1', '12312', '3123', '123123', '0', '0');

-- ----------------------------
-- Table structure for tb_teach_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_teach_info`;
CREATE TABLE `tb_teach_info` (
  `id` int(11) NOT NULL auto_increment COMMENT '自增，教学信息id',
  `teacher_id` varchar(20) default NULL COMMENT '员工id',
  `course_id` varchar(20) default NULL COMMENT '课程id',
  PRIMARY KEY  (`id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `tb_teach_info_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `tb_staff` (`staff_id`),
  CONSTRAINT `tb_teach_info_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `tb_course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_teach_info
-- ----------------------------
