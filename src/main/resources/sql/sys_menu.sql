/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : sqltest

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-02-06 23:55:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` varchar(50) NOT NULL COMMENT '菜单id',
  `menu_pid` varchar(50) NOT NULL COMMENT '菜单父id',
  `menu_name` varchar(255) NOT NULL COMMENT '名称',
  `menu_url` varchar(255) NOT NULL COMMENT '地址',
  `menu_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `menu_order` varchar(255) DEFAULT NULL COMMENT '排序',
  `used` tinyint(4) DEFAULT NULL COMMENT '是否可用（0：不可用； 1： 可用）',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('jioop', 'root', 'jioop', '', null, '2', null);
INSERT INTO `sys_menu` VALUES ('rhr', '0', 'wefew', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('root', '0', 'jdbcMav', '', null, null, null);
INSERT INTO `sys_menu` VALUES ('system', 'root', 'system', '', null, '1', null);
INSERT INTO `sys_menu` VALUES ('wefwe23', 'wefwe', 'wefwe23', '', null, null, null);
