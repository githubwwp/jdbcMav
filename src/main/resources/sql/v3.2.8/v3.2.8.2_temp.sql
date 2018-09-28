# 修改字段 精确度 by wwp 2018-07-16
ALTER TABLE dcms_001bill_rece_relation MODIFY `allo_amount` DECIMAL (16, 4) DEFAULT NULL COMMENT '分配金额';

# 销售任务表新增统计字段 by wwp 2018-07-25
ALTER TABLE dcms_sale_task
ADD jc_add_cont_task DECIMAL (16, 4) DEFAULT NULL COMMENT '集成新增合同金额任务' AFTER jc_rece_task,
ADD jc_notax_rece_task DECIMAL (16, 4) DEFAULT NULL COMMENT '集成不含税收款任务' AFTER jc_rece_task,
ADD jc_bill_notax_gross_task DECIMAL (16, 4) DEFAULT NULL COMMENT '集成开票不含税毛利任务' AFTER jc_rece_task,
ADD rj_add_cont_task DECIMAL (16, 4) DEFAULT NULL COMMENT '软件新增合同金额任务' AFTER rj_rece_task,
ADD rj_notax_rece_task DECIMAL (16, 4) DEFAULT NULL COMMENT '软件不含税收款任务' AFTER rj_rece_task,
ADD rj_bill_notax_gross_task DECIMAL (16, 4) DEFAULT NULL COMMENT '软件开票不含税毛利任务' AFTER rj_rece_task,
ADD sum_add_cont_task DECIMAL (16, 4) DEFAULT NULL COMMENT '新增合同金额任务合计' AFTER sum_rece_task,
ADD sum_notax_rece_task DECIMAL (16, 4) DEFAULT NULL COMMENT '不含税收款任务合计' AFTER sum_rece_task,
ADD sum_bill_notax_gross_task DECIMAL (16, 4) DEFAULT NULL COMMENT '开票不含税毛利任务合计' AFTER sum_rece_task;


# 销售任务历史表新增统计字段 by wwp 2018-08-02
ALTER TABLE dcms_sale_task_his
ADD sum_confirm_bill_notax_gross DECIMAL (16, 4) DEFAULT NULL COMMENT '已确认开票不含税毛利合计' AFTER sum_sale_create,
ADD sum_act_bill_notax_gross DECIMAL (16, 4) DEFAULT NULL COMMENT '实际开票不含税毛利合计' AFTER sum_sale_create,
ADD sum_bill_notax_gross_task DECIMAL (16, 4) DEFAULT NULL COMMENT '开票不含税毛利任务合计' AFTER sum_sale_create,
ADD sum_notax_rece DECIMAL (16, 4) DEFAULT NULL COMMENT '不含税收款金额合计' AFTER sum_sale_create,
ADD sum_notax_rece_task DECIMAL (16, 4) DEFAULT NULL COMMENT '不含税收款任务合计' AFTER sum_sale_create,
ADD sum_add_cont DECIMAL (16, 4) DEFAULT NULL COMMENT '新增合同金额合计' AFTER sum_sale_create,
ADD sum_add_cont_task DECIMAL (16, 4) DEFAULT NULL COMMENT '新增合同金额任务合计' AFTER sum_sale_create,

ADD rj_confirm_bill_notax_gross DECIMAL (16, 4) DEFAULT NULL COMMENT '软件已确认开票不含税毛利' AFTER rj_actual_rece,
ADD rj_act_bill_notax_gross DECIMAL (16, 4) DEFAULT NULL COMMENT '软件实际开票不含税毛利' AFTER rj_actual_rece,
ADD rj_bill_notax_gross_task DECIMAL (16, 4) DEFAULT NULL COMMENT '软件开票不含税毛利任务' AFTER rj_actual_rece,
ADD rj_notax_rece DECIMAL (16, 4) DEFAULT NULL COMMENT '软件不含税收款金额' AFTER rj_actual_rece,
ADD rj_notax_rece_task DECIMAL (16, 4) DEFAULT NULL COMMENT '软件不含税收款任务' AFTER rj_actual_rece,
ADD rj_add_cont DECIMAL (16, 4) DEFAULT NULL COMMENT '软件新增合同金额' AFTER rj_actual_rece,
ADD rj_add_cont_task DECIMAL (16, 4) DEFAULT NULL COMMENT '软件新增合同金额任务' AFTER rj_actual_rece,

