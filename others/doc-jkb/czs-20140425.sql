/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : afl

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2014-04-25 10:13:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bill`
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('77', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-20 09:52:51', '119.00', '0', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '14', '1', '2014-04-24 23:35:50', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('78', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-20 10:55:24', '12.00', '0', 'c679501b-494b-4187-8113-25c036a3b69c', '14', '1', '2014-04-24 23:35:50', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('79', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 22:50:37', '95.00', '0', '724c387f-219b-49aa-ab7b-76cf1309c734', '14', '1', '2014-04-24 23:35:50', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('80', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 23:02:35', '0.00', '0', '7a04dc44-64ae-45f5-9c98-0f61a5b2cfa7', '14', '1', '2014-04-24 23:35:50', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('81', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 23:04:56', '0.00', '0', 'ac945102-a735-4b2d-8804-b6b7b7512251', '14', '1', '2014-04-24 22:41:49', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('82', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 23:05:48', '0.00', '0', '75368027-3bb6-48f1-b213-dba1e0931f61', '14', '1', '2014-04-24 22:41:49', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('83', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 23:07:07', '329.00', '0', '704c39f7-1986-467a-9dd6-b086301d709e', '14', '1', '2014-04-24 22:41:49', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('84', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 23:32:31', '161.00', '1', 'af62e20e-d736-49f0-aff2-2907e9ee9e02', '14', '1', '2014-04-24 22:41:49', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');

-- ----------------------------
-- Table structure for `business`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES ('9', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '席维成', '外高桥庭安路', 'xiweicheng@yeah.net', '美食天堂！来吧！来吧！快点……', '18721764335', '100', '554370', '1', null, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', null);
INSERT INTO `business` VALUES ('10', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '0', '戴安娜', '浦东机场', 'xiweicheng@yeah.net', '好吃不贵！', '18721764335', '100', '453192', null, null, null, null);
INSERT INTO `business` VALUES ('11', 'oxeU2uMumfbpFtGx-JExt99kekDk', '0', '小宝机器人', '浦东新区外高桥', '54990871@qq.com', '美食天堂!', '18721764335', '100', '770278', '1', null, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', null);
INSERT INTO `business` VALUES ('12', 'oxeU2uKMHJeF65Kpwxh4z4lQW6aY', '0', '席维成', '外高桥', 'xiweicheng@yeah.net', '美食天堂！', '18721764335', '100', '807043', null, null, null, null);

-- ----------------------------
-- Table structure for `business_consumer`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_consumer
-- ----------------------------
INSERT INTO `business_consumer` VALUES ('21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '4', '2014-04-23 23:08:17', null, null, '0');
INSERT INTO `business_consumer` VALUES ('22', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '5', '2014-04-23 23:05:57', null, null, '0');
INSERT INTO `business_consumer` VALUES ('23', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1', '2014-04-23 21:54:27', '3', '8a677d69-e897-4568-b5db-d208db5dc8c7', '1');

-- ----------------------------
-- Table structure for `business_consumer_record`
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_consumer_record
-- ----------------------------
INSERT INTO `business_consumer_record` VALUES ('21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 23:08:17', null, null, '0', null);
INSERT INTO `business_consumer_record` VALUES ('22', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 23:05:57', null, null, '0', null);
INSERT INTO `business_consumer_record` VALUES ('23', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 21:54:27', '3', '8a677d69-e897-4568-b5db-d208db5dc8c7', '1', null);

-- ----------------------------
-- Table structure for `business_role`
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_role
-- ----------------------------
INSERT INTO `business_role` VALUES ('1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2', '0', '2014-04-13 12:53:38');
INSERT INTO `business_role` VALUES ('2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3', '0', '2014-04-13 12:53:38');
INSERT INTO `business_role` VALUES ('3', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '0', '2014-04-13 14:58:28');
INSERT INTO `business_role` VALUES ('4', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '0', '2014-04-13 14:59:27');
INSERT INTO `business_role` VALUES ('5', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '0', '2014-04-13 15:00:08');
INSERT INTO `business_role` VALUES ('6', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '0', '0', '2014-04-22 22:47:01');
INSERT INTO `business_role` VALUES ('7', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2', '0', '2014-04-23 21:52:48');
INSERT INTO `business_role` VALUES ('8', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3', '0', '2014-04-23 21:52:49');
INSERT INTO `business_role` VALUES ('9', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2', '0', '2014-04-23 22:18:21');

-- ----------------------------
-- Table structure for `category`
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
-- Table structure for `czs_user`
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of czs_user
-- ----------------------------
INSERT INTO `czs_user` VALUES ('1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'xiweicheng', 'xiweicheng@yeah.net', '18721764335', '上海 外高桥', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '123456', '1', '1', '0');

-- ----------------------------
-- Table structure for `favorites`
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favorites
-- ----------------------------
INSERT INTO `favorites` VALUES ('31', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2', '2014-04-20 00:04:46', '0', '20140420');
INSERT INTO `favorites` VALUES ('32', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-20 00:04:49', '0', null);
INSERT INTO `favorites` VALUES ('33', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '34', '1', '2014-04-20 00:16:42', '0', null);
INSERT INTO `favorites` VALUES ('34', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '28', '1', '2014-04-20 00:17:08', '0', null);
INSERT INTO `favorites` VALUES ('35', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '32', '1', '2014-04-20 00:28:04', '0', null);
INSERT INTO `favorites` VALUES ('36', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '23', '1', '2014-04-20 00:28:11', '0', null);
INSERT INTO `favorites` VALUES ('37', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '25', '1', '2014-04-20 00:28:15', '0', null);
INSERT INTO `favorites` VALUES ('38', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '20', '1', '2014-04-20 10:42:52', '0', null);
INSERT INTO `favorites` VALUES ('39', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '36', '1', '2014-04-21 21:40:55', '0', null);
INSERT INTO `favorites` VALUES ('40', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '0', '2014-04-23 21:54:54', '0', null);
INSERT INTO `favorites` VALUES ('41', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2', '2014-04-23 21:55:00', '0', '20140423');
INSERT INTO `favorites` VALUES ('42', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '37', '1', '2014-04-23 22:13:58', '0', null);
INSERT INTO `favorites` VALUES ('43', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-23 22:49:55', '0', null);
INSERT INTO `favorites` VALUES ('44', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2', '2014-04-23 22:49:57', '0', '20140423');
INSERT INTO `favorites` VALUES ('45', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '29', '1', '2014-04-23 23:07:47', '0', null);

-- ----------------------------
-- Table structure for `menu`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('20', '蓝莓山药', '36', '12.00', '0.00', '24', '', '71', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:37:06', '4');
INSERT INTO `menu` VALUES ('21', '长寿菜', '36', '9.00', '0.00', '30', '', '85', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:42:09', '3');
INSERT INTO `menu` VALUES ('22', '外婆烤肉', '38', '29.00', '0.00', '31', '能说的只能是赞了……', '86', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:45:07', '1');
INSERT INTO `menu` VALUES ('23', '大烤茄子', '38', '10.00', '0.00', '30', '', '75', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:47:21', '1');
INSERT INTO `menu` VALUES ('24', '外婆黑米糕', '40', '15.00', '0.00', '24', '', '79', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:48:02', '1');
INSERT INTO `menu` VALUES ('25', '绿茶饼', '40', '12.00', '0.00', '24', '', '76', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:48:51', '2');
INSERT INTO `menu` VALUES ('26', '双皮奶', '45', '10.00', '0.00', '24', '', '74', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:50:14', '1');
INSERT INTO `menu` VALUES ('27', '花生绵绵冰', '45', '18.00', '0.00', '24', '', '72', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:51:24', '3');
INSERT INTO `menu` VALUES ('28', '想吃土豆', '37', '10.00', '0.00', '29', '', '82', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:52:24', '4');
INSERT INTO `menu` VALUES ('29', '石锅牛蛙', '37', '42.00', '0.00', '26', '', '73', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:53:20', '2');
INSERT INTO `menu` VALUES ('30', '糖醋里脊', '37', '18.00', '0.00', '30', '', '77', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:54:06', '3');
INSERT INTO `menu` VALUES ('31', '茶树菇爆鲜鱿', '37', '25.00', '0.00', '30', '', '83', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:54:55', '2');
INSERT INTO `menu` VALUES ('32', '蒜蓉粉丝虾', '37', '35.00', '0.00', '30', '', '80', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:55:37', '3');
INSERT INTO `menu` VALUES ('33', '有机花菜', '41', '16.00', '0.00', '30', '', '87', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:56:23', '1');
INSERT INTO `menu` VALUES ('34', '鸡毛菜烩蘑菇', '41', '12.00', '0.00', '30', '', '78', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:57:33', '2');
INSERT INTO `menu` VALUES ('35', '冰桔茶', '44', '8.00', '0.00', '23', '', '84', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:58:20', '0');
INSERT INTO `menu` VALUES ('36', '玉米汁', '44', '15.00', '0.00', '24', '', '81', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:59:05', '3');
INSERT INTO `menu` VALUES ('37', '妈咪宝贝', '46', '99.00', '0.00', '32', '美味可口！', '89', '0', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 22:03:49', '0');
INSERT INTO `menu` VALUES ('38', '妈妈咪呀', '47', '998.00', '0.00', '33', '无言以表！', '88', '0', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 22:06:28', '0');

-- ----------------------------
-- Table structure for `menu_bill`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_bill
-- ----------------------------
INSERT INTO `menu_bill` VALUES ('200', '27', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '2014-04-20 00:16:24', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8');
INSERT INTO `menu_bill` VALUES ('201', '36', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '2014-04-20 00:16:34', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8');
INSERT INTO `menu_bill` VALUES ('202', '25', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '2014-04-20 00:16:50', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8');
INSERT INTO `menu_bill` VALUES ('203', '30', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '2014-04-20 00:17:01', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8');
INSERT INTO `menu_bill` VALUES ('204', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '2014-04-20 08:13:29', '3', '14', '4', null);
INSERT INTO `menu_bill` VALUES ('205', '28', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '2014-04-20 00:22:29', '3', '14', '2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('206', '20', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-20 00:27:50', '3', '14', '2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('207', '29', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-20 00:27:57', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('208', '23', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-20 00:28:31', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('209', '20', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c679501b-494b-4187-8113-25c036a3b69c', '2014-04-20 10:49:19', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('210', '20', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-20 11:42:51', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('211', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-20 11:42:59', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('212', '32', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-20 12:01:30', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('213', '31', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-20 12:07:20', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('214', '30', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-21 17:57:20', '3', '14', '2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('215', '28', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 13:09:20', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8');
INSERT INTO `menu_bill` VALUES ('216', '26', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 08:01:43', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('217', '24', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 11:58:52', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('218', '29', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 08:01:27', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('219', '36', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 11:46:38', '3', '14', '2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('220', '34', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-21 22:16:51', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('221', '21', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-23 22:25:50', '1', '14', '1', null);
INSERT INTO `menu_bill` VALUES ('222', '25', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 08:01:36', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('223', '27', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 11:46:42', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('224', '33', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 11:47:15', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('225', '35', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 21:46:31', '1', '14', '1', null);
INSERT INTO `menu_bill` VALUES ('226', '22', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 21:46:36', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8');
INSERT INTO `menu_bill` VALUES ('227', '23', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 21:46:38', '1', '14', '1', null);
INSERT INTO `menu_bill` VALUES ('228', '38', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '8a677d69-e897-4568-b5db-d208db5dc8c7', '2014-04-23 22:13:24', '1', '3', '1', null);
INSERT INTO `menu_bill` VALUES ('229', '28', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-23 22:22:47', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('230', '30', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-23 22:25:13', '2', '14', '1', null);
INSERT INTO `menu_bill` VALUES ('231', '32', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-23 22:25:10', '2', '14', '1', null);
INSERT INTO `menu_bill` VALUES ('232', '31', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-23 22:25:38', '2', '14', '1', null);
INSERT INTO `menu_bill` VALUES ('233', '30', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '594ebe7e-8438-49e3-8bb4-a616acde00c8', '2014-04-23 23:06:48', '1', '14', '1', null);
INSERT INTO `menu_bill` VALUES ('234', '32', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '594ebe7e-8438-49e3-8bb4-a616acde00c8', '2014-04-23 23:06:52', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8');
INSERT INTO `menu_bill` VALUES ('235', '21', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '594ebe7e-8438-49e3-8bb4-a616acde00c8', '2014-04-23 23:07:45', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8');
INSERT INTO `menu_bill` VALUES ('236', '31', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '594ebe7e-8438-49e3-8bb4-a616acde00c8', '2014-04-23 23:07:50', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('237', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'af62e20e-d736-49f0-aff2-2907e9ee9e02', '2014-04-23 23:08:30', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8');
INSERT INTO `menu_bill` VALUES ('238', '32', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'af62e20e-d736-49f0-aff2-2907e9ee9e02', '2014-04-23 23:08:36', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8');
INSERT INTO `menu_bill` VALUES ('239', '34', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'af62e20e-d736-49f0-aff2-2907e9ee9e02', '2014-04-23 23:29:50', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');
INSERT INTO `menu_bill` VALUES ('240', '27', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'af62e20e-d736-49f0-aff2-2907e9ee9e02', '2014-04-23 23:30:00', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc');

-- ----------------------------
-- Table structure for `menu_category`
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
-- Table structure for `menu_taste`
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
-- Table structure for `message`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1078 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('944', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398148440', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 14:32:54', '0', null);
INSERT INTO `message` VALUES ('945', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398148463', 'text', '旅途愉快', '6005001923737824488', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 14:33:14', '1', null);
INSERT INTO `message` VALUES ('946', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398150010', 'image', null, '6005008568052231489', 'http://mmbiz.qpic.cn/mmbiz/66aY7oYxBvibktjWNAkCdSgobdTfe2Vy0FLNlyXa9JgtmWs7e6YR2q50tdDTEicNz1ZLJicIpIO5BvU7dK9Odsyjg/0', 'cmNNDjQ3MPu2jnDOYKXdDdh4nNAdbYHggBfFJete3dEMYZYgAS47P0QlQlMd-5ZD', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 14:59:01', '2', null);
INSERT INTO `message` VALUES ('947', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398155880', 'text', '好咯哦哦咯莫莫YY图www讨厌我那我们www', '6005033779510259502', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 16:36:51', '1', null);
INSERT INTO `message` VALUES ('948', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398155957', 'text', '回来咯哦哟魔域他体育中心知我者为我心忧杨永向哦www我', '6005034110222741303', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 16:38:10', '1', null);
INSERT INTO `message` VALUES ('949', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398156295', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 16:43:46', '0', null);
INSERT INTO `message` VALUES ('950', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398160875', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'unsubscribe', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 18:00:08', '0', null);
INSERT INTO `message` VALUES ('951', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398160886', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'subscribe', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 18:00:17', '0', null);
INSERT INTO `message` VALUES ('952', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398160896', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 18:00:26', '0', null);
INSERT INTO `message` VALUES ('953', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398160991', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 18:02:02', '0', null);
INSERT INTO `message` VALUES ('954', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398161355', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 18:08:06', '0', null);
INSERT INTO `message` VALUES ('955', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398174753', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 21:51:24', '0', null);
INSERT INTO `message` VALUES ('956', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398176297', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:17:07', '0', null);
INSERT INTO `message` VALUES ('957', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398176302', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:17:14', '0', null);
INSERT INTO `message` VALUES ('958', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398176544', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:21:15', '0', null);
INSERT INTO `message` VALUES ('959', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398176560', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:21:32', '0', null);
INSERT INTO `message` VALUES ('960', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398176575', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:21:45', '0', null);
INSERT INTO `message` VALUES ('961', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398178057', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:46:37', '0', null);
INSERT INTO `message` VALUES ('962', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398178051', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'unsubscribe', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:46:41', '0', null);
INSERT INTO `message` VALUES ('963', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398178052', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'subscribe', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:46:43', '0', null);
INSERT INTO `message` VALUES ('964', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398178091', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '24', '0.000000', '0.000000', '0.000000', 'gQEc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL19Vd0tYMnZscW9UVHNWMEExR0JVAAIE8jBJUwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:47:01', '0', null);
INSERT INTO `message` VALUES ('965', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398178107', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:47:16', '0', null);
INSERT INTO `message` VALUES ('966', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398178512', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:54:02', '0', null);
INSERT INTO `message` VALUES ('967', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398178591', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:55:22', '0', null);
INSERT INTO `message` VALUES ('968', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398178635', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:56:05', '0', null);
INSERT INTO `message` VALUES ('969', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398179129', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 23:04:19', '0', null);
INSERT INTO `message` VALUES ('970', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398179183', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 23:05:13', '0', null);
INSERT INTO `message` VALUES ('971', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398179409', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 23:09:00', '0', null);
INSERT INTO `message` VALUES ('972', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398206810', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:45:39', '0', null);
INSERT INTO `message` VALUES ('973', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398206814', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:45:43', '0', null);
INSERT INTO `message` VALUES ('974', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398207123', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:50:53', '0', null);
INSERT INTO `message` VALUES ('975', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398207129', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:50:58', '0', null);
INSERT INTO `message` VALUES ('976', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398207136', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:51:06', '0', null);
INSERT INTO `message` VALUES ('977', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398207139', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:51:09', '0', null);
INSERT INTO `message` VALUES ('978', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398207142', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:51:12', '0', null);
INSERT INTO `message` VALUES ('979', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398207159', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:51:28', '0', null);
INSERT INTO `message` VALUES ('980', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210023', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:39:14', '0', null);
INSERT INTO `message` VALUES ('981', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210406', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:45:36', '0', null);
INSERT INTO `message` VALUES ('982', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210409', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:45:38', '0', null);
INSERT INTO `message` VALUES ('983', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210447', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:46:17', '0', null);
INSERT INTO `message` VALUES ('984', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210459', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:46:29', '0', null);
INSERT INTO `message` VALUES ('985', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210507', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:47:17', '0', null);
INSERT INTO `message` VALUES ('986', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210518', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:47:27', '0', null);
INSERT INTO `message` VALUES ('987', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210548', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:47:58', '0', null);
INSERT INTO `message` VALUES ('988', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398211325', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 08:00:55', '0', null);
INSERT INTO `message` VALUES ('989', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398211342', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 08:01:12', '0', null);
INSERT INTO `message` VALUES ('990', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398218938', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 10:07:50', '0', null);
INSERT INTO `message` VALUES ('991', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398234442', 'text', 'gggh', '6005371200730970538', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:26:12', '1', null);
INSERT INTO `message` VALUES ('992', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398234895', 'text', 'cvvvbbb', '6005373146351155652', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:33:49', '1', null);
INSERT INTO `message` VALUES ('993', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398235009', 'text', 'vvbj考虑考虑', '6005373635977427404', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:35:39', '1', null);
INSERT INTO `message` VALUES ('994', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398235032', 'text', 'call旅途', '6005373734761675216', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:36:01', '1', null);
INSERT INTO `message` VALUES ('995', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398235037', 'text', 'V5哦OK咯没看见', '6005373756236511698', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:36:06', '1', null);
INSERT INTO `message` VALUES ('996', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398235042', 'text', 'CCTV咯米开朗基罗', '6005373777711348180', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:36:11', '1', null);
INSERT INTO `message` VALUES ('997', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398235147', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:37:57', '0', null);
INSERT INTO `message` VALUES ('998', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398235257', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:39:47', '0', null);
INSERT INTO `message` VALUES ('999', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398235867', 'text', '看看咯摸摸摸摸lz莫落寞到家了来咯呕吐辣的咯饿OK肯图路我到家了咯哦吐了恶疾咯KTV睡咯木头库洛姆考虑考虑KTV科技咯饿', '6005377321059367418', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:49:56', '1', null);
INSERT INTO `message` VALUES ('1000', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239348', 'text', '来咯莫', '6005392271840524936', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:47:57', '1', null);
INSERT INTO `message` VALUES ('1001', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239737', 'text', '来咯莫哦', '6005393942582803096', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:54:26', '1', null);
INSERT INTO `message` VALUES ('1002', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239753', 'text', '看看咯', '6005394011302279834', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:54:43', '1', null);
INSERT INTO `message` VALUES ('1003', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239763', 'text', '喔喔哦酷我默默', '6005394054251952798', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:54:53', '1', null);
INSERT INTO `message` VALUES ('1004', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239777', 'text', '咯OK拖Dell呢', '6005394114381494944', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:55:07', '1', null);
INSERT INTO `message` VALUES ('1005', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239783', 'text', '\'啊call门徒模块', '6005394140151298722', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:55:15', '1', null);
INSERT INTO `message` VALUES ('1006', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239807', 'image', null, '6005394243230513828', 'http://mmbiz.qpic.cn/mmbiz/66aY7oYxBv98324iar0STct8TUeysUpSsTCWFFndeRx3jrK5zwxHbqRhtsSBibiazEgTf8ZOmnE3Oz6ianhccWSoVQ/0', 'qgu7GPaTSEKww-N_RUOP5oIkFtJgJUHXOlv2N-7TZcl-dkFCkC3XqPVEFBVhlOLT', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:55:38', '2', null);
INSERT INTO `message` VALUES ('1007', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239808', 'image', null, '6005394247525481125', 'http://mmbiz.qpic.cn/mmbiz/66aY7oYxBv98324iar0STct8TUeysUpSseIe7QlJFOmaQU63qmFjTJ3cMwYuja8YpI1Eic8MrZEFjmjmXzwuEHJg/0', '2i2GaCMgrgh1VsrkaY9hhdUnwEYKnaOcNvt8vHaJFKOoNiUU1f-1Gm3zVeW0g5GY', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:55:39', '2', null);
INSERT INTO `message` VALUES ('1008', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398240003', 'image', null, '6005395085044103854', 'http://mmbiz.qpic.cn/mmbiz/66aY7oYxBv98324iar0STct8TUeysUpSsd4vKNWd4Tzj2EfiatrLHDF8e5X48rytiawWiaezNZgVKUhG98jXL2tZFg/0', 'Fqc6_M4qwrxAbROzkEPQIj6HQRnwAz4wlATIkCq_USqbvOiyeI5HXf3qNNdqcygJ', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:58:53', '1', null);
INSERT INTO `message` VALUES ('1009', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398240016', 'image', null, '6005395140878678704', 'http://mmbiz.qpic.cn/mmbiz/66aY7oYxBv98324iar0STct8TUeysUpSsvqJK9tZufXnLzp30Zgs3cnwGIHdFeASA1QetND3ZicUYFYLsgcGRbPQ/0', 'kYhhYC24hqFvCJLyxvmDZn9StAOJMqIoIJ-B9BkPGKOs45rdKCzGiS995yjEUSF9', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:59:06', '1', null);
INSERT INTO `message` VALUES ('1010', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398240093', 'image', null, '6005395471591160501', 'http://mmbiz.qpic.cn/mmbiz/66aY7oYxBv98324iar0STct8TUeysUpSsCsicPe76e1sGIzXc3LbIBHuEuRmUGibBYsPXGGuGLice21AiaXXd3nmU0A/0', 'DLJasaIlNfYWDg-hM7YPBMABPXQTldRw9VY71vzZrbjycHWwF5kCryYDbme8A0h7', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 16:00:23', '1', null);
INSERT INTO `message` VALUES ('1011', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398241030', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 16:16:00', '0', '0');
INSERT INTO `message` VALUES ('1012', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245146', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:24:35', '0', null);
INSERT INTO `message` VALUES ('1013', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245149', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:24:39', '0', null);
INSERT INTO `message` VALUES ('1014', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245160', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:24:49', '0', null);
INSERT INTO `message` VALUES ('1015', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245165', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:24:54', '0', null);
INSERT INTO `message` VALUES ('1016', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245686', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:33:36', '0', null);
INSERT INTO `message` VALUES ('1017', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245699', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:33:48', '0', null);
INSERT INTO `message` VALUES ('1018', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245748', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:34:39', '0', null);
INSERT INTO `message` VALUES ('1019', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245804', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:35:33', '0', null);
INSERT INTO `message` VALUES ('1020', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245892', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:37:03', '0', null);
INSERT INTO `message` VALUES ('1021', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398246043', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:39:37', '0', null);
INSERT INTO `message` VALUES ('1022', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398260749', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 21:44:44', '0', null);
INSERT INTO `message` VALUES ('1023', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398261068', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 21:49:58', '0', null);
INSERT INTO `message` VALUES ('1024', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398261238', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '1', '0.000000', '0.000000', '0.000000', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 21:52:48', '0', null);
INSERT INTO `message` VALUES ('1025', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398261239', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '1', '0.000000', '0.000000', '0.000000', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 21:52:49', '0', null);
INSERT INTO `message` VALUES ('1026', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398261337', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '3', '0.000000', '0.000000', '0.000000', 'gQGf8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2cweHpSampsMllTZ2dTY1RyV0JVAAIEpJUxUwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 21:54:26', '0', null);
INSERT INTO `message` VALUES ('1027', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398261669', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 21:59:59', '0', null);
INSERT INTO `message` VALUES ('1028', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262534', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:14:24', '0', null);
INSERT INTO `message` VALUES ('1029', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262771', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '1', '0.000000', '0.000000', '0.000000', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:18:20', '0', null);
INSERT INTO `message` VALUES ('1030', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262820', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:19:11', '0', null);
INSERT INTO `message` VALUES ('1031', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262853', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:19:43', '0', null);
INSERT INTO `message` VALUES ('1032', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262884', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:20:30', '0', null);
INSERT INTO `message` VALUES ('1033', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262891', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:20:45', '0', null);
INSERT INTO `message` VALUES ('1034', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262899', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:20:53', '0', null);
INSERT INTO `message` VALUES ('1035', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262891', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:20:53', '0', null);
INSERT INTO `message` VALUES ('1036', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262899', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:00', '0', null);
INSERT INTO `message` VALUES ('1037', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262884', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:00', '0', null);
INSERT INTO `message` VALUES ('1038', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262891', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:08', '0', null);
INSERT INTO `message` VALUES ('1039', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262884', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:15', '0', null);
INSERT INTO `message` VALUES ('1040', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262899', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:15', '0', null);
INSERT INTO `message` VALUES ('1041', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262891', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:23', '0', null);
INSERT INTO `message` VALUES ('1042', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262899', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:30', '0', null);
INSERT INTO `message` VALUES ('1043', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262942', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:38', '0', null);
INSERT INTO `message` VALUES ('1044', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262993', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:22:25', '0', null);
INSERT INTO `message` VALUES ('1045', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398263025', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:22:35', '0', null);
INSERT INTO `message` VALUES ('1046', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262993', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:22:44', '0', null);
INSERT INTO `message` VALUES ('1047', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398263083', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 22:23:32', '0', null);
INSERT INTO `message` VALUES ('1048', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398263272', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:26:42', '0', null);
INSERT INTO `message` VALUES ('1049', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398264596', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:48:52', '0', null);
INSERT INTO `message` VALUES ('1050', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398264610', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:49:00', '0', null);
INSERT INTO `message` VALUES ('1051', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398264625', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:49:14', '0', null);
INSERT INTO `message` VALUES ('1052', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398264683', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:50:14', '0', null);
INSERT INTO `message` VALUES ('1053', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265315', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-23 23:00:45', '0', null);
INSERT INTO `message` VALUES ('1054', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265447', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-23 23:02:56', '0', null);
INSERT INTO `message` VALUES ('1055', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265550', 'text', '炒菜', '6005504808573616184', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 23:04:40', '1', null);
INSERT INTO `message` VALUES ('1056', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265577', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-23 23:05:06', '0', null);
INSERT INTO `message` VALUES ('1057', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265627', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-23 23:05:57', '0', null);
INSERT INTO `message` VALUES ('1058', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265720', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 23:07:29', '0', null);
INSERT INTO `message` VALUES ('1059', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398265768', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-23 23:08:17', '0', null);
INSERT INTO `message` VALUES ('1060', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265812', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 23:09:04', '0', null);
INSERT INTO `message` VALUES ('1061', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265845', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 23:09:34', '0', null);
INSERT INTO `message` VALUES ('1062', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398267132', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 23:31:02', '0', null);
INSERT INTO `message` VALUES ('1063', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398267208', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 23:32:18', '0', null);
INSERT INTO `message` VALUES ('1064', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267375', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-23 23:35:05', '0', null);
INSERT INTO `message` VALUES ('1065', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267380', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-23 23:35:09', '0', null);
INSERT INTO `message` VALUES ('1066', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267383', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_5', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-23 23:35:14', '0', null);
INSERT INTO `message` VALUES ('1067', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267396', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-23 23:35:25', '0', null);
INSERT INTO `message` VALUES ('1068', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267399', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-23 23:35:28', '0', null);
INSERT INTO `message` VALUES ('1069', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267402', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-23 23:35:32', '0', null);
INSERT INTO `message` VALUES ('1070', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267413', 'text', '更好纠结', '6005512810097688862', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, '2014-04-23 23:35:43', '0', null);
INSERT INTO `message` VALUES ('1071', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267494', 'image', null, '6005513157990039848', 'http://mmbiz.qpic.cn/mmbiz/zX5CzEhtoKN6qusWsrkVP2RpknRO78R0JFcukALeqfNneNxPFVE38Z9AF441ibKUUE4DjwAuWC6agPp4qoUUxXw/0', 'URsdtSfetaQj5-VVqFVVL3RzdlpbUy3dfJZW83foolzs7lfvTmUs5vcDVnHfGGxS', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, '2014-04-23 23:37:05', '0', null);
INSERT INTO `message` VALUES ('1072', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267524', 'text', '你。', '6005513286839058732', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, '2014-04-23 23:37:33', '0', null);
INSERT INTO `message` VALUES ('1073', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267537', 'voice', null, '6005513342473469952', null, '_YVvWQJexkRCO8AxypUBz17imdMsinOiNZEB0pijxvocGzSjnF-SxTeIDkrCcxoi', 'speex', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, '2014-04-23 23:37:46', '0', null);
INSERT INTO `message` VALUES ('1074', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267560', 'location', null, '6005513441457881395', null, null, null, null, '31.325437', '121.594990', '17.000000', '中国上海市浦东新区庭安路 邮政编码: 200137', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, '2014-04-23 23:38:10', '0', null);
INSERT INTO `message` VALUES ('1075', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398384752', 'text', '简历', '6006016777265243155', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, '2014-04-25 08:11:20', '0', null);
INSERT INTO `message` VALUES ('1076', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398384771', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-25 08:11:40', '0', null);
INSERT INTO `message` VALUES ('1077', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398384778', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-25 08:11:47', '0', null);

-- ----------------------------
-- Table structure for `qrcode`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrcode
-- ----------------------------
INSERT INTO `qrcode` VALUES ('88', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '13', '200', '0', '1', 'gQEO8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL1UweTBpb1BtOUxXTlVSMXo5MkNQAAIETVFRUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQEO8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL1UweTBpb1BtOUxXTlVSMXo5MkNQAAIETVFRUwMEAAAAAA%3D%3D', 'resources/images/qrcode/c1eb06e8-3b42-419c-bc2f-7d2e1e5640a2_13.jpg', 'QR_LIMIT_SCENE', 'http://www.canzs.cn:80/resources/images/qrcode/c1eb06e8-3b42-419c-bc2f-7d2e1e5640a2_13.jpg', '一楼二号桌');
INSERT INTO `qrcode` VALUES ('89', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '14', '200', '9', '1', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA%3D%3D', 'resources/images/qrcode/846cc702-e035-4d61-adc7-8635a51a470e_14.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/846cc702-e035-4d61-adc7-8635a51a470e_14.jpg', '一楼一号桌');
INSERT INTO `qrcode` VALUES ('90', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '15', '200', '0', '1', 'gQEq8ToAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xLzUwd1ZaNHpsc0lUSmNFTTl5MkJVAAIEx5NGUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQEq8ToAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xLzUwd1ZaNHpsc0lUSmNFTTl5MkJVAAIEx5NGUwMEAAAAAA%3D%3D', 'resources/images/qrcode/64a3a6c2-6527-4869-8595-d2230fb504c2_15.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/64a3a6c2-6527-4869-8595-d2230fb504c2_15.jpg', '一楼二号桌');
INSERT INTO `qrcode` VALUES ('91', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '16', '200', '0', '1', 'gQHr8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xLzdrdzF0NC1scTRUU3Frclc2MkJVAAIEs9pHUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQHr8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xLzdrdzF0NC1scTRUU3Frclc2MkJVAAIEs9pHUwMEAAAAAA%3D%3D', 'resources/images/qrcode/6e7d6203-2e0d-409a-ad08-3c9ebe7e48af_16.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/6e7d6203-2e0d-409a-ad08-3c9ebe7e48af_16.jpg', '一楼三号桌');
INSERT INTO `qrcode` VALUES ('92', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '17', '200', '0', '1', 'gQE08DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2NVeElVMVBseG9TLURkVWlsbUJVAAIE7dpHUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQE08DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2NVeElVMVBseG9TLURkVWlsbUJVAAIE7dpHUwMEAAAAAA%3D%3D', 'resources/images/qrcode/1199dd5a-df05-4be8-ba39-6ca3b24fa7fb_17.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/1199dd5a-df05-4be8-ba39-6ca3b24fa7fb_17.jpg', '一楼四号桌');
INSERT INTO `qrcode` VALUES ('93', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '18', '200', '0', '1', 'gQHc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL29FeDZwOXZsMjRTaW9BVDVwR0JVAAIEpttHUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQHc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL29FeDZwOXZsMjRTaW9BVDVwR0JVAAIEpttHUwMEAAAAAA%3D%3D', 'resources/images/qrcode/9b384c91-33af-41ce-848d-a67b3222d1e5_18.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/9b384c91-33af-41ce-848d-a67b3222d1e5_18.jpg', '一楼五号桌');
INSERT INTO `qrcode` VALUES ('94', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '19', '200', '0', '1', 'gQE18DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0lVd3dBNkRscG9UZi1vVnE3bUJVAAIEzQZIUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQE18DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0lVd3dBNkRscG9UZi1vVnE3bUJVAAIEzQZIUwMEAAAAAA%3D%3D', 'resources/images/qrcode/4ee4b88d-af97-4fb0-89f1-89569b9a36b1_19.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/4ee4b88d-af97-4fb0-89f1-89569b9a36b1_19.jpg', '二楼一号桌');
INSERT INTO `qrcode` VALUES ('95', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '20', '200', '0', '1', 'gQGm7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL1drd2hDZkxsdllURTNmNXEtMkJVAAIEfDBJUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQGm7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL1drd2hDZkxsdllURTNmNXEtMkJVAAIEfDBJUwMEAAAAAA%3D%3D', 'resources/images/qrcode/0cb82f25-fe13-4a64-b98e-988a31d7b8f3_20.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/0cb82f25-fe13-4a64-b98e-988a31d7b8f3_20.jpg', '二楼二号桌');
INSERT INTO `qrcode` VALUES ('96', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '21', '200', '0', '1', 'gQFR7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3prd0dxOHZscVlUUTBtcjcyR0JVAAIEfTBJUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQFR7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3prd0dxOHZscVlUUTBtcjcyR0JVAAIEfTBJUwMEAAAAAA%3D%3D', 'resources/images/qrcode/4b831d5e-33ae-4858-9499-df40372a40a1_21.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/4b831d5e-33ae-4858-9499-df40372a40a1_21.jpg', '二楼三号桌');
INSERT INTO `qrcode` VALUES ('97', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '22', '200', '0', '1', 'gQEi7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3VFdzdzQmpscW9UVGJCemU1V0JVAAIEfjBJUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQEi7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3VFdzdzQmpscW9UVGJCemU1V0JVAAIEfjBJUwMEAAAAAA%3D%3D', 'resources/images/qrcode/01506486-0221-4117-bb60-51d19c68b084_22.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/01506486-0221-4117-bb60-51d19c68b084_22.jpg', '二楼一号包间');
INSERT INTO `qrcode` VALUES ('98', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '23', '200', '0', '1', 'gQH67zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL29FeHVxR1RsOG9TTEVBVExzR0JVAAIE8TBJUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQH67zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL29FeHVxR1RsOG9TTEVBVExzR0JVAAIE8TBJUwMEAAAAAA%3D%3D', 'resources/images/qrcode/08bc6167-591b-4613-9119-8894a2a05de2_23.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/08bc6167-591b-4613-9119-8894a2a05de2_23.jpg', '二楼二号包间');
INSERT INTO `qrcode` VALUES ('99', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '24', '100000', '0', '2', 'gQEc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL19Vd0tYMnZscW9UVHNWMEExR0JVAAIE8jBJUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQEc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL19Vd0tYMnZscW9UVHNWMEExR0JVAAIE8jBJUwMEAAAAAA%3D%3D', 'resources/images/qrcode/f374e1c9-486b-45a5-9a58-11d6e8051910_24.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/f374e1c9-486b-45a5-9a58-11d6e8051910_24.jpg', '角色分配管理');
INSERT INTO `qrcode` VALUES ('100', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1', '100000', '0', '2', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA%3D%3D', 'resources/images/qrcode/632a2969-4aad-40e4-9a00-2046934b1c2a_1.jpg', 'QR_LIMIT_SCENE', 'http://www.canzs.cn:80/resources/images/qrcode/632a2969-4aad-40e4-9a00-2046934b1c2a_1.jpg', '角色分配');
INSERT INTO `qrcode` VALUES ('101', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '3', '200', '1', '1', 'gQGf8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2cweHpSampsMllTZ2dTY1RyV0JVAAIEpJUxUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQGf8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2cweHpSampsMllTZ2dTY1RyV0JVAAIEpJUxUwMEAAAAAA%3D%3D', 'resources/images/qrcode/a3e5c2e0-dc84-452a-a2c1-a785761d59ee_3.jpg', 'QR_LIMIT_SCENE', 'http://www.canzs.cn:80/resources/images/qrcode/a3e5c2e0-dc84-452a-a2c1-a785761d59ee_3.jpg', '一楼一号桌');
INSERT INTO `qrcode` VALUES ('102', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2', '200', '0', '1', 'gQHG7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3pFeG9rM2ZseTRTeVZHalB0bUJVAAIEUpMxUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQHG7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3pFeG9rM2ZseTRTeVZHalB0bUJVAAIEUpMxUwMEAAAAAA%3D%3D', 'resources/images/qrcode/ec600aba-eee0-41b4-ac41-89a3da44113f_2.jpg', 'QR_LIMIT_SCENE', 'http://www.canzs.cn:80/resources/images/qrcode/ec600aba-eee0-41b4-ac41-89a3da44113f_2.jpg', '一楼一号桌');
INSERT INTO `qrcode` VALUES ('103', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '4', '200', '0', '1', 'gQEd8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0lVd0Jtd3pscG9UZnlvWEQzMkJVAAIE094yUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQEd8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0lVd0Jtd3pscG9UZnlvWEQzMkJVAAIE094yUwMEAAAAAA%3D%3D', 'resources/images/qrcode/a262235f-9783-4f0b-962e-9109f276cdd0_4.jpg', 'QR_LIMIT_SCENE', 'http://www.canzs.cn:80/resources/images/qrcode/a262235f-9783-4f0b-962e-9109f276cdd0_4.jpg', '一楼一号桌');

-- ----------------------------
-- Table structure for `request`
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
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of request
-- ----------------------------
INSERT INTO `request` VALUES ('137', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '14', '0', '0', '2014-04-20 00:03:55', '0');
INSERT INTO `request` VALUES ('138', '进入请求中', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '724c387f-219b-49aa-ab7b-76cf1309c734', '14', '0', '0', '2014-04-20 00:06:27', '0');
INSERT INTO `request` VALUES ('139', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '724c387f-219b-49aa-ab7b-76cf1309c734', '14', '4', '0', '2014-04-20 00:33:45', '0');
INSERT INTO `request` VALUES ('140', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '724c387f-219b-49aa-ab7b-76cf1309c734', '14', '4', '0', '2014-04-20 00:33:58', '0');
INSERT INTO `request` VALUES ('141', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '724c387f-219b-49aa-ab7b-76cf1309c734', '14', '4', '0', '2014-04-20 00:34:05', '0');
INSERT INTO `request` VALUES ('142', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '0', '2014-04-20 00:34:08', '0');
INSERT INTO `request` VALUES ('143', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '14', '4', '0', '2014-04-20 00:34:21', '0');
INSERT INTO `request` VALUES ('144', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '0', '2014-04-20 00:35:55', '0');
INSERT INTO `request` VALUES ('145', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '14', '4', '0', '2014-04-20 00:36:59', '0');
INSERT INTO `request` VALUES ('146', '新顾客进入', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c679501b-494b-4187-8113-25c036a3b69c', '14', '0', '0', '2014-04-20 09:53:23', '0');
INSERT INTO `request` VALUES ('147', '新顾客进入', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '14', '0', '0', '2014-04-20 10:58:29', '0');
INSERT INTO `request` VALUES ('148', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '724c387f-219b-49aa-ab7b-76cf1309c734', '14', '4', '0', '2014-04-23 06:50:53', '0');
INSERT INTO `request` VALUES ('149', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '724c387f-219b-49aa-ab7b-76cf1309c734', '14', '4', '0', '2014-04-23 06:50:58', '0');
INSERT INTO `request` VALUES ('150', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '724c387f-219b-49aa-ab7b-76cf1309c734', '14', '4', '0', '2014-04-23 06:51:06', '0');
INSERT INTO `request` VALUES ('151', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '724c387f-219b-49aa-ab7b-76cf1309c734', '14', '4', '0', '2014-04-23 06:51:09', '0');
INSERT INTO `request` VALUES ('152', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '724c387f-219b-49aa-ab7b-76cf1309c734', '14', '4', '0', '2014-04-23 06:51:12', '0');
INSERT INTO `request` VALUES ('153', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '0', '2014-04-23 06:52:25', '0');
INSERT INTO `request` VALUES ('154', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '14', '4', '0', '2014-04-23 17:33:48', '0');
INSERT INTO `request` VALUES ('155', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '14', '4', '0', '2014-04-23 17:34:39', '0');
INSERT INTO `request` VALUES ('156', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '14', '4', '0', '2014-04-23 17:35:49', '0');
INSERT INTO `request` VALUES ('157', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '14', '4', '0', '2014-04-23 17:37:04', '0');
INSERT INTO `request` VALUES ('158', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '14', '4', '0', '2014-04-23 17:39:42', '0');
INSERT INTO `request` VALUES ('159', '新顾客进入', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '8a677d69-e897-4568-b5db-d208db5dc8c7', '3', '0', '1', '2014-04-23 21:54:27', '0');
INSERT INTO `request` VALUES ('160', '新顾客进入', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '7a04dc44-64ae-45f5-9c98-0f61a5b2cfa7', '14', '0', '0', '2014-04-23 23:00:50', '0');
INSERT INTO `request` VALUES ('161', '新顾客进入', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'ac945102-a735-4b2d-8804-b6b7b7512251', '14', '0', '0', '2014-04-23 23:03:51', '0');
INSERT INTO `request` VALUES ('162', '新顾客进入', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '75368027-3bb6-48f1-b213-dba1e0931f61', '14', '0', '0', '2014-04-23 23:05:06', '0');
INSERT INTO `request` VALUES ('163', '新顾客进入', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '594ebe7e-8438-49e3-8bb4-a616acde00c8', '14', '0', '0', '2014-04-23 23:05:57', '0');
INSERT INTO `request` VALUES ('164', '新顾客进入', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'af62e20e-d736-49f0-aff2-2907e9ee9e02', '14', '0', '0', '2014-04-23 23:08:17', '0');

-- ----------------------------
-- Table structure for `resources`
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
INSERT INTO `resources` VALUES ('71', '蓝莓山药.jpg', 'resources/images/menu/', '3b3adf23-9361-4dfc-a540-61b789d3fcf7.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:42', '0');
INSERT INTO `resources` VALUES ('72', '花生绵绵冰.jpg', 'resources/images/menu/', '09046712-47c7-46d7-862a-fb3cddba3ffc.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:42', '0');
INSERT INTO `resources` VALUES ('73', '石锅牛蛙.jpg', 'resources/images/menu/', 'd1c59445-4db2-468a-aaf0-1fc7fbf5267c.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:42', '0');
INSERT INTO `resources` VALUES ('74', '双皮奶.jpg', 'resources/images/menu/', '2f82ccf1-e886-4600-a116-589ff02af5e4.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:42', '0');
INSERT INTO `resources` VALUES ('75', '烤茄子.jpg', 'resources/images/menu/', 'c1b17b42-c205-496b-a1c7-4e68b920a579.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:42', '0');
INSERT INTO `resources` VALUES ('76', '绿茶饼.jpg', 'resources/images/menu/', 'd22e064f-c17b-4cd5-a9fa-6c0e81910748.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:42', '0');
INSERT INTO `resources` VALUES ('77', '糖醋里脊.jpg', 'resources/images/menu/', '385b7dc5-f331-4cd3-9a14-f25e071d485e.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('78', '鸡毛菜烩蘑菇.jpg', 'resources/images/menu/', 'dfdd62c1-79a3-426c-9b34-6cc1e4ce3f38.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:42', '0');
INSERT INTO `resources` VALUES ('79', '外婆黑米糕.jpg', 'resources/images/menu/', '85c59bb9-84c2-4958-a605-4d92cf3a0e9f.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('80', '蒜蓉粉丝虾.jpg', 'resources/images/menu/', 'f1b82d53-2ac7-436d-ac4b-0794cf731941.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('81', '玉米汁.jpg', 'resources/images/menu/', 'b26d802a-3404-413d-8b9a-7ef6d2f12942.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('82', '想吃土豆.jpg', 'resources/images/menu/', 'b68bbfc9-d127-4e5c-9091-c8d915d41e37.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('83', '茶树菇爆鲜鱿.jpg', 'resources/images/menu/', 'f9fc5f3b-979a-4a4a-8ce8-ba9c98fa8be0.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('84', '冰桔茶.jpg', 'resources/images/menu/', 'fbaf6dd8-41d6-4628-a506-1987bc082212.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('85', '长寿菜.jpg', 'resources/images/menu/', '216c57fd-2482-4e18-a6eb-8ff7e0e7280d.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('86', '外婆烤肉.jpg', 'resources/images/menu/', '33e27d0c-377d-4b92-b318-5742a980ad7a.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('87', '有机花菜.jpg', 'resources/images/menu/', 'f01c0b2c-9569-4fe1-805c-de43a133b67e.jpg', 'image', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:06:43', '0');
INSERT INTO `resources` VALUES ('88', 'image.jpg', 'resources/images/menu/', 'ce1b3bb5-98db-4ef6-8091-5715217cf6aa.jpg', 'image', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 22:00:52', '0');
INSERT INTO `resources` VALUES ('89', 'image.jpg', 'resources/images/menu/', 'ab5fbcf4-6976-4584-83ca-46262f33af29.jpg', 'image', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 22:01:26', '0');

-- ----------------------------
-- Table structure for `service`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES ('27', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-20 00:33:45', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14');
INSERT INTO `service` VALUES ('28', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-20 00:34:21', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14');
INSERT INTO `service` VALUES ('29', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-20 00:36:59', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14');
INSERT INTO `service` VALUES ('30', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:50:53', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14');

-- ----------------------------
-- Table structure for `subscriber`
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subscriber
-- ----------------------------
INSERT INTO `subscriber` VALUES ('3', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '席维成', '1', '浦东新区', '中国', '上海', 'zh_CN', 'http://wx.qlogo.cn/mmopen/DiaiaOiaOW4BbdPzGfvcMXKBIluKNgJhMX5sFk0fELyiavE636NlqcKxdzUHfXWVvKwsOkBoAX66qgMrWSKybA3Kthl4swmpIEoY');
INSERT INTO `subscriber` VALUES ('4', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '戴红梅', '2', '浦东新区', '中国', '上海', 'zh_CN', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDGfoMUVeImJTB1EhvrSpf1Aa1eQkaj9lKOYjPmbGr3qf4fuEGv50rIcEn5wH75IZxIX1B7ItSslg');
INSERT INTO `subscriber` VALUES ('5', 'okPUDt7bteacEqkYuo1h35holOt0', 'aJi', '1', '丰台', '中国', '北京', 'zh_CN', 'http://wx.qlogo.cn/mmopen/xPKCxELaaj71cdTAtdN4ROcLrcm27AzsgWzHcGTpBTGOWEzT33DiaxjJ4oqelDKudWaMDn9iaCVxUXGGG0bD83QWPFxvn1nymJ');
INSERT INTO `subscriber` VALUES ('6', 'okPUDty-hCcDY2Pqz3rZKIAAZ76c', 'Natural', '1', '苏州', '中国', '江苏', 'zh_CN', 'http://wx.qlogo.cn/mmopen/DiaiaOiaOW4BbdPzGfvcMXKBNDRQfNjlj5YjO5EicVV8CVMrQBwZyuoHAtDq3XPhQ4oct79eL7LYdhqyu1H7DHiba9em2YbEGunvf');
INSERT INTO `subscriber` VALUES ('7', 'okPUDt20dQIIpn0RmHdYTOX9Fwis', '彭纪翔', '1', '信阳', '中国', '河南', 'zh_CN', 'http://wx.qlogo.cn/mmopen/ycOzTIV7D03VDSJXpgVKcd2sQcbcmGLlItA812LYRhcnZdIbETpOd998cGTJwVbBgH2nNuGSOgxjBFiaBdb1MBA34pxgbhbV5');
INSERT INTO `subscriber` VALUES ('8', 'okPUDt-bQG255wHG8Omn3XXIHWvs', '南念', '1', '浦东新区', '中国', '上海', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7NS6aukjFBMjggoE8CHNoriaM0NL2vnYsSJr6VVoI4kORMnpNjqAlRvCekKjrbgBicZ4rk2PEaFBiaQ');
INSERT INTO `subscriber` VALUES ('10', 'okPUDt3zgu1Ub90yL_w-slzvYWic', 'ゼズツヂデテト', '1', '海口', '中国', '海南', 'zh_CN', 'http://wx.qlogo.cn/mmopen/DiaiaOiaOW4BbeCHmSjwpNhuCfvI6V5m1bFx5YicXrtX9uDacknnvjZgibIAoBDB3T5DWjqGFeib1mcVVy0HXtYHibY8A');
INSERT INTO `subscriber` VALUES ('11', 'okPUDt9mjQmCNfH6rXV0sffTxiPQ', '刘耀', '1', '闸北', '中国', '上海', 'zh_CN', 'http://wx.qlogo.cn/mmopen/xPKCxELaaj60ClS4eJdaf41UMZrRHibc6XYjQjUJNvAheWyFV1gibs5OoCnFvQIL0lzffAfBgeB6U0goibIY7oC5Q');
INSERT INTO `subscriber` VALUES ('12', 'okPUDt-oIvPeYANJ9a2ldXiRhkyk', '木鸟', '1', '浦东新区', '中国', '上海', 'zh_CN', 'http://wx.qlogo.cn/mmopen/xPKCxELaaj71cdTAtdN4RKQtQ4sMvIy1DYhIbF5CWnfdDWxnmShSjxzlLNyqn6rf9mfibl8TdpHBs9GNcuxQ8yrCa1eaAfasm');
INSERT INTO `subscriber` VALUES ('13', 'okPUDtyAf189CMqEq0Wf0aH-YGVo', '吴钟宝', '1', '海口', '中国', '海南', 'zh_CN', 'http://wx.qlogo.cn/mmopen/DiaiaOiaOW4Bbdfg9V9FbIICQ0HLFkAcUE7qx3LvjkOM7t0PuN8955BiciaubJbBJpS8lkyibicf9R3NnRl8QFSz4muoQ');
INSERT INTO `subscriber` VALUES ('14', 'okPUDt10VZJDRnmirHcCp7zW04kQ', '小小帅', '1', '呼和浩特', '中国', '内蒙古', 'zh_CN', 'http://wx.qlogo.cn/mmopen/xPKCxELaaj479J8o5SxI3ZBD0p2OPA3rmKN28JBnjz2oXdxOBy6nO6C6pAoXPoayiamibotWJIZcpc7BugkXDeqPnxb5XzTNXN/0');
INSERT INTO `subscriber` VALUES ('15', 'oxeU2uMumfbpFtGx-JExt99kekDk', '吴钟宝', '1', '海口', '中国', '海南', 'zh_CN', 'http://wx.qlogo.cn/mmopen/AAdKzINhHbSDjpWSK0xyMjwhBdn6LeWG0u1bp1E89DulMicSM3tb9n4ryy9vU8fjZLHzew362JESRm8DdrAu1FQ/0');
INSERT INTO `subscriber` VALUES ('16', 'oxeU2uKMHJeF65Kpwxh4z4lQW6aY', '席维成', '1', '浦东新区', '中国', '上海', 'zh_CN', 'http://wx.qlogo.cn/mmopen/AAdKzINhHbRs6V4bm4ttcaDrEE6ahibQ7cF1icgeIlxXuoPAkrMtrlS1PF1zubW4ImWwZ7JjgRnKS8sOqmgUhomupUf94MVA2S');
INSERT INTO `subscriber` VALUES ('17', 'oxeU2uLkwisAlyJceMnOXiXjIGOc', '木鸟', '1', '浦东新区', '中国', '上海', 'zh_CN', 'http://wx.qlogo.cn/mmopen/AYfn0IKjIIOhiaZroibv4hticKSlOfCZu1LQ51RLDyLHusoKiazwtAJHyo7MwYRCFvQWnsfIPW2L9gQCgLY9Bqr9zcTz7uyTjbSf/0');
INSERT INTO `subscriber` VALUES ('18', 'oxeU2uG0W_LF4MNfLbCRQDYNvi0g', '南念', '1', '浦东新区', '中国', '上海', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5SQ2KJHLVO41iaVMY4XPOxKJLefLfAAyOqhtgwTP1SdXHPBD5m1qGtv67B2wXfKlCaVF5dGXChicRA/0');
INSERT INTO `subscriber` VALUES ('19', 'okPUDt6m3kDv6AHlUuTcZlfF1ZJI', '@陈明炜 [呲牙]', '1', '海口', '中国', '海南', 'zh_CN', 'http://wx.qlogo.cn/mmopen/ib2Bx9AChN1dONY4Hib9qlzdmkfuHYem1icgX90u9fiaLbZnNBnXPA4TyZsQso2vicTsQKkZtxId6vvBJicrUX9icb5bYcUvVkCxmSy/0');

-- ----------------------------
-- Table structure for `user`
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
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398160886', '0', '10', '31.325430', '121.594994', '16.000000', null);
INSERT INTO `user` VALUES ('3', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398178052', '0', '5', '31.325437', '121.594990', '17.000000', null);
INSERT INTO `user` VALUES ('4', 'okPUDt7bteacEqkYuo1h35holOt0', '1397020949', '0', '1', null, null, null, null);
INSERT INTO `user` VALUES ('5', 'okPUDty-hCcDY2Pqz3rZKIAAZ76c', '1397723303', '0', '2', null, null, null, null);
INSERT INTO `user` VALUES ('6', 'okPUDt20dQIIpn0RmHdYTOX9Fwis', '1397023211', '0', '1', null, null, null, null);
INSERT INTO `user` VALUES ('7', 'okPUDt-bQG255wHG8Omn3XXIHWvs', '1397218407', '0', '3', null, null, null, null);
INSERT INTO `user` VALUES ('8', 'okPUDtyAf189CMqEq0Wf0aH-YGVo', '1397218426', '0', '2', null, null, null, null);
INSERT INTO `user` VALUES ('10', 'okPUDt9mjQmCNfH6rXV0sffTxiPQ', '1397134405', '0', '1', null, null, null, null);
INSERT INTO `user` VALUES ('9', 'okPUDt3zgu1Ub90yL_w-slzvYWic', '1397717397', '0', '2', null, null, null, null);
INSERT INTO `user` VALUES ('11', 'okPUDt-oIvPeYANJ9a2ldXiRhkyk', '1397217369', '0', '1', null, null, null, null);
INSERT INTO `user` VALUES ('13', 'oxeU2uMumfbpFtGx-JExt99kekDk', '1397736587', '1', '1', null, null, null, null);
INSERT INTO `user` VALUES ('12', 'okPUDt10VZJDRnmirHcCp7zW04kQ', '1397713024', '1', '1', null, null, null, null);
INSERT INTO `user` VALUES ('14', 'oxeU2uKMHJeF65Kpwxh4z4lQW6aY', '1397747408', '0', '3', null, null, null, '212ffc66-4da8-4ae9-b5af-791a374bec31');
INSERT INTO `user` VALUES ('15', 'oxeU2uLkwisAlyJceMnOXiXjIGOc', '1397738784', '0', '1', null, null, null, '52f4ad57-e4ef-4997-8585-91d2a0aaf92c');
INSERT INTO `user` VALUES ('16', 'oxeU2uG0W_LF4MNfLbCRQDYNvi0g', '1397739232', '0', '1', null, null, null, '16b8d89e-9c1c-4010-a7ce-d4aa20d9449f');
INSERT INTO `user` VALUES ('17', 'okPUDt6m3kDv6AHlUuTcZlfF1ZJI', '1397985371', '0', '1', null, null, null, null);
