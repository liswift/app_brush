/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50539
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2016-08-31 23:04:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `task_sub`
-- ----------------------------
DROP TABLE IF EXISTS `task_sub`;
CREATE TABLE `task_sub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL COMMENT '任务id',
  `per_time` int(11) DEFAULT '0' COMMENT '所在粒度',
  `action_id` int(11) unsigned NOT NULL COMMENT '动作组id',
  `device_info_id` int(11) NOT NULL COMMENT '设备信息',
  `card_info_id` int(11) NOT NULL COMMENT '手机卡信息',
  `net_info_id` int(11) NOT NULL COMMENT '网络信息',
  `run_time` int(11) NOT NULL COMMENT '任务执行时间',
  `callback_time` int(11) NOT NULL COMMENT '任务执行完回调时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_sub
-- ----------------------------
