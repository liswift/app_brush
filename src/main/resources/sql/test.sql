/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50539
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2016-08-31 23:27:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `action`
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `actions` varchar(255) NOT NULL COMMENT '组合动作',
  `name` varchar(32) DEFAULT NULL COMMENT '动作组名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of action
-- ----------------------------

-- ----------------------------
-- Table structure for `action_sub`
-- ----------------------------
DROP TABLE IF EXISTS `action_sub`;
CREATE TABLE `action_sub` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `action` varchar(500) NOT NULL COMMENT '动作',
  `run_time` int(11) NOT NULL COMMENT '运行时长',
  `name` varchar(32) DEFAULT NULL COMMENT '动作名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of action_sub
-- ----------------------------

-- ----------------------------
-- Table structure for `card_info`
-- ----------------------------
DROP TABLE IF EXISTS `card_info`;
CREATE TABLE `card_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel_android_id` varchar(32) NOT NULL COMMENT 'android_id 唯一',
  `subscriber_id` varchar(64) DEFAULT NULL COMMENT '跟operator有关系，前5位时operator',
  `operator` varchar(32) DEFAULT NULL COMMENT '运营商标志码',
  `operator_name` int(11) DEFAULT NULL COMMENT '中国联通\\中国电信\\中国移动',
  `line1_number` varchar(32) DEFAULT NULL COMMENT '联通手机的手机号码',
  `sim_serial_number` varchar(32) DEFAULT NULL COMMENT 'sim卡串号',
  `network_type` int(11) DEFAULT NULL COMMENT '网络类型',
  `phone_type` int(11) DEFAULT NULL COMMENT '手机通话类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of card_info
-- ----------------------------

-- ----------------------------
-- Table structure for `device_info`
-- ----------------------------
DROP TABLE IF EXISTS `device_info`;
CREATE TABLE `device_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version_release` varchar(32) NOT NULL COMMENT '手机系统版本',
  `brand` varchar(64) DEFAULT NULL COMMENT '品牌',
  `board` varchar(32) DEFAULT NULL COMMENT '具体手机型号',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_info
-- ----------------------------

-- ----------------------------
-- Table structure for `dict`
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LABEL` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `DEL_FLAG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('1', '正常', '0', 'user', '用户状态', '1', null, null);
INSERT INTO `dict` VALUES ('2', '禁用', '1', 'user', '用户状态', '2', null, null);
INSERT INTO `dict` VALUES ('4', '普通用户', '0', 'user', '用户类型', null, null, null);
INSERT INTO `dict` VALUES ('5', '会员用户', '1', 'user', '用户类型', null, null, null);

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATER` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `OS` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `BROWSER` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `IP` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `MAC` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTE_TIME` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `REQUEST_PARAM` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4658 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('2457', null, '2016-03-21 15:42:57', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2458', null, '2016-03-21 15:44:25', null, 'Windows 7', 'Chrome', '180.169.84.156', null, null, null, null);
INSERT INTO `log` VALUES ('2459', null, '2016-03-21 15:44:52', null, 'Windows 7', 'Chrome', '59.46.172.210', null, null, null, null);
INSERT INTO `log` VALUES ('2460', null, '2016-03-21 15:45:04', null, 'Windows 7', 'Chrome', '117.36.206.7', null, null, null, null);
INSERT INTO `log` VALUES ('2461', null, '2016-03-21 15:50:39', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2462', null, '2016-03-21 15:52:17', null, 'Windows 7', 'Chrome', '59.46.172.210', null, null, null, null);
INSERT INTO `log` VALUES ('2463', null, '2016-03-21 15:52:18', null, 'Windows 7', 'Chrome', '117.36.206.7', null, null, null, null);
INSERT INTO `log` VALUES ('2464', null, '2016-03-21 15:53:28', null, 'Windows 7', 'Chrome', '123.117.29.110', null, null, null, null);
INSERT INTO `log` VALUES ('2465', null, '2016-03-21 15:56:29', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2466', null, '2016-03-21 15:57:25', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2467', null, '2016-03-21 15:58:47', null, 'Windows 7', 'Chrome', '183.62.60.90', null, null, null, null);
INSERT INTO `log` VALUES ('2468', null, '2016-03-21 15:59:27', null, 'Windows 7', 'Firefox 4', '183.62.60.90', null, null, null, null);
INSERT INTO `log` VALUES ('2469', null, '2016-03-21 16:02:11', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2470', null, '2016-03-21 16:03:15', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2471', null, '2016-03-21 16:03:40', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2472', null, '2016-03-21 16:09:04', null, 'Windows', 'Chrome', '27.115.58.226', null, null, null, null);
INSERT INTO `log` VALUES ('2473', null, '2016-03-21 16:10:16', null, 'Windows 7', 'Chrome', '59.46.172.210', null, null, null, null);
INSERT INTO `log` VALUES ('2474', null, '2016-03-21 16:12:17', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2475', null, '2016-03-21 16:13:14', null, 'Windows 7', 'Chrome', '182.100.43.44', null, null, null, null);
INSERT INTO `log` VALUES ('2476', null, '2016-03-21 16:13:31', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2477', null, '2016-03-21 16:19:20', null, 'Windows 7', 'Chrome', '180.169.84.156', null, null, null, null);
INSERT INTO `log` VALUES ('2478', null, '2016-03-21 16:19:23', null, 'Windows 7', 'Chrome', '222.85.139.101', null, null, null, null);
INSERT INTO `log` VALUES ('2479', null, '2016-03-21 16:20:07', null, 'Windows 7', 'Chrome', '222.85.139.101', null, null, null, null);
INSERT INTO `log` VALUES ('2480', null, '2016-03-21 16:24:36', null, 'Windows 7', 'Chrome', '113.91.164.42', null, null, null, null);
INSERT INTO `log` VALUES ('2481', null, '2016-03-21 16:25:19', null, 'Windows 7', 'Chrome', '113.91.164.42', null, null, null, null);
INSERT INTO `log` VALUES ('2482', null, '2016-03-21 16:26:00', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2483', null, '2016-03-21 16:28:16', null, 'Windows 7', 'Chrome', '210.32.120.100', null, null, null, null);
INSERT INTO `log` VALUES ('2484', null, '2016-03-21 16:29:16', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2485', null, '2016-03-21 16:35:10', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2486', null, '2016-03-21 16:36:34', null, 'Windows 7', 'Chrome', '113.110.182.1', null, null, null, null);
INSERT INTO `log` VALUES ('2487', null, '2016-03-21 16:36:48', null, 'Windows 7', 'Chrome', '219.142.62.106', null, null, null, null);
INSERT INTO `log` VALUES ('2488', null, '2016-03-21 16:36:54', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2489', null, '2016-03-21 16:37:37', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2490', null, '2016-03-21 16:37:58', null, 'Windows 7', 'Chrome', '61.50.120.26', null, null, null, null);
INSERT INTO `log` VALUES ('2491', null, '2016-03-21 16:38:24', null, 'Windows 7', 'Chrome', '39.187.53.31', null, null, null, null);
INSERT INTO `log` VALUES ('2492', null, '2016-03-21 16:38:36', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2493', null, '2016-03-21 16:38:40', null, 'Windows Vista', 'Chrome', '202.101.166.66', null, null, null, null);
INSERT INTO `log` VALUES ('2494', null, '2016-03-21 16:38:47', null, 'Windows 7', 'Firefox 4', '121.33.201.126', null, null, null, null);
INSERT INTO `log` VALUES ('2495', null, '2016-03-21 16:38:56', null, 'Windows', 'Chrome', '111.206.87.61', null, null, null, null);
INSERT INTO `log` VALUES ('2496', null, '2016-03-21 16:38:58', null, 'Windows Vista', 'Chrome', '202.101.166.66', null, null, null, null);
INSERT INTO `log` VALUES ('2497', null, '2016-03-21 16:39:24', null, 'Windows Vista', 'Chrome', '202.101.166.66', null, null, null, null);
INSERT INTO `log` VALUES ('2498', null, '2016-03-21 16:39:27', null, 'Windows 7', 'Mozilla', '123.233.245.251', null, null, null, null);
INSERT INTO `log` VALUES ('2499', null, '2016-03-21 16:39:29', null, 'Windows 8', 'Chrome', '36.110.1.66', null, null, null, null);
INSERT INTO `log` VALUES ('2500', null, '2016-03-21 16:39:40', null, 'Android 4.x', 'Mobile Safari', '172.28.114.225', null, null, null, null);
INSERT INTO `log` VALUES ('2501', null, '2016-03-21 16:39:49', null, 'Windows XP', 'Chrome', '58.59.204.110', null, null, null, null);
INSERT INTO `log` VALUES ('2502', null, '2016-03-21 16:39:59', null, 'Windows 7', 'Mozilla', '119.123.136.92', null, null, null, null);
INSERT INTO `log` VALUES ('2503', null, '2016-03-21 16:40:09', null, 'Windows 7', 'Mozilla', '123.233.245.251', null, null, null, null);
INSERT INTO `log` VALUES ('2504', null, '2016-03-21 16:40:14', null, 'Windows 7', 'Mozilla', '123.233.245.251', null, null, null, null);
INSERT INTO `log` VALUES ('2505', null, '2016-03-21 16:40:16', null, 'Windows 7', 'Mozilla', '119.123.136.92', null, null, null, null);
INSERT INTO `log` VALUES ('2506', null, '2016-03-21 16:40:30', null, 'Windows', 'Chrome', '113.128.150.143', null, null, null, null);
INSERT INTO `log` VALUES ('2507', null, '2016-03-21 16:40:42', null, 'Windows 7', 'Chrome', '60.191.114.2', null, null, null, null);
INSERT INTO `log` VALUES ('2508', null, '2016-03-21 16:40:54', null, 'Windows 7', 'Chrome', '119.162.165.7', null, null, null, null);
INSERT INTO `log` VALUES ('2509', null, '2016-03-21 16:40:59', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2510', null, '2016-03-21 16:41:13', null, 'Windows', 'Chrome', '222.186.209.177', null, null, null, null);
INSERT INTO `log` VALUES ('2511', null, '2016-03-21 16:41:21', null, 'Windows 7', 'Chrome', '210.32.120.100', null, null, null, null);
INSERT INTO `log` VALUES ('2512', null, '2016-03-21 16:41:26', null, 'Windows', 'Chrome', '113.128.107.61', null, null, null, null);
INSERT INTO `log` VALUES ('2513', null, '2016-03-21 16:42:11', null, 'Windows', 'Firefox 4', '123.233.121.74', null, null, null, null);
INSERT INTO `log` VALUES ('2514', null, '2016-03-21 16:42:21', null, 'Windows 7', 'Firefox 4', '119.85.113.194', null, null, null, null);
INSERT INTO `log` VALUES ('2515', null, '2016-03-21 16:42:27', null, 'Windows 7', 'Firefox 4', '121.33.201.126', null, null, null, null);
INSERT INTO `log` VALUES ('2516', null, '2016-03-21 16:42:32', null, 'Windows 7', 'Firefox 4', '121.33.201.126', null, null, null, null);
INSERT INTO `log` VALUES ('2517', null, '2016-03-21 16:42:38', null, 'Windows 7', 'Chrome', '210.32.120.100', null, null, null, null);
INSERT INTO `log` VALUES ('2518', null, '2016-03-21 16:42:39', null, 'Windows 7', 'Internet Explorer 10', '113.128.107.61', null, null, null, null);
INSERT INTO `log` VALUES ('2519', null, '2016-03-21 16:43:06', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2520', null, '2016-03-21 16:43:18', null, 'Windows 7', 'Mozilla', '115.236.69.237', null, null, null, null);
INSERT INTO `log` VALUES ('2521', null, '2016-03-21 16:43:21', null, 'Windows 7', 'Chrome', '101.95.186.150', null, null, null, null);
INSERT INTO `log` VALUES ('2522', null, '2016-03-21 16:43:34', null, 'Windows 7', 'Firefox 4', '113.128.107.61', null, null, null, null);
INSERT INTO `log` VALUES ('2523', null, '2016-03-21 16:43:43', null, 'Windows', 'Chrome', '113.128.107.61', null, null, null, null);
INSERT INTO `log` VALUES ('2524', null, '2016-03-21 16:43:48', null, 'Windows 7', 'Chrome', '119.164.10.14', null, null, null, null);
INSERT INTO `log` VALUES ('2525', null, '2016-03-21 16:43:56', null, 'Windows 7', 'Chrome', '171.117.52.114', null, null, null, null);
INSERT INTO `log` VALUES ('2526', null, '2016-03-21 16:43:56', null, 'Windows 7', 'Chrome', '113.128.107.61', null, null, null, null);
INSERT INTO `log` VALUES ('2527', null, '2016-03-21 16:44:24', null, 'Windows Vista', 'Chrome', '120.196.217.116', null, null, null, null);
INSERT INTO `log` VALUES ('2528', null, '2016-03-21 16:44:41', null, 'Windows 7', 'Mozilla', '119.39.102.44', null, null, null, null);
INSERT INTO `log` VALUES ('2529', null, '2016-03-21 16:45:58', null, 'Windows', 'Chrome', '125.39.112.9', null, null, null, null);
INSERT INTO `log` VALUES ('2530', null, '2016-03-21 16:46:13', null, 'Windows 7', 'Internet Explorer 8', '27.211.235.12', null, null, null, null);
INSERT INTO `log` VALUES ('2531', null, '2016-03-21 16:46:32', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2532', null, '2016-03-21 16:47:13', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2533', null, '2016-03-21 16:47:23', null, 'Windows Vista', 'Chrome', '120.196.217.116', null, null, null, null);
INSERT INTO `log` VALUES ('2534', null, '2016-03-21 16:47:44', null, 'Windows 7', 'Chrome', '58.56.76.210', null, null, null, null);
INSERT INTO `log` VALUES ('2535', null, '2016-03-21 16:48:09', null, 'Windows 7', 'Chrome', '222.35.39.202', null, null, null, null);
INSERT INTO `log` VALUES ('2536', null, '2016-03-21 16:48:21', null, 'Windows Vista', 'Chrome', '120.196.217.116', null, null, null, null);
INSERT INTO `log` VALUES ('2537', null, '2016-03-21 16:48:40', null, 'Windows 7', 'Chrome', '58.56.76.210', null, null, null, null);
INSERT INTO `log` VALUES ('2538', null, '2016-03-21 16:48:49', null, 'Windows 7', 'Chrome', '113.128.107.61', null, null, null, null);
INSERT INTO `log` VALUES ('2539', null, '2016-03-21 16:49:05', null, 'Windows 7', 'Internet Explorer 10', '113.128.107.61', null, null, null, null);
INSERT INTO `log` VALUES ('2540', null, '2016-03-21 16:49:50', null, 'Windows 7', 'Chrome', '113.128.107.61', null, null, null, null);
INSERT INTO `log` VALUES ('2541', null, '2016-03-21 16:49:55', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2542', null, '2016-03-21 16:49:55', null, 'Windows 7', 'Chrome', '183.233.148.123', null, null, null, null);
INSERT INTO `log` VALUES ('2543', null, '2016-03-21 16:50:13', null, 'Windows 7', 'Firefox 4', '122.96.25.234', null, null, null, null);
INSERT INTO `log` VALUES ('2544', null, '2016-03-21 16:50:37', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2545', null, '2016-03-21 16:50:54', null, 'Windows 7', 'Chrome', '36.110.119.49', null, null, null, null);
INSERT INTO `log` VALUES ('2546', null, '2016-03-21 16:51:18', null, 'Windows 7', 'Firefox 4', '122.96.25.234', null, null, null, null);
INSERT INTO `log` VALUES ('2547', null, '2016-03-21 16:51:19', null, 'Windows Vista', 'Chrome', '120.196.217.116', null, null, null, null);
INSERT INTO `log` VALUES ('2548', null, '2016-03-21 16:52:49', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2549', null, '2016-03-21 16:53:20', null, 'Windows 7', 'Mozilla', '123.233.121.78', null, null, null, null);
INSERT INTO `log` VALUES ('2550', null, '2016-03-21 16:53:30', null, 'Windows 7', 'Chrome', '58.251.146.214', null, null, null, null);
INSERT INTO `log` VALUES ('2551', null, '2016-03-21 16:54:19', null, 'Windows 7', 'Chrome', '60.247.90.50', null, null, null, null);
INSERT INTO `log` VALUES ('2552', null, '2016-03-21 16:55:45', null, 'Windows 7', 'Chrome', '210.32.120.100', null, null, null, null);
INSERT INTO `log` VALUES ('2553', null, '2016-03-21 16:56:03', null, 'Android', 'Mobile Safari', '221.207.36.3', null, null, null, null);
INSERT INTO `log` VALUES ('2554', null, '2016-03-21 16:57:24', null, 'Windows 7', 'Firefox 4', '211.103.230.162', null, null, null, null);
INSERT INTO `log` VALUES ('2555', null, '2016-03-21 16:58:41', null, 'Android', 'Chrome', '218.58.70.250', null, null, null, null);
INSERT INTO `log` VALUES ('2556', null, '2016-03-21 16:59:07', null, 'Android', 'Chrome', '218.58.70.250', null, null, null, null);
INSERT INTO `log` VALUES ('2557', null, '2016-03-21 16:59:16', null, 'Android', 'Chrome', '218.58.70.250', null, null, null, null);
INSERT INTO `log` VALUES ('2558', null, '2016-03-21 16:59:25', null, 'Android 4.x', 'Mobile Safari', '113.129.177.4', null, null, null, null);
INSERT INTO `log` VALUES ('2559', null, '2016-03-21 16:59:29', null, 'Windows 7', 'Chrome', '36.110.119.49', null, null, null, null);
INSERT INTO `log` VALUES ('2560', null, '2016-03-21 16:59:40', null, 'Windows 7', 'Chrome', '123.232.20.158', null, null, null, null);
INSERT INTO `log` VALUES ('2561', null, '2016-03-21 16:59:41', null, 'Windows Vista', 'Chrome', '112.53.82.61', null, null, null, null);
INSERT INTO `log` VALUES ('2562', null, '2016-03-21 16:59:45', null, 'Windows 7', 'Chrome', '222.43.227.116', null, null, null, null);
INSERT INTO `log` VALUES ('2563', null, '2016-03-21 17:00:24', null, 'Windows 7', 'Chrome', '119.164.9.125', null, null, null, null);
INSERT INTO `log` VALUES ('2564', null, '2016-03-21 17:01:04', null, 'Windows 7', 'Chrome', '113.98.59.161', null, null, null, null);
INSERT INTO `log` VALUES ('2565', null, '2016-03-21 17:01:05', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2566', null, '2016-03-21 17:02:20', null, 'Mac OS X', 'Chrome', '113.128.114.120', null, null, null, null);
INSERT INTO `log` VALUES ('2567', null, '2016-03-21 17:03:18', null, 'Mac OS X', 'Chrome', '113.128.114.120', null, null, null, null);
INSERT INTO `log` VALUES ('2568', null, '2016-03-21 17:05:15', null, 'Mac OS X (iPhone)', 'Apple WebKit', '117.136.79.138', null, null, null, null);
INSERT INTO `log` VALUES ('2569', null, '2016-03-21 17:06:22', null, 'Windows', 'Firefox 4', '123.233.121.74', null, null, null, null);
INSERT INTO `log` VALUES ('2570', null, '2016-03-21 17:07:46', null, 'Mac OS X', 'Chrome', '58.58.179.40', null, null, null, null);
INSERT INTO `log` VALUES ('2571', null, '2016-03-21 17:08:59', null, 'Windows 7', 'Chrome', '39.71.45.150', null, null, null, null);
INSERT INTO `log` VALUES ('2572', null, '2016-03-21 17:09:27', null, 'Windows 8', 'Chrome', '218.75.16.114', null, null, null, null);
INSERT INTO `log` VALUES ('2573', null, '2016-03-21 17:09:34', null, 'Windows 7', 'Chrome', '58.251.146.214', null, null, null, null);
INSERT INTO `log` VALUES ('2574', null, '2016-03-21 17:09:45', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2575', null, '2016-03-21 17:10:51', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2576', null, '2016-03-21 17:11:44', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2577', null, '2016-03-21 17:11:51', null, 'Windows 7', 'Chrome', '219.232.114.131', null, null, null, null);
INSERT INTO `log` VALUES ('2578', null, '2016-03-21 17:15:30', null, 'Windows 7', 'Chrome', '113.248.151.139', null, null, null, null);
INSERT INTO `log` VALUES ('2579', null, '2016-03-21 17:16:02', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2580', null, '2016-03-21 17:21:23', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2581', null, '2016-03-21 17:21:24', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2582', null, '2016-03-21 17:21:25', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2583', null, '2016-03-21 17:21:26', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2584', null, '2016-03-21 17:21:26', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2585', null, '2016-03-21 17:21:26', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2586', null, '2016-03-21 17:21:27', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2587', null, '2016-03-21 17:21:27', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2588', null, '2016-03-21 17:21:28', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2589', null, '2016-03-21 17:21:28', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2590', null, '2016-03-21 17:21:29', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2591', null, '2016-03-21 17:21:29', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2592', null, '2016-03-21 17:21:30', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2593', null, '2016-03-21 17:21:32', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2594', null, '2016-03-21 17:21:32', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2595', null, '2016-03-21 17:21:33', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2596', null, '2016-03-21 17:21:33', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2597', null, '2016-03-21 17:22:06', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2598', null, '2016-03-21 17:22:06', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2599', null, '2016-03-21 17:22:07', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2600', null, '2016-03-21 17:22:07', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2601', null, '2016-03-21 17:22:21', null, 'Windows', 'Firefox 4', '123.233.121.74', null, null, null, null);
INSERT INTO `log` VALUES ('2602', null, '2016-03-21 17:22:24', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2603', null, '2016-03-21 17:22:24', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2604', null, '2016-03-21 17:22:25', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2605', null, '2016-03-21 17:22:48', null, 'Windows Vista', 'Firefox 4', '111.202.4.235', null, null, null, null);
INSERT INTO `log` VALUES ('2606', null, '2016-03-21 17:23:03', null, 'Windows', 'Chrome', '119.162.165.7', null, null, null, null);
INSERT INTO `log` VALUES ('2607', null, '2016-03-21 17:23:12', null, 'Windows 7', 'Chrome', '124.128.62.162', null, null, null, null);
INSERT INTO `log` VALUES ('2608', null, '2016-03-21 17:23:18', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2609', null, '2016-03-21 17:23:18', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2610', null, '2016-03-21 17:23:18', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2611', null, '2016-03-21 17:23:18', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2612', null, '2016-03-21 17:23:18', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2613', null, '2016-03-21 17:23:19', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2614', null, '2016-03-21 17:23:47', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2615', null, '2016-03-21 17:23:48', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2616', null, '2016-03-21 17:23:48', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2617', null, '2016-03-21 17:23:49', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2618', null, '2016-03-21 17:23:50', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2619', null, '2016-03-21 17:23:50', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2620', null, '2016-03-21 17:23:51', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2621', null, '2016-03-21 17:23:51', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2622', null, '2016-03-21 17:23:57', null, 'Windows', 'Firefox 4', '123.233.121.74', null, null, null, null);
INSERT INTO `log` VALUES ('2623', null, '2016-03-21 17:24:07', null, 'Windows 7', 'Chrome', '218.205.147.2', null, null, null, null);
INSERT INTO `log` VALUES ('2624', null, '2016-03-21 17:24:49', null, 'Windows 7', 'Chrome', '119.130.71.100', null, null, null, null);
INSERT INTO `log` VALUES ('2625', null, '2016-03-21 17:25:16', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2626', null, '2016-03-21 17:29:52', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2627', null, '2016-03-21 17:32:15', null, 'Windows 7', 'Chrome', '39.91.31.56', null, null, null, null);
INSERT INTO `log` VALUES ('2628', null, '2016-03-21 17:33:17', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2629', null, '2016-03-21 17:39:09', null, 'Windows XP', 'Chrome', '124.133.229.106', null, null, null, null);
INSERT INTO `log` VALUES ('2630', null, '2016-03-21 17:43:52', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2631', null, '2016-03-21 17:55:14', null, 'Windows 7', 'Chrome', '123.116.140.27', null, null, null, null);
INSERT INTO `log` VALUES ('2632', null, '2016-03-21 17:55:16', null, 'Windows 7', 'Chrome', '221.219.105.222', null, null, null, null);
INSERT INTO `log` VALUES ('2633', null, '2016-03-21 17:56:07', null, 'Windows 7', 'Chrome', '122.224.216.162', null, null, null, null);
INSERT INTO `log` VALUES ('2634', null, '2016-03-21 17:57:10', null, 'Windows 7', 'Chrome', '221.219.105.222', null, null, null, null);
INSERT INTO `log` VALUES ('2635', null, '2016-03-21 18:02:42', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2636', null, '2016-03-21 18:08:01', null, 'Windows Vista', 'Chrome', '218.98.37.113', null, null, null, null);
INSERT INTO `log` VALUES ('2637', null, '2016-03-21 18:13:23', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2638', null, '2016-03-21 18:18:32', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2639', null, '2016-03-21 18:19:50', null, 'Windows 7', 'Chrome', '219.232.114.131', null, null, null, null);
INSERT INTO `log` VALUES ('2640', null, '2016-03-21 18:21:38', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2641', null, '2016-03-21 18:25:02', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2642', null, '2016-03-21 18:27:11', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2643', null, '2016-03-21 18:32:11', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2644', null, '2016-03-21 18:45:57', null, 'Windows 7', 'Chrome', '223.215.57.86', null, null, null, null);
INSERT INTO `log` VALUES ('2645', null, '2016-03-21 18:59:38', null, 'Windows 7', 'Chrome', '223.215.57.86', null, null, null, null);
INSERT INTO `log` VALUES ('2646', null, '2016-03-21 19:25:30', null, 'Mac OS X (iPhone)', 'Apple WebKit', '113.5.2.40', null, null, null, null);
INSERT INTO `log` VALUES ('2647', null, '2016-03-21 19:38:28', null, 'Mac OS X (iPhone)', 'Apple WebKit', '117.114.129.167', null, null, null, null);
INSERT INTO `log` VALUES ('2648', null, '2016-03-21 19:39:40', null, 'Mac OS X (iPhone)', 'Apple WebKit', '117.114.129.167', null, null, null, null);
INSERT INTO `log` VALUES ('2649', null, '2016-03-21 20:49:03', null, 'Android 4.x', 'Mobile Safari', '117.136.39.201', null, null, null, null);
INSERT INTO `log` VALUES ('2650', null, '2016-03-21 21:10:06', null, 'Windows 7', 'Firefox 4', '111.0.231.202', null, null, null, null);
INSERT INTO `log` VALUES ('2651', null, '2016-03-21 21:13:49', null, 'Windows 7', 'Firefox 4', '111.0.231.202', null, null, null, null);
INSERT INTO `log` VALUES ('2652', null, '2016-03-21 22:33:36', null, 'Windows 7', 'Chrome', '114.249.236.52', null, null, null, null);
INSERT INTO `log` VALUES ('2653', null, '2016-03-21 22:42:24', null, 'Android', 'Mobile Safari', '118.186.207.218', null, null, null, null);
INSERT INTO `log` VALUES ('2654', null, '2016-03-22 08:35:40', null, 'Windows 7', 'Chrome', '222.217.234.7', null, null, null, null);
INSERT INTO `log` VALUES ('2655', null, '2016-03-22 09:17:46', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2656', null, '2016-03-22 09:17:49', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2657', null, '2016-03-22 09:17:49', null, 'Windows', 'Chrome', '61.130.8.3', null, null, null, null);
INSERT INTO `log` VALUES ('2658', null, '2016-03-22 09:18:45', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2659', null, '2016-03-22 09:23:37', null, 'Windows 7', 'Chrome', '1.202.237.242', null, null, null, null);
INSERT INTO `log` VALUES ('2660', null, '2016-03-22 09:23:38', null, 'Windows 7', 'Firefox 4', '60.208.139.35', null, null, null, null);
INSERT INTO `log` VALUES ('2661', null, '2016-03-22 09:23:41', null, 'Windows 7', 'Chrome', '219.142.62.106', null, null, null, null);
INSERT INTO `log` VALUES ('2662', null, '2016-03-22 09:24:18', null, 'Windows 7', 'Chrome', '58.56.27.43', null, null, null, null);
INSERT INTO `log` VALUES ('2663', null, '2016-03-22 09:24:39', null, 'Windows 7', 'Internet Explorer 8', '202.109.191.130', null, null, null, null);
INSERT INTO `log` VALUES ('2664', null, '2016-03-22 09:25:10', null, 'Windows 7', 'Chrome', '202.109.191.130', null, null, null, null);
INSERT INTO `log` VALUES ('2665', null, '2016-03-22 09:25:40', null, 'Windows 7', 'Chrome', '120.32.126.98', null, null, null, null);
INSERT INTO `log` VALUES ('2666', null, '2016-03-22 09:25:44', null, 'Windows 7', 'Chrome', '124.128.62.162', null, null, null, null);
INSERT INTO `log` VALUES ('2667', null, '2016-03-22 09:26:08', null, 'Windows 7', 'Chrome', '123.232.99.10', null, null, null, null);
INSERT INTO `log` VALUES ('2668', null, '2016-03-22 09:26:43', null, 'Windows 7', 'Chrome', '106.2.216.74', null, null, null, null);
INSERT INTO `log` VALUES ('2669', null, '2016-03-22 09:27:38', null, 'Windows 7', 'Firefox 4', '219.147.28.186', null, null, null, null);
INSERT INTO `log` VALUES ('2670', null, '2016-03-22 09:27:57', null, 'Windows 7', 'Firefox 4', '182.96.106.234', null, null, null, null);
INSERT INTO `log` VALUES ('2671', null, '2016-03-22 09:28:02', null, 'Windows 7', 'Chrome', '58.56.27.43', null, null, null, null);
INSERT INTO `log` VALUES ('2672', null, '2016-03-22 09:29:48', null, 'Windows 7', 'Chrome', '219.141.246.101', null, null, null, null);
INSERT INTO `log` VALUES ('2673', null, '2016-03-22 09:32:22', null, 'Windows 7', 'Chrome', '219.141.246.101', null, null, null, null);
INSERT INTO `log` VALUES ('2674', null, '2016-03-22 09:32:38', null, 'Windows 7', 'Chrome', '124.128.57.126', null, null, null, null);
INSERT INTO `log` VALUES ('2675', null, '2016-03-22 09:33:53', null, 'Windows 7', 'Chrome', '124.128.85.130', null, null, null, null);
INSERT INTO `log` VALUES ('2676', null, '2016-03-22 09:34:24', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2677', null, '2016-03-22 09:37:53', null, 'Windows 7', 'Chrome', '180.169.84.156', null, null, null, null);
INSERT INTO `log` VALUES ('2678', null, '2016-03-22 09:38:06', null, 'Windows 7', 'Firefox 4', '60.190.230.35', null, null, null, null);
INSERT INTO `log` VALUES ('2679', null, '2016-03-22 09:39:04', null, 'Windows', 'Chrome', '58.211.125.50', null, null, null, null);
INSERT INTO `log` VALUES ('2680', null, '2016-03-22 09:40:10', null, 'Windows', 'Chrome', '58.211.125.50', null, null, null, null);
INSERT INTO `log` VALUES ('2681', null, '2016-03-22 09:40:12', null, 'Windows 7', 'Chrome', '27.211.179.120', null, null, null, null);
INSERT INTO `log` VALUES ('2682', null, '2016-03-22 09:40:21', null, 'Android 4.x', 'Mobile Safari', '58.17.121.222', null, null, null, null);
INSERT INTO `log` VALUES ('2683', null, '2016-03-22 09:41:54', null, 'Windows', 'Firefox 4', '124.128.97.146', null, null, null, null);
INSERT INTO `log` VALUES ('2684', null, '2016-03-22 09:45:08', null, 'Windows Vista', 'Chrome', '223.99.3.82', null, null, null, null);
INSERT INTO `log` VALUES ('2685', null, '2016-03-22 09:47:16', null, 'Windows 7', 'Chrome', '222.173.11.110', null, null, null, null);
INSERT INTO `log` VALUES ('2686', null, '2016-03-22 09:48:21', null, 'Windows', 'Chrome', '123.232.100.5', null, null, null, null);
INSERT INTO `log` VALUES ('2687', null, '2016-03-22 09:48:51', null, 'Windows 7', 'Chrome', '124.126.204.157', null, null, null, null);
INSERT INTO `log` VALUES ('2688', null, '2016-03-22 09:54:04', null, 'Windows 7', 'Chrome', '60.216.102.85', null, null, null, null);
INSERT INTO `log` VALUES ('2689', null, '2016-03-22 09:56:04', null, 'Android 4.x', 'Mobile Safari', '112.224.19.180', null, null, null, null);
INSERT INTO `log` VALUES ('2690', null, '2016-03-22 09:57:09', null, 'Android 4.x', 'Mobile Safari', '112.224.19.180', null, null, null, null);
INSERT INTO `log` VALUES ('2691', null, '2016-03-22 09:59:08', null, 'Windows 7', 'Chrome 21', '116.25.19.217', null, null, null, null);
INSERT INTO `log` VALUES ('2692', null, '2016-03-22 10:03:35', null, 'Windows 7', 'Chrome', '116.7.245.182', null, null, null, null);
INSERT INTO `log` VALUES ('2693', null, '2016-03-22 10:04:03', null, 'Windows 7', 'Chrome', '121.79.128.98', null, null, null, null);
INSERT INTO `log` VALUES ('2694', null, '2016-03-22 10:04:30', null, 'Windows 7', 'Chrome', '183.13.240.74', null, null, null, null);
INSERT INTO `log` VALUES ('2695', null, '2016-03-22 10:09:27', null, 'Windows 7', 'Chrome', '106.2.165.186', null, null, null, null);
INSERT INTO `log` VALUES ('2696', null, '2016-03-22 10:13:07', null, 'Windows 7', 'Chrome', '14.18.253.11', null, null, null, null);
INSERT INTO `log` VALUES ('2697', null, '2016-03-22 10:14:52', null, 'Windows 7', 'Firefox 4', '61.51.95.10', null, null, null, null);
INSERT INTO `log` VALUES ('2698', null, '2016-03-22 10:17:27', null, 'Windows 7', 'Firefox 4', '61.51.95.10', null, null, null, null);
INSERT INTO `log` VALUES ('2699', null, '2016-03-22 10:28:32', null, 'Windows 7', 'Chrome', '114.255.139.110', null, null, null, null);
INSERT INTO `log` VALUES ('2700', null, '2016-03-22 11:04:05', null, 'Windows 7', 'Chrome', '125.42.140.220', null, null, null, null);
INSERT INTO `log` VALUES ('2701', null, '2016-03-22 11:07:54', null, 'Windows 7', 'Chrome', '125.42.140.220', null, null, null, null);
INSERT INTO `log` VALUES ('2702', null, '2016-03-22 11:10:01', null, 'Windows 7', 'Chrome', '125.42.140.220', null, null, null, null);
INSERT INTO `log` VALUES ('2703', null, '2016-03-22 11:10:20', null, 'Windows 7', 'Chrome', '125.42.140.220', null, null, null, null);
INSERT INTO `log` VALUES ('2704', null, '2016-03-22 11:47:43', null, 'Android 4.x', 'Mobile Safari', '113.142.148.152', null, null, null, null);
INSERT INTO `log` VALUES ('2705', null, '2016-03-22 11:57:46', null, 'Windows Vista', 'Chrome', '218.98.37.113', null, null, null, null);
INSERT INTO `log` VALUES ('2706', null, '2016-03-22 12:05:20', null, 'Windows 7', 'Chrome', '114.245.38.57', null, null, null, null);
INSERT INTO `log` VALUES ('2707', null, '2016-03-22 13:19:40', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2708', null, '2016-03-22 13:20:25', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2709', null, '2016-03-22 13:36:51', null, 'Windows', 'Firefox 4', '58.48.10.130', null, null, null, null);
INSERT INTO `log` VALUES ('2710', null, '2016-03-22 14:39:12', null, 'Windows 7', 'Chrome', '180.169.84.156', null, null, null, null);
INSERT INTO `log` VALUES ('2711', null, '2016-03-22 16:56:53', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2712', null, '2016-03-26 17:31:58', null, 'Windows', 'Chrome', '106.37.28.143', null, null, null, null);
INSERT INTO `log` VALUES ('2713', null, '2016-03-26 17:32:48', null, 'Windows', 'Chrome', '106.37.28.143', null, null, null, null);
INSERT INTO `log` VALUES ('2714', null, '2016-03-26 17:33:25', null, 'Windows', 'Chrome', '106.37.28.143', null, null, null, null);
INSERT INTO `log` VALUES ('2715', null, '2016-03-26 17:34:22', null, 'Windows', 'Chrome', '106.37.28.143', null, null, null, null);
INSERT INTO `log` VALUES ('2716', null, '2016-03-26 17:36:03', null, 'Windows', 'Firefox 4', '222.204.1.6', null, null, null, null);
INSERT INTO `log` VALUES ('2717', null, '2016-03-26 17:45:55', null, 'Windows', 'Chrome', '182.48.104.23', null, null, null, null);
INSERT INTO `log` VALUES ('2718', null, '2016-03-26 18:32:40', null, 'Windows 7', 'Chrome', '119.118.143.152', null, null, null, null);
INSERT INTO `log` VALUES ('2719', null, '2016-03-26 18:35:07', null, 'Mac OS X (iPhone)', 'Apple WebKit', '119.80.101.42', null, null, null, null);
INSERT INTO `log` VALUES ('2720', null, '2016-03-26 19:56:35', null, 'Windows', 'Chrome', '106.37.28.141', null, null, null, null);
INSERT INTO `log` VALUES ('2721', null, '2016-03-26 20:22:24', null, 'Mac OS X (iPhone)', 'Apple WebKit', '112.123.240.114', null, null, null, null);
INSERT INTO `log` VALUES ('2722', null, '2016-03-26 20:31:13', null, 'Windows', 'Chrome', '113.87.0.49', null, null, null, null);
INSERT INTO `log` VALUES ('2723', null, '2016-03-26 20:31:52', null, 'Windows', 'Chrome', '113.87.0.49', null, null, null, null);
INSERT INTO `log` VALUES ('2724', null, '2016-03-26 20:32:05', null, 'Windows 7', 'Chrome', '180.137.19.142', null, null, null, null);
INSERT INTO `log` VALUES ('2725', null, '2016-03-26 20:33:40', null, 'Windows 7', 'Chrome', '183.14.8.98', null, null, null, null);
INSERT INTO `log` VALUES ('2726', null, '2016-03-26 20:39:25', null, 'Windows 7', 'Chrome', '183.14.8.98', null, null, null, null);
INSERT INTO `log` VALUES ('2727', null, '2016-03-26 21:01:05', null, 'Windows 7', 'Chrome', '183.14.8.98', null, null, null, null);
INSERT INTO `log` VALUES ('2728', null, '2016-03-26 21:01:14', null, 'Windows 7', 'Chrome', '183.14.8.98', null, null, null, null);
INSERT INTO `log` VALUES ('2729', null, '2016-03-26 23:57:07', null, 'Windows 7', 'Chrome', '116.216.30.59', null, null, null, null);
INSERT INTO `log` VALUES ('2730', null, '2016-03-27 00:36:31', null, 'Windows 7', 'Chrome', '116.216.30.59', null, null, null, null);
INSERT INTO `log` VALUES ('2731', null, '2016-03-27 00:38:45', null, 'Windows 7', 'Chrome', '116.216.30.59', null, null, null, null);
INSERT INTO `log` VALUES ('2732', null, '2016-03-27 00:38:56', null, 'Windows 7', 'Chrome', '116.216.30.59', null, null, null, null);
INSERT INTO `log` VALUES ('2733', null, '2016-03-27 00:39:28', null, 'Windows 7', 'Chrome', '116.216.30.59', null, null, null, null);
INSERT INTO `log` VALUES ('2734', null, '2016-03-27 00:41:08', null, 'Windows 7', 'Chrome', '116.216.30.59', null, null, null, null);
INSERT INTO `log` VALUES ('2735', null, '2016-03-27 00:41:29', null, 'Windows 7', 'Chrome', '116.216.30.59', null, null, null, null);
INSERT INTO `log` VALUES ('2736', null, '2016-03-27 02:53:48', null, 'Windows 7', 'Chrome', '140.224.78.233', null, null, null, null);
INSERT INTO `log` VALUES ('2737', null, '2016-03-27 16:15:03', null, 'Android', 'Mobile Safari', '116.216.30.59', null, null, null, null);
INSERT INTO `log` VALUES ('2738', null, '2016-03-27 16:16:05', null, 'Android', 'Mobile Safari', '116.216.30.59', null, null, null, null);
INSERT INTO `log` VALUES ('2739', null, '2016-03-27 20:22:24', null, 'Mac OS X (iPhone)', 'Apple WebKit', '222.69.128.60', null, null, null, null);
INSERT INTO `log` VALUES ('2740', null, '2016-03-27 21:55:17', null, 'Android 4.x', 'Mobile Safari', '175.153.40.101', null, null, null, null);
INSERT INTO `log` VALUES ('2741', null, '2016-03-28 08:35:48', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2742', null, '2016-03-28 10:47:57', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2743', null, '2016-03-28 11:08:43', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2744', null, '2016-03-28 11:09:31', null, 'Mac OS X (iPhone)', 'Apple WebKit', '223.104.18.214', null, null, null, null);
INSERT INTO `log` VALUES ('2745', null, '2016-03-28 11:10:51', null, 'Windows 7', 'Chrome', '49.77.225.58', null, null, null, null);
INSERT INTO `log` VALUES ('2746', null, '2016-03-28 11:12:08', null, 'Windows 7', 'Chrome', '101.81.109.92', null, null, null, null);
INSERT INTO `log` VALUES ('2747', null, '2016-03-28 11:12:37', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2748', null, '2016-03-28 11:20:40', null, 'Windows 7', 'Chrome', '119.122.81.171', null, null, null, null);
INSERT INTO `log` VALUES ('2749', null, '2016-03-28 11:23:59', null, 'Windows 7', 'Chrome', '119.122.81.171', null, null, null, null);
INSERT INTO `log` VALUES ('2750', null, '2016-03-28 11:25:45', null, 'Windows', 'Chrome', '58.17.121.222', null, null, null, null);
INSERT INTO `log` VALUES ('2751', null, '2016-03-28 11:27:57', null, 'Windows 7', 'Chrome', '182.139.173.142', null, null, null, null);
INSERT INTO `log` VALUES ('2752', null, '2016-03-28 13:12:47', null, 'Windows 7', 'Chrome', '222.35.39.203', null, null, null, null);
INSERT INTO `log` VALUES ('2753', null, '2016-03-28 13:27:49', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('3025', null, '2016-04-25 14:49:12', null, 'Windows 7', 'Internet Explorer 9', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3026', null, '2016-04-25 14:51:25', null, 'Android', 'Chrome', '36.23.17.227', null, null, null, null);
INSERT INTO `log` VALUES ('3027', null, '2016-04-25 14:52:50', null, 'Windows 7', 'Chrome', '122.4.237.235', null, null, null, null);
INSERT INTO `log` VALUES ('3028', null, '2016-04-25 14:52:53', null, 'Windows 7', 'Firefox 4', '60.208.139.35', null, null, null, null);
INSERT INTO `log` VALUES ('3029', null, '2016-04-25 14:52:58', null, 'Windows', 'Chrome', '218.20.227.30', null, null, null, null);
INSERT INTO `log` VALUES ('3030', null, '2016-04-25 14:53:34', null, 'Windows 7', 'Chrome', '27.214.2.67', null, null, null, null);
INSERT INTO `log` VALUES ('3031', null, '2016-04-25 14:56:10', null, 'Windows', 'Chrome', '124.128.89.154', null, null, null, null);
INSERT INTO `log` VALUES ('3032', null, '2016-04-25 14:56:53', null, 'Windows 7', 'Chrome', '122.4.237.235', null, null, null, null);
INSERT INTO `log` VALUES ('3033', null, '2016-04-25 15:01:11', null, 'Windows 7', 'Internet Explorer 9', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3034', null, '2016-04-25 15:01:48', null, 'Windows 7', 'Chrome', '121.34.130.196', null, null, null, null);
INSERT INTO `log` VALUES ('3035', null, '2016-04-25 15:03:35', null, 'Windows 7', 'Internet Explorer 8', '222.87.163.12', null, null, null, null);
INSERT INTO `log` VALUES ('3036', null, '2016-04-25 15:03:46', null, 'Windows 7', 'Chrome', '171.221.199.77', null, null, null, null);
INSERT INTO `log` VALUES ('3037', null, '2016-04-25 15:04:04', null, 'Windows', 'Chrome', '183.15.253.42', null, null, null, null);
INSERT INTO `log` VALUES ('3038', null, '2016-04-25 15:04:07', null, 'Windows 7', 'Firefox 4', '222.87.163.12', null, null, null, null);
INSERT INTO `log` VALUES ('3039', null, '2016-04-25 15:04:54', null, 'Windows 7', 'Firefox 4', '222.87.163.12', null, null, null, null);
INSERT INTO `log` VALUES ('3040', null, '2016-04-25 15:06:20', null, 'Windows Vista', 'Chrome', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('3041', null, '2016-04-25 15:06:42', null, 'Windows 7', 'Firefox 4', '222.87.163.12', null, null, null, null);
INSERT INTO `log` VALUES ('3042', null, '2016-04-25 15:07:00', null, 'Windows 7', 'Firefox 4', '222.87.163.12', null, null, null, null);
INSERT INTO `log` VALUES ('3043', null, '2016-04-25 15:07:04', null, 'Windows', 'Firefox 4', '111.206.199.181', null, null, null, null);
INSERT INTO `log` VALUES ('3044', null, '2016-04-25 15:07:26', null, 'Windows 7', 'Firefox 4', '222.87.163.12', null, null, null, null);
INSERT INTO `log` VALUES ('3045', null, '2016-04-25 15:07:51', null, 'Windows 7', 'Chrome', '123.185.161.214', null, null, null, null);
INSERT INTO `log` VALUES ('3046', null, '2016-04-25 15:19:45', null, 'Windows XP', 'Chrome', '111.206.199.177', null, null, null, null);
INSERT INTO `log` VALUES ('3047', null, '2016-04-25 15:21:48', null, 'Windows 7', 'Chrome', '39.88.93.94', null, null, null, null);
INSERT INTO `log` VALUES ('3048', null, '2016-04-25 15:24:07', null, 'Windows XP', 'Chrome', '111.206.199.177', null, null, null, null);
INSERT INTO `log` VALUES ('3049', null, '2016-04-25 16:01:59', null, 'Windows 7', 'Chrome', '219.137.119.19', null, null, null, null);
INSERT INTO `log` VALUES ('3050', null, '2016-04-25 16:06:28', null, 'Windows 7', 'Chrome', '124.207.188.68', null, null, null, null);
INSERT INTO `log` VALUES ('3051', null, '2016-04-25 16:09:50', null, 'Windows 7', 'Chrome', '221.203.21.194', null, null, null, null);
INSERT INTO `log` VALUES ('3052', null, '2016-04-25 17:14:15', null, 'Windows 7', 'Chrome', '183.156.125.221', null, null, null, null);
INSERT INTO `log` VALUES ('3053', null, '2016-04-25 17:18:50', null, 'Windows Vista', 'Chrome', '111.175.5.43', null, null, null, null);
INSERT INTO `log` VALUES ('3054', null, '2016-04-25 17:20:49', null, 'Windows Vista', 'Chrome', '111.175.5.43', null, null, null, null);
INSERT INTO `log` VALUES ('3055', null, '2016-04-25 17:35:06', null, 'Windows 8', 'Firefox 4', '221.218.66.170', null, null, null, null);
INSERT INTO `log` VALUES ('3056', null, '2016-04-25 17:48:34', null, 'Windows 7', 'Internet Explorer 9', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3057', null, '2016-04-25 21:52:21', null, 'Windows 7', 'Chrome', '27.151.106.218', null, null, null, null);
INSERT INTO `log` VALUES ('3058', null, '2016-04-26 08:38:35', null, 'Windows 7', 'Chrome', '120.198.30.206', null, null, null, null);
INSERT INTO `log` VALUES ('3059', null, '2016-04-26 09:11:23', null, 'Windows 7', 'Chrome', '60.247.20.85', null, null, null, null);
INSERT INTO `log` VALUES ('3060', null, '2016-04-26 09:23:39', null, 'Windows 7', 'Chrome', '60.247.20.85', null, null, null, null);
INSERT INTO `log` VALUES ('3061', null, '2016-04-26 09:32:01', null, 'Windows 7', 'Mozilla', '123.149.113.113', null, null, null, null);
INSERT INTO `log` VALUES ('3062', null, '2016-04-26 09:33:18', null, 'Windows 7', 'Mozilla', '123.149.113.113', null, null, null, null);
INSERT INTO `log` VALUES ('3063', null, '2016-04-26 10:58:50', null, 'Windows 7', 'Chrome', '60.247.20.85', null, null, null, null);
INSERT INTO `log` VALUES ('3064', null, '2016-04-26 10:59:36', null, 'Windows 7', 'Chrome', '60.247.20.85', null, null, null, null);
INSERT INTO `log` VALUES ('3065', null, '2016-04-26 11:02:27', null, 'Windows 7', 'Chrome', '60.247.20.85', null, null, null, null);
INSERT INTO `log` VALUES ('3066', null, '2016-04-26 11:33:08', null, 'Mac OS X (iPhone)', 'Apple WebKit', '112.123.240.114', null, null, null, null);
INSERT INTO `log` VALUES ('3067', null, '2016-04-26 11:34:19', null, 'Windows 7', 'Chrome', '171.213.60.25', null, null, null, null);
INSERT INTO `log` VALUES ('3068', null, '2016-04-26 11:34:46', null, 'Windows 7', 'Firefox 4', '36.110.25.115', null, null, null, null);
INSERT INTO `log` VALUES ('3069', null, '2016-04-26 11:37:26', null, 'Mac OS X (iPhone)', 'Apple WebKit', '223.104.19.66', null, null, null, null);
INSERT INTO `log` VALUES ('3070', null, '2016-04-26 11:54:45', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3071', null, '2016-04-26 11:55:13', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3072', null, '2016-04-26 13:12:01', null, 'Windows 7', 'Internet Explorer 9', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3073', null, '2016-04-26 13:26:03', null, 'Windows 7', 'Chrome', '60.247.20.85', null, null, null, null);
INSERT INTO `log` VALUES ('3074', null, '2016-04-26 14:09:27', null, 'Windows 7', 'Internet Explorer 8', '14.20.18.119', null, null, null, null);
INSERT INTO `log` VALUES ('3075', null, '2016-04-26 14:48:44', null, 'Android 4.x', 'Mobile Safari', '61.158.148.66', null, null, null, null);
INSERT INTO `log` VALUES ('3076', null, '2016-04-26 16:46:47', null, 'Windows 7', 'Internet Explorer 9', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3077', null, '2016-04-26 16:51:19', null, 'Windows', 'Chrome', '116.213.120.9', null, null, null, null);
INSERT INTO `log` VALUES ('3078', null, '2016-04-26 16:51:41', null, 'Windows 7', 'Chrome', '60.190.244.158', null, null, null, null);
INSERT INTO `log` VALUES ('3079', null, '2016-04-26 16:51:58', null, 'Windows', 'Chrome', '14.121.179.213', null, null, null, null);
INSERT INTO `log` VALUES ('3080', null, '2016-04-26 16:52:59', null, 'Windows Vista', 'Chrome', '124.207.115.50', null, null, null, null);
INSERT INTO `log` VALUES ('3081', null, '2016-04-26 16:53:05', null, 'Windows 7', 'Chrome', '101.95.128.138', null, null, null, null);
INSERT INTO `log` VALUES ('3082', null, '2016-04-26 16:55:13', null, 'Windows 7', 'Chrome', '101.95.128.138', null, null, null, null);
INSERT INTO `log` VALUES ('3083', null, '2016-04-26 16:58:24', null, 'Windows', 'Chrome', '14.121.179.213', null, null, null, null);
INSERT INTO `log` VALUES ('3084', null, '2016-04-26 17:03:37', null, 'Windows 7', 'Chrome 21', '211.162.34.20', null, null, null, null);
INSERT INTO `log` VALUES ('3085', null, '2016-04-26 17:06:54', null, 'Windows 7', 'Chrome 21', '211.162.34.20', null, null, null, null);
INSERT INTO `log` VALUES ('3086', null, '2016-04-26 17:11:17', null, 'Windows 7', 'Chrome', '113.98.246.232', null, null, null, null);
INSERT INTO `log` VALUES ('3087', null, '2016-04-26 17:17:11', null, 'Windows', 'Chrome', '49.80.219.61', null, null, null, null);
INSERT INTO `log` VALUES ('3088', null, '2016-04-26 18:20:42', null, 'Windows Vista', 'Chrome', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('3089', null, '2016-04-26 20:32:30', null, 'Windows', 'Chrome', '117.114.129.162', null, null, null, null);
INSERT INTO `log` VALUES ('3090', null, '2016-04-26 20:34:35', null, 'Windows', 'Chrome', '112.87.201.106', null, null, null, null);
INSERT INTO `log` VALUES ('3091', null, '2016-04-27 10:11:18', null, 'Windows 7', 'Chrome', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3092', null, '2016-04-27 10:35:34', null, 'Windows 7', 'Chrome', '183.156.125.221', null, null, null, null);
INSERT INTO `log` VALUES ('3093', null, '2016-04-27 10:37:37', null, 'Windows 7', 'Chrome', '58.220.197.194', null, null, null, null);
INSERT INTO `log` VALUES ('3094', null, '2016-04-27 10:46:39', null, 'Windows Vista', 'Mozilla', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('3095', null, '2016-04-27 11:21:57', null, 'Windows Vista', 'Chrome', '183.228.49.60', null, null, null, null);
INSERT INTO `log` VALUES ('3096', null, '2016-04-27 12:21:25', null, 'Windows 7', 'Internet Explorer 9', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3097', null, '2016-04-27 13:57:32', null, 'Windows', 'Chrome', '140.207.36.234', null, null, null, null);
INSERT INTO `log` VALUES ('3098', null, '2016-04-27 14:10:25', null, 'Windows 7', 'Mozilla', '123.149.115.24', null, null, null, null);
INSERT INTO `log` VALUES ('3099', null, '2016-04-27 15:02:46', null, 'Windows Vista', 'Chrome', '123.125.146.143', null, null, null, null);
INSERT INTO `log` VALUES ('3100', null, '2016-04-27 15:21:14', null, 'Windows 7', 'Chrome', '218.26.200.19', null, null, null, null);
INSERT INTO `log` VALUES ('3101', null, '2016-04-27 15:28:22', null, 'Windows Vista', 'Chrome', '124.65.164.98', null, null, null, null);
INSERT INTO `log` VALUES ('3102', null, '2016-04-28 09:54:11', null, 'Windows 7', 'Chrome', '219.141.211.94', null, null, null, null);
INSERT INTO `log` VALUES ('3103', null, '2016-04-28 11:18:27', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3104', null, '2016-04-29 10:02:37', null, 'Windows 7', 'Chrome', '113.97.242.119', null, null, null, null);
INSERT INTO `log` VALUES ('3105', null, '2016-04-29 16:43:10', null, 'Windows 7', 'Chrome', '112.123.240.114', null, null, null, null);
INSERT INTO `log` VALUES ('3106', null, '2016-04-29 16:47:28', null, 'Windows 7', 'Chrome', '112.123.240.114', null, null, null, null);
INSERT INTO `log` VALUES ('3107', null, '2016-04-29 17:00:56', null, 'Windows 7', 'Chrome', '112.123.240.114', null, null, null, null);
INSERT INTO `log` VALUES ('3108', null, '2016-04-30 08:32:51', null, 'Windows Vista', 'Chrome', '183.37.220.82', null, null, null, null);
INSERT INTO `log` VALUES ('3109', null, '2016-05-03 10:57:00', null, 'Windows 7', 'Chrome', '125.71.215.243', null, null, null, null);
INSERT INTO `log` VALUES ('3110', null, '2016-05-03 14:15:58', null, 'Windows 7', 'Chrome', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3112', null, '2016-05-03 16:15:33', null, 'Windows 7', 'Chrome', '182.39.114.86', null, null, null, null);
INSERT INTO `log` VALUES ('3113', null, '2016-05-03 16:15:52', null, 'Windows 7', 'Chrome', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3114', null, '2016-05-03 16:20:50', null, 'Windows Vista', 'Mozilla', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('3115', null, '2016-05-03 16:21:32', null, 'Windows 7', 'Chrome', '211.95.59.199', null, null, null, null);
INSERT INTO `log` VALUES ('3116', null, '2016-05-03 16:38:42', null, 'Windows', 'Firefox 4', '59.44.70.193', null, null, null, null);
INSERT INTO `log` VALUES ('3117', null, '2016-05-03 18:02:36', null, 'Windows 7', 'Chrome', '124.163.206.72', null, null, null, null);
INSERT INTO `log` VALUES ('3118', null, '2016-05-03 18:04:34', null, 'Windows 7', 'Chrome', '116.231.233.237', null, null, null, null);
INSERT INTO `log` VALUES ('3119', null, '2016-05-03 18:06:41', null, 'Android', 'Chrome', '117.136.75.133', null, null, null, null);
INSERT INTO `log` VALUES ('3120', null, '2016-05-03 18:16:28', null, 'Windows', 'Chrome', '218.28.21.174', null, null, null, null);
INSERT INTO `log` VALUES ('3121', null, '2016-05-03 18:17:53', null, 'Windows 7', 'Internet Explorer 8', '218.19.21.195', null, null, null, null);
INSERT INTO `log` VALUES ('3122', null, '2016-05-03 18:18:25', null, 'Windows 7', 'Chrome', '113.99.30.248', null, null, null, null);
INSERT INTO `log` VALUES ('3123', null, '2016-05-03 18:18:46', null, 'Windows 7', 'Chrome', '218.19.21.195', null, null, null, null);
INSERT INTO `log` VALUES ('3124', null, '2016-05-03 18:20:45', null, 'Android', 'Chrome', '42.234.171.164', null, null, null, null);
INSERT INTO `log` VALUES ('3125', null, '2016-05-03 18:22:15', null, 'Windows XP', 'Chrome', '60.28.191.133', null, null, null, null);
INSERT INTO `log` VALUES ('3126', null, '2016-05-03 18:25:57', null, 'Windows 7', 'Chrome', '124.163.206.10', null, null, null, null);
INSERT INTO `log` VALUES ('3127', null, '2016-05-03 18:29:56', null, 'Windows 7', 'Chrome', '124.67.20.161', null, null, null, null);
INSERT INTO `log` VALUES ('3128', null, '2016-05-03 18:32:55', null, 'Windows 7', 'Chrome', '124.67.20.161', null, null, null, null);
INSERT INTO `log` VALUES ('3129', null, '2016-05-03 18:38:56', null, 'Android', 'Chrome', '111.206.95.98', null, null, null, null);
INSERT INTO `log` VALUES ('3130', null, '2016-05-03 19:56:12', null, 'Android', 'Chrome', '123.117.81.103', null, null, null, null);
INSERT INTO `log` VALUES ('3131', null, '2016-05-03 20:09:09', null, 'Windows 7', 'Chrome', '14.18.29.137', null, null, null, null);
INSERT INTO `log` VALUES ('3132', null, '2016-05-03 20:09:59', null, 'Windows 7', 'Chrome', '14.18.29.137', null, null, null, null);
INSERT INTO `log` VALUES ('3133', null, '2016-05-03 20:30:56', null, 'Windows 7', 'Internet Explorer 7', '27.38.9.55', null, null, null, null);
INSERT INTO `log` VALUES ('3134', null, '2016-05-04 09:08:46', null, 'Windows 7', 'Chrome', '112.123.240.114', null, null, null, null);
INSERT INTO `log` VALUES ('3135', null, '2016-05-04 09:19:07', null, 'Windows 7', 'Chrome', '112.123.240.114', null, null, null, null);
INSERT INTO `log` VALUES ('3136', null, '2016-05-04 14:58:38', null, 'Windows 7', 'Chrome', '116.228.206.84', null, null, null, null);
INSERT INTO `log` VALUES ('3137', null, '2016-05-04 14:58:40', null, 'Windows 7', 'Chrome', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3138', null, '2016-05-04 14:59:20', null, 'Windows', 'Chrome', '116.231.35.163', null, null, null, null);
INSERT INTO `log` VALUES ('3139', null, '2016-05-04 14:59:52', null, 'Windows 7', 'Chrome', '182.200.40.72', null, null, null, null);
INSERT INTO `log` VALUES ('3140', null, '2016-05-04 15:00:43', null, 'Mac OS X (iPhone)', 'Apple WebKit', '117.136.41.86', null, null, null, null);
INSERT INTO `log` VALUES ('3141', null, '2016-05-04 15:02:29', null, 'Windows', 'Chrome', '113.135.125.182', null, null, null, null);
INSERT INTO `log` VALUES ('3142', null, '2016-05-04 15:04:21', null, 'Windows', 'Chrome', '49.80.223.63', null, null, null, null);
INSERT INTO `log` VALUES ('3143', null, '2016-05-04 15:06:36', null, 'Windows 7', 'Chrome', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3144', null, '2016-05-04 15:08:52', null, 'Windows 7', 'Internet Explorer 9', '192.168.0.18', null, null, null, null);
INSERT INTO `log` VALUES ('3145', null, '2016-05-04 15:09:51', null, 'Windows', 'Chrome', '125.65.73.1', null, null, null, null);
INSERT INTO `log` VALUES ('3146', null, '2016-05-04 15:10:24', null, 'Windows', 'Chrome', '125.65.73.1', null, null, null, null);
INSERT INTO `log` VALUES ('3147', null, '2016-05-04 15:10:37', null, 'Windows 7', 'Internet Explorer 8', '183.62.131.90', null, null, null, null);
INSERT INTO `log` VALUES ('3148', null, '2016-05-04 15:11:01', null, 'Windows 7', 'Firefox 4', '112.53.82.59', null, null, null, null);
INSERT INTO `log` VALUES ('3149', null, '2016-05-04 15:11:07', null, 'Windows 7', 'Firefox 4', '111.202.71.182', null, null, null, null);
INSERT INTO `log` VALUES ('3150', null, '2016-05-04 15:11:19', null, 'Windows', 'Chrome', '123.232.43.162', null, null, null, null);
INSERT INTO `log` VALUES ('3151', null, '2016-05-04 15:11:26', null, 'Windows 7', 'Chrome', '122.4.237.235', null, null, null, null);
INSERT INTO `log` VALUES ('3152', null, '2016-05-04 15:11:28', null, 'Windows 7', 'Chrome', '59.46.46.164', null, null, null, null);
INSERT INTO `log` VALUES ('3153', null, '2016-05-04 15:11:47', null, 'Windows 7', 'Firefox 4', '111.202.71.182', null, null, null, null);
INSERT INTO `log` VALUES ('3154', null, '2016-05-04 15:11:53', null, 'Windows 7', 'Firefox 4', '120.35.34.101', null, null, null, null);
INSERT INTO `log` VALUES ('3155', null, '2016-05-04 15:11:56', null, 'Windows 7', 'Chrome', '218.201.111.114', null, null, null, null);
INSERT INTO `log` VALUES ('3156', null, '2016-05-04 15:12:35', null, 'Windows 7', 'Chrome', '218.1.18.114', null, null, null, null);
INSERT INTO `log` VALUES ('3157', null, '2016-05-04 15:13:12', null, 'Windows 7', 'Chrome', '219.133.73.177', null, null, null, null);
INSERT INTO `log` VALUES ('3158', null, '2016-05-04 15:13:41', null, 'Windows 7', 'Chrome', '218.201.111.114', null, null, null, null);
INSERT INTO `log` VALUES ('3159', null, '2016-05-04 15:15:20', null, 'Windows XP', 'Chrome', '124.133.229.106', null, null, null, null);
INSERT INTO `log` VALUES ('3160', null, '2016-05-04 15:16:14', null, 'Windows 7', 'Chrome', '120.198.30.135', null, null, null, null);
INSERT INTO `log` VALUES ('3161', null, '2016-05-04 15:16:38', null, 'Mac OS X (iPhone)', 'Apple WebKit', '113.5.2.1', null, null, null, null);
INSERT INTO `log` VALUES ('3162', null, '2016-05-04 15:16:56', null, 'Windows', 'Chrome', '123.232.43.162', null, null, null, null);
INSERT INTO `log` VALUES ('3163', null, '2016-05-04 15:16:56', null, 'Windows', 'Chrome', '123.232.43.162', null, null, null, null);
INSERT INTO `log` VALUES ('3164', null, '2016-05-04 15:18:39', null, 'Mac OS X (iPhone)', 'Apple WebKit', '113.5.2.1', null, null, null, null);
INSERT INTO `log` VALUES ('3165', null, '2016-05-04 15:19:19', null, 'Windows XP', 'Chrome', '124.133.229.106', null, null, null, null);
INSERT INTO `log` VALUES ('3166', null, '2016-05-04 15:21:24', null, 'Windows Vista', 'Chrome', '180.173.139.100', null, null, null, null);
INSERT INTO `log` VALUES ('3167', null, '2016-05-04 15:22:32', null, 'Windows 7', 'Mozilla', '222.128.35.224', null, null, null, null);
INSERT INTO `log` VALUES ('3168', null, '2016-05-04 15:25:00', null, 'Windows 7', 'Chrome', '222.85.139.101', null, null, null, null);
INSERT INTO `log` VALUES ('3169', null, '2016-05-04 15:25:41', null, 'Windows 7', 'Firefox 4', '124.126.17.42', null, null, null, null);
INSERT INTO `log` VALUES ('3170', null, '2016-05-04 15:26:13', null, 'Windows 7', 'Chrome', '222.46.28.206', null, null, null, null);
INSERT INTO `log` VALUES ('3171', null, '2016-05-04 15:26:33', null, 'Windows 7', 'Chrome', '222.46.28.206', null, null, null, null);
INSERT INTO `log` VALUES ('3172', null, '2016-05-04 15:27:19', null, 'Windows Vista', 'Chrome', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('3173', null, '2016-05-04 15:27:31', null, 'Windows XP', 'Chrome', '218.107.32.228', null, null, null, null);
INSERT INTO `log` VALUES ('3174', null, '2016-05-04 15:27:39', null, 'Windows 7', 'Chrome', '180.166.7.106', null, null, null, null);
INSERT INTO `log` VALUES ('3175', null, '2016-05-04 15:28:06', null, 'Windows', 'Chrome', '114.111.166.210', null, null, null, null);
INSERT INTO `log` VALUES ('3176', null, '2016-05-04 15:28:23', null, 'Windows 7', 'Chrome 28', '60.208.111.211', null, null, null, null);
INSERT INTO `log` VALUES ('3177', null, '2016-05-04 15:31:09', null, 'Windows 7', 'Chrome', '117.149.19.136', null, null, null, null);
INSERT INTO `log` VALUES ('3178', null, '2016-05-04 16:04:05', null, 'Windows 7', 'Chrome', '180.156.145.23', null, null, null, null);
INSERT INTO `log` VALUES ('3179', null, '2016-05-04 16:13:06', null, 'Windows 7', 'Chrome', '124.133.42.180', null, null, null, null);
INSERT INTO `log` VALUES ('3180', null, '2016-05-04 17:17:22', null, 'Windows 7', 'Chrome', '116.8.231.87', null, null, null, null);
INSERT INTO `log` VALUES ('3181', null, '2016-05-05 15:12:09', null, 'Windows 7', 'Chrome', '182.200.38.249', null, null, null, null);
INSERT INTO `log` VALUES ('3182', null, '2016-05-05 15:14:35', null, 'Windows 7', 'Chrome', '182.200.38.249', null, null, null, null);
INSERT INTO `log` VALUES ('3183', null, '2016-05-05 15:14:57', null, 'Windows 7', 'Chrome', '182.200.38.249', null, null, null, null);
INSERT INTO `log` VALUES ('3184', null, '2016-05-05 21:51:24', null, 'Windows 7', 'Firefox 4', '211.138.251.66', null, null, null, null);
INSERT INTO `log` VALUES ('3185', null, '2016-05-05 22:02:39', null, 'Windows 7', 'Firefox 4', '211.138.251.66', null, null, null, null);
INSERT INTO `log` VALUES ('3186', null, '2016-05-05 22:08:25', null, 'Windows 7', 'Internet Explorer 7', '211.138.251.66', null, null, null, null);
INSERT INTO `log` VALUES ('3187', null, '2016-05-05 22:08:36', null, 'Windows 7', 'Internet Explorer 7', '211.138.251.66', null, null, null, null);
INSERT INTO `log` VALUES ('3188', null, '2016-05-05 22:09:31', null, 'Windows 7', 'Internet Explorer 7', '211.138.251.66', null, null, null, null);
INSERT INTO `log` VALUES ('3189', null, '2016-05-06 09:11:12', null, 'Windows 7', 'Chrome', '111.30.21.47', null, null, null, null);
INSERT INTO `log` VALUES ('3190', null, '2016-05-06 12:49:29', null, 'Windows 7', 'Chrome', '203.95.105.10', null, null, null, null);
INSERT INTO `log` VALUES ('3191', null, '2016-05-06 13:17:32', null, 'Windows', 'Chrome', '116.231.35.163', null, null, null, null);
INSERT INTO `log` VALUES ('3192', null, '2016-05-06 13:35:55', null, 'Windows 7', 'Chrome', '220.249.170.226', null, null, null, null);
INSERT INTO `log` VALUES ('3193', null, '2016-05-06 13:39:27', null, 'Windows 7', 'Chrome', '124.166.231.248', null, null, null, null);
INSERT INTO `log` VALUES ('3194', null, '2016-05-06 16:28:35', null, 'Windows Vista', 'Mozilla', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('3195', null, '2016-05-06 16:28:36', null, 'Windows Vista', 'Mozilla', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('3196', null, '2016-05-06 16:28:53', null, 'Windows Vista', 'Mozilla', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('3197', null, '2016-05-06 16:32:45', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3198', null, '2016-05-06 16:54:15', null, 'Windows Vista', 'Chrome', '113.118.246.4', null, null, null, null);
INSERT INTO `log` VALUES ('3199', null, '2016-05-06 16:54:55', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3200', null, '2016-05-06 17:04:37', null, 'Windows', 'Chrome', '123.114.37.188', null, null, null, null);
INSERT INTO `log` VALUES ('3201', null, '2016-05-06 17:13:21', null, 'Windows 7', 'Mozilla', '60.247.77.252', null, null, null, null);
INSERT INTO `log` VALUES ('3202', null, '2016-05-06 17:21:55', null, 'Windows Vista', 'Mozilla', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('3203', null, '2016-05-06 17:22:10', null, 'Windows Vista', 'Mozilla', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('3204', null, '2016-05-06 17:22:24', null, 'Windows Vista', 'Mozilla', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('3205', null, '2016-05-06 23:09:52', null, 'Windows', 'Chrome', '113.205.199.226', null, null, null, null);
INSERT INTO `log` VALUES ('3206', null, '2016-05-06 23:15:49', null, 'Windows', 'Chrome', '113.205.199.226', null, null, null, null);
INSERT INTO `log` VALUES ('3207', null, '2016-05-07 17:54:32', null, 'Windows 7', 'Chrome', '210.32.120.101', null, null, null, null);
INSERT INTO `log` VALUES ('3208', null, '2016-05-07 22:44:09', null, 'Windows', 'Internet Explorer 7', '122.235.92.18', null, null, null, null);
INSERT INTO `log` VALUES ('3209', null, '2016-05-07 23:34:39', null, 'Mac OS X (iPhone)', 'Apple WebKit', '112.67.199.170', null, null, null, null);
INSERT INTO `log` VALUES ('3210', null, '2016-05-08 00:08:58', null, 'Android', 'Chrome', '210.32.120.109', null, null, null, null);
INSERT INTO `log` VALUES ('3211', null, '2016-05-08 22:16:36', null, 'Android', 'Chrome', '111.196.240.121', null, null, null, null);
INSERT INTO `log` VALUES ('3212', null, '2016-05-09 11:15:40', null, 'Windows', 'Chrome', '114.83.46.242', null, null, null, null);
INSERT INTO `log` VALUES ('3213', null, '2016-05-09 12:23:47', null, 'Windows 7', 'Chrome', '111.196.69.27', null, null, null, null);
INSERT INTO `log` VALUES ('3214', null, '2016-05-09 12:39:40', null, 'Windows Vista', 'Chrome', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('3215', null, '2016-05-09 12:41:39', null, 'Windows Vista', 'Chrome', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('3216', null, '2016-05-09 12:41:42', null, 'Windows Vista', 'Chrome', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('3217', null, '2016-05-09 12:54:33', null, 'Windows 7', 'Chrome', '210.32.120.101', null, null, null, null);
INSERT INTO `log` VALUES ('3218', null, '2016-05-09 13:43:33', null, 'Windows', 'Chrome', '106.37.236.227', null, null, null, null);
INSERT INTO `log` VALUES ('3219', null, '2016-05-09 15:30:11', null, 'Windows Vista', 'Chrome', '61.153.20.162', null, null, null, null);
INSERT INTO `log` VALUES ('3220', null, '2016-05-09 15:30:12', null, 'Windows Vista', 'Chrome', '61.153.20.162', null, null, null, null);
INSERT INTO `log` VALUES ('3221', null, '2016-05-09 15:30:20', null, 'Windows Vista', 'Chrome', '61.153.20.162', null, null, null, null);
INSERT INTO `log` VALUES ('3222', null, '2016-05-09 15:32:56', null, 'Windows Vista', 'Chrome', '61.153.20.162', null, null, null, null);
INSERT INTO `log` VALUES ('3223', null, '2016-05-09 15:41:09', null, 'Windows Vista', 'Chrome', '124.207.147.186', null, null, null, null);
INSERT INTO `log` VALUES ('3224', null, '2016-05-09 18:05:28', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3225', null, '2016-05-09 18:05:55', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3226', null, '2016-05-09 18:07:51', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3227', null, '2016-05-09 18:07:56', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3228', null, '2016-05-09 18:08:00', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3229', null, '2016-05-10 11:10:24', null, 'Windows 7', 'Chrome', '61.131.81.135', null, null, null, null);
INSERT INTO `log` VALUES ('3230', null, '2016-05-10 11:25:05', null, 'Windows 7', 'Chrome', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('3231', null, '2016-05-10 14:00:14', null, 'Windows 7', 'Chrome', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('3232', null, '2016-05-10 14:00:16', null, 'Windows 7', 'Chrome', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('3233', null, '2016-05-10 14:00:22', null, 'Windows 7', 'Chrome', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('3234', null, '2016-05-10 14:08:34', null, 'Windows 7', 'Chrome', '58.62.220.204', null, null, null, null);
INSERT INTO `log` VALUES ('3235', null, '2016-05-10 18:00:30', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3236', null, '2016-05-10 22:16:58', null, 'Windows 7', 'Chrome', '116.234.97.225', null, null, null, null);
INSERT INTO `log` VALUES ('3237', null, '2016-05-10 22:22:38', null, 'Windows 7', 'Chrome', '116.234.97.225', null, null, null, null);
INSERT INTO `log` VALUES ('3238', null, '2016-05-10 22:22:50', null, 'Windows 7', 'Chrome', '116.234.97.225', null, null, null, null);
INSERT INTO `log` VALUES ('3239', null, '2016-05-10 22:22:57', null, 'Windows 7', 'Chrome', '116.234.97.225', null, null, null, null);
INSERT INTO `log` VALUES ('3240', null, '2016-05-10 22:26:38', null, 'Windows 7', 'Chrome', '116.234.97.225', null, null, null, null);
INSERT INTO `log` VALUES ('3241', null, '2016-05-10 23:10:17', null, 'Windows 7', 'Chrome', '58.62.100.130', null, null, null, null);
INSERT INTO `log` VALUES ('3242', null, '2016-05-10 23:17:34', null, 'Windows 7', 'Chrome', '58.62.102.78', null, null, null, null);
INSERT INTO `log` VALUES ('3243', null, '2016-05-10 23:34:12', null, 'Windows 7', 'Chrome', '116.234.97.225', null, null, null, null);
INSERT INTO `log` VALUES ('3244', null, '2016-05-10 23:34:14', null, 'Windows 7', 'Chrome', '116.234.97.225', null, null, null, null);
INSERT INTO `log` VALUES ('3245', null, '2016-05-11 11:25:05', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3246', null, '2016-05-11 11:27:08', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3247', null, '2016-05-11 11:27:44', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3248', null, '2016-05-11 11:28:20', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3249', null, '2016-05-11 11:30:51', null, 'Windows 7', 'Chrome', '117.149.19.136', null, null, null, null);
INSERT INTO `log` VALUES ('3250', null, '2016-05-11 11:32:46', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3251', null, '2016-05-11 12:17:41', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3252', null, '2016-05-11 12:19:59', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3253', null, '2016-05-11 12:32:46', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3254', null, '2016-05-11 12:48:56', null, 'Mac OS X (iPhone)', 'Apple WebKit', '223.104.5.230', null, null, null, null);
INSERT INTO `log` VALUES ('3255', null, '2016-05-11 13:06:35', null, 'Windows 7', 'Internet Explorer 8', '221.234.149.158', null, null, null, null);
INSERT INTO `log` VALUES ('3256', null, '2016-05-11 13:10:49', null, 'Windows 7', 'Chrome', '221.234.149.158', null, null, null, null);
INSERT INTO `log` VALUES ('3257', null, '2016-05-11 14:09:03', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3258', null, '2016-05-11 14:09:25', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3259', null, '2016-05-11 14:10:35', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3260', null, '2016-05-11 14:11:56', null, 'Mac OS X', 'Safari', '60.177.86.250', null, null, null, null);
INSERT INTO `log` VALUES ('3261', null, '2016-05-11 14:13:46', null, 'Windows 7', 'Chrome', '116.228.206.84', null, null, null, null);
INSERT INTO `log` VALUES ('3262', null, '2016-05-11 14:24:36', null, 'Windows Vista', 'Mozilla', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('3263', null, '2016-05-11 14:25:51', null, 'Mac OS X (iPhone)', 'Apple WebKit', '116.232.169.44', null, null, null, null);
INSERT INTO `log` VALUES ('3264', null, '2016-05-11 14:26:58', null, 'Windows', 'Chrome', '116.231.35.163', null, null, null, null);
INSERT INTO `log` VALUES ('3265', null, '2016-05-11 14:27:05', null, 'Windows', 'Chrome', '116.231.35.163', null, null, null, null);
INSERT INTO `log` VALUES ('3266', null, '2016-05-11 14:27:12', null, 'Windows', 'Chrome', '116.231.35.163', null, null, null, null);
INSERT INTO `log` VALUES ('3267', null, '2016-05-11 14:40:37', null, 'Windows Vista', 'Chrome', '58.51.169.3', null, null, null, null);
INSERT INTO `log` VALUES ('3268', null, '2016-05-11 14:40:53', null, 'Windows 7', 'Chrome', '183.62.60.90', null, null, null, null);
INSERT INTO `log` VALUES ('3269', null, '2016-05-11 14:41:03', null, 'Windows 7', 'Chrome', '222.35.39.217', null, null, null, null);
INSERT INTO `log` VALUES ('3270', null, '2016-05-11 14:43:44', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3271', null, '2016-05-11 14:43:53', null, 'Windows', 'Chrome', '116.231.35.163', null, null, null, null);
INSERT INTO `log` VALUES ('3272', null, '2016-05-11 14:50:15', null, 'Windows', 'Chrome', '116.231.35.163', null, null, null, null);
INSERT INTO `log` VALUES ('3273', null, '2016-05-11 14:50:48', null, 'Windows', 'Chrome', '116.231.35.163', null, null, null, null);
INSERT INTO `log` VALUES ('3274', null, '2016-05-11 15:01:55', null, 'Windows 7', 'Chrome', '221.216.149.184', null, null, null, null);
INSERT INTO `log` VALUES ('3275', null, '2016-05-11 15:04:24', null, 'Windows 7', 'Chrome', '221.216.149.184', null, null, null, null);
INSERT INTO `log` VALUES ('3276', null, '2016-05-11 15:05:42', null, 'Windows 7', 'Chrome', '221.216.149.184', null, null, null, null);
INSERT INTO `log` VALUES ('3277', null, '2016-05-11 15:05:58', null, 'Windows 7', 'Chrome', '221.216.149.184', null, null, null, null);
INSERT INTO `log` VALUES ('3278', null, '2016-05-11 15:06:04', null, 'Windows 7', 'Chrome', '221.216.149.184', null, null, null, null);
INSERT INTO `log` VALUES ('3279', null, '2016-05-11 15:18:03', null, 'Windows', 'Chrome', '113.92.218.109', null, null, null, null);
INSERT INTO `log` VALUES ('3280', null, '2016-05-11 15:20:00', null, 'Windows 7', 'Chrome', '222.35.39.217', null, null, null, null);
INSERT INTO `log` VALUES ('3281', null, '2016-05-11 15:20:49', null, 'Windows 7', 'Chrome', '175.162.120.150', null, null, null, null);
INSERT INTO `log` VALUES ('3282', null, '2016-05-11 18:16:58', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3283', null, '2016-05-11 18:19:28', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3284', null, '2016-05-11 19:11:20', null, 'Windows XP', 'Firefox 4', '112.95.12.26', null, null, null, null);
INSERT INTO `log` VALUES ('3285', null, '2016-05-11 19:19:39', null, 'Mac OS X (iPhone)', 'Apple WebKit', '114.104.231.60', null, null, null, null);
INSERT INTO `log` VALUES ('3286', null, '2016-05-11 19:20:28', null, 'Mac OS X (iPhone)', 'Apple WebKit', '114.104.231.60', null, null, null, null);
INSERT INTO `log` VALUES ('3287', null, '2016-05-11 20:23:38', null, 'Windows 7', 'Chrome', '116.234.97.225', null, null, null, null);
INSERT INTO `log` VALUES ('3288', null, '2016-05-12 09:02:18', null, 'Windows 7', 'Chrome', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('3289', null, '2016-05-12 09:11:36', null, 'Windows 7', 'Firefox 4', '120.197.24.209', null, null, null, null);
INSERT INTO `log` VALUES ('3290', null, '2016-05-12 09:35:08', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3291', null, '2016-05-12 09:41:31', null, 'Mac OS X', 'Safari', '60.206.194.34', null, null, null, null);
INSERT INTO `log` VALUES ('3292', null, '2016-05-12 09:42:27', null, 'Windows', 'Chrome', '180.173.20.133', null, null, null, null);
INSERT INTO `log` VALUES ('3293', null, '2016-05-12 09:43:07', null, 'Windows', 'Chrome', '180.173.20.133', null, null, null, null);
INSERT INTO `log` VALUES ('3294', null, '2016-05-12 09:44:53', null, 'Windows', 'Chrome', '180.173.20.133', null, null, null, null);
INSERT INTO `log` VALUES ('3295', null, '2016-05-12 09:48:34', null, 'Windows Vista', 'Chrome', '218.93.112.174', null, null, null, null);
INSERT INTO `log` VALUES ('3296', null, '2016-05-12 10:11:38', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3297', null, '2016-05-12 10:26:43', null, 'Windows', 'Chrome', '112.80.152.215', null, null, null, null);
INSERT INTO `log` VALUES ('3298', null, '2016-05-12 10:30:01', null, 'Windows', 'Chrome', '112.80.152.215', null, null, null, null);
INSERT INTO `log` VALUES ('3302', null, '2016-05-12 14:23:19', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3303', null, '2016-05-12 14:24:08', null, 'Windows', 'Chrome', '116.231.35.163', null, null, null, null);
INSERT INTO `log` VALUES ('3304', null, '2016-05-12 14:25:37', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3305', null, '2016-05-12 14:30:23', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3306', null, '2016-05-12 14:31:00', null, 'Windows 7', 'Chrome', '171.217.146.120', null, null, null, null);
INSERT INTO `log` VALUES ('3307', null, '2016-05-12 14:31:30', null, 'Windows 7', 'Firefox 4', '1.193.60.113', null, null, null, null);
INSERT INTO `log` VALUES ('3308', null, '2016-05-12 14:31:36', null, 'Windows 7', 'Chrome', '218.205.194.33', null, null, null, null);
INSERT INTO `log` VALUES ('3309', null, '2016-05-12 14:31:44', null, 'Windows', 'Mozilla', '218.6.169.95', null, null, null, null);
INSERT INTO `log` VALUES ('3310', null, '2016-05-12 14:32:21', null, 'Windows Vista', 'Mozilla', '221.178.182.205', null, null, null, null);
INSERT INTO `log` VALUES ('3311', null, '2016-05-12 14:32:39', null, 'Windows 7', 'Chrome', '124.207.181.82', null, null, null, null);
INSERT INTO `log` VALUES ('3312', null, '2016-05-12 14:32:41', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3313', null, '2016-05-12 14:32:43', null, 'Windows', 'Chrome', '124.127.102.41', null, null, null, null);
INSERT INTO `log` VALUES ('3314', null, '2016-05-12 14:33:11', null, 'Windows 7', 'Chrome', '113.108.139.178', null, null, null, null);
INSERT INTO `log` VALUES ('3315', null, '2016-05-12 14:33:19', null, 'Windows', 'Chrome', '121.57.47.59', null, null, null, null);
INSERT INTO `log` VALUES ('3316', null, '2016-05-12 14:33:21', null, 'Windows XP', 'Internet Explorer 7', '58.209.161.84', null, null, null, null);
INSERT INTO `log` VALUES ('3317', null, '2016-05-12 14:33:49', null, 'Windows 7', 'Firefox 4', '59.56.4.91', null, null, null, null);
INSERT INTO `log` VALUES ('3318', null, '2016-05-12 14:34:14', null, 'Windows XP', 'Internet Explorer 8', '42.93.104.218', null, null, null, null);
INSERT INTO `log` VALUES ('3319', null, '2016-05-12 14:34:44', null, 'Windows 7', 'Chrome', '124.42.1.10', null, null, null, null);
INSERT INTO `log` VALUES ('3320', null, '2016-05-12 14:34:47', null, 'Windows 7', 'Chrome', '218.104.155.137', null, null, null, null);
INSERT INTO `log` VALUES ('3321', null, '2016-05-12 14:35:32', null, 'Windows XP', 'Chrome', '42.93.104.218', null, null, null, null);
INSERT INTO `log` VALUES ('3322', null, '2016-05-12 14:35:50', null, 'Windows 7', 'Chrome', '103.254.112.58', null, null, null, null);
INSERT INTO `log` VALUES ('3323', null, '2016-05-12 14:35:52', null, 'Windows', 'Chrome', '111.126.230.47', null, null, null, null);
INSERT INTO `log` VALUES ('3324', null, '2016-05-12 14:36:07', null, 'Windows', 'Chrome', '111.126.230.47', null, null, null, null);
INSERT INTO `log` VALUES ('3325', null, '2016-05-12 14:36:20', null, 'Windows 7', 'Chrome', '180.173.88.122', null, null, null, null);
INSERT INTO `log` VALUES ('3326', null, '2016-05-12 14:36:32', null, 'Windows 7', 'Chrome', '14.222.161.52', null, null, null, null);
INSERT INTO `log` VALUES ('3327', null, '2016-05-12 14:36:42', null, 'Windows', 'Chrome', '124.127.102.41', null, null, null, null);
INSERT INTO `log` VALUES ('3328', null, '2016-05-12 14:36:46', null, 'Windows XP', 'Chrome', '113.92.233.175', null, null, null, null);
INSERT INTO `log` VALUES ('3329', null, '2016-05-12 14:37:07', null, 'Windows 7', 'Firefox 4', '223.88.68.87', null, null, null, null);
INSERT INTO `log` VALUES ('3330', null, '2016-05-12 14:38:45', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3331', null, '2016-05-12 14:38:50', null, 'Windows 7', 'Chrome', '159.226.43.35', null, null, null, null);
INSERT INTO `log` VALUES ('3332', null, '2016-05-12 14:38:52', null, 'Windows', 'Chrome', '222.182.112.23', null, null, null, null);
INSERT INTO `log` VALUES ('3333', null, '2016-05-12 14:39:22', null, 'Windows', 'Chrome', '222.182.112.23', null, null, null, null);
INSERT INTO `log` VALUES ('3334', null, '2016-05-12 14:39:25', null, 'Windows Vista', 'Chrome', '61.139.21.170', null, null, null, null);
INSERT INTO `log` VALUES ('3335', null, '2016-05-12 14:39:28', null, 'Windows', 'Chrome', '222.182.112.23', null, null, null, null);
INSERT INTO `log` VALUES ('3336', null, '2016-05-12 14:39:56', null, 'Windows 7', 'Firefox 4', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3337', null, '2016-05-12 14:40:01', null, 'Windows 7', 'Firefox 4', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3338', null, '2016-05-12 14:40:27', null, 'Windows XP', 'Chrome', '113.92.233.175', null, null, null, null);
INSERT INTO `log` VALUES ('3339', null, '2016-05-12 14:41:38', null, 'Windows Vista', 'Chrome', '61.139.20.32', null, null, null, null);
INSERT INTO `log` VALUES ('3340', null, '2016-05-12 14:42:30', null, 'Windows 7', 'Chrome', '14.147.144.17', null, null, null, null);
INSERT INTO `log` VALUES ('3341', null, '2016-05-12 14:43:42', null, 'Windows 7', 'Chrome', '103.254.67.40', null, null, null, null);
INSERT INTO `log` VALUES ('3342', null, '2016-05-12 14:44:14', null, 'Windows 7', 'Chrome', '101.81.49.159', null, null, null, null);
INSERT INTO `log` VALUES ('3343', null, '2016-05-12 14:44:32', null, 'Windows', 'Chrome', '116.231.35.163', null, null, null, null);
INSERT INTO `log` VALUES ('3344', null, '2016-05-12 14:44:38', null, 'Mac OS X (iPhone)', 'Apple WebKit', '223.104.3.149', null, null, null, null);
INSERT INTO `log` VALUES ('3345', null, '2016-05-12 14:45:00', null, 'Windows 7', 'Chrome', '117.135.212.108', null, null, null, null);
INSERT INTO `log` VALUES ('3346', null, '2016-05-12 14:45:22', null, 'Windows 7', 'Chrome', '58.62.103.92', null, null, null, null);
INSERT INTO `log` VALUES ('3347', null, '2016-05-12 14:47:04', null, 'Windows 7', 'Chrome', '59.57.3.150', null, null, null, null);
INSERT INTO `log` VALUES ('3348', null, '2016-05-12 14:47:06', null, 'Windows', 'Chrome', '116.228.9.78', null, null, null, null);
INSERT INTO `log` VALUES ('3349', null, '2016-05-12 14:47:10', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3350', null, '2016-05-12 14:47:13', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3351', null, '2016-05-12 14:47:16', null, 'Windows', 'Mozilla', '218.6.169.95', null, null, null, null);
INSERT INTO `log` VALUES ('3352', null, '2016-05-12 14:47:19', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3353', null, '2016-05-12 14:49:01', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3354', null, '2016-05-12 14:49:16', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3355', null, '2016-05-12 14:53:30', null, 'Windows 7', 'Firefox 4', '121.235.19.146', null, null, null, null);
INSERT INTO `log` VALUES ('3356', null, '2016-05-12 14:53:34', null, 'Android', 'Chrome', '223.104.3.146', null, null, null, null);
INSERT INTO `log` VALUES ('3357', null, '2016-05-12 14:53:49', null, 'Windows 7', 'Firefox 4', '121.235.19.146', null, null, null, null);
INSERT INTO `log` VALUES ('3358', null, '2016-05-12 14:57:54', null, 'Windows 7', 'Chrome', '121.34.192.231', null, null, null, null);
INSERT INTO `log` VALUES ('3359', null, '2016-05-12 15:03:21', null, 'Windows Vista', 'Chrome', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('3360', null, '2016-05-12 15:05:40', null, 'Windows Vista', 'Chrome', '218.93.112.174', null, null, null, null);
INSERT INTO `log` VALUES ('3361', null, '2016-05-12 15:19:22', null, 'Windows 7', 'Chrome', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('3362', null, '2016-05-12 15:47:22', null, 'Windows Vista', 'Chrome', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('3363', null, '2016-05-12 17:23:29', null, 'Windows XP', 'Chrome', '113.92.233.175', null, null, null, null);
INSERT INTO `log` VALUES ('3364', null, '2016-05-12 17:23:31', null, 'Windows XP', 'Chrome', '113.92.233.175', null, null, null, null);
INSERT INTO `log` VALUES ('3365', null, '2016-05-12 17:51:34', null, 'Windows', 'Chrome', '118.242.19.30', null, null, null, null);
INSERT INTO `log` VALUES ('3366', null, '2016-05-12 17:51:54', null, 'Windows 7', 'Chrome', '121.34.192.231', null, null, null, null);
INSERT INTO `log` VALUES ('3367', null, '2016-05-12 17:52:53', null, 'Windows', 'Chrome', '118.242.19.30', null, null, null, null);
INSERT INTO `log` VALUES ('3368', null, '2016-05-12 17:57:16', null, 'Windows 7', 'Firefox 4', '111.0.249.144', null, null, null, null);
INSERT INTO `log` VALUES ('3369', null, '2016-05-12 18:01:36', null, 'Windows 7', 'Chrome', '121.34.192.231', null, null, null, null);
INSERT INTO `log` VALUES ('3370', null, '2016-05-12 18:01:42', null, 'Windows 7', 'Chrome', '121.34.192.231', null, null, null, null);
INSERT INTO `log` VALUES ('3371', null, '2016-05-12 21:38:11', null, 'Android', 'Chrome', '171.221.142.180', null, null, null, null);
INSERT INTO `log` VALUES ('3372', null, '2016-05-12 21:57:13', null, 'Mac OS X', 'Chrome', '119.39.102.11', null, null, null, null);
INSERT INTO `log` VALUES ('3373', null, '2016-05-12 22:52:19', null, 'Windows 7', 'Firefox 4', '119.139.136.13', null, null, null, null);
INSERT INTO `log` VALUES ('3374', null, '2016-05-12 23:44:05', null, 'Windows XP', 'Chrome', '113.92.233.175', null, null, null, null);
INSERT INTO `log` VALUES ('3375', null, '2016-05-12 23:44:09', null, 'Windows XP', 'Chrome', '113.92.233.175', null, null, null, null);
INSERT INTO `log` VALUES ('3376', null, '2016-05-13 09:27:39', null, 'Windows 7', 'Chrome', '119.161.239.68', null, null, null, null);
INSERT INTO `log` VALUES ('3377', null, '2016-05-13 09:31:09', null, 'Windows 7', 'Chrome', '119.161.239.68', null, null, null, null);
INSERT INTO `log` VALUES ('3378', null, '2016-05-13 11:36:38', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3379', null, '2016-05-13 12:13:40', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3380', null, '2016-05-13 12:14:21', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3381', null, '2016-05-13 12:14:38', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3390', null, '2016-05-13 12:40:59', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3391', null, '2016-05-13 12:41:32', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3392', null, '2016-05-13 12:41:36', null, 'Mac OS X (iPhone)', 'Apple WebKit', '183.62.60.90', null, null, null, null);
INSERT INTO `log` VALUES ('3393', null, '2016-05-13 12:41:54', null, 'Windows 7', 'Chrome', '202.101.102.203', null, null, null, null);
INSERT INTO `log` VALUES ('3394', null, '2016-05-13 12:42:46', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3395', null, '2016-05-13 12:42:48', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3396', null, '2016-05-13 12:44:42', null, 'Mac OS X', 'Safari', '101.81.56.138', null, null, null, null);
INSERT INTO `log` VALUES ('3397', null, '2016-05-13 12:44:58', null, 'Windows', 'Mozilla', '218.6.169.95', null, null, null, null);
INSERT INTO `log` VALUES ('3398', null, '2016-05-13 12:46:46', null, 'Android 4.x', 'Chrome', '58.19.3.178', null, null, null, null);
INSERT INTO `log` VALUES ('3399', null, '2016-05-13 12:47:11', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3400', null, '2016-05-13 12:48:30', null, 'Windows 7', 'Chrome', '59.46.46.164', null, null, null, null);
INSERT INTO `log` VALUES ('3401', null, '2016-05-13 12:58:22', null, 'Windows 7', 'Chrome', '182.108.10.72', null, null, null, null);
INSERT INTO `log` VALUES ('3402', null, '2016-05-13 12:59:15', null, 'Windows 7', 'Chrome', '182.108.10.72', null, null, null, null);
INSERT INTO `log` VALUES ('3403', null, '2016-05-13 13:02:52', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3404', null, '2016-05-13 13:03:01', null, 'Android', 'Chrome', '58.218.250.42', null, null, null, null);
INSERT INTO `log` VALUES ('3405', null, '2016-05-13 13:03:41', null, 'Android', 'Chrome', '58.218.250.42', null, null, null, null);
INSERT INTO `log` VALUES ('3406', null, '2016-05-13 13:03:49', null, 'Windows 7', 'Mozilla', '222.85.139.101', null, null, null, null);
INSERT INTO `log` VALUES ('3407', null, '2016-05-13 13:10:04', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3408', null, '2016-05-13 13:11:24', null, 'Windows 7', 'Chrome', '49.77.187.121', null, null, null, null);
INSERT INTO `log` VALUES ('3409', null, '2016-05-13 13:12:36', null, 'Windows 7', 'Chrome', '58.218.250.42', null, null, null, null);
INSERT INTO `log` VALUES ('3410', null, '2016-05-13 13:12:43', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3411', null, '2016-05-13 13:13:24', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3412', null, '2016-05-13 13:13:37', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3413', null, '2016-05-13 13:13:52', null, 'Mac OS X (iPhone)', 'Apple WebKit', '223.104.18.218', null, null, null, null);
INSERT INTO `log` VALUES ('3414', null, '2016-05-13 13:17:11', null, 'Windows 7', 'Chrome', '210.82.30.225', null, null, null, null);
INSERT INTO `log` VALUES ('3415', null, '2016-05-13 13:19:15', null, 'Windows Vista', 'Chrome', '121.14.104.61', null, null, null, null);
INSERT INTO `log` VALUES ('3416', null, '2016-05-13 13:21:55', null, 'Android', 'Chrome', '117.136.24.185', null, null, null, null);
INSERT INTO `log` VALUES ('3417', null, '2016-05-13 13:22:15', null, 'Android', 'Chrome', '117.136.24.185', null, null, null, null);
INSERT INTO `log` VALUES ('3418', null, '2016-05-13 13:22:24', null, 'Windows 7', 'Chrome', '115.236.91.15', null, null, null, null);
INSERT INTO `log` VALUES ('3419', null, '2016-05-13 13:22:37', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3420', null, '2016-05-13 13:23:08', null, 'Android', 'Chrome', '117.136.24.185', null, null, null, null);
INSERT INTO `log` VALUES ('3421', null, '2016-05-13 13:23:16', null, 'Windows 7', 'Chrome', '115.236.91.15', null, null, null, null);
INSERT INTO `log` VALUES ('3422', null, '2016-05-13 13:24:58', null, 'Windows 7', 'Chrome', '115.236.91.15', null, null, null, null);
INSERT INTO `log` VALUES ('3423', null, '2016-05-13 13:25:48', null, 'Windows Vista', 'Chrome', '218.93.112.174', null, null, null, null);
INSERT INTO `log` VALUES ('3424', null, '2016-05-13 13:28:04', null, 'Windows 7', 'Chrome', '115.236.91.15', null, null, null, null);
INSERT INTO `log` VALUES ('3425', null, '2016-05-13 13:28:20', null, 'Windows Vista', 'Chrome', '121.14.104.61', null, null, null, null);
INSERT INTO `log` VALUES ('3426', null, '2016-05-13 13:28:33', null, 'Windows 7', 'Chrome', '115.236.91.15', null, null, null, null);
INSERT INTO `log` VALUES ('3427', null, '2016-05-13 13:31:33', null, 'Windows Vista', 'Mozilla', '118.244.254.9', null, null, null, null);
INSERT INTO `log` VALUES ('3428', null, '2016-05-13 13:31:55', null, 'Windows 7', 'Chrome', '183.62.60.90', null, null, null, null);
INSERT INTO `log` VALUES ('3429', null, '2016-05-13 13:32:33', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3430', null, '2016-05-13 13:34:01', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3431', null, '2016-05-13 13:34:03', null, 'Windows 7', 'Firefox 4', '59.46.172.210', null, null, null, null);
INSERT INTO `log` VALUES ('3432', null, '2016-05-13 13:35:43', null, 'Windows 7', 'Chrome', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('3433', null, '2016-05-13 13:36:30', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3434', null, '2016-05-13 13:36:32', null, 'Windows 7', 'Chrome', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('3435', null, '2016-05-13 13:37:06', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3436', null, '2016-05-13 13:38:11', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3437', null, '2016-05-13 13:38:23', null, 'Windows', 'Chrome', '111.198.66.16', null, null, null, null);
INSERT INTO `log` VALUES ('3438', null, '2016-05-13 13:40:10', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3439', null, '2016-05-13 13:44:33', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3440', null, '2016-05-13 13:51:11', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3441', null, '2016-05-13 13:52:31', null, 'Windows', 'Chrome', '222.211.172.191', null, null, null, null);
INSERT INTO `log` VALUES ('3442', null, '2016-05-13 13:52:34', null, 'Windows', 'Mozilla', '220.180.239.228', null, null, null, null);
INSERT INTO `log` VALUES ('3443', null, '2016-05-13 13:52:53', null, 'Windows', 'Chrome', '222.182.112.23', null, null, null, null);
INSERT INTO `log` VALUES ('3444', null, '2016-05-13 13:54:03', null, 'Windows', 'Chrome', '117.158.195.102', null, null, null, null);
INSERT INTO `log` VALUES ('3445', null, '2016-05-13 13:54:19', null, 'Windows', 'Chrome', '183.48.98.15', null, null, null, null);
INSERT INTO `log` VALUES ('3446', null, '2016-05-13 13:54:41', null, 'Windows 7', 'Chrome', '180.169.59.210', null, null, null, null);
INSERT INTO `log` VALUES ('3447', null, '2016-05-13 13:54:53', null, 'Windows 7', 'Chrome', '222.168.33.190', null, null, null, null);
INSERT INTO `log` VALUES ('3448', null, '2016-05-13 13:54:56', null, 'Windows 7', 'Chrome', '120.203.17.90', null, null, null, null);
INSERT INTO `log` VALUES ('3449', null, '2016-05-13 13:55:15', null, 'Windows', 'Mozilla', '220.180.239.228', null, null, null, null);
INSERT INTO `log` VALUES ('3450', null, '2016-05-13 13:55:43', null, 'Windows 7', 'Chrome', '123.127.244.254', null, null, null, null);
INSERT INTO `log` VALUES ('3451', null, '2016-05-13 13:56:19', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3452', null, '2016-05-13 13:56:30', null, 'Windows 7', 'Chrome', '112.65.138.234', null, null, null, null);
INSERT INTO `log` VALUES ('3453', null, '2016-05-13 13:58:04', null, 'Windows 7', 'Chrome', '106.120.218.34', null, null, null, null);
INSERT INTO `log` VALUES ('3454', null, '2016-05-13 13:59:26', null, 'Windows 7', 'Chrome', '106.120.218.34', null, null, null, null);
INSERT INTO `log` VALUES ('3455', null, '2016-05-13 14:00:09', null, 'Windows 7', 'Chrome', '112.65.138.234', null, null, null, null);
INSERT INTO `log` VALUES ('3456', null, '2016-05-13 14:01:20', null, 'Windows 7', 'Chrome', '222.168.33.190', null, null, null, null);
INSERT INTO `log` VALUES ('3457', null, '2016-05-13 14:04:15', null, 'Windows', 'Chrome', '114.111.167.93', null, null, null, null);
INSERT INTO `log` VALUES ('3458', null, '2016-05-13 14:04:15', null, 'Windows 7', 'Chrome', '117.25.59.136', null, null, null, null);
INSERT INTO `log` VALUES ('3459', null, '2016-05-13 14:06:51', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3460', null, '2016-05-13 14:07:45', null, 'Windows', 'Mozilla', '218.6.169.95', null, null, null, null);
INSERT INTO `log` VALUES ('3461', null, '2016-05-13 14:07:48', null, 'Windows', 'Mozilla', '218.6.169.95', null, null, null, null);
INSERT INTO `log` VALUES ('3462', null, '2016-05-13 14:10:15', null, 'Windows 7', 'Chrome', '112.65.138.234', null, null, null, null);
INSERT INTO `log` VALUES ('3463', null, '2016-05-13 14:14:19', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3464', null, '2016-05-13 14:14:31', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3465', null, '2016-05-13 14:21:46', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3466', null, '2016-05-13 14:28:11', null, 'Windows 7', 'Internet Explorer 8', '211.142.134.98', null, null, null, null);
INSERT INTO `log` VALUES ('3467', null, '2016-05-13 14:30:41', null, 'Windows 7', 'Chrome', '112.123.240.114', null, null, null, null);
INSERT INTO `log` VALUES ('3468', null, '2016-05-13 14:33:57', null, 'Windows 7', 'Chrome', '222.18.127.77', null, null, null, null);
INSERT INTO `log` VALUES ('3469', null, '2016-05-13 14:34:42', null, 'Windows 7', 'Chrome', '222.18.127.77', null, null, null, null);
INSERT INTO `log` VALUES ('3470', null, '2016-05-13 14:35:32', null, 'Windows Vista', 'Chrome', '124.205.39.138', null, null, null, null);
INSERT INTO `log` VALUES ('3471', null, '2016-05-13 14:42:07', null, 'Windows 7', 'Chrome', '61.50.103.158', null, null, null, null);
INSERT INTO `log` VALUES ('3477', null, '2016-05-13 15:03:48', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3478', null, '2016-05-13 15:04:11', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3479', null, '2016-05-13 15:05:46', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3480', null, '2016-05-13 15:08:27', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3481', null, '2016-05-13 15:12:09', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3482', null, '2016-05-13 15:15:56', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3483', null, '2016-05-13 15:15:58', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3484', null, '2016-05-13 15:16:19', null, 'Windows 7', 'Mozilla', '222.85.139.101', null, null, null, null);
INSERT INTO `log` VALUES ('3485', null, '2016-05-13 15:16:27', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3486', null, '2016-05-13 15:16:55', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3487', null, '2016-05-13 15:17:15', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3488', null, '2016-05-13 15:17:16', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3489', null, '2016-05-13 15:17:16', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3490', null, '2016-05-13 15:17:16', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3491', null, '2016-05-13 15:17:16', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3492', null, '2016-05-13 15:17:16', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3493', null, '2016-05-13 15:17:17', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3494', null, '2016-05-13 15:17:17', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3495', null, '2016-05-13 15:17:17', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3496', null, '2016-05-13 15:17:18', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3497', null, '2016-05-13 15:17:18', null, 'Windows 7', 'Chrome', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('3498', null, '2016-05-13 15:17:24', null, 'Windows 7', 'Chrome', '171.88.164.38', null, null, null, null);
INSERT INTO `log` VALUES ('3499', null, '2016-05-13 15:17:30', null, 'Windows 7', 'Chrome', '222.85.139.101', null, null, null, null);
INSERT INTO `log` VALUES ('3500', null, '2016-05-13 15:17:35', null, 'Windows 7', 'Chrome', '124.163.223.84', null, null, null, null);
INSERT INTO `log` VALUES ('3501', null, '2016-05-13 15:18:16', null, 'Windows', 'Firefox 4', '183.218.227.180', null, null, null, null);
INSERT INTO `log` VALUES ('3502', null, '2016-05-13 15:19:47', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3503', null, '2016-05-13 15:20:23', null, 'Windows 7', 'Chrome', '124.163.223.84', null, null, null, null);
INSERT INTO `log` VALUES ('3504', null, '2016-05-13 15:29:17', null, 'Windows 7', 'Mozilla', '222.128.35.224', null, null, null, null);
INSERT INTO `log` VALUES ('3505', null, '2016-05-13 15:36:13', null, 'Windows', 'Chrome', '114.111.167.93', null, null, null, null);
INSERT INTO `log` VALUES ('3506', null, '2016-05-13 15:36:32', null, 'Windows', 'Chrome', '115.236.0.2', null, null, null, null);
INSERT INTO `log` VALUES ('3507', null, '2016-05-13 15:37:33', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3508', null, '2016-05-13 15:37:33', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3509', null, '2016-05-13 15:37:44', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3510', null, '2016-05-13 15:37:45', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3511', null, '2016-05-13 15:37:51', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3512', null, '2016-05-13 15:38:16', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3513', null, '2016-05-13 15:38:17', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3514', null, '2016-05-13 15:38:18', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3515', null, '2016-05-13 15:38:20', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3516', null, '2016-05-13 15:42:55', null, 'Windows', 'Chrome', '115.236.0.2', null, null, null, null);
INSERT INTO `log` VALUES ('3517', null, '2016-05-13 15:43:18', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3518', null, '2016-05-13 15:43:19', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3519', null, '2016-05-13 15:45:27', null, 'Windows 7', 'Chrome', '183.62.60.90', null, null, null, null);
INSERT INTO `log` VALUES ('3520', null, '2016-05-13 15:47:51', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3521', null, '2016-05-13 15:47:52', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3522', null, '2016-05-13 15:47:53', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3523', null, '2016-05-13 15:47:55', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3524', null, '2016-05-13 16:02:38', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3525', null, '2016-05-13 16:02:39', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3526', null, '2016-05-13 16:03:28', null, 'Windows Vista', 'Chrome', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('3527', null, '2016-05-13 16:04:14', null, 'Windows', 'Chrome', '124.114.130.114', null, null, null, null);
INSERT INTO `log` VALUES ('3528', null, '2016-05-13 16:10:33', null, 'Windows 7', 'Internet Explorer 10', '219.142.62.107', null, null, null, null);
INSERT INTO `log` VALUES ('3529', null, '2016-05-13 16:10:43', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3530', null, '2016-05-13 16:10:46', null, 'Windows', 'Chrome', '172.31.1.220', null, null, null, null);
INSERT INTO `log` VALUES ('3531', null, '2016-05-13 16:10:53', null, 'Windows 7', 'Mozilla', '14.155.136.67', null, null, null, null);
INSERT INTO `log` VALUES ('3532', null, '2016-05-13 16:10:57', null, 'Windows', 'Chrome', '114.111.166.65', null, null, null, null);
INSERT INTO `log` VALUES ('3533', null, '2016-05-13 16:11:21', null, 'Windows 7', 'Chrome', '180.166.7.106', null, null, null, null);
INSERT INTO `log` VALUES ('3534', null, '2016-05-13 16:11:43', null, 'Windows', 'Chrome', '125.71.79.52', null, null, null, null);
INSERT INTO `log` VALUES ('3535', null, '2016-05-13 16:12:08', null, 'Windows Vista', 'Chrome', '219.134.212.176', null, null, null, null);
INSERT INTO `log` VALUES ('3536', null, '2016-05-13 16:12:26', null, 'Windows', 'Chrome', '202.99.246.242', null, null, null, null);
INSERT INTO `log` VALUES ('3537', null, '2016-05-13 16:12:48', null, 'Android', 'Chrome', '222.221.146.131', null, null, null, null);
INSERT INTO `log` VALUES ('3538', null, '2016-05-13 16:12:51', null, 'Windows 7', 'Chrome', '58.247.170.163', null, null, null, null);
INSERT INTO `log` VALUES ('3539', null, '2016-05-13 16:14:25', null, 'Android', 'Chrome', '222.221.146.131', null, null, null, null);
INSERT INTO `log` VALUES ('3540', null, '2016-05-13 16:16:43', null, 'Windows 7', 'Chrome', '220.184.255.57', null, null, null, null);
INSERT INTO `log` VALUES ('3541', null, '2016-05-13 16:22:50', null, 'Windows', 'Chrome', '124.114.130.114', null, null, null, null);
INSERT INTO `log` VALUES ('3542', null, '2016-05-13 16:23:15', null, 'Windows 7', 'Chrome', '124.42.13.235', null, null, null, null);
INSERT INTO `log` VALUES ('3543', null, '2016-05-13 16:29:03', null, 'Windows 7', 'Chrome', '58.214.19.138', null, null, null, null);
INSERT INTO `log` VALUES ('3544', null, '2016-05-13 16:29:45', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3545', null, '2016-05-13 16:30:42', null, 'Windows', 'Chrome', '183.48.98.15', null, null, null, null);
INSERT INTO `log` VALUES ('3546', null, '2016-05-13 16:31:25', null, 'Windows 7', 'Firefox 4', '119.97.231.227', null, null, null, null);
INSERT INTO `log` VALUES ('3547', null, '2016-05-13 16:32:35', null, 'Windows 7', 'Chrome', '183.62.60.90', null, null, null, null);
INSERT INTO `log` VALUES ('3548', null, '2016-05-13 16:32:37', null, 'Windows 7', 'Chrome', '183.62.60.90', null, null, null, null);
INSERT INTO `log` VALUES ('3549', null, '2016-05-13 16:35:00', null, 'Windows 7', 'Chrome', '222.175.157.234', null, null, null, null);
INSERT INTO `log` VALUES ('3550', null, '2016-05-13 16:37:26', null, 'Windows 7', 'Chrome', '222.175.157.234', null, null, null, null);
INSERT INTO `log` VALUES ('3551', null, '2016-05-13 16:37:30', null, 'Mac OS X (iPhone)', 'Apple WebKit', '223.104.5.237', null, null, null, null);
INSERT INTO `log` VALUES ('3552', null, '2016-05-13 16:38:05', null, 'Windows 7', 'Chrome', '219.143.91.46', null, null, null, null);
INSERT INTO `log` VALUES ('3553', null, '2016-05-13 16:38:15', null, 'Windows 7', 'Chrome', '183.203.201.66', null, null, null, null);
INSERT INTO `log` VALUES ('3554', null, '2016-05-13 16:38:56', null, 'Windows Vista', 'Chrome', '124.207.147.186', null, null, null, null);
INSERT INTO `log` VALUES ('3555', null, '2016-05-13 16:39:46', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3556', null, '2016-05-13 16:39:58', null, 'Windows 7', 'Chrome', '183.203.201.66', null, null, null, null);
INSERT INTO `log` VALUES ('3557', null, '2016-05-13 16:40:12', null, 'Windows 7', 'Chrome', '219.143.91.46', null, null, null, null);
INSERT INTO `log` VALUES ('3558', null, '2016-05-13 16:41:13', null, 'Mac OS X', 'Chrome', '118.193.218.119', null, null, null, null);
INSERT INTO `log` VALUES ('3559', null, '2016-05-13 16:41:14', null, 'Windows 7', 'Chrome', '58.218.250.42', null, null, null, null);
INSERT INTO `log` VALUES ('3560', null, '2016-05-13 16:41:49', null, 'Windows 7', 'Chrome', '61.135.194.168', null, null, null, null);
INSERT INTO `log` VALUES ('3561', null, '2016-05-13 16:51:39', null, 'Windows 7', 'Chrome', '27.210.211.39', null, null, null, null);
INSERT INTO `log` VALUES ('3562', null, '2016-05-13 16:51:40', null, 'Windows', 'Chrome', '124.114.130.114', null, null, null, null);
INSERT INTO `log` VALUES ('3563', null, '2016-05-13 16:51:44', null, 'Windows', 'Chrome', '218.17.162.137', null, null, null, null);
INSERT INTO `log` VALUES ('3564', null, '2016-05-13 16:55:28', null, 'Windows 7', 'Chrome', '58.220.197.198', null, null, null, null);
INSERT INTO `log` VALUES ('3565', null, '2016-05-13 16:56:36', null, 'Windows Vista', 'Chrome', '121.14.104.61', null, null, null, null);
INSERT INTO `log` VALUES ('3566', null, '2016-05-13 16:56:46', null, 'Windows 7', 'Chrome', '58.220.197.198', null, null, null, null);
INSERT INTO `log` VALUES ('3567', null, '2016-05-13 16:56:55', null, 'Windows', 'Chrome', '222.211.172.191', null, null, null, null);
INSERT INTO `log` VALUES ('3568', null, '2016-05-13 16:57:00', null, 'Windows', 'Chrome', '222.211.172.191', null, null, null, null);
INSERT INTO `log` VALUES ('3569', null, '2016-05-13 21:28:43', null, 'Mac OS X', 'Chrome', '106.37.28.138', null, null, null, null);
INSERT INTO `log` VALUES ('3570', null, '2016-05-13 21:31:39', null, 'Windows 7', 'Chrome', '117.114.129.167', null, null, null, null);
INSERT INTO `log` VALUES ('3571', null, '2016-05-13 21:33:27', null, 'Windows', 'Firefox 4', '183.216.3.47', null, null, null, null);
INSERT INTO `log` VALUES ('3572', null, '2016-05-13 21:36:14', null, 'Mac OS X (iPhone)', 'Mobile Safari', '106.37.28.138', null, null, null, null);
INSERT INTO `log` VALUES ('3573', null, '2016-05-13 21:45:42', null, 'Windows 7', 'Chrome 27', '110.184.66.199', null, null, null, null);
INSERT INTO `log` VALUES ('3574', null, '2016-05-13 21:55:27', null, 'Mac OS X', 'Chrome', '14.18.62.99', null, null, null, null);
INSERT INTO `log` VALUES ('3575', null, '2016-05-13 22:14:21', null, 'Mac OS X', 'Chrome', '14.18.62.99', null, null, null, null);
INSERT INTO `log` VALUES ('3576', null, '2016-05-13 22:28:07', null, 'Windows', 'Chrome', '115.194.42.153', null, null, null, null);
INSERT INTO `log` VALUES ('3577', null, '2016-05-13 22:39:39', null, 'Windows 7', 'Chrome', '58.62.103.92', null, null, null, null);
INSERT INTO `log` VALUES ('3578', null, '2016-05-13 22:40:26', null, 'Mac OS X', 'Chrome', '106.37.28.138', null, null, null, null);
INSERT INTO `log` VALUES ('3579', null, '2016-05-13 22:40:54', null, 'Windows 7', 'Chrome', '58.62.103.92', null, null, null, null);
INSERT INTO `log` VALUES ('3580', null, '2016-05-13 22:42:13', null, 'Android', 'Chrome', '223.104.11.118', null, null, null, null);
INSERT INTO `log` VALUES ('3581', null, '2016-05-13 22:50:59', null, 'Windows 7', 'Chrome', '112.9.242.157', null, null, null, null);
INSERT INTO `log` VALUES ('3582', null, '2016-05-13 22:53:28', null, 'Mac OS X', 'Chrome', '106.37.28.138', null, null, null, null);
INSERT INTO `log` VALUES ('3583', null, '2016-05-13 23:05:48', null, 'Windows', 'Firefox 4', '222.204.1.6', null, null, null, null);
INSERT INTO `log` VALUES ('3584', null, '2016-05-13 23:09:03', null, 'Windows', 'Chrome', '180.157.165.193', null, null, null, null);
INSERT INTO `log` VALUES ('3585', null, '2016-05-13 23:09:58', null, 'Windows 7', 'Firefox 4', '106.92.246.28', null, null, null, null);
INSERT INTO `log` VALUES ('3586', null, '2016-05-13 23:46:05', null, 'Windows', 'Chrome', '180.157.165.193', null, null, null, null);
INSERT INTO `log` VALUES ('3587', null, '2016-05-14 00:26:50', null, 'Windows 7', 'Chrome', '220.160.51.150', null, null, null, null);
INSERT INTO `log` VALUES ('3588', null, '2016-05-14 07:50:55', null, 'Mac OS X', 'Safari', '106.37.28.146', null, null, null, null);
INSERT INTO `log` VALUES ('3589', null, '2016-05-14 08:45:12', null, 'Mac OS X', 'Chrome', '106.37.28.141', null, null, null, null);
INSERT INTO `log` VALUES ('3590', null, '2016-05-14 10:23:09', null, 'Mac OS X', 'Chrome', '106.37.28.137', null, null, null, null);
INSERT INTO `log` VALUES ('3591', null, '2016-05-14 10:24:41', null, 'Mac OS X', 'Chrome', '106.37.28.137', null, null, null, null);
INSERT INTO `log` VALUES ('3592', null, '2016-05-14 10:26:27', null, 'Mac OS X', 'Chrome', '106.37.28.137', null, null, null, null);
INSERT INTO `log` VALUES ('3593', null, '2016-05-14 10:26:39', null, 'Mac OS X', 'Chrome', '106.37.28.137', null, null, null, null);
INSERT INTO `log` VALUES ('3594', null, '2016-05-14 10:26:56', null, 'Mac OS X', 'Chrome', '106.37.28.137', null, null, null, null);
INSERT INTO `log` VALUES ('3595', null, '2016-05-14 10:30:02', null, 'Mac OS X', 'Chrome', '106.37.28.137', null, null, null, null);
INSERT INTO `log` VALUES ('3596', null, '2016-05-14 10:30:18', null, 'Mac OS X', 'Chrome', '106.37.28.137', null, null, null, null);
INSERT INTO `log` VALUES ('3597', null, '2016-05-14 10:43:32', null, 'Mac OS X', 'Chrome', '106.37.28.137', null, null, null, null);
INSERT INTO `log` VALUES ('3598', null, '2016-05-14 10:57:48', null, 'Mac OS X', 'Chrome', '106.37.28.137', null, null, null, null);
INSERT INTO `log` VALUES ('3599', null, '2016-05-14 11:08:47', null, 'Windows', 'Chrome', '112.90.231.17', null, null, null, null);
INSERT INTO `log` VALUES ('3600', null, '2016-05-14 11:11:02', null, 'Mac OS X', 'Chrome', '106.37.28.137', null, null, null, null);
INSERT INTO `log` VALUES ('3601', null, '2016-05-14 11:12:28', null, 'Windows', 'Chrome', '220.180.184.4', null, null, null, null);
INSERT INTO `log` VALUES ('3602', null, '2016-05-14 11:15:34', null, 'Windows 7', 'Chrome', '1.83.234.169', null, null, null, null);
INSERT INTO `log` VALUES ('3603', null, '2016-05-14 11:15:42', null, 'Windows 7', 'Chrome', '1.83.234.169', null, null, null, null);
INSERT INTO `log` VALUES ('3604', null, '2016-05-14 11:15:50', null, 'Windows', 'Chrome', '14.146.16.46', null, null, null, null);
INSERT INTO `log` VALUES ('3605', null, '2016-05-14 11:16:59', null, 'Windows', 'Chrome', '120.194.82.142', null, null, null, null);
INSERT INTO `log` VALUES ('3606', null, '2016-05-14 11:18:26', null, 'Windows 7', 'Chrome', '1.83.235.252', null, null, null, null);
INSERT INTO `log` VALUES ('3607', null, '2016-05-14 11:21:02', null, 'Windows', 'Firefox 4', '60.10.71.2', null, null, null, null);
INSERT INTO `log` VALUES ('3608', null, '2016-05-14 11:21:16', null, 'Windows', 'Firefox 4', '60.10.71.2', null, null, null, null);
INSERT INTO `log` VALUES ('3609', null, '2016-05-14 11:55:45', null, 'Mac OS X', 'Chrome', '106.37.28.132', null, null, null, null);
INSERT INTO `log` VALUES ('3610', null, '2016-05-14 13:25:49', null, 'Windows 7', 'Chrome', '119.7.51.166', null, null, null, null);
INSERT INTO `log` VALUES ('3611', null, '2016-05-14 16:20:46', null, 'Mac OS X', 'Chrome', '106.37.28.132', null, null, null, null);
INSERT INTO `log` VALUES ('3612', null, '2016-05-14 16:21:37', null, 'Mac OS X', 'Chrome', '106.37.28.132', null, null, null, null);
INSERT INTO `log` VALUES ('3613', null, '2016-05-14 16:21:47', null, 'Mac OS X', 'Chrome', '106.37.28.132', null, null, null, null);
INSERT INTO `log` VALUES ('3614', null, '2016-05-14 16:22:22', null, 'Mac OS X', 'Chrome', '106.37.28.132', null, null, null, null);
INSERT INTO `log` VALUES ('3615', null, '2016-05-14 17:30:26', null, 'Mac OS X (iPhone)', 'Mobile Safari', '106.37.28.136', null, null, null, null);
INSERT INTO `log` VALUES ('3616', null, '2016-05-14 17:30:59', null, 'Mac OS X (iPhone)', 'Mobile Safari', '106.37.28.136', null, null, null, null);
INSERT INTO `log` VALUES ('3617', null, '2016-05-14 20:26:07', null, 'Mac OS X', 'Chrome', '106.37.28.138', null, null, null, null);
INSERT INTO `log` VALUES ('3618', null, '2016-05-14 20:26:46', null, 'Mac OS X', 'Chrome', '106.37.28.138', null, null, null, null);
INSERT INTO `log` VALUES ('3619', null, '2016-05-15 07:08:41', null, 'Mac OS X', 'Chrome', '106.37.28.143', null, null, null, null);
INSERT INTO `log` VALUES ('3620', null, '2016-05-15 07:12:11', null, 'Mac OS X', 'Chrome', '106.37.28.143', null, null, null, null);
INSERT INTO `log` VALUES ('3621', null, '2016-05-15 07:43:53', null, 'Mac OS X', 'Safari', '106.37.28.140', null, null, null, null);
INSERT INTO `log` VALUES ('3622', null, '2016-05-15 08:15:45', null, 'Mac OS X (iPhone)', 'Apple WebKit', '121.32.9.72', null, null, null, null);
INSERT INTO `log` VALUES ('3623', null, '2016-05-15 08:22:08', null, 'Mac OS X', 'Safari', '106.37.28.132', null, null, null, null);
INSERT INTO `log` VALUES ('3624', null, '2016-05-15 08:22:35', null, 'Mac OS X', 'Safari', '106.37.28.132', null, null, null, null);
INSERT INTO `log` VALUES ('3625', null, '2016-05-15 08:25:03', null, 'Mac OS X', 'Safari', '106.37.28.132', null, null, null, null);
INSERT INTO `log` VALUES ('3626', null, '2016-05-15 13:46:48', null, 'Windows', 'Firefox 4', '123.118.218.122', null, null, null, null);
INSERT INTO `log` VALUES ('3627', null, '2016-05-15 16:39:34', null, 'Mac OS X', 'Chrome', '106.37.28.132', null, null, null, null);
INSERT INTO `log` VALUES ('3628', null, '2016-05-15 16:39:53', null, 'Mac OS X', 'Chrome', '106.37.28.132', null, null, null, null);
INSERT INTO `log` VALUES ('3629', null, '2016-05-15 16:47:42', null, 'Windows 7', 'Chrome', '182.201.234.225', null, null, null, null);
INSERT INTO `log` VALUES ('3630', null, '2016-05-15 16:48:13', null, 'Windows 7', 'Firefox 4', '182.201.234.225', null, null, null, null);
INSERT INTO `log` VALUES ('3631', null, '2016-05-15 19:27:43', null, 'Mac OS X', 'Chrome', '58.251.73.230', null, null, null, null);
INSERT INTO `log` VALUES ('3632', null, '2016-05-15 19:28:23', null, 'Windows 7', 'Chrome', '116.234.96.35', null, null, null, null);
INSERT INTO `log` VALUES ('3633', null, '2016-05-15 19:28:59', null, 'Windows 7', 'Chrome', '116.234.96.35', null, null, null, null);
INSERT INTO `log` VALUES ('3634', null, '2016-05-15 19:29:13', null, 'Windows 7', 'Chrome', '116.234.96.35', null, null, null, null);
INSERT INTO `log` VALUES ('3635', null, '2016-05-15 19:31:47', null, 'Windows 7', 'Chrome', '116.234.96.35', null, null, null, null);
INSERT INTO `log` VALUES ('3636', null, '2016-05-15 20:13:56', null, 'Windows 7', 'Chrome', '210.32.120.103', null, null, null, null);
INSERT INTO `log` VALUES ('3637', null, '2016-05-15 23:00:05', null, 'Android', 'Chrome', '39.82.125.150', null, null, null, null);
INSERT INTO `log` VALUES ('3638', null, '2016-05-15 23:02:06', null, 'Windows 7', 'Chrome', '39.82.125.150', null, null, null, null);
INSERT INTO `log` VALUES ('3639', null, '2016-05-15 23:04:16', null, 'Windows 7', 'Chrome', '39.82.125.150', null, null, null, null);
INSERT INTO `log` VALUES ('3640', null, '2016-05-16 00:54:12', null, 'Android', 'Chrome', '140.243.45.37', null, null, null, null);
INSERT INTO `log` VALUES ('3641', null, '2016-05-16 09:12:33', null, 'Windows 7', 'Firefox 4', '36.110.29.50', null, null, null, null);
INSERT INTO `log` VALUES ('3642', null, '2016-05-16 09:26:35', null, 'Windows 7', 'Firefox 4', '36.110.29.50', null, null, null, null);
INSERT INTO `log` VALUES ('3643', null, '2016-05-16 09:26:46', null, 'Windows 7', 'Firefox 4', '36.110.29.50', null, null, null, null);
INSERT INTO `log` VALUES ('3644', null, '2016-05-16 09:35:55', null, 'Windows 7', 'Chrome', '120.52.24.20', null, null, null, null);
INSERT INTO `log` VALUES ('3645', null, '2016-05-16 09:42:13', null, 'Windows Vista', 'Chrome', '218.93.112.174', null, null, null, null);
INSERT INTO `log` VALUES ('3646', null, '2016-05-16 09:56:52', null, 'Windows 7', 'Chrome', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('3647', null, '2016-05-16 10:14:48', null, 'Windows 7', 'Chrome', '120.52.24.20', null, null, null, null);
INSERT INTO `log` VALUES ('3648', null, '2016-05-16 10:15:14', null, 'Windows 7', 'Chrome', '120.52.24.20', null, null, null, null);
INSERT INTO `log` VALUES ('3649', null, '2016-05-16 10:15:50', null, 'Windows 7', 'Chrome', '202.85.220.38', null, null, null, null);
INSERT INTO `log` VALUES ('3650', null, '2016-05-16 10:16:16', null, 'Windows 7', 'Chrome', '202.85.220.38', null, null, null, null);
INSERT INTO `log` VALUES ('3651', null, '2016-05-16 10:16:25', null, 'Windows 7', 'Chrome', '202.85.220.38', null, null, null, null);
INSERT INTO `log` VALUES ('3652', null, '2016-05-16 10:27:24', null, 'Windows 7', 'Chrome', '114.242.234.214', null, null, null, null);
INSERT INTO `log` VALUES ('3653', null, '2016-05-16 11:15:12', null, 'Windows 7', 'Firefox 4', '59.46.172.210', null, null, null, null);
INSERT INTO `log` VALUES ('3654', null, '2016-05-16 11:15:14', null, 'Windows 7', 'Firefox 4', '59.46.172.210', null, null, null, null);
INSERT INTO `log` VALUES ('3655', null, '2016-05-16 11:37:23', null, 'Windows', 'Chrome', '182.46.1.231', null, null, null, null);
INSERT INTO `log` VALUES ('3656', null, '2016-05-16 11:37:30', null, 'Windows', 'Chrome', '182.46.1.231', null, null, null, null);
INSERT INTO `log` VALUES ('3657', null, '2016-05-16 11:42:24', null, 'Windows', 'Chrome', '182.46.1.231', null, null, null, null);
INSERT INTO `log` VALUES ('3658', null, '2016-05-16 11:42:29', null, 'Windows', 'Chrome', '182.46.1.231', null, null, null, null);
INSERT INTO `log` VALUES ('3659', null, '2016-05-16 14:42:15', null, 'Windows 7', 'Chrome', '101.81.49.159', null, null, null, null);
INSERT INTO `log` VALUES ('3660', null, '2016-05-16 15:10:33', null, 'Windows 7', 'Chrome', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3661', null, '2016-05-16 15:11:28', null, 'Windows 7', 'Chrome', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3662', null, '2016-05-16 15:11:51', null, 'Windows 7', 'Chrome', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3663', null, '2016-05-16 15:14:02', null, 'Windows 7', 'Chrome', '124.42.13.235', null, null, null, null);
INSERT INTO `log` VALUES ('3664', null, '2016-05-16 15:48:11', null, 'Windows 7', 'Chrome', '101.81.49.159', null, null, null, null);
INSERT INTO `log` VALUES ('3665', null, '2016-05-16 16:41:01', null, 'Windows 7', 'Chrome', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3666', null, '2016-05-16 16:54:20', null, 'Windows 7', 'Chrome', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3667', null, '2016-05-16 17:09:32', null, 'Windows 7', 'Chrome', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3668', null, '2016-05-16 17:55:05', null, 'Windows 7', 'Chrome', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3669', null, '2016-05-16 18:40:56', null, 'Windows 7', 'Chrome 47', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3670', null, '2016-05-16 18:42:05', null, 'Windows 7', 'Chrome 45', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3671', null, '2016-05-16 18:42:15', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3672', null, '2016-05-16 18:42:24', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3673', null, '2016-05-16 18:42:32', null, 'Windows 7', 'Internet Explorer 7', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3674', null, '2016-05-16 18:42:39', null, 'Windows 7', 'Internet Explorer 7', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3675', null, '2016-05-16 18:43:06', null, 'Windows 7', 'Chrome 45', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3676', null, '2016-05-16 18:43:08', null, 'Windows 10', 'Firefox', '222.204.1.6', null, null, null, null);
INSERT INTO `log` VALUES ('3677', null, '2016-05-16 18:44:51', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3678', null, '2016-05-16 18:44:59', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3679', null, '2016-05-16 18:45:39', null, 'Windows 7', 'Firefox', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3680', null, '2016-05-16 18:45:48', null, 'Windows 7', 'Firefox', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3681', null, '2016-05-16 18:47:32', null, 'Windows 7', 'Chrome 47', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3682', null, '2016-05-16 18:48:04', null, 'Windows 8.1', 'Internet Explorer 11', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('3683', null, '2016-05-16 18:49:37', null, 'Windows 7', 'Chrome 47', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3684', null, '2016-05-16 18:51:02', null, 'Windows 7', 'Chrome 47', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3685', null, '2016-05-16 18:51:08', null, 'Windows 7', 'Chrome 47', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3686', null, '2016-05-16 18:51:14', null, 'Windows 7', 'Chrome 47', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3687', null, '2016-05-16 18:53:01', null, 'Windows 7', 'Internet Explorer 11', '111.85.183.104', null, null, null, null);
INSERT INTO `log` VALUES ('3688', null, '2016-05-16 19:05:36', null, 'Windows 10', 'Chrome 49', '218.17.162.137', null, null, null, null);
INSERT INTO `log` VALUES ('3689', null, '2016-05-16 19:05:59', null, 'Windows 7', 'Chrome 45', '123.235.2.249', null, null, null, null);
INSERT INTO `log` VALUES ('3690', null, '2016-05-16 19:06:04', null, 'Windows 10', 'Chrome 47', '182.46.1.231', null, null, null, null);
INSERT INTO `log` VALUES ('3691', null, '2016-05-16 19:06:09', null, 'Windows 10', 'Firefox', '123.233.114.178', null, null, null, null);
INSERT INTO `log` VALUES ('3692', null, '2016-05-16 19:06:15', null, 'Windows 10', 'Microsoft Edge 13', '222.169.127.8', null, null, null, null);
INSERT INTO `log` VALUES ('3693', null, '2016-05-16 19:06:28', null, 'Windows 7', 'Chrome 45', '218.242.91.19', null, null, null, null);
INSERT INTO `log` VALUES ('3694', null, '2016-05-16 19:06:31', null, 'Windows 10', 'Chrome 45', '222.35.39.205', null, null, null, null);
INSERT INTO `log` VALUES ('3695', null, '2016-05-16 19:06:51', null, 'Windows 10', 'Chrome 47', '116.23.230.18', null, null, null, null);
INSERT INTO `log` VALUES ('3696', null, '2016-05-16 19:06:58', null, 'iOS 9 (iPhone)', 'Apple WebKit', '223.104.1.253', null, null, null, null);
INSERT INTO `log` VALUES ('3697', null, '2016-05-16 19:06:59', null, 'Android 6.x', 'Chrome 37', '223.104.3.198', null, null, null, null);
INSERT INTO `log` VALUES ('3698', null, '2016-05-16 19:07:08', null, 'Windows 7', 'Chrome 31', '171.117.51.179', null, null, null, null);
INSERT INTO `log` VALUES ('3699', null, '2016-05-16 19:08:02', null, 'Windows 10', 'Chrome 45', '124.205.63.7', null, null, null, null);
INSERT INTO `log` VALUES ('3700', null, '2016-05-16 19:08:22', null, 'Windows 10', 'Chrome 45', '124.205.63.7', null, null, null, null);
INSERT INTO `log` VALUES ('3701', null, '2016-05-16 19:09:35', null, 'Windows 7', 'Chrome 47', '114.83.86.91', null, null, null, null);
INSERT INTO `log` VALUES ('3702', null, '2016-05-16 19:09:43', null, 'Windows 8.1', 'Internet Explorer 11', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('3703', null, '2016-05-16 19:10:26', null, 'Windows 7', 'Chrome', '114.111.167.123', null, null, null, null);
INSERT INTO `log` VALUES ('3704', null, '2016-05-16 19:11:58', null, 'Windows 7', 'Chrome', '114.111.167.123', null, null, null, null);
INSERT INTO `log` VALUES ('3705', null, '2016-05-16 19:15:52', null, 'Windows 10', 'Chrome 47', '116.23.230.18', null, null, null, null);
INSERT INTO `log` VALUES ('3706', null, '2016-05-16 19:17:05', null, 'Windows 7', 'Chrome', '114.111.167.123', null, null, null, null);
INSERT INTO `log` VALUES ('3707', null, '2016-05-16 19:29:47', null, 'Windows 10', 'Chrome 47', '116.23.230.18', null, null, null, null);
INSERT INTO `log` VALUES ('3708', null, '2016-05-16 20:17:00', null, 'Windows 7', 'Chrome 47', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3709', null, '2016-05-16 20:18:32', null, 'iOS 9 (iPhone)', 'Apple WebKit', '223.104.33.97', null, null, null, null);
INSERT INTO `log` VALUES ('3710', null, '2016-05-16 20:21:41', null, 'Windows 10', 'Chrome 47', '182.46.1.231', null, null, null, null);
INSERT INTO `log` VALUES ('3711', null, '2016-05-16 20:22:34', null, 'Android 5.x', 'Chrome 37', '115.220.50.242', null, null, null, null);
INSERT INTO `log` VALUES ('3712', null, '2016-05-16 20:32:58', null, 'Windows 7', 'Chrome 47', '183.128.158.66', null, null, null, null);
INSERT INTO `log` VALUES ('3713', null, '2016-05-16 20:33:16', null, 'Windows 8.1', 'Chrome 45', '219.142.236.39', null, null, null, null);
INSERT INTO `log` VALUES ('3714', null, '2016-05-16 20:34:59', null, 'Mac OS X', 'Chrome', '106.37.236.228', null, null, null, null);
INSERT INTO `log` VALUES ('3715', null, '2016-05-16 20:35:30', null, 'Windows 10', 'Chrome 47', '182.96.183.85', null, null, null, null);
INSERT INTO `log` VALUES ('3716', null, '2016-05-16 20:37:30', null, 'Windows 10', 'Chrome 47', '117.83.150.193', null, null, null, null);
INSERT INTO `log` VALUES ('3717', null, '2016-05-16 20:37:36', null, 'Windows 10', 'Chrome 47', '117.83.150.193', null, null, null, null);
INSERT INTO `log` VALUES ('3718', null, '2016-05-16 20:40:06', null, 'Android 4.x', 'Chrome 37', '183.206.175.31', null, null, null, null);
INSERT INTO `log` VALUES ('3719', null, '2016-05-16 20:43:11', null, 'iOS 7 (iPhone)', 'Apple WebKit', '1.204.144.3', null, null, null, null);
INSERT INTO `log` VALUES ('3720', null, '2016-05-16 20:43:38', null, 'Windows 10', 'Chrome 49', '101.229.234.26', null, null, null, null);
INSERT INTO `log` VALUES ('3721', null, '2016-05-16 20:44:25', null, 'iOS 9 (iPhone)', 'Apple WebKit', '223.104.9.89', null, null, null, null);
INSERT INTO `log` VALUES ('3722', null, '2016-05-16 20:47:17', null, 'Android 6.x', 'Chrome Mobile', '112.96.161.153', null, null, null, null);
INSERT INTO `log` VALUES ('3723', null, '2016-05-16 20:47:53', null, 'Windows 8.1', 'Chrome', '120.194.43.164', null, null, null, null);
INSERT INTO `log` VALUES ('3724', null, '2016-05-16 20:48:11', null, 'Android 4.x', 'Chrome Mobile', '117.136.38.195', null, null, null, null);
INSERT INTO `log` VALUES ('3725', null, '2016-05-16 20:48:14', null, 'Android 4.x', 'Chrome 37', '10.192.31.88', null, null, null, null);
INSERT INTO `log` VALUES ('3726', null, '2016-05-16 20:48:37', null, 'Windows 10', 'Chrome 49', '119.129.122.120', null, null, null, null);
INSERT INTO `log` VALUES ('3727', null, '2016-05-16 20:49:09', null, 'Windows 10', 'Chrome 49', '119.129.121.19', null, null, null, null);
INSERT INTO `log` VALUES ('3728', null, '2016-05-16 20:49:10', null, 'Mac OS X', 'Safari 9', '117.114.129.167', null, null, null, null);
INSERT INTO `log` VALUES ('3729', null, '2016-05-16 20:49:43', null, 'Mac OS X', 'Safari 9', '117.114.129.167', null, null, null, null);
INSERT INTO `log` VALUES ('3730', null, '2016-05-16 20:49:47', null, 'Android 6.x', 'Mobile Safari', '112.96.161.153', null, null, null, null);
INSERT INTO `log` VALUES ('3731', null, '2016-05-16 20:51:01', null, 'Android 4.x', 'Chrome 37', '10.192.31.88', null, null, null, null);
INSERT INTO `log` VALUES ('3732', null, '2016-05-16 20:52:18', null, 'Windows 10', 'Chrome 49', '119.129.123.37', null, null, null, null);
INSERT INTO `log` VALUES ('3733', null, '2016-05-16 20:55:21', null, 'iOS 9 (iPhone)', 'Apple WebKit', '61.141.233.35', null, null, null, null);
INSERT INTO `log` VALUES ('3734', null, '2016-05-16 20:57:43', null, 'Windows XP', 'Chrome 48', '124.126.233.88', null, null, null, null);
INSERT INTO `log` VALUES ('3735', null, '2016-05-16 20:59:52', null, 'Windows 7', 'Chrome 47', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3736', null, '2016-05-16 21:16:01', null, 'Windows 7', 'Chrome 42', '111.201.201.123', null, null, null, null);
INSERT INTO `log` VALUES ('3737', null, '2016-05-16 21:25:16', null, 'Windows 10', 'Microsoft Edge 13', '113.250.249.144', null, null, null, null);
INSERT INTO `log` VALUES ('3738', null, '2016-05-16 21:41:37', null, 'Windows 10', 'Firefox', '222.204.1.6', null, null, null, null);
INSERT INTO `log` VALUES ('3739', null, '2016-05-16 22:07:32', null, 'iOS 9 (iPhone)', 'Apple WebKit', '118.212.150.191', null, null, null, null);
INSERT INTO `log` VALUES ('3740', null, '2016-05-16 22:07:49', null, 'Mac OS X', 'Safari 9', '60.166.227.88', null, null, null, null);
INSERT INTO `log` VALUES ('3741', null, '2016-05-16 22:11:26', null, 'Windows 7', 'Chrome 45', '118.212.150.191', null, null, null, null);
INSERT INTO `log` VALUES ('3742', null, '2016-05-16 22:11:40', null, 'Windows 7', 'Chrome 45', '118.212.150.191', null, null, null, null);
INSERT INTO `log` VALUES ('3743', null, '2016-05-16 22:23:25', null, 'Windows 7', 'Chrome 47', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3744', null, '2016-05-16 23:26:41', null, 'Android 5.x', 'Mobile Safari', '112.64.61.53', null, null, null, null);
INSERT INTO `log` VALUES ('3745', null, '2016-05-16 23:43:10', null, 'Windows 7', 'Chrome 47', '114.83.86.91', null, null, null, null);
INSERT INTO `log` VALUES ('3746', null, '2016-05-16 23:45:06', null, 'Windows 7', 'Chrome 47', '114.83.86.91', null, null, null, null);
INSERT INTO `log` VALUES ('3747', null, '2016-05-16 23:57:15', null, 'Windows 7', 'Chrome 31', '1.27.90.220', null, null, null, null);
INSERT INTO `log` VALUES ('3748', null, '2016-05-16 23:58:53', null, 'Android 4.x', 'Chrome 37', '61.149.241.195', null, null, null, null);
INSERT INTO `log` VALUES ('3749', null, '2016-05-17 07:03:04', null, 'Windows 7', 'Chrome 38', '111.132.235.219', null, null, null, null);
INSERT INTO `log` VALUES ('3750', null, '2016-05-17 07:38:07', null, 'Windows 7', 'Firefox', '124.65.129.74', null, null, null, null);
INSERT INTO `log` VALUES ('3751', null, '2016-05-17 08:02:53', null, 'Windows 10', 'Firefox', '121.12.144.242', null, null, null, null);
INSERT INTO `log` VALUES ('3752', null, '2016-05-17 08:58:07', null, 'Windows 7', 'Chrome 38', '111.203.167.14', null, null, null, null);
INSERT INTO `log` VALUES ('3753', null, '2016-05-17 09:46:13', null, 'Windows 7', 'Chrome 47', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3754', null, '2016-05-17 09:48:53', null, 'Windows 7', 'Chrome 47', '120.52.24.24', null, null, null, null);
INSERT INTO `log` VALUES ('3755', null, '2016-05-17 10:42:46', null, 'Windows 7', 'Chrome 45', '58.61.82.11', null, null, null, null);
INSERT INTO `log` VALUES ('3756', null, '2016-05-17 10:56:58', null, 'Windows 10', 'Chrome 45', '111.203.45.2', null, null, null, null);
INSERT INTO `log` VALUES ('3757', null, '2016-05-17 11:01:54', null, 'Windows 7', 'Chrome 49', '114.242.234.214', null, null, null, null);
INSERT INTO `log` VALUES ('3767', null, '2016-05-17 12:49:05', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3768', null, '2016-05-17 12:53:52', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3769', null, '2016-05-17 12:54:33', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3770', null, '2016-05-17 12:59:44', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3771', null, '2016-05-17 13:00:23', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3772', null, '2016-05-17 13:00:25', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3773', null, '2016-05-17 13:00:41', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3774', null, '2016-05-17 13:01:06', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3775', null, '2016-05-17 13:07:06', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3776', null, '2016-05-17 13:08:59', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3777', null, '2016-05-17 13:10:37', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3778', null, '2016-05-17 13:11:23', null, 'Windows 10', 'Internet Explorer 7', '221.4.34.17', null, null, null, null);
INSERT INTO `log` VALUES ('3779', null, '2016-05-17 13:11:23', null, 'Windows 7', 'Internet Explorer 7', '182.200.43.230', null, null, null, null);
INSERT INTO `log` VALUES ('3780', null, '2016-05-17 13:12:20', null, 'Windows 10', 'Internet Explorer 7', '221.4.34.17', null, null, null, null);
INSERT INTO `log` VALUES ('3781', null, '2016-05-17 13:12:28', null, 'Windows 10', 'Firefox', '222.204.1.6', null, null, null, null);
INSERT INTO `log` VALUES ('3782', null, '2016-05-17 13:13:30', null, 'Windows 10', 'Internet Explorer 7', '221.4.34.17', null, null, null, null);
INSERT INTO `log` VALUES ('3783', null, '2016-05-17 13:14:25', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3784', null, '2016-05-17 13:17:15', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3785', null, '2016-05-17 13:18:08', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3786', null, '2016-05-17 13:18:21', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3787', null, '2016-05-17 13:18:21', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3788', null, '2016-05-17 13:20:45', null, 'Windows 7', 'Chrome 47', '221.194.176.10', null, null, null, null);
INSERT INTO `log` VALUES ('3789', null, '2016-05-17 13:21:29', null, 'Windows 7', 'Internet Explorer 7', '182.200.43.230', null, null, null, null);
INSERT INTO `log` VALUES ('3790', null, '2016-05-17 13:50:04', null, 'Windows 7', 'Chrome 45', '182.200.43.230', null, null, null, null);
INSERT INTO `log` VALUES ('3792', null, '2016-05-17 20:54:16', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('3793', null, '2016-05-17 20:54:46', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('3794', null, '2016-05-17 22:08:32', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('3839', null, '2016-05-17 23:22:41', null, 'Windows 7', 'Chrome 47', '101.200.130.153', null, null, null, null);
INSERT INTO `log` VALUES ('3840', null, '2016-05-17 23:22:46', null, 'Windows 7', 'Chrome 47', '101.200.130.153', null, null, null, null);
INSERT INTO `log` VALUES ('3841', null, '2016-05-17 23:26:54', null, 'Windows 10', 'Chrome 47', '101.200.130.153', null, null, null, null);
INSERT INTO `log` VALUES ('3842', null, '2016-05-17 23:39:12', null, 'Windows 7', 'Chrome 47', '101.200.130.153', null, null, null, null);
INSERT INTO `log` VALUES ('3843', null, '2016-05-17 23:39:18', null, 'Windows 7', 'Chrome 47', '101.200.130.153', null, null, null, null);
INSERT INTO `log` VALUES ('3844', null, '2016-05-17 23:39:21', null, 'Windows 7', 'Chrome 47', '101.200.130.153', null, null, null, null);
INSERT INTO `log` VALUES ('3845', null, '2016-05-17 23:39:23', null, 'Windows 7', 'Chrome 47', '101.200.130.153', null, null, null, null);
INSERT INTO `log` VALUES ('3846', null, '2016-05-17 23:49:21', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3847', null, '2016-05-17 23:49:26', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3848', null, '2016-05-17 23:49:28', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3849', null, '2016-05-17 23:50:00', null, 'Windows 7', 'Chrome 45', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3850', null, '2016-05-18 00:11:28', null, 'Windows 7', 'Chrome 27', '110.184.69.63', null, null, null, null);
INSERT INTO `log` VALUES ('3851', null, '2016-05-18 00:13:06', null, 'Android 5.x', 'Chrome Mobile', '49.113.49.101', null, null, null, null);
INSERT INTO `log` VALUES ('3852', null, '2016-05-18 00:13:31', null, 'Android 5.x', 'Chrome Mobile', '49.113.49.101', null, null, null, null);
INSERT INTO `log` VALUES ('3853', null, '2016-05-18 00:26:52', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3854', null, '2016-05-18 00:27:02', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3855', null, '2016-05-18 00:27:24', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3856', null, '2016-05-18 00:27:26', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3857', null, '2016-05-18 00:27:28', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3858', null, '2016-05-18 00:27:39', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3859', null, '2016-05-18 00:27:42', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3860', null, '2016-05-18 00:27:54', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3861', null, '2016-05-18 00:28:00', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3862', null, '2016-05-18 00:28:01', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3863', null, '2016-05-18 00:28:05', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3864', null, '2016-05-18 00:28:07', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3865', null, '2016-05-18 00:33:52', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3866', null, '2016-05-18 00:33:53', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3867', null, '2016-05-18 00:34:00', null, 'Windows 10', 'Chrome 47', '119.130.190.57', null, null, null, null);
INSERT INTO `log` VALUES ('3868', null, '2016-05-18 00:34:10', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3869', null, '2016-05-18 00:34:29', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3870', null, '2016-05-18 00:34:46', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3871', null, '2016-05-18 00:35:05', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3872', null, '2016-05-18 00:35:14', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3873', null, '2016-05-18 00:35:27', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3874', null, '2016-05-18 00:39:52', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3875', null, '2016-05-18 00:40:08', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3876', null, '2016-05-18 00:40:20', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3877', null, '2016-05-18 00:40:25', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3878', null, '2016-05-18 00:40:33', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3879', null, '2016-05-18 00:40:40', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3880', null, '2016-05-18 00:40:45', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3881', null, '2016-05-18 00:40:58', null, 'Windows 7', 'Chrome 45', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3882', null, '2016-05-18 00:41:07', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3883', null, '2016-05-18 00:41:22', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3884', null, '2016-05-18 00:41:39', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3885', null, '2016-05-18 00:42:17', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3886', null, '2016-05-18 00:42:25', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3887', null, '2016-05-18 00:42:28', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3888', null, '2016-05-18 00:42:30', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3889', null, '2016-05-18 00:42:34', null, 'Windows 7', 'Chrome 45', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3890', null, '2016-05-18 00:42:36', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3891', null, '2016-05-18 00:42:37', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3892', null, '2016-05-18 00:42:40', null, 'Windows 7', 'Chrome 45', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3893', null, '2016-05-18 00:42:41', null, 'Windows 7', 'Chrome 45', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3894', null, '2016-05-18 00:42:42', null, 'Windows 7', 'Chrome 45', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3895', null, '2016-05-18 00:42:43', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3896', null, '2016-05-18 00:42:44', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3897', null, '2016-05-18 00:42:49', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3898', null, '2016-05-18 00:42:50', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3899', null, '2016-05-18 00:42:51', null, 'Windows 7', 'Chrome 45', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3900', null, '2016-05-18 00:42:54', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3901', null, '2016-05-18 00:43:00', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3902', null, '2016-05-18 00:43:22', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3903', null, '2016-05-18 00:43:30', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3904', null, '2016-05-18 00:43:31', null, 'Windows 7', 'Firefox', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3905', null, '2016-05-18 00:43:41', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3906', null, '2016-05-18 00:43:42', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3907', null, '2016-05-18 00:43:43', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3908', null, '2016-05-18 00:43:45', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3909', null, '2016-05-18 00:43:45', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3910', null, '2016-05-18 00:43:45', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3911', null, '2016-05-18 00:43:45', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3912', null, '2016-05-18 00:43:46', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3913', null, '2016-05-18 00:43:46', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3914', null, '2016-05-18 00:43:47', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3915', null, '2016-05-18 00:43:50', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3916', null, '2016-05-18 00:43:53', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3917', null, '2016-05-18 00:43:56', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3918', null, '2016-05-18 00:43:59', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3919', null, '2016-05-18 00:44:00', null, 'Windows 7', 'Internet Explorer 11', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3920', null, '2016-05-18 00:44:01', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3921', null, '2016-05-18 00:49:15', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3922', null, '2016-05-18 00:49:16', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3923', null, '2016-05-18 00:49:34', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3924', null, '2016-05-18 00:49:45', null, 'Windows 7', 'Chrome 47', '120.52.24.18', null, null, null, null);
INSERT INTO `log` VALUES ('3925', null, '2016-05-18 02:22:36', null, 'Windows 10', 'Chrome 38', '112.5.168.135', null, null, null, null);
INSERT INTO `log` VALUES ('3926', null, '2016-05-18 09:08:05', null, 'Windows 8', 'Chrome 46', '222.178.189.51', null, null, null, null);
INSERT INTO `log` VALUES ('3927', null, '2016-05-18 09:09:37', null, 'Windows 8', 'Chrome 46', '222.178.189.51', null, null, null, null);
INSERT INTO `log` VALUES ('3928', null, '2016-05-18 09:30:27', null, 'Windows 8.1', 'Internet Explorer 11', '218.93.112.174', null, null, null, null);
INSERT INTO `log` VALUES ('3929', null, '2016-05-18 09:34:14', null, 'Windows 8.1', 'Internet Explorer 11', '218.93.112.174', null, null, null, null);
INSERT INTO `log` VALUES ('3930', null, '2016-05-18 09:35:10', null, 'Windows 8.1', 'Chrome 31', '218.93.112.174', null, null, null, null);
INSERT INTO `log` VALUES ('3931', null, '2016-05-18 09:38:36', null, 'Windows 8.1', 'Chrome 31', '218.93.112.174', null, null, null, null);
INSERT INTO `log` VALUES ('3932', null, '2016-05-18 09:38:38', null, 'Windows 8.1', 'Chrome 31', '218.93.112.174', null, null, null, null);
INSERT INTO `log` VALUES ('3933', null, '2016-05-18 09:38:40', null, 'Windows 8.1', 'Chrome 31', '218.93.112.174', null, null, null, null);
INSERT INTO `log` VALUES ('3934', null, '2016-05-18 09:40:59', null, 'Windows 8.1', 'Chrome 31', '218.93.112.174', null, null, null, null);
INSERT INTO `log` VALUES ('3935', null, '2016-05-18 10:13:24', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3936', null, '2016-05-18 10:14:20', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3937', null, '2016-05-18 10:14:21', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3938', null, '2016-05-18 10:14:23', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3939', null, '2016-05-18 10:14:24', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3940', null, '2016-05-18 10:14:28', null, 'Windows 10', 'Chrome 47', '222.210.167.153', null, null, null, null);
INSERT INTO `log` VALUES ('3941', null, '2016-05-18 10:14:28', null, 'Windows 8.1', 'Chrome 31', '218.93.112.174', null, null, null, null);
INSERT INTO `log` VALUES ('3942', null, '2016-05-18 10:14:28', null, 'Windows 10', 'Chrome 47', '182.46.1.231', null, null, null, null);
INSERT INTO `log` VALUES ('3943', null, '2016-05-18 10:14:30', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3944', null, '2016-05-18 10:14:32', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3945', null, '2016-05-18 10:14:33', null, 'Windows 8.1', 'Chrome 45', '59.40.0.154', null, null, null, null);
INSERT INTO `log` VALUES ('3946', null, '2016-05-18 10:14:33', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3947', null, '2016-05-18 10:14:42', null, 'Windows 7', 'Chrome 47', '180.166.7.106', null, null, null, null);
INSERT INTO `log` VALUES ('3948', null, '2016-05-18 10:14:49', null, 'Windows 7', 'Chrome 49', '60.216.4.154', null, null, null, null);
INSERT INTO `log` VALUES ('3949', null, '2016-05-18 10:14:49', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3950', null, '2016-05-18 10:14:52', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3951', null, '2016-05-18 10:15:04', null, 'Windows 10', 'Chrome 38', '202.100.6.64', null, null, null, null);
INSERT INTO `log` VALUES ('3952', null, '2016-05-18 10:15:04', null, 'Windows 7', 'Internet Explorer 11', '111.206.28.18', null, null, null, null);
INSERT INTO `log` VALUES ('3953', null, '2016-05-18 10:15:10', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3954', null, '2016-05-18 10:15:13', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3955', null, '2016-05-18 10:15:22', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3956', null, '2016-05-18 10:15:25', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3957', null, '2016-05-18 10:15:54', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3958', null, '2016-05-18 10:16:10', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3959', null, '2016-05-18 10:16:12', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3960', null, '2016-05-18 10:16:13', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3961', null, '2016-05-18 10:16:14', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3962', null, '2016-05-18 10:16:14', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3963', null, '2016-05-18 10:16:14', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3964', null, '2016-05-18 10:16:14', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3965', null, '2016-05-18 10:16:14', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3966', null, '2016-05-18 10:16:15', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3967', null, '2016-05-18 10:16:15', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3968', null, '2016-05-18 10:16:15', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3969', null, '2016-05-18 10:16:15', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3970', null, '2016-05-18 10:16:15', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3971', null, '2016-05-18 10:16:44', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3972', null, '2016-05-18 10:16:45', null, 'Windows 10', 'Chrome 47', '114.111.164.122', null, null, null, null);
INSERT INTO `log` VALUES ('3973', null, '2016-05-18 10:16:50', null, 'Windows 10', 'Chrome 49', '117.114.129.166', null, null, null, null);
INSERT INTO `log` VALUES ('3974', null, '2016-05-18 10:17:34', null, 'Windows 7', 'Chrome 45', '124.237.112.74', null, null, null, null);
INSERT INTO `log` VALUES ('3975', null, '2016-05-18 10:17:38', null, 'Windows 7', 'Chrome 45', '114.255.160.172', null, null, null, null);
INSERT INTO `log` VALUES ('3976', null, '2016-05-18 10:17:40', null, 'Windows 10', 'Chrome 47', '116.23.249.245', null, null, null, null);
INSERT INTO `log` VALUES ('3977', null, '2016-05-18 10:18:06', null, 'Windows 10', 'Chrome 45', '202.99.246.242', null, null, null, null);
INSERT INTO `log` VALUES ('3978', null, '2016-05-18 10:18:06', null, 'Windows 7', 'Chrome 47', '180.166.7.106', null, null, null, null);
INSERT INTO `log` VALUES ('3979', null, '2016-05-18 10:18:46', null, 'Windows 7', 'Chrome 45', '114.255.160.172', null, null, null, null);
INSERT INTO `log` VALUES ('3980', null, '2016-05-18 10:19:18', null, 'Android 4.x', 'Mobile Safari', '223.104.10.89', null, null, null, null);
INSERT INTO `log` VALUES ('3981', null, '2016-05-18 10:20:03', null, 'Windows 7', 'Chrome 42', '180.173.147.95', null, null, null, null);
INSERT INTO `log` VALUES ('3982', null, '2016-05-18 10:20:42', null, 'Windows 10', 'Chrome 47', '115.236.0.2', null, null, null, null);
INSERT INTO `log` VALUES ('3983', null, '2016-05-18 10:24:11', null, 'Windows 7', 'Chrome 42', '180.173.147.95', null, null, null, null);
INSERT INTO `log` VALUES ('3984', null, '2016-05-18 10:25:28', null, 'Windows 7', 'Chrome 42', '180.173.147.95', null, null, null, null);
INSERT INTO `log` VALUES ('3985', null, '2016-05-18 10:25:51', null, 'Windows 7', 'Chrome 45', '114.255.160.172', null, null, null, null);
INSERT INTO `log` VALUES ('3986', null, '2016-05-18 10:25:55', null, 'Windows 7', 'Chrome 45', '114.255.160.172', null, null, null, null);
INSERT INTO `log` VALUES ('3987', null, '2016-05-18 10:28:21', null, 'Windows 7', 'Chrome 45', '114.255.160.172', null, null, null, null);
INSERT INTO `log` VALUES ('3988', null, '2016-05-18 10:45:28', null, 'Windows 7', 'Chrome 45', '222.34.78.2', null, null, null, null);
INSERT INTO `log` VALUES ('3989', null, '2016-05-18 10:50:45', null, 'Windows 7', 'Internet Explorer 8', '211.99.143.91', null, null, null, null);
INSERT INTO `log` VALUES ('3990', null, '2016-05-18 10:51:40', null, 'Windows 7', 'Internet Explorer 8', '120.199.204.58', null, null, null, null);
INSERT INTO `log` VALUES ('3991', null, '2016-05-18 10:51:47', null, 'Windows 7', 'Internet Explorer 8', '120.199.204.58', null, null, null, null);
INSERT INTO `log` VALUES ('3992', null, '2016-05-18 10:51:50', null, 'Windows 7', 'Chrome 45', '222.34.78.2', null, null, null, null);
INSERT INTO `log` VALUES ('3993', null, '2016-05-18 10:51:59', null, 'Windows 7', 'Chrome 45', '211.99.143.91', null, null, null, null);
INSERT INTO `log` VALUES ('3994', null, '2016-05-18 10:53:13', null, 'Windows 7', 'Firefox 14', '120.199.204.58', null, null, null, null);
INSERT INTO `log` VALUES ('3995', null, '2016-05-18 10:54:11', null, 'Windows 7', 'Chrome 45', '222.34.78.2', null, null, null, null);
INSERT INTO `log` VALUES ('3996', null, '2016-05-18 13:03:12', null, 'iOS 9 (iPad)', 'Apple WebKit', '112.123.240.114', null, null, null, null);
INSERT INTO `log` VALUES ('3997', null, '2016-05-18 13:05:15', null, 'Windows 10', 'Chrome 47', '116.226.248.6', null, null, null, null);
INSERT INTO `log` VALUES ('3998', null, '2016-05-18 13:12:54', null, 'Android 4.x', 'Chrome 37', '61.156.219.211', null, null, null, null);
INSERT INTO `log` VALUES ('3999', null, '2016-05-18 13:13:10', null, 'Windows 7', 'Chrome 45', '211.103.164.18', null, null, null, null);
INSERT INTO `log` VALUES ('4000', null, '2016-05-18 13:13:25', null, 'Windows 7', 'Chrome 45', '118.251.222.245', null, null, null, null);
INSERT INTO `log` VALUES ('4001', null, '2016-05-18 13:13:27', null, 'Windows 7', 'Internet Explorer 8', '61.183.157.190', null, null, null, null);
INSERT INTO `log` VALUES ('4002', null, '2016-05-18 13:13:27', null, 'Android 5.x', 'Chrome 37', '117.136.54.24', null, null, null, null);
INSERT INTO `log` VALUES ('4003', null, '2016-05-18 13:13:40', null, 'Windows 7', 'Firefox 40', '120.237.129.78', null, null, null, null);
INSERT INTO `log` VALUES ('4004', null, '2016-05-18 13:13:40', null, 'Windows 7', 'Chrome 45', '222.191.137.143', null, null, null, null);
INSERT INTO `log` VALUES ('4005', null, '2016-05-18 13:13:50', null, 'Android 5.x', 'Mobile Safari', '221.204.207.26', null, null, null, null);
INSERT INTO `log` VALUES ('4006', null, '2016-05-18 13:13:59', null, 'Windows 7', 'Internet Explorer 9', '123.232.28.162', null, null, null, null);
INSERT INTO `log` VALUES ('4007', null, '2016-05-18 13:14:08', null, 'Windows 7', 'Chrome 48', '180.173.1.208', null, null, null, null);
INSERT INTO `log` VALUES ('4008', null, '2016-05-18 13:14:17', null, 'Windows 7', 'Chrome', '223.223.196.156', null, null, null, null);
INSERT INTO `log` VALUES ('4009', null, '2016-05-18 13:14:18', null, 'Windows 7', 'Internet Explorer 7', '180.169.57.130', null, null, null, null);
INSERT INTO `log` VALUES ('4010', null, '2016-05-18 13:14:32', null, 'Windows 7', 'Chrome 45', '220.178.85.236', null, null, null, null);
INSERT INTO `log` VALUES ('4011', null, '2016-05-18 13:14:39', null, 'Windows 7', 'Chrome 45', '125.70.177.172', null, null, null, null);
INSERT INTO `log` VALUES ('4012', null, '2016-05-18 13:14:44', null, 'Windows 10', 'Chrome 45', '120.194.82.142', null, null, null, null);
INSERT INTO `log` VALUES ('4013', null, '2016-05-18 13:14:59', null, 'Windows 7', 'Chrome 45', '211.103.164.18', null, null, null, null);
INSERT INTO `log` VALUES ('4014', null, '2016-05-18 13:15:00', null, 'Windows 8.1', 'Chrome 47', '111.206.51.176', null, null, null, null);
INSERT INTO `log` VALUES ('4015', null, '2016-05-18 13:15:02', null, 'Windows 7', 'Chrome 45', '211.103.164.18', null, null, null, null);
INSERT INTO `log` VALUES ('4016', null, '2016-05-18 13:15:03', null, 'Windows 7', 'Internet Explorer 7', '180.169.57.130', null, null, null, null);
INSERT INTO `log` VALUES ('4017', null, '2016-05-18 13:15:44', null, 'Windows 7', 'Chrome 45', '110.184.221.241', null, null, null, null);
INSERT INTO `log` VALUES ('4018', null, '2016-05-18 13:15:54', null, 'Windows 7', 'Chrome 48', '180.173.1.208', null, null, null, null);
INSERT INTO `log` VALUES ('4019', null, '2016-05-18 13:16:00', null, 'Windows 7', 'Chrome 47', '111.204.139.34', null, null, null, null);
INSERT INTO `log` VALUES ('4020', null, '2016-05-18 13:16:16', null, 'Windows 7', 'Chrome 49', '219.140.238.88', null, null, null, null);
INSERT INTO `log` VALUES ('4021', null, '2016-05-18 13:16:22', null, 'Windows 7', 'Internet Explorer 9', '123.232.28.162', null, null, null, null);
INSERT INTO `log` VALUES ('4022', null, '2016-05-18 13:16:23', null, 'Android 4.x', 'Chrome 37', '61.148.242.118', null, null, null, null);
INSERT INTO `log` VALUES ('4023', null, '2016-05-18 13:16:45', null, 'Windows 7', 'Chrome 45', '218.22.3.195', null, null, null, null);
INSERT INTO `log` VALUES ('4024', null, '2016-05-18 13:17:00', null, 'Windows 7', 'Firefox', '222.129.45.51', null, null, null, null);
INSERT INTO `log` VALUES ('4025', null, '2016-05-18 13:17:32', null, 'Windows 10', 'Chrome 47', '106.87.93.220', null, null, null, null);
INSERT INTO `log` VALUES ('4026', null, '2016-05-18 13:17:41', null, 'Windows 7', 'Chrome', '223.223.196.156', null, null, null, null);
INSERT INTO `log` VALUES ('4027', null, '2016-05-18 13:18:30', null, 'Android 5.x', 'Chrome 37', '202.99.112.183', null, null, null, null);
INSERT INTO `log` VALUES ('4028', null, '2016-05-18 13:18:46', null, 'Windows 7', 'Chrome 45', '218.22.3.195', null, null, null, null);
INSERT INTO `log` VALUES ('4029', null, '2016-05-18 13:18:56', null, 'Windows 7', 'Chrome 45', '125.70.177.172', null, null, null, null);
INSERT INTO `log` VALUES ('4030', null, '2016-05-18 13:19:00', null, 'Windows 7', 'Chrome 45', '125.70.177.172', null, null, null, null);
INSERT INTO `log` VALUES ('4031', null, '2016-05-18 13:19:03', null, 'Windows 7', 'Chrome 45', '125.70.177.172', null, null, null, null);
INSERT INTO `log` VALUES ('4032', null, '2016-05-18 13:19:05', null, 'Windows 7', 'Chrome 45', '125.70.177.172', null, null, null, null);
INSERT INTO `log` VALUES ('4033', null, '2016-05-18 13:19:17', null, 'Windows 7', 'Chrome 44', '125.70.177.113', null, null, null, null);
INSERT INTO `log` VALUES ('4034', null, '2016-05-18 13:20:01', null, 'Windows 10', 'Chrome 45', '218.205.207.166', null, null, null, null);
INSERT INTO `log` VALUES ('4035', null, '2016-05-18 13:20:03', null, 'Windows 7', 'Internet Explorer 8', '218.19.20.226', null, null, null, null);
INSERT INTO `log` VALUES ('4036', null, '2016-05-18 13:20:43', null, 'Windows 7', 'Chrome 47', '218.19.20.226', null, null, null, null);
INSERT INTO `log` VALUES ('4037', null, '2016-05-18 13:21:07', null, 'Windows 7', 'Chrome 45', '222.168.33.190', null, null, null, null);
INSERT INTO `log` VALUES ('4038', null, '2016-05-18 13:22:10', null, 'Windows 10', 'Chrome 46', '180.173.23.173', null, null, null, null);
INSERT INTO `log` VALUES ('4039', null, '2016-05-18 13:22:24', null, 'Windows 7', 'Internet Explorer 7', '101.81.49.159', null, null, null, null);
INSERT INTO `log` VALUES ('4040', null, '2016-05-18 13:22:31', null, 'Windows 10', 'Chrome 46', '180.173.23.173', null, null, null, null);
INSERT INTO `log` VALUES ('4041', null, '2016-05-18 13:23:26', null, 'Windows 7', 'Chrome 49', '101.81.49.159', null, null, null, null);
INSERT INTO `log` VALUES ('4042', null, '2016-05-18 13:23:52', null, 'Windows 7', 'Chrome 44', '125.70.177.113', null, null, null, null);
INSERT INTO `log` VALUES ('4043', null, '2016-05-18 13:24:10', null, 'Windows 7', 'Chrome 49', '114.251.179.129', null, null, null, null);
INSERT INTO `log` VALUES ('4044', null, '2016-05-18 13:24:21', null, 'Mac OS X', 'Safari 9', '220.180.239.228', null, null, null, null);
INSERT INTO `log` VALUES ('4045', null, '2016-05-18 13:24:45', null, 'Windows 10', 'Chrome 46', '180.173.23.173', null, null, null, null);
INSERT INTO `log` VALUES ('4046', null, '2016-05-18 13:25:21', null, 'Windows 7', 'Chrome 45', '182.50.115.10', null, null, null, null);
INSERT INTO `log` VALUES ('4047', null, '2016-05-18 13:25:59', null, 'Windows 10', 'Firefox', '117.158.128.35', null, null, null, null);
INSERT INTO `log` VALUES ('4048', null, '2016-05-18 13:26:22', null, 'Windows 7', 'Chrome 49', '101.81.49.159', null, null, null, null);
INSERT INTO `log` VALUES ('4049', null, '2016-05-18 13:26:47', null, 'Windows 10', 'Firefox', '117.158.128.35', null, null, null, null);
INSERT INTO `log` VALUES ('4050', null, '2016-05-18 13:27:09', null, 'Android 5.x', 'Chrome 37', '114.242.249.231', null, null, null, null);
INSERT INTO `log` VALUES ('4051', null, '2016-05-18 13:27:20', null, 'Windows 7', 'Chrome 49', '101.81.49.159', null, null, null, null);
INSERT INTO `log` VALUES ('4052', null, '2016-05-18 13:27:34', null, 'iOS 9 (iPad)', 'Apple WebKit', '115.171.76.80', null, null, null, null);
INSERT INTO `log` VALUES ('4053', null, '2016-05-18 13:27:35', null, 'Windows 7', 'Chrome 44', '124.42.13.235', null, null, null, null);
INSERT INTO `log` VALUES ('4054', null, '2016-05-18 13:27:59', null, 'Windows 7', 'Chrome 35', '117.152.113.227', null, null, null, null);
INSERT INTO `log` VALUES ('4055', null, '2016-05-18 13:30:19', null, 'Windows 10', 'Chrome', '110.184.147.42', null, null, null, null);
INSERT INTO `log` VALUES ('4056', null, '2016-05-18 13:31:02', null, 'Windows 10', 'Chrome 46', '180.173.23.173', null, null, null, null);
INSERT INTO `log` VALUES ('4057', null, '2016-05-18 13:33:23', null, 'Mac OS X', 'Safari 9', '183.15.255.93', null, null, null, null);
INSERT INTO `log` VALUES ('4058', null, '2016-05-18 13:34:28', null, 'Windows 10', 'Chrome 47', '106.87.93.220', null, null, null, null);
INSERT INTO `log` VALUES ('4059', null, '2016-05-18 13:34:29', null, 'Windows 10', 'Chrome 45', '110.249.129.14', null, null, null, null);
INSERT INTO `log` VALUES ('4060', null, '2016-05-18 13:34:30', null, 'Windows 10', 'Chrome 47', '106.87.93.220', null, null, null, null);
INSERT INTO `log` VALUES ('4061', null, '2016-05-18 13:35:28', null, 'Mac OS X', 'Safari 9', '183.15.255.93', null, null, null, null);
INSERT INTO `log` VALUES ('4062', null, '2016-05-18 13:36:08', null, 'Windows 10', 'Chrome 48', '110.186.48.157', null, null, null, null);
INSERT INTO `log` VALUES ('4063', null, '2016-05-18 13:36:19', null, 'Android 4.x', 'Chrome 37', '121.35.30.74', null, null, null, null);
INSERT INTO `log` VALUES ('4064', null, '2016-05-18 13:36:45', null, 'Windows 7', 'Chrome 49', '114.251.179.129', null, null, null, null);
INSERT INTO `log` VALUES ('4065', null, '2016-05-18 13:38:04', null, 'Android 5.x', 'Chrome 37', '112.112.222.175', null, null, null, null);
INSERT INTO `log` VALUES ('4066', null, '2016-05-18 13:38:46', null, 'Windows 8.1', 'Chrome 49', '183.7.121.132', null, null, null, null);
INSERT INTO `log` VALUES ('4067', null, '2016-05-18 13:38:48', null, 'Windows 7', 'Chrome 49', '202.104.111.51', null, null, null, null);
INSERT INTO `log` VALUES ('4068', null, '2016-05-18 13:39:32', null, 'Mac OS X', 'Chrome', '114.244.88.16', null, null, null, null);
INSERT INTO `log` VALUES ('4069', null, '2016-05-18 13:39:45', null, 'Windows 7', 'Chrome 47', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4070', null, '2016-05-18 13:39:49', null, 'Windows 7', 'Chrome', '116.228.206.84', null, null, null, null);
INSERT INTO `log` VALUES ('4071', null, '2016-05-18 13:41:07', null, 'Windows 7', 'Chrome 47', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4072', null, '2016-05-18 13:41:18', null, 'Windows 8.1', 'Chrome 49', '183.7.121.132', null, null, null, null);
INSERT INTO `log` VALUES ('4073', null, '2016-05-18 13:41:22', null, 'Windows 7', 'Chrome 45', '14.150.165.248', null, null, null, null);
INSERT INTO `log` VALUES ('4074', null, '2016-05-18 13:41:27', null, 'Mac OS X', 'Chrome', '114.244.88.16', null, null, null, null);
INSERT INTO `log` VALUES ('4075', null, '2016-05-18 13:41:33', null, 'Windows 7', 'Chrome 49', '61.144.29.106', null, null, null, null);
INSERT INTO `log` VALUES ('4076', null, '2016-05-18 13:41:46', null, 'Windows XP', 'Chrome 49', '125.120.208.219', null, null, null, null);
INSERT INTO `log` VALUES ('4077', null, '2016-05-18 13:41:55', null, 'Windows 7', 'Chrome', '116.228.206.84', null, null, null, null);
INSERT INTO `log` VALUES ('4078', null, '2016-05-18 13:41:57', null, 'Windows 7', 'Chrome 35', '117.152.113.227', null, null, null, null);
INSERT INTO `log` VALUES ('4079', null, '2016-05-18 13:42:21', null, 'Android 5.x', 'Chrome Mobile', '183.7.121.132', null, null, null, null);
INSERT INTO `log` VALUES ('4080', null, '2016-05-18 13:42:35', null, 'Windows 7', 'Chrome 49', '61.144.29.106', null, null, null, null);
INSERT INTO `log` VALUES ('4081', null, '2016-05-18 13:42:44', null, 'Windows 7', 'Chrome 31', '58.248.169.116', null, null, null, null);
INSERT INTO `log` VALUES ('4082', null, '2016-05-18 13:42:52', null, 'Windows 8.1', 'Chrome 49', '183.7.121.132', null, null, null, null);
INSERT INTO `log` VALUES ('4083', null, '2016-05-18 13:42:57', null, 'Windows XP', 'Chrome 49', '125.120.208.219', null, null, null, null);
INSERT INTO `log` VALUES ('4084', null, '2016-05-18 13:43:23', null, 'Windows 7', 'Chrome 47', '183.5.67.29', null, null, null, null);
INSERT INTO `log` VALUES ('4085', null, '2016-05-18 13:43:23', null, 'Windows 7', 'Firefox', '121.35.30.74', null, null, null, null);
INSERT INTO `log` VALUES ('4086', null, '2016-05-18 13:43:36', null, 'Windows 10', 'Chrome 45', '117.32.234.102', null, null, null, null);
INSERT INTO `log` VALUES ('4087', null, '2016-05-18 13:43:40', null, 'Windows 7', 'Firefox', '61.143.127.226', null, null, null, null);
INSERT INTO `log` VALUES ('4088', null, '2016-05-18 13:43:46', null, 'Windows 8.1', 'Chrome 49', '183.7.121.132', null, null, null, null);
INSERT INTO `log` VALUES ('4089', null, '2016-05-18 13:44:05', null, 'Windows 7', 'Chrome 49', '114.242.234.252', null, null, null, null);
INSERT INTO `log` VALUES ('4090', null, '2016-05-18 13:44:44', null, 'Windows 7', 'Firefox 44', '27.223.110.234', null, null, null, null);
INSERT INTO `log` VALUES ('4091', null, '2016-05-18 13:44:49', null, 'Windows 7', 'Firefox', '121.35.30.74', null, null, null, null);
INSERT INTO `log` VALUES ('4092', null, '2016-05-18 13:45:02', null, 'Windows 10', 'Chrome 45', '121.57.47.193', null, null, null, null);
INSERT INTO `log` VALUES ('4093', null, '2016-05-18 13:45:46', null, 'Windows 10', 'Chrome 31', '117.114.129.162', null, null, null, null);
INSERT INTO `log` VALUES ('4094', null, '2016-05-18 13:45:50', null, 'Windows 7', 'Chrome 35', '117.152.113.227', null, null, null, null);
INSERT INTO `log` VALUES ('4095', null, '2016-05-18 13:46:01', null, 'Windows 7', 'Firefox', '121.35.30.74', null, null, null, null);
INSERT INTO `log` VALUES ('4096', null, '2016-05-18 13:46:03', null, 'Windows 7', 'Chrome 45', '222.35.39.217', null, null, null, null);
INSERT INTO `log` VALUES ('4097', null, '2016-05-18 13:46:15', null, 'Windows 7', 'Internet Explorer 11', '113.116.233.1', null, null, null, null);
INSERT INTO `log` VALUES ('4098', null, '2016-05-18 13:46:21', null, 'Android 4.x', 'Chrome 37', '124.152.254.105', null, null, null, null);
INSERT INTO `log` VALUES ('4099', null, '2016-05-18 13:46:23', null, 'Windows 7', 'Firefox', '61.143.127.226', null, null, null, null);
INSERT INTO `log` VALUES ('4100', null, '2016-05-18 13:46:38', null, 'Windows 7', 'Firefox', '61.143.127.226', null, null, null, null);
INSERT INTO `log` VALUES ('4101', null, '2016-05-18 13:46:49', null, 'Windows XP', 'Chrome 49', '125.120.208.219', null, null, null, null);
INSERT INTO `log` VALUES ('4102', null, '2016-05-18 13:46:56', null, 'Windows 7', 'Chrome 47', '183.5.67.29', null, null, null, null);
INSERT INTO `log` VALUES ('4103', null, '2016-05-18 13:46:59', null, 'Windows 7', 'Chrome 35', '117.152.113.227', null, null, null, null);
INSERT INTO `log` VALUES ('4104', null, '2016-05-18 13:47:10', null, 'Windows 7', 'Chrome 47', '183.5.67.29', null, null, null, null);
INSERT INTO `log` VALUES ('4105', null, '2016-05-18 13:47:30', null, 'Windows 7', 'Firefox', '121.35.30.74', null, null, null, null);
INSERT INTO `log` VALUES ('4106', null, '2016-05-18 13:47:40', null, 'Windows 7', 'Chrome 47', '183.5.67.29', null, null, null, null);
INSERT INTO `log` VALUES ('4107', null, '2016-05-18 13:48:15', null, 'Windows 7', 'Internet Explorer 7', '106.37.16.175', null, null, null, null);
INSERT INTO `log` VALUES ('4108', null, '2016-05-18 13:48:30', null, 'Windows XP', 'Chrome 49', '125.120.208.219', null, null, null, null);
INSERT INTO `log` VALUES ('4109', null, '2016-05-18 13:49:22', null, 'Windows 7', 'Firefox', '61.143.127.226', null, null, null, null);
INSERT INTO `log` VALUES ('4110', null, '2016-05-18 13:49:35', null, 'Windows 7', 'Firefox', '121.35.30.74', null, null, null, null);
INSERT INTO `log` VALUES ('4111', null, '2016-05-18 13:50:46', null, 'Windows 7', 'Internet Explorer 7', '106.37.16.175', null, null, null, null);
INSERT INTO `log` VALUES ('4112', null, '2016-05-18 13:50:49', null, 'Windows 7', 'Internet Explorer 7', '106.37.16.175', null, null, null, null);
INSERT INTO `log` VALUES ('4113', null, '2016-05-18 13:51:18', null, 'Windows 7', 'Firefox', '121.35.30.74', null, null, null, null);
INSERT INTO `log` VALUES ('4114', null, '2016-05-18 13:51:19', null, 'Windows 10', 'Chrome', '218.18.3.240', null, null, null, null);
INSERT INTO `log` VALUES ('4115', null, '2016-05-18 13:51:29', null, 'Windows 10', 'Chrome 49', '221.232.151.67', null, null, null, null);
INSERT INTO `log` VALUES ('4116', null, '2016-05-18 13:51:55', null, 'Windows 8.1', 'Chrome 47', '124.205.39.138', null, null, null, null);
INSERT INTO `log` VALUES ('4117', null, '2016-05-18 13:52:29', null, 'Windows 10', 'Firefox', '218.1.17.170', null, null, null, null);
INSERT INTO `log` VALUES ('4118', null, '2016-05-18 13:53:08', null, 'Windows 10', 'Firefox', '218.1.17.170', null, null, null, null);
INSERT INTO `log` VALUES ('4119', null, '2016-05-18 13:53:12', null, 'Windows 7', 'Chrome 45', '59.40.74.36', null, null, null, null);
INSERT INTO `log` VALUES ('4120', null, '2016-05-18 13:53:27', null, 'Windows 8.1', 'Chrome 38', '61.51.95.246', null, null, null, null);
INSERT INTO `log` VALUES ('4121', null, '2016-05-18 13:53:27', null, 'Windows 8.1', 'Chrome', '60.12.8.226', null, null, null, null);
INSERT INTO `log` VALUES ('4122', null, '2016-05-18 13:53:44', null, 'Windows 10', 'Chrome', '218.18.3.240', null, null, null, null);
INSERT INTO `log` VALUES ('4123', null, '2016-05-18 13:57:45', null, 'Mac OS X', 'Chrome 41', '125.39.179.18', null, null, null, null);
INSERT INTO `log` VALUES ('4124', null, '2016-05-18 13:58:57', null, 'Windows 7', 'Chrome 45', '59.40.74.36', null, null, null, null);
INSERT INTO `log` VALUES ('4125', null, '2016-05-18 14:02:33', null, 'Windows 7', 'Chrome 45', '59.40.74.36', null, null, null, null);
INSERT INTO `log` VALUES ('4126', null, '2016-05-18 14:05:51', null, 'Windows 7', 'Chrome 47', '27.196.175.166', null, null, null, null);
INSERT INTO `log` VALUES ('4127', null, '2016-05-18 14:06:57', null, 'Windows 7', 'Chrome 45', '59.40.74.36', null, null, null, null);
INSERT INTO `log` VALUES ('4128', null, '2016-05-18 14:13:14', null, 'Windows 7', 'Chrome 47', '210.13.80.220', null, null, null, null);
INSERT INTO `log` VALUES ('4129', null, '2016-05-18 14:13:14', null, 'Windows 7', 'Chrome 45', '183.23.118.21', null, null, null, null);
INSERT INTO `log` VALUES ('4130', null, '2016-05-18 14:13:33', null, 'Windows 7', 'Chrome 47', '210.13.80.220', null, null, null, null);
INSERT INTO `log` VALUES ('4131', null, '2016-05-18 14:15:19', null, 'Windows 8.1', 'Chrome 38', '61.51.95.246', null, null, null, null);
INSERT INTO `log` VALUES ('4132', null, '2016-05-18 14:15:27', null, 'Windows 8.1', 'Chrome 38', '61.51.95.246', null, null, null, null);
INSERT INTO `log` VALUES ('4133', null, '2016-05-18 14:15:27', null, 'iOS 7 (iPhone)', 'Apple WebKit', '218.203.63.243', null, null, null, null);
INSERT INTO `log` VALUES ('4134', null, '2016-05-18 14:17:53', null, 'Windows 7', 'Chrome 47', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4135', null, '2016-05-18 14:19:08', null, 'iOS 9 (iPhone)', 'Apple WebKit', '60.10.70.205', null, null, null, null);
INSERT INTO `log` VALUES ('4136', null, '2016-05-18 14:19:08', null, 'Windows 10', 'Microsoft Edge 12', '60.10.70.205', null, null, null, null);
INSERT INTO `log` VALUES ('4137', null, '2016-05-18 14:21:18', null, 'Windows 7', 'Chrome 47', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4138', null, '2016-05-18 15:15:32', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4139', null, '2016-05-18 15:16:47', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4140', null, '2016-05-18 15:16:48', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4141', null, '2016-05-18 15:17:15', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4142', null, '2016-05-18 15:17:30', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4143', null, '2016-05-18 15:18:08', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4144', null, '2016-05-18 15:18:26', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4145', null, '2016-05-18 15:18:43', null, 'Windows 7', 'Chrome 45', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4146', null, '2016-05-18 15:25:07', null, 'Mac OS X', 'Chrome', '114.244.88.16', null, null, null, null);
INSERT INTO `log` VALUES ('4147', null, '2016-05-18 15:26:02', null, 'Mac OS X', 'Chrome', '114.244.88.16', null, null, null, null);
INSERT INTO `log` VALUES ('4148', null, '2016-05-18 15:26:08', null, 'Mac OS X', 'Chrome', '114.244.88.16', null, null, null, null);
INSERT INTO `log` VALUES ('4149', null, '2016-05-18 15:27:02', null, 'Mac OS X', 'Chrome', '114.244.88.16', null, null, null, null);
INSERT INTO `log` VALUES ('4150', null, '2016-05-18 15:27:10', null, 'Mac OS X', 'Chrome', '114.244.88.16', null, null, null, null);
INSERT INTO `log` VALUES ('4151', null, '2016-05-18 15:29:43', null, 'Mac OS X', 'Chrome', '114.244.88.16', null, null, null, null);
INSERT INTO `log` VALUES ('4152', null, '2016-05-18 15:29:47', null, 'Mac OS X', 'Chrome', '114.244.88.16', null, null, null, null);
INSERT INTO `log` VALUES ('4153', null, '2016-05-18 15:47:30', null, 'Windows 7', 'Chrome 38', '180.173.19.170', null, null, null, null);
INSERT INTO `log` VALUES ('4154', null, '2016-05-18 15:49:04', null, 'Windows 7', 'Chrome 38', '180.173.19.170', null, null, null, null);
INSERT INTO `log` VALUES ('4155', null, '2016-05-18 15:49:05', null, 'Android 4.x', 'Chrome 37', '117.136.24.171', null, null, null, null);
INSERT INTO `log` VALUES ('4156', null, '2016-05-18 15:50:21', null, 'Android 4.x', 'Chrome 37', '117.136.24.171', null, null, null, null);
INSERT INTO `log` VALUES ('4157', null, '2016-05-18 16:05:46', null, 'Windows 7', 'Internet Explorer 8', '116.2.171.78', null, null, null, null);
INSERT INTO `log` VALUES ('4158', null, '2016-05-18 16:05:59', null, 'Windows 7', 'Internet Explorer 8', '116.2.171.78', null, null, null, null);
INSERT INTO `log` VALUES ('4159', null, '2016-05-18 16:06:45', null, 'Windows 7', 'Internet Explorer 8', '116.2.171.78', null, null, null, null);
INSERT INTO `log` VALUES ('4160', null, '2016-05-18 16:09:05', null, 'Windows 7', 'Firefox 45', '116.2.171.78', null, null, null, null);
INSERT INTO `log` VALUES ('4161', null, '2016-05-18 16:11:08', null, 'Windows 7', 'Firefox 45', '116.2.171.78', null, null, null, null);
INSERT INTO `log` VALUES ('4162', null, '2016-05-18 16:13:15', null, 'Windows 7', 'Firefox 45', '116.2.171.78', null, null, null, null);
INSERT INTO `log` VALUES ('4163', null, '2016-05-18 16:20:11', null, 'Windows 7', 'Chrome 27', '116.2.171.78', null, null, null, null);
INSERT INTO `log` VALUES ('4164', null, '2016-05-18 16:40:50', null, 'Windows 7', 'Chrome', '58.62.102.216', null, null, null, null);
INSERT INTO `log` VALUES ('4165', null, '2016-05-18 18:45:08', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4166', null, '2016-05-18 18:45:16', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4167', null, '2016-05-18 18:45:59', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4168', null, '2016-05-18 18:46:21', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4169', null, '2016-05-18 18:46:38', null, 'Windows 7', 'Firefox', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4170', null, '2016-05-18 18:46:55', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4171', null, '2016-05-18 18:46:59', null, 'Windows 7', 'Firefox', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4172', null, '2016-05-18 18:47:01', null, 'Windows 7', 'Firefox', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4173', null, '2016-05-18 18:47:04', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4174', null, '2016-05-18 18:47:11', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4175', null, '2016-05-18 18:51:42', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4176', null, '2016-05-18 18:52:01', null, 'Windows 7', 'Firefox', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4177', null, '2016-05-18 18:53:37', null, 'Windows 10', 'Chrome', '114.254.41.234', null, null, null, null);
INSERT INTO `log` VALUES ('4178', null, '2016-05-18 18:53:43', null, 'Windows 10', 'Chrome', '114.254.41.234', null, null, null, null);
INSERT INTO `log` VALUES ('4179', null, '2016-05-18 18:55:57', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4180', null, '2016-05-18 18:56:00', null, 'Windows 7', 'Firefox', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4181', null, '2016-05-18 18:56:00', null, 'Windows 10', 'Chrome', '114.254.41.234', null, null, null, null);
INSERT INTO `log` VALUES ('4182', null, '2016-05-18 18:56:05', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4186', null, '2016-05-18 18:59:00', null, 'Windows 10', 'Chrome', '183.16.197.141', null, null, null, null);
INSERT INTO `log` VALUES ('4188', null, '2016-05-18 19:01:28', null, 'Windows 10', 'Firefox', '183.16.197.141', null, null, null, null);
INSERT INTO `log` VALUES ('4196', null, '2016-05-18 19:09:11', null, 'Windows 10', 'Chrome 45', '111.30.85.213', null, null, null, null);
INSERT INTO `log` VALUES ('4200', null, '2016-05-18 19:33:37', null, 'Windows 7', 'Chrome', '58.62.102.216', null, null, null, null);
INSERT INTO `log` VALUES ('4201', null, '2016-05-18 19:33:45', null, 'Windows 7', 'Chrome', '58.62.102.216', null, null, null, null);
INSERT INTO `log` VALUES ('4202', null, '2016-05-18 19:33:51', null, 'Windows 7', 'Chrome', '58.62.102.216', null, null, null, null);
INSERT INTO `log` VALUES ('4203', null, '2016-05-18 19:33:54', null, 'Windows 7', 'Chrome', '58.62.102.216', null, null, null, null);
INSERT INTO `log` VALUES ('4204', null, '2016-05-18 19:35:56', null, 'Windows 7', 'Chrome', '58.62.102.216', null, null, null, null);
INSERT INTO `log` VALUES ('4226', null, '2016-05-18 20:28:21', null, 'Windows 7', 'Firefox', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4227', null, '2016-05-18 20:28:27', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4228', null, '2016-05-18 20:28:58', null, 'Windows 8.1', 'Chrome 31', '111.178.11.169', null, null, null, null);
INSERT INTO `log` VALUES ('4229', null, '2016-05-18 20:29:57', null, 'Android 5.x', 'Chrome 37', '222.204.1.6', null, null, null, null);
INSERT INTO `log` VALUES ('4230', null, '2016-05-18 20:29:57', null, 'Windows 7', 'Chrome 49', '114.251.179.129', null, null, null, null);
INSERT INTO `log` VALUES ('4231', null, '2016-05-18 20:30:24', null, 'Windows 7', 'Chrome', '120.195.3.136', null, null, null, null);
INSERT INTO `log` VALUES ('4232', null, '2016-05-18 20:30:26', null, 'Android 4.x', 'Chrome Mobile', '39.90.170.6', null, null, null, null);
INSERT INTO `log` VALUES ('4233', null, '2016-05-18 20:31:03', null, 'Windows 7', 'Firefox', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4234', null, '2016-05-18 20:31:33', null, 'Windows 7', 'Firefox', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4235', null, '2016-05-18 20:32:43', null, 'iOS 9 (iPhone)', 'Apple WebKit', '112.90.150.39', null, null, null, null);
INSERT INTO `log` VALUES ('4236', null, '2016-05-18 20:33:07', null, 'Windows 7', 'Firefox', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4237', null, '2016-05-18 20:33:12', null, 'Windows 7', 'Firefox', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4238', null, '2016-05-18 20:36:25', null, 'Windows 7', 'Chrome 39', '202.101.194.221', null, null, null, null);
INSERT INTO `log` VALUES ('4239', null, '2016-05-18 20:36:42', null, 'Windows 7', 'Chrome', '120.195.3.136', null, null, null, null);
INSERT INTO `log` VALUES ('4240', null, '2016-05-18 20:36:47', null, 'Windows 7', 'Chrome 39', '202.101.194.221', null, null, null, null);
INSERT INTO `log` VALUES ('4241', null, '2016-05-18 20:37:02', null, 'Windows 7', 'Chrome 39', '202.101.194.221', null, null, null, null);
INSERT INTO `log` VALUES ('4242', null, '2016-05-18 20:37:31', null, 'Windows 7', 'Firefox', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4243', null, '2016-05-18 20:37:47', null, 'Windows 7', 'Firefox', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4244', null, '2016-05-18 20:38:02', null, 'Windows 7', 'Firefox', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4245', null, '2016-05-18 20:44:42', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4246', null, '2016-05-18 20:46:56', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4247', null, '2016-05-18 20:47:05', null, 'Windows 7', 'Chrome', '58.62.100.105', null, null, null, null);
INSERT INTO `log` VALUES ('4248', null, '2016-05-18 20:47:08', null, 'Windows 7', 'Chrome', '58.62.100.105', null, null, null, null);
INSERT INTO `log` VALUES ('4249', null, '2016-05-18 20:47:09', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4250', null, '2016-05-18 20:48:27', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4251', null, '2016-05-18 20:49:07', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4252', null, '2016-05-18 20:52:12', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4253', null, '2016-05-18 20:54:56', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4254', null, '2016-05-18 20:57:28', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4255', null, '2016-05-18 21:01:20', null, 'Windows 7', 'Chrome 39', '202.101.194.221', null, null, null, null);
INSERT INTO `log` VALUES ('4256', null, '2016-05-18 21:08:16', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4257', null, '2016-05-18 21:13:38', null, 'iOS 9 (iPhone)', 'Apple WebKit', '117.136.100.187', null, null, null, null);
INSERT INTO `log` VALUES ('4258', null, '2016-05-18 21:13:43', null, 'Windows 8.1', 'Chrome 45', '36.33.220.79', null, null, null, null);
INSERT INTO `log` VALUES ('4259', null, '2016-05-18 21:13:48', null, 'iOS 9 (iPhone)', 'Apple WebKit', '117.136.100.187', null, null, null, null);
INSERT INTO `log` VALUES ('4260', null, '2016-05-18 21:14:10', null, 'Windows 7', 'Chrome 45', '124.113.160.228', null, null, null, null);
INSERT INTO `log` VALUES ('4261', null, '2016-05-18 21:14:39', null, 'Windows 7', 'Chrome 45', '122.83.89.22', null, null, null, null);
INSERT INTO `log` VALUES ('4262', null, '2016-05-18 21:14:43', null, 'Windows 7', 'Chrome 45', '27.46.44.192', null, null, null, null);
INSERT INTO `log` VALUES ('4263', null, '2016-05-18 21:16:06', null, 'Windows 8', 'Internet Explorer 10', '61.141.85.102', null, null, null, null);
INSERT INTO `log` VALUES ('4264', null, '2016-05-18 21:16:13', null, 'Windows 10', 'Chrome 38', '183.230.62.100', null, null, null, null);
INSERT INTO `log` VALUES ('4265', null, '2016-05-18 21:16:25', null, 'Windows 7', 'Chrome 45', '27.38.25.243', null, null, null, null);
INSERT INTO `log` VALUES ('4266', null, '2016-05-18 21:17:29', null, 'Windows 7', 'Chrome 31', '49.70.137.207', null, null, null, null);
INSERT INTO `log` VALUES ('4267', null, '2016-05-18 21:17:47', null, 'Windows 8', 'Chrome 47', '175.43.242.136', null, null, null, null);
INSERT INTO `log` VALUES ('4268', null, '2016-05-18 21:17:47', null, 'Android 6.x', 'Chrome 37', '180.174.19.51', null, null, null, null);
INSERT INTO `log` VALUES ('4269', null, '2016-05-18 21:20:32', null, 'Windows 10', 'Chrome 47', '49.75.87.161', null, null, null, null);
INSERT INTO `log` VALUES ('4270', null, '2016-05-18 21:20:39', null, 'iOS 9 (iPhone)', 'Apple WebKit', '223.104.38.82', null, null, null, null);
INSERT INTO `log` VALUES ('4271', null, '2016-05-18 21:21:58', null, 'Android 5.x', 'Chrome 37', '111.194.211.0', null, null, null, null);
INSERT INTO `log` VALUES ('4272', null, '2016-05-18 21:22:46', null, 'Windows 7', 'Chrome 45', '124.113.160.228', null, null, null, null);
INSERT INTO `log` VALUES ('4273', null, '2016-05-18 21:24:29', null, 'Android 5.x', 'Chrome 37', '111.222.255.120', null, null, null, null);
INSERT INTO `log` VALUES ('4274', null, '2016-05-18 21:25:16', null, 'Windows 7', 'Chrome 48', '118.244.255.184', null, null, null, null);
INSERT INTO `log` VALUES ('4275', null, '2016-05-18 21:26:03', null, 'Android 5.x', 'Chrome 37', '111.222.255.120', null, null, null, null);
INSERT INTO `log` VALUES ('4276', null, '2016-05-18 21:26:38', null, 'Windows 10', 'Chrome 49', '115.199.252.16', null, null, null, null);
INSERT INTO `log` VALUES ('4277', null, '2016-05-18 21:28:36', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4278', null, '2016-05-18 21:36:02', null, 'iOS 9 (iPhone)', 'Apple WebKit', '112.64.147.57', null, null, null, null);
INSERT INTO `log` VALUES ('4279', null, '2016-05-18 21:38:19', null, 'Windows 10', 'Chrome', '113.84.67.193', null, null, null, null);
INSERT INTO `log` VALUES ('4280', null, '2016-05-18 21:38:32', null, 'Windows 10', 'Internet Explorer 11', '111.10.240.160', null, null, null, null);
INSERT INTO `log` VALUES ('4281', null, '2016-05-18 21:40:22', null, 'Windows 10', 'Chrome 47', '210.32.120.110', null, null, null, null);
INSERT INTO `log` VALUES ('4282', null, '2016-05-18 21:44:58', null, 'iOS 7 (iPhone)', 'Apple WebKit', '1.204.157.159', null, null, null, null);
INSERT INTO `log` VALUES ('4283', null, '2016-05-18 21:45:25', null, 'Windows 7', 'Firefox', '171.37.44.90', null, null, null, null);
INSERT INTO `log` VALUES ('4284', null, '2016-05-18 21:48:03', null, 'Windows 10', 'Chrome 38', '183.13.180.159', null, null, null, null);
INSERT INTO `log` VALUES ('4285', null, '2016-05-18 21:48:32', null, 'Windows 7', 'Internet Explorer 9', '111.221.136.34', null, null, null, null);
INSERT INTO `log` VALUES ('4286', null, '2016-05-18 21:50:26', null, 'Android 5.x', 'Chrome 37', '124.234.58.27', null, null, null, null);
INSERT INTO `log` VALUES ('4287', null, '2016-05-18 21:55:50', null, 'Windows 7', 'Chrome 30', '117.172.24.178', null, null, null, null);
INSERT INTO `log` VALUES ('4288', null, '2016-05-18 21:55:55', null, 'Windows 10', 'Chrome 38', '183.13.180.159', null, null, null, null);
INSERT INTO `log` VALUES ('4289', null, '2016-05-18 21:59:29', null, 'Windows 7', 'Firefox', '124.205.63.15', null, null, null, null);
INSERT INTO `log` VALUES ('4290', null, '2016-05-18 22:01:03', null, 'iOS 8.1 (iPad)', 'Apple WebKit', '183.49.87.210', null, null, null, null);
INSERT INTO `log` VALUES ('4291', null, '2016-05-18 22:01:40', null, 'Android 6.x', 'Chrome 37', '221.178.200.44', null, null, null, null);
INSERT INTO `log` VALUES ('4292', null, '2016-05-18 22:58:29', null, 'Windows 7', 'Chrome 45', '219.138.204.200', null, null, null, null);
INSERT INTO `log` VALUES ('4293', null, '2016-05-18 23:19:36', null, 'Windows 7', 'Chrome 42', '117.114.129.168', null, null, null, null);
INSERT INTO `log` VALUES ('4294', null, '2016-05-19 08:22:44', null, 'Windows 7', 'Chrome', '113.200.217.242', null, null, null, null);
INSERT INTO `log` VALUES ('4295', null, '2016-05-19 08:39:38', null, 'Android 5.x', 'Mobile Safari', '111.165.30.33', null, null, null, null);
INSERT INTO `log` VALUES ('4296', null, '2016-05-19 08:45:05', null, 'Windows 7', 'Internet Explorer 9', '111.165.30.33', null, null, null, null);
INSERT INTO `log` VALUES ('4297', null, '2016-05-19 08:46:26', null, 'Windows 7', 'Chrome 49', '111.165.30.33', null, null, null, null);
INSERT INTO `log` VALUES ('4298', null, '2016-05-19 09:01:43', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4299', null, '2016-05-19 09:02:42', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4300', null, '2016-05-19 09:03:15', null, 'Windows 7', 'Chrome 49', '114.251.179.129', null, null, null, null);
INSERT INTO `log` VALUES ('4301', null, '2016-05-19 09:04:38', null, 'Windows 7', 'Chrome 38', '180.173.19.170', null, null, null, null);
INSERT INTO `log` VALUES ('4302', null, '2016-05-19 09:20:46', null, 'Windows 8.1', 'Chrome 45', '219.142.236.39', null, null, null, null);
INSERT INTO `log` VALUES ('4303', null, '2016-05-19 09:21:00', null, 'iOS 9 (iPhone)', 'Apple WebKit', '111.0.75.204', null, null, null, null);
INSERT INTO `log` VALUES ('4304', null, '2016-05-19 09:28:42', null, 'Windows 7', 'Chrome 45', '219.142.236.39', null, null, null, null);
INSERT INTO `log` VALUES ('4305', null, '2016-05-19 09:45:28', null, 'Windows 7', 'Chrome 42', '60.190.244.158', null, null, null, null);
INSERT INTO `log` VALUES ('4306', null, '2016-05-19 10:22:46', null, 'Mac OS X', 'Chrome', '220.180.239.228', null, null, null, null);
INSERT INTO `log` VALUES ('4307', null, '2016-05-19 11:06:27', null, 'Windows 7', 'Chrome 49', '114.251.179.129', null, null, null, null);
INSERT INTO `log` VALUES ('4308', null, '2016-05-19 11:13:27', null, 'Windows 7', 'Chrome 45', '219.142.236.39', null, null, null, null);
INSERT INTO `log` VALUES ('4309', null, '2016-05-19 11:15:39', null, 'Windows 7', 'Chrome 45', '182.150.28.133', null, null, null, null);
INSERT INTO `log` VALUES ('4310', null, '2016-05-19 11:59:14', null, 'Windows 7', 'Chrome 45', '219.142.236.39', null, null, null, null);
INSERT INTO `log` VALUES ('4311', null, '2016-05-19 12:42:03', null, 'Windows 7', 'Internet Explorer 11', '222.85.139.101', null, null, null, null);
INSERT INTO `log` VALUES ('4312', null, '2016-05-19 12:58:03', null, 'Android 5.x', 'Mobile Safari', '117.136.11.41', null, null, null, null);
INSERT INTO `log` VALUES ('4313', null, '2016-05-19 12:58:43', null, 'Windows 7', 'Chrome 47', '114.83.86.91', null, null, null, null);
INSERT INTO `log` VALUES ('4314', null, '2016-05-19 13:01:22', null, 'Windows 7', 'Chrome 31', '58.218.250.42', null, null, null, null);
INSERT INTO `log` VALUES ('4315', null, '2016-05-19 13:05:26', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4316', null, '2016-05-19 13:05:49', null, 'Windows 7', 'Chrome 45', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('4317', null, '2016-05-19 13:08:19', null, 'Windows 7', 'Chrome 45', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('4318', null, '2016-05-19 13:08:29', null, 'Windows 7', 'Chrome 45', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('4319', null, '2016-05-19 13:08:30', null, 'Windows 7', 'Chrome 45', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('4320', null, '2016-05-19 13:08:30', null, 'Windows 7', 'Chrome 45', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('4321', null, '2016-05-19 13:12:05', null, 'Windows 7', 'Chrome', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('4322', null, '2016-05-19 13:18:15', null, 'Windows 7', 'Chrome 45', '219.133.127.25', null, null, null, null);
INSERT INTO `log` VALUES ('4323', null, '2016-05-19 13:24:11', null, 'Windows 7', 'Internet Explorer 11', '182.138.102.30', null, null, null, null);
INSERT INTO `log` VALUES ('4324', null, '2016-05-19 13:26:37', null, 'Windows 7', 'Internet Explorer 11', '182.138.102.30', null, null, null, null);
INSERT INTO `log` VALUES ('4325', null, '2016-05-19 13:32:22', null, 'Android 4.x', 'Chrome 37', '112.229.164.53', null, null, null, null);
INSERT INTO `log` VALUES ('4326', null, '2016-05-19 13:48:25', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4327', null, '2016-05-19 13:48:57', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4328', null, '2016-05-19 13:49:05', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4329', null, '2016-05-19 13:54:29', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4330', null, '2016-05-19 13:54:36', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4331', null, '2016-05-19 13:56:09', null, 'Windows 7', 'Chrome 47', '120.52.24.23', null, null, null, null);
INSERT INTO `log` VALUES ('4332', null, '2016-05-19 14:20:14', null, 'Windows 10', 'Chrome 39', '122.71.67.202', null, null, null, null);
INSERT INTO `log` VALUES ('4333', null, '2016-05-19 14:30:59', null, 'Windows 10', 'Chrome', '101.81.14.34', null, null, null, null);
INSERT INTO `log` VALUES ('4334', null, '2016-05-19 14:45:36', null, 'Windows XP', 'Chrome 45', '58.59.204.51', null, null, null, null);
INSERT INTO `log` VALUES ('4335', null, '2016-05-19 14:46:17', null, 'Windows XP', 'Chrome 45', '58.59.204.51', null, null, null, null);
INSERT INTO `log` VALUES ('4336', null, '2016-05-19 15:00:46', null, 'Windows XP', 'Chrome 45', '58.59.204.51', null, null, null, null);
INSERT INTO `log` VALUES ('4337', null, '2016-05-19 15:11:13', null, 'Windows 10', 'Chrome 38', '36.44.125.49', null, null, null, null);
INSERT INTO `log` VALUES ('4338', null, '2016-05-19 15:12:34', null, 'Windows 7', 'Chrome 31', '111.30.21.47', null, null, null, null);
INSERT INTO `log` VALUES ('4339', null, '2016-05-19 16:04:30', null, 'Windows 7', 'Chrome 47', '221.194.176.17', null, null, null, null);
INSERT INTO `log` VALUES ('4340', null, '2016-05-19 16:14:15', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4341', null, '2016-05-19 16:14:31', null, 'Windows 8.1', 'Chrome', '114.88.160.82', null, null, null, null);
INSERT INTO `log` VALUES ('4342', null, '2016-05-19 16:15:34', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4343', null, '2016-05-19 16:16:13', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4344', null, '2016-05-19 16:17:10', null, 'Windows 7', 'Internet Explorer 11', '222.85.139.101', null, null, null, null);
INSERT INTO `log` VALUES ('4345', null, '2016-05-19 16:17:24', null, 'Windows 7', 'Chrome', '183.211.52.76', null, null, null, null);
INSERT INTO `log` VALUES ('4346', null, '2016-05-19 16:18:34', null, 'Windows 7', 'Opera', '49.77.222.114', null, null, null, null);
INSERT INTO `log` VALUES ('4347', null, '2016-05-19 16:19:03', null, 'Windows 7', 'Internet Explorer 11', '222.85.139.101', null, null, null, null);
INSERT INTO `log` VALUES ('4348', null, '2016-05-19 16:19:19', null, 'Windows 7', 'Chrome', '183.211.52.76', null, null, null, null);
INSERT INTO `log` VALUES ('4349', null, '2016-05-19 16:19:40', null, 'Windows 7', 'Chrome', '183.211.52.76', null, null, null, null);
INSERT INTO `log` VALUES ('4350', null, '2016-05-19 16:20:06', null, 'Windows 7', 'Internet Explorer 11', '222.85.139.101', null, null, null, null);
INSERT INTO `log` VALUES ('4351', null, '2016-05-19 16:21:08', null, 'Windows 7', 'Internet Explorer 11', '222.85.139.101', null, null, null, null);
INSERT INTO `log` VALUES ('4352', null, '2016-05-19 16:22:00', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4353', null, '2016-05-19 16:22:23', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4354', null, '2016-05-19 16:23:29', null, 'Windows 7', 'Firefox', '49.77.222.114', null, null, null, null);
INSERT INTO `log` VALUES ('4355', null, '2016-05-19 16:24:48', null, 'Windows 7', 'Internet Explorer 11', '222.85.139.101', null, null, null, null);
INSERT INTO `log` VALUES ('4356', null, '2016-05-19 16:25:03', null, 'Windows 7', 'Opera', '49.77.222.114', null, null, null, null);
INSERT INTO `log` VALUES ('4357', null, '2016-05-19 16:26:14', null, 'Windows 7', 'Internet Explorer 7', '221.194.176.17', null, null, null, null);
INSERT INTO `log` VALUES ('4358', null, '2016-05-19 16:26:16', null, 'Windows 7', 'Internet Explorer 7', '221.194.176.17', null, null, null, null);
INSERT INTO `log` VALUES ('4359', null, '2016-05-19 16:28:04', null, 'Windows 7', 'Chrome 45', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4360', null, '2016-05-19 16:29:53', null, 'Windows 7', 'Chrome 45', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4361', null, '2016-05-19 16:30:00', null, 'Windows 7', 'Chrome 45', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4362', null, '2016-05-19 16:30:01', null, 'Windows 7', 'Chrome 45', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4363', null, '2016-05-19 16:42:01', null, 'Windows 10', 'Chrome', '101.81.14.34', null, null, null, null);
INSERT INTO `log` VALUES ('4364', null, '2016-05-19 17:31:25', null, 'Windows 8.1', 'Internet Explorer 11', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('4365', null, '2016-05-19 18:01:52', null, 'Windows 7', 'Chrome 45', '60.186.189.181', null, null, null, null);
INSERT INTO `log` VALUES ('4366', null, '2016-05-19 18:31:14', null, 'Windows 7', 'Chrome 49', '114.251.179.129', null, null, null, null);
INSERT INTO `log` VALUES ('4367', null, '2016-05-19 20:22:47', null, 'Windows 7', 'Chrome 48', '118.212.150.185', null, null, null, null);
INSERT INTO `log` VALUES ('4368', null, '2016-05-19 21:15:20', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4369', null, '2016-05-19 21:16:26', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4370', null, '2016-05-19 21:16:26', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4371', null, '2016-05-19 21:16:29', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4372', null, '2016-05-19 21:16:31', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4373', null, '2016-05-19 21:16:34', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4374', null, '2016-05-19 21:29:47', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4375', null, '2016-05-19 21:29:56', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4376', null, '2016-05-19 21:30:08', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4377', null, '2016-05-19 21:30:35', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4378', null, '2016-05-19 21:30:58', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4379', null, '2016-05-19 21:31:15', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4380', null, '2016-05-19 21:45:59', null, 'Windows 10', 'Chrome', '59.48.111.86', null, null, null, null);
INSERT INTO `log` VALUES ('4381', null, '2016-05-19 22:02:57', null, 'Windows 10', 'Firefox', '112.226.141.152', null, null, null, null);
INSERT INTO `log` VALUES ('4382', null, '2016-05-19 22:44:37', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4383', null, '2016-05-19 22:47:33', null, 'Android 5.x', 'Chrome 37', '222.41.112.91', null, null, null, null);
INSERT INTO `log` VALUES ('4384', null, '2016-05-19 22:48:02', null, 'iOS 9 (iPhone)', 'Apple WebKit', '27.38.32.48', null, null, null, null);
INSERT INTO `log` VALUES ('4385', null, '2016-05-19 22:56:05', null, 'iOS 8.1 (iPad)', 'Apple WebKit', '183.49.87.206', null, null, null, null);
INSERT INTO `log` VALUES ('4386', null, '2016-05-19 23:08:10', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4387', null, '2016-05-19 23:11:10', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4388', null, '2016-05-19 23:13:32', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4389', null, '2016-05-19 23:16:24', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4390', null, '2016-05-19 23:17:04', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4391', null, '2016-05-19 23:17:05', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4392', null, '2016-05-19 23:17:50', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4393', null, '2016-05-20 00:56:57', null, 'Windows 7', 'Chrome 42', '58.42.242.7', null, null, null, null);
INSERT INTO `log` VALUES ('4394', null, '2016-05-20 01:01:24', null, 'Windows 7', 'Chrome 45', '210.32.120.110', null, null, null, null);
INSERT INTO `log` VALUES ('4395', null, '2016-05-20 01:01:31', null, 'Windows 7', 'Chrome 45', '210.32.120.110', null, null, null, null);
INSERT INTO `log` VALUES ('4396', null, '2016-05-20 01:16:01', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4397', null, '2016-05-20 01:21:19', null, 'Windows 7', 'Chrome 46', '61.131.90.198', null, null, null, null);
INSERT INTO `log` VALUES ('4398', null, '2016-05-20 01:22:44', null, 'Windows 7', 'Chrome 46', '61.131.90.198', null, null, null, null);
INSERT INTO `log` VALUES ('4399', null, '2016-05-20 01:51:40', null, 'Windows 7', 'Chrome 47', '120.52.24.21', null, null, null, null);
INSERT INTO `log` VALUES ('4400', null, '2016-05-20 08:25:21', null, 'Windows 10', 'Chrome', '59.48.111.2', null, null, null, null);
INSERT INTO `log` VALUES ('4401', null, '2016-05-20 09:24:12', null, 'Windows 8.1', 'Chrome 49', '219.142.236.39', null, null, null, null);
INSERT INTO `log` VALUES ('4402', null, '2016-05-20 09:26:04', null, 'Windows 8.1', 'Chrome 49', '219.142.236.39', null, null, null, null);
INSERT INTO `log` VALUES ('4403', null, '2016-05-20 09:27:34', null, 'Windows 8.1', 'Chrome 49', '219.142.236.39', null, null, null, null);
INSERT INTO `log` VALUES ('4404', null, '2016-05-20 09:29:41', null, 'Windows 7', 'Firefox', '121.34.102.167', null, null, null, null);
INSERT INTO `log` VALUES ('4405', null, '2016-05-20 10:56:45', null, 'Windows 10', 'Chrome 47', '182.46.1.81', null, null, null, null);
INSERT INTO `log` VALUES ('4406', null, '2016-05-20 13:07:15', null, 'Windows 7', 'Chrome 42', '60.190.244.158', null, null, null, null);
INSERT INTO `log` VALUES ('4407', null, '2016-05-20 13:40:53', null, 'Windows 10', 'Firefox', '124.207.133.253', null, null, null, null);
INSERT INTO `log` VALUES ('4408', null, '2016-05-20 13:42:52', null, 'Mac OS X', 'Chrome 47', '106.37.28.136', null, null, null, null);
INSERT INTO `log` VALUES ('4409', null, '2016-05-20 13:43:26', null, 'Mac OS X', 'Chrome 47', '106.37.28.136', null, null, null, null);
INSERT INTO `log` VALUES ('4410', null, '2016-05-20 13:44:18', null, 'Mac OS X', 'Chrome 47', '106.37.28.136', null, null, null, null);
INSERT INTO `log` VALUES ('4411', null, '2016-05-20 14:50:30', null, 'Android 4.x', 'Chrome 37', '123.125.212.69', null, null, null, null);
INSERT INTO `log` VALUES ('4412', null, '2016-05-20 15:00:03', null, 'Windows 7', 'Chrome 48', '120.236.170.109', null, null, null, null);
INSERT INTO `log` VALUES ('4413', null, '2016-05-20 15:26:26', null, 'Windows 7', 'Chrome 47', '180.166.7.106', null, null, null, null);
INSERT INTO `log` VALUES ('4414', null, '2016-05-20 15:51:20', null, 'Windows 10', 'Internet Explorer 11', '218.6.169.95', null, null, null, null);
INSERT INTO `log` VALUES ('4415', null, '2016-05-20 16:02:45', null, 'Mac OS X', 'Chrome', '125.69.143.142', null, null, null, null);
INSERT INTO `log` VALUES ('4416', null, '2016-05-20 16:03:06', null, 'Mac OS X', 'Chrome', '125.69.143.142', null, null, null, null);
INSERT INTO `log` VALUES ('4417', null, '2016-05-20 19:08:33', null, 'Mac OS X', 'Chrome 47', '106.37.28.135', null, null, null, null);
INSERT INTO `log` VALUES ('4418', null, '2016-05-20 19:08:47', null, 'Mac OS X', 'Chrome 47', '106.37.28.135', null, null, null, null);
INSERT INTO `log` VALUES ('4419', null, '2016-05-20 19:08:48', null, 'Mac OS X', 'Chrome 47', '106.37.28.135', null, null, null, null);
INSERT INTO `log` VALUES ('4420', null, '2016-05-21 14:21:04', null, 'Windows 8.1', 'Chrome 42', '116.231.224.17', null, null, null, null);
INSERT INTO `log` VALUES ('4421', null, '2016-05-21 17:59:12', null, 'Windows 10', 'Chrome 45', '110.53.162.196', null, null, null, null);
INSERT INTO `log` VALUES ('4422', null, '2016-05-22 15:40:17', null, 'Windows 7', 'Chrome 45', '113.118.247.162', null, null, null, null);
INSERT INTO `log` VALUES ('4423', null, '2016-05-22 15:42:06', null, 'Windows 7', 'Chrome 45', '113.118.247.162', null, null, null, null);
INSERT INTO `log` VALUES ('4424', null, '2016-05-22 16:02:31', null, 'Mac OS X', 'Chrome 47', '106.37.28.133', null, null, null, null);
INSERT INTO `log` VALUES ('4425', null, '2016-05-22 16:52:58', null, 'Windows 7', 'Chrome 45', '113.118.247.162', null, null, null, null);
INSERT INTO `log` VALUES ('4426', null, '2016-05-22 16:53:31', null, 'Windows 7', 'Chrome 45', '113.118.247.162', null, null, null, null);
INSERT INTO `log` VALUES ('4427', null, '2016-05-22 20:15:02', null, 'Windows 7', 'Firefox', '218.18.113.199', null, null, null, null);
INSERT INTO `log` VALUES ('4428', null, '2016-05-22 21:56:57', null, 'Windows 7', 'Firefox', '218.29.124.228', null, null, null, null);
INSERT INTO `log` VALUES ('4429', null, '2016-05-23 09:46:48', null, 'Windows 7', 'Chrome 45', '58.61.43.195', null, null, null, null);
INSERT INTO `log` VALUES ('4430', null, '2016-05-23 09:49:21', null, 'Windows 7', 'Chrome 44', '114.222.69.182', null, null, null, null);
INSERT INTO `log` VALUES ('4431', null, '2016-05-23 09:49:41', null, 'Windows 7', 'Chrome 44', '114.222.69.182', null, null, null, null);
INSERT INTO `log` VALUES ('4432', null, '2016-05-23 09:50:51', null, 'Windows 7', 'Chrome 45', '58.61.43.195', null, null, null, null);
INSERT INTO `log` VALUES ('4433', null, '2016-05-23 13:42:34', null, 'Windows 7', 'Chrome 47', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4434', null, '2016-05-23 14:32:47', null, 'Windows 7', 'Chrome 47', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4435', null, '2016-05-23 17:05:55', null, 'Mac OS X', 'Safari 9', '220.180.239.228', null, null, null, null);
INSERT INTO `log` VALUES ('4436', null, '2016-05-23 17:06:22', null, 'Mac OS X', 'Chrome 48', '220.180.239.228', null, null, null, null);
INSERT INTO `log` VALUES ('4437', null, '2016-05-23 19:54:53', null, 'Mac OS X', 'Chrome 48', '220.180.239.228', null, null, null, null);
INSERT INTO `log` VALUES ('4438', null, '2016-05-24 09:04:43', null, 'Windows 7', 'Chrome', '218.17.157.250', null, null, null, null);
INSERT INTO `log` VALUES ('4439', null, '2016-05-24 13:56:58', null, 'Windows XP', 'Firefox', '115.199.242.73', null, null, null, null);
INSERT INTO `log` VALUES ('4440', null, '2016-05-24 14:07:30', null, 'Windows 7', 'Chrome', '218.17.157.250', null, null, null, null);
INSERT INTO `log` VALUES ('4441', null, '2016-05-24 14:56:01', null, 'Windows 10', 'Chrome 49', '183.48.96.248', null, null, null, null);
INSERT INTO `log` VALUES ('4442', null, '2016-05-24 15:02:13', null, 'Windows 10', 'Chrome 49', '183.48.96.248', null, null, null, null);
INSERT INTO `log` VALUES ('4443', null, '2016-05-24 15:30:36', null, 'Windows 7', 'Chrome 45', '222.35.39.220', null, null, null, null);
INSERT INTO `log` VALUES ('4444', null, '2016-05-24 16:54:42', null, 'Mac OS X', 'Chrome 48', '108.61.246.133', null, null, null, null);
INSERT INTO `log` VALUES ('4445', null, '2016-05-24 16:54:55', null, 'Windows 10', 'Chrome 49', '220.180.239.228', null, null, null, null);
INSERT INTO `log` VALUES ('4446', null, '2016-05-24 16:59:12', null, 'Windows 7', 'Chrome 45', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4447', null, '2016-05-24 17:04:27', null, 'Windows 7', 'Chrome 45', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4448', null, '2016-05-24 17:10:31', null, 'Windows 7', 'Chrome 45', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4449', null, '2016-05-24 17:11:09', null, 'Windows 7', 'Chrome 45', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4450', null, '2016-05-24 17:13:37', null, 'Windows 7', 'Chrome 45', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4451', null, '2016-05-24 17:14:15', null, 'Windows 7', 'Chrome 45', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4452', null, '2016-05-24 17:27:32', null, 'Android 5.x', 'Chrome Mobile', '218.23.34.137', null, null, null, null);
INSERT INTO `log` VALUES ('4453', null, '2016-05-25 12:06:18', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4454', null, '2016-05-25 12:16:11', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4455', null, '2016-05-25 12:18:01', null, 'Windows 8.1', 'Chrome', '124.207.147.186', null, null, null, null);
INSERT INTO `log` VALUES ('4456', null, '2016-05-25 12:18:08', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4457', null, '2016-05-25 12:18:21', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4458', null, '2016-05-25 12:20:33', null, 'Windows 7', 'Chrome 47', '183.62.60.90', null, null, null, null);
INSERT INTO `log` VALUES ('4459', null, '2016-05-25 12:20:57', null, 'Windows 10', 'Internet Explorer 11', '114.111.164.122', null, null, null, null);
INSERT INTO `log` VALUES ('4460', null, '2016-05-25 12:22:39', null, 'Android 4.x', 'Chrome 37', '114.81.9.51', null, null, null, null);
INSERT INTO `log` VALUES ('4461', null, '2016-05-25 12:23:13', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4462', null, '2016-05-25 12:23:46', null, 'Android 4.x', 'Mobile Safari', '114.81.9.51', null, null, null, null);
INSERT INTO `log` VALUES ('4463', null, '2016-05-25 12:24:59', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4464', null, '2016-05-25 12:25:01', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4465', null, '2016-05-25 12:25:03', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4466', null, '2016-05-25 12:25:05', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4467', null, '2016-05-25 12:25:09', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4468', null, '2016-05-25 12:25:35', null, 'Android 4.x', 'Mobile Safari', '114.81.9.51', null, null, null, null);
INSERT INTO `log` VALUES ('4469', null, '2016-05-25 12:26:04', null, 'Windows 8.1', 'Internet Explorer 11', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('4470', null, '2016-05-25 12:26:47', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4471', null, '2016-05-25 12:27:43', null, 'Windows 7', 'Internet Explorer 11', '27.155.152.49', null, null, null, null);
INSERT INTO `log` VALUES ('4472', null, '2016-05-25 12:29:24', null, 'Windows 7', 'Internet Explorer 7', '222.35.39.216', null, null, null, null);
INSERT INTO `log` VALUES ('4473', null, '2016-05-25 12:30:01', null, 'Windows 10', 'Firefox', '223.73.196.10', null, null, null, null);
INSERT INTO `log` VALUES ('4474', null, '2016-05-25 12:30:22', null, 'Windows 7', 'Chrome 47', '183.62.60.90', null, null, null, null);
INSERT INTO `log` VALUES ('4475', null, '2016-05-25 12:30:45', null, 'Windows 10', 'Chrome', '183.16.186.185', null, null, null, null);
INSERT INTO `log` VALUES ('4476', null, '2016-05-25 12:31:08', null, 'Windows 7', 'Internet Explorer 7', '103.252.67.204', null, null, null, null);
INSERT INTO `log` VALUES ('4477', null, '2016-05-25 12:32:01', null, 'Android 5.x', 'Chrome 37', '211.64.96.253', null, null, null, null);
INSERT INTO `log` VALUES ('4478', null, '2016-05-25 12:32:05', null, 'Windows 7', 'Firefox', '120.197.24.209', null, null, null, null);
INSERT INTO `log` VALUES ('4479', null, '2016-05-25 12:33:30', null, 'Windows 10', 'Microsoft Edge 13', '211.94.93.192', null, null, null, null);
INSERT INTO `log` VALUES ('4480', null, '2016-05-25 12:33:52', null, 'Windows 7', 'Chrome 45', '203.156.252.192', null, null, null, null);
INSERT INTO `log` VALUES ('4481', null, '2016-05-25 12:35:27', null, 'Windows 8', 'Chrome', '111.175.164.29', null, null, null, null);
INSERT INTO `log` VALUES ('4482', null, '2016-05-25 12:35:42', null, 'Windows 7', 'Internet Explorer 7', '180.169.57.130', null, null, null, null);
INSERT INTO `log` VALUES ('4483', null, '2016-05-25 12:36:01', null, 'Android 5.x', 'Chrome 37', '183.208.96.246', null, null, null, null);
INSERT INTO `log` VALUES ('4484', null, '2016-05-25 12:38:54', null, 'Android 5.x', 'Chrome 37', '59.63.59.135', null, null, null, null);
INSERT INTO `log` VALUES ('4485', null, '2016-05-25 12:43:26', null, 'Windows 10', 'Chrome 49', '101.229.234.26', null, null, null, null);
INSERT INTO `log` VALUES ('4486', null, '2016-05-25 12:44:00', null, 'Android 4.x', 'Chrome Mobile', '140.207.81.9', null, null, null, null);
INSERT INTO `log` VALUES ('4487', null, '2016-05-25 12:45:07', null, 'Windows 10', 'Chrome 49', '101.229.234.26', null, null, null, null);
INSERT INTO `log` VALUES ('4488', null, '2016-05-25 12:46:50', null, 'Windows 7', 'Firefox', '101.204.229.33', null, null, null, null);
INSERT INTO `log` VALUES ('4489', null, '2016-05-25 12:47:20', null, 'Windows 7', 'Internet Explorer 10', '116.25.163.231', null, null, null, null);
INSERT INTO `log` VALUES ('4490', null, '2016-05-25 12:47:34', null, 'Windows 7', 'Firefox', '123.120.59.137', null, null, null, null);
INSERT INTO `log` VALUES ('4491', null, '2016-05-25 12:47:41', null, 'Windows 10', 'Microsoft Edge 13', '211.94.93.192', null, null, null, null);
INSERT INTO `log` VALUES ('4492', null, '2016-05-25 12:47:43', null, 'Windows 10', 'Internet Explorer 7', '61.242.58.246', null, null, null, null);
INSERT INTO `log` VALUES ('4493', null, '2016-05-25 12:49:11', null, 'Windows 7', 'Internet Explorer 10', '116.25.163.231', null, null, null, null);
INSERT INTO `log` VALUES ('4494', null, '2016-05-25 12:49:30', null, 'Windows 7', 'Internet Explorer 9', '182.148.56.197', null, null, null, null);
INSERT INTO `log` VALUES ('4495', null, '2016-05-25 12:49:48', null, 'iOS 9 (iPhone)', 'Apple WebKit', '180.102.101.153', null, null, null, null);
INSERT INTO `log` VALUES ('4496', null, '2016-05-25 12:52:43', null, 'Windows 7', 'Chrome 49', '14.124.109.106', null, null, null, null);
INSERT INTO `log` VALUES ('4497', null, '2016-05-25 12:57:35', null, 'Windows 7', 'Internet Explorer 9', '110.83.90.195', null, null, null, null);
INSERT INTO `log` VALUES ('4498', null, '2016-05-25 12:59:47', null, 'Windows 7', 'Internet Explorer 7', '114.242.234.214', null, null, null, null);
INSERT INTO `log` VALUES ('4499', null, '2016-05-25 12:59:57', null, 'Windows 7', 'Internet Explorer 7', '114.242.234.214', null, null, null, null);
INSERT INTO `log` VALUES ('4500', null, '2016-05-25 13:00:07', null, 'Windows 7', 'Chrome 45', '114.242.234.214', null, null, null, null);
INSERT INTO `log` VALUES ('4501', null, '2016-05-25 13:02:18', null, 'Windows 10', 'Internet Explorer 7', '111.132.220.239', null, null, null, null);
INSERT INTO `log` VALUES ('4502', null, '2016-05-25 13:04:47', null, 'Windows 7', 'Chrome 49', '118.114.241.72', null, null, null, null);
INSERT INTO `log` VALUES ('4503', null, '2016-05-25 13:05:03', null, 'Windows 7', 'Internet Explorer 7', '171.212.195.153', null, null, null, null);
INSERT INTO `log` VALUES ('4504', null, '2016-05-25 13:07:45', null, 'Windows 7', 'Chrome 49', '118.114.241.72', null, null, null, null);
INSERT INTO `log` VALUES ('4505', null, '2016-05-25 13:08:30', null, 'Windows 7', 'Internet Explorer 7', '123.139.21.156', null, null, null, null);
INSERT INTO `log` VALUES ('4506', null, '2016-05-25 13:08:46', null, 'Windows 7', 'Chrome 49', '14.124.109.106', null, null, null, null);
INSERT INTO `log` VALUES ('4507', null, '2016-05-25 13:09:52', null, 'Windows 7', 'Internet Explorer 7', '118.112.57.51', null, null, null, null);
INSERT INTO `log` VALUES ('4508', null, '2016-05-25 13:09:56', null, 'Windows 7', 'Internet Explorer 7', '118.112.57.51', null, null, null, null);
INSERT INTO `log` VALUES ('4509', null, '2016-05-25 13:10:03', null, 'Windows 7', 'Chrome 45', '118.112.57.51', null, null, null, null);
INSERT INTO `log` VALUES ('4510', null, '2016-05-25 13:10:04', null, 'Windows 7', 'Chrome 48', '123.139.21.156', null, null, null, null);
INSERT INTO `log` VALUES ('4511', null, '2016-05-25 13:13:10', null, 'Windows 7', 'Internet Explorer 7', '218.104.74.238', null, null, null, null);
INSERT INTO `log` VALUES ('4512', null, '2016-05-25 13:14:38', null, 'Windows 7', 'Internet Explorer 8', '218.104.74.238', null, null, null, null);
INSERT INTO `log` VALUES ('4513', null, '2016-05-25 13:16:02', null, 'Windows 7', 'Internet Explorer 11', '111.206.28.18', null, null, null, null);
INSERT INTO `log` VALUES ('4514', null, '2016-05-25 13:18:34', null, 'Windows 7', 'Internet Explorer 7', '221.236.9.196', null, null, null, null);
INSERT INTO `log` VALUES ('4515', null, '2016-05-25 13:23:30', null, 'Windows 7', 'Internet Explorer 10', '183.131.93.43', null, null, null, null);
INSERT INTO `log` VALUES ('4516', null, '2016-05-25 13:26:38', null, 'Mac OS X', 'Chrome 41', '114.66.4.148', null, null, null, null);
INSERT INTO `log` VALUES ('4517', null, '2016-05-25 13:27:07', null, 'Windows 10', 'Chrome 47', '182.46.4.160', null, null, null, null);
INSERT INTO `log` VALUES ('4518', null, '2016-05-25 13:30:29', null, 'Android 5.x', 'Chrome 37', '223.104.3.156', null, null, null, null);
INSERT INTO `log` VALUES ('4519', null, '2016-05-25 13:30:51', null, 'iOS 9 (iPhone)', 'Apple WebKit', '180.130.10.139', null, null, null, null);
INSERT INTO `log` VALUES ('4520', null, '2016-05-25 13:31:42', null, 'Windows 7', 'Chrome 49', '118.114.241.72', null, null, null, null);
INSERT INTO `log` VALUES ('4521', null, '2016-05-25 13:31:53', null, 'Android 5.x', 'Chrome 37', '223.104.3.156', null, null, null, null);
INSERT INTO `log` VALUES ('4522', null, '2016-05-25 13:33:47', null, 'Windows 7', 'Internet Explorer 7', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('4523', null, '2016-05-25 13:33:52', null, 'Windows 7', 'Internet Explorer 7', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('4524', null, '2016-05-25 13:34:35', null, 'Windows 7', 'Internet Explorer 7', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('4525', null, '2016-05-25 13:34:50', null, 'Windows 7', 'Firefox', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('4526', null, '2016-05-25 13:35:38', null, 'Windows 7', 'Chrome 35', '58.40.17.82', null, null, null, null);
INSERT INTO `log` VALUES ('4527', null, '2016-05-25 13:35:42', null, 'Windows 7', 'Chrome 47', '121.225.157.81', null, null, null, null);
INSERT INTO `log` VALUES ('4528', null, '2016-05-25 13:36:15', null, 'Windows 8.1', 'Chrome 47', '219.146.156.54', null, null, null, null);
INSERT INTO `log` VALUES ('4529', null, '2016-05-25 13:38:10', null, 'Windows 7', 'Internet Explorer 10', '183.131.93.43', null, null, null, null);
INSERT INTO `log` VALUES ('4530', null, '2016-05-25 13:38:54', null, 'Windows 7', 'Internet Explorer 7', '218.241.230.34', null, null, null, null);
INSERT INTO `log` VALUES ('4531', null, '2016-05-25 13:38:58', null, 'Windows 7', 'Chrome', '59.38.65.210', null, null, null, null);
INSERT INTO `log` VALUES ('4532', null, '2016-05-25 13:39:05', null, 'Windows 7', 'Chrome 45', '218.241.230.34', null, null, null, null);
INSERT INTO `log` VALUES ('4533', null, '2016-05-25 13:39:55', null, 'Windows 7', 'Chrome 49', '14.124.109.106', null, null, null, null);
INSERT INTO `log` VALUES ('4534', null, '2016-05-25 13:39:58', null, 'Windows 7', 'Chrome 38', '112.95.136.37', null, null, null, null);
INSERT INTO `log` VALUES ('4535', null, '2016-05-25 13:40:24', null, 'Windows 7', 'Chrome 49', '14.124.109.106', null, null, null, null);
INSERT INTO `log` VALUES ('4536', null, '2016-05-25 13:40:35', null, 'Windows 7', 'Chrome 49', '14.124.109.106', null, null, null, null);
INSERT INTO `log` VALUES ('4537', null, '2016-05-25 13:40:53', null, 'Windows 7', 'Chrome 49', '14.124.109.106', null, null, null, null);
INSERT INTO `log` VALUES ('4538', null, '2016-05-25 13:41:35', null, 'Windows 7', 'Chrome 49', '14.124.109.106', null, null, null, null);
INSERT INTO `log` VALUES ('4539', null, '2016-05-25 13:44:01', null, 'Windows 7', 'Internet Explorer 7', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4540', null, '2016-05-25 13:45:00', null, 'Windows 10', 'Firefox', '223.73.52.159', null, null, null, null);
INSERT INTO `log` VALUES ('4541', null, '2016-05-25 13:45:42', null, 'Windows 10', 'Microsoft Edge 13', '180.173.182.69', null, null, null, null);
INSERT INTO `log` VALUES ('4542', null, '2016-05-25 13:45:58', null, 'Windows 7', 'Internet Explorer 11', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4543', null, '2016-05-25 13:46:02', null, 'Windows 7', 'Internet Explorer 11', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4544', null, '2016-05-25 13:46:53', null, 'Windows 7', 'Chrome 49', '14.124.109.106', null, null, null, null);
INSERT INTO `log` VALUES ('4545', null, '2016-05-25 13:47:04', null, 'Windows 7', 'Chrome 49', '14.124.109.106', null, null, null, null);
INSERT INTO `log` VALUES ('4546', null, '2016-05-25 13:47:27', null, 'Windows 8.1', 'Chrome 42', '218.80.197.214', null, null, null, null);
INSERT INTO `log` VALUES ('4547', null, '2016-05-25 13:48:48', null, 'Windows 10', 'Microsoft Edge 13', '180.173.182.69', null, null, null, null);
INSERT INTO `log` VALUES ('4548', null, '2016-05-25 13:49:00', null, 'Windows 7', 'Chrome 49', '14.124.109.106', null, null, null, null);
INSERT INTO `log` VALUES ('4549', null, '2016-05-25 13:54:01', null, 'Windows 10', 'Internet Explorer 11', '218.23.34.137', null, null, null, null);
INSERT INTO `log` VALUES ('4550', null, '2016-05-25 13:55:31', null, 'Windows 7', 'Chrome 49', '111.165.57.103', null, null, null, null);
INSERT INTO `log` VALUES ('4551', null, '2016-05-25 13:56:02', null, 'Windows 7', 'Internet Explorer 7', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('4552', null, '2016-05-25 13:56:17', null, 'Windows 7', 'Internet Explorer 7', '36.110.25.198', null, null, null, null);
INSERT INTO `log` VALUES ('4553', null, '2016-05-25 14:03:52', null, 'Windows 7', 'Internet Explorer 9', '218.17.162.170', null, null, null, null);
INSERT INTO `log` VALUES ('4554', null, '2016-05-25 14:06:08', null, 'Windows 10', 'Internet Explorer 7', '161.207.4.8', null, null, null, null);
INSERT INTO `log` VALUES ('4555', null, '2016-05-25 14:11:05', null, 'Windows 7', 'Chrome 46', '183.228.31.223', null, null, null, null);
INSERT INTO `log` VALUES ('4556', null, '2016-05-25 14:12:41', null, 'Windows 10', 'Internet Explorer 7', '161.207.4.8', null, null, null, null);
INSERT INTO `log` VALUES ('4557', null, '2016-05-25 14:14:09', null, 'Windows 7', 'Chrome 45', '211.99.30.25', null, null, null, null);
INSERT INTO `log` VALUES ('4558', null, '2016-05-25 14:33:49', null, 'Windows 10', 'Internet Explorer 7', '124.114.130.114', null, null, null, null);
INSERT INTO `log` VALUES ('4559', null, '2016-05-25 14:33:54', null, 'Windows 7', 'Chrome 45', '106.6.167.76', null, null, null, null);
INSERT INTO `log` VALUES ('4560', null, '2016-05-25 14:38:24', null, 'Windows 7', 'Chrome', '218.17.157.250', null, null, null, null);
INSERT INTO `log` VALUES ('4561', null, '2016-05-25 14:40:32', null, 'Windows 7', 'Chrome 49', '14.124.109.106', null, null, null, null);
INSERT INTO `log` VALUES ('4562', null, '2016-05-25 15:10:16', null, 'Windows 10', 'Internet Explorer 7', '124.114.130.114', null, null, null, null);
INSERT INTO `log` VALUES ('4563', null, '2016-05-25 15:40:48', null, 'Windows 7', 'Chrome 49', '14.124.109.106', null, null, null, null);
INSERT INTO `log` VALUES ('4564', null, '2016-05-25 15:41:32', null, 'Windows 7', 'Chrome 47', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4565', null, '2016-05-25 15:42:24', null, 'Windows 10', 'Firefox', '123.138.207.23', null, null, null, null);
INSERT INTO `log` VALUES ('4566', null, '2016-05-25 15:42:33', null, 'Windows 10', 'Firefox', '123.138.207.23', null, null, null, null);
INSERT INTO `log` VALUES ('4567', null, '2016-05-25 15:45:13', null, 'Windows 8.1', 'Chrome', '116.230.6.170', null, null, null, null);
INSERT INTO `log` VALUES ('4568', null, '2016-05-25 15:45:15', null, 'Windows 10', 'Chrome 45', '124.114.130.114', null, null, null, null);
INSERT INTO `log` VALUES ('4569', null, '2016-05-25 15:47:52', null, 'Windows 8.1', 'Chrome', '116.230.6.170', null, null, null, null);
INSERT INTO `log` VALUES ('4570', null, '2016-05-25 15:48:30', null, 'Windows 7', 'Chrome 47', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4571', null, '2016-05-25 15:49:59', null, 'Windows 8.1', 'Internet Explorer 11', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('4572', null, '2016-05-25 15:54:06', null, 'Windows 7', 'Chrome 47', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4573', null, '2016-05-25 15:54:09', null, 'Windows 7', 'Chrome', '218.17.157.250', null, null, null, null);
INSERT INTO `log` VALUES ('4574', null, '2016-05-25 15:55:36', null, 'Windows 7', 'Chrome 47', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4575', null, '2016-05-25 16:30:36', null, 'Windows 8.1', 'Internet Explorer 11', '180.169.33.113', null, null, null, null);
INSERT INTO `log` VALUES ('4576', null, '2016-05-25 16:32:46', null, 'Windows 10', 'Chrome 47', '182.46.4.160', null, null, null, null);
INSERT INTO `log` VALUES ('4577', null, '2016-05-25 16:34:48', null, 'Windows 10', 'Firefox', '123.233.114.178', null, null, null, null);
INSERT INTO `log` VALUES ('4578', null, '2016-05-25 16:34:52', null, 'Windows 10', 'Chrome', '104.224.153.68', null, null, null, null);
INSERT INTO `log` VALUES ('4579', null, '2016-05-25 16:36:01', null, 'Windows 10', 'Firefox', '123.233.114.178', null, null, null, null);
INSERT INTO `log` VALUES ('4580', null, '2016-05-25 16:40:29', null, 'Windows 10', 'Firefox', '123.233.114.178', null, null, null, null);
INSERT INTO `log` VALUES ('4581', null, '2016-05-25 16:40:36', null, 'Windows 10', 'Firefox', '123.233.114.178', null, null, null, null);
INSERT INTO `log` VALUES ('4582', null, '2016-05-25 16:40:40', null, 'Windows 10', 'Firefox', '123.233.114.178', null, null, null, null);
INSERT INTO `log` VALUES ('4583', null, '2016-05-25 16:42:05', null, 'Windows 7', 'Chrome 47', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4584', null, '2016-05-25 16:44:50', null, 'Windows 10', 'Firefox', '123.233.114.178', null, null, null, null);
INSERT INTO `log` VALUES ('4585', null, '2016-05-25 16:47:02', null, 'Windows 7', 'Chrome 47', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4586', null, '2016-05-25 16:47:03', null, 'Windows 7', 'Chrome 47', '61.135.194.170', null, null, null, null);
INSERT INTO `log` VALUES ('4587', null, '2016-05-25 16:48:55', null, 'Windows 10', 'Firefox', '123.233.114.178', null, null, null, null);
INSERT INTO `log` VALUES ('4588', null, '2016-05-25 17:24:39', null, 'Windows 10', 'Firefox', '123.233.114.178', null, null, null, null);
INSERT INTO `log` VALUES ('4589', null, '2016-05-25 18:00:22', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4590', null, '2016-05-25 18:01:07', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4591', null, '2016-05-25 18:01:59', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4592', null, '2016-05-25 18:02:34', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4593', null, '2016-05-25 18:03:57', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4594', null, '2016-05-25 18:04:20', null, 'Windows 7', 'Chrome 47', '221.194.176.16', null, null, null, null);
INSERT INTO `log` VALUES ('4595', null, '2016-08-26 23:51:52', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4596', null, '2016-08-26 23:52:29', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4597', null, '2016-08-26 23:56:06', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4598', null, '2016-08-27 00:00:55', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4599', null, '2016-08-27 00:01:25', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4600', null, '2016-08-27 00:02:07', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4601', null, '2016-08-27 09:05:52', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4602', null, '2016-08-27 09:09:38', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4603', null, '2016-08-27 09:13:45', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4604', null, '2016-08-27 09:33:06', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4605', null, '2016-08-27 09:51:38', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4606', null, '2016-08-27 10:02:30', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4607', null, '2016-08-27 10:03:20', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4608', null, '2016-08-27 10:06:55', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4609', null, '2016-08-27 10:18:40', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4610', null, '2016-08-27 10:25:57', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4611', null, '2016-08-27 10:28:27', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4612', null, '2016-08-27 10:28:56', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4613', null, '2016-08-27 10:38:42', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4614', null, '2016-08-27 10:39:07', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4615', null, '2016-08-27 10:42:01', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4616', null, '2016-08-27 10:44:21', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4617', null, '2016-08-27 10:47:00', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4618', null, '2016-08-27 10:47:12', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4619', null, '2016-08-27 10:49:13', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4620', null, '2016-08-27 10:49:26', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4621', null, '2016-08-27 10:50:45', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4622', null, '2016-08-27 10:51:16', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4623', null, '2016-08-27 10:54:59', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4624', null, '2016-08-27 10:55:31', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4625', null, '2016-08-27 11:00:25', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4626', null, '2016-08-27 11:02:13', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4627', null, '2016-08-27 11:02:53', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4628', null, '2016-08-27 11:19:25', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4629', null, '2016-08-27 14:16:48', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4630', null, '2016-08-27 14:25:14', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4631', null, '2016-08-27 14:25:40', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4632', null, '2016-08-27 14:26:37', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4633', null, '2016-08-27 14:29:03', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4634', null, '2016-08-27 14:30:25', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4635', null, '2016-08-27 14:33:11', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4636', null, '2016-08-27 14:33:36', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4637', null, '2016-08-27 14:35:39', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4638', null, '2016-08-27 14:37:18', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4639', null, '2016-08-27 14:37:46', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4640', null, '2016-08-27 14:38:12', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4641', null, '2016-08-27 14:41:15', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4642', null, '2016-08-27 14:41:38', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4643', null, '2016-08-27 14:45:42', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4644', null, '2016-08-27 15:09:27', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4645', null, '2016-08-27 15:19:41', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4646', null, '2016-08-27 15:51:12', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4647', null, '2016-08-27 15:56:30', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4648', null, '2016-08-27 16:54:42', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4649', null, '2016-08-27 17:04:28', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4650', null, '2016-08-27 17:08:33', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4651', null, '2016-08-28 19:33:01', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4652', null, '2016-08-28 19:36:08', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4653', null, '2016-08-28 19:36:46', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4654', null, '2016-08-28 19:40:14', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4655', null, '2016-08-28 19:44:03', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4656', null, '2016-08-28 21:29:16', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);
INSERT INTO `log` VALUES ('4657', null, '2016-08-28 21:34:32', null, 'Windows 8.1', 'Chrome', '127.0.0.1', null, null, null, null);

-- ----------------------------
-- Table structure for `login_log`
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '账号',
  `login_ip` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '登陆ip',
  `login_time` datetime NOT NULL COMMENT '登陆时间',
  `detail_address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '详细地址信息',
  `province` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '省',
  `city` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '城市',
  `city_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '城市id',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `point_x` decimal(11,8) DEFAULT NULL COMMENT '经度',
  `point_y` decimal(10,8) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES ('21', 'super', '61.135.194.168', '2016-05-13 12:13:39', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('27', 'super', '61.135.194.168', '2016-05-13 12:41:32', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('28', 'admin', '183.62.60.90', '2016-05-13 12:41:35', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('29', 'admin', '202.101.102.203', '2016-05-13 12:41:54', 'CN|福建|福州|None|CHINANET|0|0', '福建省', '福州市', '300', '福建省福州市', '119.33022111', '26.04712550');
INSERT INTO `login_log` VALUES ('30', 'super', '61.135.194.168', '2016-05-13 12:42:46', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('31', 'admin', '36.110.25.198', '2016-05-13 12:42:48', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('32', 'admin', '101.81.56.138', '2016-05-13 12:44:42', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('33', 'admin', '218.6.169.95', '2016-05-13 12:44:58', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('34', 'admin', '58.19.3.178', '2016-05-13 12:46:46', 'CN|湖北|武汉|None|UNICOM|0|0', '湖北省', '武汉市', '218', '湖北省武汉市', '114.31620010', '30.58108413');
INSERT INTO `login_log` VALUES ('35', 'admin', '59.46.46.164', '2016-05-13 12:48:30', 'CN|辽宁|沈阳|None|CHINANET|0|0', '辽宁省', '沈阳市', '58', '辽宁省沈阳市', '123.43279092', '41.80864478');
INSERT INTO `login_log` VALUES ('36', 'admin', '182.108.10.72', '2016-05-13 12:58:22', 'CN|江西|南昌|None|CHINANET|0|0', '江西省', '南昌市', '163', '江西省南昌市', '115.89352755', '28.68957800');
INSERT INTO `login_log` VALUES ('37', 'admin', '182.108.10.72', '2016-05-13 12:59:15', 'CN|江西|南昌|None|CHINANET|0|0', '江西省', '南昌市', '163', '江西省南昌市', '115.89352755', '28.68957800');
INSERT INTO `login_log` VALUES ('38', 'admin', '58.218.250.42', '2016-05-13 13:03:01', 'CN|江苏|徐州|None|CHINANET|0|0', '江苏省', '徐州市', '316', '江苏省徐州市', '117.18810662', '34.27155343');
INSERT INTO `login_log` VALUES ('39', 'admin', '58.218.250.42', '2016-05-13 13:03:41', 'CN|江苏|徐州|None|CHINANET|0|0', '江苏省', '徐州市', '316', '江苏省徐州市', '117.18810662', '34.27155343');
INSERT INTO `login_log` VALUES ('40', 'admin', '222.85.139.101', '2016-05-13 13:03:49', 'CN|贵州|贵阳|None|CHINANET|0|0', '贵州省', '贵阳市', '146', '贵州省贵阳市', '106.70917710', '26.62990674');
INSERT INTO `login_log` VALUES ('41', 'super', '61.135.194.168', '2016-05-13 13:10:04', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('42', 'admin', '49.77.187.121', '2016-05-13 13:11:24', 'CN|江苏|南京|None|CHINANET|0|0', '江苏省', '南京市', '315', '江苏省南京市', '118.77807441', '32.05723550');
INSERT INTO `login_log` VALUES ('43', 'admin', '58.218.250.42', '2016-05-13 13:12:35', 'CN|江苏|徐州|None|CHINANET|0|0', '江苏省', '徐州市', '316', '江苏省徐州市', '117.18810662', '34.27155343');
INSERT INTO `login_log` VALUES ('44', 'admin', '36.110.25.198', '2016-05-13 13:12:43', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('45', 'admin', '36.110.25.198', '2016-05-13 13:13:24', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('46', 'admin', '36.110.25.198', '2016-05-13 13:13:37', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('47', 'admin', '223.104.18.218', '2016-05-13 13:13:52', 'CN|安徽|合肥|None|CMNET|0|0', '安徽省', '合肥市', '127', '安徽省合肥市', '117.28269909', '31.86694226');
INSERT INTO `login_log` VALUES ('48', 'admin', '210.82.30.225', '2016-05-13 13:17:11', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('49', 'admin', '121.14.104.61', '2016-05-13 13:19:15', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('50', 'admin', '117.136.24.185', '2016-05-13 13:21:55', 'CN|湖南|None|None|CMNET|0|0', '湖南省', '', '26', '湖南省', '111.72066355', '27.69586405');
INSERT INTO `login_log` VALUES ('51', 'admin', '115.236.91.15', '2016-05-13 13:22:24', 'CN|浙江|杭州|None|CHINANET|0|0', '浙江省', '杭州市', '179', '浙江省杭州市', '120.21937542', '30.25924446');
INSERT INTO `login_log` VALUES ('52', 'admin', '117.136.24.185', '2016-05-13 13:23:08', 'CN|湖南|None|None|CMNET|0|0', '湖南省', '', '26', '湖南省', '111.72066355', '27.69586405');
INSERT INTO `login_log` VALUES ('53', 'admin', '115.236.91.15', '2016-05-13 13:23:16', 'CN|浙江|杭州|None|CHINANET|0|0', '浙江省', '杭州市', '179', '浙江省杭州市', '120.21937542', '30.25924446');
INSERT INTO `login_log` VALUES ('54', 'admin', '218.93.112.174', '2016-05-13 13:25:48', 'CN|江苏|常州|None|CHINANET|0|0', '江苏省', '常州市', '348', '江苏省常州市', '119.98186101', '31.77139674');
INSERT INTO `login_log` VALUES ('55', 'admin', '121.14.104.61', '2016-05-13 13:28:20', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('56', 'admin', '115.236.91.15', '2016-05-13 13:28:32', 'CN|浙江|杭州|None|CHINANET|0|0', '浙江省', '杭州市', '179', '浙江省杭州市', '120.21937542', '30.25924446');
INSERT INTO `login_log` VALUES ('57', 'admin', '118.244.254.9', '2016-05-13 13:31:33', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('58', 'admin', '183.62.60.90', '2016-05-13 13:31:55', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('59', 'super', '61.135.194.168', '2016-05-13 13:32:33', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('60', 'admin', '59.46.172.210', '2016-05-13 13:34:03', 'CN|辽宁|大连|None|CHINANET|0|0', '辽宁省', '大连市', '167', '辽宁省大连市', '121.59347778', '38.94870994');
INSERT INTO `login_log` VALUES ('61', 'admin', '116.231.224.17', '2016-05-13 13:35:43', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('62', 'admin', '116.231.224.17', '2016-05-13 13:36:32', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('63', 'admin', '36.110.25.198', '2016-05-13 13:37:06', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('64', 'admin', '111.198.66.16', '2016-05-13 13:38:23', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('65', 'admin', '61.135.194.168', '2016-05-13 13:40:10', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('66', 'super', '61.135.194.168', '2016-05-13 13:44:33', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('67', 'super', '61.135.194.168', '2016-05-13 13:51:11', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('68', 'admin', '222.211.172.191', '2016-05-13 13:52:31', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('69', 'admin', '220.180.239.228', '2016-05-13 13:52:34', 'CN|安徽|合肥|None|CHINANET|0|0', '安徽省', '合肥市', '127', '安徽省合肥市', '117.28269909', '31.86694226');
INSERT INTO `login_log` VALUES ('70', 'admin', '222.182.112.23', '2016-05-13 13:52:53', 'CN|重庆|重庆|None|CHINANET|0|0', '重庆市', '重庆市', '132', '重庆市', '106.53063501', '29.54460611');
INSERT INTO `login_log` VALUES ('71', 'admin', '117.158.195.102', '2016-05-13 13:54:03', 'CN|广东|None|None|CMNET|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('72', 'admin', '183.48.98.15', '2016-05-13 13:54:19', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('73', 'admin', '180.169.59.210', '2016-05-13 13:54:41', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('74', 'admin', '222.168.33.190', '2016-05-13 13:54:53', 'CN|吉林|长春|None|CHINANET|0|0', '吉林省', '长春市', '53', '吉林省长春市', '125.31364243', '43.89833761');
INSERT INTO `login_log` VALUES ('75', 'admin', '120.203.17.90', '2016-05-13 13:54:56', 'CN|江西|南昌|None|CMNET|0|0', '江西省', '南昌市', '163', '江西省南昌市', '115.89352755', '28.68957800');
INSERT INTO `login_log` VALUES ('76', 'admin', '123.127.244.254', '2016-05-13 13:55:43', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('77', 'admin', '61.135.194.168', '2016-05-13 13:56:19', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('78', 'admin', '112.65.138.234', '2016-05-13 13:56:30', 'CN|上海|上海|None|UNICOM|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('79', 'admin', '106.120.218.34', '2016-05-13 13:58:04', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('80', 'admin', '106.120.218.34', '2016-05-13 13:59:25', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('81', 'admin', '112.65.138.234', '2016-05-13 14:00:09', 'CN|上海|上海|None|UNICOM|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('82', 'admin', '222.168.33.190', '2016-05-13 14:01:20', 'CN|吉林|长春|None|CHINANET|0|0', '吉林省', '长春市', '53', '吉林省长春市', '125.31364243', '43.89833761');
INSERT INTO `login_log` VALUES ('83', 'admin', '114.111.167.93', '2016-05-13 14:04:15', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('84', 'admin', '117.25.59.136', '2016-05-13 14:04:15', 'CN|福建|福州|None|CHINANET|0|0', '福建省', '福州市', '300', '福建省福州市', '119.33022111', '26.04712550');
INSERT INTO `login_log` VALUES ('85', 'super', '61.135.194.168', '2016-05-13 14:06:51', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('86', 'admin', '218.6.169.95', '2016-05-13 14:07:45', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('87', 'admin', '112.65.138.234', '2016-05-13 14:10:15', 'CN|上海|上海|None|UNICOM|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('88', 'super', '61.135.194.168', '2016-05-13 14:14:19', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('89', 'admin', '211.142.134.98', '2016-05-13 14:28:11', 'CN|河南|许昌|None|CMNET|0|0', '河南省', '许昌市', '155', '河南省许昌市', '113.83531246', '34.02673959');
INSERT INTO `login_log` VALUES ('90', 'admin', '112.123.240.114', '2016-05-13 14:30:41', 'CN|安徽|黄山|None|UNICOM|0|0', '安徽省', '黄山市', '252', '安徽省黄山市', '118.29356963', '29.73443486');
INSERT INTO `login_log` VALUES ('91', 'admin', '222.18.127.77', '2016-05-13 14:33:57', 'CN|四川|成都|None|CERNET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('92', 'admin', '222.18.127.77', '2016-05-13 14:34:42', 'CN|四川|成都|None|CERNET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('93', 'admin', '124.205.39.138', '2016-05-13 14:35:32', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('97', 'admin', '61.50.103.158', '2016-05-13 14:42:06', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('106', 'admin', '61.135.194.168', '2016-05-13 15:03:47', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('107', 'super', '61.135.194.168', '2016-05-13 15:04:11', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('108', 'admin', '222.85.139.101', '2016-05-13 15:16:18', 'CN|贵州|贵阳|None|CHINANET|0|0', '贵州省', '贵阳市', '146', '贵州省贵阳市', '106.70917710', '26.62990674');
INSERT INTO `login_log` VALUES ('109', 'admin', '36.110.25.198', '2016-05-13 15:16:55', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('110', 'super', '61.135.194.168', '2016-05-13 15:17:18', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('111', 'admin', '171.88.164.38', '2016-05-13 15:17:24', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('112', 'admin', '222.85.139.101', '2016-05-13 15:17:29', 'CN|贵州|贵阳|None|CHINANET|0|0', '贵州省', '贵阳市', '146', '贵州省贵阳市', '106.70917710', '26.62990674');
INSERT INTO `login_log` VALUES ('113', 'admin', '124.163.223.84', '2016-05-13 15:17:35', 'CN|江苏|苏州|None|UNICOM|0|0', '江苏省', '苏州市', '224', '江苏省苏州市', '120.61990712', '31.31798737');
INSERT INTO `login_log` VALUES ('114', 'admin', '183.218.227.180', '2016-05-13 15:18:16', 'CN|江西|南昌|None|CMNET|0|0', '江西省', '南昌市', '163', '江西省南昌市', '115.89352755', '28.68957800');
INSERT INTO `login_log` VALUES ('115', 'admin', '124.163.223.84', '2016-05-13 15:20:23', 'CN|江苏|苏州|None|UNICOM|0|0', '江苏省', '苏州市', '224', '江苏省苏州市', '120.61990712', '31.31798737');
INSERT INTO `login_log` VALUES ('116', 'admin', '222.128.35.224', '2016-05-13 15:29:17', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('117', 'admin', '114.111.167.93', '2016-05-13 15:36:13', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('118', 'admin', '115.236.0.2', '2016-05-13 15:36:32', 'CN|浙江|杭州|None|CHINANET|0|0', '浙江省', '杭州市', '179', '浙江省杭州市', '120.21937542', '30.25924446');
INSERT INTO `login_log` VALUES ('119', 'admin', '61.135.194.168', '2016-05-13 15:37:33', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('120', 'admin', '61.135.194.168', '2016-05-13 15:37:33', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('121', 'admin', '183.62.60.90', '2016-05-13 15:45:27', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('122', 'admin', '61.135.194.168', '2016-05-13 15:47:51', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('123', 'admin', '180.169.33.113', '2016-05-13 16:03:28', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('124', 'admin', '124.114.130.114', '2016-05-13 16:04:14', 'CN|陕西|西安|None|CHINANET|0|0', '陕西省', '西安市', '233', '陕西省西安市', '108.95309828', '34.27779990');
INSERT INTO `login_log` VALUES ('125', 'admin', '219.142.62.107', '2016-05-13 16:10:33', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('126', 'super', '61.135.194.168', '2016-05-13 16:10:42', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('127', 'admin', '172.31.1.220', '2016-05-13 16:10:46', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('128', 'admin', '14.155.136.67', '2016-05-13 16:10:53', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('129', 'admin', '114.111.166.65', '2016-05-13 16:10:57', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('130', 'admin', '180.166.7.106', '2016-05-13 16:11:21', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('131', 'admin', '180.166.7.106', '2016-05-13 16:11:21', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('132', 'admin', '125.71.79.52', '2016-05-13 16:11:43', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('133', 'admin', '219.134.212.176', '2016-05-13 16:12:08', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('134', 'admin', '202.99.246.242', '2016-05-13 16:12:26', 'CN|内蒙古|呼和浩特|None|UNICOM|0|0', '内蒙古自治区', '呼和浩特市', '321', '内蒙古自治区呼和浩特市', '111.66035052', '40.82831887');
INSERT INTO `login_log` VALUES ('135', 'admin', '222.221.146.131', '2016-05-13 16:12:47', 'CN|云南|昆明|None|CHINANET|0|0', '云南省', '昆明市', '104', '云南省昆明市', '102.71460114', '25.04915310');
INSERT INTO `login_log` VALUES ('136', 'admin', '58.247.170.163', '2016-05-13 16:12:51', 'CN|上海|上海|None|UNICOM|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('137', 'admin', '222.221.146.131', '2016-05-13 16:14:24', 'CN|云南|昆明|None|CHINANET|0|0', '云南省', '昆明市', '104', '云南省昆明市', '102.71460114', '25.04915310');
INSERT INTO `login_log` VALUES ('138', 'admin', '220.184.255.57', '2016-05-13 16:16:43', 'CN|浙江|杭州|None|CHINANET|0|0', '浙江省', '杭州市', '179', '浙江省杭州市', '120.21937542', '30.25924446');
INSERT INTO `login_log` VALUES ('139', 'admin', '124.114.130.114', '2016-05-13 16:22:49', 'CN|陕西|西安|None|CHINANET|0|0', '陕西省', '西安市', '233', '陕西省西安市', '108.95309828', '34.27779990');
INSERT INTO `login_log` VALUES ('140', 'admin', '124.42.13.235', '2016-05-13 16:23:15', 'CN|北京|北京|None|HUARUI|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('141', 'admin', '58.214.19.138', '2016-05-13 16:29:03', 'CN|江苏|无锡|None|CHINANET|0|0', '江苏省', '无锡市', '317', '江苏省无锡市', '120.30545590', '31.57003745');
INSERT INTO `login_log` VALUES ('142', 'admin', '61.135.194.168', '2016-05-13 16:29:45', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('143', 'admin', '183.48.98.15', '2016-05-13 16:30:42', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('144', 'admin', '119.97.231.227', '2016-05-13 16:31:25', 'CN|湖北|武汉|None|CHINANET|0|0', '湖北省', '武汉市', '218', '湖北省武汉市', '114.31620010', '30.58108413');
INSERT INTO `login_log` VALUES ('145', 'admin', '183.62.60.90', '2016-05-13 16:32:35', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('146', 'admin', '222.175.157.234', '2016-05-13 16:35:00', 'CN|山东|济南|None|CHINANET|0|0', '山东省', '济南市', '288', '山东省济南市', '117.02496707', '36.68278473');
INSERT INTO `login_log` VALUES ('147', 'admin', '222.175.157.234', '2016-05-13 16:37:26', 'CN|山东|济南|None|CHINANET|0|0', '山东省', '济南市', '288', '山东省济南市', '117.02496707', '36.68278473');
INSERT INTO `login_log` VALUES ('148', 'admin', '223.104.5.237', '2016-05-13 16:37:30', 'CN|上海|上海|None|CMNET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('149', 'admin', '219.143.91.46', '2016-05-13 16:38:05', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('150', 'admin', '183.203.201.66', '2016-05-13 16:38:15', 'CN|山西|晋中|None|CMNET|0|0', '山西省', '晋中市', '238', '山西省晋中市', '112.73851440', '37.69336153');
INSERT INTO `login_log` VALUES ('151', 'admin', '124.207.147.186', '2016-05-13 16:38:56', 'CN|北京|北京|None|DXTNET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('152', 'admin', '219.143.91.46', '2016-05-13 16:40:12', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('153', 'admin', '118.193.218.119', '2016-05-13 16:41:13', 'CN|四川|成都|None|OTHER|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('154', 'admin', '58.218.250.42', '2016-05-13 16:41:14', 'CN|江苏|徐州|None|CHINANET|0|0', '江苏省', '徐州市', '316', '江苏省徐州市', '117.18810662', '34.27155343');
INSERT INTO `login_log` VALUES ('155', 'super', '61.135.194.168', '2016-05-13 16:41:49', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('156', 'admin', '27.210.211.39', '2016-05-13 16:51:39', 'CN|山东|青岛|None|UNICOM|0|0', '山东省', '青岛市', '236', '山东省青岛市', '120.38442818', '36.10521490');
INSERT INTO `login_log` VALUES ('157', 'admin', '124.114.130.114', '2016-05-13 16:51:40', 'CN|陕西|西安|None|CHINANET|0|0', '陕西省', '西安市', '233', '陕西省西安市', '108.95309828', '34.27779990');
INSERT INTO `login_log` VALUES ('158', 'admin', '218.17.162.137', '2016-05-13 16:51:44', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('159', 'admin', '58.220.197.198', '2016-05-13 16:55:28', 'CN|江苏|扬州|None|CHINANET|0|0', '江苏省', '扬州市', '346', '江苏省扬州市', '119.42777755', '32.40850525');
INSERT INTO `login_log` VALUES ('160', 'admin', '121.14.104.61', '2016-05-13 16:56:36', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('161', 'admin', '58.220.197.198', '2016-05-13 16:56:46', 'CN|江苏|扬州|None|CHINANET|0|0', '江苏省', '扬州市', '346', '江苏省扬州市', '119.42777755', '32.40850525');
INSERT INTO `login_log` VALUES ('162', 'admin', '222.211.172.191', '2016-05-13 16:56:54', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('163', 'admin', '222.211.172.191', '2016-05-13 16:56:59', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('164', 'admin', '119.57.160.153', '2016-05-13 16:57:17', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('165', 'admin', '1.56.84.8', '2016-05-13 16:58:15', 'CN|黑龙江|鹤岗|None|UNICOM|0|0', '黑龙江省', '鹤岗市', '43', '黑龙江省鹤岗市', '130.29247205', '47.33866590');
INSERT INTO `login_log` VALUES ('166', 'admin', '119.85.124.246', '2016-05-13 16:58:32', 'CN|重庆|重庆|None|CHINANET|0|0', '重庆市', '重庆市', '132', '重庆市', '106.53063501', '29.54460611');
INSERT INTO `login_log` VALUES ('167', 'admin', '106.37.28.138', '2016-05-13 21:28:42', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('168', 'admin', '117.114.129.167', '2016-05-13 21:31:39', 'CN|湖南|长沙|None|CHINANET|0|0', '湖南省', '长沙市', '158', '湖南省长沙市', '112.97935279', '28.21347823');
INSERT INTO `login_log` VALUES ('169', 'admin', '183.216.3.47', '2016-05-13 21:33:27', 'CN|江西|南昌|None|CMNET|0|0', '江西省', '南昌市', '163', '江西省南昌市', '115.89352755', '28.68957800');
INSERT INTO `login_log` VALUES ('170', 'admin', '106.37.28.138', '2016-05-13 21:36:14', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('171', 'admin', '110.184.66.199', '2016-05-13 21:45:42', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('172', 'admin', '14.18.62.99', '2016-05-13 21:55:27', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('173', 'admin', '14.18.62.99', '2016-05-13 22:14:21', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('174', 'admin', '115.194.42.153', '2016-05-13 22:28:07', 'CN|浙江|杭州|None|CHINANET|0|0', '浙江省', '杭州市', '179', '浙江省杭州市', '120.21937542', '30.25924446');
INSERT INTO `login_log` VALUES ('175', 'admin', '58.62.103.92', '2016-05-13 22:39:39', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('176', 'admin', '106.37.28.138', '2016-05-13 22:40:26', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('177', 'super', '58.62.103.92', '2016-05-13 22:40:54', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('178', 'admin', '223.104.11.118', '2016-05-13 22:42:13', 'CN|陕西|西安|None|CMNET|0|0', '陕西省', '西安市', '233', '陕西省西安市', '108.95309828', '34.27779990');
INSERT INTO `login_log` VALUES ('179', 'admin', '112.9.242.157', '2016-05-13 22:50:59', 'CN|山东|None|None|CMNET|0|0', '山东省', '', '8', '山东省', '118.52766339', '36.09928993');
INSERT INTO `login_log` VALUES ('180', 'admin', '222.204.1.6', '2016-05-13 23:05:48', 'CN|江西|南昌|None|CERNET|0|0', '江西省', '南昌市', '163', '江西省南昌市', '115.89352755', '28.68957800');
INSERT INTO `login_log` VALUES ('181', 'admin', '180.157.165.193', '2016-05-13 23:09:02', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('182', 'admin', '106.92.246.28', '2016-05-13 23:09:57', 'CN|重庆|重庆|None|CHINANET|0|0', '重庆市', '重庆市', '132', '重庆市', '106.53063501', '29.54460611');
INSERT INTO `login_log` VALUES ('183', 'admin', '180.157.165.193', '2016-05-13 23:46:05', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('184', 'admin', '220.160.51.150', '2016-05-14 00:26:50', 'CN|福建|福州|None|CHINANET|0|0', '福建省', '福州市', '300', '福建省福州市', '119.33022111', '26.04712550');
INSERT INTO `login_log` VALUES ('185', 'admin', '106.37.28.146', '2016-05-14 07:50:55', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('186', 'admin', '106.37.28.141', '2016-05-14 08:45:12', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('187', 'admin', '106.37.28.137', '2016-05-14 10:23:09', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('188', 'super', '106.37.28.137', '2016-05-14 10:24:41', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('189', 'admin', '106.37.28.137', '2016-05-14 10:30:02', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('190', 'admin', '106.37.28.137', '2016-05-14 10:43:32', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('191', 'admin', '112.90.231.17', '2016-05-14 11:08:46', 'CN|广东|广州|None|UNICOM|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('192', 'admin', '106.37.28.137', '2016-05-14 11:11:02', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('193', 'admin', '220.180.184.4', '2016-05-14 11:12:28', 'CN|安徽|滁州|None|CHINANET|0|0', '安徽省', '滁州市', '189', '安徽省滁州市', '118.32457035', '32.31735060');
INSERT INTO `login_log` VALUES ('194', 'admin', '1.83.234.169', '2016-05-14 11:15:34', 'CN|陕西|西安|None|CHINANET|0|0', '陕西省', '西安市', '233', '陕西省西安市', '108.95309828', '34.27779990');
INSERT INTO `login_log` VALUES ('195', 'admin', '14.146.16.46', '2016-05-14 11:15:49', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('196', 'admin', '120.194.82.142', '2016-05-14 11:16:59', 'CN|河南|驻马店|None|CMNET|0|0', '河南省', '驻马店市', '269', '河南省驻马店市', '114.04915355', '32.98315815');
INSERT INTO `login_log` VALUES ('197', 'admin', '1.83.235.252', '2016-05-14 11:18:26', 'CN|陕西|西安|None|CHINANET|0|0', '陕西省', '西安市', '233', '陕西省西安市', '108.95309828', '34.27779990');
INSERT INTO `login_log` VALUES ('198', 'admin', '60.10.71.2', '2016-05-14 11:21:02', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('199', 'admin', '106.37.28.132', '2016-05-14 11:55:45', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('200', 'admin', '119.7.51.166', '2016-05-14 13:25:49', 'CN|四川|绵阳|None|UNICOM|0|0', '四川省', '绵阳市', '240', '四川省绵阳市', '104.70551898', '31.50470126');
INSERT INTO `login_log` VALUES ('201', 'admin', '106.37.28.132', '2016-05-14 16:20:45', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('202', 'admin', '106.37.28.136', '2016-05-14 17:30:26', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('203', 'admin', '106.37.28.136', '2016-05-14 17:30:58', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('204', 'admin', '106.37.28.138', '2016-05-14 19:43:58', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('205', 'admin', '106.37.28.138', '2016-05-14 20:26:05', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('206', 'admin', '106.37.28.143', '2016-05-15 07:08:40', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('207', 'admin', '106.37.28.140', '2016-05-15 07:43:52', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('208', 'admin', '121.32.9.72', '2016-05-15 08:15:45', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('209', 'admin', '106.37.28.132', '2016-05-15 08:22:06', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('210', 'admin', '123.118.218.122', '2016-05-15 13:46:48', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('211', 'admin', '106.37.28.132', '2016-05-15 16:39:34', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('212', 'admin', '182.201.234.225', '2016-05-15 16:47:42', 'CN|辽宁|大连|None|CHINANET|0|0', '辽宁省', '大连市', '167', '辽宁省大连市', '121.59347778', '38.94870994');
INSERT INTO `login_log` VALUES ('213', 'admin', '182.201.234.225', '2016-05-15 16:48:13', 'CN|辽宁|大连|None|CHINANET|0|0', '辽宁省', '大连市', '167', '辽宁省大连市', '121.59347778', '38.94870994');
INSERT INTO `login_log` VALUES ('214', 'admin', '58.251.73.230', '2016-05-15 19:27:42', 'CN|广东|深圳|None|UNICOM|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('215', 'admin', '116.234.96.35', '2016-05-15 19:28:23', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('216', 'admin', '116.234.96.35', '2016-05-15 19:29:13', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('217', 'admin', '210.32.120.103', '2016-05-15 20:13:55', 'CN|浙江|金华|None|CERNET|0|0', '浙江省', '金华市', '333', '浙江省金华市', '119.65257570', '29.10289911');
INSERT INTO `login_log` VALUES ('218', 'admin', '39.82.125.150', '2016-05-15 23:00:04', 'CN|山东|济南|None|UNICOM|0|0', '山东省', '济南市', '288', '山东省济南市', '117.02496707', '36.68278473');
INSERT INTO `login_log` VALUES ('219', 'admin', '39.82.125.150', '2016-05-15 23:02:06', 'CN|山东|济南|None|UNICOM|0|0', '山东省', '济南市', '288', '山东省济南市', '117.02496707', '36.68278473');
INSERT INTO `login_log` VALUES ('220', 'admin', '140.243.45.37', '2016-05-16 00:54:11', 'CN|福建|厦门|None|CHINANET|0|0', '福建省', '厦门市', '194', '福建省厦门市', '118.10388605', '24.48923061');
INSERT INTO `login_log` VALUES ('221', 'admin', '36.110.29.50', '2016-05-16 09:12:33', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('222', 'super', '120.52.24.20', '2016-05-16 09:35:55', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('224', 'admin', '218.93.112.174', '2016-05-16 09:42:12', 'CN|江苏|常州|None|CHINANET|0|0', '江苏省', '常州市', '348', '江苏省常州市', '119.98186101', '31.77139674');
INSERT INTO `login_log` VALUES ('228', 'admin', '116.231.224.17', '2016-05-16 09:56:52', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('229', 'super', '120.52.24.20', '2016-05-16 10:14:48', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('230', 'admin', '202.85.220.38', '2016-05-16 10:15:50', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('231', 'admin', '114.242.234.214', '2016-05-16 10:27:22', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('232', 'admin', '59.46.172.210', '2016-05-16 11:15:04', 'CN|辽宁|大连|None|CHINANET|0|0', '辽宁省', '大连市', '167', '辽宁省大连市', '121.59347778', '38.94870994');
INSERT INTO `login_log` VALUES ('233', 'admin', '59.46.172.210', '2016-05-16 11:15:10', 'CN|辽宁|大连|None|CHINANET|0|0', '辽宁省', '大连市', '167', '辽宁省大连市', '121.59347778', '38.94870994');
INSERT INTO `login_log` VALUES ('234', 'admin', '182.46.1.231', '2016-05-16 11:37:14', 'CN|山东|济南|None|CHINANET|0|0', '山东省', '济南市', '288', '山东省济南市', '117.02496707', '36.68278473');
INSERT INTO `login_log` VALUES ('235', 'admin', '182.46.1.231', '2016-05-16 11:37:23', 'CN|山东|济南|None|CHINANET|0|0', '山东省', '济南市', '288', '山东省济南市', '117.02496707', '36.68278473');
INSERT INTO `login_log` VALUES ('236', 'admin', '182.46.1.231', '2016-05-16 11:42:09', 'CN|山东|济南|None|CHINANET|0|0', '山东省', '济南市', '288', '山东省济南市', '117.02496707', '36.68278473');
INSERT INTO `login_log` VALUES ('237', 'admin', '182.46.1.231', '2016-05-16 11:42:16', 'CN|山东|济南|None|CHINANET|0|0', '山东省', '济南市', '288', '山东省济南市', '117.02496707', '36.68278473');
INSERT INTO `login_log` VALUES ('238', 'super', '120.52.24.24', '2016-05-16 12:17:37', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('242', 'admin', '120.52.24.24', '2016-05-16 14:41:03', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('243', 'admin', '101.81.49.159', '2016-05-16 14:41:57', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('244', 'admin', '101.81.49.159', '2016-05-16 14:41:58', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('245', 'admin', '120.52.24.24', '2016-05-16 15:10:31', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('246', 'admin', '124.42.13.235', '2016-05-16 15:14:01', 'CN|北京|北京|None|HUARUI|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('248', 'admin', '101.81.49.159', '2016-05-16 15:48:06', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('253', 'admin', '120.52.24.24', '2016-05-16 16:40:56', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('255', 'admin', '120.52.24.24', '2016-05-16 17:07:40', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('256', 'admin', '120.52.24.24', '2016-05-16 17:07:51', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('257', 'admin', '120.52.24.24', '2016-05-16 17:07:58', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('258', 'admin', '120.52.24.24', '2016-05-16 17:08:04', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('259', 'admin', '120.52.24.24', '2016-05-16 17:08:09', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('260', 'admin', '120.52.24.24', '2016-05-16 17:54:45', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('261', 'admin', '120.52.24.24', '2016-05-16 18:40:56', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('262', 'super', '120.52.24.24', '2016-05-16 18:42:05', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('263', 'admin', '222.204.1.6', '2016-05-16 18:43:08', 'CN|江西|南昌|None|CERNET|0|0', '江西省', '南昌市', '163', '江西省南昌市', '115.89352755', '28.68957800');
INSERT INTO `login_log` VALUES ('264', 'admin', '120.52.24.24', '2016-05-16 18:44:51', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('265', 'admin', '120.52.24.24', '2016-05-16 18:45:39', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('266', 'admin', '180.169.33.113', '2016-05-16 18:48:04', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('267', 'admin', '111.85.183.104', '2016-05-16 18:53:01', 'CN|贵州|贵阳|None|UNICOM|0|0', '贵州省', '贵阳市', '146', '贵州省贵阳市', '106.70917710', '26.62990674');
INSERT INTO `login_log` VALUES ('268', 'admin', '218.17.162.137', '2016-05-16 19:05:36', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('269', 'super', '123.235.2.249', '2016-05-16 19:05:59', 'CN|山东|青岛|None|UNICOM|0|0', '山东省', '青岛市', '236', '山东省青岛市', '120.38442818', '36.10521490');
INSERT INTO `login_log` VALUES ('270', 'super', '182.46.1.231', '2016-05-16 19:06:04', 'CN|山东|济南|None|CHINANET|0|0', '山东省', '济南市', '288', '山东省济南市', '117.02496707', '36.68278473');
INSERT INTO `login_log` VALUES ('271', 'super', '123.233.114.178', '2016-05-16 19:06:09', 'CN|山东|济南|None|UNICOM|0|0', '山东省', '济南市', '288', '山东省济南市', '117.02496707', '36.68278473');
INSERT INTO `login_log` VALUES ('272', 'admin', '222.169.127.8', '2016-05-16 19:06:15', 'CN|吉林|白城|None|CHINANET|0|0', '吉林省', '白城市', '51', '吉林省白城市', '122.84077668', '45.62108628');
INSERT INTO `login_log` VALUES ('273', 'super', '218.242.91.19', '2016-05-16 19:06:28', 'CN|上海|上海|None|COLNET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('274', 'super', '222.35.39.205', '2016-05-16 19:06:31', 'CN|北京|北京|None|CRTC|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('275', 'super', '116.23.230.18', '2016-05-16 19:06:51', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('276', 'super', '223.104.1.253', '2016-05-16 19:06:58', 'CN|广东|广州|None|CMNET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('277', 'super', '223.104.3.198', '2016-05-16 19:06:59', 'CN|北京|北京|None|CMNET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('278', 'super', '171.117.51.179', '2016-05-16 19:07:07', 'CN|山西|太原|None|UNICOM|0|0', '山西省', '太原市', '176', '山西省太原市', '112.55086359', '37.89027705');
INSERT INTO `login_log` VALUES ('279', 'admin', '124.205.63.7', '2016-05-16 19:08:02', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('280', 'super', '124.205.63.7', '2016-05-16 19:08:22', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('281', 'admin', '114.83.86.91', '2016-05-16 19:09:35', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('282', 'super', '180.169.33.113', '2016-05-16 19:09:43', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('283', 'super', '114.111.167.123', '2016-05-16 19:10:26', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('284', 'super', '113.57.182.1', '2016-05-16 19:27:15', 'CN|湖北|武汉|None|UNICOM|0|0', '湖北省', '武汉市', '218', '湖北省武汉市', '114.31620010', '30.58108413');
INSERT INTO `login_log` VALUES ('286', 'admin', '120.52.24.24', '2016-05-16 20:17:00', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('287', 'super', '223.104.33.97', '2016-05-16 20:18:31', 'CN|安徽|合肥|None|CMNET|0|0', '安徽省', '合肥市', '127', '安徽省合肥市', '117.28269909', '31.86694226');
INSERT INTO `login_log` VALUES ('288', 'super', '182.46.1.231', '2016-05-16 20:21:41', 'CN|山东|济南|None|CHINANET|0|0', '山东省', '济南市', '288', '山东省济南市', '117.02496707', '36.68278473');
INSERT INTO `login_log` VALUES ('289', 'admin', '115.220.50.242', '2016-05-16 20:22:34', 'CN|浙江|宁波|None|CHINANET|0|0', '浙江省', '宁波市', '180', '浙江省宁波市', '121.57900597', '29.88525897');
INSERT INTO `login_log` VALUES ('290', 'admin', '183.128.158.66', '2016-05-16 20:32:58', 'CN|浙江|杭州|None|CHINANET|0|0', '浙江省', '杭州市', '179', '浙江省杭州市', '120.21937542', '30.25924446');
INSERT INTO `login_log` VALUES ('291', 'admin', '219.142.236.39', '2016-05-16 20:33:16', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('292', 'admin', '106.37.236.228', '2016-05-16 20:34:59', 'CN|云南|昆明|None|CHINANET|0|0', '云南省', '昆明市', '104', '云南省昆明市', '102.71460114', '25.04915310');
INSERT INTO `login_log` VALUES ('293', 'admin', '182.96.183.85', '2016-05-16 20:35:30', 'CN|江西|南昌|None|CHINANET|0|0', '江西省', '南昌市', '163', '江西省南昌市', '115.89352755', '28.68957800');
INSERT INTO `login_log` VALUES ('294', 'admin', '117.83.150.193', '2016-05-16 20:37:29', 'CN|江苏|苏州|None|CHINANET|0|0', '江苏省', '苏州市', '224', '江苏省苏州市', '120.61990712', '31.31798737');
INSERT INTO `login_log` VALUES ('295', 'admin', '183.206.175.31', '2016-05-16 20:40:06', 'CN|江苏|南京|None|CMNET|0|0', '江苏省', '南京市', '315', '江苏省南京市', '118.77807441', '32.05723550');
INSERT INTO `login_log` VALUES ('296', 'admin', '1.204.144.3', '2016-05-16 20:43:10', 'CN|贵州|贵阳|None|CHINANET|0|0', '贵州省', '贵阳市', '146', '贵州省贵阳市', '106.70917710', '26.62990674');
INSERT INTO `login_log` VALUES ('297', 'admin', '101.229.234.26', '2016-05-16 20:43:38', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('298', 'admin', '223.104.9.89', '2016-05-16 20:44:25', 'CN|四川|成都|None|CMNET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('299', 'admin', '112.96.161.153', '2016-05-16 20:47:17', 'CN|广东|佛山|None|UNICOM|0|0', '广东省', '佛山市', '138', '广东省佛山市', '113.13402564', '23.03509484');
INSERT INTO `login_log` VALUES ('300', 'admin', '120.194.43.164', '2016-05-16 20:47:53', 'CN|河南|洛阳|None|CMNET|0|0', '河南省', '洛阳市', '153', '河南省洛阳市', '112.44752477', '34.65736782');
INSERT INTO `login_log` VALUES ('301', 'admin', '117.136.38.195', '2016-05-16 20:48:10', 'CN|北京|北京|None|CMNET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('302', 'admin', '10.192.31.88', '2016-05-16 20:48:14', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('303', 'admin', '119.129.122.120', '2016-05-16 20:48:35', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('304', 'admin', '117.114.129.167', '2016-05-16 20:49:10', 'CN|湖南|长沙|None|CHINANET|0|0', '湖南省', '长沙市', '158', '湖南省长沙市', '112.97935279', '28.21347823');
INSERT INTO `login_log` VALUES ('305', 'admin', '112.96.161.153', '2016-05-16 20:49:46', 'CN|广东|佛山|None|UNICOM|0|0', '广东省', '佛山市', '138', '广东省佛山市', '113.13402564', '23.03509484');
INSERT INTO `login_log` VALUES ('306', 'admin', '10.192.31.88', '2016-05-16 20:51:01', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('307', 'admin', '119.129.123.37', '2016-05-16 20:52:18', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('308', 'admin', '61.141.233.35', '2016-05-16 20:55:21', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('309', 'admin', '124.126.233.88', '2016-05-16 20:57:43', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('310', 'admin', '120.52.24.24', '2016-05-16 20:59:52', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('311', 'admin', '111.201.201.123', '2016-05-16 21:16:01', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('312', 'admin', '113.250.249.144', '2016-05-16 21:25:15', 'CN|重庆|重庆|None|CHINANET|0|0', '重庆市', '重庆市', '132', '重庆市', '106.53063501', '29.54460611');
INSERT INTO `login_log` VALUES ('313', 'admin', '222.204.1.6', '2016-05-16 21:41:36', 'CN|江西|南昌|None|CERNET|0|0', '江西省', '南昌市', '163', '江西省南昌市', '115.89352755', '28.68957800');
INSERT INTO `login_log` VALUES ('314', 'admin', '118.212.150.191', '2016-05-16 22:07:32', 'CN|江西|None|None|UNICOM|0|0', '江西省', '', '31', '江西省', '115.67608237', '27.75725844');
INSERT INTO `login_log` VALUES ('315', 'admin', '60.166.227.88', '2016-05-16 22:07:48', 'CN|安徽|合肥|None|CHINANET|0|0', '安徽省', '合肥市', '127', '安徽省合肥市', '117.28269909', '31.86694226');
INSERT INTO `login_log` VALUES ('316', 'admin', '118.212.150.191', '2016-05-16 22:11:26', 'CN|江西|None|None|UNICOM|0|0', '江西省', '', '31', '江西省', '115.67608237', '27.75725844');
INSERT INTO `login_log` VALUES ('317', 'admin', '118.212.150.191', '2016-05-16 22:11:40', 'CN|江西|None|None|UNICOM|0|0', '江西省', '', '31', '江西省', '115.67608237', '27.75725844');
INSERT INTO `login_log` VALUES ('318', 'admin', '120.52.24.24', '2016-05-16 22:23:25', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('347', 'admin', '112.64.61.53', '2016-05-16 23:26:41', 'CN|上海|上海|None|UNICOM|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('348', 'admin', '114.83.86.91', '2016-05-16 23:43:10', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('349', 'admin', '1.27.90.220', '2016-05-16 23:57:15', 'CN|内蒙古|赤峰|None|UNICOM|0|0', '内蒙古自治区', '赤峰市', '297', '内蒙古自治区赤峰市', '118.93076119', '42.29711232');
INSERT INTO `login_log` VALUES ('350', 'admin', '61.149.241.195', '2016-05-16 23:58:53', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('351', 'admin', '111.132.235.219', '2016-05-17 07:03:04', 'CN|北京|北京|None|CRTC|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('352', 'admin', '124.65.129.74', '2016-05-17 07:38:07', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('353', 'admin', '121.12.144.242', '2016-05-17 08:02:53', 'CN|广东|东莞|None|OTHER|0|0', '广东省', '东莞市', '119', '广东省东莞市', '113.76343399', '23.04302382');
INSERT INTO `login_log` VALUES ('354', 'admin', '111.203.167.14', '2016-05-17 08:58:07', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('355', 'admin', '120.52.24.24', '2016-05-17 09:46:13', 'CN|广东|None|None|UNICOM|0|0', '广东省', '', '7', '广东省', '113.39481756', '23.40800373');
INSERT INTO `login_log` VALUES ('356', 'admin', '0:0:0:0:0:0:0:1', '2016-05-17 10:06:27', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('357', 'admin', '58.61.82.11', '2016-05-17 10:42:46', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('358', 'admin', '111.203.45.2', '2016-05-17 10:56:58', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('359', 'admin', '114.242.234.214', '2016-05-17 11:01:54', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('369', 'admin', '221.194.176.10', '2016-05-17 12:49:04', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('370', 'admin', '221.4.34.17', '2016-05-17 13:11:23', 'CN|广东|广州|None|UNICOM|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('371', 'admin', '182.200.43.230', '2016-05-17 13:11:23', 'CN|辽宁|沈阳|None|CHINANET|0|0', '辽宁省', '沈阳市', '58', '辽宁省沈阳市', '123.43279092', '41.80864478');
INSERT INTO `login_log` VALUES ('372', 'admin', '221.4.34.17', '2016-05-17 13:12:20', 'CN|广东|广州|None|UNICOM|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('373', 'admin', '222.204.1.6', '2016-05-17 13:12:28', 'CN|江西|南昌|None|CERNET|0|0', '江西省', '南昌市', '163', '江西省南昌市', '115.89352755', '28.68957800');
INSERT INTO `login_log` VALUES ('374', 'admin', '222.204.1.6', '2016-05-17 13:15:02', 'CN|江西|南昌|None|CERNET|0|0', '江西省', '南昌市', '163', '江西省南昌市', '115.89352755', '28.68957800');
INSERT INTO `login_log` VALUES ('375', 'admin', '182.200.43.230', '2016-05-17 13:21:29', 'CN|辽宁|沈阳|None|CHINANET|0|0', '辽宁省', '沈阳市', '58', '辽宁省沈阳市', '123.43279092', '41.80864478');
INSERT INTO `login_log` VALUES ('401', 'admin', '221.194.176.16', '2016-05-17 20:54:14', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('402', 'admin', '221.194.176.16', '2016-05-17 20:54:46', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('403', 'admin', '120.52.24.21', '2016-05-19 16:14:14', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('404', 'admin', '114.88.160.82', '2016-05-19 16:14:31', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('405', 'admin', '120.52.24.21', '2016-05-19 16:15:34', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('406', 'admin', '120.52.24.21', '2016-05-19 16:16:13', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('407', 'admin', '222.85.139.101', '2016-05-19 16:17:09', 'CN|贵州|贵阳|None|CHINANET|0|0', '贵州省', '贵阳市', '146', '贵州省贵阳市', '106.70917710', '26.62990674');
INSERT INTO `login_log` VALUES ('408', 'admin', '183.211.52.76', '2016-05-19 16:17:24', 'CN|江苏|徐州|None|CMNET|0|0', '江苏省', '徐州市', '316', '江苏省徐州市', '117.18810662', '34.27155343');
INSERT INTO `login_log` VALUES ('409', 'admin', '49.77.222.114', '2016-05-19 16:18:34', 'CN|江苏|南京|None|CHINANET|0|0', '江苏省', '南京市', '315', '江苏省南京市', '118.77807441', '32.05723550');
INSERT INTO `login_log` VALUES ('410', 'admin', '222.85.139.101', '2016-05-19 16:19:03', 'CN|贵州|贵阳|None|CHINANET|0|0', '贵州省', '贵阳市', '146', '贵州省贵阳市', '106.70917710', '26.62990674');
INSERT INTO `login_log` VALUES ('411', 'admin', '222.85.139.101', '2016-05-19 16:20:06', 'CN|贵州|贵阳|None|CHINANET|0|0', '贵州省', '贵阳市', '146', '贵州省贵阳市', '106.70917710', '26.62990674');
INSERT INTO `login_log` VALUES ('412', 'admin', '222.85.139.101', '2016-05-19 16:21:08', 'CN|贵州|贵阳|None|CHINANET|0|0', '贵州省', '贵阳市', '146', '贵州省贵阳市', '106.70917710', '26.62990674');
INSERT INTO `login_log` VALUES ('413', 'admin', '120.52.24.21', '2016-05-19 16:22:00', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('414', 'admin', '49.77.222.114', '2016-05-19 16:23:29', 'CN|江苏|南京|None|CHINANET|0|0', '江苏省', '南京市', '315', '江苏省南京市', '118.77807441', '32.05723550');
INSERT INTO `login_log` VALUES ('415', 'admin', '222.85.139.101', '2016-05-19 16:24:48', 'CN|贵州|贵阳|None|CHINANET|0|0', '贵州省', '贵阳市', '146', '贵州省贵阳市', '106.70917710', '26.62990674');
INSERT INTO `login_log` VALUES ('416', 'admin', '49.77.222.114', '2016-05-19 16:25:03', 'CN|江苏|南京|None|CHINANET|0|0', '江苏省', '南京市', '315', '江苏省南京市', '118.77807441', '32.05723550');
INSERT INTO `login_log` VALUES ('417', 'admin', '221.194.176.17', '2016-05-19 16:26:14', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('418', 'super', '120.52.24.21', '2016-05-19 16:28:03', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('419', 'admin', '101.81.14.34', '2016-05-19 16:42:01', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('420', 'admin', '180.169.33.113', '2016-05-19 17:31:24', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('425', 'admin', '60.186.189.181', '2016-05-19 18:01:52', 'CN|浙江|杭州|None|CHINANET|0|0', '浙江省', '杭州市', '179', '浙江省杭州市', '120.21937542', '30.25924446');
INSERT INTO `login_log` VALUES ('430', 'admin', '114.251.179.129', '2016-05-19 18:31:13', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('449', 'admin', '118.212.150.185', '2016-05-19 20:22:47', 'CN|上海|上海|None|UNICOM|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('461', 'admin', '120.52.24.21', '2016-05-19 21:15:20', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('462', 'admin', '120.52.24.21', '2016-05-19 21:30:08', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('463', 'admin', '120.52.24.21', '2016-05-19 21:30:58', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('464', 'super', '59.48.111.86', '2016-05-19 21:45:59', 'CN|山西|晋中|None|CHINANET|0|0', '山西省', '晋中市', '238', '山西省晋中市', '112.73851440', '37.69336153');
INSERT INTO `login_log` VALUES ('465', 'admin', '112.226.141.152', '2016-05-19 22:02:57', 'CN|山东|青岛|None|UNICOM|0|0', '山东省', '青岛市', '236', '山东省青岛市', '120.38442818', '36.10521490');
INSERT INTO `login_log` VALUES ('466', 'admin', '120.52.24.21', '2016-05-19 22:44:37', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('467', 'admin', '222.41.112.91', '2016-05-19 22:47:33', 'CN|陕西|西安|None|CRTC|0|0', '陕西省', '西安市', '233', '陕西省西安市', '108.95309828', '34.27779990');
INSERT INTO `login_log` VALUES ('468', 'admin', '27.38.32.48', '2016-05-19 22:48:02', 'CN|广东|深圳|None|UNICOM|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('469', 'admin', '183.49.87.206', '2016-05-19 22:56:05', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('470', 'admin', '120.52.24.21', '2016-05-19 23:08:10', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('471', 'admin', '120.52.24.21', '2016-05-19 23:11:10', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('472', 'super', '120.52.24.21', '2016-05-19 23:13:32', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('473', 'admin', '58.42.242.7', '2016-05-20 00:56:57', 'CN|贵州|贵阳|None|CHINANET|0|0', '贵州省', '贵阳市', '146', '贵州省贵阳市', '106.70917710', '26.62990674');
INSERT INTO `login_log` VALUES ('476', 'admin', '210.32.120.110', '2016-05-20 01:01:24', 'CN|浙江|杭州|None|CERNET|0|0', '浙江省', '杭州市', '179', '浙江省杭州市', '120.21937542', '30.25924446');
INSERT INTO `login_log` VALUES ('477', 'admin', '120.52.24.21', '2016-05-20 01:16:01', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('478', 'admin', '61.131.90.198', '2016-05-20 01:21:19', 'CN|福建|福州|None|CHINANET|0|0', '福建省', '福州市', '300', '福建省福州市', '119.33022111', '26.04712550');
INSERT INTO `login_log` VALUES ('479', 'admin', '61.131.90.198', '2016-05-20 01:22:43', 'CN|福建|福州|None|CHINANET|0|0', '福建省', '福州市', '300', '福建省福州市', '119.33022111', '26.04712550');
INSERT INTO `login_log` VALUES ('485', 'admin', '120.52.24.21', '2016-05-20 01:51:40', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('486', 'admin', '59.48.111.2', '2016-05-20 08:25:21', 'CN|山西|晋中|None|CHINANET|0|0', '山西省', '晋中市', '238', '山西省晋中市', '112.73851440', '37.69336153');
INSERT INTO `login_log` VALUES ('487', 'admin', '219.142.236.39', '2016-05-20 09:24:12', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('488', 'admin', '219.142.236.39', '2016-05-20 09:26:04', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('489', 'admin', '121.34.102.167', '2016-05-20 09:29:41', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('490', 'super', '182.46.1.81', '2016-05-20 10:56:45', 'CN|山东|潍坊|None|CHINANET|0|0', '山东省', '潍坊市', '287', '山东省潍坊市', '119.14263382', '36.71611487');
INSERT INTO `login_log` VALUES ('491', 'admin', '60.190.244.158', '2016-05-20 13:07:15', 'CN|浙江|杭州|None|CHINANET|0|0', '浙江省', '杭州市', '179', '浙江省杭州市', '120.21937542', '30.25924446');
INSERT INTO `login_log` VALUES ('492', 'admin', '124.207.133.253', '2016-05-20 13:40:53', 'CN|北京|北京|None|DXTNET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('493', 'admin', '106.37.28.136', '2016-05-20 13:42:51', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('494', 'admin', '106.37.28.136', '2016-05-20 13:44:17', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('495', 'admin', '123.125.212.69', '2016-05-20 14:50:30', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('496', 'admin', '120.236.170.109', '2016-05-20 15:00:03', 'CN|广东|广州|None|CMNET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('497', 'admin', '180.166.7.106', '2016-05-20 15:26:25', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('498', 'admin', '218.6.169.95', '2016-05-20 15:51:19', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('499', 'admin', '125.69.143.142', '2016-05-20 16:02:45', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('500', 'admin', '106.37.28.135', '2016-05-20 19:08:33', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('501', 'admin', '116.231.224.17', '2016-05-21 14:21:04', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('502', 'admin', '110.53.162.196', '2016-05-21 17:59:12', 'CN|湖南|长沙|None|UNICOM|0|0', '湖南省', '长沙市', '158', '湖南省长沙市', '112.97935279', '28.21347823');
INSERT INTO `login_log` VALUES ('503', 'admin', '113.118.247.162', '2016-05-22 15:40:17', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('504', 'admin', '113.118.247.162', '2016-05-22 15:42:06', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('505', 'admin', '106.37.28.133', '2016-05-22 16:02:31', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('506', 'admin', '113.118.247.162', '2016-05-22 16:52:58', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('507', 'admin', '113.118.247.162', '2016-05-22 16:53:31', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('508', 'admin', '218.18.113.199', '2016-05-22 20:15:02', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('509', 'admin', '218.29.124.228', '2016-05-22 21:56:57', 'CN|河南|郑州|None|UNICOM|0|0', '河南省', '郑州市', '268', '河南省郑州市', '113.64964385', '34.75661006');
INSERT INTO `login_log` VALUES ('518', 'admin', '58.61.43.195', '2016-05-23 09:46:48', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('519', 'admin', '114.222.69.182', '2016-05-23 09:49:21', 'CN|江苏|南京|None|CHINANET|0|0', '江苏省', '南京市', '315', '江苏省南京市', '118.77807441', '32.05723550');
INSERT INTO `login_log` VALUES ('520', 'admin', '114.222.69.182', '2016-05-23 09:49:41', 'CN|江苏|南京|None|CHINANET|0|0', '江苏省', '南京市', '315', '江苏省南京市', '118.77807441', '32.05723550');
INSERT INTO `login_log` VALUES ('522', 'admin', '61.135.194.170', '2016-05-23 13:42:34', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('524', 'admin', '61.135.194.170', '2016-05-23 14:32:47', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('530', 'admin', '220.180.239.228', '2016-05-23 17:05:55', 'CN|安徽|合肥|None|CHINANET|0|0', '安徽省', '合肥市', '127', '安徽省合肥市', '117.28269909', '31.86694226');
INSERT INTO `login_log` VALUES ('531', 'admin', '220.180.239.228', '2016-05-23 17:06:22', 'CN|安徽|合肥|None|CHINANET|0|0', '安徽省', '合肥市', '127', '安徽省合肥市', '117.28269909', '31.86694226');
INSERT INTO `login_log` VALUES ('532', 'admin', '220.180.239.228', '2016-05-23 19:54:53', 'CN|安徽|合肥|None|CHINANET|0|0', '安徽省', '合肥市', '127', '安徽省合肥市', '117.28269909', '31.86694226');
INSERT INTO `login_log` VALUES ('533', 'admin', '218.17.157.250', '2016-05-24 09:04:43', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('549', 'admin', '115.199.242.73', '2016-05-24 13:56:58', 'CN|浙江|杭州|None|CHINANET|0|0', '浙江省', '杭州市', '179', '浙江省杭州市', '120.21937542', '30.25924446');
INSERT INTO `login_log` VALUES ('550', 'admin', '218.17.157.250', '2016-05-24 14:07:30', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('552', 'admin', '183.48.96.248', '2016-05-24 14:56:00', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('553', 'admin', '183.48.96.248', '2016-05-24 15:02:13', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('554', 'admin', '222.35.39.220', '2016-05-24 15:30:35', 'CN|北京|北京|None|CRTC|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('556', 'admin', '220.180.239.228', '2016-05-24 16:54:42', 'CN|安徽|合肥|None|CHINANET|0|0', '安徽省', '合肥市', '127', '安徽省合肥市', '117.28269909', '31.86694226');
INSERT INTO `login_log` VALUES ('557', 'admin', '220.180.239.228', '2016-05-24 16:54:55', 'CN|安徽|合肥|None|CHINANET|0|0', '安徽省', '合肥市', '127', '安徽省合肥市', '117.28269909', '31.86694226');
INSERT INTO `login_log` VALUES ('558', 'super', '61.135.194.170', '2016-05-24 16:59:12', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('559', 'super', '61.135.194.170', '2016-05-24 17:11:09', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('560', 'super', '61.135.194.170', '2016-05-24 17:13:37', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('561', 'super', '61.135.194.170', '2016-05-24 17:14:15', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('562', 'admin', '218.23.34.137', '2016-05-24 17:27:32', 'CN|安徽|合肥|None|CHINANET|0|0', '安徽省', '合肥市', '127', '安徽省合肥市', '117.28269909', '31.86694226');
INSERT INTO `login_log` VALUES ('563', 'admin', '0:0:0:0:0:0:0:1', '2016-05-24 17:29:46', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('564', 'admin', '0:0:0:0:0:0:0:1', '2016-05-24 18:02:18', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('565', 'admin', '0:0:0:0:0:0:0:1', '2016-05-24 18:03:08', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('566', 'admin', '0:0:0:0:0:0:0:1', '2016-05-25 09:40:13', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('567', 'admin', '0:0:0:0:0:0:0:1', '2016-05-25 10:39:07', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('568', 'admin', '0:0:0:0:0:0:0:1', '2016-05-25 11:27:18', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('569', 'admin', '0:0:0:0:0:0:0:1', '2016-05-25 11:28:24', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('570', 'admin', '221.194.176.16', '2016-05-25 12:06:17', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('571', 'admin', '124.207.147.186', '2016-05-25 12:18:01', 'CN|北京|北京|None|DXTNET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('572', 'admin', '183.62.60.90', '2016-05-25 12:20:33', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('573', 'admin', '114.111.164.122', '2016-05-25 12:20:57', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('574', 'admin', '114.81.9.51', '2016-05-25 12:22:39', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('575', 'admin', '221.194.176.16', '2016-05-25 12:23:13', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('576', 'admin', '114.81.9.51', '2016-05-25 12:23:46', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('577', 'admin', '221.194.176.16', '2016-05-25 12:24:59', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('578', 'admin', '114.81.9.51', '2016-05-25 12:25:35', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('579', 'admin', '180.169.33.113', '2016-05-25 12:26:04', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('580', 'admin', '221.194.176.16', '2016-05-25 12:26:47', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('581', 'admin', '27.155.152.49', '2016-05-25 12:27:43', 'CN|福建|福州|None|CHINANET|0|0', '福建省', '福州市', '300', '福建省福州市', '119.33022111', '26.04712550');
INSERT INTO `login_log` VALUES ('582', 'admin', '222.35.39.216', '2016-05-25 12:29:24', 'CN|北京|北京|None|CRTC|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('583', 'admin', '223.73.196.10', '2016-05-25 12:30:01', 'CN|广东|广州|None|CMNET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('584', 'admin', '183.62.60.90', '2016-05-25 12:30:22', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('585', 'admin', '183.16.186.185', '2016-05-25 12:30:45', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('586', 'admin', '103.252.67.204', '2016-05-25 12:31:07', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('587', 'admin', '211.64.96.253', '2016-05-25 12:32:00', 'CN|山东|滨州|None|CERNET|0|0', '山东省', '滨州市', '235', '山东省滨州市', '117.96829241', '37.40531394');
INSERT INTO `login_log` VALUES ('588', 'admin', '120.197.24.209', '2016-05-25 12:32:05', 'CN|广东|广州|None|CMNET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('589', 'admin', '211.94.93.192', '2016-05-25 12:33:30', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('590', 'admin', '203.156.252.192', '2016-05-25 12:33:52', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('591', 'admin', '111.175.164.29', '2016-05-25 12:35:27', 'CN|湖北|武汉|None|CHINANET|0|0', '湖北省', '武汉市', '218', '湖北省武汉市', '114.31620010', '30.58108413');
INSERT INTO `login_log` VALUES ('592', 'admin', '180.169.57.130', '2016-05-25 12:35:42', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('593', 'admin', '183.208.96.246', '2016-05-25 12:36:01', 'CN|江苏|宿迁|None|CMNET|0|0', '江苏省', '宿迁市', '277', '江苏省宿迁市', '118.29689338', '33.95204973');
INSERT INTO `login_log` VALUES ('594', 'admin', '59.63.59.135', '2016-05-25 12:38:54', 'CN|湖南|长沙|None|CHINANET|0|0', '湖南省', '长沙市', '158', '湖南省长沙市', '112.97935279', '28.21347823');
INSERT INTO `login_log` VALUES ('595', 'admin', '101.229.234.26', '2016-05-25 12:43:26', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('596', 'admin', '140.207.81.9', '2016-05-25 12:44:00', 'CN|上海|上海|None|UNICOM|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('597', 'admin', '101.204.229.33', '2016-05-25 12:46:50', 'CN|四川|None|None|UNICOM|0|0', '四川省', '', '32', '四川省', '102.89915972', '30.36748094');
INSERT INTO `login_log` VALUES ('598', 'admin', '116.25.163.231', '2016-05-25 12:47:20', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('599', 'admin', '123.120.59.137', '2016-05-25 12:47:34', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('600', 'admin', '61.242.58.246', '2016-05-25 12:47:43', 'CN|广东|广州|None|UNICOM|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('601', 'admin', '116.25.163.231', '2016-05-25 12:49:11', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('602', 'admin', '182.148.56.197', '2016-05-25 12:49:29', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('603', 'admin', '180.102.101.153', '2016-05-25 12:49:48', 'CN|江苏|南京|None|CHINANET|0|0', '江苏省', '南京市', '315', '江苏省南京市', '118.77807441', '32.05723550');
INSERT INTO `login_log` VALUES ('604', 'admin', '14.124.109.106', '2016-05-25 12:52:43', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('605', 'admin', '110.83.90.195', '2016-05-25 12:57:35', 'CN|福建|厦门|None|CHINANET|0|0', '福建省', '厦门市', '194', '福建省厦门市', '118.10388605', '24.48923061');
INSERT INTO `login_log` VALUES ('606', 'admin', '114.242.234.214', '2016-05-25 12:59:47', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('607', 'admin', '111.132.220.239', '2016-05-25 13:02:18', 'CN|北京|北京|None|CRTC|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('608', 'admin', '118.114.241.72', '2016-05-25 13:04:47', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('609', 'admin', '171.212.195.153', '2016-05-25 13:05:02', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('610', 'admin', '118.114.241.72', '2016-05-25 13:07:45', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('611', 'admin', '123.139.21.156', '2016-05-25 13:08:30', 'CN|陕西|西安|None|UNICOM|0|0', '陕西省', '西安市', '233', '陕西省西安市', '108.95309828', '34.27779990');
INSERT INTO `login_log` VALUES ('612', 'admin', '14.124.109.106', '2016-05-25 13:08:46', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('613', 'admin', '118.112.57.51', '2016-05-25 13:09:52', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('614', 'admin', '218.104.74.238', '2016-05-25 13:13:10', 'CN|安徽|合肥|None|UNICOM|0|0', '安徽省', '合肥市', '127', '安徽省合肥市', '117.28269909', '31.86694226');
INSERT INTO `login_log` VALUES ('615', 'admin', '218.104.74.238', '2016-05-25 13:14:38', 'CN|安徽|合肥|None|UNICOM|0|0', '安徽省', '合肥市', '127', '安徽省合肥市', '117.28269909', '31.86694226');
INSERT INTO `login_log` VALUES ('616', 'admin', '111.206.28.18', '2016-05-25 13:16:02', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('617', 'admin', '221.236.9.196', '2016-05-25 13:18:34', 'CN|四川|成都|None|CHINANET|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('618', 'admin', '183.131.93.43', '2016-05-25 13:23:30', 'CN|浙江|绍兴|None|CHINANET|0|0', '浙江省', '绍兴市', '293', '浙江省绍兴市', '120.59246739', '30.00236458');
INSERT INTO `login_log` VALUES ('619', 'admin', '114.66.4.148', '2016-05-25 13:26:37', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('620', 'super', '182.46.4.160', '2016-05-25 13:27:06', 'CN|山东|潍坊|None|CHINANET|0|0', '山东省', '潍坊市', '287', '山东省潍坊市', '119.14263382', '36.71611487');
INSERT INTO `login_log` VALUES ('621', 'admin', '223.104.3.156', '2016-05-25 13:30:29', 'CN|北京|北京|None|CMNET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('622', 'admin', '180.130.10.139', '2016-05-25 13:30:51', 'CN|云南|昆明|None|UNICOM|0|0', '云南省', '昆明市', '104', '云南省昆明市', '102.71460114', '25.04915310');
INSERT INTO `login_log` VALUES ('623', 'admin', '223.104.3.156', '2016-05-25 13:31:53', 'CN|北京|北京|None|CMNET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('624', 'admin', '36.110.25.198', '2016-05-25 13:33:47', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('625', 'admin', '36.110.25.198', '2016-05-25 13:34:49', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('626', 'admin', '58.40.17.82', '2016-05-25 13:35:38', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('627', 'admin', '121.225.157.81', '2016-05-25 13:35:42', 'CN|江苏|南京|None|CHINANET|0|0', '江苏省', '南京市', '315', '江苏省南京市', '118.77807441', '32.05723550');
INSERT INTO `login_log` VALUES ('628', 'admin', '219.146.156.54', '2016-05-25 13:36:15', 'CN|山东|泰安|None|CHINANET|0|0', '山东省', '泰安市', '325', '山东省泰安市', '117.08941492', '36.18807776');
INSERT INTO `login_log` VALUES ('629', 'admin', '183.131.93.43', '2016-05-25 13:38:10', 'CN|浙江|绍兴|None|CHINANET|0|0', '浙江省', '绍兴市', '293', '浙江省绍兴市', '120.59246739', '30.00236458');
INSERT INTO `login_log` VALUES ('630', 'admin', '218.241.230.34', '2016-05-25 13:38:54', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('631', 'admin', '59.38.65.210', '2016-05-25 13:38:58', 'CN|广东|佛山|None|CHINANET|0|0', '广东省', '佛山市', '138', '广东省佛山市', '113.13402564', '23.03509484');
INSERT INTO `login_log` VALUES ('632', 'admin', '14.124.109.106', '2016-05-25 13:39:55', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('633', 'admin', '112.95.136.37', '2016-05-25 13:39:58', 'CN|广东|深圳|None|UNICOM|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('634', 'admin', '14.124.109.106', '2016-05-25 13:40:24', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('635', 'admin', '14.124.109.106', '2016-05-25 13:40:35', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('636', 'admin', '14.124.109.106', '2016-05-25 13:40:53', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('637', 'admin', '14.124.109.106', '2016-05-25 13:41:35', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('638', 'admin', '221.194.176.16', '2016-05-25 13:44:01', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('639', 'admin', '223.73.52.159', '2016-05-25 13:44:59', 'CN|广东|广州|None|CMNET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('640', 'admin', '180.173.182.69', '2016-05-25 13:45:42', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('641', 'admin', '221.194.176.16', '2016-05-25 13:45:58', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('642', 'admin', '14.124.109.106', '2016-05-25 13:47:04', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('643', 'admin', '218.80.197.214', '2016-05-25 13:47:27', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('644', 'admin', '180.173.182.69', '2016-05-25 13:48:47', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('645', 'admin', '14.124.109.106', '2016-05-25 13:49:00', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('646', 'admin', '218.23.34.137', '2016-05-25 13:54:01', 'CN|安徽|合肥|None|CHINANET|0|0', '安徽省', '合肥市', '127', '安徽省合肥市', '117.28269909', '31.86694226');
INSERT INTO `login_log` VALUES ('647', 'admin', '111.165.57.103', '2016-05-25 13:55:31', 'CN|天津|天津|None|UNICOM|0|0', '天津市', '天津市', '332', '天津市', '117.21081309', '39.14392990');
INSERT INTO `login_log` VALUES ('648', 'admin', '36.110.25.198', '2016-05-25 13:56:02', 'CN|北京|北京|None|CHINANET|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('649', 'admin', '0:0:0:0:0:0:0:1', '2016-05-25 13:56:20', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('650', 'admin', '218.17.162.170', '2016-05-25 14:03:52', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('651', 'admin', '161.207.4.8', '2016-05-25 14:06:08', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('652', 'admin', '183.228.31.223', '2016-05-25 14:11:05', 'CN|重庆|重庆|None|CMNET|0|0', '重庆市', '重庆市', '132', '重庆市', '106.53063501', '29.54460611');
INSERT INTO `login_log` VALUES ('653', 'admin', '211.99.30.25', '2016-05-25 14:14:09', 'CN|北京|北京|None|FIBRLINK|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('654', 'admin', '124.114.130.114', '2016-05-25 14:33:49', 'CN|陕西|西安|None|CHINANET|0|0', '陕西省', '西安市', '233', '陕西省西安市', '108.95309828', '34.27779990');
INSERT INTO `login_log` VALUES ('655', 'admin', '106.6.167.76', '2016-05-25 14:33:54', 'CN|江西|南昌|None|CHINANET|0|0', '江西省', '南昌市', '163', '江西省南昌市', '115.89352755', '28.68957800');
INSERT INTO `login_log` VALUES ('656', 'admin', '218.17.157.250', '2016-05-25 14:38:24', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('657', 'admin', '14.124.109.106', '2016-05-25 14:40:32', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('658', 'admin', '124.114.130.114', '2016-05-25 15:10:16', 'CN|陕西|西安|None|CHINANET|0|0', '陕西省', '西安市', '233', '陕西省西安市', '108.95309828', '34.27779990');
INSERT INTO `login_log` VALUES ('659', 'admin', '14.124.109.106', '2016-05-25 15:40:48', 'CN|广东|广州|None|CHINANET|0|0', '广东省', '广州市', '257', '广东省广州市', '113.30764968', '23.12004910');
INSERT INTO `login_log` VALUES ('660', 'admin', '61.135.194.170', '2016-05-25 15:41:32', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('661', 'admin', '123.138.207.23', '2016-05-25 15:42:24', 'CN|四川|成都|None|UNICOM|0|0', '四川省', '成都市', '75', '四川省成都市', '104.06792346', '30.67994285');
INSERT INTO `login_log` VALUES ('662', 'admin', '116.230.6.170', '2016-05-25 15:45:13', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('663', 'admin', '124.114.130.114', '2016-05-25 15:45:14', 'CN|陕西|西安|None|CHINANET|0|0', '陕西省', '西安市', '233', '陕西省西安市', '108.95309828', '34.27779990');
INSERT INTO `login_log` VALUES ('664', 'admin', '61.135.194.170', '2016-05-25 15:48:30', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('665', 'admin', '180.169.33.113', '2016-05-25 15:49:59', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('666', 'admin', '61.135.194.170', '2016-05-25 15:54:06', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('667', 'admin', '218.17.157.250', '2016-05-25 15:54:09', 'CN|广东|深圳|None|CHINANET|0|0', '广东省', '深圳市', '340', '广东省深圳市', '114.02597366', '22.54605355');
INSERT INTO `login_log` VALUES ('668', 'admin', '61.135.194.170', '2016-05-25 15:55:36', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('669', 'admin', '180.169.33.113', '2016-05-25 16:30:36', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '上海市', '289', '上海市', '121.48789949', '31.24916171');
INSERT INTO `login_log` VALUES ('670', 'super', '182.46.4.160', '2016-05-25 16:32:46', 'CN|山东|潍坊|None|CHINANET|0|0', '山东省', '潍坊市', '287', '山东省潍坊市', '119.14263382', '36.71611487');
INSERT INTO `login_log` VALUES ('671', 'admin', '123.233.114.178', '2016-05-25 16:34:48', 'CN|山东|济南|None|UNICOM|0|0', '山东省', '济南市', '288', '山东省济南市', '117.02496707', '36.68278473');
INSERT INTO `login_log` VALUES ('672', 'admin', '104.224.153.68', '2016-05-25 16:34:51', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('673', 'admin', '123.233.114.178', '2016-05-25 16:36:00', 'CN|山东|济南|None|UNICOM|0|0', '山东省', '济南市', '288', '山东省济南市', '117.02496707', '36.68278473');
INSERT INTO `login_log` VALUES ('674', 'admin', '61.135.194.170', '2016-05-25 16:42:05', 'CN|北京|北京|None|OTHER|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('675', 'admin', '0:0:0:0:0:0:0:1', '2016-05-25 16:56:11', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('676', 'super', '0:0:0:0:0:0:0:1', '2016-05-25 16:56:45', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('677', 'admin', '123.233.114.178', '2016-05-25 17:24:39', 'CN|山东|济南|None|UNICOM|0|0', '山东省', '济南市', '288', '山东省济南市', '117.02496707', '36.68278473');
INSERT INTO `login_log` VALUES ('678', 'admin', '0:0:0:0:0:0:0:1', '2016-05-25 17:44:57', null, null, null, null, null, null, null);
INSERT INTO `login_log` VALUES ('679', 'admin', '221.194.176.16', '2016-05-25 18:00:20', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');
INSERT INTO `login_log` VALUES ('680', 'super', '221.194.176.16', '2016-05-25 18:02:34', 'CN|北京|北京|None|UNICOM|0|0', '北京市', '北京市', '131', '北京市', '116.40387397', '39.91488908');

-- ----------------------------
-- Table structure for `mail`
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `status` char(2) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of mail
-- ----------------------------
INSERT INTO `mail` VALUES ('1', '190298207@qq.com', '0');
INSERT INTO `mail` VALUES ('7', '247184480@qq.com', '1');
INSERT INTO `mail` VALUES ('8', '111111@qq.com', '1');
INSERT INTO `mail` VALUES ('9', '512742341@qq.com', '1');
INSERT INTO `mail` VALUES ('10', '444126322@qq.com', '1');
INSERT INTO `mail` VALUES ('11', '12@1.com', '1');
INSERT INTO `mail` VALUES ('12', '905384774@qq.com', '1');
INSERT INTO `mail` VALUES ('13', '837768700@qq.com', '1');
INSERT INTO `mail` VALUES ('14', '312181725@qq.com', '1');
INSERT INTO `mail` VALUES ('15', 'asdf@as.com', '1');

-- ----------------------------
-- Table structure for `net_info`
-- ----------------------------
DROP TABLE IF EXISTS `net_info`;
CREATE TABLE `net_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(32) DEFAULT NULL COMMENT '代理主机地址',
  `port` int(11) unsigned DEFAULT NULL COMMENT '端口',
  `mac` varchar(64) NOT NULL COMMENT 'mac地址',
  `type` int(11) DEFAULT NULL COMMENT '0 手机网络／1 wifi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of net_info
-- ----------------------------

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) DEFAULT NULL COMMENT '父节点名称',
  `NAME` varchar(50) NOT NULL COMMENT '名称',
  `TYPE` varchar(20) DEFAULT NULL COMMENT '类型:菜单or功能',
  `SORT` int(11) DEFAULT NULL COMMENT '排序',
  `URL` varchar(255) DEFAULT NULL,
  `PERM_CODE` varchar(50) DEFAULT NULL COMMENT '菜单编码',
  `ICON` varchar(255) DEFAULT NULL,
  `STATE` varchar(10) DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', null, '系统管理', 'F', '1', '', '', '&#xe62e;', '', '');
INSERT INTO `permission` VALUES ('2', '1', '角色管理', 'F', '3', '/role/list', '', 'icon-hamburg-my-account', 'closed', '');
INSERT INTO `permission` VALUES ('3', '1', '用户管理', 'F', '2', '/user/list', '', 'icon-hamburg-user', 'closed', '');
INSERT INTO `permission` VALUES ('4', '2', '添加', 'O', null, '', 'sys:role:add', '', '', '角色添加');
INSERT INTO `permission` VALUES ('7', '3', '添加', 'O', null, '', 'sys:user:add', '', '', '用户添加');
INSERT INTO `permission` VALUES ('12', '1', '权限管理', 'F', '5', '/function/list', '', 'icon-hamburg-login', 'closed', '');
INSERT INTO `permission` VALUES ('14', '15', '数据源监控', 'F', '6', '/druid', '', 'icon-hamburg-database', '', '');
INSERT INTO `permission` VALUES ('15', null, '系统监控', 'F', '5', '', '', '&#xe62e;', '', '');
INSERT INTO `permission` VALUES ('20', '15', '日志记录管理', 'F', '7', '/log/list', '', 'icon-hamburg-archives', '', '');
INSERT INTO `permission` VALUES ('37', '15', '定时任务管理', 'F', null, '/schedule/list', '', 'icon-hamburg-full-time', null, '定时任务管理，支持集群');
INSERT INTO `permission` VALUES ('39', '1', '菜单管理', 'F', '4', '/permission/list', '', 'icon-hamburg-old-versions', null, '');
INSERT INTO `permission` VALUES ('45', '39', '修改', 'O', null, '', 'sys:perm:update', null, null, '菜单管理');
INSERT INTO `permission` VALUES ('58', '39', '添加', 'O', null, '', 'sys:perm:add', null, null, '菜单管理');
INSERT INTO `permission` VALUES ('59', '39', '删除', 'O', null, '', 'sys:perm:delete', null, null, '菜单管理');
INSERT INTO `permission` VALUES ('61', '40', '添加', 'O', null, '', 'sys:dict:add', null, null, '字典管理');
INSERT INTO `permission` VALUES ('62', '40', '删除', 'O', null, '', 'sys:dict:delete', null, null, '字典管理');
INSERT INTO `permission` VALUES ('63', '40', '修改', 'O', null, '', 'sys:dict:update', null, null, '字典管理');
INSERT INTO `permission` VALUES ('69', '40', '查看', 'O', null, '', 'sys:dict:view', null, null, '字典管理');
INSERT INTO `permission` VALUES ('70', '39', '查看', 'O', null, '', 'sys:perm:menu:view', null, null, '菜单管理');
INSERT INTO `permission` VALUES ('92', '15', '邮件发送管理', null, null, '/email/list', null, null, null, '发送邮件信息');
INSERT INTO `permission` VALUES ('97', '3', '删除用户', null, null, null, 'sys:user:delete', null, null, '删除用户');
INSERT INTO `permission` VALUES ('98', '3', '设置角色', null, null, null, 'sys:user:toRole', null, null, '设置角色');
INSERT INTO `permission` VALUES ('99', '2', '修改', null, null, null, 'sys:role:update', null, null, '');
INSERT INTO `permission` VALUES ('100', '39', '子菜单-添加', null, null, null, 'sys:subperm:add', null, null, '');
INSERT INTO `permission` VALUES ('101', '39', '子菜单-修改', null, null, null, 'sys:subperm:update', null, null, '');
INSERT INTO `permission` VALUES ('102', '39', '子菜单-删除', null, null, null, 'sys:subperm:delete', null, null, '');
INSERT INTO `permission` VALUES ('103', '12', '添加权限', null, null, null, 'sys:permission:add', null, null, '');
INSERT INTO `permission` VALUES ('104', '12', '修改权限', null, null, null, 'sys:permission:update', null, null, '修改权限');
INSERT INTO `permission` VALUES ('105', '12', '删除权限', null, null, null, 'sys:permission:delete', null, null, '删除权限');
INSERT INTO `permission` VALUES ('106', null, '系统统计', null, '1', '', null, '&#xe62e;', null, '统计系统访问量');
INSERT INTO `permission` VALUES ('107', '106', '访问统计', null, null, '/logcount/index', null, null, null, '');
INSERT INTO `permission` VALUES ('108', '37', '定时添加', null, null, null, 'sys:quartz:add', null, null, '定时添加');
INSERT INTO `permission` VALUES ('109', '37', '定时删除', null, null, null, 'sys:quartz:delete', null, null, '定时删除');
INSERT INTO `permission` VALUES ('110', '92', '邮件删除', null, null, null, 'sys:email:delete', null, null, '邮件删除');
INSERT INTO `permission` VALUES ('111', '37', '立即执行一次', null, null, null, 'sys:quartz:start', null, null, '');
INSERT INTO `permission` VALUES ('112', '37', '暂停', null, null, null, 'sys:quartz:stop', null, null, '');
INSERT INTO `permission` VALUES ('113', '37', '恢复', null, null, null, 'sys:quartz:resume', null, null, '');
INSERT INTO `permission` VALUES ('121', '106', '百度统计', null, null, '/baidu/list', null, null, null, '');
INSERT INTO `permission` VALUES ('124', null, '任务管理', null, null, '', null, '&#xe61a;', null, '任务管理');
INSERT INTO `permission` VALUES ('125', '124', '激活留存', null, null, '', null, null, null, '激活留存');
INSERT INTO `permission` VALUES ('127', null, '历史数据', null, null, '', null, '&#xe61a;', null, '历史数据');
INSERT INTO `permission` VALUES ('128', null, '账户管理', null, null, '', null, '&#xe61a;', null, '账户管理');
INSERT INTO `permission` VALUES ('129', '128', '费用记录', null, null, '', null, null, null, '费用记录');
INSERT INTO `permission` VALUES ('130', '128', '账户充值', null, null, '', null, null, null, '账户充值');
INSERT INTO `permission` VALUES ('131', '127', '推广记录', null, null, '', null, null, null, '推广记录');
INSERT INTO `permission` VALUES ('132', '124', '任务记录', null, null, '', null, null, null, '任务记录');
INSERT INTO `permission` VALUES ('133', null, '资源管理', null, null, '', null, '&#xe61a;', null, '资源管理');
INSERT INTO `permission` VALUES ('134', '133', '主机列表', null, null, '', null, null, null, '主机列表');

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `CALENDAR_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `CRON_EXPRESSION` varchar(200) COLLATE utf8_bin NOT NULL,
  `TIME_ZONE_ID` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('scheduler', 'email', 'group4', '0 0 23 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('scheduler', 'email 邮件自动发送', 'group3', '0 0 23 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('scheduler', 'redis', 'group2', '0 0 23 * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `ENTRY_ID` varchar(95) COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `INSTANCE_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) COLLATE utf8_bin NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) COLLATE utf8_bin NOT NULL,
  `IS_DURABLE` varchar(1) COLLATE utf8_bin NOT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8_bin NOT NULL,
  `IS_UPDATE_DATA` varchar(1) COLLATE utf8_bin NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8_bin NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('scheduler', 'email', 'group4', null, 'com.eazy.brush.quartz.EmailQuartz', '0', '1', '0', '0', null);
INSERT INTO `qrtz_job_details` VALUES ('scheduler', 'email 邮件自动发送', 'group3', null, 'com.eazy.brush.quartz.EmailQuartz', '0', '1', '0', '0', null);
INSERT INTO `qrtz_job_details` VALUES ('scheduler', 'redis', 'group2', null, 'com.eazy.brush.quartz.RedisQuartz', '0', '0', '0', '0', null);

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `LOCK_NAME` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('scheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('scheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `INSTANCE_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('scheduler', 'Lenovo-PC1472489163397', '1472489194959', '15000');

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `STR_PROP_1` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `STR_PROP_2` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `STR_PROP_3` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) COLLATE utf8_bin NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) COLLATE utf8_bin NOT NULL,
  `TRIGGER_TYPE` varchar(8) COLLATE utf8_bin NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('scheduler', 'email', 'group4', 'email', 'group4', null, '1472569200000', '1472488761334', '5', 'WAITING', 'CRON', '1463670977000', '0', null, '0', '');
INSERT INTO `qrtz_triggers` VALUES ('scheduler', 'email 邮件自动发送', 'group3', 'email 邮件自动发送', 'group3', null, '1472569200000', '1472488761587', '5', 'WAITING', 'CRON', '1463670873000', '0', null, '0', '');
INSERT INTO `qrtz_triggers` VALUES ('scheduler', 'redis', 'group2', 'redis', 'group2', null, '1472569200000', '1472488761516', '5', 'WAITING', 'CRON', '1463192784000', '0', null, '0', '');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) NOT NULL,
  `ROLE_CODE` varchar(20) NOT NULL,
  `DESCRIPTION` text,
  `SORT` smallint(6) DEFAULT NULL,
  `DEL_FLAG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', 'admin', '审核员', '2', null);
INSERT INTO `role` VALUES ('5', 'guest', 'guest', '普通用户', '3', null);
INSERT INTO `role` VALUES ('13', 'superadmin', 'superadmin', '超级管理员', '1', null);

-- ----------------------------
-- Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(11) DEFAULT NULL,
  `PERMISSION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ROLE_PER_REFERENCE_PERMISSI` (`PERMISSION_ID`) USING BTREE,
  KEY `FK_ROLE_PER_REFERENCE_ROLE` (`ROLE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1505 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1266', '5', '124');
INSERT INTO `role_permission` VALUES ('1267', '5', '125');
INSERT INTO `role_permission` VALUES ('1268', '5', '127');
INSERT INTO `role_permission` VALUES ('1269', '5', '1');
INSERT INTO `role_permission` VALUES ('1270', '5', '2');
INSERT INTO `role_permission` VALUES ('1271', '5', '3');
INSERT INTO `role_permission` VALUES ('1272', '5', '39');
INSERT INTO `role_permission` VALUES ('1273', '5', '45');
INSERT INTO `role_permission` VALUES ('1274', '5', '58');
INSERT INTO `role_permission` VALUES ('1275', '5', '59');
INSERT INTO `role_permission` VALUES ('1276', '5', '70');
INSERT INTO `role_permission` VALUES ('1277', '5', '15');
INSERT INTO `role_permission` VALUES ('1278', '5', '20');
INSERT INTO `role_permission` VALUES ('1279', '1', '106');
INSERT INTO `role_permission` VALUES ('1280', '1', '107');
INSERT INTO `role_permission` VALUES ('1281', '1', '121');
INSERT INTO `role_permission` VALUES ('1282', '1', '124');
INSERT INTO `role_permission` VALUES ('1283', '1', '125');
INSERT INTO `role_permission` VALUES ('1284', '1', '127');
INSERT INTO `role_permission` VALUES ('1285', '1', '1');
INSERT INTO `role_permission` VALUES ('1286', '1', '2');
INSERT INTO `role_permission` VALUES ('1287', '1', '3');
INSERT INTO `role_permission` VALUES ('1288', '1', '12');
INSERT INTO `role_permission` VALUES ('1289', '1', '39');
INSERT INTO `role_permission` VALUES ('1290', '1', '15');
INSERT INTO `role_permission` VALUES ('1291', '1', '14');
INSERT INTO `role_permission` VALUES ('1292', '1', '20');
INSERT INTO `role_permission` VALUES ('1293', '1', '37');
INSERT INTO `role_permission` VALUES ('1294', '1', '111');
INSERT INTO `role_permission` VALUES ('1295', '1', '92');
INSERT INTO `role_permission` VALUES ('1461', '13', '124');
INSERT INTO `role_permission` VALUES ('1462', '13', '125');
INSERT INTO `role_permission` VALUES ('1463', '13', '132');
INSERT INTO `role_permission` VALUES ('1464', '13', '127');
INSERT INTO `role_permission` VALUES ('1465', '13', '131');
INSERT INTO `role_permission` VALUES ('1466', '13', '128');
INSERT INTO `role_permission` VALUES ('1467', '13', '129');
INSERT INTO `role_permission` VALUES ('1468', '13', '130');
INSERT INTO `role_permission` VALUES ('1469', '13', '133');
INSERT INTO `role_permission` VALUES ('1470', '13', '134');
INSERT INTO `role_permission` VALUES ('1471', '13', '1');
INSERT INTO `role_permission` VALUES ('1472', '13', '2');
INSERT INTO `role_permission` VALUES ('1473', '13', '4');
INSERT INTO `role_permission` VALUES ('1474', '13', '99');
INSERT INTO `role_permission` VALUES ('1475', '13', '3');
INSERT INTO `role_permission` VALUES ('1476', '13', '7');
INSERT INTO `role_permission` VALUES ('1477', '13', '97');
INSERT INTO `role_permission` VALUES ('1478', '13', '98');
INSERT INTO `role_permission` VALUES ('1479', '13', '12');
INSERT INTO `role_permission` VALUES ('1480', '13', '103');
INSERT INTO `role_permission` VALUES ('1481', '13', '104');
INSERT INTO `role_permission` VALUES ('1482', '13', '105');
INSERT INTO `role_permission` VALUES ('1483', '13', '39');
INSERT INTO `role_permission` VALUES ('1484', '13', '45');
INSERT INTO `role_permission` VALUES ('1485', '13', '58');
INSERT INTO `role_permission` VALUES ('1486', '13', '59');
INSERT INTO `role_permission` VALUES ('1487', '13', '70');
INSERT INTO `role_permission` VALUES ('1488', '13', '100');
INSERT INTO `role_permission` VALUES ('1489', '13', '101');
INSERT INTO `role_permission` VALUES ('1490', '13', '102');
INSERT INTO `role_permission` VALUES ('1491', '13', '106');
INSERT INTO `role_permission` VALUES ('1492', '13', '107');
INSERT INTO `role_permission` VALUES ('1493', '13', '121');
INSERT INTO `role_permission` VALUES ('1494', '13', '15');
INSERT INTO `role_permission` VALUES ('1495', '13', '14');
INSERT INTO `role_permission` VALUES ('1496', '13', '20');
INSERT INTO `role_permission` VALUES ('1497', '13', '37');
INSERT INTO `role_permission` VALUES ('1498', '13', '108');
INSERT INTO `role_permission` VALUES ('1499', '13', '109');
INSERT INTO `role_permission` VALUES ('1500', '13', '111');
INSERT INTO `role_permission` VALUES ('1501', '13', '112');
INSERT INTO `role_permission` VALUES ('1502', '13', '113');
INSERT INTO `role_permission` VALUES ('1503', '13', '92');
INSERT INTO `role_permission` VALUES ('1504', '13', '110');

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) NOT NULL COMMENT '应用名称',
  `app_version` varchar(32) NOT NULL COMMENT '应用版本',
  `apk_url` varchar(64) DEFAULT NULL,
  `remark_name` varchar(64) NOT NULL COMMENT '备注名称',
  `incr_day` int(11) NOT NULL DEFAULT '0' COMMENT '每日新增用户数',
  `incr_up_down` int(11) NOT NULL DEFAULT '0' COMMENT '上下波动范围',
  `run_time` int(11) NOT NULL DEFAULT '0' COMMENT '应用运行时长',
  `run_up_down` int(11) NOT NULL DEFAULT '0' COMMENT '运行市场上下波动范围',
  `run_start_time` int(11) NOT NULL COMMENT '投放开始时间',
  `run_end_time` int(11) NOT NULL COMMENT '投放结束时间',
  `run_speed` int(11) NOT NULL DEFAULT '0' COMMENT '投放速度',
  `retain_day` int(11) NOT NULL DEFAULT '0' COMMENT '留存天数',
  `retain_percent` int(11) DEFAULT NULL COMMENT '留存率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('9', 'com.baidu.map', '2.3', null, '百度地图', '1000', '100', '1', '10', '8', '23', '0', '0', '30');

-- ----------------------------
-- Table structure for `task_action`
-- ----------------------------
DROP TABLE IF EXISTS `task_action`;
CREATE TABLE `task_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL COMMENT '任务id',
  `action_id` int(11) unsigned NOT NULL COMMENT '动作组id',
  PRIMARY KEY (`id`),
  KEY `FK_USER_ROL_REFERENCE_ROLE` (`action_id`) USING BTREE,
  KEY `FK_USER_ROL_REFERENCE_USERS` (`task_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_action
-- ----------------------------

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

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `SALT` varchar(255) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `GENDER` smallint(6) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `ICON` varchar(500) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `STATE` char(1) DEFAULT NULL,
  `DESCRIPTION` text,
  `LOGIN_COUNT` int(11) DEFAULT NULL,
  `PREVIOUS_VISIT` datetime DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DEL_FLAG` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('9', 'user1', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('10', 'super', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('11', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `user_org`
-- ----------------------------
DROP TABLE IF EXISTS `user_org`;
CREATE TABLE `user_org` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `user_id` int(9) NOT NULL,
  `org_id` int(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_org
-- ----------------------------
INSERT INTO `user_org` VALUES ('8', '10', '1');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_USER_ROL_REFERENCE_ROLE` (`ROLE_ID`) USING BTREE,
  KEY `FK_USER_ROL_REFERENCE_USERS` (`USER_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('41', '10', '13');
INSERT INTO `user_role` VALUES ('42', '9', '5');
INSERT INTO `user_role` VALUES ('43', '11', '1');
