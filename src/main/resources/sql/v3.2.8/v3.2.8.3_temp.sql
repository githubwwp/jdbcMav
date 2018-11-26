# 新增字段 ‘出入库状态’ 并 初始化
ALTER TABLE dcms_purchase_receipt_details ADD COLUMN `warehouse_state` VARCHAR (2) DEFAULT '0' COMMENT '出入库状态(0：未完成；1：已完成)';
UPDATE dcms_purchase_receipt_details SET warehouse_state = '1';

# 新增列 ‘是否人工修改过采购产品’
ALTER TABLE dcms_purchase_contract ADD COLUMN `edit_product_state` CHAR (2) DEFAULT '0' COMMENT '是否人工修改过采购产品（0：否；1：是）';

# 创建 ‘出入库账单’ 表
DROP TABLE IF  EXISTS `dcms_purchase_warehouse_bill`;
CREATE TABLE `dcms_purchase_warehouse_bill` (
  `wb_no` varchar(50) NOT NULL COMMENT '单号',
  `wb_date` date DEFAULT NULL COMMENT '日期',
  `wb_order` varchar(10) DEFAULT NULL COMMENT '序号',
  `wb_name` varchar(30) DEFAULT NULL COMMENT '缴仓',
  `union_p_cont_id` text COMMENT '拼接采购合同编号',
  `wb_state` char(2) DEFAULT NULL COMMENT '是否有效（0：无效；1：有效）',
  PRIMARY KEY (`wb_no`),
  UNIQUE KEY `pk_date_order` (`wb_date`,`wb_order`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='出入库账单';

# 创建 ‘出入库账单明细’ 表
DROP TABLE IF  EXISTS `dcms_purchase_warehouse_bill_detail`;
CREATE TABLE `dcms_purchase_warehouse_bill_detail` (
  `d_id` int(11) NOT NULL,
  `wb_no` varchar(50) DEFAULT NULL COMMENT '出入库账单编号',
  `p_cont_id` varchar(60) DEFAULT NULL COMMENT '采购合同编号',
  `d_specification` varchar(255) DEFAULT NULL COMMENT '名称及规格',
  `d_number` int(11) DEFAULT NULL COMMENT '数量',
  `d_unit` varchar(60) DEFAULT NULL COMMENT '单位',
  `sale_cont_id` varchar(60) DEFAULT NULL COMMENT '对应销售合同（股份编号）',
  `d_consignee_name` varchar(60) DEFAULT NULL COMMENT '提货人',
  `d_output_user` varchar(128) DEFAULT NULL COMMENT '销项用户',
  `d_money` decimal(16,2) DEFAULT NULL COMMENT '金额 ',
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='出入库账单明细';



# 主业务类型下拉框 sql
SELECT
	*
FROM (
	SELECT
		a.product_code,
		CONCAT_WS('/', b.product_nm, a.product_nm) AS product_explain
	FROM
		dcms_product_param a
	LEFT OUTER JOIN dcms_product_param b ON a.pproduct_code = b.product_code
	WHERE
		a.product_code NOT IN (SELECT pproduct_code FROM dcms_product_param)
) pro_code;


# 我的任务新菜单
INSERT INTO `sys_module` VALUES ('myTaskManageNew', NULL, '我的任务new', 'myDomain', '/dcms2/taskmanage/myTaskNew.jsp', '1', '1', NULL, NULL, NULL, '2', NULL, '1', NULL, NULL);
INSERT INTO `sys_module` VALUES ('mtmn_batchExtraInfo', NULL, '批量录入补充信息', 'myTaskManageNew', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('mtmn_edit', NULL, '编辑', 'myTaskManageNew', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
# 我的任务-菜单权限
INSERT INTO `sys_rolemodule` (`module_id`, `role_id`) VALUES ('mtmn_batchExtraInfo', 'Role_Channel_manager');
INSERT INTO `sys_rolemodule` (`module_id`, `role_id`) VALUES ('mtmn_edit', 'Role_Channel_manager');
INSERT INTO `sys_rolemodule` (`module_id`, `role_id`) VALUES ('mtmn_batchExtraInfo', 'ROLE_ID78f301ba_b308_4dcc_9991_30bf6b04c4c1');
INSERT INTO `sys_rolemodule` (`module_id`, `role_id`) VALUES ('mtmn_edit', 'ROLE_ID78f301ba_b308_4dcc_9991_30bf6b04c4c1');




