/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : afl

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2014-04-30 11:27:29
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

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
INSERT INTO `bill` VALUES ('85', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 12:19:32', '231.00', '1', '1f44f882-d207-4461-b7ea-eac3e6497411', '14', '1', '2014-04-26 13:10:23', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('86', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 14:44:46', '51.00', '0', '721b075d-33b5-49a5-8b9c-a4b9a9474bed', '14', '0', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('87', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 00:51:10', '382.00', '0', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '14', '0', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('88', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 00:51:21', '0.00', '0', '8a677d69-e897-4568-b5db-d208db5dc8c7', '3', '1', '2014-04-27 08:58:10', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '0');
INSERT INTO `bill` VALUES ('89', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 10:09:36', '198.00', '0', 'e0cd179c-c8ca-4127-8d5a-5c866af391f5', '3', '0', null, null, 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '0');
INSERT INTO `bill` VALUES ('90', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-28 17:24:39', '300.00', '0', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '14', '1', '2014-04-28 23:32:05', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('91', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 19:03:14', '72.00', '0', 'f6edaf63-16e2-4ac0-ae0c-7fd363aba87e', '14', '1', '2014-04-28 23:32:05', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('92', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 19:54:25', '0.00', '0', 'ac067014-2962-4541-97cc-0f92f80e998f', '14', '1', '2014-04-28 23:32:05', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('93', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 20:24:09', '0.00', '0', '58763151-502f-417c-aea6-bb4d3adf279f', '14', '1', '2014-04-28 23:32:05', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('94', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 20:24:54', '0.00', '0', '5e46c9dd-6213-46f2-a4a2-2ff49e880036', '14', '1', '2014-04-28 23:32:05', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('95', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-28 22:50:58', '0.00', '0', 'fe5388d7-f735-4f4c-9e13-273270476e5b', '14', '1', '2014-04-28 23:32:05', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('96', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-28 22:59:08', '0.00', '0', 'f0c871f0-2ab6-469e-916b-450b149aff23', '14', '1', '2014-04-28 23:32:05', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('97', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 10:39:59', '111.00', '0', 'e57277d4-30a0-424e-a5fa-dbcc1a6d4866', '14', '1', '2014-04-29 13:53:05', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('98', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 13:19:57', '155.00', '0', '9922aee7-15ce-4909-8176-761f1a166b9e', '14', '1', '2014-04-29 13:53:05', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('99', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 13:22:17', '0.00', '0', '59450227-ffa4-4d25-a3aa-5bdd839819e4', '14', '1', '2014-04-29 13:53:05', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('100', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 18:02:08', '44.00', '0', '70f59f32-5e32-4d55-a0cc-5995936f30b4', '14', '0', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('101', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '2014-04-29 21:09:49', '33.00', '1', '0bf3b6e9-7839-4804-a687-5d31e2aa26d1', '14', '0', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');
INSERT INTO `bill` VALUES ('102', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '2014-04-29 22:55:41', '145.00', '0', '364507ee-1f01-4aa3-abfb-6365ec4f8b4f', '14', '0', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0');

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
  `date_time` datetime DEFAULT NULL,
  `audit_handler` varchar(255) DEFAULT NULL COMMENT '审核者',
  `audit_date_time` datetime DEFAULT NULL,
  `days` bigint(20) DEFAULT NULL COMMENT '使用天数',
  `login_times` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES ('14', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '天下一绝', '上海市浦东新区外高桥庭安路825弄', 'xiweicheng@yeah.net', '这里是美食天堂……', '18721764335', '100', null, '1', '0', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '1', '2014-04-28 16:45:05', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:08:05', '3650', null);
INSERT INTO `business` VALUES ('15', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '0', '戴安娜', '法国进口', '547538651@qq.com', '法赫卡里了', '17712345678', '100', '840762', '0', '0', null, '1', '2014-04-28 23:06:17', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 23:14:40', '3650', null);

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
  `handler` varchar(255) DEFAULT NULL,
  `handle_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_consumer
-- ----------------------------
INSERT INTO `business_consumer` VALUES ('21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '20', '2014-04-29 21:16:31', '14', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 10:41:14');
INSERT INTO `business_consumer` VALUES ('22', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '10', '2014-04-29 23:16:49', '14', 'd5783afb-5fa8-4e52-b887-e8786405f880', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 23:03:13');
INSERT INTO `business_consumer` VALUES ('23', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2', '2014-04-27 08:51:52', null, null, '0', null, null);
INSERT INTO `business_consumer` VALUES ('24', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt3zgu1Ub90yL_w-slzvYWic', '1', '2014-04-29 20:52:23', null, null, '0', null, null);
INSERT INTO `business_consumer` VALUES ('25', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '2', '2014-04-29 21:11:15', null, null, '0', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_consumer_record
-- ----------------------------
INSERT INTO `business_consumer_record` VALUES ('24', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-25 21:07:03', '14', '1f44f882-d207-4461-b7ea-eac3e6497411', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('25', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 12:56:39', '14', '721b075d-33b5-49a5-8b9c-a4b9a9474bed', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('26', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 14:45:09', '14', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('27', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-27 00:52:05', '14', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('28', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 08:51:52', '3', 'e0cd179c-c8ca-4127-8d5a-5c866af391f5', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('29', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 10:09:53', '14', 'f6edaf63-16e2-4ac0-ae0c-7fd363aba87e', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('30', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-28 22:43:43', '14', 'fe5388d7-f735-4f4c-9e13-273270476e5b', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('31', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 13:20:13', '14', '59450227-ffa4-4d25-a3aa-5bdd839819e4', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('32', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 13:22:32', '14', '70f59f32-5e32-4d55-a0cc-5995936f30b4', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('33', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 18:02:17', '14', 'f647b92d-15ef-494c-80f7-ea1d74977461', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('34', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt3zgu1Ub90yL_w-slzvYWic', '2014-04-29 20:52:23', '14', '2cbe942e-92d3-4b7a-ae52-df82aaf2f47c', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('35', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '2014-04-29 20:56:56', '14', '0bf3b6e9-7839-4804-a687-5d31e2aa26d1', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('36', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '2014-04-29 21:11:15', '14', '364507ee-1f01-4aa3-abfb-6365ec4f8b4f', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('37', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 21:16:31', '14', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '0', '0');
INSERT INTO `business_consumer_record` VALUES ('38', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-29 23:16:49', '14', 'd5783afb-5fa8-4e52-b887-e8786405f880', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_role
-- ----------------------------
INSERT INTO `business_role` VALUES ('1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2', '0', '2014-04-13 12:53:38');
INSERT INTO `business_role` VALUES ('2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3', '0', '2014-04-13 12:53:38');
INSERT INTO `business_role` VALUES ('3', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1', '0', '2014-04-13 14:58:28');
INSERT INTO `business_role` VALUES ('4', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '0', '2014-04-13 14:59:27');
INSERT INTO `business_role` VALUES ('5', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '0', '2014-04-13 15:00:08');
INSERT INTO `business_role` VALUES ('6', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '0', '0', '2014-04-22 22:47:01');
INSERT INTO `business_role` VALUES ('7', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '0', '2014-04-23 21:52:48');
INSERT INTO `business_role` VALUES ('8', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '0', '2014-04-23 21:52:49');
INSERT INTO `business_role` VALUES ('9', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2', '0', '2014-04-23 22:18:21');
INSERT INTO `business_role` VALUES ('10', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt3zgu1Ub90yL_w-slzvYWic', '0', '0', '2014-04-29 20:42:09');
INSERT INTO `business_role` VALUES ('11', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '0', '0', '2014-04-29 20:56:42');

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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favorites
-- ----------------------------
INSERT INTO `favorites` VALUES ('31', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2', '2014-04-20 00:04:46', '0', '20140420');
INSERT INTO `favorites` VALUES ('32', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0', '2014-04-25 21:24:02', '0', null);
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
INSERT INTO `favorites` VALUES ('46', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3', '2014-04-25 21:23:50', '0', '20140425');
INSERT INTO `favorites` VALUES ('47', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '21', '1', '2014-04-25 23:42:48', '0', null);
INSERT INTO `favorites` VALUES ('48', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '33', '1', '2014-04-26 10:16:08', '0', null);
INSERT INTO `favorites` VALUES ('49', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2', '2014-04-26 14:52:08', '0', '20140426');
INSERT INTO `favorites` VALUES ('50', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '24', '1', '2014-04-26 14:51:16', '0', null);
INSERT INTO `favorites` VALUES ('51', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '25', '1', '2014-04-26 14:51:20', '0', null);
INSERT INTO `favorites` VALUES ('52', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2', '2014-04-27 00:52:30', '0', '20140427');
INSERT INTO `favorites` VALUES ('53', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2', '2014-04-28 20:32:52', '0', '20140428');
INSERT INTO `favorites` VALUES ('54', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2', '2014-04-28 22:43:57', '0', '20140428');
INSERT INTO `favorites` VALUES ('55', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '21', '1', '2014-04-29 21:02:39', '0', null);
INSERT INTO `favorites` VALUES ('56', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '29', '1', '2014-04-29 21:04:01', '0', null);
INSERT INTO `favorites` VALUES ('57', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2', '2014-04-29 22:26:43', '0', '20140429');
INSERT INTO `favorites` VALUES ('58', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '20', '1', '2014-04-29 23:24:49', '0', null);
INSERT INTO `favorites` VALUES ('59', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '21', '1', '2014-04-29 23:24:52', '0', null);

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
  `tags` varchar(255) DEFAULT NULL COMMENT '菜单标签说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('20', '蓝莓山药', '36', '12.00', '0.00', '24', '', '71', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:37:06', '14', null);
INSERT INTO `menu` VALUES ('21', '长寿菜', '36', '9.00', '0.00', '30', '长寿菜，又名叶用甘薯，俗称白薯叶、番薯叶、地瓜叶，是甘薯的叶、叶柄和芽梢部，学名Ipomoea atatas (L. ) Lam. ，为旋花科(Convolvulaceae)牵牛花属草本匍匐性蔓生植物。在热带为多年生。原产于热带美洲。现广泛栽培于全世界热带和亚热带地区。我国南北各地都有栽培，以收获地下块根为主，叶蔓作饲料，民间也有采食叶作为粗菜。近年发现，薯叶中含丰富的营养物质，是维生素历、矿物质钾、钙之来源，而且其病虫害甚少，很少使用农药，比其他叶菜类较抗暴风雨，生长迅速，为良好的夏季叶菜。它在人们追求享受自然的风味中获得重视，在台湾省它作为一种优良的深绿色蔬菜发展很快。', '85', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:42:09', '12', null);
INSERT INTO `menu` VALUES ('22', '外婆烤肉', '38', '29.00', '0.00', '31', '能说的只能是赞了……', '86', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:45:07', '1', null);
INSERT INTO `menu` VALUES ('23', '大烤茄子', '38', '10.00', '0.00', '30', '', '75', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:47:21', '2', null);
INSERT INTO `menu` VALUES ('24', '外婆黑米糕', '40', '15.00', '0.00', '24', '', '79', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:48:02', '1', null);
INSERT INTO `menu` VALUES ('25', '绿茶饼', '40', '12.00', '0.00', '24', '', '76', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:48:51', '3', null);
INSERT INTO `menu` VALUES ('26', '双皮奶', '45', '10.00', '0.00', '24', '', '74', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:50:14', '4', null);
INSERT INTO `menu` VALUES ('27', '花生绵绵冰', '45', '18.00', '0.00', '24', '', '72', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:51:24', '8', null);
INSERT INTO `menu` VALUES ('28', '想吃土豆', '37', '10.00', '0.00', '29', '', '82', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:52:24', '6', null);
INSERT INTO `menu` VALUES ('29', '石锅牛蛙', '37', '42.00', '0.00', '26', '', '73', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:53:20', '5', null);
INSERT INTO `menu` VALUES ('30', '糖醋里脊', '37', '18.00', '0.00', '30', '', '77', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:54:06', '11', null);
INSERT INTO `menu` VALUES ('31', '茶树菇爆鲜鱿', '37', '25.00', '0.00', '30', '', '83', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:54:55', '4', null);
INSERT INTO `menu` VALUES ('32', '蒜蓉粉丝虾', '37', '35.00', '0.00', '30', '', '80', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:55:37', '7', null);
INSERT INTO `menu` VALUES ('33', '有机花菜', '41', '16.00', '0.00', '30', '', '87', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:56:23', '5', null);
INSERT INTO `menu` VALUES ('34', '鸡毛菜烩蘑菇', '41', '12.00', '0.00', '30', '', '78', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:57:33', '3', null);
INSERT INTO `menu` VALUES ('35', '冰桔茶', '44', '8.00', '0.00', '23', '', '84', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:58:20', '5', null);
INSERT INTO `menu` VALUES ('36', '玉米汁', '44', '15.00', '0.00', '24', '', '81', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-19 23:59:05', '5', null);
INSERT INTO `menu` VALUES ('37', '妈咪宝贝', '46', '99.00', '0.00', '32', '美味可口！', '89', '0', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 22:03:49', '0', null);
INSERT INTO `menu` VALUES ('38', '妈妈咪呀', '47', '998.00', '0.00', '33', '无言以表！', '88', '0', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 22:06:28', '0', null);

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
  `memo` varchar(500) DEFAULT NULL COMMENT '点餐备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_bill
-- ----------------------------
INSERT INTO `menu_bill` VALUES ('200', '27', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '2014-04-20 00:16:24', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', null);
INSERT INTO `menu_bill` VALUES ('201', '36', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '2014-04-20 00:16:34', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', null);
INSERT INTO `menu_bill` VALUES ('202', '25', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '2014-04-20 00:16:50', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', null);
INSERT INTO `menu_bill` VALUES ('203', '30', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '2014-04-20 00:17:01', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', null);
INSERT INTO `menu_bill` VALUES ('204', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '2014-04-20 08:13:29', '3', '14', '4', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('205', '28', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '3ec0f0d7-23ab-4094-a997-f100425c3f14', '2014-04-20 00:22:29', '3', '14', '2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('206', '20', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-20 00:27:50', '3', '14', '2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('207', '29', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-20 00:27:57', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('208', '23', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-20 00:28:31', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('209', '20', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c679501b-494b-4187-8113-25c036a3b69c', '2014-04-20 10:49:19', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('210', '20', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-20 11:42:51', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('211', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-20 11:42:59', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('212', '32', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-20 12:01:30', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('213', '31', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-20 12:07:20', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('214', '30', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-21 17:57:20', '3', '14', '2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('215', '28', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 13:09:20', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', null);
INSERT INTO `menu_bill` VALUES ('216', '26', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 08:01:43', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('217', '24', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 11:58:52', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('218', '29', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 08:01:27', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('219', '36', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 11:46:38', '3', '14', '2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('220', '34', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-21 22:16:51', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('221', '21', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-23 22:25:50', '1', '14', '1', null, null);
INSERT INTO `menu_bill` VALUES ('222', '25', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 08:01:36', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('223', '27', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 11:46:42', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('224', '33', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 11:47:15', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('225', '35', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 21:46:31', '1', '14', '1', null, null);
INSERT INTO `menu_bill` VALUES ('226', '22', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 21:46:36', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', null);
INSERT INTO `menu_bill` VALUES ('227', '23', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '704c39f7-1986-467a-9dd6-b086301d709e', '2014-04-23 21:46:38', '1', '14', '1', null, null);
INSERT INTO `menu_bill` VALUES ('228', '38', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '8a677d69-e897-4568-b5db-d208db5dc8c7', '2014-04-23 22:13:24', '3', '3', '1', null, null);
INSERT INTO `menu_bill` VALUES ('229', '28', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-23 22:22:47', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('230', '30', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-23 22:25:13', '2', '14', '1', null, null);
INSERT INTO `menu_bill` VALUES ('231', '32', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-23 22:25:10', '2', '14', '1', null, null);
INSERT INTO `menu_bill` VALUES ('232', '31', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '724c387f-219b-49aa-ab7b-76cf1309c734', '2014-04-23 22:25:38', '2', '14', '1', null, null);
INSERT INTO `menu_bill` VALUES ('233', '30', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '594ebe7e-8438-49e3-8bb4-a616acde00c8', '2014-04-23 23:06:48', '1', '14', '1', null, null);
INSERT INTO `menu_bill` VALUES ('234', '32', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '594ebe7e-8438-49e3-8bb4-a616acde00c8', '2014-04-23 23:06:52', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', null);
INSERT INTO `menu_bill` VALUES ('235', '21', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '594ebe7e-8438-49e3-8bb4-a616acde00c8', '2014-04-23 23:07:45', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', null);
INSERT INTO `menu_bill` VALUES ('236', '31', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '594ebe7e-8438-49e3-8bb4-a616acde00c8', '2014-04-23 23:07:50', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('237', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'af62e20e-d736-49f0-aff2-2907e9ee9e02', '2014-04-23 23:08:30', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', null);
INSERT INTO `menu_bill` VALUES ('238', '32', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'af62e20e-d736-49f0-aff2-2907e9ee9e02', '2014-04-23 23:08:36', '3', '14', '1', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', null);
INSERT INTO `menu_bill` VALUES ('239', '34', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'af62e20e-d736-49f0-aff2-2907e9ee9e02', '2014-04-23 23:29:50', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('240', '27', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'af62e20e-d736-49f0-aff2-2907e9ee9e02', '2014-04-23 23:30:00', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('241', '20', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '2014-04-25 23:43:48', '3', '14', '3', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('242', '30', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '2014-04-25 23:42:57', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('243', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '2014-04-26 00:33:09', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('244', '33', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '2014-04-26 10:16:02', '3', '14', '3', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('245', '35', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '2014-04-26 10:16:24', '3', '14', '5', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('246', '32', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '2014-04-26 10:17:12', '3', '14', '2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('247', '28', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '2014-04-26 11:57:49', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('248', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '721b075d-33b5-49a5-8b9c-a4b9a9474bed', '2014-04-26 13:13:11', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('249', '29', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '721b075d-33b5-49a5-8b9c-a4b9a9474bed', '2014-04-26 13:13:20', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null);
INSERT INTO `menu_bill` VALUES ('250', '20', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '721b075d-33b5-49a5-8b9c-a4b9a9474bed', '2014-04-26 14:28:19', '0', '14', '1', null, null);
INSERT INTO `menu_bill` VALUES ('251', '36', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '721b075d-33b5-49a5-8b9c-a4b9a9474bed', '2014-04-26 14:28:39', '0', '14', '2', null, null);
INSERT INTO `menu_bill` VALUES ('252', '20', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '2014-04-26 14:46:14', '3', '14', '2', null, null);
INSERT INTO `menu_bill` VALUES ('253', '29', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '2014-04-26 14:46:53', '3', '14', '3', null, null);
INSERT INTO `menu_bill` VALUES ('254', '28', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '2014-04-26 14:47:16', '3', '14', '4', null, null);
INSERT INTO `menu_bill` VALUES ('255', '23', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '2014-04-26 14:47:22', '3', '14', '2', null, null);
INSERT INTO `menu_bill` VALUES ('256', '22', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '2014-04-26 14:47:26', '3', '14', '2', null, null);
INSERT INTO `menu_bill` VALUES ('257', '34', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '2014-04-26 14:47:30', '3', '14', '2', null, null);
INSERT INTO `menu_bill` VALUES ('258', '24', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '2014-04-26 14:51:06', '3', '14', '1', null, null);
INSERT INTO `menu_bill` VALUES ('259', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '2014-04-26 23:38:45', '3', '14', '1', null, null);
INSERT INTO `menu_bill` VALUES ('260', '30', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '2014-04-26 23:40:35', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '大份');
INSERT INTO `menu_bill` VALUES ('261', '31', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '2014-04-26 23:45:43', '3', '14', '1', null, '不要太辣');
INSERT INTO `menu_bill` VALUES ('262', '36', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '2014-04-27 00:00:59', '3', '14', '1', null, '大杯');
INSERT INTO `menu_bill` VALUES ('263', '35', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '2014-04-27 00:34:59', '3', '14', '1', null, '特大杯');
INSERT INTO `menu_bill` VALUES ('264', '20', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '2014-04-27 00:58:06', '3', '14', '2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '大份 不要辣');
INSERT INTO `menu_bill` VALUES ('265', '33', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '2014-04-27 00:59:15', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '不要放cun');
INSERT INTO `menu_bill` VALUES ('266', '36', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '2014-04-27 00:59:47', '3', '14', '2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '大杯');
INSERT INTO `menu_bill` VALUES ('267', '31', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '2014-04-27 01:00:09', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('268', '30', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '2014-04-27 01:01:49', '3', '14', '4', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('269', '21', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '2014-04-27 01:02:35', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('270', '25', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '2014-04-27 01:03:35', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('271', '37', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'e0cd179c-c8ca-4127-8d5a-5c866af391f5', '2014-04-27 08:53:24', '3', '3', '2', null, '加料哦');
INSERT INTO `menu_bill` VALUES ('272', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f6edaf63-16e2-4ac0-ae0c-7fd363aba87e', '2014-04-27 10:10:11', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('273', '31', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f6edaf63-16e2-4ac0-ae0c-7fd363aba87e', '2014-04-27 10:10:19', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('274', '32', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '2014-04-27 13:58:26', '3', '14', '2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('275', '29', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '2014-04-27 13:58:38', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('276', '26', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f6edaf63-16e2-4ac0-ae0c-7fd363aba87e', '2014-04-27 20:57:43', '3', '14', '2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('277', '27', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f6edaf63-16e2-4ac0-ae0c-7fd363aba87e', '2014-04-27 20:57:50', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('278', '20', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f6edaf63-16e2-4ac0-ae0c-7fd363aba87e', '2014-04-28 17:22:35', '2', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('279', '29', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f6edaf63-16e2-4ac0-ae0c-7fd363aba87e', '2014-04-28 17:22:31', '2', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('280', '20', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'e57277d4-30a0-424e-a5fa-dbcc1a6d4866', '2014-04-29 10:34:00', '3', '14', '2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('281', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'e57277d4-30a0-424e-a5fa-dbcc1a6d4866', '2014-04-29 10:34:05', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('282', '30', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'e57277d4-30a0-424e-a5fa-dbcc1a6d4866', '2014-04-29 10:34:12', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('283', '31', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'e57277d4-30a0-424e-a5fa-dbcc1a6d4866', '2014-04-29 10:35:06', '3', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('284', '32', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'e57277d4-30a0-424e-a5fa-dbcc1a6d4866', '2014-04-29 10:35:14', '3', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('285', '24', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'e57277d4-30a0-424e-a5fa-dbcc1a6d4866', '2014-04-29 10:35:45', '0', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('286', '26', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'e57277d4-30a0-424e-a5fa-dbcc1a6d4866', '2014-04-29 10:37:27', '0', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('287', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '9922aee7-15ce-4909-8176-761f1a166b9e', '2014-04-29 10:41:24', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('288', '20', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '9922aee7-15ce-4909-8176-761f1a166b9e', '2014-04-29 10:41:34', '3', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('289', '28', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '9922aee7-15ce-4909-8176-761f1a166b9e', '2014-04-29 10:42:05', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('290', '32', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '9922aee7-15ce-4909-8176-761f1a166b9e', '2014-04-29 12:42:57', '3', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('291', '30', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '9922aee7-15ce-4909-8176-761f1a166b9e', '2014-04-29 12:43:01', '3', '14', '3', null, '');
INSERT INTO `menu_bill` VALUES ('292', '31', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '9922aee7-15ce-4909-8176-761f1a166b9e', '2014-04-29 12:43:21', '3', '14', '1', null, '加辣点');
INSERT INTO `menu_bill` VALUES ('293', '23', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '9922aee7-15ce-4909-8176-761f1a166b9e', '2014-04-29 12:46:35', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '大大大大大大大大大大大大大大的大大的大大的大大的多点点滴滴的');
INSERT INTO `menu_bill` VALUES ('294', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '70f59f32-5e32-4d55-a0cc-5995936f30b4', '2014-04-29 17:33:19', '3', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('295', '32', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '70f59f32-5e32-4d55-a0cc-5995936f30b4', '2014-04-29 17:33:22', '3', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('296', '29', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '70f59f32-5e32-4d55-a0cc-5995936f30b4', '2014-04-29 17:33:41', '2', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('297', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f647b92d-15ef-494c-80f7-ea1d74977461', '2014-04-29 20:48:06', '3', '14', '1', 'okPUDt3zgu1Ub90yL_w-slzvYWic', '');
INSERT INTO `menu_bill` VALUES ('298', '20', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f647b92d-15ef-494c-80f7-ea1d74977461', '2014-04-29 20:48:29', '3', '14', '2', null, '加辣');
INSERT INTO `menu_bill` VALUES ('299', '20', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '0bf3b6e9-7839-4804-a687-5d31e2aa26d1', '2014-04-29 21:08:23', '2', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('300', '21', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '0bf3b6e9-7839-4804-a687-5d31e2aa26d1', '2014-04-29 21:02:55', '0', '14', '2', null, '');
INSERT INTO `menu_bill` VALUES ('301', '32', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '0bf3b6e9-7839-4804-a687-5d31e2aa26d1', '2014-04-29 21:03:26', '0', '14', '5', null, '');
INSERT INTO `menu_bill` VALUES ('302', '29', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '0bf3b6e9-7839-4804-a687-5d31e2aa26d1', '2014-04-29 21:03:56', '0', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('303', '30', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '0bf3b6e9-7839-4804-a687-5d31e2aa26d1', '2014-04-29 21:04:13', '0', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('304', '31', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '0bf3b6e9-7839-4804-a687-5d31e2aa26d1', '2014-04-29 21:04:30', '0', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('305', '34', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '0bf3b6e9-7839-4804-a687-5d31e2aa26d1', '2014-04-29 21:05:16', '0', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('306', '35', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '0bf3b6e9-7839-4804-a687-5d31e2aa26d1', '2014-04-29 21:06:48', '0', '14', '1', null, '544556663228964466224562145632156321156221563214632176621556');
INSERT INTO `menu_bill` VALUES ('307', '21', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '364507ee-1f01-4aa3-abfb-6365ec4f8b4f', '2014-04-29 21:14:26', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '谷啦啦啦啦啦啦啦啦啦啦啦啦啦。。。。。。，，，，，，，，，，。。。。。。。，！？。，.g@aemjguw@dmdajg1dgte1jmdahtn@xm-mda-ndawtjeja1pkgtmdahtndaj@?.,!pWndktpg1amwweek-Manuka.! :Oalt;-)Emmy');
INSERT INTO `menu_bill` VALUES ('308', '20', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '364507ee-1f01-4aa3-abfb-6365ec4f8b4f', '2014-04-29 21:15:34', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'Planksmjmjpmjmjjdpdjpjdpdjpjpj Plutoniumtmmmmtmtmmmtmtmtmtjpj Lisa');
INSERT INTO `menu_bill` VALUES ('309', '29', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '364507ee-1f01-4aa3-abfb-6365ec4f8b4f', '2014-04-29 21:17:10', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'Planksmjmjpmjmjjdpdjpjdpdjpjpj Plutoniumtmmmmtmtmmmtmtmtmtjpj Lisa');
INSERT INTO `menu_bill` VALUES ('310', '28', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '364507ee-1f01-4aa3-abfb-6365ec4f8b4f', '2014-04-29 21:17:29', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'Planksmjmjpmjmjjdpdjpjdpdjpjpj Plutoniumtmmmmtmtmmmtmtmtmtjpj Lisa');
INSERT INTO `menu_bill` VALUES ('311', '31', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '364507ee-1f01-4aa3-abfb-6365ec4f8b4f', '2014-04-29 21:24:07', '2', '14', '1', null, 'Planksmjmjpmjmjjdpdjpjdpdjpjpj Plutoniumtmmmmtmtmmmtmtmtmtjpj Lisa');
INSERT INTO `menu_bill` VALUES ('312', '27', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '364507ee-1f01-4aa3-abfb-6365ec4f8b4f', '2014-04-29 21:23:22', '3', '14', '4', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'oniumtmmmmtmtmmmtmtmtmtjpj Lisa');
INSERT INTO `menu_bill` VALUES ('313', '20', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '2014-04-29 21:23:43', '3', '14', '2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('314', '26', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '2014-04-29 21:23:53', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '');
INSERT INTO `menu_bill` VALUES ('315', '32', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '2014-04-29 22:31:40', '1', '14', '2', null, '');
INSERT INTO `menu_bill` VALUES ('316', '21', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '2014-04-29 22:42:25', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '冯达飞地方对方答复对方的风格大方给的风格的风格大方个的风格的风格大方个大范甘迪梵蒂冈的风格的风格大方个梵蒂冈的风格的风格大方个的风格的风格大方个的的风格的风格的');
INSERT INTO `menu_bill` VALUES ('317', '30', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '2014-04-29 22:46:55', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '谁谁谁谁谁谁谁谁谁谁谁谁水水水水撒谁谁谁');
INSERT INTO `menu_bill` VALUES ('318', '34', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '2014-04-29 22:47:19', '3', '14', '1', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '凤飞飞凤飞飞凤飞飞飞凤飞飞方法方法方法方');
INSERT INTO `menu_bill` VALUES ('319', '28', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '2014-04-29 22:47:26', '1', '14', '1', null, '方法方法法');
INSERT INTO `menu_bill` VALUES ('320', '29', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '2014-04-29 22:55:00', '1', '14', '1', null, '方法');
INSERT INTO `menu_bill` VALUES ('321', '31', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '2014-04-29 22:55:05', '1', '14', '1', null, '哥哥给');
INSERT INTO `menu_bill` VALUES ('322', '36', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '2014-04-29 22:55:13', '1', '14', '1', null, '放放风');
INSERT INTO `menu_bill` VALUES ('323', '33', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '2014-04-29 22:55:17', '1', '14', '1', null, '方法');
INSERT INTO `menu_bill` VALUES ('324', '23', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '2014-04-29 22:59:41', '0', '14', '1', null, '');
INSERT INTO `menu_bill` VALUES ('325', '20', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'd5783afb-5fa8-4e52-b887-e8786405f880', '2014-04-29 23:23:41', '0', '14', '3', null, '加辣');
INSERT INTO `menu_bill` VALUES ('326', '32', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'd5783afb-5fa8-4e52-b887-e8786405f880', '2014-04-29 23:24:57', '0', '14', '1', null, '');

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
  `scene_id` bigint(20) DEFAULT NULL,
  `recognition` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1387 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('944', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398148440', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 14:32:54', '0', null, null, null);
INSERT INTO `message` VALUES ('945', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398148463', 'text', '旅途愉快', '6005001923737824488', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 14:33:14', '1', null, null, null);
INSERT INTO `message` VALUES ('946', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398150010', 'image', null, '6005008568052231489', 'http://mmbiz.qpic.cn/mmbiz/66aY7oYxBvibktjWNAkCdSgobdTfe2Vy0FLNlyXa9JgtmWs7e6YR2q50tdDTEicNz1ZLJicIpIO5BvU7dK9Odsyjg/0', 'cmNNDjQ3MPu2jnDOYKXdDdh4nNAdbYHggBfFJete3dEMYZYgAS47P0QlQlMd-5ZD', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 14:59:01', '2', null, null, null);
INSERT INTO `message` VALUES ('947', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398155880', 'text', '好咯哦哦咯莫莫YY图www讨厌我那我们www', '6005033779510259502', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 16:36:51', '1', null, null, null);
INSERT INTO `message` VALUES ('948', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398155957', 'text', '回来咯哦哟魔域他体育中心知我者为我心忧杨永向哦www我', '6005034110222741303', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 16:38:10', '1', null, null, null);
INSERT INTO `message` VALUES ('949', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398156295', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 16:43:46', '0', null, null, null);
INSERT INTO `message` VALUES ('950', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398160875', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'unsubscribe', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 18:00:08', '0', null, null, null);
INSERT INTO `message` VALUES ('951', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398160886', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'subscribe', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 18:00:17', '0', null, null, null);
INSERT INTO `message` VALUES ('952', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398160896', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 18:00:26', '0', null, null, null);
INSERT INTO `message` VALUES ('953', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398160991', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 18:02:02', '0', null, null, null);
INSERT INTO `message` VALUES ('954', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398161355', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 18:08:06', '0', null, null, null);
INSERT INTO `message` VALUES ('955', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398174753', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 21:51:24', '0', null, null, null);
INSERT INTO `message` VALUES ('956', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398176297', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:17:07', '0', null, null, null);
INSERT INTO `message` VALUES ('957', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398176302', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:17:14', '0', null, null, null);
INSERT INTO `message` VALUES ('958', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398176544', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:21:15', '0', null, null, null);
INSERT INTO `message` VALUES ('959', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398176560', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:21:32', '0', null, null, null);
INSERT INTO `message` VALUES ('960', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398176575', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:21:45', '0', null, null, null);
INSERT INTO `message` VALUES ('961', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398178057', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:46:37', '0', null, null, null);
INSERT INTO `message` VALUES ('962', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398178051', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'unsubscribe', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:46:41', '0', null, null, null);
INSERT INTO `message` VALUES ('963', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398178052', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'subscribe', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:46:43', '0', null, null, null);
INSERT INTO `message` VALUES ('964', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398178091', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '24', '0.000000', '0.000000', '0.000000', 'gQEc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL19Vd0tYMnZscW9UVHNWMEExR0JVAAIE8jBJUwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:47:01', '0', null, null, null);
INSERT INTO `message` VALUES ('965', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398178107', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:47:16', '0', null, null, null);
INSERT INTO `message` VALUES ('966', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398178512', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:54:02', '0', null, null, null);
INSERT INTO `message` VALUES ('967', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398178591', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:55:22', '0', null, null, null);
INSERT INTO `message` VALUES ('968', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398178635', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 22:56:05', '0', null, null, null);
INSERT INTO `message` VALUES ('969', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398179129', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 23:04:19', '0', null, null, null);
INSERT INTO `message` VALUES ('970', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398179183', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 23:05:13', '0', null, null, null);
INSERT INTO `message` VALUES ('971', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398179409', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-22 23:09:00', '0', null, null, null);
INSERT INTO `message` VALUES ('972', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398206810', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:45:39', '0', null, null, null);
INSERT INTO `message` VALUES ('973', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398206814', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:45:43', '0', null, null, null);
INSERT INTO `message` VALUES ('974', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398207123', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:50:53', '0', null, null, null);
INSERT INTO `message` VALUES ('975', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398207129', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:50:58', '0', null, null, null);
INSERT INTO `message` VALUES ('976', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398207136', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:51:06', '0', null, null, null);
INSERT INTO `message` VALUES ('977', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398207139', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:51:09', '0', null, null, null);
INSERT INTO `message` VALUES ('978', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398207142', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:51:12', '0', null, null, null);
INSERT INTO `message` VALUES ('979', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398207159', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:51:28', '0', null, null, null);
INSERT INTO `message` VALUES ('980', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210023', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:39:14', '0', null, null, null);
INSERT INTO `message` VALUES ('981', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210406', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:45:36', '0', null, null, null);
INSERT INTO `message` VALUES ('982', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210409', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:45:38', '0', null, null, null);
INSERT INTO `message` VALUES ('983', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210447', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:46:17', '0', null, null, null);
INSERT INTO `message` VALUES ('984', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210459', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:46:29', '0', null, null, null);
INSERT INTO `message` VALUES ('985', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210507', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:47:17', '0', null, null, null);
INSERT INTO `message` VALUES ('986', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210518', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:47:27', '0', null, null, null);
INSERT INTO `message` VALUES ('987', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398210548', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 07:47:58', '0', null, null, null);
INSERT INTO `message` VALUES ('988', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398211325', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 08:00:55', '0', null, null, null);
INSERT INTO `message` VALUES ('989', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398211342', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 08:01:12', '0', null, null, null);
INSERT INTO `message` VALUES ('990', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398218938', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 10:07:50', '0', null, null, null);
INSERT INTO `message` VALUES ('991', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398234442', 'text', 'gggh', '6005371200730970538', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:26:12', '1', null, null, null);
INSERT INTO `message` VALUES ('992', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398234895', 'text', 'cvvvbbb', '6005373146351155652', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:33:49', '1', null, null, null);
INSERT INTO `message` VALUES ('993', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398235009', 'text', 'vvbj考虑考虑', '6005373635977427404', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:35:39', '1', null, null, null);
INSERT INTO `message` VALUES ('994', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398235032', 'text', 'call旅途', '6005373734761675216', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:36:01', '1', null, null, null);
INSERT INTO `message` VALUES ('995', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398235037', 'text', 'V5哦OK咯没看见', '6005373756236511698', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:36:06', '1', null, null, null);
INSERT INTO `message` VALUES ('996', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398235042', 'text', 'CCTV咯米开朗基罗', '6005373777711348180', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:36:11', '1', null, null, null);
INSERT INTO `message` VALUES ('997', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398235147', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:37:57', '0', null, null, null);
INSERT INTO `message` VALUES ('998', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398235257', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:39:47', '0', null, null, null);
INSERT INTO `message` VALUES ('999', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398235867', 'text', '看看咯摸摸摸摸lz莫落寞到家了来咯呕吐辣的咯饿OK肯图路我到家了咯哦吐了恶疾咯KTV睡咯木头库洛姆考虑考虑KTV科技咯饿', '6005377321059367418', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 14:49:56', '1', null, null, null);
INSERT INTO `message` VALUES ('1000', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239348', 'text', '来咯莫', '6005392271840524936', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:47:57', '1', null, null, null);
INSERT INTO `message` VALUES ('1001', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239737', 'text', '来咯莫哦', '6005393942582803096', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:54:26', '1', null, null, null);
INSERT INTO `message` VALUES ('1002', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239753', 'text', '看看咯', '6005394011302279834', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:54:43', '1', null, null, null);
INSERT INTO `message` VALUES ('1003', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239763', 'text', '喔喔哦酷我默默', '6005394054251952798', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:54:53', '1', null, null, null);
INSERT INTO `message` VALUES ('1004', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239777', 'text', '咯OK拖Dell呢', '6005394114381494944', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:55:07', '1', null, null, null);
INSERT INTO `message` VALUES ('1005', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239783', 'text', '\'啊call门徒模块', '6005394140151298722', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:55:15', '1', null, null, null);
INSERT INTO `message` VALUES ('1006', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239807', 'image', null, '6005394243230513828', 'http://mmbiz.qpic.cn/mmbiz/66aY7oYxBv98324iar0STct8TUeysUpSsTCWFFndeRx3jrK5zwxHbqRhtsSBibiazEgTf8ZOmnE3Oz6ianhccWSoVQ/0', 'qgu7GPaTSEKww-N_RUOP5oIkFtJgJUHXOlv2N-7TZcl-dkFCkC3XqPVEFBVhlOLT', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:55:38', '2', null, null, null);
INSERT INTO `message` VALUES ('1007', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398239808', 'image', null, '6005394247525481125', 'http://mmbiz.qpic.cn/mmbiz/66aY7oYxBv98324iar0STct8TUeysUpSseIe7QlJFOmaQU63qmFjTJ3cMwYuja8YpI1Eic8MrZEFjmjmXzwuEHJg/0', '2i2GaCMgrgh1VsrkaY9hhdUnwEYKnaOcNvt8vHaJFKOoNiUU1f-1Gm3zVeW0g5GY', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:55:39', '2', null, null, null);
INSERT INTO `message` VALUES ('1008', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398240003', 'image', null, '6005395085044103854', 'http://mmbiz.qpic.cn/mmbiz/66aY7oYxBv98324iar0STct8TUeysUpSsd4vKNWd4Tzj2EfiatrLHDF8e5X48rytiawWiaezNZgVKUhG98jXL2tZFg/0', 'Fqc6_M4qwrxAbROzkEPQIj6HQRnwAz4wlATIkCq_USqbvOiyeI5HXf3qNNdqcygJ', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:58:53', '1', null, null, null);
INSERT INTO `message` VALUES ('1009', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398240016', 'image', null, '6005395140878678704', 'http://mmbiz.qpic.cn/mmbiz/66aY7oYxBv98324iar0STct8TUeysUpSsvqJK9tZufXnLzp30Zgs3cnwGIHdFeASA1QetND3ZicUYFYLsgcGRbPQ/0', 'kYhhYC24hqFvCJLyxvmDZn9StAOJMqIoIJ-B9BkPGKOs45rdKCzGiS995yjEUSF9', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 15:59:06', '1', null, null, null);
INSERT INTO `message` VALUES ('1010', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398240093', 'image', null, '6005395471591160501', 'http://mmbiz.qpic.cn/mmbiz/66aY7oYxBv98324iar0STct8TUeysUpSsCsicPe76e1sGIzXc3LbIBHuEuRmUGibBYsPXGGuGLice21AiaXXd3nmU0A/0', 'DLJasaIlNfYWDg-hM7YPBMABPXQTldRw9VY71vzZrbjycHWwF5kCryYDbme8A0h7', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 16:00:23', '1', null, null, null);
INSERT INTO `message` VALUES ('1011', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398241030', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 16:16:00', '0', '0', null, null);
INSERT INTO `message` VALUES ('1012', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245146', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:24:35', '0', null, null, null);
INSERT INTO `message` VALUES ('1013', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245149', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:24:39', '0', null, null, null);
INSERT INTO `message` VALUES ('1014', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245160', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:24:49', '0', null, null, null);
INSERT INTO `message` VALUES ('1015', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245165', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:24:54', '0', null, null, null);
INSERT INTO `message` VALUES ('1016', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245686', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:33:36', '0', null, null, null);
INSERT INTO `message` VALUES ('1017', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245699', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:33:48', '0', null, null, null);
INSERT INTO `message` VALUES ('1018', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245748', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:34:39', '0', null, null, null);
INSERT INTO `message` VALUES ('1019', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245804', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:35:33', '0', null, null, null);
INSERT INTO `message` VALUES ('1020', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398245892', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:37:03', '0', null, null, null);
INSERT INTO `message` VALUES ('1021', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398246043', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 17:39:37', '0', null, null, null);
INSERT INTO `message` VALUES ('1022', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398260749', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 21:44:44', '0', null, null, null);
INSERT INTO `message` VALUES ('1023', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398261068', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 21:49:58', '0', null, null, null);
INSERT INTO `message` VALUES ('1024', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398261238', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '1', '0.000000', '0.000000', '0.000000', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 21:52:48', '0', null, null, null);
INSERT INTO `message` VALUES ('1025', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398261239', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '1', '0.000000', '0.000000', '0.000000', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 21:52:49', '0', null, null, null);
INSERT INTO `message` VALUES ('1026', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398261337', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '3', '0.000000', '0.000000', '0.000000', 'gQGf8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2cweHpSampsMllTZ2dTY1RyV0JVAAIEpJUxUwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 21:54:26', '0', null, null, null);
INSERT INTO `message` VALUES ('1027', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398261669', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 21:59:59', '0', null, null, null);
INSERT INTO `message` VALUES ('1028', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262534', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:14:24', '0', null, null, null);
INSERT INTO `message` VALUES ('1029', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262771', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '1', '0.000000', '0.000000', '0.000000', 'gQGc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3JFeDF2UmZsMzRTbWVnam9xMkJVAAIE4I0xUwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:18:20', '0', null, null, null);
INSERT INTO `message` VALUES ('1030', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262820', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:19:11', '0', null, null, null);
INSERT INTO `message` VALUES ('1031', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262853', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:19:43', '0', null, null, null);
INSERT INTO `message` VALUES ('1032', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262884', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:20:30', '0', null, null, null);
INSERT INTO `message` VALUES ('1033', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262891', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:20:45', '0', null, null, null);
INSERT INTO `message` VALUES ('1034', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262899', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:20:53', '0', null, null, null);
INSERT INTO `message` VALUES ('1035', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262891', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:20:53', '0', null, null, null);
INSERT INTO `message` VALUES ('1036', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262899', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:00', '0', null, null, null);
INSERT INTO `message` VALUES ('1037', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262884', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:00', '0', null, null, null);
INSERT INTO `message` VALUES ('1038', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262891', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:08', '0', null, null, null);
INSERT INTO `message` VALUES ('1039', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262884', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:15', '0', null, null, null);
INSERT INTO `message` VALUES ('1040', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262899', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:15', '0', null, null, null);
INSERT INTO `message` VALUES ('1041', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262891', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:23', '0', null, null, null);
INSERT INTO `message` VALUES ('1042', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262899', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:30', '0', null, null, null);
INSERT INTO `message` VALUES ('1043', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262942', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:21:38', '0', null, null, null);
INSERT INTO `message` VALUES ('1044', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262993', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:22:25', '0', null, null, null);
INSERT INTO `message` VALUES ('1045', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398263025', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:22:35', '0', null, null, null);
INSERT INTO `message` VALUES ('1046', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398262993', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:22:44', '0', null, null, null);
INSERT INTO `message` VALUES ('1047', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398263083', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-23 22:23:32', '0', null, null, null);
INSERT INTO `message` VALUES ('1048', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398263272', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:26:42', '0', null, null, null);
INSERT INTO `message` VALUES ('1049', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398264596', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:48:52', '0', null, null, null);
INSERT INTO `message` VALUES ('1050', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398264610', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:49:00', '0', null, null, null);
INSERT INTO `message` VALUES ('1051', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398264625', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:49:14', '0', null, null, null);
INSERT INTO `message` VALUES ('1052', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398264683', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 22:50:14', '0', null, null, null);
INSERT INTO `message` VALUES ('1053', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265315', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-23 23:00:45', '0', null, null, null);
INSERT INTO `message` VALUES ('1054', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265447', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-23 23:02:56', '0', null, null, null);
INSERT INTO `message` VALUES ('1055', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265550', 'text', '炒菜', '6005504808573616184', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 23:04:40', '1', null, null, null);
INSERT INTO `message` VALUES ('1056', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265577', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-23 23:05:06', '0', null, null, null);
INSERT INTO `message` VALUES ('1057', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265627', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-23 23:05:57', '0', null, null, null);
INSERT INTO `message` VALUES ('1058', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265720', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 23:07:29', '0', null, null, null);
INSERT INTO `message` VALUES ('1059', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398265768', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-23 23:08:17', '0', null, null, null);
INSERT INTO `message` VALUES ('1060', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265812', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 23:09:04', '0', null, null, null);
INSERT INTO `message` VALUES ('1061', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398265845', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 23:09:34', '0', null, null, null);
INSERT INTO `message` VALUES ('1062', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398267132', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 23:31:02', '0', null, null, null);
INSERT INTO `message` VALUES ('1063', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398267208', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 23:32:18', '0', null, null, null);
INSERT INTO `message` VALUES ('1064', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267375', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-23 23:35:05', '0', null, null, null);
INSERT INTO `message` VALUES ('1065', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267380', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-23 23:35:09', '0', null, null, null);
INSERT INTO `message` VALUES ('1066', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267383', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_5', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-23 23:35:14', '0', null, null, null);
INSERT INTO `message` VALUES ('1067', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267396', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-23 23:35:25', '0', null, null, null);
INSERT INTO `message` VALUES ('1068', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267399', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-23 23:35:28', '0', null, null, null);
INSERT INTO `message` VALUES ('1069', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267402', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-23 23:35:32', '0', null, null, null);
INSERT INTO `message` VALUES ('1070', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267413', 'text', '更好纠结', '6005512810097688862', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, '2014-04-23 23:35:43', '0', null, null, null);
INSERT INTO `message` VALUES ('1071', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267494', 'image', null, '6005513157990039848', 'http://mmbiz.qpic.cn/mmbiz/zX5CzEhtoKN6qusWsrkVP2RpknRO78R0JFcukALeqfNneNxPFVE38Z9AF441ibKUUE4DjwAuWC6agPp4qoUUxXw/0', 'URsdtSfetaQj5-VVqFVVL3RzdlpbUy3dfJZW83foolzs7lfvTmUs5vcDVnHfGGxS', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, '2014-04-23 23:37:05', '0', null, null, null);
INSERT INTO `message` VALUES ('1072', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267524', 'text', '你。', '6005513286839058732', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, '2014-04-23 23:37:33', '0', null, null, null);
INSERT INTO `message` VALUES ('1073', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267537', 'voice', null, '6005513342473469952', null, '_YVvWQJexkRCO8AxypUBz17imdMsinOiNZEB0pijxvocGzSjnF-SxTeIDkrCcxoi', 'speex', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, '2014-04-23 23:37:46', '0', null, null, null);
INSERT INTO `message` VALUES ('1074', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398267560', 'location', null, '6005513441457881395', null, null, null, null, '31.325437', '121.594990', '17.000000', '中国上海市浦东新区庭安路 邮政编码: 200137', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, '2014-04-23 23:38:10', '0', null, null, null);
INSERT INTO `message` VALUES ('1075', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398384752', 'text', '简历', '6006016777265243155', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, '2014-04-25 08:11:20', '0', null, null, null);
INSERT INTO `message` VALUES ('1076', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398384771', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-25 08:11:40', '0', null, null, null);
INSERT INTO `message` VALUES ('1077', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398384778', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-25 08:11:47', '0', null, null, null);
INSERT INTO `message` VALUES ('1078', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398431294', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-25 21:07:02', '0', null, null, null);
INSERT INTO `message` VALUES ('1079', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398440967', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-25 23:48:16', '0', null, null, null);
INSERT INTO `message` VALUES ('1080', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398441134', 'text', '看见了', '6006258936111328377', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-25 23:51:01', '1', null, null, null);
INSERT INTO `message` VALUES ('1081', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398441143', 'text', '来杯水', '6006258974766034043', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-25 23:51:10', '1', null, null, null);
INSERT INTO `message` VALUES ('1082', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398441168', 'text', '你好', '6006259082140216446', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-25 23:51:36', '1', null, null, null);
INSERT INTO `message` VALUES ('1083', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398441188', 'image', null, '6006259168039562368', 'http://mmbiz.qpic.cn/mmbiz/66aY7oYxBvibqUPkOx6Yv5NG4qWeAXoVVJjt02QOxG0PNe0QpS9hkIXBzQRXFDWBYRKYZsX3IsaweZTEMdNzIIg/0', 'ZT6BTsd-1crgoRAVXreldmIY6IL38exj8V8vHnksQc1okBm_Ud0XuXucMMHTi4Ku', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-25 23:51:56', '0', null, null, null);
INSERT INTO `message` VALUES ('1084', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398442360', 'text', '兔兔梁奎', '6006264201741233304', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 00:11:29', '0', null, '14', null);
INSERT INTO `message` VALUES ('1085', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398442371', 'text', '图图他', '6006264248985873562', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 00:11:39', '0', null, '14', null);
INSERT INTO `message` VALUES ('1086', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398442377', 'text', '吐了咯了', '6006264274755677340', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 00:11:45', '0', null, '14', null);
INSERT INTO `message` VALUES ('1087', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398442387', 'text', '如图YY李强', '6006264317705350302', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 00:11:55', '0', null, '14', null);
INSERT INTO `message` VALUES ('1088', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398442397', 'text', '路YY看看咯啦啦', '6006264360655023264', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 00:12:04', '0', null, '14', null);
INSERT INTO `message` VALUES ('1089', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398442536', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 00:14:25', '0', null, '14', null);
INSERT INTO `message` VALUES ('1090', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398442627', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 00:15:54', '0', null, '14', null);
INSERT INTO `message` VALUES ('1091', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398442642', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 00:16:09', '0', null, '14', null);
INSERT INTO `message` VALUES ('1092', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398442654', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 00:16:21', '0', null, '14', null);
INSERT INTO `message` VALUES ('1093', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398442657', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 00:16:24', '0', null, '14', null);
INSERT INTO `message` VALUES ('1094', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398442705', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 00:17:12', '0', null, '14', null);
INSERT INTO `message` VALUES ('1095', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398471520', 'text', '快点上菜……', '6006389442987585048', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 08:17:27', '0', null, '14', null);
INSERT INTO `message` VALUES ('1096', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398471667', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 08:19:54', '0', null, '14', null);
INSERT INTO `message` VALUES ('1097', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398471704', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 08:20:31', '0', null, '14', null);
INSERT INTO `message` VALUES ('1098', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398471708', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 08:20:36', '0', null, '14', null);
INSERT INTO `message` VALUES ('1099', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398478253', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 10:09:46', '0', null, '14', null);
INSERT INTO `message` VALUES ('1100', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398478262', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 10:09:59', '0', null, '14', null);
INSERT INTO `message` VALUES ('1101', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398478253', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 10:10:01', '0', null, '14', null);
INSERT INTO `message` VALUES ('1102', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398478262', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 10:10:09', '0', null, '14', null);
INSERT INTO `message` VALUES ('1103', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398478544', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 10:14:31', '0', null, '14', null);
INSERT INTO `message` VALUES ('1104', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398478549', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 10:14:42', '0', null, '14', null);
INSERT INTO `message` VALUES ('1105', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398478574', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 10:15:01', '0', null, '14', null);
INSERT INTO `message` VALUES ('1106', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398478585', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 10:15:12', '0', null, '14', null);
INSERT INTO `message` VALUES ('1107', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398478592', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 10:15:19', '0', null, '14', null);
INSERT INTO `message` VALUES ('1108', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398478793', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 10:18:44', '0', null, '14', null);
INSERT INTO `message` VALUES ('1109', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398483460', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 11:36:26', '0', null, '14', null);
INSERT INTO `message` VALUES ('1110', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398483464', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 11:36:32', '0', null, '14', null);
INSERT INTO `message` VALUES ('1111', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398483471', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 11:36:39', '0', null, '14', null);
INSERT INTO `message` VALUES ('1112', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398484481', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 11:53:28', '0', null, '14', null);
INSERT INTO `message` VALUES ('1113', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398484509', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 11:53:59', '0', null, '14', null);
INSERT INTO `message` VALUES ('1114', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398484694', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 11:57:01', '0', null, '14', null);
INSERT INTO `message` VALUES ('1115', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398484715', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 11:57:23', '0', null, '14', null);
INSERT INTO `message` VALUES ('1116', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398488271', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-26 12:56:39', '0', null, null, null);
INSERT INTO `message` VALUES ('1117', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398488474', 'text', '好咯看见了', '6006462259863122188', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 13:00:02', '0', null, '14', null);
INSERT INTO `message` VALUES ('1118', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398488732', 'text', '喉咙谷雨影音', '6006463367964684562', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 13:04:21', '1', null, '14', null);
INSERT INTO `message` VALUES ('1119', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398488756', 'image', null, '6006463471043899668', 'http://mmbiz.qpic.cn/mmbiz/66aY7oYxBv8eyrEicdRXgmvmMHib3WC4qiby4HKiaw5vMkE4WpsqchThQSTrM2sqgryQr52yp9ZhiaGIafOIJic30rPg/0', 'FFLINPJXDTARKrTYQPvTPzNZjuGIZ-_hmiPnpO8PBtRscM68b5HUOeh_1bh2Wuvc', null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 13:04:44', '0', null, '14', null);
INSERT INTO `message` VALUES ('1120', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398488902', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 13:07:09', '0', null, '14', null);
INSERT INTO `message` VALUES ('1121', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398488914', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 13:07:21', '0', null, '14', null);
INSERT INTO `message` VALUES ('1122', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398488940', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 13:07:47', '0', null, '14', null);
INSERT INTO `message` VALUES ('1123', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398489255', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 13:13:02', '0', null, '14', null);
INSERT INTO `message` VALUES ('1124', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398489390', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 13:15:19', '0', null, '14', null);
INSERT INTO `message` VALUES ('1125', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398492032', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 13:59:20', '0', null, '14', null);
INSERT INTO `message` VALUES ('1126', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398494590', 'text', '来咯莫', '6006488527883104796', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 14:41:57', '0', null, '14', null);
INSERT INTO `message` VALUES ('1127', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398494595', 'text', 'OK来咯莫', '6006488549357941278', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 14:42:01', '0', null, '14', null);
INSERT INTO `message` VALUES ('1128', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398494599', 'text', 'V5的比较咯', '6006488566537810464', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 14:42:05', '0', null, '14', null);
INSERT INTO `message` VALUES ('1129', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398494603', 'text', '测得吧额的', '6006488583717679650', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 14:42:09', '0', null, '14', null);
INSERT INTO `message` VALUES ('1130', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398494609', 'text', '吧飞咯嗯', '6006488609487483430', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 14:42:15', '0', null, '14', null);
INSERT INTO `message` VALUES ('1131', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398494613', 'text', '梁奎死咯莫', '6006488626667352616', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 14:42:19', '0', null, '14', null);
INSERT INTO `message` VALUES ('1132', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398494619', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 14:42:27', '0', null, '14', null);
INSERT INTO `message` VALUES ('1133', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398494625', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 14:42:36', '0', null, '14', null);
INSERT INTO `message` VALUES ('1134', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398494735', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 14:44:25', '0', null, '14', null);
INSERT INTO `message` VALUES ('1135', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398494747', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 14:44:34', '0', null, '14', null);
INSERT INTO `message` VALUES ('1136', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398494782', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-26 14:45:09', '0', null, null, null);
INSERT INTO `message` VALUES ('1137', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398494783', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 14:45:09', '0', null, '14', null);
INSERT INTO `message` VALUES ('1138', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398506974', 'text', 'http://www.canzs.cn/business/free/info.do?openId=okPUDtzjrogWsWdsI_Fz39VNbgBc&consumerId=okPUDtzjrogWsWdsI_Fz39VNbgBc', '6006541716758099085', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 18:08:21', '2', null, '14', null);
INSERT INTO `message` VALUES ('1139', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398526179', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 23:28:48', '0', null, '14', null);
INSERT INTO `message` VALUES ('1140', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398526208', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 23:28:55', '0', null, '14', null);
INSERT INTO `message` VALUES ('1141', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398526179', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 23:28:55', '0', null, '14', null);
INSERT INTO `message` VALUES ('1142', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398529529', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 00:24:16', '0', null, '14', null);
INSERT INTO `message` VALUES ('1143', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398530128', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 00:34:15', '0', null, '14', null);
INSERT INTO `message` VALUES ('1144', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398530861', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 00:46:28', '0', null, '14', null);
INSERT INTO `message` VALUES ('1145', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398530889', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 00:46:56', '0', null, '14', null);
INSERT INTO `message` VALUES ('1146', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398530893', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 00:47:00', '0', null, '14', null);
INSERT INTO `message` VALUES ('1147', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398530896', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 00:47:03', '0', null, '14', null);
INSERT INTO `message` VALUES ('1148', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398531048', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-27 00:49:35', '0', null, null, null);
INSERT INTO `message` VALUES ('1149', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398531110', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 00:50:37', '0', null, '14', null);
INSERT INTO `message` VALUES ('1150', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398531126', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 00:50:53', '0', null, '14', null);
INSERT INTO `message` VALUES ('1151', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398531165', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-27 00:51:32', '0', null, null, null);
INSERT INTO `message` VALUES ('1152', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398531199', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-27 00:52:05', '0', null, null, null);
INSERT INTO `message` VALUES ('1153', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398531744', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-27 01:01:10', '0', null, null, null);
INSERT INTO `message` VALUES ('1154', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398559913', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-27 08:50:39', '0', null, null, null);
INSERT INTO `message` VALUES ('1155', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398559986', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '3', '0.000000', '0.000000', '0.000000', 'gQGf8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2cweHpSampsMllTZ2dTY1RyV0JVAAIEpJUxUwMEAAAAAA==', 'SCAN', null, '2014-04-27 08:51:52', '0', null, null, null);
INSERT INTO `message` VALUES ('1156', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398560136', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 08:54:22', '0', null, '14', null);
INSERT INTO `message` VALUES ('1157', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398560146', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 08:54:32', '0', null, '14', null);
INSERT INTO `message` VALUES ('1158', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398560153', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-27 08:54:39', '0', null, '3', null);
INSERT INTO `message` VALUES ('1159', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398560161', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-27 08:54:47', '0', null, '3', null);
INSERT INTO `message` VALUES ('1160', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398560183', 'text', '是感觉空落落', '6006770247672955014', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 08:55:09', '0', null, '14', null);
INSERT INTO `message` VALUES ('1161', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398560196', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 08:55:22', '0', null, '14', null);
INSERT INTO `message` VALUES ('1162', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398560208', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 08:55:34', '0', null, '14', null);
INSERT INTO `message` VALUES ('1163', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398560322', 'text', '  数据喔喔哦', '6006770844673409162', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-27 08:57:27', '0', null, '3', null);
INSERT INTO `message` VALUES ('1164', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398564606', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-27 10:08:58', '0', null, '3', null);
INSERT INTO `message` VALUES ('1165', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398564621', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-27 10:09:07', '0', null, '3', null);
INSERT INTO `message` VALUES ('1166', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398564667', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-27 10:09:53', '0', null, null, null);
INSERT INTO `message` VALUES ('1167', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398564668', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 10:09:54', '0', null, '14', null);
INSERT INTO `message` VALUES ('1168', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398576700', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 13:30:29', '0', null, '14', null);
INSERT INTO `message` VALUES ('1169', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398578234', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 13:56:05', '0', null, '14', null);
INSERT INTO `message` VALUES ('1170', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398578427', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 13:59:17', '0', null, '14', null);
INSERT INTO `message` VALUES ('1171', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398578433', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 13:59:19', '0', null, '14', null);
INSERT INTO `message` VALUES ('1172', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398578436', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 13:59:24', '0', null, '14', null);
INSERT INTO `message` VALUES ('1173', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398578427', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 13:59:27', '0', null, '14', null);
INSERT INTO `message` VALUES ('1174', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398578441', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 13:59:27', '0', null, '14', null);
INSERT INTO `message` VALUES ('1175', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398578444', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 13:59:30', '0', null, '14', null);
INSERT INTO `message` VALUES ('1176', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398578448', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 13:59:34', '0', null, '14', null);
INSERT INTO `message` VALUES ('1177', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398578453', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 13:59:39', '0', null, '14', null);
INSERT INTO `message` VALUES ('1178', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398578460', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 13:59:46', '0', null, '14', null);
INSERT INTO `message` VALUES ('1179', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398582731', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 15:10:57', '0', null, '14', null);
INSERT INTO `message` VALUES ('1180', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398602610', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 20:42:16', '0', null, '14', null);
INSERT INTO `message` VALUES ('1181', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398665392', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 14:08:38', '0', null, '14', null);
INSERT INTO `message` VALUES ('1182', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398665548', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 14:11:14', '0', null, '14', null);
INSERT INTO `message` VALUES ('1183', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398665613', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 14:12:18', '0', null, '14', null);
INSERT INTO `message` VALUES ('1184', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398666680', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 14:30:06', '0', null, '14', null);
INSERT INTO `message` VALUES ('1185', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398666688', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 14:30:13', '0', null, '14', null);
INSERT INTO `message` VALUES ('1186', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398666907', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 14:33:52', '0', null, '14', null);
INSERT INTO `message` VALUES ('1187', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398666958', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 14:34:44', '0', null, '14', null);
INSERT INTO `message` VALUES ('1188', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398666966', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 14:34:52', '0', null, '14', null);
INSERT INTO `message` VALUES ('1189', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398669797', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 15:22:03', '0', null, '14', null);
INSERT INTO `message` VALUES ('1190', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398669802', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 15:22:07', '0', null, '14', null);
INSERT INTO `message` VALUES ('1191', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398669845', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 15:22:50', '0', null, '14', null);
INSERT INTO `message` VALUES ('1192', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398670124', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 15:27:29', '0', null, '14', null);
INSERT INTO `message` VALUES ('1193', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398670127', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 15:27:32', '0', null, '14', null);
INSERT INTO `message` VALUES ('1194', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398670254', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 15:29:41', '0', null, '14', null);
INSERT INTO `message` VALUES ('1195', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398670258', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 15:29:44', '0', null, '14', null);
INSERT INTO `message` VALUES ('1196', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398674364', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 16:38:09', '0', null, '14', null);
INSERT INTO `message` VALUES ('1197', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398674379', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 16:38:25', '0', null, '14', null);
INSERT INTO `message` VALUES ('1198', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398674775', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 16:45:05', '0', null, '14', null);
INSERT INTO `message` VALUES ('1199', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398675644', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'unsubscribe', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 16:59:41', '0', null, '14', null);
INSERT INTO `message` VALUES ('1200', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398675653', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'subscribe', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 16:59:42', '0', null, '14', null);
INSERT INTO `message` VALUES ('1201', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398675662', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 16:59:54', '0', null, '14', null);
INSERT INTO `message` VALUES ('1202', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398675644', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'unsubscribe', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 16:59:54', '0', null, '14', null);
INSERT INTO `message` VALUES ('1203', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398675662', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 16:59:59', '0', null, '14', null);
INSERT INTO `message` VALUES ('1204', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398676009', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'unsubscribe', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:05:43', '0', null, '14', null);
INSERT INTO `message` VALUES ('1205', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398676018', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '', '0.000000', '0.000000', '0.000000', null, 'subscribe', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:05:48', '0', null, '14', null);
INSERT INTO `message` VALUES ('1206', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398676033', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'http://www.canzs.cn/czs/login.do', '0.000000', '0.000000', '0.000000', null, 'VIEW', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:06:00', '0', null, '14', null);
INSERT INTO `message` VALUES ('1207', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398676195', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'http://www.canzs.cn/czs/login.do', '0.000000', '0.000000', '0.000000', null, 'VIEW', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:08:42', '0', null, '14', null);
INSERT INTO `message` VALUES ('1208', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398676295', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'http://www.canzs.cn/czs/login.do', '0.000000', '0.000000', '0.000000', null, 'VIEW', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:10:23', '0', null, '14', null);
INSERT INTO `message` VALUES ('1209', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398676406', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'http://www.canzs.cn/czs/login.do', '0.000000', '0.000000', '0.000000', null, 'VIEW', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:12:17', '0', null, '14', null);
INSERT INTO `message` VALUES ('1210', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398676466', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'http://www.canzs.cn/czs/login.do', '0.000000', '0.000000', '0.000000', null, 'VIEW', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:13:14', '0', null, '14', null);
INSERT INTO `message` VALUES ('1211', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398676481', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'http://www.canzs.cn/czs/login.do', '0.000000', '0.000000', '0.000000', null, 'VIEW', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:13:29', '0', null, '14', null);
INSERT INTO `message` VALUES ('1212', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398676523', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:14:13', '0', null, '14', null);
INSERT INTO `message` VALUES ('1213', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398676844', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:19:32', '0', null, '14', null);
INSERT INTO `message` VALUES ('1214', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398676857', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'http://www.canzs.cn/czs/login.do', '0.000000', '0.000000', '0.000000', null, 'VIEW', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:19:44', '0', null, '14', null);
INSERT INTO `message` VALUES ('1215', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398676890', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:20:16', '0', null, '14', null);
INSERT INTO `message` VALUES ('1216', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398677071', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:23:18', '0', null, '14', null);
INSERT INTO `message` VALUES ('1217', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398677184', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:25:11', '0', null, '14', null);
INSERT INTO `message` VALUES ('1218', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398677221', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:25:48', '0', null, '14', null);
INSERT INTO `message` VALUES ('1219', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398679041', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:56:07', '0', null, '14', null);
INSERT INTO `message` VALUES ('1220', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398679060', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:56:25', '0', null, '14', null);
INSERT INTO `message` VALUES ('1221', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398679073', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:56:38', '0', null, '14', null);
INSERT INTO `message` VALUES ('1222', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398679083', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 17:56:49', '0', null, '14', null);
INSERT INTO `message` VALUES ('1223', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398680665', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 18:23:10', '0', null, '14', null);
INSERT INTO `message` VALUES ('1224', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398680674', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 18:23:19', '0', null, '14', null);
INSERT INTO `message` VALUES ('1225', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398680690', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 18:23:35', '0', null, '14', null);
INSERT INTO `message` VALUES ('1226', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398680705', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 18:23:50', '0', null, '14', null);
INSERT INTO `message` VALUES ('1227', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398680716', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 18:24:01', '0', null, '14', null);
INSERT INTO `message` VALUES ('1228', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398680785', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 18:25:10', '0', null, '14', null);
INSERT INTO `message` VALUES ('1229', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398683098', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-28 19:03:43', '0', null, null, null);
INSERT INTO `message` VALUES ('1230', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398683116', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 19:04:01', '0', null, '14', null);
INSERT INTO `message` VALUES ('1231', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398686121', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 19:54:08', '0', null, '14', null);
INSERT INTO `message` VALUES ('1232', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398686176', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-28 19:55:00', '0', null, null, null);
INSERT INTO `message` VALUES ('1233', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398686209', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 19:55:35', '0', null, '14', null);
INSERT INTO `message` VALUES ('1234', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398686959', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 20:08:04', '0', null, '14', null);
INSERT INTO `message` VALUES ('1235', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398686960', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 20:08:05', '0', null, '14', null);
INSERT INTO `message` VALUES ('1236', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398687247', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-28 20:12:53', '0', null, null, null);
INSERT INTO `message` VALUES ('1237', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398687257', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 20:13:01', '0', null, '14', null);
INSERT INTO `message` VALUES ('1238', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398687272', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 20:13:18', '0', null, '14', null);
INSERT INTO `message` VALUES ('1239', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398687367', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-28 20:14:52', '0', null, null, null);
INSERT INTO `message` VALUES ('1240', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398687371', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 20:14:56', '0', null, '14', null);
INSERT INTO `message` VALUES ('1241', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398687386', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-28 20:15:11', '0', null, null, null);
INSERT INTO `message` VALUES ('1242', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398687407', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-28 20:15:31', '0', null, null, null);
INSERT INTO `message` VALUES ('1243', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398687413', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 20:15:38', '0', null, '14', null);
INSERT INTO `message` VALUES ('1244', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398687933', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-28 20:24:18', '0', null, null, null);
INSERT INTO `message` VALUES ('1245', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398687934', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 20:24:19', '0', null, '14', null);
INSERT INTO `message` VALUES ('1246', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398687945', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 20:24:30', '0', null, '14', null);
INSERT INTO `message` VALUES ('1247', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398689079', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-28 20:43:24', '0', null, null, null);
INSERT INTO `message` VALUES ('1248', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398689084', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 20:43:29', '0', null, '14', null);
INSERT INTO `message` VALUES ('1249', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398695249', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 22:26:14', '0', null, '14', null);
INSERT INTO `message` VALUES ('1250', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398695308', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 22:27:14', '0', null, '14', null);
INSERT INTO `message` VALUES ('1251', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398695315', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 22:27:20', '0', null, '14', null);
INSERT INTO `message` VALUES ('1252', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398695996', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 22:38:42', '0', null, '14', null);
INSERT INTO `message` VALUES ('1253', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398696044', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 22:39:31', '0', null, '14', null);
INSERT INTO `message` VALUES ('1254', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398696298', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-28 22:43:43', '0', null, null, null);
INSERT INTO `message` VALUES ('1255', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398696336', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 22:44:24', '0', null, '14', null);
INSERT INTO `message` VALUES ('1256', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398696754', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-28 22:51:21', '0', null, null, null);
INSERT INTO `message` VALUES ('1257', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398696764', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 22:51:29', '0', null, '14', null);
INSERT INTO `message` VALUES ('1258', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398697233', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-28 22:59:19', '0', null, null, null);
INSERT INTO `message` VALUES ('1259', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398697268', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 22:59:53', '0', null, '14', null);
INSERT INTO `message` VALUES ('1260', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398697503', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 23:03:48', '0', null, '14', null);
INSERT INTO `message` VALUES ('1261', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398697509', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 23:03:54', '0', null, '14', null);
INSERT INTO `message` VALUES ('1262', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398697516', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 23:04:01', '0', null, '14', null);
INSERT INTO `message` VALUES ('1263', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398697520', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 23:04:05', '0', null, '14', null);
INSERT INTO `message` VALUES ('1264', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398697535', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 23:04:20', '0', null, '14', null);
INSERT INTO `message` VALUES ('1265', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398697651', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 23:06:17', '0', null, '14', null);
INSERT INTO `message` VALUES ('1266', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398697671', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 23:06:37', '0', null, '14', null);
INSERT INTO `message` VALUES ('1267', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398698184', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 23:15:09', '0', null, '14', null);
INSERT INTO `message` VALUES ('1268', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398730573', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 08:14:58', '0', null, '14', null);
INSERT INTO `message` VALUES ('1269', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398738801', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 10:32:05', '0', null, '14', null);
INSERT INTO `message` VALUES ('1270', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398738805', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 10:32:10', '0', null, '14', null);
INSERT INTO `message` VALUES ('1271', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398738814', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 10:32:19', '0', null, '14', null);
INSERT INTO `message` VALUES ('1272', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398738820', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 10:32:24', '0', null, '14', null);
INSERT INTO `message` VALUES ('1273', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398738863', 'text', 'V5张江路', '6007537672429410305', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 10:33:09', '1', null, '14', null);
INSERT INTO `message` VALUES ('1274', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398738868', 'text', '来咯哈哈凑', '6007537693904246787', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 10:33:12', '1', null, '14', null);
INSERT INTO `message` VALUES ('1275', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398738902', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 10:33:47', '0', null, '14', null);
INSERT INTO `message` VALUES ('1276', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398739253', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 10:39:38', '0', null, '14', null);
INSERT INTO `message` VALUES ('1277', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398739308', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-29 10:40:34', '0', null, null, null);
INSERT INTO `message` VALUES ('1278', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398739309', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 10:40:35', '0', null, '14', null);
INSERT INTO `message` VALUES ('1279', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398739332', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 10:40:57', '0', null, '14', null);
INSERT INTO `message` VALUES ('1280', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398740669', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:03:15', '0', null, '14', null);
INSERT INTO `message` VALUES ('1281', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398740698', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:03:44', '0', null, '14', null);
INSERT INTO `message` VALUES ('1282', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398740711', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:03:56', '0', null, '14', null);
INSERT INTO `message` VALUES ('1283', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398740739', 'voice', null, '6007545729587871744', null, 'iKRKUJnum5ER19UWkCw8fehiXPsRXqmlDALi7QwJ4KKIkrPyr7ZaDtAdlIjR0GjW', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:04:24', '0', null, '14', null);
INSERT INTO `message` VALUES ('1284', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398740804', 'voice', null, '6007546008760745984', null, 'uIVnJuLq7IEbXs0btTUuiioyFNsvjRonmexYNudHmYLAB6h2g-_VJxh7LpJYq7jb', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:05:31', '0', null, '14', null);
INSERT INTO `message` VALUES ('1285', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398740817', 'voice', null, '6007546064595320832', null, 'f3hpVvBYqrvysej8YR9GWxJOHIlP_TGOaZVrjxuyyj0oDlYz6z6_zSsUMdrBDY6J', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:05:42', '0', null, '14', null);
INSERT INTO `message` VALUES ('1286', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398740898', 'voice', null, '6007546412487671808', null, 'L4vEM3urtY7KvRnGN_IpSMVFPJRJ1mhczUVsIQr7AXJ6nWMU8fNNNEprzBmD_6mE', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:07:04', '0', null, '14', null);
INSERT INTO `message` VALUES ('1287', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398740962', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:08:07', '0', null, '14', null);
INSERT INTO `message` VALUES ('1288', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398741304', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:14:04', '0', null, '14', null);
INSERT INTO `message` VALUES ('1289', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398741625', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:19:12', '0', null, '14', null);
INSERT INTO `message` VALUES ('1290', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398742489', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:33:34', '0', null, '14', null);
INSERT INTO `message` VALUES ('1291', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398742634', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:35:58', '0', null, '14', null);
INSERT INTO `message` VALUES ('1292', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398742675', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:36:40', '0', null, '14', null);
INSERT INTO `message` VALUES ('1293', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398742681', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:36:47', '0', null, '14', null);
INSERT INTO `message` VALUES ('1294', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398742685', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:36:51', '0', null, '14', null);
INSERT INTO `message` VALUES ('1295', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398742700', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 11:37:05', '0', null, '14', null);
INSERT INTO `message` VALUES ('1296', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398744352', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 12:04:37', '0', null, '14', null);
INSERT INTO `message` VALUES ('1297', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398745313', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 12:20:38', '0', null, '14', null);
INSERT INTO `message` VALUES ('1298', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398747334', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 12:54:19', '0', null, '14', null);
INSERT INTO `message` VALUES ('1299', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398747343', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 12:54:28', '0', null, '14', null);
INSERT INTO `message` VALUES ('1300', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398747355', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 12:54:41', '0', null, '14', null);
INSERT INTO `message` VALUES ('1301', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398747539', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 12:57:44', '0', null, '14', null);
INSERT INTO `message` VALUES ('1302', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398747565', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 12:58:10', '0', null, '14', null);
INSERT INTO `message` VALUES ('1303', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398747651', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 12:59:36', '0', null, '14', null);
INSERT INTO `message` VALUES ('1304', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398748887', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-29 13:20:13', '0', null, null, null);
INSERT INTO `message` VALUES ('1305', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398748998', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 13:22:03', '0', null, '14', null);
INSERT INTO `message` VALUES ('1306', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398749022', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-29 13:22:32', '0', null, null, null);
INSERT INTO `message` VALUES ('1307', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398749035', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 13:22:40', '0', null, '14', null);
INSERT INTO `message` VALUES ('1308', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398749147', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 13:24:33', '0', null, '14', null);
INSERT INTO `message` VALUES ('1309', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398750528', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 13:47:32', '0', null, '14', null);
INSERT INTO `message` VALUES ('1310', 'oxeU2uLkwisAlyJceMnOXiXjIGOc', '1398760322', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-29 16:30:47', '0', null, null, null);
INSERT INTO `message` VALUES ('1311', 'oxeU2uLkwisAlyJceMnOXiXjIGOc', '1398760351', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-29 16:31:17', '0', null, null, null);
INSERT INTO `message` VALUES ('1312', 'oxeU2uLkwisAlyJceMnOXiXjIGOc', '1398760362', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-29 16:31:27', '0', null, null, null);
INSERT INTO `message` VALUES ('1313', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398763106', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 17:17:13', '0', null, '14', null);
INSERT INTO `message` VALUES ('1314', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398763150', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 17:17:56', '0', null, '14', null);
INSERT INTO `message` VALUES ('1315', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398764191', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 17:35:16', '0', null, '14', null);
INSERT INTO `message` VALUES ('1316', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398764281', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 17:36:47', '0', null, '14', null);
INSERT INTO `message` VALUES ('1317', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398764522', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 17:40:46', '0', null, '14', null);
INSERT INTO `message` VALUES ('1318', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398764525', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 17:40:49', '0', null, '14', null);
INSERT INTO `message` VALUES ('1319', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398764798', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 17:45:23', '0', null, '14', null);
INSERT INTO `message` VALUES ('1320', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398765812', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-29 18:02:17', '0', null, null, null);
INSERT INTO `message` VALUES ('1321', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398765818', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 18:02:23', '0', null, '14', null);
INSERT INTO `message` VALUES ('1322', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398766684', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 18:16:49', '0', null, '14', null);
INSERT INTO `message` VALUES ('1323', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398766810', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 18:18:56', '0', null, '14', null);
INSERT INTO `message` VALUES ('1324', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398768250', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 18:42:54', '0', null, '14', null);
INSERT INTO `message` VALUES ('1325', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398768258', 'voice', null, '6007663922792890368', null, '4XbvLAeebw4w-qLIY2f464lDvT5MzA1Ccqqo3___XcvoPD06HrbvzFDEqym1EQOl', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 18:43:02', '0', null, '14', null);
INSERT INTO `message` VALUES ('1326', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398768285', 'voice', null, '6007664038757007360', null, 'MzgXHAhWpWVv2FPvajLRGjJ6ggXDW1jjD_d_SoTra0fhRa5QV85LMC9XCEu4haSj', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 18:43:30', '0', null, '14', null);
INSERT INTO `message` VALUES ('1327', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398769118', 'voice', null, '6007667616464764928', null, 'xDf3SZMYnecBK2c6jnYg7d7G4hPrq7IFjfLyahsTSjcA8yjaEicybjJEsjpJjMLY', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 18:57:22', '0', null, '14', null);
INSERT INTO `message` VALUES ('1328', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398769150', 'voice', null, '6007667753903718400', null, '3AI_MkLFIoMxbhvGUUCX25RWCTTnj-XwPcpXHu4yKETWObDdiQtqBc2Fa8lxIyXQ', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 18:57:56', '0', null, '14', null);
INSERT INTO `message` VALUES ('1329', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398771191', 'voice', null, '6007676519931969536', null, 'O1V1BSgej4OciPhutc_62NYtiKZnrrg4_cWt62Z3r58OqMoWxc17BzX_dLONz6L6', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 19:31:57', '0', null, '14', null);
INSERT INTO `message` VALUES ('1330', 'oxeU2uLkwisAlyJceMnOXiXjIGOc', '1398771391', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-29 19:35:16', '0', null, null, null);
INSERT INTO `message` VALUES ('1331', 'oxeU2uLkwisAlyJceMnOXiXjIGOc', '1398771409', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-29 19:35:34', '0', null, null, null);
INSERT INTO `message` VALUES ('1332', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398771761', 'voice', null, '6007678968063328256', null, 'e1I4aAWXGK8nhA6dWSaSV7pLlrquVy0OHz9lKgYpVQQEB7cP_h1Pm7OAkFNdD0ca', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 19:41:26', '0', null, '14', null);
INSERT INTO `message` VALUES ('1333', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398771950', 'voice', null, '6007679779812147200', null, 'HmyPWVvcu1oxEEEo0ReVoWjvS_jTgFqy_4Sw-YoGyCoEMA-QOF_ndNcsr2Vtaptl', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 19:44:35', '0', null, '14', null);
INSERT INTO `message` VALUES ('1334', 'okPUDt3zgu1Ub90yL_w-slzvYWic', '1398775401', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'qrscene_24', '0.000000', '0.000000', '0.000000', 'gQEc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL19Vd0tYMnZscW9UVHNWMEExR0JVAAIE8jBJUwMEAAAAAA==', 'subscribe', null, '2014-04-29 20:42:08', '0', null, null, null);
INSERT INTO `message` VALUES ('1335', 'okPUDt3zgu1Ub90yL_w-slzvYWic', '1398775664', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-29 20:46:28', '0', null, null, null);
INSERT INTO `message` VALUES ('1336', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398775674', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 20:46:38', '0', null, '14', null);
INSERT INTO `message` VALUES ('1337', 'okPUDt3zgu1Ub90yL_w-slzvYWic', '1398775731', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-29 20:47:37', '0', null, null, null);
INSERT INTO `message` VALUES ('1338', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398775752', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 20:47:57', '0', null, '14', null);
INSERT INTO `message` VALUES ('1339', 'okPUDt3zgu1Ub90yL_w-slzvYWic', '1398775789', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-29 20:48:34', '0', null, null, null);
INSERT INTO `message` VALUES ('1340', 'okPUDt3zgu1Ub90yL_w-slzvYWic', '1398776018', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-29 20:52:22', '0', null, null, null);
INSERT INTO `message` VALUES ('1341', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '1398776276', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'qrscene_24', '0.000000', '0.000000', '0.000000', 'gQEc8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL19Vd0tYMnZscW9UVHNWMEExR0JVAAIE8jBJUwMEAAAAAA==', 'subscribe', null, '2014-04-29 20:56:42', '0', null, null, null);
INSERT INTO `message` VALUES ('1342', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '1398776291', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-29 20:56:56', '0', null, null, null);
INSERT INTO `message` VALUES ('1343', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '1398776421', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'platform_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 20:59:07', '0', null, '14', null);
INSERT INTO `message` VALUES ('1344', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '1398776587', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 21:01:53', '0', null, '14', null);
INSERT INTO `message` VALUES ('1345', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '1398776616', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 21:02:21', '0', null, '14', null);
INSERT INTO `message` VALUES ('1346', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398776648', 'voice', null, '6007699957568503808', null, 'oWnKK1m0866acgLT6c3AKmtpjXm7RITp_BSWfSDNt2JAZFb5OFVi2UhKubXCADjl', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 21:02:53', '0', null, '14', '傻');
INSERT INTO `message` VALUES ('1347', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '1398777012', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_4', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 21:08:57', '0', null, '14', null);
INSERT INTO `message` VALUES ('1348', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '1398777072', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-29 21:09:57', '0', null, null, null);
INSERT INTO `message` VALUES ('1349', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '1398777086', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-29 21:10:12', '0', null, null, null);
INSERT INTO `message` VALUES ('1350', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '1398777093', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', null, '2014-04-29 21:10:18', '0', null, null, null);
INSERT INTO `message` VALUES ('1351', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '1398777150', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-29 21:11:14', '0', null, null, null);
INSERT INTO `message` VALUES ('1352', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '1398777151', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 21:11:16', '0', null, '14', null);
INSERT INTO `message` VALUES ('1353', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398777466', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-29 21:16:31', '0', null, null, null);
INSERT INTO `message` VALUES ('1354', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398777467', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 21:16:33', '0', null, '14', null);
INSERT INTO `message` VALUES ('1355', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398777780', 'voice', null, '6007704819471482880', null, 'bhblTTXWSd5FiuRgFH_MUVUl7SILdxiNJqUhG9Nlr8WBSBodSeHUbpcpAQuuRJDj', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 21:21:49', '0', null, '14', '中了吃饭那多吗');
INSERT INTO `message` VALUES ('1356', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398781688', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 22:26:54', '0', null, '14', null);
INSERT INTO `message` VALUES ('1357', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398781721', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_5', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 22:27:26', '0', null, '14', null);
INSERT INTO `message` VALUES ('1358', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398781731', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 22:27:36', '0', null, '14', null);
INSERT INTO `message` VALUES ('1359', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398784655', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:16:21', '0', null, '14', null);
INSERT INTO `message` VALUES ('1360', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398784685', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, '14', '0.000000', '0.000000', '0.000000', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'SCAN', null, '2014-04-29 23:16:49', '0', null, null, null);
INSERT INTO `message` VALUES ('1361', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398785248', 'voice', null, '6007736894287249408', null, 'SdBDzMLbFnRsvFRoCuwW2dL6ATW1zcn61jc5sEEmuBaxbLhwACWoHdDt44XeAb_z', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:26:13', '0', null, '14', '你啦');
INSERT INTO `message` VALUES ('1362', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398785306', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:27:12', '0', null, '14', null);
INSERT INTO `message` VALUES ('1363', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398785394', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:28:40', '0', null, '14', null);
INSERT INTO `message` VALUES ('1364', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398785476', 'voice', null, '6007737873539792896', null, '9bZC3Qnlk73Te-Q6uEO61IcViD214i5wK1MKnqMfRLeIJ8aippAiytgYI6V3xy8e', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:30:01', '0', null, '14', '书');
INSERT INTO `message` VALUES ('1365', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398786267', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:43:12', '0', null, '14', null);
INSERT INTO `message` VALUES ('1366', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398786281', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:43:27', '0', null, '14', null);
INSERT INTO `message` VALUES ('1367', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398786288', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:43:33', '0', null, '14', null);
INSERT INTO `message` VALUES ('1368', 'o_gy-uDW8XJuRMZRzTOLEWVDJBok', '1398786615', 'text', '请求', '6007742765707708122', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, '2014-04-29 23:48:59', '0', null, null, null);
INSERT INTO `message` VALUES ('1369', 'o_gy-uDW8XJuRMZRzTOLEWVDJBok', '1398786627', 'text', '干净利落', '6007742817247315677', null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, '2014-04-29 23:49:11', '0', null, null, null);
INSERT INTO `message` VALUES ('1370', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398786713', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:50:39', '0', null, '14', null);
INSERT INTO `message` VALUES ('1371', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398786728', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:50:52', '0', null, '14', null);
INSERT INTO `message` VALUES ('1372', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398786753', 'voice', null, '6007743358213029888', null, 'h0AhARUAvdCpZcm0RT_Q9GngCw-hiHq3770FbGTK7pW7nDibPQ3sqipPSdrx5kSi', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:51:18', '0', null, '14', '那');
INSERT INTO `message` VALUES ('1373', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398786785', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:51:50', '0', null, '14', null);
INSERT INTO `message` VALUES ('1374', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398786790', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:51:55', '0', null, '14', null);
INSERT INTO `message` VALUES ('1375', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398786803', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'business_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:52:08', '0', null, '14', null);
INSERT INTO `message` VALUES ('1376', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398787194', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:58:39', '0', null, '14', null);
INSERT INTO `message` VALUES ('1377', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398787202', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:58:47', '0', null, '14', null);
INSERT INTO `message` VALUES ('1378', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398826260', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-30 10:49:45', '0', null, '14', null);
INSERT INTO `message` VALUES ('1379', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398826265', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_3', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-30 10:49:50', '0', null, '14', null);
INSERT INTO `message` VALUES ('1380', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398826284', 'voice', null, '6007913142565208064', null, 'YdYwJswDGpwLTEqAjySpMBbwP6OqBY11NieRhVAcYZ9E__L0r6AXvytWlZGXAB52', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-30 10:50:09', '0', null, '14', '阿');
INSERT INTO `message` VALUES ('1381', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398826468', 'voice', null, '6007913932839190528', null, 'KJqzIHsqegToOhWjNlrWgaJBJbHciD4Nibo_5nMJ5pqJn8v1lFrck-_4fUpoPL7K', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-30 10:53:12', '0', null, '14', '哎啊那你吃不');
INSERT INTO `message` VALUES ('1382', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398826500', 'voice', null, '6007914070278144000', null, 'CgGFIOO-MyHSvQ8xGBzQ5IqPbBwqgxOhXUN-iSxFSy-CR8sgVPvI7hYMgMmJVWF6', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-30 10:53:44', '0', null, '14', '你好');
INSERT INTO `message` VALUES ('1383', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398826515', 'voice', null, '6007914134702653440', null, 'bNkjC-dOLH5eMXiCzuTNzQId_vBr8As9jnU8Fixg7bJ1ap98_q4Otkk4m2pyDW0F', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-30 10:53:59', '0', null, '14', '拿来排叉儿');
INSERT INTO `message` VALUES ('1384', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398826528', 'voice', null, '6007914190537228288', null, 'pC3ohRV7CD09ufapRPQ50Px0DKQBQKDjRpb-_gCZb5x7aNN9GEtj-DN3iea0PxO3', 'amr', null, '0.000000', '0.000000', '0.000000', null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-30 10:54:12', '0', null, '14', '我要喝水');
INSERT INTO `message` VALUES ('1385', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398826550', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_2', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-30 10:54:34', '0', null, '14', null);
INSERT INTO `message` VALUES ('1386', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398826582', 'event', null, null, null, null, null, null, '0.000000', '0.000000', '0.000000', null, null, null, null, 'customer_evt_key_1', '0.000000', '0.000000', '0.000000', null, 'CLICK', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-30 10:55:07', '0', null, '14', null);

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
INSERT INTO `qrcode` VALUES ('89', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '14', '200', '33', '1', 'gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQEt8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RreGUxeURsellTMC1kSzdnR0JVAAIEEQw8UwMEAAAAAA%3D%3D', 'resources/images/qrcode/846cc702-e035-4d61-adc7-8635a51a470e_14.jpg', 'QR_LIMIT_SCENE', 'http://localhost:80/resources/images/qrcode/846cc702-e035-4d61-adc7-8635a51a470e_14.jpg', '一楼一号桌');
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
INSERT INTO `qrcode` VALUES ('101', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '3', '200', '2', '1', 'gQGf8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2cweHpSampsMllTZ2dTY1RyV0JVAAIEpJUxUwMEAAAAAA==', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQGf8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2cweHpSampsMllTZ2dTY1RyV0JVAAIEpJUxUwMEAAAAAA%3D%3D', 'resources/images/qrcode/a3e5c2e0-dc84-452a-a2c1-a785761d59ee_3.jpg', 'QR_LIMIT_SCENE', 'http://www.canzs.cn:80/resources/images/qrcode/a3e5c2e0-dc84-452a-a2c1-a785761d59ee_3.jpg', '一楼一号桌');
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
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8;

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
INSERT INTO `request` VALUES ('159', '新顾客进入', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '8a677d69-e897-4568-b5db-d208db5dc8c7', '3', '0', '0', '2014-04-23 21:54:27', '0');
INSERT INTO `request` VALUES ('160', '新顾客进入', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '7a04dc44-64ae-45f5-9c98-0f61a5b2cfa7', '14', '0', '0', '2014-04-23 23:00:50', '0');
INSERT INTO `request` VALUES ('161', '新顾客进入', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'ac945102-a735-4b2d-8804-b6b7b7512251', '14', '0', '0', '2014-04-23 23:03:51', '0');
INSERT INTO `request` VALUES ('162', '新顾客进入', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '75368027-3bb6-48f1-b213-dba1e0931f61', '14', '0', '0', '2014-04-23 23:05:06', '0');
INSERT INTO `request` VALUES ('163', '新顾客进入', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '594ebe7e-8438-49e3-8bb4-a616acde00c8', '14', '0', '0', '2014-04-23 23:05:57', '0');
INSERT INTO `request` VALUES ('164', '新顾客进入', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'af62e20e-d736-49f0-aff2-2907e9ee9e02', '14', '0', '0', '2014-04-23 23:08:17', '0');
INSERT INTO `request` VALUES ('165', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '14', '0', '0', '2014-04-25 21:07:03', '0');
INSERT INTO `request` VALUES ('166', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '14', '4', '0', '2014-04-26 00:14:25', '0');
INSERT INTO `request` VALUES ('167', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '0', '2014-04-26 00:14:37', '0');
INSERT INTO `request` VALUES ('168', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '14', '4', '0', '2014-04-26 00:15:55', '0');
INSERT INTO `request` VALUES ('169', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '14', '4', '0', '2014-04-26 00:16:09', '0');
INSERT INTO `request` VALUES ('170', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '0', '2014-04-26 00:16:16', '0');
INSERT INTO `request` VALUES ('171', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '14', '4', '0', '2014-04-26 00:16:24', '0');
INSERT INTO `request` VALUES ('172', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '14', '4', '0', '2014-04-26 08:20:37', '0');
INSERT INTO `request` VALUES ('173', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '0', '2014-04-26 08:20:44', '0');
INSERT INTO `request` VALUES ('174', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '14', '4', '0', '2014-04-26 10:09:59', '0');
INSERT INTO `request` VALUES ('175', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '14', '4', '0', '2014-04-26 10:10:09', '0');
INSERT INTO `request` VALUES ('176', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '0', '2014-04-26 10:10:11', '0');
INSERT INTO `request` VALUES ('177', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '14', '4', '0', '2014-04-26 10:14:42', '0');
INSERT INTO `request` VALUES ('178', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '14', '4', '0', '2014-04-26 10:15:01', '0');
INSERT INTO `request` VALUES ('179', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '0', '2014-04-26 10:15:06', '0');
INSERT INTO `request` VALUES ('180', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1f44f882-d207-4461-b7ea-eac3e6497411', '14', '4', '0', '2014-04-26 10:15:12', '0');
INSERT INTO `request` VALUES ('181', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '721b075d-33b5-49a5-8b9c-a4b9a9474bed', '14', '0', '0', '2014-04-26 12:56:39', '0');
INSERT INTO `request` VALUES ('182', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '721b075d-33b5-49a5-8b9c-a4b9a9474bed', '14', '4', '0', '2014-04-26 13:07:09', '0');
INSERT INTO `request` VALUES ('183', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '721b075d-33b5-49a5-8b9c-a4b9a9474bed', '14', '4', '0', '2014-04-26 13:07:21', '0');
INSERT INTO `request` VALUES ('184', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '721b075d-33b5-49a5-8b9c-a4b9a9474bed', '14', '4', '0', '2014-04-26 13:07:47', '0');
INSERT INTO `request` VALUES ('185', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '0', '2014-04-26 13:08:42', '0');
INSERT INTO `request` VALUES ('186', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '721b075d-33b5-49a5-8b9c-a4b9a9474bed', '14', '4', '0', '2014-04-26 14:42:27', '0');
INSERT INTO `request` VALUES ('187', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '721b075d-33b5-49a5-8b9c-a4b9a9474bed', '14', '4', '0', '2014-04-26 14:42:36', '0');
INSERT INTO `request` VALUES ('188', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '0', '2014-04-26 14:42:42', '0');
INSERT INTO `request` VALUES ('189', '个人结账请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '721b075d-33b5-49a5-8b9c-a4b9a9474bed', '14', '1', '0', '2014-04-26 14:44:29', '0');
INSERT INTO `request` VALUES ('190', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '14', '0', '0', '2014-04-26 14:45:09', '0');
INSERT INTO `request` VALUES ('191', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '14', '4', '0', '2014-04-27 00:46:28', '0');
INSERT INTO `request` VALUES ('192', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '0', '2014-04-27 00:46:46', '0');
INSERT INTO `request` VALUES ('193', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '14', '4', '0', '2014-04-27 00:46:56', '0');
INSERT INTO `request` VALUES ('194', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '14', '4', '0', '2014-04-27 00:47:00', '0');
INSERT INTO `request` VALUES ('195', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '14', '4', '0', '2014-04-27 00:47:03', '0');
INSERT INTO `request` VALUES ('196', '个人结账请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c55a2ea5-9859-4ad8-ab09-3bd81a33e7de', '14', '1', '0', '2014-04-27 00:50:44', '0');
INSERT INTO `request` VALUES ('197', '进入请求中', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '14', '0', '0', '2014-04-27 00:52:05', '0');
INSERT INTO `request` VALUES ('198', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'e0cd179c-c8ca-4127-8d5a-5c866af391f5', '3', '0', '1', '2014-04-27 08:51:52', '0');
INSERT INTO `request` VALUES ('199', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '14', '4', '0', '2014-04-27 08:54:22', '0');
INSERT INTO `request` VALUES ('200', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '14', '4', '0', '2014-04-27 08:54:32', '0');
INSERT INTO `request` VALUES ('201', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'e0cd179c-c8ca-4127-8d5a-5c866af391f5', '3', '4', '1', '2014-04-27 08:54:39', '0');
INSERT INTO `request` VALUES ('202', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'e0cd179c-c8ca-4127-8d5a-5c866af391f5', '3', '4', '1', '2014-04-27 08:54:47', '0');
INSERT INTO `request` VALUES ('203', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f6edaf63-16e2-4ac0-ae0c-7fd363aba87e', '14', '0', '0', '2014-04-27 10:09:53', '0');
INSERT INTO `request` VALUES ('204', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '14', '4', '0', '2014-04-27 13:59:24', '0');
INSERT INTO `request` VALUES ('205', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '14', '4', '0', '2014-04-27 13:59:27', '0');
INSERT INTO `request` VALUES ('206', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '14', '4', '0', '2014-04-27 13:59:30', '0');
INSERT INTO `request` VALUES ('207', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'c4ca774e-2638-45a7-85f0-9368b7d9edd7', '14', '4', '0', '2014-04-27 13:59:34', '0');
INSERT INTO `request` VALUES ('208', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '1', '2014-04-27 14:44:39', '0');
INSERT INTO `request` VALUES ('209', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f6edaf63-16e2-4ac0-ae0c-7fd363aba87e', '14', '4', '1', '2014-04-28 14:12:18', '0');
INSERT INTO `request` VALUES ('210', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '1', '2014-04-28 14:12:24', '0');
INSERT INTO `request` VALUES ('211', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f6edaf63-16e2-4ac0-ae0c-7fd363aba87e', '14', '4', '1', '2014-04-28 14:30:07', '0');
INSERT INTO `request` VALUES ('212', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f6edaf63-16e2-4ac0-ae0c-7fd363aba87e', '14', '4', '1', '2014-04-28 14:30:13', '0');
INSERT INTO `request` VALUES ('213', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '1', '2014-04-28 14:30:17', '0');
INSERT INTO `request` VALUES ('214', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f6edaf63-16e2-4ac0-ae0c-7fd363aba87e', '14', '4', '1', '2014-04-28 14:33:54', '0');
INSERT INTO `request` VALUES ('215', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'ac067014-2962-4541-97cc-0f92f80e998f', '14', '0', '1', '2014-04-28 19:03:43', '0');
INSERT INTO `request` VALUES ('216', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'bc9d2637-053b-4104-a202-1f84b7c25ece', '14', '0', '1', '2014-04-28 19:55:01', '0');
INSERT INTO `request` VALUES ('217', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '4d87564a-0879-4f2a-8bb1-cfba3e31f440', '14', '0', '1', '2014-04-28 20:12:53', '0');
INSERT INTO `request` VALUES ('218', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'bdcb4ce0-16b6-46a3-93ad-1f40ebe22533', '14', '0', '1', '2014-04-28 20:14:52', '0');
INSERT INTO `request` VALUES ('219', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '58763151-502f-417c-aea6-bb4d3adf279f', '14', '0', '1', '2014-04-28 20:15:32', '0');
INSERT INTO `request` VALUES ('220', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '5e46c9dd-6213-46f2-a4a2-2ff49e880036', '14', '0', '1', '2014-04-28 20:24:18', '0');
INSERT INTO `request` VALUES ('221', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'e57277d4-30a0-424e-a5fa-dbcc1a6d4866', '14', '0', '1', '2014-04-28 20:43:24', '0');
INSERT INTO `request` VALUES ('222', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'e57277d4-30a0-424e-a5fa-dbcc1a6d4866', '14', '4', '1', '2014-04-28 22:26:14', '0');
INSERT INTO `request` VALUES ('223', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'e57277d4-30a0-424e-a5fa-dbcc1a6d4866', '14', '4', '1', '2014-04-28 22:27:20', '0');
INSERT INTO `request` VALUES ('224', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'e57277d4-30a0-424e-a5fa-dbcc1a6d4866', '14', '4', '1', '2014-04-28 22:38:42', '0');
INSERT INTO `request` VALUES ('225', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '1', '2014-04-28 22:38:54', '0');
INSERT INTO `request` VALUES ('226', '进入请求中', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'fe5388d7-f735-4f4c-9e13-273270476e5b', '14', '0', '1', '2014-04-28 22:43:43', '0');
INSERT INTO `request` VALUES ('227', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'fe5388d7-f735-4f4c-9e13-273270476e5b', '14', '4', '1', '2014-04-28 22:44:24', '0');
INSERT INTO `request` VALUES ('228', '进入请求中', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f0c871f0-2ab6-469e-916b-450b149aff23', '14', '0', '1', '2014-04-28 22:51:21', '0');
INSERT INTO `request` VALUES ('229', '进入请求中', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'fb749e8d-18b0-40e8-9be5-e3a194725642', '14', '0', '1', '2014-04-28 22:59:19', '0');
INSERT INTO `request` VALUES ('230', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'fb749e8d-18b0-40e8-9be5-e3a194725642', '14', '4', '1', '2014-04-28 23:03:48', '0');
INSERT INTO `request` VALUES ('231', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'fb749e8d-18b0-40e8-9be5-e3a194725642', '14', '4', '1', '2014-04-28 23:03:54', '0');
INSERT INTO `request` VALUES ('232', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'fb749e8d-18b0-40e8-9be5-e3a194725642', '14', '4', '1', '2014-04-28 23:04:01', '0');
INSERT INTO `request` VALUES ('233', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'fb749e8d-18b0-40e8-9be5-e3a194725642', '14', '4', '1', '2014-04-28 23:04:05', '0');
INSERT INTO `request` VALUES ('234', '呼叫服务请求', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'fb749e8d-18b0-40e8-9be5-e3a194725642', '14', '4', '1', '2014-04-28 23:04:20', '0');
INSERT INTO `request` VALUES ('235', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'e57277d4-30a0-424e-a5fa-dbcc1a6d4866', '14', '4', '1', '2014-04-29 10:32:05', '0');
INSERT INTO `request` VALUES ('236', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'e57277d4-30a0-424e-a5fa-dbcc1a6d4866', '14', '4', '1', '2014-04-29 10:32:10', '0');
INSERT INTO `request` VALUES ('237', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '1', '2014-04-29 10:32:13', '0');
INSERT INTO `request` VALUES ('238', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'e57277d4-30a0-424e-a5fa-dbcc1a6d4866', '14', '4', '1', '2014-04-29 10:32:19', '0');
INSERT INTO `request` VALUES ('239', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '9922aee7-15ce-4909-8176-761f1a166b9e', '14', '0', '1', '2014-04-29 10:40:34', '0');
INSERT INTO `request` VALUES ('240', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '9922aee7-15ce-4909-8176-761f1a166b9e', '14', '4', '1', '2014-04-29 11:03:15', '0');
INSERT INTO `request` VALUES ('241', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '9922aee7-15ce-4909-8176-761f1a166b9e', '14', '4', '1', '2014-04-29 11:03:44', '0');
INSERT INTO `request` VALUES ('242', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '9922aee7-15ce-4909-8176-761f1a166b9e', '14', '4', '1', '2014-04-29 11:03:56', '0');
INSERT INTO `request` VALUES ('243', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '9922aee7-15ce-4909-8176-761f1a166b9e', '14', '4', '1', '2014-04-29 11:08:07', '0');
INSERT INTO `request` VALUES ('244', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '59450227-ffa4-4d25-a3aa-5bdd839819e4', '14', '0', '1', '2014-04-29 13:20:13', '0');
INSERT INTO `request` VALUES ('245', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '70f59f32-5e32-4d55-a0cc-5995936f30b4', '14', '0', '1', '2014-04-29 13:22:32', '0');
INSERT INTO `request` VALUES ('246', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '70f59f32-5e32-4d55-a0cc-5995936f30b4', '14', '4', '1', '2014-04-29 17:40:49', '0');
INSERT INTO `request` VALUES ('247', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '70f59f32-5e32-4d55-a0cc-5995936f30b4', '14', '4', '1', '2014-04-29 17:45:23', '0');
INSERT INTO `request` VALUES ('248', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'f647b92d-15ef-494c-80f7-ea1d74977461', '14', '0', '1', '2014-04-29 18:02:17', '0');
INSERT INTO `request` VALUES ('249', '进入请求中', 'okPUDt3zgu1Ub90yL_w-slzvYWic', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2cbe942e-92d3-4b7a-ae52-df82aaf2f47c', '14', '0', '1', '2014-04-29 20:52:23', '0');
INSERT INTO `request` VALUES ('250', '进入请求中', 'okPUDtyrb6ie7r6B20RX1pKpo11M', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0bf3b6e9-7839-4804-a687-5d31e2aa26d1', '14', '0', '0', '2014-04-29 20:56:56', '0');
INSERT INTO `request` VALUES ('251', '集体结账请求', 'okPUDtyrb6ie7r6B20RX1pKpo11M', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '0bf3b6e9-7839-4804-a687-5d31e2aa26d1', '14', '2', '1', '2014-04-29 21:09:07', '0');
INSERT INTO `request` VALUES ('252', '进入请求中', 'okPUDtyrb6ie7r6B20RX1pKpo11M', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '364507ee-1f01-4aa3-abfb-6365ec4f8b4f', '14', '0', '1', '2014-04-29 21:11:15', '0');
INSERT INTO `request` VALUES ('253', '进入请求中', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '14', '0', '1', '2014-04-29 21:16:31', '0');
INSERT INTO `request` VALUES ('254', '进入请求中', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'd5783afb-5fa8-4e52-b887-e8786405f880', '14', '0', '1', '2014-04-29 23:16:49', '0');
INSERT INTO `request` VALUES ('255', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '14', '4', '1', '2014-04-29 23:43:33', '0');
INSERT INTO `request` VALUES ('256', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '14', '4', '1', '2014-04-29 23:50:39', '0');
INSERT INTO `request` VALUES ('257', '处理呼叫服务', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, null, '4', '1', '2014-04-29 23:50:44', '0');
INSERT INTO `request` VALUES ('258', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '14', '4', '1', '2014-04-29 23:50:52', '0');
INSERT INTO `request` VALUES ('259', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '14', '4', '1', '2014-04-29 23:58:39', '0');
INSERT INTO `request` VALUES ('260', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '14', '4', '1', '2014-04-29 23:58:47', '0');
INSERT INTO `request` VALUES ('261', '呼叫服务请求', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c', '14', '4', '1', '2014-04-30 10:49:50', '0');

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
  `handle_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES ('27', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-20 00:33:45', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('28', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-20 00:34:21', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('29', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-20 00:36:59', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('30', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-23 06:50:53', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('31', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 00:14:25', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('32', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 00:15:55', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('33', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 00:16:24', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('34', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 08:19:54', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('35', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 10:09:59', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('36', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 10:14:42', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('37', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 10:15:12', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('38', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 13:07:09', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('39', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-26 14:42:27', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('40', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 00:46:28', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('41', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 00:46:56', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('42', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-27 08:54:22', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('43', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '2014-04-27 08:54:39', '0', '0', '0', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', null, '3', null);
INSERT INTO `service` VALUES ('44', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 14:30:07', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('45', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 14:33:54', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', '2014-04-28 22:26:01');
INSERT INTO `service` VALUES ('46', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 22:26:14', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('47', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 22:44:24', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', '2014-04-28 22:44:52');
INSERT INTO `service` VALUES ('48', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 23:03:48', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', '2014-04-28 23:04:10');
INSERT INTO `service` VALUES ('49', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-28 23:04:20', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', '2014-04-28 23:04:27');
INSERT INTO `service` VALUES ('50', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 10:32:05', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('51', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 10:32:19', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('52', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 17:40:49', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', '2014-04-29 17:45:15');
INSERT INTO `service` VALUES ('53', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 17:45:23', '0', '0', '0', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', null, '14', null);
INSERT INTO `service` VALUES ('54', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '2014-04-29 23:50:52', '0', '1', '0', null, null, '14', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

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
INSERT INTO `subscriber` VALUES ('20', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '萧水澈', '2', '扬州', '中国', '江苏', 'zh_CN', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6WkSrT1hyhqRTUgibGeg5zoFZY9K2FVKb5GHUibzqo0lKBJUicouviaU4fn4lRzlRz4qMXyq8MVaYHxcGWgT9YVghPDKw0TF57ayM/0');

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'okPUDtzjrogWsWdsI_Fz39VNbgBc', '1398676018', '0', '12', '31.325430', '121.594994', '16.000000', '2dc0af6a-29dc-4bc8-a989-874c97a5bd0c');
INSERT INTO `user` VALUES ('3', 'okPUDt6_6iTJLf-XZhLPhzZHbtL8', '1398178052', '0', '5', '31.325437', '121.594990', '17.000000', 'd5783afb-5fa8-4e52-b887-e8786405f880');
INSERT INTO `user` VALUES ('4', 'okPUDt7bteacEqkYuo1h35holOt0', '1397020949', '0', '1', null, null, null, null);
INSERT INTO `user` VALUES ('5', 'okPUDty-hCcDY2Pqz3rZKIAAZ76c', '1397723303', '0', '2', null, null, null, null);
INSERT INTO `user` VALUES ('6', 'okPUDt20dQIIpn0RmHdYTOX9Fwis', '1397023211', '0', '1', null, null, null, null);
INSERT INTO `user` VALUES ('7', 'okPUDt-bQG255wHG8Omn3XXIHWvs', '1397218407', '0', '3', null, null, null, null);
INSERT INTO `user` VALUES ('8', 'okPUDtyAf189CMqEq0Wf0aH-YGVo', '1397218426', '0', '2', null, null, null, null);
INSERT INTO `user` VALUES ('10', 'okPUDt9mjQmCNfH6rXV0sffTxiPQ', '1397134405', '0', '1', null, null, null, null);
INSERT INTO `user` VALUES ('9', 'okPUDt3zgu1Ub90yL_w-slzvYWic', '1398775401', '0', '3', null, null, null, null);
INSERT INTO `user` VALUES ('11', 'okPUDt-oIvPeYANJ9a2ldXiRhkyk', '1397217369', '0', '1', null, null, null, null);
INSERT INTO `user` VALUES ('13', 'oxeU2uMumfbpFtGx-JExt99kekDk', '1397736587', '1', '1', null, null, null, null);
INSERT INTO `user` VALUES ('12', 'okPUDt10VZJDRnmirHcCp7zW04kQ', '1397713024', '1', '1', null, null, null, null);
INSERT INTO `user` VALUES ('14', 'oxeU2uKMHJeF65Kpwxh4z4lQW6aY', '1397747408', '0', '3', null, null, null, '212ffc66-4da8-4ae9-b5af-791a374bec31');
INSERT INTO `user` VALUES ('15', 'oxeU2uLkwisAlyJceMnOXiXjIGOc', '1397738784', '0', '1', null, null, null, '52f4ad57-e4ef-4997-8585-91d2a0aaf92c');
INSERT INTO `user` VALUES ('16', 'oxeU2uG0W_LF4MNfLbCRQDYNvi0g', '1397739232', '0', '1', null, null, null, '16b8d89e-9c1c-4010-a7ce-d4aa20d9449f');
INSERT INTO `user` VALUES ('17', 'okPUDt6m3kDv6AHlUuTcZlfF1ZJI', '1397985371', '0', '1', null, null, null, null);
INSERT INTO `user` VALUES ('18', 'okPUDtyrb6ie7r6B20RX1pKpo11M', '1398776276', '0', '1', null, null, null, null);