ADD jc_confirm_bill_notax_gross DECIMAL (16, 4) DEFAULT NULL COMMENT '集成已确认开票不含税毛利' AFTER jc_actual_rece,
ADD jc_act_bill_notax_gross DECIMAL (16, 4) DEFAULT NULL COMMENT '集成实际开票不含税毛利' AFTER jc_actual_rece,
ADD jc_bill_notax_gross_task DECIMAL (16, 4) DEFAULT NULL COMMENT '集成开票不含税毛利任务' AFTER jc_actual_rece,
ADD jc_notax_rece DECIMAL (16, 4) DEFAULT NULL COMMENT '集成不含税收款金额' AFTER jc_actual_rece,
ADD jc_notax_rece_task DECIMAL (16, 4) DEFAULT NULL COMMENT '集成不含税收款任务' AFTER jc_actual_rece,
ADD jc_add_cont DECIMAL (16, 4) DEFAULT NULL COMMENT '集成新增合同金额' AFTER jc_actual_rece,
ADD jc_add_cont_task DECIMAL (16, 4) DEFAULT NULL COMMENT '集成新增合同金额任务' AFTER jc_actual_rece;


# 删除我的地盘下的部分菜单 by wwp 2018-08-15
DELETE m, rm 
FROM sys_module m 
LEFT JOIN sys_rolemodule rm on m.module_id = rm.module_id WHERE 
	m.module_id IN ( 
	SELECT * FROM ( 
		SELECT module_id FROM sys_module 
		WHERE module_id IN ( '###' ) 
		OR pmodule_id IN ( '###' ) 
	) aa 
);


# 新增‘存货估价说明’ 字段 by wwp 2018-08-28
ALTER TABLE dcms_sales_contract_register ADD inventory_valuation_explain VARCHAR (255) DEFAULT NULL COMMENT '存货估价说明';


# 删除 ‘合同所述周期’ 的‘预编号’ 状态 by wwp 2018-08-30
DELETE FROM sys_datadictionary WHERE dd_dictname = 'AG_STATE' AND dd_id = '02';


