/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-09-13 16:46:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `action`
-- ----------------------------
DROP TABLE IF EXISTS `action`;

-- ----------------------------
-- Table structure for `action_sub`
-- ----------------------------
DROP TABLE IF EXISTS `action_sub`;

-- ----------------------------
-- Table structure for `task_action`
-- ----------------------------
DROP TABLE IF EXISTS `task_action`;


-- ----------------------------
-- Table structure for `action_group`
-- ----------------------------
DROP TABLE IF EXISTS `action_group`;
CREATE TABLE `action_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_page_id` int(9) NOT NULL DEFAULT '0' COMMENT '对应的action_page_id',
  `name` varchar(16) NOT NULL COMMENT '组动作名称',
  `action_item_ids` varchar(255) NOT NULL COMMENT '元动作ids',
  `enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of action_group
-- ----------------------------
INSERT INTO `action_group` VALUES ('4','11', '组动作1', '4,5', '1');

-- ----------------------------
-- Table structure for `action_item`
-- ----------------------------
DROP TABLE IF EXISTS `action_item`;
CREATE TABLE `action_item` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `action_page_id` int(9) NOT NULL DEFAULT '0' COMMENT '对应的action_page_id',
  `name` varchar(32) NOT NULL COMMENT '元动作名称',
  `view_name` varchar(64) NOT NULL DEFAULT '0' COMMENT 'view类名',
  `view_id` varchar(32) DEFAULT NULL,
  `view_content` varchar(32) NOT NULL COMMENT 'view内容',
  `action` int(11) NOT NULL DEFAULT '0' COMMENT '动作',
  `acition_param` varchar(255) NOT NULL DEFAULT '' COMMENT '动作参数',
  `stay_time` int(11) NOT NULL DEFAULT '0' COMMENT '停留时间',
  `up_down` int(11) NOT NULL DEFAULT '0' COMMENT '波动范围',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of action_item
-- ----------------------------
INSERT INTO `action_item` VALUES ('4','11', 'ACTION_SCROLL_FORWARD', 'android.support.v4.view.ViewPager', 'bd/001', '滑动', '4096', '', '5', '1');
INSERT INTO `action_item` VALUES ('5', '11','ACTION_SCROLL_BACKWARD', 'android.support.v4.view.ViewPager', 'bd/002', '回退', '8192', ' ', '5', '1');

-- ----------------------------
-- Table structure for `action_page`
-- ----------------------------
DROP TABLE IF EXISTS `action_page`;
CREATE TABLE `action_page` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL DEFAULT '0' COMMENT 'taskId',
  `page_name` varchar(255) NOT NULL COMMENT '页面名称',
  `page_desc` varchar(64) NOT NULL DEFAULT '' COMMENT '页面描述',
  `enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of action_page
-- ----------------------------
INSERT INTO `action_page` VALUES ('11','11', 'com.netease.nr.base.activity.BaseActivity', '','1');



