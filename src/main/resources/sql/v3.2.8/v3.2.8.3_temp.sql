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


# 出入库管理菜单
INSERT INTO `sys_module` VALUES ( 'warehouseManage', NULL, '出入库管理 ', 'procurementContractMgr', '/procurementContract/warehouseManage.jsp', '1', '1', NULL, NULL, NULL, '7', NULL, '1', NULL, NULL );
INSERT INTO `sys_module` VALUES ( 'warehouseManage_editState', NULL, '编辑是否有效', 'warehouseManage', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL );
INSERT INTO `sys_module` VALUES ( 'warehouseManage_export', NULL, '导出出入库报表', 'warehouseManage', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL );

# 出入库管理菜单权限
INSERT INTO `sys_rolemodule` (`module_id`, `role_id`) VALUES ('warehouseManage_editState', 'Role_Channel_manager');
INSERT INTO `sys_rolemodule` (`module_id`, `role_id`) VALUES ('warehouseManage_export', 'Role_Channel_manager');
INSERT INTO `sys_rolemodule` (`module_id`, `role_id`) VALUES ('warehouseManage_editState', 'ROLE_ID78f301ba_b308_4dcc_9991_30bf6b04c4c1');
INSERT INTO `sys_rolemodule` (`module_id`, `role_id`) VALUES ('warehouseManage_export', 'ROLE_ID78f301ba_b308_4dcc_9991_30bf6b04c4c1');


# 查询匹配 名称及规格、数量
select uu.d_number, uu.self_model from dcms_purchase_receipt_details rd 
left join (
	SELECT count(DISTINCT id) as d_number, tt.p_cont_id, tt.sale_cont_id, tt.tax_rate_act, tt.p_money, tt.self_model FROM ( 
		SELECT id, p_cont_id, sale_cont_id, tax_rate_act, p_money1 AS p_money, self_model FROM dcms_purchase_product_detail WHERE tax_rate_act IS NOT NULL 
		UNION ALL 
		SELECT id, p_cont_id, sale_cont_id, tax_rate_act2, p_money2, self_model FROM dcms_purchase_product_detail WHERE tax_rate_act2 IS NOT NULL 
		UNION ALL 
		SELECT id, p_cont_id, sale_cont_id, tax_rate_act3, p_money3, self_model FROM dcms_purchase_product_detail WHERE tax_rate_act3 IS NOT NULL 
	) tt 
	GROUP BY tt.p_cont_id, tt.sale_cont_id, tt.tax_rate_act 
	ORDER BY tt.p_money DESC
) uu
ON rd.p_cont_id = uu.p_cont_id AND rd.sale_cont_id = uu.sale_cont_id AND rd.tax_rate = uu.tax_rate_act;


################################################ 采购合同模版调整 by wwp 2018-12-14 begin #################################################################
#	修改导入‘采购合同申请查询表’模版
UPDATE tbl_imp_cfg_dtl SET Sort_Val = Sort_Val + 2 WHERE imp_id = '0000034' AND Sort_Val > 13;
INSERT INTO `tbl_imp_cfg_dtl` ( `imp_id`, `dtl_id`, `fld_nm`, `fld_caption`, `PK_Flg`, `Sort_Val`, `data_tp`, `def_val`, `def_val_tp`, `allow_blank` ) VALUES ( '0000034', '0003019', 'our_sign_time', '签署日期', '1', '14', '3', 'com.nantian.imp.impl.purchase.PurchaserDateDefaultValue', '1', '1' );
INSERT INTO `tbl_imp_cfg_dtl` ( `imp_id`, `dtl_id`, `fld_nm`, `fld_caption`, `PK_Flg`, `Sort_Val`, `data_tp`, `def_val`, `def_val_tp`, `allow_blank` ) VALUES ('0000034', '0003020', 'payment_way', '付款方式', '1', '15', '0', NULL, '1', '1');

#	修改导入‘采购产品明细表’模版
UPDATE tbl_imp_cfg_dtl SET Sort_Val = Sort_Val + 1 WHERE imp_id = '0000035' AND Sort_Val > 5;
INSERT INTO `tbl_imp_cfg_dtl` ( `imp_id`, `dtl_id`, `fld_nm`, `fld_caption`, `PK_Flg`, `Sort_Val`, `data_tp`, `def_val`, `def_val_tp`, `allow_blank` ) VALUES ('0000035', '0004017', 'product_brand', '产品品牌', '1', '6', '0', NULL, '1', '1');

#	‘采购合同表’新增字段 ‘付款方式’
ALTER TABLE dcms_purchase_contract ADD COLUMN payment_way VARCHAR (100) DEFAULT NULL COMMENT '付款方式';

# ‘采购产品明细表’新增‘产品品牌’字段
ALTER TABLE dcms_purchase_product_detail ADD COLUMN product_brand VARCHAR (255) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品品牌';

# 修改名称‘付款方式’---‘最终付款方式’
ALTER TABLE dcms_purchase_contract MODIFY `final_payment_way` VARCHAR (100) DEFAULT NULL COMMENT '最终付款方式';
UPDATE tbl_imp_cfg_dtl SET fld_caption = '最终付款方式' WHERE imp_id = '0000034' AND dtl_id = '0003010' AND fld_caption = '付款方式';
################################################ 采购合同模版调整 end #################################################################

