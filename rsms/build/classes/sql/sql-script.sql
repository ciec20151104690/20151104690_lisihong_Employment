/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : rwms

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-02-24 18:49:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(50) NOT NULL,
  `login_num` varchar(50) DEFAULT NULL,
  `login_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `id` varchar(50) NOT NULL,
  `login_num` varchar(50) DEFAULT NULL,
  `login_name` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `scale` varchar(50) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `intoduce` text,
  `image` varchar(255) DEFAULT NULL,
  `deleted` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------

-- ----------------------------
-- Table structure for delivery
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
  `id` varchar(50) NOT NULL,
  `business_id` varchar(50) DEFAULT NULL,
  `position_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `delivery_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `user_deleted` int(1) DEFAULT NULL,
  `business_deleted` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of delivery
-- ----------------------------

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` varchar(50) NOT NULL,
  `business_id` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `publish_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `salary` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `description` text,
  `deleted` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `login_num` varchar(50) DEFAULT NULL,
  `login_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `nation` varchar(50) DEFAULT NULL,
  `native_place` varchar(50) DEFAULT NULL,
  `birthday` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `marital_status` int(1) DEFAULT NULL,
  `education` varchar(50) DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contack_num` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `school_experience` text,
  `work_experience` text,
  `self_evaluation` text,
  `image` varchar(255) DEFAULT NULL,
  `deleted` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
