/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : czs

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2014-05-20 12:05:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `business_id` varchar(255) DEFAULT NULL,
  `consumer_id` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL COMMENT '结账类型,0:个人;1:集体',
  `consume_code` varchar(500) DEFAULT NULL,
  `scene_id` bigint(20) DEFAULT NULL,
  `status` smallint(6) DEFAULT '0' COMMENT '0:未结算;1:已结算;2忽略',
  `sett_date_time` datetime DEFAULT NULL COMMENT '结算日期',
  `sett_handler` varchar(255) DEFAULT NULL COMMENT '结算者',
  `bill_handler` varchar(255) DEFAULT NULL COMMENT '结账登记者',
  `is_delete` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('108', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-05-16 19:56:22', '0.00', '0', '2d934fdb-3859-4efa-82e5-1b82a5fec26c', '1', '0', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(255) DEFAULT NULL,
  `is_deleted` smallint(6) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `introduce` varchar(1000) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `qrcode_limit` bigint(255) DEFAULT NULL,
  `dynamic_code` varchar(255) DEFAULT NULL COMMENT '商家动态登录码',
  `is_mail_verify` smallint(6) DEFAULT '0' COMMENT '是否已经邮箱验证;0:没有验证,1:已经验证',
  `is_phone_verify` smallint(6) DEFAULT '0' COMMENT '是否已经手机验证;0:没有验证,1:已经验证',
  `password` varchar(255) DEFAULT NULL,
  `status` smallint(6) DEFAULT '0' COMMENT '0:申请中;1:审核通过',
  `date_time` datetime DEFAULT NULL,
  `audit_handler` varchar(255) DEFAULT NULL COMMENT '审核者',
  `audit_date_time` datetime DEFAULT NULL,
  `days` bigint(20) DEFAULT NULL COMMENT '使用天数',
  `login_times` bigint(20) DEFAULT NULL,
  `life_value` bigint(20) DEFAULT '0' COMMENT '生命值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES ('17', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '天下一绝', '上海 浦东新区 庭安路825号', 'xiweicheng@yeah.net', '美食天堂，欢迎光临！', '18721764335', '100', null, '1', '0', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '1', '2014-05-15 16:40:14', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-15 16:49:08', '3650', null, '6620');
INSERT INTO `business` VALUES ('18', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '0', '戴安娜美食', '上海南站', '547538651@qq.com', '美食一体店！', '18721764335', '100', null, '0', '0', null, '1', '2014-05-16 20:45:24', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:54:59', '3650', null, '1000');

-- ----------------------------
-- Table structure for business_consumer
-- ----------------------------
DROP TABLE IF EXISTS `business_consumer`;
CREATE TABLE `business_consumer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `business_id` varchar(255) DEFAULT NULL COMMENT '商家openid',
  `consumer_id` varchar(255) DEFAULT NULL COMMENT '食客openid',
  `consume_times` bigint(20) DEFAULT NULL COMMENT '食客在改商家消费次数',
  `last_consume_time` datetime DEFAULT NULL COMMENT '食客在该商家最后消费时间',
  `scene_id` bigint(20) DEFAULT NULL,
  `consume_code` varchar(500) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '消费状态->1:消费进行中;0:消费结束;2:禁止消费;3:个人结账申请中,4:集体结账申请中,5:进入中',
  `handler` varchar(255) DEFAULT NULL,
  `handle_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_consumer
-- ----------------------------
INSERT INTO `business_consumer` VALUES ('27', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1', '2014-05-16 12:02:24', '1', 'a482bc41-2850-46ce-9f22-3b865ba70344', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 12:03:00');
INSERT INTO `business_consumer` VALUES ('30', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1', '2014-05-16 20:12:00', '1', '3fc34a00-6311-45de-ab89-570baa318988', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:13:35');

-- ----------------------------
-- Table structure for business_consumer_record
-- ----------------------------
DROP TABLE IF EXISTS `business_consumer_record`;
CREATE TABLE `business_consumer_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `business_id` varchar(255) DEFAULT NULL COMMENT '商家openid',
  `consumer_id` varchar(255) DEFAULT NULL COMMENT '食客openid',
  `consume_time` datetime DEFAULT NULL COMMENT '食客在该商家最后消费时间',
  `scene_id` bigint(20) DEFAULT NULL,
  `consume_code` varchar(500) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '消费状态->1:消费进行中;0:消费结束;2:禁止消费;3:个人结账申请中,4:集体结账申请中,5:进入中',
  `is_delete` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_consumer_record
-- ----------------------------
INSERT INTO `business_consumer_record` VALUES ('42', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 12:02:24', '1', 'a482bc41-2850-46ce-9f22-3b865ba70344', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('43', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-05-16 19:52:59', '1', '2d934fdb-3859-4efa-82e5-1b82a5fec26c', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('44', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-05-16 20:00:59', '1', 'f9e5c60e-47dc-4e83-ad0a-e87a9e2fe3cf', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('45', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-05-16 20:12:00', '1', '3fc34a00-6311-45de-ab89-570baa318988', '0', '0');

-- ----------------------------
-- Table structure for business_role
-- ----------------------------
DROP TABLE IF EXISTS `business_role`;
CREATE TABLE `business_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `business_id` varchar(255) DEFAULT NULL,
  `open_id` varchar(255) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL COMMENT '0:待定,1:店主,2:后厨,3:服务员:4:前台',
  `is_delete` smallint(6) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_role
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `is_deleted` smallint(6) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '台桌', 'TZ', '0', 'qrcode');
INSERT INTO `category` VALUES ('2', '角色', 'JS', '0', 'qrcode');
INSERT INTO `category` VALUES ('3', '结账', 'JZ', '1', 'qrcode');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `openId` varchar(255) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `is_delete` smallint(6) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `p_id` bigint(20) DEFAULT NULL,
  `handler` varchar(255) DEFAULT NULL,
  `handle_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('6', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '不错啊，表示很赞！', '2014-05-15 17:13:31', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('7', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '11111111111111111111111', '2014-05-17 20:02:36', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'dfdfdfdfdf', '2014-05-17 20:22:29', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('9', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'fgsdfgsdfgereresdffasdfasdfasdfadfasdf', '2014-05-17 20:22:37', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('10', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'rrtrtretrtrt', '2014-05-17 20:37:11', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('11', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'rtreyrtyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy', '2014-05-17 20:37:24', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('12', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '', '2014-05-17 20:38:27', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('13', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1111111', '2014-05-17 22:46:38', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('14', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '55555555', '2014-05-17 22:49:53', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('15', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '66666666', '2014-05-17 22:51:40', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('16', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '66666666666666666666666666666666666', '2014-05-17 22:53:28', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('17', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '66666666666666666666', '2014-05-17 22:54:35', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('18', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '6666666666', '2014-05-17 22:55:03', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('19', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '7777777777777777777', '2014-05-17 22:55:08', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('20', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '7777777777777777777777777', '2014-05-17 22:55:12', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '444444444444444444444', '2014-05-17 22:55:16', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('22', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '55555555555555', '2014-05-17 22:57:07', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('23', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '77777777777777777', '2014-05-17 22:57:10', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('24', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'dddd', '2014-05-17 23:05:41', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('25', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '333333333333333333', '2014-05-17 23:20:20', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('26', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '44444444444444444444444', '2014-05-17 23:21:22', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('27', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyy', '2014-05-17 23:26:31', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('28', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'yyyyyyyyyyyyyyyy', '2014-05-17 23:26:52', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('29', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '55555tttttttttttttt', '2014-05-17 23:29:24', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('30', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '444444444444444444', '2014-05-17 23:30:16', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('31', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'ttttttttttt', '2014-05-17 23:30:45', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('32', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '5555555', '2014-05-17 23:31:15', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('33', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '555555555', '2014-05-17 23:31:49', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('34', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '55555555555', '2014-05-17 23:31:59', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('35', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '4444444444444', '2014-05-17 23:33:37', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('36', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'tyyyyyyyyyyyyyyy', '2014-05-17 23:33:55', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('37', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'rrrrrrrrrrrrrrrrrrr', '2014-05-17 23:37:43', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('38', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'hhhhhhhhhhhhhhhhhhhhh', '2014-05-17 23:39:57', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('39', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '萝莉控', '2014-05-18 00:30:25', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('40', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '111223', '2014-05-18 00:31:00', '0', '0', '0', null, null, null);
INSERT INTO `comment` VALUES ('41', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '赶紧看看', '2014-05-18 11:41:15', '0', '0', '0', null, null, null);

-- ----------------------------
-- Table structure for czs_user
-- ----------------------------
DROP TABLE IF EXISTS `czs_user`;
CREATE TABLE `czs_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `dynamic_code` varchar(255) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `is_delete` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of czs_user
-- ----------------------------
INSERT INTO `czs_user` VALUES ('2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'xiweicheng', 'xiweicheng@yeah.net', '18721764335', '上海 浦东新区', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', null, '0', '0', '0');