-- ----------------------------
-- Table structure for `conf`
-- ----------------------------
DROP TABLE IF EXISTS `conf`;
CREATE TABLE `conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of conf
-- ----------------------------
INSERT INTO `conf` VALUES ('1', 'task_cost_point', '2', '单个任务消耗的点数');

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
  `api` int(11) DEFAULT '0',
  `coverage` double(11,4) DEFAULT '0.0000',
  `screen_size` double(11,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3070 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_info
-- ----------------------------
INSERT INTO `device_info` VALUES ('2314', '2.3.3', 'HUAWEI', 'C8650', '320', '480', '10', '0.0072', '3.5000');
INSERT INTO `device_info` VALUES ('2315', '2.3.5', 'ZTE', 'N760', '320', '480', '10', '0.0002', '3.5000');
INSERT INTO `device_info` VALUES ('2316', '2.3.7', 'ZTE', 'U880', '480', '800', '10', '0.0007', '3.5000');
INSERT INTO `device_info` VALUES ('2317', '2.3.5', 'htc', 'S510e', '480', '800', '10', '0.0030', '3.7000');
INSERT INTO `device_info` VALUES ('2318', '2.3.6', 'samsung', 'I9001', '480', '800', '10', '0.0021', '4.0000');
INSERT INTO `device_info` VALUES ('2319', '2.2.2', 'zte', 'V880', '480', '800', '8', '0.0005', '3.5000');
INSERT INTO `device_info` VALUES ('2320', '2.2.1', 'Coolpad', '8811', '320', '480', '8', '0.0000', '3.5000');
INSERT INTO `device_info` VALUES ('2321', '2.3.6', 'samsung', 'GT-I9108', '480', '800', '10', '0.0081', '4.3000');
INSERT INTO `device_info` VALUES ('2322', '2.2', 'samsung', 'GT-P1000', '1024', '600', '8', '0.0015', '7.0000');
INSERT INTO `device_info` VALUES ('2323', '2.3.5', 'meizu', 'M030', '640', '960', '10', '0.0037', '4.0000');
INSERT INTO `device_info` VALUES ('2324', '2.2.1', 'Motorola', 'XT702', '480', '854', '8', '0.0000', '3.7000');
INSERT INTO `device_info` VALUES ('2325', '2.3.4', 'samsung', 'GT-S5830', '320', '480', '10', '0.0032', '3.5000');
INSERT INTO `device_info` VALUES ('2326', '2.3.5', 'meizu', 'M9', '640', '960', '10', '0.0007', '3.5000');
INSERT INTO `device_info` VALUES ('2327', '2.3.3', 'Samsung', 'GT-I9000', '480', '800', '10', '0.0016', '4.0000');
INSERT INTO `device_info` VALUES ('2328', '2.3.6', 'samsung', 'GT-I9000', '480', '800', '10', '0.0027', '4.0000');
INSERT INTO `device_info` VALUES ('2329', '2.3.5', 'xiaomi', 'MI-ONE Plus', '480', '854', '10', '0.0528', '4.0000');
INSERT INTO `device_info` VALUES ('2330', '4.0.4', 'xiaomi', 'MI-ONE Plus', '480', '854', '15', '0.0528', '4.0000');
INSERT INTO `device_info` VALUES ('2331', '4.1.2', 'xiaomi', 'MI-ONE Plus', '480', '854', '16', '0.0528', '4.0000');
INSERT INTO `device_info` VALUES ('2332', '2.2.1', 'samsung', 'GT-S5660', '320', '480', '8', '0.0026', '3.2000');
INSERT INTO `device_info` VALUES ('2333', '2.3.4', 'samsung', 'GT-S5660', '320', '480', '10', '0.0026', '3.2000');
INSERT INTO `device_info` VALUES ('2334', '2.3.6', 'samsung', 'GT-S5660', '320', '480', '10', '0.0026', '3.2000');
INSERT INTO `device_info` VALUES ('2335', '2.3.4', 'motorola', 'XT882', '540', '960', '10', '0.0008', '4.0000');
INSERT INTO `device_info` VALUES ('2336', '2.3.4', 'motorola', 'XT531', '320', '480', '10', '0.0004', '3.5000');
INSERT INTO `device_info` VALUES ('2337', '2.3.5', 'motorola', 'XT531', '320', '480', '10', '0.0004', '3.5000');
INSERT INTO `device_info` VALUES ('2338', '2.3.3', 'lenovo', 'A60', '320', '480', '10', '0.0003', '3.5000');
INSERT INTO `device_info` VALUES ('2339', '2.3.5', 'lenovo', 'A60', '320', '480', '10', '0.0007', '3.5000');
INSERT INTO `device_info` VALUES ('2340', '2.2.2', 'motorola', 'MT620', '320', '480', '8', '0.0000', '3.2000');
INSERT INTO `device_info` VALUES ('2341', '2.3.7', 'htc', 'Z710t', '540', '960', '10', '0.0020', '4.3000');
INSERT INTO `device_info` VALUES ('2342', '2.3.5', 'htc', 'S710e', '480', '800', '10', '0.0055', '4.0000');
INSERT INTO `device_info` VALUES ('2343', '2.3.5', 'lenovo', 'P70', '320', '480', '10', '0.0002', '3.5000');
INSERT INTO `device_info` VALUES ('2344', '4.0.4', 'suoai', 'LT18i', '480', '854', '10', '0.0057', '4.2000');
INSERT INTO `device_info` VALUES ('2345', '4.1.2', 'samsung', 'GT-N7000', '800', '1280', '16', '0.0406', '5.3000');
INSERT INTO `device_info` VALUES ('2346', '2.3.4', 'lg', 'P970', '480', '800', '10', '0.0008', '4.0000');
INSERT INTO `device_info` VALUES ('2347', '2.2.2', 'motorola', 'ME860', '540', '960', '8', '0.0006', '4.0000');
INSERT INTO `device_info` VALUES ('2348', '3.1', 'motorola', 'MZ606', '1280', '800', '12', '0.0014', '10.1000');
INSERT INTO `device_info` VALUES ('2349', '2.3.4', 'htc', 'S710d', '480', '800', '10', '0.0032', '4.0000');
INSERT INTO `device_info` VALUES ('2350', '4.0.3', 'htc', 'S710d', '480', '800', '15', '0.0032', '4.0000');
INSERT INTO `device_info` VALUES ('2351', '2.3.6', 'HUAWEI', 'C8650', '320', '480', '10', '0.0004', '3.5000');
INSERT INTO `device_info` VALUES ('2352', '4.1.2', 'samsung', 'GT-I9100G', '480', '800', '16', '0.0350', '4.3000');
INSERT INTO `device_info` VALUES ('2353', '2.2', 'samsung', 'GT-I5508', '256', '320', '8', '0.0000', '2.8000');
INSERT INTO `device_info` VALUES ('2354', '2.3.4', 'Samsung', 'GT-S5838', '320', '480', '10', '0.0005', '3.5000');
INSERT INTO `device_info` VALUES ('2355', '2.3.3', 'htc', 'A510c', '320', '480', '10', '0.0001', '3.2000');
INSERT INTO `device_info` VALUES ('2356', '2.3.6', 'Samsung', 'GT-I9103', '480', '800', '10', '0.0038', '4.2000');
INSERT INTO `device_info` VALUES ('2357', '4.0.4', 'Samsung', 'GT-I9103', '480', '800', '15', '0.0035', '4.2000');
INSERT INTO `device_info` VALUES ('2358', '2.2.2', 'zte', 'N880', '480', '800', '8', '0.0003', '3.5000');
INSERT INTO `device_info` VALUES ('2359', '2.2.3', 'Samsung', 'GT-I9008L', '480', '800', '8', '0.0002', '4.0000');
INSERT INTO `device_info` VALUES ('2360', '2.3.6', 'Samsung', 'GT-I8150', '480', '800', '10', '0.0040', '3.7000');
INSERT INTO `device_info` VALUES ('2361', '2.3.4', 'samsung', 'GT-S5570', '256', '320', '10', '0.0019', '3.1400');
INSERT INTO `device_info` VALUES ('2362', '1.3.0.14-RT-20120215.194046', 'k-touch', 'W700', '480', '800', '8', '0.0005', '3.8000');
INSERT INTO `device_info` VALUES ('2363', '2.2', 'k-touch', 'W700', '480', '800', '8', '0.0001', '3.8000');
INSERT INTO `device_info` VALUES ('2364', '2.3.5', 'motorola', 'XT319', '320', '480', '10', '0.0001', '3.2000');
INSERT INTO `device_info` VALUES ('2365', '2.3.5', 'huawei', 'U8650', '320', '480', '10', '0.0002', '3.5000');
INSERT INTO `device_info` VALUES ('2366', '2.2.1', 'samsung', 'GT-S5670', '256', '320', '8', '0.0007', '3.3000');
INSERT INTO `device_info` VALUES ('2367', '2.3.4', 'motorola', 'MB855', '540', '960', '10', '0.0007', '4.3000');
INSERT INTO `device_info` VALUES ('2368', '2.3.5', 'samsung', 'SCH-i509', '256', '320', '10', '0.0022', '3.0000');
INSERT INTO `device_info` VALUES ('2369', '2.3.6', 'samsung', 'SCH-i919', '480', '800', '10', '0.0009', '4.5000');
INSERT INTO `device_info` VALUES ('2370', '2.3.3', 'zte', 'X850', '240', '320', '10', '0.0000', '2.8000');
INSERT INTO `device_info` VALUES ('2371', '4.0.1', 'samsung', 'I9250', '720', '1280', '14', '0.0123', '4.6500');
INSERT INTO `device_info` VALUES ('2372', '4.3', 'samsung', 'I9250', '720', '1280', '18', '0.0123', '4.6500');
INSERT INTO `device_info` VALUES ('2373', '2.3.5', 'HTC', 'A310e', '320', '480', '10', '0.0020', '3.2000');
INSERT INTO `device_info` VALUES ('2374', '2.2.2', 'zte', 'N606', '240', '320', '8', '0.0000', '2.8000');
INSERT INTO `device_info` VALUES ('2375', '2.3.4', 'htc', 'Z710e', '544', '960', '10', '0.0028', '4.3000');
INSERT INTO `device_info` VALUES ('2376', '2.3.5', 'samsung', 'SGH-T959', '480', '800', '10', '0.0006', '4.0000');
INSERT INTO `device_info` VALUES ('2377', '2.2.2', 'Coolpad', 'D5800', '320', '480', '8', '0.0000', '3.0000');
INSERT INTO `device_info` VALUES ('2378', '2.3.4', 'htc', 'Z510d', '480', '800', '10', '0.0001', '4.3000');
INSERT INTO `device_info` VALUES ('2379', '2.3.7', 'Motorola', 'XT615', '480', '854', '10', '0.0008', '4.0000');
INSERT INTO `device_info` VALUES ('2380', '3.2', 'Samsung', 'GT-P7510', '1280', '800', '13', '0.0022', '10.1000');
INSERT INTO `device_info` VALUES ('2381', '2.3.4', 'htc', 'Z715e', '544', '960', '10', '0.0047', '4.3000');
INSERT INTO `device_info` VALUES ('2382', '2.3.5', 'Dell', 'V04B', '540', '960', '10', '0.0012', '4.3000');
INSERT INTO `device_info` VALUES ('2383', '4.1.2', 'samsung', 'GT-I9228', '800', '1280', '16', '0.0110', '5.3000');
INSERT INTO `device_info` VALUES ('2384', '4.0.3', 'huawei', 'C8812', '480', '800', '15', '0.0109', '4.0000');
INSERT INTO `device_info` VALUES ('2385', '4.0.3', 'htc', 'T328w', '480', '800', '15', '0.0054', '4.0000');
INSERT INTO `device_info` VALUES ('2386', '2.3.5', 'lenovo', 'A65', '320', '480', '10', '0.0013', '3.5000');
INSERT INTO `device_info` VALUES ('2387', '4.0.4', 'Lenovo', 'K2110A', '1280', '800', '15', '0.0000', '10.1000');
INSERT INTO `device_info` VALUES ('2388', '2.3.6', 'Samsung', 'GT-S5360', '240', '320', '10', '0.0048', '3.0000');
INSERT INTO `device_info` VALUES ('2389', '2.2.2', 'Samsung', 'SCH-I589', '320', '480', '8', '0.0002', '3.5000');
INSERT INTO `device_info` VALUES ('2390', '2.2', 'Philips', 'W920', '480', '800', '8', '0.0000', '4.3000');
INSERT INTO `device_info` VALUES ('2391', '2.2.1', 'Sharp', 'SH7218U', '480', '800', '8', '0.0000', '3.4000');
INSERT INTO `device_info` VALUES ('2392', '2.3.6', 'samsung', 'GT-S5830i', '320', '480', '10', '0.0138', '3.5000');
INSERT INTO `device_info` VALUES ('2393', '2.3.6', 'ZTE', 'N880E', '480', '800', '15', '0.0131', '4.0000');
INSERT INTO `device_info` VALUES ('2394', '4.0.3', 'ASUS', 'TF101', '1280', '800', '15', '0.0010', '10.1000');
INSERT INTO `device_info` VALUES ('2395', '3.2.1', 'Acer', 'A100', '1024', '600', '13', '0.0006', '7.0000');
INSERT INTO `device_info` VALUES ('2396', '4.3', 'samsung', 'GT-I9300', '720', '1280', '18', '0.3301', '4.8000');
INSERT INTO `device_info` VALUES ('2397', '2.3.7', 'TCL', 'W989', '480', '800', '10', '0.0001', '4.0000');
INSERT INTO `device_info` VALUES ('2398', '4.2.2', 'htc', 'S720e', '720', '1280', '17', '0.0077', '4.7000');
INSERT INTO `device_info` VALUES ('2399', '2.3.6', 'samsung', 'GT-I8530', '800', '480', '10', '0.0016', '4.0000');
INSERT INTO `device_info` VALUES ('2400', '5.0', 'Google', 'Nexus 7', '800', '1280', '21', '0.0100', '7.0000');
INSERT INTO `device_info` VALUES ('2401', '4.0.4', 'Haier', 'W910', '720', '1280', '15', '0.0008', '4.5000');
INSERT INTO `device_info` VALUES ('2402', '4.0.4', 'ZTE', 'V889D', '480', '800', '15', '0.0021', '4.0000');
INSERT INTO `device_info` VALUES ('2403', '4.1.1', 'sdo', 'Bambook S1', '540', '960', '16', '0.0005', '4.3000');
INSERT INTO `device_info` VALUES ('2404', '4.0.4', 'gionee', 'GN800', '480', '800', '15', '0.0042', '5.0000');
INSERT INTO `device_info` VALUES ('2405', '4.0.3', 'htc', 'T328d', '480', '800', '15', '0.0034', '4.0000');
INSERT INTO `device_info` VALUES ('2406', '4.3', 'Samsung', 'GT-I9308', '720', '1280', '18', '0.0509', '4.8000');
INSERT INTO `device_info` VALUES ('2407', '4.0.4', 'motorola', 'ME865', '540', '960', '15', '0.0011', '4.3000');
INSERT INTO `device_info` VALUES ('2408', '2.3.6', 'samsung', 'GT-I8160', '480', '800', '10', '0.0174', '3.8000');
INSERT INTO `device_info` VALUES ('2409', '2.3.6', 'k-touch', 'W619', '320', '480', '10', '0.0011', '3.5000');
INSERT INTO `device_info` VALUES ('2410', '4.2.1', 'Lenovo', 'K860', '720', '1280', '17', '0.0030', '5.0000');
INSERT INTO `device_info` VALUES ('2411', '4.1.1', 'Samsung', 'GT-N8000', '1280', '800', '16', '0.0257', '10.1000');
INSERT INTO `device_info` VALUES ('2412', '4.0.4', 'oppo', 'R811', '320', '480', '15', '0.0546', '3.5000');
INSERT INTO `device_info` VALUES ('2413', '2.3.6', 'samsung', 'SCH-I519', '240', '320', '10', '0.0005', '3.1400');
INSERT INTO `device_info` VALUES ('2414', '2.3.6', 'samsung', 'SCH-I619', '320', '480', '10', '0.0113', '3.5000');
INSERT INTO `device_info` VALUES ('2415', '2.3.6', 'Samsung', 'GT-S6102E', '240', '320', '10', '0.0006', '3.1400');
INSERT INTO `device_info` VALUES ('2416', '4.0.4', 'lenovo', 'S720', '540', '960', '15', '0.0147', '4.5000');
INSERT INTO `device_info` VALUES ('2417', '4.0.4', 'Ainol', 'Novo7 Fire', '1280', '800', '15', '0.0001', '7.0000');
INSERT INTO `device_info` VALUES ('2418', '2.3.5', 'Coolpad', '7260A', '480', '800', '10', '0.0008', '4.0000');
INSERT INTO `device_info` VALUES ('2419', '2.3.7', 'zte', 'U885', '480', '800', '10', '0.0003', '4.0000');
INSERT INTO `device_info` VALUES ('2420', '2.3.6', 'zte', 'V788D', '320', '480', '10', '0.0007', '3.5000');
INSERT INTO `device_info` VALUES ('2421', '4.0.4', 'samsung', 'GT-S7562', '480', '800', '15', '0.0489', '4.0000');
INSERT INTO `device_info` VALUES ('2422', '4.0.3', 'lenovo', 'S899t', '540', '960', '15', '0.0025', '4.5000');
INSERT INTO `device_info` VALUES ('2423', '4.3', 'samsung', 'GT-N7100', '720', '1280', '18', '0.5317', '5.5000');
INSERT INTO `device_info` VALUES ('2424', '4.0.4', 'Lenovo', 'S890', '540', '960', '16', '0.0111', '5.0000');
INSERT INTO `device_info` VALUES ('2425', '4.1.1', 'Lenovo', 'S890', '540', '960', '16', '0.0117', '5.0000');
INSERT INTO `device_info` VALUES ('2426', '2.3.5', 'lenovo', 'A288t', '320', '480', '10', '0.0038', '3.5000');
INSERT INTO `device_info` VALUES ('2427', '2.3.5', 'Coolpad', '5860A', '480', '800', '10', '0.0016', '4.0000');
INSERT INTO `device_info` VALUES ('2428', '4.1.1', 'oppo', 'X909', '1080', '1920', '17', '0.0517', '5.0000');
INSERT INTO `device_info` VALUES ('2429', '4.2.2', 'oppo', 'X909', '1080', '1920', '17', '0.0701', '5.0000');
INSERT INTO `device_info` VALUES ('2430', '4.0.4', 'oppo', 'U705T', '540', '960', '15', '0.0529', '4.5000');
INSERT INTO `device_info` VALUES ('2431', '4.0.4', 'oppo', 'R813T', '480', '800', '15', '0.0163', '4.0000');
INSERT INTO `device_info` VALUES ('2432', '4.0.4', 'huawei', 'C8825D', '480', '800', '15', '0.0027', '4.0000');
INSERT INTO `device_info` VALUES ('2433', '4.3', 'samsung', 'GT-N7108', '720', '1280', '18', '0.1185', '5.5000');
INSERT INTO `device_info` VALUES ('2434', '2.3.4', 'htc', 'X715e', '544', '960', '10', '0.0002', '4.3000');
INSERT INTO `device_info` VALUES ('2435', '4.1.2', 'samsung', 'SCH-I739', '480', '800', '16', '0.0488', '4.0000');
INSERT INTO `device_info` VALUES ('2436', '4.1.1', 'lenovo', 'A590', '480', '800', '16', '0.0122', '5.0000');
INSERT INTO `device_info` VALUES ('2437', '4.1.1', 'xiaomi', 'MI 2', '720', '1280', '16', '0.1450', '4.3000');
INSERT INTO `device_info` VALUES ('2438', '4.0.3', 'Lenovo', 'S868t', '540', '960', '15', '0.0066', '5.0000');
INSERT INTO `device_info` VALUES ('2439', '2.3.6', 'samsung', 'SCH-I699', '480', '800', '10', '0.0212', '4.0000');
INSERT INTO `device_info` VALUES ('2440', '2.3.5', 'lenovo', 'A298t', '480', '800', '10', '0.0110', '4.0000');
INSERT INTO `device_info` VALUES ('2441', '4.1.1', 'meizu', 'M040', '800', '1280', '16', '0.0570', '4.4000');
INSERT INTO `device_info` VALUES ('2442', '4.1.2', 'lenovo', 'A820', '540', '960', '16', '0.0182', '4.5000');
INSERT INTO `device_info` VALUES ('2443', '4.0.4', 'zte', 'U950', '480', '800', '15', '0.0065', '4.3000');
INSERT INTO `device_info` VALUES ('2444', '4.0.4', 'lenovo', 'A390', '480', '800', '15', '0.0059', '4.0000');
INSERT INTO `device_info` VALUES ('2445', '1.5.3.5-RT-20120218.132828', 'k-touch', 'W800', '480', '800', '10', '0.0005', '4.0000');
INSERT INTO `device_info` VALUES ('2446', '2.3.6', 'lenovo', 'A66', '320', '480', '10', '0.0017', '3.5000');
INSERT INTO `device_info` VALUES ('2447', '2.3.7', 'Coolpad', '8150', '480', '800', '10', '0.0003', '4.0000');
INSERT INTO `device_info` VALUES ('2448', '4.0.4', 'huawei', 'C8812e', '480', '800', '15', '0.0045', '4.0000');
INSERT INTO `device_info` VALUES ('2449', '4.2.1', 'lenovo', 'A830', '540', '960', '17', '0.0098', '5.0000');
INSERT INTO `device_info` VALUES ('2450', '4.0.4', 'huawei', 'U8825d', '480', '800', '15', '0.0069', '4.0000');
INSERT INTO `device_info` VALUES ('2451', '4.1.2', 'sony', 'LT22i', '540', '960', '16', '0.0083', '4.0000');
INSERT INTO `device_info` VALUES ('2452', '4.3', 'samsung', 'SCH-I939D', '720', '1280', '18', '0.0213', '4.8000');
INSERT INTO `device_info` VALUES ('2453', '2.3.5', 'Royalstar', 'RSD-S8008', '480', '850', '10', '0.0001', '4.7000');
INSERT INTO `device_info` VALUES ('2454', '4.2.2', 'lenovo', 'K900', '1080', '1920', '17', '0.0057', '5.5000');
INSERT INTO `device_info` VALUES ('2455', '4.4.4', 'Google', 'Nexus 4', '768', '1280', '19', '0.0138', '4.7000');
INSERT INTO `device_info` VALUES ('2456', '5.0', 'Google', 'Nexus 4', '768', '1280', '21', '0.0138', '4.7000');
INSERT INTO `device_info` VALUES ('2457', '4.2.1', 'oppo', 'R815T', '480', '800', '17', '0.0398', '4.3000');
INSERT INTO `device_info` VALUES ('2458', '2.3.7', 'zte', 'U880E', '480', '800', '10', '0.0012', '4.0000');
INSERT INTO `device_info` VALUES ('2459', '4.1.2', 'Coolpad', '5890', '540', '960', '16', '0.0215', '4.5000');
INSERT INTO `device_info` VALUES ('2460', '4.2.2', 'sony', 'L36h', '1080', '1920', '17', '0.0443', '5.0000');
INSERT INTO `device_info` VALUES ('2461', '4.4.4', 'Sony', 'L36h', '1080', '1920', '19', '0.0000', '5.0000');
INSERT INTO `device_info` VALUES ('2462', '4.1.2', 'Coolpad', '7295', '540', '960', '16', '0.0146', '5.0000');
INSERT INTO `device_info` VALUES ('2463', '4.3', 'samsung', 'GT-N7102', '720', '1280', '18', '0.1092', '5.5000');
INSERT INTO `device_info` VALUES ('2464', '4.4.2', 'samsung', 'GT-I9500', '1080', '1920', '19', '0.3365', '5.0000');
INSERT INTO `device_info` VALUES ('2465', '5.0.1', 'samsung', 'GT-I9500', '1080', '1920', '21', '0.4221', '5.0000');
INSERT INTO `device_info` VALUES ('2466', '5.0.1', 'samsung', 'SCH-I959', '1080', '1920', '21', '0.0903', '5.0000');
INSERT INTO `device_info` VALUES ('2467', '4.2.2', 'huawei', 'MT1-U06', '720', '1280', '17', '0.0150', '6.1000');
INSERT INTO `device_info` VALUES ('2468', '4.3', 'Samsung', 'GT-I9508', '1080', '1920', '18', '0.0790', '5.0000');
INSERT INTO `device_info` VALUES ('2469', '5.0.1', 'Samsung', 'GT-I9508', '1080', '1920', '21', '0.0790', '5.0000');
INSERT INTO `device_info` VALUES ('2470', '4.0.4', 'vivo', 'S7', '480', '800', '15', '0.0174', '4.0000');
INSERT INTO `device_info` VALUES ('2471', '2.3.5', 'Lenovo', 'A370e', '480', '800', '10', '0.0029', '4.0000');
INSERT INTO `device_info` VALUES ('2472', '4.2.1', 'gionee', 'E3', '720', '1280', '17', '0.0145', '4.7000');
INSERT INTO `device_info` VALUES ('2473', '4.0.3', 'lenovo', 'A376', '480', '800', '15', '0.0050', '4.0000');
INSERT INTO `device_info` VALUES ('2474', '5.0.1', 'samsung', 'GT-I9502', '1080', '1920', '21', '0.0729', '5.0000');
INSERT INTO `device_info` VALUES ('2475', '4.2.2', 'oppo', 'X909T', '1080', '1920', '17', '0.0962', '5.0000');
INSERT INTO `device_info` VALUES ('2476', '4.2.2', 'huawei', 'P6-C00', '720', '1280', '17', '0.0578', '4.7000');
INSERT INTO `device_info` VALUES ('2477', '4.4.2', 'HUAWEI', 'P6-C00', '720', '1280', '19', '0.0000', '4.7000');
INSERT INTO `device_info` VALUES ('2478', '4.0.3', 'HUAWEI', 'T8808D', '480', '800', '15', '0.0025', '4.0000');
INSERT INTO `device_info` VALUES ('2479', '4.3', 'Samsung', 'GT-N7105', '720', '1280', '18', '0.0243', '5.5000');
INSERT INTO `device_info` VALUES ('2480', '4.0.4', 'huawei', 'T8951', '480', '854', '15', '0.0268', '4.5000');
INSERT INTO `device_info` VALUES ('2481', '4.0.4', 'samsung', 'GT-S7562i', '480', '800', '15', '0.0335', '4.0000');
INSERT INTO `device_info` VALUES ('2482', '4.0.4', 'zte', 'U795', '480', '800', '15', '0.0119', '4.0000');
INSERT INTO `device_info` VALUES ('2483', '4.0.3', 'huawei', 'Y500-T00', '480', '800', '15', '0.0045', '4.3000');
INSERT INTO `device_info` VALUES ('2484', '4.0.4', 'ZTE', 'N881F', '540', '960', '15', '0.0025', '4.5000');
INSERT INTO `device_info` VALUES ('2485', '4.2.2', 'Samsung', 'SCH-P729', '720', '1280', '17', '0.0057', '6.3000');
INSERT INTO `device_info` VALUES ('2486', '4.1.1', 'xiaomi', 'MI 2SC', '720', '1280', '16', '0.1725', '4.3000');
INSERT INTO `device_info` VALUES ('2487', '4.0.4', 'samsung', 'GT-S7568', '480', '800', '15', '0.0702', '4.0000');
INSERT INTO `device_info` VALUES ('2488', '4.2.1', 'lenovo', 'A656', '480', '854', '17', '0.0050', '5.0000');
INSERT INTO `device_info` VALUES ('2489', '4.1.2', 'samsung', 'GT-I9268', '720', '1280', '16', '0.0216', '4.6500');
INSERT INTO `device_info` VALUES ('2490', '2.3.5', 'HUAWEI', 'Y310-5000', '480', '800', '10', '0.0057', '4.0000');
INSERT INTO `device_info` VALUES ('2491', '4.1.2', 'htc', '609d', '540', '960', '16', '0.0048', '4.5000');
INSERT INTO `device_info` VALUES ('2492', '2.3.7', 'zte', 'U960s2', '480', '800', '10', '0.0006', '4.3000');
INSERT INTO `device_info` VALUES ('2493', '4.3', 'samsung', 'SCH-N719', '720', '1280', '18', '0.0779', '5.5000');
INSERT INTO `device_info` VALUES ('2494', '4.2.2', 'htc', '802w', '1080', '1920', '17', '0.0132', '4.7000');
INSERT INTO `device_info` VALUES ('2495', '4.0.3', 'ZTE', 'U930HD', '720', '1280', '15', '0.0046', '4.5000');
INSERT INTO `device_info` VALUES ('2496', '4.1.2', 'HUAWEI', 'G525-U00', '540', '960', '16', '0.0045', '4.5000');
INSERT INTO `device_info` VALUES ('2497', '4.1.2', 'huawei', 'C8813Q', '480', '854', '16', '0.0547', '4.5000');
INSERT INTO `device_info` VALUES ('2498', '2.3.6', 'samsung', 'GT-B9062', '480', '800', '10', '0.0014', '4.1900');
INSERT INTO `device_info` VALUES ('2499', '4.1.1', 'xiaomi', 'MI 2A', '720', '1280', '16', '0.1786', '4.5000');
INSERT INTO `device_info` VALUES ('2500', '4.1.2', 'samsung', 'GT-S7572', '480', '800', '16', '0.0699', '4.0000');
INSERT INTO `device_info` VALUES ('2501', '4.0.4', 'zte', 'U817', '480', '854', '15', '0.0221', '4.5000');
INSERT INTO `device_info` VALUES ('2502', '2.3.5', 'lenovo', 'A375e', '480', '800', '10', '0.0027', '4.0000');
INSERT INTO `device_info` VALUES ('2503', '4.2.2', 'vivo', 'X510w', '1080', '1920', '17', '0.0346', '5.7000');
INSERT INTO `device_info` VALUES ('2504', '2.3.6', 'huawei', 'Y210-2010', '320', '480', '10', '0.0028', '3.5000');
INSERT INTO `device_info` VALUES ('2505', '4.1.2', 'samsung', 'GT-I8262D', '480', '800', '16', '0.0473', '4.3000');
INSERT INTO `device_info` VALUES ('2506', '4.1.1', 'vivo', 'vivo S9', '540', '960', '16', '0.0149', '4.5000');
INSERT INTO `device_info` VALUES ('2507', '4.0.4', 'sony', 'LT26ii', '720', '1280', '15', '0.0081', '4.3000');
INSERT INTO `device_info` VALUES ('2508', '4.1.1', 'Samsung', 'GT-I9260', '720', '1280', '16', '0.0173', '4.6500');
INSERT INTO `device_info` VALUES ('2509', '4.0.4', 'ZTE', 'U807', '480', '800', '15', '0.0200', '4.0000');
INSERT INTO `device_info` VALUES ('2510', '4.2.1', 'gionee', 'GN708T', '540', '960', '17', '0.0098', '4.5000');
INSERT INTO `device_info` VALUES ('2511', '4.1.2', 'zte', 'N5', '720', '1280', '16', '0.0033', '5.7000');
INSERT INTO `device_info` VALUES ('2512', '4.1.1', 'HUAWEI', 'C8813D', '480', '854', '16', '0.0112', '4.5000');
INSERT INTO `device_info` VALUES ('2513', '2.3.5', 'Coolpad', '8020+', '320', '480', '10', '0.0021', '3.5000');
INSERT INTO `device_info` VALUES ('2514', '2.3.5', 'Coolpad', '7019A', '320', '480', '10', '0.0008', '3.5000');
INSERT INTO `device_info` VALUES ('2515', '4.1.2', 'samsung', 'GT-I8552', '480', '800', '16', '0.1282', '4.7000');
INSERT INTO `device_info` VALUES ('2516', '4.1.2', 'zte', 'N909', '480', '854', '16', '0.0156', '4.5000');
INSERT INTO `device_info` VALUES ('2517', '4.0.4', 'lenovo', 'A630t', '480', '854', '15', '0.0302', '4.5000');
INSERT INTO `device_info` VALUES ('2518', '2.3.5', 'lenovo', 'A278t', '320', '480', '10', '0.0076', '3.5000');
INSERT INTO `device_info` VALUES ('2519', '4.1.2', 'samsung', 'GT-I8268', '480', '800', '16', '0.0609', '4.3000');
INSERT INTO `device_info` VALUES ('2520', '4.0.4', 'gionee', 'GN700W', '480', '800', '15', '0.0058', '4.3000');
INSERT INTO `device_info` VALUES ('2521', '4.1.2', 'ZTE', 'U956', '720', '1280', '16', '0.0038', '5.0000');
INSERT INTO `device_info` VALUES ('2522', '4.0.3', 'Coolpad', '8190', '540', '960', '15', '0.0070', '4.5000');
INSERT INTO `device_info` VALUES ('2523', '4.0.4', 'lenovo', 'A800', '480', '854', '15', '0.0084', '4.5000');
INSERT INTO `device_info` VALUES ('2524', '4.1.2', 'huawei', 'A199', '1280', '720', '16', '0.0381', '5.0000');
INSERT INTO `device_info` VALUES ('2525', '4.1.2', 'samsung', 'GT-I9128', '480', '800', '16', '0.0329', '5.0000');
INSERT INTO `device_info` VALUES ('2526', '4.0.4', 'vivo', 'S7t', '480', '800', '15', '0.0603', '4.0000');
INSERT INTO `device_info` VALUES ('2527', '4.2.2', 'HUAWEI', 'MT1-T00', '720', '1208', '17', '0.0083', '6.1000');
INSERT INTO `device_info` VALUES ('2528', '4.1.1', 'HTC', '603e', '480', '800', '16', '0.0009', '4.3000');
INSERT INTO `device_info` VALUES ('2529', '4.1.2', 'huawei', 'G520-5000', '480', '854', '16', '0.0242', '4.5000');
INSERT INTO `device_info` VALUES ('2530', '2.3.6', 'zte', 'U790', '320', '480', '10', '0.0030', '3.5000');
INSERT INTO `device_info` VALUES ('2531', '4.1.2', 'samsung', 'SCH-I879', '480', '800', '16', '0.0277', '5.0000');
INSERT INTO `device_info` VALUES ('2532', '4.1.2', 'htc', '802d', '1080', '1920', '16', '0.0139', '4.7000');
INSERT INTO `device_info` VALUES ('2533', '4.0.3', 'Coolpad', '8085', '480', '854', '15', '0.0092', '4.7000');
INSERT INTO `device_info` VALUES ('2534', '4.0.4', 'ZTE', 'U880F1', '480', '800', '15', '0.0021', '4.0000');
INSERT INTO `device_info` VALUES ('2535', '4.2.1', 'Lenovo', 'A3000-H', '1024', '600', '17', '0.0195', '7.0000');
INSERT INTO `device_info` VALUES ('2536', '2.3.5', 'k-touch', 'T619+', '320', '480', '10', '0.0073', '3.5000');
INSERT INTO `device_info` VALUES ('2537', '4.1.2', 'Samsung', 'GT-I9082i', '480', '800', '16', '0.0384', '5.0000');
INSERT INTO `device_info` VALUES ('2538', '2.3.6', 'lenovo', 'A369 ', '480', '800', '10', '0.0105', '4.0000');
INSERT INTO `device_info` VALUES ('2539', '4.0.3', 'lenovo', 'A390t', '480', '800', '15', '0.0259', '4.0000');
INSERT INTO `device_info` VALUES ('2540', '4.1.2', 'samsung', 'SCH-I829', '480', '800', '16', '0.0337', '4.3000');
INSERT INTO `device_info` VALUES ('2541', '2.3.5', 'Coolpad', '7020', '320', '480', '10', '0.0008', '3.5000');
INSERT INTO `device_info` VALUES ('2542', '4.1.2', 'Coolpad', '7268', '540', '960', '16', '0.0032', '4.5000');
INSERT INTO `device_info` VALUES ('2543', '4.1.1', 'huawei', 'Y300C', '480', '800', '16', '0.0072', '4.0000');
INSERT INTO `device_info` VALUES ('2544', '2.3.5', 'Coolpad', '8070', '480', '800', '10', '0.0023', '4.0000');
INSERT INTO `device_info` VALUES ('2545', '4.2.1', 'ZTE', 'V967S', '540', '960', '17', '0.0058', '5.0000');
INSERT INTO `device_info` VALUES ('2546', '2.3.4', 'suoai', 'SK17i', '320', '480', '10', '0.0006', '3.0000');
INSERT INTO `device_info` VALUES ('2547', '4.2.2', 'samsung', 'GT-I9152', '540', '960', '17', '0.0929', '5.8000');
INSERT INTO `device_info` VALUES ('2548', '4.0.3', 'k-touch', 'T789', '480', '800', '15', '0.0016', '4.0000');
INSERT INTO `device_info` VALUES ('2549', '4.2.2', 'samsung', 'GT-I9200', '720', '1280', '17', '0.0352', '6.3000');
INSERT INTO `device_info` VALUES ('2550', '4.4.2', 'samsung', 'SCH-I535', '720', '1280', '19', '0.0093', '4.8000');
INSERT INTO `device_info` VALUES ('2551', '4.1.2', 'ASUS', 'ME371MG', '800', '1280', '16', '0.0040', '7.0000');
INSERT INTO `device_info` VALUES ('2552', '4.2.1', 'gionee', 'E3T', '720', '1280', '17', '0.0154', '4.7000');
INSERT INTO `device_info` VALUES ('2553', '4.2.2', 'lenovo', 'A850', '540', '960', '17', '0.0639', '5.5000');
INSERT INTO `device_info` VALUES ('2554', '2.3.7', 'Coolpad', '9930', '480', '960', '10', '0.0001', '5.0000');
INSERT INTO `device_info` VALUES ('2555', '4.1.2', 'Hisense', 'HS-E912S', '480', '800', '16', '0.0020', '4.0000');
INSERT INTO `device_info` VALUES ('2556', '4.2.2', 'vivo', 'Y11', '480', '800', '17', '0.1192', '4.0000');
INSERT INTO `device_info` VALUES ('2557', '4.1.2', 'Samsung', 'SCH-I869', '480', '800', '16', '0.0276', '4.6600');
INSERT INTO `device_info` VALUES ('2558', '4.0.3', 'Lenovo', 'A2107A-H', '1024', '600', '15', '0.0020', '7.0000');
INSERT INTO `device_info` VALUES ('2559', '4.4.2', 'huawei', 'P6-T00', '720', '1280', '19', '0.0642', '4.7000');
INSERT INTO `device_info` VALUES ('2560', '4.1.2', 'htc', '606w', '540', '960', '16', '0.0044', '4.5000');
INSERT INTO `device_info` VALUES ('2561', '4.2.1', 'huawei', 'G610-U00', '540', '960', '17', '0.0804', '5.0000');
INSERT INTO `device_info` VALUES ('2562', '2.3.4', 'motorola', 'Defy+', '480', '854', '10', '0.0017', '3.7000');
INSERT INTO `device_info` VALUES ('2563', '4.1.2', 'Coolpad', '8190Q', '540', '960', '16', '0.0156', '4.5000');
INSERT INTO `device_info` VALUES ('2564', '4.2.1', 'oppo', 'R819T ', '720', '1280', '17', '0.1038', '4.7000');
INSERT INTO `device_info` VALUES ('2565', '4.2.2', 'samsung', 'GT-I9205', '720', '1280', '17', '0.0043', '6.3000');
INSERT INTO `device_info` VALUES ('2566', '4.0.3', 'huawei', 'Y320-T00', '480', '800', '15', '0.0132', '4.0000');
INSERT INTO `device_info` VALUES ('2567', '4.1.2', 'zte', 'U819', '480', '854', '16', '0.0120', '4.5000');
INSERT INTO `device_info` VALUES ('2568', '4.1.2', 'samsung', 'GT-S7898', '480', '800', '16', '0.0519', '4.0000');
INSERT INTO `device_info` VALUES ('2569', '4.1.2', 'Samsung', 'SHV-E220S', '720', '1280', '16', '0.0009', '4.6500');
INSERT INTO `device_info` VALUES ('2570', '4.2.1', 'huawei', 'G700-T00', '720', '1280', '17', '0.0185', '5.0000');
INSERT INTO `device_info` VALUES ('2571', '4.0.4', 'ZTE', 'N798', '480', '800', '15', '0.0008', '4.0000');
INSERT INTO `device_info` VALUES ('2572', '4.1.2', 'lenovo', 'A760', '480', '854', '16', '0.0102', '4.5000');
INSERT INTO `device_info` VALUES ('2573', '4.2.2', 'oppo', 'R821T', '480', '800', '17', '0.1466', '4.0000');
INSERT INTO `device_info` VALUES ('2574', '4.1.2', 'Coolpad', '5879', '480', '854', '16', '0.0098', '5.0000');
INSERT INTO `device_info` VALUES ('2575', '4.1.2', 'Samsung', 'SM-T210', '600', '1024', '16', '0.0095', '7.0000');
INSERT INTO `device_info` VALUES ('2576', '4.4.2', 'Samsung', 'SM-T210', '600', '1024', '19', '0.0095', '7.0000');
INSERT INTO `device_info` VALUES ('2577', '4.1.2', 'HUAWEI', 'G610-C00', '540', '960', '16', '0.0242', '5.0000');
INSERT INTO `device_info` VALUES ('2578', '2.3.6', 'huawei', 'Y325-T00', '480', '800', '10', '0.0131', '4.0000');
INSERT INTO `device_info` VALUES ('2579', '4.2.2', 'samsung', 'SM-C101', '540', '960', '17', '0.0115', '4.3000');
INSERT INTO `device_info` VALUES ('2580', '4.2.2', 'gionee', 'V182', '480', '854', '17', '0.0457', '4.5000');
INSERT INTO `device_info` VALUES ('2581', '4.2.2', 'gionee', 'GN137', '480', '800', '17', '0.0329', '4.0000');
INSERT INTO `device_info` VALUES ('2582', '4.2.2', 'vivo', 'X510t', '1080', '1920', '17', '0.0998', '5.7000');
INSERT INTO `device_info` VALUES ('2583', '4.4.4', 'vivo', 'X510t', '1080', '1920', '19', '0.0776', '5.7000');
INSERT INTO `device_info` VALUES ('2584', '2.3.6', 'lenovo', 'A269', '320', '480', '10', '0.0023', '3.5000');
INSERT INTO `device_info` VALUES ('2585', '4.4.2', 'Samsung', 'SHV-E330S', '1080', '1920', '18', '0.0065', '5.0000');
INSERT INTO `device_info` VALUES ('2586', '4.2.1', 'oppo', 'U707T', '720', '1280', '17', '0.0818', '5.5000');
INSERT INTO `device_info` VALUES ('2587', '2.3.6', 'samsung', 'GT-S5831i', '320', '480', '10', '0.0038', '3.5000');
INSERT INTO `device_info` VALUES ('2588', '4.2.2', 'huawei', 'Y511-T00', '480', '854', '17', '0.1196', '4.5000');
INSERT INTO `device_info` VALUES ('2589', '4.1.2', 'samsung', 'SM-T211', '600', '1024', '16', '0.0397', '7.0000');
INSERT INTO `device_info` VALUES ('2590', '4.2.1', 'oppo', 'R823T', '480', '800', '17', '0.0854', '4.0000');
INSERT INTO `device_info` VALUES ('2591', '4.1.2', 'HUAWEI', 'C8815 ', '540', '960', '16', '0.0554', '5.0000');
INSERT INTO `device_info` VALUES ('2592', '4.4.2', 'Lenovo', 'K910', '1080', '1920', '19', '0.0036', '5.5000');
INSERT INTO `device_info` VALUES ('2593', '5.0.1', 'Samsung', 'GT-I9295', '1080', '1920', '21', '0.0010', '5.0000');
INSERT INTO `device_info` VALUES ('2594', '4.2.1', 'xiaomi', 'HM 1', '720', '1280', '17', '0.4016', '4.7000');
INSERT INTO `device_info` VALUES ('2595', '4.4.2', 'samsung', 'GT-I9192', '540', '960', '19', '0.0088', '4.3000');
INSERT INTO `device_info` VALUES ('2596', '4.2.2', 'samsung', 'SCH-P709', '540', '960', '17', '0.0401', '5.8000');
INSERT INTO `device_info` VALUES ('2597', '4.1.2', 'Coolpad', '5950', '540', '960', '16', '0.0347', '5.5000');
INSERT INTO `device_info` VALUES ('2598', '4.2.1', 'lenovo', 'A670t', '480', '854', '17', '0.0242', '4.5000');
INSERT INTO `device_info` VALUES ('2599', '4.1.2', 'Coolpad', '5891', '540', '960', '16', '0.0236', '5.0000');
INSERT INTO `device_info` VALUES ('2600', '4.2.2', 'samsung', 'SM-T311', '1280', '800', '17', '0.0378', '8.0000');
INSERT INTO `device_info` VALUES ('2601', '4.2.2', 'Samsung', 'GT-P5210', '800', '1280', '17', '0.2181', '10.1000');
INSERT INTO `device_info` VALUES ('2602', '4.1.2', 'ZTE', 'N919', '540', '960', '16', '0.0045', '5.0000');
INSERT INTO `device_info` VALUES ('2603', '4.2.2', 'Coolpad', '7296', '540', '960', '17', '0.0332', '5.5000');
INSERT INTO `device_info` VALUES ('2604', '2.3.5', 'Fadar', 'FDT E6', '320', '480', '10', '0.0000', '3.5000');
INSERT INTO `device_info` VALUES ('2605', '4.1.2', 'lenovo', 'A5000-E', '600', '1024', '16', '0.0072', '7.0000');
INSERT INTO `device_info` VALUES ('2606', '2.3.5', 'huawei', 'Y220-T10', '320', '480', '10', '0.0010', '3.5000');
INSERT INTO `device_info` VALUES ('2607', '4.2.2', 'Samsung', 'SM-T310', '800', '1280', '17', '0.0125', '8.0000');
INSERT INTO `device_info` VALUES ('2608', '4.0.3', 'Lenovo', 'A658t', '480', '854', '15', '0.0082', '5.0000');
INSERT INTO `device_info` VALUES ('2609', '4.1.2', 'HUAWEI', 'Y320-C00', '480', '800', '16', '0.0038', '4.0000');
INSERT INTO `device_info` VALUES ('2610', '4.2.1', 'gionee', 'X805', '480', '854', '17', '0.0239', '5.5000');
INSERT INTO `device_info` VALUES ('2611', '2.3.6', 'lenovo', 'A308t', '480', '800', '10', '0.0298', '4.0000');
INSERT INTO `device_info` VALUES ('2612', '4.2.2', 'samsung', 'GT-I9208', '720', '1280', '17', '0.0130', '6.3000');
INSERT INTO `device_info` VALUES ('2613', '4.2.1', 'meizu', 'M351', '1080', '1800', '17', '0.0774', '5.1000');
INSERT INTO `device_info` VALUES ('2614', '4.0.3', 'Lenovo', 'A398t', '480', '854', '15', '0.0061', '4.5000');
INSERT INTO `device_info` VALUES ('2615', '4.4.4', 'xiaomi', 'MI 3', '1080', '1920', '19', '0.5562', '5.0000');
INSERT INTO `device_info` VALUES ('2616', '5.0.2', 'xiaomi', 'MI 3', '1080', '1920', '21', '0.5562', '5.0000');
INSERT INTO `device_info` VALUES ('2617', '4.2.2', 'Coolpad', '8122', '480', '800', '17', '0.0077', '4.0000');
INSERT INTO `device_info` VALUES ('2618', '4.2.2', 'vivo', 'S7i(t)', '480', '800', '17', '0.1470', '4.0000');
INSERT INTO `device_info` VALUES ('2619', '4.2.2', 'lenovo', 'S960', '1080', '1920', '17', '0.0051', '5.0000');
INSERT INTO `device_info` VALUES ('2620', '4.2.1', 'vivo', 'X3t', '720', '1280', '17', '0.1722', '5.0000');
INSERT INTO `device_info` VALUES ('2621', '2.3.6', 'Lenovo', 'A269i', '320', '480', '10', '0.0027', '3.5000');
INSERT INTO `device_info` VALUES ('2622', '4.1.2', 'HUAWEI', 'G730-C00', '540', '960', '16', '0.0122', '5.5000');
INSERT INTO `device_info` VALUES ('2623', '4.3', 'sony', 'L39h', '1080', '1920', '18', '0.0182', '5.0000');
INSERT INTO `device_info` VALUES ('2624', '2.3.7', 'PHICOMM', 'FWS710', '480', '800', '10', '0.0000', '3.7000');
INSERT INTO `device_info` VALUES ('2625', '4.4.4', 'sony', 'L39h', '1080', '1920', '19', '0.1000', '5.0000');
INSERT INTO `device_info` VALUES ('2626', '4.2.2', 'xiaomi', 'HM 1W', '720', '1280', '17', '0.1005', '4.7000');
INSERT INTO `device_info` VALUES ('2627', '4.2.1', 'gionee', 'E6mini', '720', '1280', '17', '0.0097', '4.5000');
INSERT INTO `device_info` VALUES ('2628', '4.1.2', 'samsung', 'GT-S6818', '320', '480', '16', '0.0287', '3.5000');
INSERT INTO `device_info` VALUES ('2629', '4.1.1', 'Fiesta', 'P68-A', '480', '854', '10', '0.0000', '4.5000');
INSERT INTO `device_info` VALUES ('2630', '4.4.2', 'Samsung', 'SM-N900', '1080', '1920', '19', '0.0773', '5.7000');
INSERT INTO `device_info` VALUES ('2631', '5.0', 'Samsung', 'SM-N900', '1080', '1920', '21', '0.0773', '5.7000');
INSERT INTO `device_info` VALUES ('2632', '4.0', 'SAGA', 'A758', '480', '854', '10', '0.0000', '4.7000');
INSERT INTO `device_info` VALUES ('2633', '4.1.2', 'huawei', 'Y321-C00', '480', '800', '16', '0.0224', '4.0000');
INSERT INTO `device_info` VALUES ('2634', '4.4.2', 'samsung', 'SM-N9009', '1080', '1920', '19', '0.1782', '5.7000');
INSERT INTO `device_info` VALUES ('2635', '5.0', 'Samsung', 'SM-N9009', '1080', '1920', '21', '0.1149', '5.7000');
INSERT INTO `device_info` VALUES ('2636', '4.0.1', 'KXD', 'KXD I9300', '480', '800', '10', '0.0000', '4.0000');
INSERT INTO `device_info` VALUES ('2637', '4.3', 'samsung', 'SM-N9006', '1080', '1920', '18', '0.2280', '5.7000');
INSERT INTO `device_info` VALUES ('2638', '5.0', 'samsung', 'SM-N9006', '1080', '1920', '21', '0.2280', '5.7000');
INSERT INTO `device_info` VALUES ('2639', '4.2.2', 'oppo', 'N1T', '1080', '1920', '17', '0.1008', '5.9000');
INSERT INTO `device_info` VALUES ('2640', '4.2.2', 'Samsung', 'GT-S7270', '480', '800', '17', '0.0043', '4.0000');
INSERT INTO `device_info` VALUES ('2641', '4.1.2', 'lenovo', 'A820t', '540', '960', '16', '0.0541', '4.5000');
INSERT INTO `device_info` VALUES ('2642', '4.2.2', 'vivo', 'Y11i T', '480', '800', '17', '0.1122', '4.0000');
INSERT INTO `device_info` VALUES ('2643', '2.2', 'Changhong', 'Z1', '480', '800', '8', '0.0000', '4.3000');
INSERT INTO `device_info` VALUES ('2644', '2.2.2', 'Coolpad', 'W706', '320', '480', '8', '0.0000', '3.5000');
INSERT INTO `device_info` VALUES ('2645', '4.0.3', 'k-touch', 'T91', '480', '854', '15', '0.0026', '5.0000');
INSERT INTO `device_info` VALUES ('2646', '4.0.4', 'ZTE', 'U960e', '720', '1280', '15', '0.0070', '4.5000');
INSERT INTO `device_info` VALUES ('2647', '2.3.5', 'lenovo', 'A208t', '320', '480', '10', '0.0040', '3.5000');
INSERT INTO `device_info` VALUES ('2648', '4.2.2', 'lenovo', 'S898t', '720', '1280', '17', '0.0328', '5.3000');
INSERT INTO `device_info` VALUES ('2649', '4.2.2', 'oppo', 'R829T', '720', '1280', '17', '0.1174', '5.0000');
INSERT INTO `device_info` VALUES ('2650', '2.3.5', 'lenovo', 'A218t', '320', '480', '10', '0.0051', '3.5000');
INSERT INTO `device_info` VALUES ('2651', '4.2.2', 'lenovo', 'A378t', '480', '854', '17', '0.0139', '4.5000');
INSERT INTO `device_info` VALUES ('2652', '5.0.1', 'Google', 'Nexus 5', '1080', '1920', '21', '0.0242', '4.9500');
INSERT INTO `device_info` VALUES ('2653', '6.0', 'Google', 'Nexus 5', '1080', '1920', '23', '0.0242', '4.9500');
INSERT INTO `device_info` VALUES ('2654', '6.0.1', 'Google', 'Nexus 5', '1080', '1920', '23', '0.0242', '4.9500');
INSERT INTO `device_info` VALUES ('2655', '4.2.2', 'Lenovo', 'S658t', '540', '960', '17', '0.0185', '5.0000');
INSERT INTO `device_info` VALUES ('2656', '4.2.2', 'vivo', 'Y17T', '720', '1280', '17', '0.1479', '4.7000');
INSERT INTO `device_info` VALUES ('2657', '4.2.2', 'oppo', 'R833T', '480', '800', '17', '0.0616', '4.3000');
INSERT INTO `device_info` VALUES ('2658', '4.3', 'huawei', 'B199', '720', '1280', '18', '0.0849', '5.5000');
INSERT INTO `device_info` VALUES ('2659', '4.2.2', 'vivo', 'Y15T', '480', '854', '17', '0.0660', '4.5000');
INSERT INTO `device_info` VALUES ('2660', '4.2.2', 'samsung', 'GT-I9128I', '480', '800', '17', '0.0251', '5.0000');
INSERT INTO `device_info` VALUES ('2661', '4.2.1', 'meizu', 'M355', '1080', '1800', '17', '0.0948', '5.1000');
INSERT INTO `device_info` VALUES ('2662', '2.3.5', 'Coolpad', '5218D', '480', '854', '10', '0.0028', '4.5000');
INSERT INTO `device_info` VALUES ('2663', '4.1.2', 'samsung', 'GT-S7562C', '480', '800', '16', '0.0361', '4.0000');
INSERT INTO `device_info` VALUES ('2664', '4.2.2', 'samsung', 'GT-N7108D', '720', '1280', '17', '0.0161', '5.5000');
INSERT INTO `device_info` VALUES ('2665', '4.2.2', 'Lenovo', 'A678t', '480', '854', '17', '0.0134', '5.0000');
INSERT INTO `device_info` VALUES ('2666', '4.2.2', 'samsung', 'SM-G3812', '540', '960', '17', '0.0633', '4.5000');
INSERT INTO `device_info` VALUES ('2667', '4.2.2', 'nubia', 'NX503A', '1080', '1920', '17', '0.0115', '5.0000');
INSERT INTO `device_info` VALUES ('2668', '4.2.2', 'Lenovo', 'A889', '540', '960', '17', '0.0095', '6.0000');
INSERT INTO `device_info` VALUES ('2669', '4.2.2', 'oppo', 'R827T', '540', '960', '17', '0.1182', '4.7000');
INSERT INTO `device_info` VALUES ('2670', '4.2.2', 'vivo', 'Y20T', '720', '1280', '17', '0.0779', '5.5000');
INSERT INTO `device_info` VALUES ('2671', '4.2.2', 'samsung', 'GT-I9118', '480', '800', '17', '0.0162', '5.0000');
INSERT INTO `device_info` VALUES ('2672', '4.2.2', 'ZTE', 'U969', '540', '960', '17', '0.0017', '5.5000');
INSERT INTO `device_info` VALUES ('2673', '4.1.2', 'ViewSonic', 'V450 HD', '540', '960', '16', '0.0000', '4.5000');
INSERT INTO `device_info` VALUES ('2674', '4.4.4', 'xiaomi', 'MI 3W', '1080', '1920', '19', '0.3213', '5.0000');
INSERT INTO `device_info` VALUES ('2675', '4.3', 'samsung', 'SM-G7106', '720', '1280', '18', '0.1619', '5.2500');
INSERT INTO `device_info` VALUES ('2676', '4.1.2', 'samsung', 'GT-S7568I', '480', '800', '16', '0.0428', '4.0000');
INSERT INTO `device_info` VALUES ('2677', '4.1.2', 'samsung', 'GT-S6812C', '320', '480', '16', '0.0024', '3.5000');
INSERT INTO `device_info` VALUES ('2678', '4.2.2', 'gionee', 'V185', '480', '854', '17', '0.0585', '5.0000');
INSERT INTO `device_info` VALUES ('2679', '4.2.2', 'samsung', 'SM-G3818', '540', '960', '17', '0.0685', '4.5000');
INSERT INTO `device_info` VALUES ('2680', '4.3', 'samsung', 'SM-G7108', '720', '1280', '18', '0.0388', '5.2500');
INSERT INTO `device_info` VALUES ('2681', '4.2.2', 'lenovo', 'A708t', '540', '960', '17', '0.0410', '5.5000');
INSERT INTO `device_info` VALUES ('2682', '4.2.2', 'oppo', 'R831T', '480', '854', '17', '0.2000', '4.5000');
INSERT INTO `device_info` VALUES ('2683', '4.0.4', 'samsung', 'SCH-I699I', '480', '800', '15', '0.0098', '4.0000');
INSERT INTO `device_info` VALUES ('2684', '4.1.2', 'samsung', 'GT-S7278', '480', '800', '16', '0.0151', '4.0000');
INSERT INTO `device_info` VALUES ('2685', '2.3.5', 'KingSun', 'EF58', '320', '480', '10', '0.0011', '3.5000');
INSERT INTO `device_info` VALUES ('2686', '4.3', 'Coolpad', '8720L', '720', '1280', '18', '0.1712', '5.0000');
INSERT INTO `device_info` VALUES ('2687', '2.3.6', 'lenovo', 'A318t', '480', '800', '10', '0.0135', '4.0000');
INSERT INTO `device_info` VALUES ('2688', '4.1.2', 'Lenovo', ' A388t', '480', '854', '16', '0.0354', '5.0000');
INSERT INTO `device_info` VALUES ('2689', '4.2.2', 'AUX', 'M678A', '480', '800', '17', '0.0002', '3.7000');
INSERT INTO `device_info` VALUES ('2690', '4.2.2', 'Lenovo', 'A880', '540', '960', '17', '0.0213', '6.0000');
INSERT INTO `device_info` VALUES ('2691', '4.0.3', 'Coolpad', '8089', '480', '854', '15', '0.0283', '5.0000');
INSERT INTO `device_info` VALUES ('2692', '4.3', 'samsung', 'SM-G3502I', '480', '800', '18', '0.0344', '4.3000');
INSERT INTO `device_info` VALUES ('2693', '4.2.2', 'Hisense', 'HS-T968S', '480', '854', '17', '0.0019', '5.0000');
INSERT INTO `device_info` VALUES ('2694', '4.1.2', 'samsung', 'SM-G3819D', '540', '960', '16', '0.0275', '4.5000');
INSERT INTO `device_info` VALUES ('2695', '4.2.2', 'HUAWEI', 'G716-L070', '720', '1280', '17', '0.0105', '5.0000');
INSERT INTO `device_info` VALUES ('2696', '4.2.2', 'huawei', 'H30-U10', '720', '1280', '17', '0.1002', '5.0000');
INSERT INTO `device_info` VALUES ('2697', '4.2.2', 'vivo', 'Y17W', '720', '1280', '17', '0.0367', '4.7000');
INSERT INTO `device_info` VALUES ('2698', '4.2.2', 'huawei', 'H30-T10', '720', '1280', '17', '0.0960', '5.0000');
INSERT INTO `device_info` VALUES ('2699', '4.1.2', 'Lenovo', 'A760', '480', '854', '16', '0.1000', '4.5000');
INSERT INTO `device_info` VALUES ('2700', '4.1.2', 'samsung', 'GT-S7278U', '480', '800', '16', '0.0250', '4.0000');
INSERT INTO `device_info` VALUES ('2701', '4.3', 'samsung', 'GT-S7272C', '480', '800', '18', '0.0102', '4.0000');
INSERT INTO `device_info` VALUES ('2702', '4.3', 'samsung', 'SM-G3509I', '480', '800', '18', '0.0211', '4.3000');
INSERT INTO `device_info` VALUES ('2703', '4.3', 'Coolpad', '9190L', '720', '1280', '18', '0.0513', '5.9500');
INSERT INTO `device_info` VALUES ('2704', '4.3', 'samsung', 'GT-I9300I', '720', '1280', '18', '0.0763', '4.8000');
INSERT INTO `device_info` VALUES ('2705', '4.4.4', 'sony', 'M51w', '720', '1280', '19', '0.0021', '4.3000');
INSERT INTO `device_info` VALUES ('2706', '4.3', 'Coolpad', '8730L', '720', '1280', '18', '0.0634', '5.5000');
INSERT INTO `device_info` VALUES ('2707', '4.2.2', 'samsung', 'GT-I9168I', '480', '800', '17', '0.0249', '5.0000');
INSERT INTO `device_info` VALUES ('2708', '4.3', 'samsung', 'SM-G7109', '720', '1280', '18', '0.0517', '5.2500');
INSERT INTO `device_info` VALUES ('2709', '4.3', 'HUAWEI', 'C8816', '540', '960', '18', '0.0806', '5.0000');
INSERT INTO `device_info` VALUES ('2710', '2.2', 'htc', 'A8180', '480', '800', '8', '0.0005', '3.7000');
INSERT INTO `device_info` VALUES ('2711', '4.3', 'samsung', 'SCH-I939I', '720', '1280', '18', '0.0120', '4.8000');
INSERT INTO `device_info` VALUES ('2712', '4.3', 'Dell', 'Venue 8 3830', '800', '1280', '18', '0.0035', '8.0000');
INSERT INTO `device_info` VALUES ('2713', '4.3', 'oppo', 'X9007', '1920', '1080', '18', '0.3073', '5.5000');
INSERT INTO `device_info` VALUES ('2714', '4.3', 'vivo', 'Xplay3S', '1440', '2560', '18', '0.1589', '6.0000');
INSERT INTO `device_info` VALUES ('2715', '4.3', 'lenovo', 'A890e', '540', '960', '18', '0.0147', '6.0000');
INSERT INTO `device_info` VALUES ('2716', '4.3', 'samsung', 'SCH-I679', '480', '800', '18', '0.0363', '4.0000');
INSERT INTO `device_info` VALUES ('2717', '4.3', 'lenovo', 'A788t', '480', '854', '18', '0.1812', '5.0000');
INSERT INTO `device_info` VALUES ('2718', '4.3', 'oppo', 'R8007', '720', '1280', '18', '0.3739', '5.0000');
INSERT INTO `device_info` VALUES ('2719', '4.3', 'Coolpad', '5217', '480', '800', '18', '0.0113', '4.0000');
INSERT INTO `device_info` VALUES ('2720', '4.3', 'samsung', 'SM-G3518', '480', '800', '18', '0.0270', '4.5000');
INSERT INTO `device_info` VALUES ('2721', '4.1.2', 'Coolpad', '5891Q', '540', '960', '16', '0.0257', '5.5000');
INSERT INTO `device_info` VALUES ('2722', '4.3', 'Hisense', 'HS-X8T', '480', '854', '18', '0.0169', '5.0000');
INSERT INTO `device_info` VALUES ('2723', '4.4.2', 'HTC', 'D816w', '720', '1280', '19', '0.0274', '5.5000');
INSERT INTO `device_info` VALUES ('2724', '5.0', 'samsung', 'SM-G9006V', '1080', '1920', '21', '0.0798', '5.1000');
INSERT INTO `device_info` VALUES ('2725', '4.1.2', 'Samsung', 'GT-N8013', '1280', '800', '16', '0.0007', '10.1000');
INSERT INTO `device_info` VALUES ('2726', '4.1.2', 'samsung', 'GT-S7898I', '480', '800', '16', '0.0254', '4.0000');
INSERT INTO `device_info` VALUES ('2727', '4.3', 'Samsung', 'SM-G7108V', '720', '1280', '18', '0.0905', '5.2500');
INSERT INTO `device_info` VALUES ('2728', '4.4.2', 'lenovo', 'S850t', '720', '1280', '19', '0.0385', '5.0000');
INSERT INTO `device_info` VALUES ('2729', '4.2.2', 'htc', '919d', '1080', '1920', '17', '0.0016', '5.0000');
INSERT INTO `device_info` VALUES ('2730', '4.4.2', 'huawei', 'G750-T01', '720', '1280', '19', '0.2923', '5.5000');
INSERT INTO `device_info` VALUES ('2731', '4.4.4', 'motorola', 'XT1056', '720', '1280', '19', '0.0009', '4.7000');
INSERT INTO `device_info` VALUES ('2732', '4.3', 'samsung', 'GT-I9152P', '540', '960', '18', '0.0578', '5.8000');
INSERT INTO `device_info` VALUES ('2733', '4.3', 'ZTE', 'Q701C', '540', '960', '18', '0.0061', '5.5000');
INSERT INTO `device_info` VALUES ('2734', '4.2.2', 'Samsung', 'SM-T111', '600', '1024', '17', '0.0141', '7.0000');
INSERT INTO `device_info` VALUES ('2735', '4.2.2', 'Onda', 'V819i', '800', '1280', '17', '0.0006', '8.0000');
INSERT INTO `device_info` VALUES ('2736', '4.2.2', 'Teclast', 'X98 3G(HKC1)', '2048', '1536', '17', '0.0011', '9.7000');
INSERT INTO `device_info` VALUES ('2737', '4.4.2', 'lenovo', 'S898t+', '720', '1280', '19', '0.0329', '5.3000');
INSERT INTO `device_info` VALUES ('2738', '4.2.2', 'vivo', 'Y613', '480', '854', '17', '0.0407', '4.5000');
INSERT INTO `device_info` VALUES ('2739', '4.2.2', 'vivo', 'X3S W', '720', '1280', '17', '0.0827', '5.0000');
INSERT INTO `device_info` VALUES ('2740', '4.3', 'Lenovo', 'S810t', '720', '1280', '18', '0.0680', '5.5000');
INSERT INTO `device_info` VALUES ('2741', '2.3.5', 'Capitel', 'TD2000', '480', '800', '10', '0.0000', '4.0000');
INSERT INTO `device_info` VALUES ('2742', '4.2.2', 'huawei', 'MT2-L05', '720', '1280', '17', '0.0055', '6.1000');
INSERT INTO `device_info` VALUES ('2743', '4.3', 'samsung', 'GT-I9308I', '720', '1280', '18', '0.0189', '4.8000');
INSERT INTO `device_info` VALUES ('2744', '4.4.2', 'nubia', 'NX601J', '1080', '1920', '19', '0.0015', '6.4000');
INSERT INTO `device_info` VALUES ('2745', '4.3', 'samsung', 'SM-G3508J', '480', '800', '18', '0.0180', '4.3000');
INSERT INTO `device_info` VALUES ('2746', '4.4.2', 'htc', 'D816t', '720', '1280', '19', '0.0507', '5.5000');
INSERT INTO `device_info` VALUES ('2747', '4.3', 'huawei', 'G6-C00', '540', '960', '18', '0.0231', '4.5000');
INSERT INTO `device_info` VALUES ('2748', '4.4.2', 'ZTE', 'S291', '1080', '1920', '19', '0.0136', '5.5000');
INSERT INTO `device_info` VALUES ('2749', '4.3', 'zte', 'Q301C', '480', '854', '18', '0.0185', '5.0000');
INSERT INTO `device_info` VALUES ('2750', '4.2.2', 'xiaomi', 'HM 1STD', '720', '1280', '17', '0.5189', '4.7000');
INSERT INTO `device_info` VALUES ('2751', '4.4.2', 'xiaomi', 'HM 1STD', '720', '1280', '17', '0.3721', '4.7000');
INSERT INTO `device_info` VALUES ('2752', '4.4.2', 'htc', 'D816d', '720', '1280', '19', '0.0095', '5.5000');
INSERT INTO `device_info` VALUES ('2753', '4.2.2', 'huawei', 'MT2-L01', '720', '1280', '17', '0.0473', '5.5000');
INSERT INTO `device_info` VALUES ('2754', '4.2.2', 'oppo', 'R830', '480', '854', '17', '0.1020', '4.5000');
INSERT INTO `device_info` VALUES ('2755', '4.3', 'vivo', 'X3L', '720', '1280', '18', '0.3132', '5.0000');
INSERT INTO `device_info` VALUES ('2756', '4.3', 'ONEPLUS', 'A0001', '1080', '1920', '18', '0.0878', '5.5000');
INSERT INTO `device_info` VALUES ('2757', '4.4.4', 'ONEPLUS', 'A0001', '1080', '1920', '18', '0.0622', '5.5000');
INSERT INTO `device_info` VALUES ('2758', '4.3', 'ASUS', 'T00J', '720', '1280', '18', '0.0335', '5.0000');
INSERT INTO `device_info` VALUES ('2759', '4.3', 'HUAWEI', 'G6-U00', '540', '960', '18', '0.0119', '4.5000');
INSERT INTO `device_info` VALUES ('2760', '4.4.2', 'zte', 'S2002', '1080', '1920', '19', '0.0077', '5.0000');
INSERT INTO `device_info` VALUES ('2761', '4.3', 'ASUS', 'T00E', '480', '800', '18', '0.0005', '7.0000');
INSERT INTO `device_info` VALUES ('2762', '4.4.2', 'lenovo', 'A3300-T', '600', '1024', '19', '0.0373', '7.0000');
INSERT INTO `device_info` VALUES ('2763', '4.3', 'Coolpad', '8729', '540', '960', '18', '0.0667', '5.5000');
INSERT INTO `device_info` VALUES ('2764', '4.4.2', 'huawei', 'P7-L07', '1080', '1920', '19', '0.2297', '5.0000');
INSERT INTO `device_info` VALUES ('2765', '4.3', 'oppo', 'X9077', '1440', '2560', '18', '0.0283', '5.5000');
INSERT INTO `device_info` VALUES ('2766', '4.3', 'vivo', 'Y18L', '720', '1280', '18', '0.2126', '4.7000');
INSERT INTO `device_info` VALUES ('2767', '4.2.1', 'AUX', 'W1', '1080', '1920', '17', '0.0047', '6.4400');
INSERT INTO `device_info` VALUES ('2768', '4.3', 'oppo', 'R831S', '480', '854', '18', '0.3626', '4.5000');
INSERT INTO `device_info` VALUES ('2769', '4.3', 'oppo', 'R2017', '540', '960', '18', '0.3637', '4.7000');
INSERT INTO `device_info` VALUES ('2770', '4.2.2', 'samsung', 'GT-I9082C', '480', '800', '17', '0.0178', '5.0000');
INSERT INTO `device_info` VALUES ('2771', '4.4.2', 'lenovo', 'A808t', '720', '1280', '19', '0.0676', '5.5000');
INSERT INTO `device_info` VALUES ('2772', '4.2.2', 'huawei', 'G750-T20', '1080', '1920', '17', '0.0344', '5.5000');
INSERT INTO `device_info` VALUES ('2773', '4.3', 'samsung', 'SM-G3588V', '480', '800', '18', '0.0537', '4.7000');
INSERT INTO `device_info` VALUES ('2774', '4.3', 'xiaomi', 'HM 1SC', '720', '1280', '18', '0.4374', '4.7000');
INSERT INTO `device_info` VALUES ('2775', '4.4.4', 'xiaomi', 'HM 1SC', '720', '1280', '19', '0.3990', '4.7000');
INSERT INTO `device_info` VALUES ('2776', '4.3', 'oppo', 'R6007', '720', '1280', '18', '0.3231', '4.7000');
INSERT INTO `device_info` VALUES ('2777', '4.3', 'huawei', 'C8817L', '540', '960', '18', '0.0159', '5.0000');
INSERT INTO `device_info` VALUES ('2778', '4.4.2', 'huawei', 'H30-L01', '720', '1280', '19', '0.0887', '5.0000');
INSERT INTO `device_info` VALUES ('2779', '4.3', 'oppo', 'N5117', '720', '1280', '18', '0.2137', '5.0000');
INSERT INTO `device_info` VALUES ('2780', '5.0.2', 'Lenovo', 'K920', '1440', '2560', '21', '0.0033', '6.0000');
INSERT INTO `device_info` VALUES ('2781', '4.3', 'CMCC', 'M811', '720', '1280', '18', '0.0443', '5.0000');
INSERT INTO `device_info` VALUES ('2782', '4.4.2', 'huawei', 'H60-L01', '1080', '1920', '19', '0.4491', '5.0000');
INSERT INTO `device_info` VALUES ('2783', '4.4.2', 'Lenovo', 'A806', '720', '1280', '19', '0.0069', '5.0000');
INSERT INTO `device_info` VALUES ('2784', '4.4.2', 'htc', 'D610t', '480', '854', '19', '0.0120', '4.7000');
INSERT INTO `device_info` VALUES ('2785', '5.0.2', 'htc', 'M8Sw', '1080', '1920', '21', '0.0107', '5.0000');
INSERT INTO `device_info` VALUES ('2786', '4.4.2', 'vivo', 'X3V', '720', '1280', '19', '0.0544', '5.0000');
INSERT INTO `device_info` VALUES ('2787', '4.3', 'vivo', 'Y22L', '480', '854', '18', '0.1625', '4.5000');
INSERT INTO `device_info` VALUES ('2788', '4.3', 'Coolpad', '7251', '480', '854', '18', '0.0184', '5.0000');
INSERT INTO `device_info` VALUES ('2789', '4.4.2', 'nubia', 'NX507J', '1080', '1920', '19', '0.0283', '5.0000');
INSERT INTO `device_info` VALUES ('2790', '4.4.2', 'ASUS', 'K013', '800', '1280', '19', '0.0014', '7.0000');
INSERT INTO `device_info` VALUES ('2791', '4.4.2', 'ASUS', 'K010', '1280', '800', '19', '0.0019', '10.1000');
INSERT INTO `device_info` VALUES ('2792', '4.4.2', 'Samsung', 'SM-T231', '800', '1280', '19', '0.0166', '7.0000');
INSERT INTO `device_info` VALUES ('2793', '4.4.2', 'zte', 'X9180', '720', '1280', '19', '0.0198', '5.0000');
INSERT INTO `device_info` VALUES ('2794', '4.2.2', 'Lenovo', 'Lenovo S668t', '540', '960', '17', '0.0059', '4.7000');
INSERT INTO `device_info` VALUES ('2795', '4.3', 'oppo', 'R7007', '720', '1280', '18', '0.4092', '5.0000');
INSERT INTO `device_info` VALUES ('2796', '4.3', 'vivo', 'X710L', '1080', '1920', '18', '0.1827', '5.2000');
INSERT INTO `device_info` VALUES ('2797', '4.4.2', 'gionee', 'GN151', '480', '854', '19', '0.1849', '4.7000');
INSERT INTO `device_info` VALUES ('2798', '4.4.2', 'samsung', 'SM-C1158', '720', '1280', '19', '0.1000', '4.8000');
INSERT INTO `device_info` VALUES ('2799', '4.4.4', 'xiaomi', 'MI 4W', '1080', '1920', '19', '0.1099', '5.0000');
INSERT INTO `device_info` VALUES ('2800', '4.4.2', 'Lenovo', 'Lenovo TAB S8-50F', '1200', '1920', '19', '0.0031', '8.0000');
INSERT INTO `device_info` VALUES ('2801', '4.4.4', 'Lenovo', 'A936', '720', '1280', '19', '0.0077', '6.0000');
INSERT INTO `device_info` VALUES ('2802', '4.4.2', 'sony', 'S55t', '720', '1280', '19', '0.0168', '5.5000');
INSERT INTO `device_info` VALUES ('2803', '4.4.2', 'xiaomi', 'HM 1SLTETD', '720', '1280', '19', '0.6884', '4.7000');
INSERT INTO `device_info` VALUES ('2804', '4.4.2', 'Samsung', 'SM-T530', '1280', '800', '19', '0.0104', '10.1000');
INSERT INTO `device_info` VALUES ('2805', '4.4.2', 'huawei', 'C199', '720', '1280', '19', '0.0917', '5.5000');
INSERT INTO `device_info` VALUES ('2806', '4.2.2', 'Coolpad', '8297D', '720', '1280', '17', '0.0252', '5.0000');
INSERT INTO `device_info` VALUES ('2807', '4.4.2', 'meizu', 'MX4', '1152', '1920', '19', '0.3894', '5.3600');
INSERT INTO `device_info` VALUES ('2808', '5.0.1', 'meizu', 'MX4', '1152', '1920', '21', '0.3336', '5.3600');
INSERT INTO `device_info` VALUES ('2809', '6.0.1', 'xiaomi', 'MI 4LTE-CMCC', '1080', '1920', '23', '1.5756', '5.0000');
INSERT INTO `device_info` VALUES ('2810', '4.4.2', 'Acer', 'A1-840FHD', '1200', '1920', '19', '0.0008', '8.0000');
INSERT INTO `device_info` VALUES ('2811', '4.4.4', 'xiaomi', 'HM NOTE 1LTE', '720', '1280', '19', '1.1078', '5.5000');
INSERT INTO `device_info` VALUES ('2812', '4.3', 'gionee', 'GN9005', '720', '1280', '18', '0.1036', '4.8000');
INSERT INTO `device_info` VALUES ('2813', '4.4.4', 'lenovo', 'K30-T', '720', '1280', '19', '0.1618', '5.0000');
INSERT INTO `device_info` VALUES ('2814', '4.4.4', 'samsung', 'SM-G7508Q', '720', '1280', '19', '0.0592', '6.0000');
INSERT INTO `device_info` VALUES ('2815', '4.4.4', 'samsung', 'SM-G8508S', '720', '1280', '19', '0.0126', '4.7000');
INSERT INTO `device_info` VALUES ('2816', '4.3', 'HUAWEI', 'G616-L076', '480', '854', '18', '0.0161', '5.0000');
INSERT INTO `device_info` VALUES ('2817', '5.1.1', 'samsung', 'SM-N9109W', '1440', '2560', '21', '0.0485', '5.7000');
INSERT INTO `device_info` VALUES ('2818', '4.4.4', 'oppo', 'N5207', '1080', '1920', '19', '0.1199', '5.5000');
INSERT INTO `device_info` VALUES ('2819', '5.0', 'lenovo', 'K50-T5', '1080', '1920', '21', '0.0701', '5.5000');
INSERT INTO `device_info` VALUES ('2820', '4.4.4', 'vivo', 'Y27', '720', '1280', '19', '0.6505', '4.7000');
INSERT INTO `device_info` VALUES ('2821', '4.4.2', 'oppo', 'R7005', '720', '1280', '19', '0.1195', '5.0000');
INSERT INTO `device_info` VALUES ('2822', '4.4.4', 'HUAWEI', 'C8817E', '720', '1280', '19', '0.0453', '5.0000');
INSERT INTO `device_info` VALUES ('2823', '4.4.2', 'Smartisan', 'SM705', '1080', '1920', '19', '0.0208', '4.9500');
INSERT INTO `device_info` VALUES ('2824', '4.4.4', 'meizu', 'MX4 Pro', '1536', '2560', '19', '0.2353', '5.5000');
INSERT INTO `device_info` VALUES ('2825', '4.4.4', 'lenovo', 'K80M', '1080', '1920', '19', '0.0017', '5.1000');
INSERT INTO `device_info` VALUES ('2826', '5.0.1', 'Samsung', 'SM-N9106W', '1440', '2560', '21', '0.0069', '5.7000');
INSERT INTO `device_info` VALUES ('2827', '4.4.2', 'Lenovo', 'A338t', '480', '854', '19', '0.0049', '4.5000');
INSERT INTO `device_info` VALUES ('2828', '4.2.2', 'vivo', 'Y13L', '480', '854', '17', '0.4310', '4.5000');
INSERT INTO `device_info` VALUES ('2829', '4.4.4', 'oppo', '1105', '480', '854', '19', '0.1068', '4.5000');
INSERT INTO `device_info` VALUES ('2830', '4.4.4', 'samsung', 'SM-G5308W', '540', '960', '19', '0.1858', '5.0000');
INSERT INTO `device_info` VALUES ('2831', '4.4.4', 'huawei', 'Che1-CL10', '720', '1280', '19', '0.3100', '5.5000');
INSERT INTO `device_info` VALUES ('2832', '4.3', 'TCL', 'P306C', '480', '854', '18', '0.0352', '5.0000');
INSERT INTO `device_info` VALUES ('2833', '4.4.4', 'oppo', '1107', '480', '854', '19', '0.5778', '4.5000');
INSERT INTO `device_info` VALUES ('2834', '4.4.2', 'Coolpad', '7061', '480', '854', '19', '0.0065', '5.0000');
INSERT INTO `device_info` VALUES ('2835', '4.4.4', 'ZTE', 'ZTE G720T', '1080', '1920', '19', '0.0124', '5.0000');
INSERT INTO `device_info` VALUES ('2836', '4.4.4', 'Coolpad', '8297-T01', '720', '1280', '17', '0.1164', '5.0000');
INSERT INTO `device_info` VALUES ('2837', '4.4.4', 'samsung', 'SM-A5000', '720', '1280', '19', '0.2705', '5.0000');
INSERT INTO `device_info` VALUES ('2838', '4.4.4', 'Coolpad', 'Y70 C', '720', '1280', '19', '0.0173', '5.0000');
INSERT INTO `device_info` VALUES ('2839', '4.4.4', 'meizu', 'M1 note', '1080', '1920', '19', '0.5284', '5.5000');
INSERT INTO `device_info` VALUES ('2840', '4.4.4', 'oppo', 'R8107', '1080', '1920', '19', '0.2098', '5.2000');
INSERT INTO `device_info` VALUES ('2841', '4.4.2', 'Lenovo', 'S858t', '720', '1280', '19', '0.0059', '5.0000');
INSERT INTO `device_info` VALUES ('2842', '4.4.4', 'samsung', 'SM-G3608', '800', '480', '19', '0.0496', '4.5000');
INSERT INTO `device_info` VALUES ('2843', '5.0.1', 'samsung', 'SM-N9150', '1600', '2560', '21', '0.0156', '0.0000');
INSERT INTO `device_info` VALUES ('2844', '4.4.4', 'huawei', 'G621-TL00', '720', '1280', '19', '0.2858', '5.0000');
INSERT INTO `device_info` VALUES ('2845', '4.4.2', 'Lenovo', 'Tablet 2-830F', '1200', '1920', '19', '0.0016', '8.0000');
INSERT INTO `device_info` VALUES ('2846', '4.4.4', 'Lenovo', 'A938t', '720', '1280', '19', '0.0136', '6.0000');
INSERT INTO `device_info` VALUES ('2847', '4.3', 'Coolpad', '5200S', '480', '800', '18', '0.0228', '4.0000');
INSERT INTO `device_info` VALUES ('2848', '4.4.4', 'zte', 'N918St', '720', '1280', '19', '0.0552', '5.0000');
INSERT INTO `device_info` VALUES ('2849', '4.4.4', 'samsung', 'SM-G7200', '720', '1280', '19', '0.0702', '5.2500');
INSERT INTO `device_info` VALUES ('2850', '4.4.2', 'huawei', 'Che2-TL00', '720', '1280', '19', '0.1434', '5.5000');
INSERT INTO `device_info` VALUES ('2851', '4.4.4', 'lenovo', 'A2800-d', '480', '800', '19', '0.1015', '4.0000');
INSERT INTO `device_info` VALUES ('2852', '4.4.4', 'huawei', 'G7-TL00', '720', '1280', '19', '0.1611', '5.5000');
INSERT INTO `device_info` VALUES ('2853', '4.4.4', 'zte', 'Q802D', '720', '1280', '19', '0.0023', '5.0000');
INSERT INTO `device_info` VALUES ('2854', '5.1', 'MTK', 'MT6752', '1080', '1920', '22', '0.0000', '5.5000');
INSERT INTO `device_info` VALUES ('2855', '6.0', 'MTK', 'MT6752', '1080', '1920', '23', '0.0000', '5.5000');
INSERT INTO `device_info` VALUES ('2856', '5.0', 'MTK', 'MT6795', '1440', '2560', '21', '0.0000', '5.5000');
INSERT INTO `device_info` VALUES ('2857', '6.0', 'MTK', 'MT6795', '1440', '2560', '23', '0.0000', '5.5000');
INSERT INTO `device_info` VALUES ('2858', '4.4.4', 'vivo', 'Y28L', '540', '960', '19', '0.1955', '4.7000');
INSERT INTO `device_info` VALUES ('2859', '4.4.4', 'vivo', 'Y23L', '480', '854', '19', '0.8198', '4.5000');
INSERT INTO `device_info` VALUES ('2860', '4.4.3', 'Coolpad', '8702D', '480', '854', '19', '0.0639', '4.5000');
INSERT INTO `device_info` VALUES ('2861', '4.4.4', 'vivo', 'X5Max L', '1080', '1920', '19', '0.0947', '5.5000');
INSERT INTO `device_info` VALUES ('2862', '5.1', 'Motorola', 'XT1085', '1080', '1920', '22', '0.0127', '5.2000');
INSERT INTO `device_info` VALUES ('2863', '4.4.4', 'oppo', 'R8207', '720', '1280', '19', '0.5818', '5.0000');
INSERT INTO `device_info` VALUES ('2864', 'N', 'Google', 'Nexus 6', '1440', '2560', '23', '0.0079', '5.9600');
INSERT INTO `device_info` VALUES ('2865', '5.1.1', 'Nokia', 'N1', '1536', '2048', '22', '0.0176', '7.9000');
INSERT INTO `device_info` VALUES ('2866', '5.0.2', 'HTC', 'D826w', '1080', '1920', '21', '0.0070', '5.5000');
INSERT INTO `device_info` VALUES ('2867', '4.4.4', 'lenovo', 'A6800', '720', '1280', '19', '0.0124', '5.0000');
INSERT INTO `device_info` VALUES ('2868', '5.0.2', 'Samsung', 'SM-A3009', '540', '960', '21', '0.0075', '4.5000');
INSERT INTO `device_info` VALUES ('2869', '5.0.2', 'Letv', 'X600', '1080', '1920', '21', '0.1253', '5.5000');
INSERT INTO `device_info` VALUES ('2870', '5.0', 'lenovo', 'A7600-m', '720', '1280', '21', '0.0205', '5.5000');
INSERT INTO `device_info` VALUES ('2871', '4.4.4', 'Coolpad', 'Y75', '540', '960', '19', '0.1103', '5.5000');
INSERT INTO `device_info` VALUES ('2872', '4.4.4', 'xiaomi', 'MI NOTE LTE', '1080', '1920', '19', '0.5993', '5.7000');
INSERT INTO `device_info` VALUES ('2873', '5.0.2', 'samsung', 'SM-A7000', '1080', '1920', '21', '0.3364', '5.5000');
INSERT INTO `device_info` VALUES ('2874', '4.4.4', 'vivo', 'X5S L', '720', '1280', '19', '0.4028', '5.0000');
INSERT INTO `device_info` VALUES ('2875', '4.4.2', 'huawei', 'PE-CL00', '1080', '1776', '19', '0.1073', '0.0000');
INSERT INTO `device_info` VALUES ('2876', '4.4.4', 'xiaomi', 'HM-2LTE-CU', '720', '1280', '19', '0.2540', '4.7000');
INSERT INTO `device_info` VALUES ('2877', '4.4.4', 'Coolpad', '5316', '480', '854', '19', '0.0174', '5.0000');
INSERT INTO `device_info` VALUES ('2878', '4.4.4', 'Samsung', 'SM-E7000', '720', '1280', '19', '0.0574', '5.5000');
INSERT INTO `device_info` VALUES ('2879', '4.4.4', 'MEIZU', 'M1', '768', '1280', '19', '0.1440', '5.0000');
INSERT INTO `device_info` VALUES ('2880', '4.4.4', 'samsung', 'SM-G3609', '480', '800', '19', '0.0262', '4.5000');
INSERT INTO `device_info` VALUES ('2881', '4.4.4', 'huawei', 'G620S-UL00', '720', '1280', '19', '0.0661', '5.0000');
INSERT INTO `device_info` VALUES ('2882', '4.4.4', 'vivo', 'X5Max+', '1080', '1920', '19', '0.3664', '5.5000');
INSERT INTO `device_info` VALUES ('2883', '4.4.4', 'oppo', 'A31t', '480', '854', '19', '0.2466', '4.5000');
INSERT INTO `device_info` VALUES ('2884', '5.0', 'gionee', 'GN9006', '1080', '1920', '21', '0.1051', '5.2000');
INSERT INTO `device_info` VALUES ('2885', '4.4.4', 'Lenovo', 'A858t', '720', '1280', '19', '0.0208', '5.0000');
INSERT INTO `device_info` VALUES ('2886', '4.4.4', 'vivo', 'Y29L', '720', '1280', '19', '0.2059', '5.0000');
INSERT INTO `device_info` VALUES ('2887', '5.0.2', 'motorola', 'XT1079', '720', '1280', '21', '0.0000', '5.0000');
INSERT INTO `device_info` VALUES ('2888', '4.4.4', 'samsung', 'SM-E7009', '720', '1280', '19', '0.0120', '5.5000');
INSERT INTO `device_info` VALUES ('2889', '5.0.2', 'htc', 'D826t', '1080', '1920', '21', '0.0029', '5.5000');
INSERT INTO `device_info` VALUES ('2890', '4.4.4', 'oppo', 'R8200', '1280', '720', '19', '0.0177', '5.0000');
INSERT INTO `device_info` VALUES ('2891', '5.0.2', 'nubia', 'NX511J', '1080', '1920', '21', '0.0876', '5.2000');
INSERT INTO `device_info` VALUES ('2892', '5.0.1', 'lenovo', 'A2580', '480', '854', '21', '0.0296', '5.0000');
INSERT INTO `device_info` VALUES ('2893', '6.0.1', 'samsung', 'SM-G9200', '1440', '2560', '22', '0.1568', '5.1000');
INSERT INTO `device_info` VALUES ('2894', '5.1', 'Lenovo', 'A3860', '720', '1280', '22', '0.0357', '5.0000');
INSERT INTO `device_info` VALUES ('2895', '5.0', 'ASUS', 'Z00ADB', '1080', '1920', '21', '0.0162', '5.5000');
INSERT INTO `device_info` VALUES ('2896', '6.0.1', 'samsung', 'SM-G9250', '1440', '2560', '23', '0.2565', '5.1000');
INSERT INTO `device_info` VALUES ('2897', '6.0', 'htc', 'M9w', '1080', '1920', '23', '0.0019', '5.0000');
INSERT INTO `device_info` VALUES ('2898', '4.4.2', 'Coolpad', '8690_T00', '1080', '1776', '19', '0.0138', '5.2000');
INSERT INTO `device_info` VALUES ('2899', '5.0', 'vivo', 'X5Pro D', '1080', '1920', '21', '0.5787', '6.0000');
INSERT INTO `device_info` VALUES ('2900', '4.4.4', 'lenovo', 'Z2w', '720', '1280', '19', '0.0018', '5.5000');
INSERT INTO `device_info` VALUES ('2901', '4.4.4', 'zte', 'G719C', '720', '1280', '19', '0.0070', '5.5000');
INSERT INTO `device_info` VALUES ('2902', '4.4.2', 'HUAWEI', 'CHM-TL00H', '720', '1280', '19', '0.2372', '5.0000');
INSERT INTO `device_info` VALUES ('2903', '5.1.1', 'oppo', 'A51', '720', '1280', '22', '0.2414', '5.0000');
INSERT INTO `device_info` VALUES ('2904', '5.0.1', 'huawei', 'GRA-UL00', '1080', '1920', '21', '0.0613', '5.2000');
INSERT INTO `device_info` VALUES ('2905', '5.1', 'gionee', 'GN9008', '1440', '2560', '22', '0.0051', '6.0000');
INSERT INTO `device_info` VALUES ('2906', '5.0.2', 'HUAWEI', 'ALE-UL00', '720', '1280', '21', '0.1624', '5.0000');
INSERT INTO `device_info` VALUES ('2907', '5.0.2', 'motorola', 'XT1077', '720', '1280', '21', '0.0031', '5.0000');
INSERT INTO `device_info` VALUES ('2908', '5.0.1', 'HUAWEI', 'GRA-UL10', '1080', '1794', '21', '0.1406', '5.2000');
INSERT INTO `device_info` VALUES ('2909', '5.0', 'oppo', 'R7 Plus', '1080', '1920', '21', '0.5864', '6.0000');
INSERT INTO `device_info` VALUES ('2910', '5.0.2', 'Letv', 'X800', '1440', '2560', '21', '0.0508', '5.0000');
INSERT INTO `device_info` VALUES ('2911', '6.0.1', 'Samsung', 'SM-G9208', '1440', '2560', '23', '0.0455', '5.1000');
INSERT INTO `device_info` VALUES ('2912', '5.1.1', 'Lenovo', 'P1c72', '1080', '1920', '22', '0.0099', '5.5000');
INSERT INTO `device_info` VALUES ('2913', '5.1.1', 'lenovo', 'Z90-7', '1080', '1920', '22', '0.0063', '5.0000');
INSERT INTO `device_info` VALUES ('2914', '5.0', 'gionee', 'F303', '720', '1280', '21', '0.0479', '4.7000');
INSERT INTO `device_info` VALUES ('2915', '5.0.2', 'nubia', 'NX512J', '1080', '1920', '21', '0.0154', '5.5000');
INSERT INTO `device_info` VALUES ('2916', '5.0.1', 'HUAWEI', 'GRA-TL00', '1080', '1920', '21', '0.1398', '5.2000');
INSERT INTO `device_info` VALUES ('2917', '4.4.4', 'MeiTu', 'M4', '720', '1280', '19', '0.0238', '4.7000');
INSERT INTO `device_info` VALUES ('2918', '4.4.4', 'oppo', 'R7c', '1080', '1920', '19', '0.1125', '5.0000');
INSERT INTO `device_info` VALUES ('2919', '4.4.4', 'huawei', 'C199s', '720', '1280', '19', '0.1000', '5.5000');
INSERT INTO `device_info` VALUES ('2920', '4.4.4', 'Coolpad', 'Y90', '720', '1280', '19', '0.0231', '5.5000');
INSERT INTO `device_info` VALUES ('2921', '5.1', 'meizu', 'm2 note', '1080', '1920', '22', '0.6889', '5.5000');
INSERT INTO `device_info` VALUES ('2922', '4.4.4', 'Lenovo', 'S90-e', '720', '1280', '19', '0.0038', '5.0000');
INSERT INTO `device_info` VALUES ('2923', '4.4.4', 'Coolpad', '5956', '720', '1280', '19', '0.0057', '5.5000');
INSERT INTO `device_info` VALUES ('2924', '4.4.4', 'Coolpad', 'Coolpad 5263', '480', '854', '19', '0.0359', '5.0000');
INSERT INTO `device_info` VALUES ('2925', '4.4.4', 'Teclast', 'X70 3G (C5D9)', '600', '1024', '19', '0.0000', '7.0000');
INSERT INTO `device_info` VALUES ('2926', '4.4.4', 'Dell', 'Venue 8 3840', '1200', '1920', '19', '0.0009', '8.0000');
INSERT INTO `device_info` VALUES ('2927', '5.0.2', 'vivo', 'X5M', '720', '1280', '21', '0.4185', '5.0000');
INSERT INTO `device_info` VALUES ('2928', '4.4.4', 'Hisense', 'G610M', '720', '1280', '19', '0.0022', '5.0000');
INSERT INTO `device_info` VALUES ('2929', '6.0.1', 'lenovo', 'Lenovo X3c50', '1080', '1920', '23', '0.0007', '5.5000');
INSERT INTO `device_info` VALUES ('2930', '4.4.4', 'Hisense', 'M20-T', '480', '854', '19', '0.1000', '5.0000');
INSERT INTO `device_info` VALUES ('2931', '5.0.1', 'MEIZU', 'MX5', '1080', '1920', '21', '0.5022', '5.5000');
INSERT INTO `device_info` VALUES ('2932', '5.1', 'gionee', 'M5', '720', '1280', '22', '0.0982', '5.5000');
INSERT INTO `device_info` VALUES ('2933', '5.0.2', 'nubia', 'NX508J', '1080', '1920', '21', '0.0152', '5.2000');
INSERT INTO `device_info` VALUES ('2934', '4.4.4', 'oppo', 'A31', '480', '854', '19', '1.4953', '4.5000');
INSERT INTO `device_info` VALUES ('2935', '5.0', 'gionee', 'F103', '720', '1280', '21', '0.5322', '0.0000');
INSERT INTO `device_info` VALUES ('2936', '5.1', 'samsung', 'SM-J5008', '720', '1280', '22', '0.1237', '5.0000');
INSERT INTO `device_info` VALUES ('2937', '4.4.4', 'oppo', 'A11', '480', '854', '19', '0.4162', '4.5000');
INSERT INTO `device_info` VALUES ('2938', '4.4.3', 'YotaPhone', 'YD206', '1080', '1920', '19', '0.0015', '5.0000');
INSERT INTO `device_info` VALUES ('2939', '5.1.1', 'Samsung', 'SM-A8000', '1080', '1920', '22', '0.1695', '5.7000');
INSERT INTO `device_info` VALUES ('2940', '5.0', 'vivo', 'Y33', '720', '1280', '21', '0.3413', '4.7000');
INSERT INTO `device_info` VALUES ('2941', '5.0.2', 'HUAWEI', 'PLK-CL00', '1080', '1920', '21', '0.0255', '5.5000');
INSERT INTO `device_info` VALUES ('2942', '5.0', 'vivo', 'X5Pro L', '1080', '1920', '21', '0.0242', '5.2000');
INSERT INTO `device_info` VALUES ('2943', '4.4.4', 'oppo', 'R7', '1080', '1920', '19', '1.7669', '5.0000');
INSERT INTO `device_info` VALUES ('2944', '5.1', 'Coolpad', '8676-M01', '720', '1280', '22', '0.0432', '5.5000');
INSERT INTO `device_info` VALUES ('2945', '4.1.2', 'Sony Eriosson', 'LT29i', '720', '1280', '16', '0.1000', '4.6000');
INSERT INTO `device_info` VALUES ('2946', '5.0.2', 'huawei', 'PLK-AL10', '1080', '1920', '21', '0.1857', '5.2000');
INSERT INTO `device_info` VALUES ('2947', '5.1', 'Coolpad', '8676-A01', '720', '1280', '22', '0.0000', '5.5000');
INSERT INTO `device_info` VALUES ('2948', '4.4.4', 'zte', 'ZTE Q7-C', '720', '1280', '19', '0.1000', '5.5000');
INSERT INTO `device_info` VALUES ('2949', '4.4.2', 'Coolpad', 'Coolpad 7605', '540', '960', '19', '0.1000', '5.0000');
INSERT INTO `device_info` VALUES ('2950', '5.1', 'meizu', 'm2', '720', '1280', '22', '0.3492', '5.0000');
INSERT INTO `device_info` VALUES ('2951', '5.1.1', 'ONEPLUS', 'ONE A2001', '1080', '1920', '22', '0.0229', '505.0000');
INSERT INTO `device_info` VALUES ('2952', '5.1.1', 'HUAWEI', 'DAV-703L', '1080', '1920', '22', '0.0672', '6.8000');
INSERT INTO `device_info` VALUES ('2953', '5.1.1', 'lenovo', 'Z1', '1080', '1920', '22', '0.0342', '5.5000');
INSERT INTO `device_info` VALUES ('2954', '5.0.2', 'xiaomi', 'HM Note 2', '1080', '1920', '21', '1.0956', '5.5000');
INSERT INTO `device_info` VALUES ('2955', '5.1', 'huawei', 'RIO-AL00', '1080', '1920', '22', '0.2633', '5.5000');
INSERT INTO `device_info` VALUES ('2956', '4.4.4', 'oppo', 'R7s', '1080', '1920', '19', '1.0859', '5.5000');
INSERT INTO `device_info` VALUES ('2957', '5.0.2', 'nubia', 'NX513J', '1080', '1920', '21', '0.0147', '5.2000');
INSERT INTO `device_info` VALUES ('2958', '4.4.4', 'Smartisan', 'YQ601', '1080', '1920', '19', '0.1206', '5.5000');
INSERT INTO `device_info` VALUES ('2959', '5.0.2', 'motorola', 'XT1115', '1440', '2560', '21', '0.0021', '5.9600');
INSERT INTO `device_info` VALUES ('2960', '5.1', 'zte', 'ZTE N939St', '1080', '1920', '22', '0.0000', '5.5000');
INSERT INTO `device_info` VALUES ('2961', '5.1', 'QiKU', '8681-M02', '1080', '1920', '22', '0.0573', '5.5000');
INSERT INTO `device_info` VALUES ('2962', '5.1.1', 'huawei', 'ATH-AL00', '1080', '1920', '22', '0.0842', '5.2000');
INSERT INTO `device_info` VALUES ('2963', '5.0.2', 'vivo', 'Y37', '720', '1280', '21', '0.2580', '5.5000');
INSERT INTO `device_info` VALUES ('2964', '5.0.2', 'huawei', 'CHE-TL00', '720', '1280', '21', '0.0890', '5.5000');
INSERT INTO `device_info` VALUES ('2965', '6.0.1', 'Samsung', 'SM-N9200', '1440', '2560', '23', '0.0659', '5.7000');
INSERT INTO `device_info` VALUES ('2966', '5.1.1', 'xiaomi', 'MI 4C', '1080', '1920', '22', '0.4362', '5.0000');
INSERT INTO `device_info` VALUES ('2967', '5.0', 'zte', 'Q806T', '720', '1280', '21', '0.0084', '5.0000');
INSERT INTO `device_info` VALUES ('2968', '4.4.4', 'ZTE', 'ZTE Q508U', '480', '854', '19', '0.0012', '5.5000');
INSERT INTO `device_info` VALUES ('2969', '5.1.1', 'huawei', 'CRR-UL00', '1080', '1920', '22', '0.0652', '5.5000');
INSERT INTO `device_info` VALUES ('2970', '5.1.1', 'motorola', 'XT1570', '1440', '2560', '22', '0.0045', '5.7000');
INSERT INTO `device_info` VALUES ('2971', '5.1.1', 'huawei', 'SCL-TL00', '720', '1280', '22', '0.1000', '5.0000');
INSERT INTO `device_info` VALUES ('2972', '5.0.2', 'TCL', 'i806', '1080', '1920', '21', '0.0012', '5.5000');
INSERT INTO `device_info` VALUES ('2973', '5.1', 'gionee', 'GN152', '480', '854', '22', '0.0729', '5.0000');
INSERT INTO `device_info` VALUES ('2974', '5.0.2', 'Letv', 'X900', '1440', '2560', '21', '0.0298', '6.3300');
INSERT INTO `device_info` VALUES ('2975', '5.1', 'huawei', 'RIO-UL00', '1080', '1920', '22', '0.0617', '5.5000');
INSERT INTO `device_info` VALUES ('2976', '5.1.1', 'zte', 'B2015', '1080', '1920', '22', '0.0069', '5.2000');
INSERT INTO `device_info` VALUES ('2977', '4.4.4', 'Coolpad', 'Y82-520', '540', '960', '19', '0.0196', '5.5000');
INSERT INTO `device_info` VALUES ('2978', '4.4.4', 'TCL', 'P318L', '480', '854', '19', '0.1000', '5.0000');
INSERT INTO `device_info` VALUES ('2979', '5.1', 'meizu', 'PRO 5', '1080', '1920', '22', '0.0841', '5.7000');
INSERT INTO `device_info` VALUES ('2980', '5.1.1', 'samsung', 'G6000', '720', '1280', '22', '0.0486', '5.5000');
INSERT INTO `device_info` VALUES ('2981', '5.1.1', 'oppo', 'A33', '540', '960', '22', '0.9238', '5.0000');
INSERT INTO `device_info` VALUES ('2982', '5.1.1', 'QiKU', '8692-A00', '1080', '1920', '22', '0.0111', '6.0000');
INSERT INTO `device_info` VALUES ('2983', '4.4.4', 'Hisense', 'Hisense H910', '1080', '1920', '19', '0.1000', '5.5000');
INSERT INTO `device_info` VALUES ('2984', '5.1.1', 'huawei', 'KIW-AL10', '1080', '1920', '22', '0.0000', '5.5000');
INSERT INTO `device_info` VALUES ('2985', '5.1.1', 'samsung', 'G5500', '720', '1280', '22', '0.0624', '5.0000');
INSERT INTO `device_info` VALUES ('2986', '5.1', 'gionee', 'GN5001', '720', '1280', '22', '0.1000', '5.0000');
INSERT INTO `device_info` VALUES ('2987', '5.1', 'ZTE', 'ZTE S2010', '720', '1280', '22', '0.0013', '5.0000');
INSERT INTO `device_info` VALUES ('2988', '5.1.1', 'huawei', 'ATH-TL00H', '1080', '1920', '22', '0.0070', '5.2000');
INSERT INTO `device_info` VALUES ('2989', '7.0', 'Google', 'Nexus 6P', '1440', '2560', '24', '0.0050', '5.7000');
INSERT INTO `device_info` VALUES ('2990', '4.4.4', 'Coolpad', '8029', '480', '800', '19', '0.0163', '0.0000');
INSERT INTO `device_info` VALUES ('2991', '5.1', 'meizu', 'm1 metal', '1080', '1920', '22', '0.3444', '5.5000');
INSERT INTO `device_info` VALUES ('2992', '5.1.1', 'ONEPLUS', 'ONE E1001', '1080', '1920', '22', '0.0147', '5.0000');
INSERT INTO `device_info` VALUES ('2993', '5.1.1', 'gionee', 'M3S', '720', '1280', '22', '0.0090', '5.0000');
INSERT INTO `device_info` VALUES ('2994', '5.0', 'vivo', 'Y35', '720', '1280', '21', '0.0000', '5.0000');
INSERT INTO `device_info` VALUES ('2995', '5.1.1', 'HUAWEI', 'KIW-TL00H', '1080', '1920', '22', '0.1452', '5.5000');
INSERT INTO `device_info` VALUES ('2996', '5.1', 'IUNI', 'N1', '720', '1280', '22', '0.0026', '5.0000');
INSERT INTO `device_info` VALUES ('2997', '5.1', 'gionee', 'GN9010', '720', '1280', '22', '0.1707', '5.5000');
INSERT INTO `device_info` VALUES ('2998', '5.0.2', 'vivo', 'Y937', '720', '1280', '21', '0.0448', '5.5000');
INSERT INTO `device_info` VALUES ('2999', '5.0.2', 'xiaomi', 'HM Note 3', '1080', '1920', '21', '0.7549', '5.5000');
INSERT INTO `device_info` VALUES ('3000', '5.1.1', 'oppo', 'A53', '720', '1280', '22', '0.0000', '5.5000');
INSERT INTO `device_info` VALUES ('3001', '5.1', 'Lenovo', 'k52t38', '1080', '1920', '22', '0.0004', '5.5000');
INSERT INTO `device_info` VALUES ('3002', '4.4.4', 'Coolpad', '5263S', '480', '854', '19', '0.1000', '5.0000');
INSERT INTO `device_info` VALUES ('3003', '5.1', 'xiaomi', 'MI PAD 2', '1536', '2048', '22', '0.0715', '7.9000');
INSERT INTO `device_info` VALUES ('3004', '5.1.1', 'xiaomi', 'HM 3', '720', '1280', '22', '0.3772', '5.0000');
INSERT INTO `device_info` VALUES ('3005', '5.1.1', 'samsung', 'SM-J3109', '720', '1280', '22', '0.0799', '5.0000');
INSERT INTO `device_info` VALUES ('3006', '5.1', 'vivo', 'X6D', '1080', '1920', '22', '0.6597', '5.2000');
INSERT INTO `device_info` VALUES ('3007', '6.0', 'huawei', 'NXT-AL10', '1080', '1920', '23', '0.3099', '6.0000');
INSERT INTO `device_info` VALUES ('3008', '5.1.1', 'zte', 'ZTE N928Dt', '480', '854', '22', '0.0000', '5.0000');
INSERT INTO `device_info` VALUES ('3009', '5.1', 'vivo', 'X6Plus D', '1080', '1920', '22', '0.0000', '5.7000');
INSERT INTO `device_info` VALUES ('3010', '5.1.1', 'Coolpad', 'A8-930', '1080', '1920', '22', '0.0138', '5.5000');
INSERT INTO `device_info` VALUES ('3011', '5.1', 'ZTE', 'C880U', '720', '1280', '22', '0.0125', '5.0000');
INSERT INTO `device_info` VALUES ('3012', '5.1', 'ZTE', 'Q529C', '720', '1280', '22', '0.0277', '5.0000');
INSERT INTO `device_info` VALUES ('3013', '5.0', 'ASUS', 'Z00XSB', '1080', '1920', '21', '0.1000', '5.5000');
INSERT INTO `device_info` VALUES ('3014', '5.1', 'huawei', 'TAG-AL00', '720', '1280', '22', '0.1955', '5.0000');
INSERT INTO `device_info` VALUES ('3015', '5.1', 'MTK', 'MT6755', '1080', '1920', '22', '0.0000', '6.0000');
INSERT INTO `device_info` VALUES ('3016', '6.0', 'MTK', 'MT6755', '1080', '1920', '23', '0.0000', '6.0000');
INSERT INTO `device_info` VALUES ('3017', '5.1', 'gionee', 'GN8001', '1080', '1920', '22', '0.0756', '6.0000');
INSERT INTO `device_info` VALUES ('3018', '6.0', 'xiaomi', 'MI 5', '1080', '1920', '23', '0.1561', '5.1500');
INSERT INTO `device_info` VALUES ('3019', '4.4.4', 'Hisense', 'D1-M', '720', '1280', '19', '0.1000', '5.0000');
INSERT INTO `device_info` VALUES ('3020', '5.1.1', 'samsung', 'A7100', '1080', '1920', '22', '0.0611', '5.5000');
INSERT INTO `device_info` VALUES ('3021', '4.4.4', 'Coolpad', '5721', '720', '1280', '19', '0.0066', '5.0000');
INSERT INTO `device_info` VALUES ('3022', '6.0.1', 'Samsung', 'SM-A9000', '1080', '1920', '22', '0.0795', '6.0000');
INSERT INTO `device_info` VALUES ('3023', '4.4.4', 'zte', 'ZTE S2014', '720', '1280', '19', '0.1000', '5.0000');
INSERT INTO `device_info` VALUES ('3024', '5.1', 'RAMOS', 'ramos R9', '1080', '1920', '22', '0.0025', '5.2000');
INSERT INTO `device_info` VALUES ('3025', '5.1.1', 'xiaomi', 'MI 4S', '1080', '1920', '22', '0.0471', '5.0000');
INSERT INTO `device_info` VALUES ('3026', '5.1.1', 'Hisense', 'C20', '720', '1280', '22', '0.1000', '5.0000');
INSERT INTO `device_info` VALUES ('3027', '6.0.1', 'samsung', 'SM-G9300', '1440', '2560', '23', '0.0000', '5.1000');
INSERT INTO `device_info` VALUES ('3028', '5.1', 'QiKU', '1501_M02', '720', '1280', '22', '0.0765', '0.0000');
INSERT INTO `device_info` VALUES ('3029', '6.0', 'HTC', 'X9u', '1080', '1920', '23', '0.0019', '5.5000');
INSERT INTO `device_info` VALUES ('3030', '6.0', 'MTK', 'MT6797', '1440', '2560', '23', '0.0000', '6.0000');
INSERT INTO `device_info` VALUES ('3031', '5.1.1', 'samsung', 'SM-J5108', '720', '1280', '22', '0.0000', '5.2000');
INSERT INTO `device_info` VALUES ('3032', '5.1.1', 'TCL', 'P590L', '720', '1280', '22', '0.0083', '5.0000');
INSERT INTO `device_info` VALUES ('3033', '5.1', 'doov', 'L7', '720', '1280', '22', '0.0046', '5.2000');
INSERT INTO `device_info` VALUES ('3034', '5.1.1', 'Hisense', 'A1', '1080', '1920', '22', '0.0002', '5.5000');
INSERT INTO `device_info` VALUES ('3035', '5.1', 'ASUS', 'X005', '1080', '1920', '22', '0.0009', '5.5000');
INSERT INTO `device_info` VALUES ('3036', '5.1', 'GreenOrange', 'GO JL628', '1080', '1920', '22', '0.0000', '5.5000');
INSERT INTO `device_info` VALUES ('3037', '5.1.1', 'Smartisan', 'SM801', '1080', '1920', '22', '0.0154', '4.9500');
INSERT INTO `device_info` VALUES ('3038', '6.0.1', 'htc', 'A9w', '1080', '1920', '23', '0.0023', '5.0000');
INSERT INTO `device_info` VALUES ('3039', '5.1', 'gionee', 'F105', '720', '1280', '22', '0.1000', '5.0000');
INSERT INTO `device_info` VALUES ('3040', '5.1', 'oppo', 'R9m', '1080', '1920', '22', '0.1476', '5.5000');
INSERT INTO `device_info` VALUES ('3041', '5.1', 'Coolpad', 'Y71-511', '540', '960', '22', '0.0058', '5.0000');
INSERT INTO `device_info` VALUES ('3042', '5.1', 'MeiTu', 'V4', '1080', '1920', '22', '0.0000', '5.0000');
INSERT INTO `device_info` VALUES ('3043', '5.1.1', 'vivo', 'X6S A', '1080', '1920', '22', '0.0000', '5.2000');
INSERT INTO `device_info` VALUES ('3044', '5.1.1', 'samsung', 'SM-J7109', '1080', '1920', '22', '0.0000', '5.2500');
INSERT INTO `device_info` VALUES ('3045', '5.1.1', 'oppo', 'R9 Plusm A', '1080', '1920', '22', '0.0746', '6.0000');
INSERT INTO `device_info` VALUES ('3046', '5.1.1', 'vivo', 'X6SPlus D', '1080', '1920', '22', '0.0000', '5.7000');
INSERT INTO `device_info` VALUES ('3047', '6.0', 'huawei', 'EVA-DL00', '1080', '1920', '23', '0.1000', '5.2000');
INSERT INTO `device_info` VALUES ('3048', '6.0', 'MEIZU', 'PRO 6', '1080', '1920', '23', '0.0122', '5.2000');
INSERT INTO `device_info` VALUES ('3049', '4.4.2', 'zte', 'Q2S-T', '720', '1280', '19', '0.1000', '5.5000');
INSERT INTO `device_info` VALUES ('3050', '5.1.1', 'Coolpad', 'Y72-921', '720', '1280', '22', '0.0000', '5.0000');
INSERT INTO `device_info` VALUES ('3051', '5.1.1', 'Hisense', 'E81', '800', '1280', '22', '0.1000', '8.0000');
INSERT INTO `device_info` VALUES ('3052', '5.1.1', 'Hisense', 'E70-T', '720', '1280', '22', '0.0060', '5.0000');
INSERT INTO `device_info` VALUES ('3053', '5.1.1', 'Hisense', 'E20T', '720', '1280', '22', '0.0029', '5.0000');
INSERT INTO `device_info` VALUES ('3054', '5.1', 'Coolpad', '锋尚Air 8298-M02', '720', '1280', '22', '0.0006', '5.0000');
INSERT INTO `device_info` VALUES ('3055', '5.1', 'doov', '朵唯 L5Pro', '1080', '1920', '22', '0.0078', '5.2000');
INSERT INTO `device_info` VALUES ('3056', '5.1', 'Koobee', '酷比 S7', '720', '1280', '22', '0.0044', '5.5000');
INSERT INTO `device_info` VALUES ('3057', '4.4.4', 'TCL', 'TCL P618L', '720', '1280', '19', '0.0008', '5.0000');
INSERT INTO `device_info` VALUES ('3058', '5.1', 'GreenOrange', '青橙 N20', '1080', '1920', '22', '0.0012', '5.5000');
INSERT INTO `device_info` VALUES ('3059', '4.4.4', 'Philips', 'S616L', '720', '1280', '19', '0.0001', '6.5000');
INSERT INTO `device_info` VALUES ('3060', '5.0.2', 'vivo', 'vivo Y31', '540', '960', '21', '0.2107', '4.7000');
INSERT INTO `device_info` VALUES ('3061', '5.0.2', 'vivo', 'Y31A', '540', '960', '21', '0.2192', '4.7000');
INSERT INTO `device_info` VALUES ('3062', '5.1.1', 'Coolpad', 'Y91-921', '720', '1280', '22', '0.0043', '5.5000');
INSERT INTO `device_info` VALUES ('3063', '5.1', 'Philips', 'V787', '1080', '1920', '22', '0.0003', '5.0000');
INSERT INTO `device_info` VALUES ('3064', '5.1.1', 'HUAWEI', 'CRR-CL20', '1080', '1920', '22', '0.0013', '5.5000');
INSERT INTO `device_info` VALUES ('3065', '6.0', 'HUAWEI', 'VIE-AL10', '1080', '1920', '23', '0.0567', '5.5000');
INSERT INTO `device_info` VALUES ('3066', '5.1.1', 'ZTE', 'ZTE C2016', '1080', '1920', '22', '0.0027', '6.0000');
INSERT INTO `device_info` VALUES ('3067', '2.3.6', 'ZTE', 'V6700', '320', '480', '10', '0.1000', '3.5000');
INSERT INTO `device_info` VALUES ('3068', '6.0', 'QiKU', '1505-A01', '1080', '1920', '23', '0.1000', '5.5000');
INSERT INTO `device_info` VALUES ('3069', '6.0', 'MEIZU', 'M1 E', '1080', '1920', '23', '0.1000', '5.5000');

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
) ENGINE=InnoDB AUTO_INCREMENT=4752 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('2457', null, '2016-03-21 15:42:57', null, 'Windows 7', 'Chrome', '120.52.24.16', null, null, null, null);
INSERT INTO `log` VALUES ('2458', null, '2016-03-21 15:44:25', null, 'Windows 7', 'Chrome', '180.169.84.156', null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

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
INSERT INTO `permission` VALUES ('39', '1', '菜单管理', 'F', '4', '/permission/list', '', 'icon-hamburg-old-versions', null, '');
INSERT INTO `permission` VALUES ('45', '39', '修改', 'O', null, '', 'sys:perm:update', null, null, '菜单管理');
INSERT INTO `permission` VALUES ('58', '39', '添加', 'O', null, '', 'sys:perm:add', null, null, '菜单管理');
INSERT INTO `permission` VALUES ('59', '39', '删除', 'O', null, '', 'sys:perm:delete', null, null, '菜单管理');
INSERT INTO `permission` VALUES ('61', '40', '添加', 'O', null, '', 'sys:dict:add', null, null, '字典管理');
INSERT INTO `permission` VALUES ('62', '40', '删除', 'O', null, '', 'sys:dict:delete', null, null, '字典管理');
INSERT INTO `permission` VALUES ('63', '40', '修改', 'O', null, '', 'sys:dict:update', null, null, '字典管理');
INSERT INTO `permission` VALUES ('69', '40', '查看', 'O', null, '', 'sys:dict:view', null, null, '字典管理');
INSERT INTO `permission` VALUES ('70', '39', '查看', 'O', null, '', 'sys:perm:menu:view', null, null, '菜单管理');
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
INSERT INTO `permission` VALUES ('135', null, '任务记录', null, null, '', null, null, null, '任务记录');
INSERT INTO `permission` VALUES ('136', null, '设置', null, null, '', null, null, null, '设置');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'audit', 'audit', '审核员', '2', null);
INSERT INTO `role` VALUES ('5', 'customer', 'customer', '普通用户', '3', null);
INSERT INTO `role` VALUES ('13', 'superadmin', 'superadmin', '超级管理员', '1', null);
INSERT INTO `role` VALUES ('14', 'admin', 'admin', '管理员', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=1551 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
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
INSERT INTO `role_permission` VALUES ('1498', '13', '108');
INSERT INTO `role_permission` VALUES ('1499', '13', '109');
INSERT INTO `role_permission` VALUES ('1500', '13', '111');
INSERT INTO `role_permission` VALUES ('1501', '13', '112');
INSERT INTO `role_permission` VALUES ('1502', '13', '113');
INSERT INTO `role_permission` VALUES ('1504', '13', '110');
INSERT INTO `role_permission` VALUES ('1531', '1', '135');
INSERT INTO `role_permission` VALUES ('1532', '1', '136');
INSERT INTO `role_permission` VALUES ('1533', '5', '124');
INSERT INTO `role_permission` VALUES ('1534', '5', '125');
INSERT INTO `role_permission` VALUES ('1535', '5', '132');
INSERT INTO `role_permission` VALUES ('1536', '5', '127');
INSERT INTO `role_permission` VALUES ('1537', '5', '131');
INSERT INTO `role_permission` VALUES ('1538', '5', '128');
INSERT INTO `role_permission` VALUES ('1539', '5', '129');
INSERT INTO `role_permission` VALUES ('1540', '5', '130');
INSERT INTO `role_permission` VALUES ('1541', '14', '124');
INSERT INTO `role_permission` VALUES ('1542', '14', '125');
INSERT INTO `role_permission` VALUES ('1543', '14', '132');
INSERT INTO `role_permission` VALUES ('1544', '14', '133');
INSERT INTO `role_permission` VALUES ('1545', '14', '134');
INSERT INTO `role_permission` VALUES ('1546', '14', '1');
INSERT INTO `role_permission` VALUES ('1547', '14', '3');
INSERT INTO `role_permission` VALUES ('1548', '14', '7');
INSERT INTO `role_permission` VALUES ('1549', '14', '97');
INSERT INTO `role_permission` VALUES ('1550', '14', '98');

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `audit_user_id` int(11) NOT NULL DEFAULT '0',
  `app_name` varchar(64) NOT NULL COMMENT '应用名称',
  `package_name` varchar(64) DEFAULT NULL COMMENT '应用程序包名',
  `version_code` int(11) NOT NULL DEFAULT '0',
  `app_version` varchar(32) NOT NULL COMMENT '应用版本',
  `apk_url` varchar(255) DEFAULT NULL,
  `remark_name` varchar(64) NOT NULL COMMENT '备注名称',
  `incr_day` int(11) NOT NULL DEFAULT '0' COMMENT '每日新增用户数',
  `day_limit` int(11) DEFAULT '100000',
  `incr_up_down` int(11) NOT NULL DEFAULT '0' COMMENT '上下波动范围',
  `run_time` int(11) NOT NULL DEFAULT '0' COMMENT '应用运行时长',
  `run_up_down` int(11) NOT NULL DEFAULT '0' COMMENT '运行市场上下波动范围',
  `run_start_time` int(11) NOT NULL COMMENT '投放开始时间',
  `run_end_time` int(11) NOT NULL COMMENT '投放结束时间',
  `run_speed` int(11) NOT NULL DEFAULT '0' COMMENT '投放速度',
  `retain_day` int(11) NOT NULL DEFAULT '0' COMMENT '留存天数',
  `retain_percent` int(11) DEFAULT NULL COMMENT '留存率',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '任务被执行，回调时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('11', '9','13', 'Mainac', 'com.yuekuba.maintest', '1', '15.0', 'http://www.yuekuba.com/task/apk/download?file=maintest-debug.apk', '网易新闻', '10000', '100000', '10', '60', '1', '0', '23', '1', '7', '50', '2', '2016-09-11 03:38:59');

INSERT INTO `task` VALUES ('12', '9','0', 'Mainac', 'com.yuekuba.maintest', '1', '15.0', 'http://www.yuekuba.com/task/apk/download?file=maintest-debug.apk', '网易新闻', '10000', '100000', '10', '60', '1', '0', '23', '1', '7', '50', '-1', '2016-09-11 03:38:59');

-- ----------------------------
-- Table structure for `task_sub`
-- ----------------------------
DROP TABLE IF EXISTS `task_sub`;
CREATE TABLE `task_sub` (
  `id` varchar(36) NOT NULL,
  `task_id` int(11) NOT NULL COMMENT '任务id',
  `per_time` bigint(20) DEFAULT '0' COMMENT '所在粒度',
  `device_info_id` int(11) NOT NULL COMMENT '设备信息',
  `run_time` int(11) NOT NULL COMMENT '任务执行时间',
  `create_day` int(11) DEFAULT NULL,
  `callback_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '任务执行完回调时间',
  `tel_android_id` varchar(32) DEFAULT NULL COMMENT 'android_id 唯一',
  `subscriber_id` varchar(32) DEFAULT NULL COMMENT '跟operator有关系，前5位时operator',
  `operator` varchar(32) DEFAULT NULL COMMENT '运营商标志码',
  `operator_name` varchar(16) DEFAULT NULL COMMENT '中国联通\\中国电信\\中国移动',
  `line1_number` varchar(16) DEFAULT NULL COMMENT '联通手机的手机号码',
  `simSerial_number` varchar(32) DEFAULT NULL COMMENT 'sim卡串号',
  `network_type` int(11) NOT NULL COMMENT '手机卡网络类型',
  `phone_type` varchar(32) DEFAULT NULL COMMENT '手机通话类型',
  `mac` varchar(32) DEFAULT NULL COMMENT 'mac地址 唯一',
  `type` int(11) NOT NULL COMMENT '网络类型 0 手机网络 1 wifi',
  `version_incremental` varchar(16) NOT NULL DEFAULT '',
  `build_id` varchar(36) NOT NULL DEFAULT '',
  `secure_id` varchar(36) NOT NULL DEFAULT '',
  `serial` varchar(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('9', 'user1', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('10', 'super', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('11', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('12', 'user2', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('13', 'audit', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, '', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `user_account`
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_realname` varchar(16) DEFAULT NULL COMMENT '用户真实姓名',
  `point_count` int(11) NOT NULL DEFAULT '0' COMMENT '点数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_account
-- ----------------------------
INSERT INTO `user_account` VALUES ('4', '9', '刘锋', '300000');

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('41', '10', '13');
INSERT INTO `user_role` VALUES ('42', '9', '5');
INSERT INTO `user_role` VALUES ('45', '11', '14');
INSERT INTO `user_role` VALUES ('46', '13', '1');
