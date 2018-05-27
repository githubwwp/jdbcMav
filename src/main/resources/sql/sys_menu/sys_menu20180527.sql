/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50545
Source Host           : localhost:3306
Source Database       : sqltest

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2018-05-27 23:57:55
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
  `menu_url` varchar(255) DEFAULT NULL COMMENT '地址',
  `menu_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `menu_order` varchar(255) DEFAULT NULL COMMENT '排序',
  `used` tinyint(4) DEFAULT NULL COMMENT '是否可用（0：不可用； 1： 可用）',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('15315935_8e44_4978_a0df_e1f6417dbd98', 'db95735a_41fd_47c3_8084_3105a9d18936', '表格', '', '', '', null);
INSERT INTO `sys_menu` VALUES ('18f6ef58_7cd5_4f83_9473_a5ccfb4d8ed9', 'e4f8cd3a_5ca9_4d86_ae86_039c00aaa2f7', 'anchor 布局', '/jsp/ext/layout/anchor.jsp', '', '3', null);
INSERT INTO `sys_menu` VALUES ('1bd18427_2528_4705_bddc_21e2aa825662', 'root', '系统维护', '/jsp/system', '', '3', null);
INSERT INTO `sys_menu` VALUES ('22895a70_c400_4233_8931_51b22538e5c9', 'db95735a_41fd_47c3_8084_3105a9d18936', '弹框', '/extjs_window.jsp', '', '', null);
INSERT INTO `sys_menu` VALUES ('2670db3c_edca_470c_a42c_0afc62f62cab', 'db95735a_41fd_47c3_8084_3105a9d18936', '表单', '', '', '', null);
INSERT INTO `sys_menu` VALUES ('3211ac03_47f7_499f_94b1_68e55b89c093', 'e4f8cd3a_5ca9_4d86_ae86_039c00aaa2f7', 'card 布局', '/jsp/ext/layout/card.jsp', '', '6', null);
INSERT INTO `sys_menu` VALUES ('3cec587b_f0d3_48b3_9221_9fc6e2a08e78', 'root', 'extjs4.2 学习', null, null, '1', null);
INSERT INTO `sys_menu` VALUES ('4c9674c8_e6ed_417e_9e41_579eca2aa036', 'e4f8cd3a_5ca9_4d86_ae86_039c00aaa2f7', 'auto 布局', '/jsp/ext/layout/auto.jsp', '', '4', null);
INSERT INTO `sys_menu` VALUES ('526501ed_0df7_48e5_90bd_95973ee636b5', '941255a0_01a5_4a65_8cb2_fa01e129ba89', '柱状图', '/jsp/ext/chart/columnChart.jsp', '', '2', null);
INSERT INTO `sys_menu` VALUES ('56eee54f_ffa3_48db_860a_f6f9af7124a0', 'd9394920_fc42_4471_9f5c_e201acf73ee3', 'excel 导入', '', '', '', null);
INSERT INTO `sys_menu` VALUES ('5da3ec1d_95eb_4441_8135_02a51760fded', '3cec587b_f0d3_48b3_9221_9fc6e2a08e78', 'ext自定义组件', '', '', '4', null);
INSERT INTO `sys_menu` VALUES ('62082699_a4fa_4092_99d8_3d6cefed6478', '941255a0_01a5_4a65_8cb2_fa01e129ba89', '雷达图', '/jsp/ext/chart/radarChart.jsp', '', '7', null);
INSERT INTO `sys_menu` VALUES ('62cbf134_c7a0_4f9b_9c73_95ea78f9aaa2', 'db95735a_41fd_47c3_8084_3105a9d18936', '分页', 'extPage', '', '1', null);
INSERT INTO `sys_menu` VALUES ('722ee0de_9d8c_48c2_8e00_b9a35de0034b', 'd9394920_fc42_4471_9f5c_e201acf73ee3', '邮件发送', '', '', '', null);
INSERT INTO `sys_menu` VALUES ('7597c3e1_6118_4d6e_b561_dc50a52bf9f9', 'e4f8cd3a_5ca9_4d86_ae86_039c00aaa2f7', 'hbox 布局', '/jsp/ext/layout/hbox.jsp', '', '22', null);
INSERT INTO `sys_menu` VALUES ('7a26770f_067e_4cf6_9759_65c9350c6f84', '941255a0_01a5_4a65_8cb2_fa01e129ba89', '条形图', '/jsp/ext/chart/barChart.jsp', '', '3', null);
INSERT INTO `sys_menu` VALUES ('8a3c16c0_a0a7_4553_b5bb_35c3663155b8', 'e4f8cd3a_5ca9_4d86_ae86_039c00aaa2f7', 'fit 布局', '/jsp/ext/layout/fit.jsp', '', '8', null);
INSERT INTO `sys_menu` VALUES ('8aa76886_71f2_4022_910f_a1133e8e7a1e', 'd9394920_fc42_4471_9f5c_e201acf73ee3', '文件上传', '', '', '', null);
INSERT INTO `sys_menu` VALUES ('941255a0_01a5_4a65_8cb2_fa01e129ba89', '3cec587b_f0d3_48b3_9221_9fc6e2a08e78', 'extjs chart 学习', '', '', '1', null);
INSERT INTO `sys_menu` VALUES ('9d433090_fcc7_46d0_834d_09bbf3b9306d', '5da3ec1d_95eb_4441_8135_02a51760fded', '弹框树选择', '/jsp/ext/custom/winTreeSelect.jsp', '', '01', null);
INSERT INTO `sys_menu` VALUES ('9ec82d4d_4f87_41f7_9c3c_c6636b49ba44', 'e4f8cd3a_5ca9_4d86_ae86_039c00aaa2f7', 'absulute 布局', '/jsp/ext/layout/absolute.jsp', '', '1', null);
INSERT INTO `sys_menu` VALUES ('a426e7b7_4474_4e7b_9ef7_a1f023b285f7', '941255a0_01a5_4a65_8cb2_fa01e129ba89', '线条图', '/jsp/ext/chart/lineChart.jsp', '', '5', null);
INSERT INTO `sys_menu` VALUES ('b3bcd933_84b1_4b29_9507_9aae5281bbea', '941255a0_01a5_4a65_8cb2_fa01e129ba89', '饼状图', '/jsp/ext/chart/pieChart.jsp', '', '6', null);
INSERT INTO `sys_menu` VALUES ('b6069ab7_ef2c_40c3_93a6_ba64c80024be', '941255a0_01a5_4a65_8cb2_fa01e129ba89', '散点图', '/jsp/ext/chart/scatterChart.jsp', '', '8', null);
INSERT INTO `sys_menu` VALUES ('b62058c6_2afa_47de_890e_d031791fde1c', 'db95735a_41fd_47c3_8084_3105a9d18936', 'tab 模块', '/jsp/module/tabModule.jsp', '', '1', null);
INSERT INTO `sys_menu` VALUES ('bb111cc8_cd5e_4c66_bb60_939b0aea3b86', 'e4f8cd3a_5ca9_4d86_ae86_039c00aaa2f7', 'vbox 布局', '/jsp/ext/layout/vbox.jsp', '', '23', null);
INSERT INTO `sys_menu` VALUES ('bdeb9a1e_591b_465c_9e69_2f29948c5d37', 'e4f8cd3a_5ca9_4d86_ae86_039c00aaa2f7', 'form 布局', '/jsp/ext/layout/form.jsp', '', '9', null);
INSERT INTO `sys_menu` VALUES ('be4684eb_679e_4872_a60c_b23cd280ee0f', 'e4f8cd3a_5ca9_4d86_ae86_039c00aaa2f7', 'border 布局', '/jsp/ext/layout/border.jsp', '', '8', null);
INSERT INTO `sys_menu` VALUES ('bfb06dfd_de19_4705_9425_0f65a783268e', '941255a0_01a5_4a65_8cb2_fa01e129ba89', '仪表图', '/jsp/ext/chart/gaugeChart.jsp', '', '4', null);
INSERT INTO `sys_menu` VALUES ('c7a6f3c6_e533_4abc_bbc7_ee4b35b32d0c', 'e4f8cd3a_5ca9_4d86_ae86_039c00aaa2f7', 'accordion 布局', '/jsp/ext/layout/accordion.jsp', '', '2', null);
INSERT INTO `sys_menu` VALUES ('c888cc4c_1402_456a_ae96_dcf0b1399440', 'e4f8cd3a_5ca9_4d86_ae86_039c00aaa2f7', 'column 布局', '/jsp/ext/layout/column.jsp', '', '7', null);
INSERT INTO `sys_menu` VALUES ('cbbf513e_73f5_4445_868a_5d760d1d9a54', '5da3ec1d_95eb_4441_8135_02a51760fded', '分页组件', '/jsp/ext/custom/pageComponent.jsp', '分页组件', '02', null);
INSERT INTO `sys_menu` VALUES ('d3b1d90d_0102_47dc_91e0_e1ecde12a342', 'e4f8cd3a_5ca9_4d86_ae86_039c00aaa2f7', 'table 布局', '/jsp/ext/layout/table.jsp', '', '21', null);
INSERT INTO `sys_menu` VALUES ('d9394920_fc42_4471_9f5c_e201acf73ee3', 'root', 'javaEE 常用工具', '', '', '3', null);
INSERT INTO `sys_menu` VALUES ('db95735a_41fd_47c3_8084_3105a9d18936', '3cec587b_f0d3_48b3_9221_9fc6e2a08e78', 'extjs4.2 模块', '', '', '2', null);
INSERT INTO `sys_menu` VALUES ('dbcd519f_5cbe_4906_bbad_9cb4f6f2daaf', 'd9394920_fc42_4471_9f5c_e201acf73ee3', 'excel 导出', '', '', '', null);
INSERT INTO `sys_menu` VALUES ('ddabae5e_ffd7_489a_8ce2_f8dc3ac50410', '941255a0_01a5_4a65_8cb2_fa01e129ba89', '面积图', '/jsp/ext/chart/areaChart.jsp', '', '1', null);
INSERT INTO `sys_menu` VALUES ('e14f34dc_aa7c_4d0e_b167_f795bff8bb7f', '1bd18427_2528_4705_bddc_21e2aa825662', '日志管理<!-- -->', '/jsp/system/logManage.jsp', '', '', null);
INSERT INTO `sys_menu` VALUES ('e4d67956_01cb_445d_8f56_28fc06074636', '941255a0_01a5_4a65_8cb2_fa01e129ba89', '图表测试页面', '/jsp/ext/chart/testChart.jsp', '', '9', null);
INSERT INTO `sys_menu` VALUES ('e4f8cd3a_5ca9_4d86_ae86_039c00aaa2f7', '3cec587b_f0d3_48b3_9221_9fc6e2a08e78', 'extjs 布局 （layout）', '', '', '', null);
INSERT INTO `sys_menu` VALUES ('root', '0', 'jdbcMav', 'url', 'url test', '23', null);
