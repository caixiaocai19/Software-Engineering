/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : backend

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 24/11/2021 09:04:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activities
-- ----------------------------
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities`  (
  `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `a_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `a_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发起时间',
  `u_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发起人用户名',
  `a_add` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动地点',
  `a_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动内容',
  `a_state` tinyint(255) NOT NULL DEFAULT 1 COMMENT '活动状态',
  `a_stime` datetime NOT NULL DEFAULT '2000-01-11 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `a_etime` datetime NOT NULL DEFAULT '2000-11-22 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  `u_id` int(11) NOT NULL COMMENT '发起人账号',
  `a_sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动类型',
  PRIMARY KEY (`a_id`) USING BTREE,
  INDEX `1`(`u_id`, `u_username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of activities
-- ----------------------------
INSERT INTO `activities` VALUES (1, 'caixiaocai', '2021-11-23 22:21:18', 'caixiaocai', '111', '111', 1, '2021-11-18 08:11:12', '2021-11-22 08:10:19', 1, '线上活动');
INSERT INTO `activities` VALUES (4, '拉屎', '2021-11-24 00:30:20', '欧啊屎', '汕头国际大酒店', '好的臭傻逼', 1, '2021-11-24 00:30:20', '2021-11-24 00:30:20', 17, '线上活动');
INSERT INTO `activities` VALUES (7, 'las', '2021-11-25 00:00:00', '欧啊屎', 'asdfa', 'dsfasdf', 1, '2000-01-11 00:00:00', '2000-11-22 00:00:00', 17, 'offline');
INSERT INTO `activities` VALUES (8, '斤斤计较', '2021-11-24 00:00:00', '欧啊屎', '小龙坎老火锅(东厦路店)', '哈哈哈哈哈哈', 1, '2000-01-11 00:00:00', '2000-11-22 00:00:00', 17, '线上活动');

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
  `uid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '报名表编号',
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ulink`(`uid`, `uname`) USING BTREE,
  INDEX `alink`(`aid`, `aname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES (1, 111, 1, 'caixiaocai', 'caixiaocai');
INSERT INTO `link` VALUES (17, 4, 5, '欧耿锋', '拉屎');
INSERT INTO `link` VALUES (17, 7, 9, '欧啊屎', 'las');
INSERT INTO `link` VALUES (17, 8, 10, '欧啊屎', '斤斤计较');
INSERT INTO `link` VALUES (1, 8, 11, 'caixiaocai', '斤斤计较');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账号',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份',
  PRIMARY KEY (`id`, `username`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'caixiaocai', '123456', '1');
INSERT INTO `users` VALUES (17, '欧啊屎', '123456', 'stu');

SET FOREIGN_KEY_CHECKS = 1;