-- ----------------------------
-- Table structure for favorites
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(255) DEFAULT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL COMMENT '收藏类型;0:商家收藏,1:菜单收藏',
  `date_time` datetime DEFAULT NULL,
  `is_delete` smallint(6) DEFAULT NULL,
  `limit_code` varchar(255) DEFAULT NULL COMMENT '限制码,一天只能赞一次. 20140409',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favorites
-- ----------------------------
INSERT INTO `favorites` VALUES ('63', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '33', '1', '2014-05-16 13:28:26', '0', null);
INSERT INTO `favorites` VALUES ('64', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '20', '1', '2014-05-16 15:50:30', '0', null);
INSERT INTO `favorites` VALUES ('65', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '21', '1', '2014-05-16 15:50:32', '0', null);
INSERT INTO `favorites` VALUES ('66', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '28', '1', '2014-05-16 15:50:34', '0', null);
INSERT INTO `favorites` VALUES ('67', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '29', '1', '2014-05-16 15:50:35', '0', null);
INSERT INTO `favorites` VALUES ('68', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '30', '1', '2014-05-16 15:50:37', '0', null);
INSERT INTO `favorites` VALUES ('69', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '21', '1', '2014-05-16 20:18:05', '0', null);
INSERT INTO `favorites` VALUES ('70', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '29', '1', '2014-05-16 23:08:51', '0', null);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `is_delete` smallint(6) DEFAULT NULL,
  `object_id` varchar(255) DEFAULT NULL,
  `detail` varchar(2000) DEFAULT NULL,
  `handler` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('10', '2014-05-15 17:16:39', '0', '1', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '[商家充值]-类型:[0]-oldValue:[0]-newValue:[10000]', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `log` VALUES ('11', '2014-05-16 20:55:35', '0', '1', '0', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '[商家充值]-类型:[0]-oldValue:[0]-newValue:[1000]', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `privilege` decimal(10,2) DEFAULT '0.00',
  `taste_id` bigint(20) DEFAULT NULL,
  `introduce` varchar(2000) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `is_delete` smallint(6) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `order_times` bigint(20) DEFAULT '0',
  `tags` varchar(255) DEFAULT NULL COMMENT '菜单标签说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('20', '蓝莓山药', '36', '12.00', '0.00', '24', '', '71', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:37:06', '17', null);
INSERT INTO `menu` VALUES ('21', '长寿菜', '36', '9.00', '0.00', '30', '长寿菜，又名叶用甘薯，俗称白薯叶、番薯叶、地瓜叶，是甘薯的叶、叶柄和芽梢部，学名Ipomoea atatas (L. ) Lam. ，为旋花科(Convolvulaceae)牵牛花属草本匍匐性蔓生植物。在热带为多年生。原产于热带美洲。现广泛栽培于全世界热带和亚热带地区。我国南北各地都有栽培，以收获地下块根为主，叶蔓作饲料，民间也有采食叶作为粗菜。近年发现，薯叶中含丰富的营养物质，是维生素历、矿物质钾、钙之来源，而且其病虫害甚少，很少使用农药，比其他叶菜类较抗暴风雨，生长迅速，为良好的夏季叶菜。它在人们追求享受自然的风味中获得重视，在台湾省它作为一种优良的深绿色蔬菜发展很快。', '85', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:42:09', '13', null);
INSERT INTO `menu` VALUES ('22', '外婆烤肉', '38', '29.00', '0.00', '31', '能说的只能是赞了……', '86', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:45:07', '1', null);
INSERT INTO `menu` VALUES ('23', '大烤茄子', '38', '10.00', '0.00', '30', '', '75', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:47:21', '2', null);
INSERT INTO `menu` VALUES ('24', '外婆黑米糕', '40', '15.00', '0.00', '24', '', '79', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:48:02', '2', null);
INSERT INTO `menu` VALUES ('25', '绿茶饼', '40', '12.00', '0.00', '24', '', '76', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:48:51', '3', null);
INSERT INTO `menu` VALUES ('26', '双皮奶', '45', '10.00', '0.00', '24', '', '74', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:50:14', '5', null);
INSERT INTO `menu` VALUES ('27', '花生绵绵冰', '45', '18.00', '0.00', '24', '', '72', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:51:24', '8', null);
INSERT INTO `menu` VALUES ('28', '想吃土豆', '37', '10.00', '0.00', '29', '', '82', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:52:24', '6', null);
INSERT INTO `menu` VALUES ('29', '石锅牛蛙', '37', '42.00', '0.00', '26', '', '73', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:53:20', '5', null);
INSERT INTO `menu` VALUES ('30', '糖醋里脊', '37', '18.00', '0.00', '30', '', '77', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:54:06', '11', null);
INSERT INTO `menu` VALUES ('31', '茶树菇爆鲜鱿', '37', '25.00', '0.00', '30', '', '83', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:54:55', '5', null);
INSERT INTO `menu` VALUES ('32', '蒜蓉粉丝虾', '37', '35.00', '0.00', '30', '', '80', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:55:37', '10', null);
INSERT INTO `menu` VALUES ('33', '有机花菜', '41', '16.00', '0.00', '30', '', '87', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:56:23', '5', null);
INSERT INTO `menu` VALUES ('34', '鸡毛菜烩蘑菇', '41', '12.00', '0.00', '30', '', '78', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:57:33', '3', null);
INSERT INTO `menu` VALUES ('35', '冰桔茶', '44', '8.00', '0.00', '23', '', '84', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:58:20', '6', null);
INSERT INTO `menu` VALUES ('36', '玉米汁', '44', '15.00', '0.00', '24', '', '81', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:59:05', '5', null);
INSERT INTO `menu` VALUES ('37', '妈咪宝贝', '46', '99.00', '0.00', '32', '美味可口！', '89', '0', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 22:03:49', '0', null);
INSERT INTO `menu` VALUES ('38', '妈妈咪呀', '47', '998.00', '0.00', '33', '无言以表！', '88', '0', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 22:06:28', '0', null);

-- ----------------------------
-- Table structure for menu_bill
-- ----------------------------
DROP TABLE IF EXISTS `menu_bill`;
CREATE TABLE `menu_bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) DEFAULT NULL,
  `consumer_id` varchar(255) DEFAULT NULL COMMENT '顾客openid',
  `consume_code` varchar(500) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '0:待定;1:确定;2:退订;3:已处理',
  `scene_id` bigint(20) DEFAULT NULL COMMENT '区分是哪桌',
  `copies` bigint(20) DEFAULT NULL COMMENT '份数',
  `accepter_id` varchar(255) DEFAULT NULL COMMENT '订单接受者',
  `memo` varchar(500) DEFAULT NULL COMMENT '点餐备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_bill
-- ----------------------------
INSERT INTO `menu_bill` VALUES ('344', '26', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '2014-05-16 13:28:05', '3', '1', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('345', '35', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '2014-05-16 13:28:20', '3', '1', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '大杯');
INSERT INTO `menu_bill` VALUES ('346', '24', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '2014-05-16 13:28:38', '3', '1', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('347', '20', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '2014-05-16 13:32:51', '3', '1', '3', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('348', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '2014-05-16 13:32:59', '3', '1', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('349', '31', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '2014-05-16 13:42:48', '3', '1', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('350', '32', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '2014-05-16 13:42:59', '3', '1', '3', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('351', '29', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '2014-05-18 11:30:49', '1', '1', '2', null, '戴红梅');
INSERT INTO `menu_bill` VALUES ('352', '20', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '3fc34a00-6311-45de-ab89-570baa318988', '2014-05-18 11:41:57', '1', '1', '2', null, '赶快看看');
INSERT INTO `menu_bill` VALUES ('353', '32', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '3fc34a00-6311-45de-ab89-570baa318988', '2014-05-18 11:42:17', '1', '1', '3', null, '很快乐');

-- ----------------------------
-- Table structure for menu_category
-- ----------------------------
DROP TABLE IF EXISTS `menu_category`;
CREATE TABLE `menu_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `is_delete` smallint(6) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_category
-- ----------------------------
INSERT INTO `menu_category` VALUES ('36', '冷菜', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 18:49:44');
INSERT INTO `menu_category` VALUES ('37', '热菜', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 18:49:50');
INSERT INTO `menu_category` VALUES ('38', '烧烤', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 18:49:59');
INSERT INTO `menu_category` VALUES ('39', '汤羹', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 18:50:06');
INSERT INTO `menu_category` VALUES ('40', '点心', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 18:50:15');
INSERT INTO `menu_category` VALUES ('41', '蔬菜', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 18:50:21');
INSERT INTO `menu_category` VALUES ('42', '酒水', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 18:50:26');
INSERT INTO `menu_category` VALUES ('43', '果汁', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 18:50:32');
INSERT INTO `menu_category` VALUES ('44', '饮料', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 18:50:43');
INSERT INTO `menu_category` VALUES ('45', '甜品', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 23:50:05');
INSERT INTO `menu_category` VALUES ('46', '特色', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '0', '2014-04-23 22:02:54');
INSERT INTO `menu_category` VALUES ('47', '招牌', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '0', '2014-04-23 22:06:22');

-- ----------------------------
-- Table structure for menu_taste
-- ----------------------------
DROP TABLE IF EXISTS `menu_taste`;
CREATE TABLE `menu_taste` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `is_delete` smallint(6) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_taste
-- ----------------------------
INSERT INTO `menu_taste` VALUES ('23', '酸', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 23:33:50');
INSERT INTO `menu_taste` VALUES ('24', '甜', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 23:33:58');
INSERT INTO `menu_taste` VALUES ('25', '苦', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 23:34:04');
INSERT INTO `menu_taste` VALUES ('26', '辣', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 23:34:09');
INSERT INTO `menu_taste` VALUES ('27', '涩', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 23:34:14');
INSERT INTO `menu_taste` VALUES ('28', '麻', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 23:34:23');
INSERT INTO `menu_taste` VALUES ('29', '腻', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 23:34:28');
INSERT INTO `menu_taste` VALUES ('30', '鲜', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 23:41:32');
INSERT INTO `menu_taste` VALUES ('31', '爽', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-19 23:44:47');
INSERT INTO `menu_taste` VALUES ('32', '鲜嫩', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '0', '2014-04-23 22:03:22');
INSERT INTO `menu_taste` VALUES ('33', '可口', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '0', '2014-04-23 22:06:26');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user_name` varchar(255) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `msg_type` varchar(255) DEFAULT NULL,
  `content` longtext,
  `msg_id` bigint(20) DEFAULT NULL,
  `pic_url` varchar(500) DEFAULT NULL,
  `media_id` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `thumb_media_id` varchar(255) DEFAULT NULL,
  `location_x` decimal(10,6) DEFAULT NULL,
  `location_y` decimal(10,6) DEFAULT NULL,
  `scale` decimal(10,6) DEFAULT NULL,
  `label` varchar(1000) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `event_key` varchar(500) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `precision_` decimal(10,6) DEFAULT NULL,
  `ticket` varchar(500) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `to_open_id` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT '0',
  `is_delete` smallint(6) DEFAULT '0',
  `scene_id` bigint(20) DEFAULT NULL,
  `recognition` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1600 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1516', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400143275', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-05-15 16:40:14', '0', null, null, null);
INSERT INTO `message` VALUES ('1517', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400143298', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-05-15 16:40:15', '0', null, null, null);
INSERT INTO `message` VALUES ('1518', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400143439', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'http://www.canzs.cn/czs/login.do', '0.000000', '0.000000', '0.000000', null, 'VIEW', null, '2014-05-15 16:42:38', '0', null, null, null);
INSERT INTO `message` VALUES ('1519', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400143509', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'unsubscribe', null, '2014-05-15 16:43:47', '0', null, null, null);
INSERT INTO `message` VALUES ('1520', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400143518', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'subscribe', null, '2014-05-15 16:43:54', '0', null, null, null);
INSERT INTO `message` VALUES ('1521', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400143800', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'http://www.canzs.cn/czs/login.do', '0.000000', '0.000000', '0.000000', null, 'VIEW', null, '2014-05-15 16:48:41', '0', null, null, null);
INSERT INTO `message` VALUES ('1522', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400144634', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-05-15 17:02:30', '0', null, null, null);
INSERT INTO `message` VALUES ('1523', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400144753', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-05-15 17:04:29', '0', null, null, null);
INSERT INTO `message` VALUES ('1524', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400145263', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-05-15 17:13:04', '0', null, null, null);
INSERT INTO `message` VALUES ('1525', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400145351', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-05-15 17:14:32', '0', null, null, null);
INSERT INTO `message` VALUES ('1526', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400145379', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-05-15 17:14:54', '0', null, null, null);
INSERT INTO `message` VALUES ('1527', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400213025', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '1', '0.000000', '0.000000', '0.000000', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'SCAN', null, '2014-05-16 12:02:23', '0', null, null, null);
INSERT INTO `message` VALUES ('1528', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400219199', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 13:45:14', '0', null, '1', null);
INSERT INTO `message` VALUES ('1529', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400219223', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 13:45:38', '0', null, '1', null);
INSERT INTO `message` VALUES ('1530', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400219253', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 13:46:09', '0', null, '1', null);
INSERT INTO `message` VALUES ('1531', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400219437', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 13:49:15', '0', null, '1', null);
INSERT INTO `message` VALUES ('1532', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400219608', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 13:52:04', '0', null, '1', null);
INSERT INTO `message` VALUES ('1533', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400219672', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 13:53:07', '0', null, '1', null);
INSERT INTO `message` VALUES ('1534', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400219976', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 13:58:12', '0', null, '1', null);
INSERT INTO `message` VALUES ('1535', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400220272', 'text', '好弄', '6013900275636474935', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:03:10', '1', null, '1', null);
INSERT INTO `message` VALUES ('1536', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400220284', 'text', '好咯哦哦OK了', '6013900327176082489', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:03:19', '1', null, '1', null);
INSERT INTO `message` VALUES ('1537', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400220289', 'text', '阿芬监控', '6013900348650918971', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:03:27', '1', null, '1', null);
INSERT INTO `message` VALUES ('1538', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400220297', 'text', '咯摸摸哦墨迹', '6013900383010657341', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:03:32', '1', null, '1', null);
INSERT INTO `message` VALUES ('1539', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400220304', 'text', '测魔术师', '6013900413075428415', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:03:43', '1', null, '1', null);
INSERT INTO `message` VALUES ('1540', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400220312', 'text', 'hi咯啊lz', '6013900447435166785', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:03:47', '1', null, '1', null);
INSERT INTO `message` VALUES ('1541', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400220321', 'text', '期末摸哪', '6013900486089872451', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:03:55', '2', null, '1', null);
INSERT INTO `message` VALUES ('1542', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400220365', 'image', null, '6013900675068433481', 'http://mmbiz.qpic.cn/mmbiz/66aY7oYxBv8D3DsaLreJs3HBwkW79QfbQa6K0Mj7StAbNvFib9PiajDEF1SsGxNHhmgjRR5Kp5LwPMmnDy6GOK1A/0', '2c6_IF7JIRwhKLwmQsRcyiN71AZ_m25RZ9xTr7eBAbY', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:04:41', '2', null, '1', null);
INSERT INTO `message` VALUES ('1543', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400220413', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:05:28', '0', null, '1', null);
INSERT INTO `message` VALUES ('1544', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400220437', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:05:52', '0', null, '1', null);
INSERT INTO `message` VALUES ('1545', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400220936', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:14:11', '0', null, '1', null);
INSERT INTO `message` VALUES ('1546', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400223337', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:54:12', '0', null, '1', null);
INSERT INTO `message` VALUES ('1547', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400223338', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:54:13', '0', null, '1', null);
INSERT INTO `message` VALUES ('1548', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400223356', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:54:31', '0', null, '1', null);
INSERT INTO `message` VALUES ('1549', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400228317', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 16:17:13', '0', null, '1', null);
INSERT INTO `message` VALUES ('1550', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400241261', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '1', '0.000000', '0.000000', '0.000000', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'SCAN', null, '2014-05-16 19:52:56', '0', null, null, null);
INSERT INTO `message` VALUES ('1551', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400241279', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'unsubscribe', null, '2014-05-16 19:53:14', '0', null, null, null);
INSERT INTO `message` VALUES ('1552', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400241290', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'qrscene_1', '0.000000', '0.000000', '0.000000', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'subscribe', null, '2014-05-16 19:53:24', '0', null, null, null);
INSERT INTO `message` VALUES ('1553', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400241288', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '1', '0.000000', '0.000000', '0.000000', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'SCAN', null, '2014-05-16 19:53:26', '0', null, null, null);
INSERT INTO `message` VALUES ('1554', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400241413', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-05-16 19:55:28', '0', null, null, null);
INSERT INTO `message` VALUES ('1555', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400241437', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-05-16 19:55:54', '0', null, null, null);
INSERT INTO `message` VALUES ('1556', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400241444', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-05-16 19:55:58', '0', null, null, null);
INSERT INTO `message` VALUES ('1557', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400241744', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '1', '0.000000', '0.000000', '0.000000', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'SCAN', null, '2014-05-16 20:00:58', '0', null, null, null);
INSERT INTO `message` VALUES ('1558', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400241822', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '1', '0.000000', '0.000000', '0.000000', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'SCAN', null, '2014-05-16 20:02:16', '0', null, null, null);
INSERT INTO `message` VALUES ('1559', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400242382', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '1', '0.000000', '0.000000', '0.000000', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'SCAN', null, '2014-05-16 20:11:40', '0', null, null, null);
INSERT INTO `message` VALUES ('1560', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400242397', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'unsubscribe', null, '2014-05-16 20:11:53', '0', null, null, null);
INSERT INTO `message` VALUES ('1561', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400242403', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'qrscene_1', '0.000000', '0.000000', '0.000000', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'subscribe', null, '2014-05-16 20:11:58', '0', null, null, null);
INSERT INTO `message` VALUES ('1562', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400242447', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:12:41', '0', null, '1', null);
INSERT INTO `message` VALUES ('1563', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400242449', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:12:44', '0', null, '1', null);
INSERT INTO `message` VALUES ('1564', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400242452', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:12:47', '0', null, '1', null);
INSERT INTO `message` VALUES ('1565', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400242507', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:13:50', '0', null, '1', null);
INSERT INTO `message` VALUES ('1566', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400242522', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:13:57', '0', null, '1', null);
INSERT INTO `message` VALUES ('1567', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400242528', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_5', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:14:04', '0', null, '1', null);
INSERT INTO `message` VALUES ('1568', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400243758', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:34:33', '0', null, '1', null);
INSERT INTO `message` VALUES ('1569', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400243801', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:35:16', '0', null, '1', null);
INSERT INTO `message` VALUES ('1570', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400243825', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'http://www.canzs.cn/czs/login.do', '0.000000', '0.000000', '0.000000', null, 'VIEW', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:35:40', '0', null, '1', null);
INSERT INTO `message` VALUES ('1571', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400244387', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:45:01', '0', null, '1', null);
INSERT INTO `message` VALUES ('1572', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400244392', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:45:06', '0', null, '1', null);
INSERT INTO `message` VALUES ('1573', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400244398', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:45:13', '0', null, '1', null);
INSERT INTO `message` VALUES ('1574', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400244406', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:45:20', '0', null, '1', null);
INSERT INTO `message` VALUES ('1575', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400244410', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:45:24', '0', null, '1', null);
INSERT INTO `message` VALUES ('1576', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400244623', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'http://www.canzs.cn/czs/login.do', '0.000000', '0.000000', '0.000000', null, 'VIEW', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:48:58', '0', null, '1', null);
INSERT INTO `message` VALUES ('1577', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400244666', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'http://www.canzs.cn/czs/login.do', '0.000000', '0.000000', '0.000000', null, 'VIEW', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:49:41', '0', null, '1', null);
INSERT INTO `message` VALUES ('1578', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400244681', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'http://www.canzs.cn/czs/login.do', '0.000000', '0.000000', '0.000000', null, 'VIEW', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:49:58', '0', null, '1', null);
INSERT INTO `message` VALUES ('1579', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400244949', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'http://www.canzs.cn/czs/login.do', '0.000000', '0.000000', '0.000000', null, 'VIEW', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:54:27', '0', null, '1', null);
INSERT INTO `message` VALUES ('1580', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400252726', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 23:04:02', '0', null, '1', null);
INSERT INTO `message` VALUES ('1581', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400252780', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 23:04:55', '0', null, '1', null);
INSERT INTO `message` VALUES ('1582', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400252990', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 23:08:25', '0', null, '1', null);
INSERT INTO `message` VALUES ('1583', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400308917', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-17 14:40:32', '0', null, '1', null);
INSERT INTO `message` VALUES ('1584', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400309031', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-17 14:42:26', '0', null, '1', null);
INSERT INTO `message` VALUES ('1585', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400322785', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-17 18:31:40', '0', null, '1', null);
INSERT INTO `message` VALUES ('1586', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400322835', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-17 18:32:30', '0', null, '1', null);
INSERT INTO `message` VALUES ('1587', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400344288', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-18 00:30:03', '0', null, '1', null);
INSERT INTO `message` VALUES ('1588', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400344431', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-18 00:32:26', '0', null, '1', null);
INSERT INTO `message` VALUES ('1589', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400344435', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-18 00:32:31', '0', null, '1', null);
INSERT INTO `message` VALUES ('1590', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400344446', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-18 00:32:40', '0', null, '1', null);
INSERT INTO `message` VALUES ('1591', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400344978', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-18 00:41:33', '0', null, '1', null);
INSERT INTO `message` VALUES ('1592', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400344990', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-18 00:41:44', '0', null, '1', null);
INSERT INTO `message` VALUES ('1593', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400383991', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-18 11:31:44', '0', null, '1', null);
INSERT INTO `message` VALUES ('1594', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400384222', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-18 11:35:35', '0', null, '1', null);
INSERT INTO `message` VALUES ('1595', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400384302', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-18 11:36:55', '0', null, '1', null);
INSERT INTO `message` VALUES ('1596', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400384341', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-18 11:37:36', '0', null, '1', null);
INSERT INTO `message` VALUES ('1597', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400384348', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-18 11:37:41', '0', null, '1', null);
INSERT INTO `message` VALUES ('1598', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400384427', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-18 11:39:00', '0', null, '1', null);
INSERT INTO `message` VALUES ('1599', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400384469', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-18 11:39:43', '0', null, '1', null);

-- ----------------------------
-- Table structure for qrcode
-- ----------------------------
DROP TABLE IF EXISTS `qrcode`;
CREATE TABLE `qrcode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(255) DEFAULT NULL,
  `scene_id` bigint(20) DEFAULT NULL,
  `use_limit` bigint(20) DEFAULT NULL,
  `use_times` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `ticket` varchar(1000) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL COMMENT '二维码在微信服务器的url.',
  `file_path` varchar(1000) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL COMMENT 'QR_LIMIT_SCENE(永久) 或者 QR_SCENE(临时)',
  `my_url` varchar(1000) DEFAULT NULL COMMENT '二维码在自己服务器的url.',
  `description` varchar(1000) DEFAULT NULL COMMENT '二维码描述',
  `date_time` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `is_delete` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrcode
-- ----------------------------
INSERT INTO `qrcode` VALUES ('110', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1', '200', '3', '1', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA%3D%3D', 'resources/images/qrcode/5db35a73-5ac8-463a-bea2-20c0908a9bfe_1.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/5db35a73-5ac8-463a-bea2-20c0908a9bfe_1.jpg', '二楼一号雅间', '2014-05-15 17:17:19', '0', '0');
INSERT INTO `qrcode` VALUES ('111', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2', '1', '0', '1', 'gQHG7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3pFeG9rM2ZseTRTeVZHalB0bUJVAAIEUpMxUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQHG7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3pFeG9rM2ZseTRTeVZHalB0bUJVAAIEUpMxUwMEAAAAAA%3D%3D', 'resources/images/qrcode/b64a67c8-eb70-440b-ad12-ed777aed3b69_2.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/b64a67c8-eb70-440b-ad12-ed777aed3b69_2.jpg', 'test', '2014-05-15 17:54:48', '0', '0');
INSERT INTO `qrcode` VALUES ('112', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3', '1', '0', '1', 'gQGf8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2cweHpSampsMllTZ2dTY1RyV0JVAAIEpJUxUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQGf8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2cweHpSampsMllTZ2dTY1RyV0JVAAIEpJUxUwMEAAAAAA%3D%3D', 'resources/images/qrcode/45b109ee-60f5-4ba4-838b-36c0e6051d6e_3.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/45b109ee-60f5-4ba4-838b-36c0e6051d6e_3.jpg', 'test', '2014-05-15 17:55:15', '0', '0');
INSERT INTO `qrcode` VALUES ('113', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '4', '1', '0', '1', 'gQEd8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0lVd0Jtd3pscG9UZnlvWEQzMkJVAAIE094yUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQEd8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0lVd0Jtd3pscG9UZnlvWEQzMkJVAAIE094yUwMEAAAAAA%3D%3D', 'resources/images/qrcode/3dd8bb5a-83ad-4e4f-9e4a-c568fc4dc460_4.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/3dd8bb5a-83ad-4e4f-9e4a-c568fc4dc460_4.jpg', 'e', '2014-05-15 19:26:24', '0', '0');
INSERT INTO `qrcode` VALUES ('114', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '5', '1', '0', '1', 'gQEN8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0FFd3Q3cmpsdElUTktxU0k4MkJVAAIEcOMyUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQEN8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0FFd3Q3cmpsdElUTktxU0k4MkJVAAIEcOMyUwMEAAAAAA%3D%3D', 'resources/images/qrcode/ba531031-4b9c-4d72-b744-d113ce9baab3_5.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/ba531031-4b9c-4d72-b744-d113ce9baab3_5.jpg', 'e', '2014-05-15 19:36:15', '0', '0');
INSERT INTO `qrcode` VALUES ('115', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '6', '1', '0', '1', 'gQFd7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL1lrd0FsQXZscG9UZmdjYk4zbUJVAAIEc+MyUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQFd7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL1lrd0FsQXZscG9UZmdjYk4zbUJVAAIEc%2BMyUwMEAAAAAA%3D%3D', 'resources/images/qrcode/85c318f7-922b-4054-83c6-f38e8f760124_6.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/85c318f7-922b-4054-83c6-f38e8f760124_6.jpg', 'e', '2014-05-15 19:36:17', '0', '0');
INSERT INTO `qrcode` VALUES ('116', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '7', '1', '0', '1', 'gQHE7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xLzJFdzJzbi1sbm9UbmFYemw2R0JVAAIESA40UwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQHE7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xLzJFdzJzbi1sbm9UbmFYemw2R0JVAAIESA40UwMEAAAAAA%3D%3D', 'resources/images/qrcode/2b14aa2a-4a90-48cc-bb55-91c3c7c53cc5_7.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/2b14aa2a-4a90-48cc-bb55-91c3c7c53cc5_7.jpg', 'e', '2014-05-15 19:36:18', '0', '0');
INSERT INTO `qrcode` VALUES ('117', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '8', '1', '0', '1', 'gQGH7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL1dFd0o3bHZscW9UVGtmeXkxMkJVAAIESg40UwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQGH7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL1dFd0o3bHZscW9UVGtmeXkxMkJVAAIESg40UwMEAAAAAA%3D%3D', 'resources/images/qrcode/a52d458c-007d-4df3-bb57-173b62a3e070_8.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/a52d458c-007d-4df3-bb57-173b62a3e070_8.jpg', 'e', '2014-05-15 19:36:18', '0', '0');
INSERT INTO `qrcode` VALUES ('118', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '9', '1', '0', '1', 'gQFK8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3Jrd2hROVRsaDRUX1JRb2EtMkJVAAIE7hA0UwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQFK8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3Jrd2hROVRsaDRUX1JRb2EtMkJVAAIE7hA0UwMEAAAAAA%3D%3D', 'resources/images/qrcode/a25b3424-239a-4d7e-8415-73f036ca4a88_9.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/a25b3424-239a-4d7e-8415-73f036ca4a88_9.jpg', 'e', '2014-05-15 19:36:18', '0', '0');
INSERT INTO `qrcode` VALUES ('119', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '10', '1', '0', '1', 'gQGg8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL1NVd0hNLUxsdG9UUDlPMTkyV0JVAAIEIxE0UwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQGg8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL1NVd0hNLUxsdG9UUDlPMTkyV0JVAAIEIxE0UwMEAAAAAA%3D%3D', 'resources/images/qrcode/4a59beab-a3cc-4dc7-afae-dc85c08a20e1_10.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/4a59beab-a3cc-4dc7-afae-dc85c08a20e1_10.jpg', 'e', '2014-05-15 19:36:19', '0', '0');
INSERT INTO `qrcode` VALUES ('120', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '11', '1', '0', '1', 'gQHo7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0dFeHBQZVBseTRTeXVyeGd0MkJVAAIEhjc0UwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQHo7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0dFeHBQZVBseTRTeXVyeGd0MkJVAAIEhjc0UwMEAAAAAA%3D%3D', 'resources/images/qrcode/77260905-fd50-4e53-978b-a68d7c872f69_11.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/77260905-fd50-4e53-978b-a68d7c872f69_11.jpg', 'e', '2014-05-15 19:36:21', '0', '0');
INSERT INTO `qrcode` VALUES ('121', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '12', '1', '0', '1', 'gQHQ7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0dFd19HaTNsbG9UdlU3eE40R0JVAAIEPj40UwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQHQ7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0dFd19HaTNsbG9UdlU3eE40R0JVAAIEPj40UwMEAAAAAA%3D%3D', 'resources/images/qrcode/21f3f0e8-58e1-4b6e-bc32-412ced139a34_12.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/21f3f0e8-58e1-4b6e-bc32-412ced139a34_12.jpg', 'rr', '2014-05-15 20:21:49', '0', '0');
INSERT INTO `qrcode` VALUES ('122', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '13', '1', '0', '1', 'gQEc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0FreElWMHZsMVlTc1lxWTFsbUJVAAIEt0o0UwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQEc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0FreElWMHZsMVlTc1lxWTFsbUJVAAIEt0o0UwMEAAAAAA%3D%3D', 'resources/images/qrcode/0ad7ced8-4f25-4f10-aa55-27303bed6082_13.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/0ad7ced8-4f25-4f10-aa55-27303bed6082_13.jpg', 'rr', '2014-05-15 20:25:22', '0', '0');
INSERT INTO `qrcode` VALUES ('123', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '14', '1', '0', '1', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA%3D%3D', 'resources/images/qrcode/05353364-4a4d-4521-8215-bf4e524c15b8_14.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/05353364-4a4d-4521-8215-bf4e524c15b8_14.jpg', 'rr', '2014-05-15 20:25:33', '0', '0');
INSERT INTO `qrcode` VALUES ('124', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '15', '1', '0', '1', 'gQEq8ToAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xLzUwd1ZaNHpsc0lUSmNFTTl5MkJVAAIEx5NGUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQEq8ToAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xLzUwd1ZaNHpsc0lUSmNFTTl5MkJVAAIEx5NGUwMEAAAAAA%3D%3D', 'resources/images/qrcode/93148d51-368d-4851-b510-c9c23fabab0e_15.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/93148d51-368d-4851-b510-c9c23fabab0e_15.jpg', 'rr', '2014-05-15 20:25:48', '0', '0');
INSERT INTO `qrcode` VALUES ('125', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '16', '1', '0', '1', 'gQHr8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xLzdrdzF0NC1scTRUU3Frclc2MkJVAAIEs9pHUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQHr8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xLzdrdzF0NC1scTRUU3Frclc2MkJVAAIEs9pHUwMEAAAAAA%3D%3D', 'resources/images/qrcode/a65c13cf-a00d-4589-8e35-759274455387_16.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/a65c13cf-a00d-4589-8e35-759274455387_16.jpg', '1', '2014-05-15 21:18:25', '0', '0');
INSERT INTO `qrcode` VALUES ('126', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '17', '12', '0', '1', 'gQE08DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2NVeElVMVBseG9TLURkVWlsbUJVAAIE7dpHUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQE08DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2NVeElVMVBseG9TLURkVWlsbUJVAAIE7dpHUwMEAAAAAA%3D%3D', 'resources/images/qrcode/41198905-14ab-4bec-8d9c-fa27ab725d19_17.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/41198905-14ab-4bec-8d9c-fa27ab725d19_17.jpg', '一楼一号桌', '2014-05-15 21:19:27', '0', '0');
INSERT INTO `qrcode` VALUES ('127', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '18', '111', '0', '2', 'gQHc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL29FeDZwOXZsMjRTaW9BVDVwR0JVAAIEpttHUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQHc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL29FeDZwOXZsMjRTaW9BVDVwR0JVAAIEpttHUwMEAAAAAA%3D%3D', 'resources/images/qrcode/87dd9b16-ea87-463e-8e11-1aaf068cddd2_18.jpg', 'QR_LIMIT_SCENE', 'http://www.canzs.cn:80/resources/images/qrcode/87dd9b16-ea87-463e-8e11-1aaf068cddd2_18.jpg', '角色分配', '2014-05-16 16:22:14', '0', '0');

-- ----------------------------
-- Table structure for request
-- ----------------------------
DROP TABLE IF EXISTS `request`;
CREATE TABLE `request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `consumer_id` varchar(255) DEFAULT NULL,
  `business_id` varchar(255) DEFAULT NULL,
  `consume_code` varchar(500) DEFAULT NULL,
  `scene_id` bigint(20) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `is_delete` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of request
-- ----------------------------
INSERT INTO `request` VALUES ('301', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '1', '0', '1', '2014-05-16 12:02:25', '0');
INSERT INTO `request` VALUES ('302', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '1', '4', '1', '2014-05-16 13:45:14', '0');
INSERT INTO `request` VALUES ('303', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '1', '4', '1', '2014-05-16 13:45:38', '0');
INSERT INTO `request` VALUES ('304', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '1', '4', '1', '2014-05-16 13:46:09', '0');
INSERT INTO `request` VALUES ('305', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '1', '4', '1', '2014-05-16 13:49:15', '0');
INSERT INTO `request` VALUES ('306', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '1', '4', '1', '2014-05-16 13:52:04', '0');
INSERT INTO `request` VALUES ('307', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '1', '4', '1', '2014-05-16 13:53:07', '0');
INSERT INTO `request` VALUES ('308', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '1', '4', '1', '2014-05-16 13:58:12', '0');
INSERT INTO `request` VALUES ('309', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '1', '4', '1', '2014-05-16 14:05:28', '0');
INSERT INTO `request` VALUES ('310', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '1', '4', '1', '2014-05-16 14:05:52', '0');
INSERT INTO `request` VALUES ('311', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'a482bc41-2850-46ce-9f22-3b865ba70344', '1', '4', '1', '2014-05-16 14:14:11', '0');
INSERT INTO `request` VALUES ('312', '进入请求中', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f9e5c60e-47dc-4e83-ad0a-e87a9e2fe3cf', '1', '0', '1', '2014-05-16 20:00:59', '0');
INSERT INTO `request` VALUES ('313', '进入请求中', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3fc34a00-6311-45de-ab89-570baa318988', '1', '0', '1', '2014-05-16 20:12:00', '0');
INSERT INTO `request` VALUES ('314', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3fc34a00-6311-45de-ab89-570baa318988', '1', '4', '1', '2014-05-16 20:12:44', '0');
INSERT INTO `request` VALUES ('315', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3fc34a00-6311-45de-ab89-570baa318988', '1', '4', '1', '2014-05-16 20:13:51', '0');
INSERT INTO `request` VALUES ('316', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3fc34a00-6311-45de-ab89-570baa318988', '1', '4', '1', '2014-05-16 20:13:57', '0');
INSERT INTO `request` VALUES ('317', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3fc34a00-6311-45de-ab89-570baa318988', '1', '4', '1', '2014-05-16 20:34:33', '0');

-- ----------------------------
-- Table structure for resources
-- ----------------------------
DROP TABLE IF EXISTS `resources`;
CREATE TABLE `resources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `path` varchar(1000) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL COMMENT '资源的类型 图片 音乐...',
  `owner` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `is_delete` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resources
-- ----------------------------
INSERT INTO `resources` VALUES ('71', '蓝莓山药', 'resources/images/menu/', '3b3adf23-9361-4dfc-a540-61b789d3fcf7.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:42', '0');
INSERT INTO `resources` VALUES ('72', '花生绵绵冰', 'resources/images/menu/', '09046712-47c7-46d7-862a-fb3cddba3ffc.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:42', '0');
INSERT INTO `resources` VALUES ('73', '石锅牛蛙', 'resources/images/menu/', 'd1c59445-4db2-468a-aaf0-1fc7fbf5267c.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:42', '0');
INSERT INTO `resources` VALUES ('74', '双皮奶.jpg', 'resources/images/menu/', '2f82ccf1-e886-4600-a116-589ff02af5e4.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:42', '0');
INSERT INTO `resources` VALUES ('75', '烤茄子.jpg', 'resources/images/menu/', 'c1b17b42-c205-496b-a1c7-4e68b920a579.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:42', '0');
INSERT INTO `resources` VALUES ('76', '绿茶饼', 'resources/images/menu/', 'd22e064f-c17b-4cd5-a9fa-6c0e81910748.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:42', '0');
INSERT INTO `resources` VALUES ('77', '糖醋里脊.jpg', 'resources/images/menu/', '385b7dc5-f331-4cd3-9a14-f25e071d485e.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('78', '鸡毛菜烩蘑菇.jpg', 'resources/images/menu/', 'dfdd62c1-79a3-426c-9b34-6cc1e4ce3f38.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:42', '0');
INSERT INTO `resources` VALUES ('79', '外婆黑米糕.jpg', 'resources/images/menu/', '85c59bb9-84c2-4958-a605-4d92cf3a0e9f.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('80', '蒜蓉粉丝虾.jpg', 'resources/images/menu/', 'f1b82d53-2ac7-436d-ac4b-0794cf731941.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('81', '玉米汁.jpg', 'resources/images/menu/', 'b26d802a-3404-413d-8b9a-7ef6d2f12942.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('82', '想吃土豆.jpg', 'resources/images/menu/', 'b68bbfc9-d127-4e5c-9091-c8d915d41e37.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('83', '茶树菇爆鲜鱿', 'resources/images/menu/', 'f9fc5f3b-979a-4a4a-8ce8-ba9c98fa8be0.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('84', '冰桔茶.jpg', 'resources/images/menu/', 'fbaf6dd8-41d6-4628-a506-1987bc082212.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('85', '长寿菜.jpg', 'resources/images/menu/', '216c57fd-2482-4e18-a6eb-8ff7e0e7280d.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('86', '外婆烤肉.jpg', 'resources/images/menu/', '33e27d0c-377d-4b92-b318-5742a980ad7a.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('87', '有机花菜', 'resources/images/menu/', 'f01c0b2c-9569-4fe1-805c-de43a133b67e.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('88', '秀色可餐', 'resources/images/menu/', 'ce1b3bb5-98db-4ef6-8091-5715217cf6aa.jpg', 'image', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 22:00:52', '0');
INSERT INTO `resources` VALUES ('89', '妈咪宝贝', 'resources/images/menu/', 'ab5fbcf4-6976-4584-83ca-46262f33af29.jpg', 'image', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 22:01:26', '0');

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `consumer_id` varchar(255) DEFAULT NULL,
  `business_id` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL COMMENT '服务类型',
  `status` smallint(6) DEFAULT NULL COMMENT '状态,1:呼叫中,0:已接受',
  `is_delete` smallint(6) DEFAULT '0',
  `handler` varchar(255) DEFAULT NULL COMMENT '处理者',
  `appraise` smallint(6) DEFAULT NULL COMMENT '服务评价',
  `scene_id` bigint(20) DEFAULT NULL,
  `handle_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES ('68', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 13:45:14', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '1', null);
INSERT INTO `service` VALUES ('69', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 13:46:09', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '1', null);
INSERT INTO `service` VALUES ('70', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 13:52:04', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '1', null);
INSERT INTO `service` VALUES ('71', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 13:53:07', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '1', null);
INSERT INTO `service` VALUES ('72', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 13:58:12', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '1', null);
INSERT INTO `service` VALUES ('73', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:05:52', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '1', null);
INSERT INTO `service` VALUES ('74', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 14:14:11', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '1', null);
INSERT INTO `service` VALUES ('75', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-05-16 20:12:44', '0', '1', '0', null, null, '1', null);

-- ----------------------------
-- Table structure for subscriber
-- ----------------------------
DROP TABLE IF EXISTS `subscriber`;
CREATE TABLE `subscriber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `sex` smallint(6) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `headimgurl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subscriber
-- ----------------------------
INSERT INTO `subscriber` VALUES ('22', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '席维成', '1', '浦东新区', '中国', '上海', 'zh_CN', 'http://wx.qlogo.cn/mmopen/DiaiaOiaOW4BbdPzGfvcMXKBIluKNgJhMX5sFk0fELyiavE636NlqcKxdzUHfXWVvKwsOkBoAX66qgMrWSKybA3Kthl4swmpIEoY/0');
INSERT INTO `subscriber` VALUES ('23', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '戴红梅', '2', '浦东新区', '中国', '上海', 'zh_CN', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELYRKJqT32ic0tfMr706h2uzA72d1h43XYcm4qMPD8951sztkOhXeT1KqGjFhePiacTlg8d7hCwW1Lg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL COMMENT '微信用户的openid',
  `create_time` bigint(20) DEFAULT NULL COMMENT '用户关注时间',
  `is_deleted` smallint(6) DEFAULT NULL COMMENT '用户是否关注状态;1:未关注,0:关注',
  `times` int(11) NOT NULL COMMENT '用户关注&取消关注的次数累积',
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `precision_` decimal(10,6) DEFAULT NULL,
  `consume_code` varchar(500) DEFAULT NULL COMMENT '食客消费码',
  `status` smallint(6) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('20', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1400143518', '0', '1', null, null, null, 'a482bc41-2850-46ce-9f22-3b865ba70344', null);
INSERT INTO `user` VALUES ('22', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1400242403', '0', '1', null, null, null, '3fc34a00-6311-45de-ab89-570baa318988', null);

-- ----------------------------
-- Function structure for queryChildrenComment
-- ----------------------------
DROP FUNCTION IF EXISTS `queryChildrenComment`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `queryChildrenComment`(`id` bigint) RETURNS varchar(4000) CHARSET utf8
BEGIN
	#Routine body goes here...
	DECLARE sTemp VARCHAR(4000);
	DECLARE sTempChd VARCHAR(4000);

	SET sTemp = '$';
	SET sTempChd = cast(id as char);

	WHILE sTempChd is not NULL DO
		SET sTemp = CONCAT(sTemp,',',sTempChd);
		SELECT group_concat(`comment`.id) INTO sTempChd FROM `comment` where FIND_IN_SET(p_id,sTempChd) > 0;
	END WHILE;
	RETURN sTemp;
END
;;
DELIMITER ;