## 添加菜单 销售合同信息
INSERT INTO `sys_module` VALUES ( 'saleContInfo', NULL, '销售合同信息', 'ContractMgr', '/contract/contsinfo/contInfoManage.jsp', '1', '1', NULL, NULL, NULL, '0', NULL, '1', NULL, NULL );
INSERT INTO `sys_module` VALUES ('saleContInfo_addAdvance', NULL, '新增预6', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_addNextAdvance', NULL, '新增下期预6', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_addRemark', NULL, '添加备注', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_annualKnot', NULL, '年结', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_batchEditTaskor', NULL, '批量编辑任务责任人', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_contTrack', NULL, '合同跟踪表', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_deregulation', NULL, '解除监管', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_editAdvance', NULL, '编辑预6', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_editInventoryDesc', NULL, '编辑存货估价说明', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_editTaskor', NULL, '编辑任务责任人', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_editUnplanDesc', NULL, '编辑未计划额说明', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_exportContInfo', NULL, '导出合同信息', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_importOaCont', NULL, '导入OA合同信息', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_manualAdjust', NULL, '手工调账', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_oaImportLog', NULL, '查看OA导入日志', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_updateAnnualInfo', NULL, '更新年度信息', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('saleContInfo_yearInfo', NULL, '年度信息表', 'saleContInfo', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


#  销售合同信息 菜单权限
INSERT INTO sys_rolemodule (module_id, role_id)
SELECT a.module_id, b.role_id FROM (
	SELECT 'saleContInfo_contTrack' module_id 
	UNION 
	SELECT 'saleContInfo_yearInfo' 
	UNION 
	SELECT 'saleContInfo_oaImportLog' 
	UNION 
	SELECT 'saleContInfo_exportContInfo' 
) a, 
( SELECT role_id, ROLE_NAME FROM `sys_role` WHERE ROLE_NAME IN ( '市场部销售人员', '市场部助理', '市场部部门经理', '渠道主管', '渠道专员', '商务专员', '南区财务平台', '财务应收管理', '销售合同查看', '服务中心', '非市场部销售', '中心部门经理', '开发中心PMO', '系统中心', '系统中心部门经理', '开发中心项目经理', '项目QA', '入口管理员', '中心经营管理', '总经理办公会' )
) b;

INSERT INTO sys_rolemodule (module_id, role_id)
VALUES
( 'saleContInfo_importOaCont', 'ROLE_ID_cen_mana' ),
( 'saleContInfo_importOaCont', 'ROLE_ID7da40c06_6681_4095_bc11_5180caaf8863' ),
( 'saleContInfo_annualKnot', 'ROLE_ID87b41a83_5ffb_4a62_a831_eca52303f59e' ),
( 'saleContInfo_manualAdjust', '500022' ),
( 'saleContInfo_batchEditTaskor', 'ROLE_ID2a0f0e28_0682_485b_90e5_a57835d95619' ),
( 'saleContInfo_editTaskor', 'ROLE_ID2a0f0e28_0682_485b_90e5_a57835d95619' ),
( 'saleContInfo_editAdvance', 'Role_moblie_mamage' ),
( 'saleContInfo_editAdvance', 'Role_moblie_mamage' ),
( 'saleContInfo_addNextAdvance', 'Role_moblie_mamage' ),
( 'saleContInfo_editUnplanDesc', 'ROLE_ID_cen_mana' ),
( 'saleContInfo_editInventoryDesc', 'ROLE_ID_cen_mana' ),
( 'saleContInfo_addRemark', 'ROLE_ID_cen_mana' ),
( 'saleContInfo_deregulation', 'ROLE_ID_cen_mana' );


# 删除销售合同管理下原二级菜单‘计划销项明细管理’‘计划开票’‘计划收款’实际开票收款’
DELETE m, rm 
FROM sys_module m 
LEFT JOIN sys_rolemodule rm on m.module_id = rm.module_id WHERE 
	m.module_id IN ( 
	SELECT * FROM ( 
		SELECT module_id FROM sys_module 
		WHERE module_id IN ( 'salesDetails', 'planNotePointMgr', 'planNoteCost', 'actInvoice' ) 
		OR pmodule_id IN ( 'salesDetails', 'planNotePointMgr', 'planNoteCost', 'actInvoice' ) 
	) aa 
);

INSERT INTO `sys_module` VALUES ('actBillReceManage', NULL, '实际开票收款', 'ContractMgr', '/contract/actBillRece/actBillReceManage.jsp', '1', '1', NULL, NULL, NULL, '5', NULL, '1', NULL, NULL);


## 新增经营单元与中心对应关系 by wwp 2018-09-04
INSERT INTO `dcms_system_par` (`id`, `pram_id`, `pare_id`, `use_dep`, `pram_name`, `pram_type`, `pram_val`, `des_text`, `is_use`, `is_main`, `final_modifier`, `final_modify_time`, `orderby`) VALUES ('ID2e626223_4fde_4d93_8c35_928976045a4d', 'businessUnit_center', NULL, 'gznt', '软件', '5', 'kfzx', '开发中心对应经营单元名称', '1', '1', 'superadmin', '2018-09-06', 'a1');
INSERT INTO `dcms_system_par` (`id`, `pram_id`, `pare_id`, `use_dep`, `pram_name`, `pram_type`, `pram_val`, `des_text`, `is_use`, `is_main`, `final_modifier`, `final_modify_time`, `orderby`) VALUES ('ID312c532e_3ba8_4eef_a7b8_d93bd8bbf0a1', 'businessUnit_center', NULL, 'gznt', '系统集成', '5', 'xtzx', '南区集成中心对应经营单元名称', '1', '1', 'superadmin', '2018-09-06', 'a2');
INSERT INTO `dcms_system_par` (`id`, `pram_id`, `pare_id`, `use_dep`, `pram_name`, `pram_type`, `pram_val`, `des_text`, `is_use`, `is_main`, `final_modifier`, `final_modify_time`, `orderby`) VALUES ('ID457174f6_b158_4cfa_b87f_44527f00bf75', 'businessUnit_center', NULL, 'gznt', '信息产品', '5', 'fwzx', '南区产品销售服务中心对应经营单元名称', '1', '1', 'superadmin', '2018-09-06', 'a3');



## 实际开票菜单 by wwp 2018-09-10
INSERT INTO `sys_module` VALUES ('actBillManage', NULL, '实际开票', 'ContractMgr', '/contract/actBillRece/actBillManage.jsp', '1', '1', NULL, NULL, NULL, '5', NULL, '1', NULL, NULL);
INSERT INTO `sys_module` VALUES ('actBillManage_addConfirmDetail', NULL, '新增', 'actBillManage', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('actBillManage_batchConfirm', NULL, '批量核算确认', 'actBillManage', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('actBillManage_confirm', NULL, '核算确认', 'actBillManage', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('actBillManage_confirmMonthCont', NULL, '核算月结', 'actBillManage', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('actBillManage_deConfrimDetail', NULL, '删除', 'actBillManage', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('actBillManage_editAddDetail', NULL, '编辑新增明细', 'actBillManage', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('actBillManage_editConfirmDetail', NULL, '编辑核算明细', 'actBillManage', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('actBillManage_exportBC', NULL, '导出实际开票及核算表', 'actBillManage', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('actBillManage_mobileMonthCont', NULL, '移动端月结', 'actBillManage', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_module` VALUES ('actBillManage_showConfirmDetail', NULL, '查看核算明细', 'actBillManage', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

# 【导出实际开票及核算表】【查看核算明细】
INSERT INTO sys_rolemodule (module_id, role_id) 
SELECT m.module_id, r.role_id FROM sys_module m, sys_role r 
WHERE m.module_id IN ( 'actBillManage_exportBC', 'actBillManage_showConfirmDetail' ) 
AND r.role_id IN ( '300020', 'QA', 'Role_Channel_manager', 'ROLE_ID2811915d_77bc_471b_b6ec_3d1d902e97d1', 'ROLE_ID36d2c3c9_8c6c_46cc_bd63_815b5e50b52f', 'ROLE_ID38a10b08_d36a_450b_9762_c628948c600b', 'ROLE_ID43af15aa_a754_4749_8717_55f5ba235f35', 'ROLE_ID59625eab_e3ac_4529_b09d_33cf64f3bdba', 'ROLE_ID7215a09e_6006_45f7_bfd7_117dd2942b16', 'ROLE_ID78f301ba_b308_4dcc_9991_30bf6b04c4c1', 'ROLE_ID9609fb86_7135_432a_a2aa_4bbef97d1d42', 'ROLE_IDa19ed45c_f19c_4af9_9338_da740d8b7a3e', 'ROLE_IDaa767379_7da1_4c69_8bcd_dd777f5107ee', 'ROLE_IDe0311c9a_d068_4736_8ddd_647d2ffd08f4', 'ROLE_IDeb5f71b0_ed17_4e37_a0c1_9f2766544ab2', 'ROLE_IDf3262e45_1e16_45cc_abcb_78fd7d940618', 'ROLE_IDf81be878_d530_4503_99d6_5ec97faf5347', 'ROLE_ID_cen_mana', 'Role_moblie_mamage', 'Role_moblie_sale' )
;
# 【移动端月结】【核算月结】
INSERT INTO sys_rolemodule (module_id, role_id) 
SELECT m.module_id, r.role_id FROM sys_module m, sys_role r 
WHERE m.module_id IN ( 'actBillManage_mobileMonthCont', 'actBillManage_confirmMonthCont' ) 
AND r.role_id IN ( 'ROLE_ID87b41a83_5ffb_4a62_a831_eca52303f59e' )
;
# 【批量核算确认】【核算确认】【新增】【编辑核算明细】【编辑新增明细】
INSERT INTO sys_rolemodule (module_id, role_id) 
SELECT m.module_id, r.role_id FROM sys_module m, sys_role r 
WHERE m.module_id IN ( 'actBillManage_deConfrimDetail', 'actBillManage_batchConfirm', 'actBillManage_confirm', 'actBillManage_addConfirmDetail', 'actBillManage_editConfirmDetail', 'actBillManage_editAddDetail' ) 
AND r.role_id IN ( 'ROLE_ID_cen_mana' )
;


## 实际收款菜单 by wwp 2018-09-10
INSERT INTO `sys_module` VALUES ('actReceManage', NULL, '实际收款', 'ContractMgr', '/contract/actBillRece/actReceManage.jsp', '1', '1', NULL, NULL, NULL, '5', NULL, '1', NULL, NULL);
INSERT INTO `sys_module` VALUES ('actReceManage_export', NULL, '导出实际收款', 'actReceManage', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
# 导出实际收款
INSERT INTO sys_rolemodule (module_id, role_id) 
SELECT m.module_id, r.role_id FROM sys_module m, sys_role r 
WHERE m.module_id IN ( 'actReceManage_export' ) 
AND r.role_id IN ( '300020', 'QA', 'Role_Channel_manager', 'ROLE_ID2811915d_77bc_471b_b6ec_3d1d902e97d1', 'ROLE_ID36d2c3c9_8c6c_46cc_bd63_815b5e50b52f', 'ROLE_ID38a10b08_d36a_450b_9762_c628948c600b', 'ROLE_ID43af15aa_a754_4749_8717_55f5ba235f35', 'ROLE_ID59625eab_e3ac_4529_b09d_33cf64f3bdba', 'ROLE_ID7215a09e_6006_45f7_bfd7_117dd2942b16', 'ROLE_ID78f301ba_b308_4dcc_9991_30bf6b04c4c1', 'ROLE_ID9609fb86_7135_432a_a2aa_4bbef97d1d42', 'ROLE_IDa19ed45c_f19c_4af9_9338_da740d8b7a3e', 'ROLE_IDaa767379_7da1_4c69_8bcd_dd777f5107ee', 'ROLE_IDe0311c9a_d068_4736_8ddd_647d2ffd08f4', 'ROLE_IDeb5f71b0_ed17_4e37_a0c1_9f2766544ab2', 'ROLE_IDf3262e45_1e16_45cc_abcb_78fd7d940618', 'ROLE_IDf81be878_d530_4503_99d6_5ec97faf5347', 'ROLE_ID_cen_mana', 'Role_moblie_mamage', 'Role_moblie_sale' )
;


# 删除部分 开票计划状态，并同步 开票计划 数据
DELETE FROM sys_datadictionary WHERE dd_dictname = 'PLAN_STATE' AND dd_id IN (3, 4, 5);
DELETE FROM a_ag_incplay WHERE state = '5';
UPDATE a_ag_incplay SET state = '2' WHERE state IN ('3', '4');


# 修改表存储引擎
ALTER TABLE a_ag_info ENGINE = INNODB;
ALTER TABLE a_ag_incplay ENGINE = INNODB;


##  创建视图（计算‘合同的计划开票和（已出票状态）’）
CREATE OR REPLACE VIEW v_sum_incplay_money_cp AS 
SELECT
	`a_ag_incplay`.`ag_id` AS `ag_id`,
	sum(
		`a_ag_incplay`.`incPlay_money`
	) AS `sum_incPlay_money_cp`
FROM
	`a_ag_incplay`
WHERE
	(`a_ag_incplay`.`state` = '2')
GROUP BY
	`a_ag_incplay`.`ag_id`
;

## 修改视图 v_no_plan_money （添加计划执行偏差）
CREATE OR REPLACE VIEW v_no_plan_money AS 
select 
	`vnpm_aginfo`.`ag_id` AS `ag_id`,
	`vnpm_aginfo`.`ag_money` AS `ag_money`,
	`vnpm_vsis`.`sum_i_money_s` AS `sum_i_money_s`,
	`vnpm_vsim`.`sum_incPlay_money` AS `sum_incPlay_money`,
	(`vnpm_aginfo`.`ag_money` - (ifnull(`vnpm_vsis`.`sum_i_money_s`,0) + ifnull(`vnpm_vsim`.`sum_incPlay_money`,0))) AS `no_plan_money`,
	(`vnpm_aginfo`.`ag_money` - ifnull(`vnpm_vsis`.`sum_i_money_s`,0)) AS `no_bill_money`,
	( ifnull(`vnpm_vsis`.`sum_i_money_s`,0) - ifnull(vs_cp.sum_incPlay_money_cp,0) ) AS plan_exec_bias
from ((
	`a_ag_info` `vnpm_aginfo` 
	left join `v_sum_imoney_s` `vnpm_vsis` on((`vnpm_vsis`.`ag_id` = `vnpm_aginfo`.`ag_id`))) 
	left join `v_sum_incplay_money` `vnpm_vsim` on((`vnpm_vsim`.`ag_id` = `vnpm_aginfo`.`ag_id`))
	left join v_sum_incplay_money_cp vs_cp on vs_cp.ag_id = vnpm_aginfo.ag_id
)
;

## 修改视图 v_now_i_money_s (计算结转年及以后 '实际开票金额求和')
CREATE OR REPLACE VIEW v_now_i_money_s AS 
select 
	sum(`bill`.`total_tax`) AS `now_i_money_s`,
	`bill`.`cont_id` AS `ag_id` 
from 
	`dcms_001bill` `bill` 
where 
	(`bill`.`invoice_date` >= (
		select concat(`a_sys_prarmeter`.`sys_text`,'-01-01') from `a_sys_prarmeter` where (`a_sys_prarmeter`.`sys_no` = 'carryoverYear')
	))
group by `bill`.`cont_id`
;

# 新增字段 ‘未计划额类型’
ALTER TABLE a_ag_info ADD COLUMN `no_plan_cost_type` CHAR (1) DEFAULT NULL COMMENT '未计划额类型(1: 开票计划不全; 2: 执行状态误判; 3: 合同额待变更; 4: 其他)' AFTER `no_plan_cost_desc`;
INSERT INTO `sys_datadictionary` (`dd_dictname`, `dd_id`, `dd_text`, `dd_desc`, `dd_flag`, `dd_order`, `dd_enabled`) VALUES ('AG_NOPLAN_TYPE', '1', '开票计划不全', '未计划额类型', NULL, '1', '1');
INSERT INTO `sys_datadictionary` (`dd_dictname`, `dd_id`, `dd_text`, `dd_desc`, `dd_flag`, `dd_order`, `dd_enabled`) VALUES ('AG_NOPLAN_TYPE', '2', '执行状态误判', '未计划额类型', NULL, '1', '1');
INSERT INTO `sys_datadictionary` (`dd_dictname`, `dd_id`, `dd_text`, `dd_desc`, `dd_flag`, `dd_order`, `dd_enabled`) VALUES ('AG_NOPLAN_TYPE', '3', '合同额待变更', '未计划额类型', NULL, '3', '1');
INSERT INTO `sys_datadictionary` (`dd_dictname`, `dd_id`, `dd_text`, `dd_desc`, `dd_flag`, `dd_order`, `dd_enabled`) VALUES ('AG_NOPLAN_TYPE', '4', '其他', '未计划额类型', NULL, '4', '1');

### "开票计划跟踪" 菜单调整
INSERT INTO `sys_module` (`module_id`, `module_opcode`, `module_name`, `pmodule_id`, `module_entry`, `module_type`, `module_valid`, `module_pic_big`, `module_pic_small`, `help_page`, `module_order`, `module_hide`, `module_version`, `module_target`, `module_canedit`) VALUES ('planTrack_edit', NULL, '编辑', 'planTrack', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
# 删除开票计划菜单下原先菜单角色关系
DELETE rm 
FROM sys_module m 
LEFT JOIN sys_rolemodule rm on m.module_id = rm.module_id WHERE 
	m.module_id IN ( 
	SELECT * FROM ( 
		SELECT module_id FROM sys_module 
		WHERE module_id IN ( 'planTrack' ) 
		OR pmodule_id IN ( 'planTrack' ) 
	) aa 
);
# 计划跟踪查看
INSERT INTO sys_rolemodule (module_id, role_id) 
SELECT m.module_id, r.role_id FROM sys_module m, sys_role r 
WHERE m.module_id IN ( 'planTrack_sarech' ) 
AND r.ROLE_NAME IN ( '市场部销售人员','市场部助理','市场部部门经理','渠道主管','渠道专员','商务专员','南区财务平台','财务应收管理','销售合同查看','服务中心','非市场部销售','中心部门经理','开发中心PMO','系统中心','系统中心项目经理','开发中心项目经理','项目QA','入口管理员','中心经营管理','总经理办公会' )
;
# 生成版本
INSERT INTO sys_rolemodule (module_id, role_id) 
SELECT m.module_id, r.role_id FROM sys_module m, sys_role r 
WHERE m.module_id IN ( 'planTrack_ver' ) 
AND r.ROLE_NAME IN ('中心经营管理')
;
# 编辑
INSERT INTO sys_rolemodule (module_id, role_id) 
SELECT m.module_id, r.role_id FROM sys_module m, sys_role r 
WHERE m.module_id IN ( 'planTrack_edit' ) 
AND r.ROLE_NAME IN ('中心经营管理','项目QA','市场部销售人员','非市场部销售','中心部门经理')
;


# 删除视图
DROP VIEW IF EXISTS v_now_i_money_s;

## 修改视图 v_sum_imoney_s
CREATE OR REPLACE VIEW v_sum_imoney_s AS
SELECT
   `vsis_aginfo`.`ag_id` AS `ag_id`,
   ifnull(`vsis_yearinfo`.`all_incMoney`, 0) AS `sum_i_money_s`
FROM
   (
      (
         `a_ag_info` `vsis_aginfo`
         LEFT JOIN `a_ag_yearinfo` `vsis_yearinfo` ON (
            (
               (`vsis_yearinfo`.`ag_id` = `vsis_aginfo`.`ag_id`)
               AND (
                  `vsis_yearinfo`.`yearNo` = (
                     SELECT
                        `a_sys_prarmeter`.`sys_text`
                     FROM
                        `a_sys_prarmeter`
                     WHERE
                        (`a_sys_prarmeter`.`sys_no` = 'carryoverYear')
                  )
               )
            )
         )
      )
   )
   ;
   
## 合同跟踪界面插叙需要的数据
 `cont_tax_free_income` DOUBLE (16, 2) DEFAULT NULL COMMENT '预计销售收入',
 `cont_advance_gross_profit` DOUBLE (16, 2) DEFAULT NULL COMMENT '预计毛利',
 `cont_advance_gross_profit_rate` DOUBLE (16, 4) DEFAULT NULL COMMENT '预计毛利率',
 `cont_plan_pro` DOUBLE (16, 2) DEFAULT NULL COMMENT '预计利润',
 `cont_plan_proRate` double(16,4) DEFAULT NULL COMMENT '预计利润率',
 `cont_tax_cost` DOUBLE (16, 2) DEFAULT NULL COMMENT '预计产品成本(含税)',
 `cont_tax_free_cost_cp` DOUBLE (16, 2) DEFAULT NULL COMMENT '预计产品成本(不含税)',
 `pre_close_cost` DECIMAL (16, 2) DEFAULT NULL COMMENT '预计产品结算成本含税',
 `pre_close_free_cost` DECIMAL (16, 2) DEFAULT NULL COMMENT '预计产品结算成本（不含税）',
 `pre_other_cost` DECIMAL (16, 2) DEFAULT NULL COMMENT '预计其他成本含税',
 `cont_tax_free_cost_qita` DOUBLE (16, 2) DEFAULT NULL COMMENT '预计其他成本(不含税)',
 `plan_fixed_cost` DOUBLE (16, 2) DEFAULT NULL COMMENT '实施固定费用',
 `plan_vari_cost` DOUBLE (16, 2) DEFAULT NULL COMMENT '实施变动费用',
 `cont_market_cost` DOUBLE (16, 2) DEFAULT NULL COMMENT '预估销售费用',
 `cont_capital_cost` DOUBLE (16, 2) DEFAULT NULL COMMENT '预计资金占用费',
 `cont_yinhua_planTax` DOUBLE (16, 2) DEFAULT NULL COMMENT '预计印花税',
 `cont_yingye_planTax` DOUBLE (16, 2) DEFAULT NULL COMMENT '预计营业税'
;


   
   
   




