# 备份并删除表 dcms_contract_project_connection; by wwp 2018-03-13
DROP TABLE IF EXISTS dcms_contract_project_connection_20180313;
CREATE TABLE dcms_contract_project_connection_20180313 SELECT * FROM dcms_contract_project_connection;
DELETE FROM dcms_contract_project_connection;


# 查询挂在失效部门下的人员； by wwp 2018-03-13
SELECT emp.Emp_id, org.ORG_NAME FROM dcms_employee_information emp 
INNER JOIN sys_org org ON emp.Emp_dep = org.ORG_ID 
WHERE org.ORG_NAME LIKE 'T%';

# 查询未挂部门的人员 by wwp 2018-03-13
SELECT * FROM dcms_employee_information emp 
WHERE NOT EXISTS ( SELECT * FROM sys_org org WHERE org.org_id = emp.Emp_dep );

# 查询 菜单 合同项目对应，子菜单 及对应的角色菜单关系
select * FROM sys_module module 
LEFT JOIN sys_rolemodule rm ON module.module_id = rm.module_id 
WHERE module.module_id = 'contractProjectConnectMgr' OR module.pmodule_id = 'contractProjectConnectMgr';

# 添加菜单 项目信息_new
INSERT INTO `sys_module`  VALUES ('projectInfoMgr', NULL, '项目信息_new', 'SSPrj', '/projectmgr/projectInfoManage.jsp', '1', '1', NULL, NULL, NULL, '2', NULL, '1', NULL, NULL);
INSERT INTO `sys_module`  VALUES ('projectInfoMgr_query', NULL, '查询', 'projectInfoMgr', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


# 修改项目信息表字段注释
ALTER TABLE dcms_project_information MODIFY `Pro_plbgtime` date DEFAULT NULL COMMENT '项目计划开始时间(废弃)';
ALTER TABLE dcms_project_information MODIFY `Pro_plendtime` date DEFAULT NULL COMMENT '计划退场时间';
ALTER TABLE dcms_project_information MODIFY `Pro_actbgtime` date DEFAULT NULL COMMENT '项目进场时间';
ALTER TABLE dcms_project_information MODIFY `Pro_actendtime` date DEFAULT NULL COMMENT '项目实际退场时间';

# 新增项目信息表字段
ALTER TABLE dcms_project_information ADD pro_actknottime date DEFAULT NULL COMMENT '项目实际结项时间' AFTER Pro_buildtime;
ALTER TABLE dcms_project_information ADD pro_skill_performance varchar(100) default NULL COMMENT '技术及性能';
ALTER TABLE dcms_project_information ADD pro_sys_framework varchar(100) DEFAULT NULL COMMENT '系统架构';
ALTER TABLE dcms_project_information ADD pro_technical_system varchar(100) DEFAULT NULL COMMENT '技术体系（语言等）';
ALTER TABLE dcms_project_information ADD pro_use_platform varchar(100) DEFAULT NULL COMMENT '使用平台';
ALTER TABLE dcms_project_information ADD pro_year_data decimal(16,2) DEFAULT NULL COMMENT '年数据量（万）';
ALTER TABLE dcms_project_information ADD pro_week_customer decimal(16,2) DEFAULT NULL COMMENT '周客户量（个）';
ALTER TABLE dcms_project_information ADD pro_plan_ysbg_date date DEFAULT NULL COMMENT '验收报告计划归档时间';
ALTER TABLE dcms_project_information ADD pro_act_ysbg_date date DEFAULT NULL COMMENT '验收报告实际归档时间';
ALTER TABLE dcms_project_information ADD pro_ysbg_id varchar(100) DEFAULT NULL COMMENT '验收报告编号';
ALTER TABLE dcms_project_information ADD pro_plan_mon_avg decimal(16,2) DEFAULT NULL COMMENT '计划月均人数';
ALTER TABLE dcms_project_information ADD pro_per_peak decimal(16,2) DEFAULT NULL COMMENT '人员峰值';
ALTER TABLE dcms_project_information ADD pro_close_date date DEFAULT NULL COMMENT '项目关闭日期';

# 修改数据字典表 项目类型
delete from sys_datadictionary where dd_dictname = 'PRO_TYPE';
INSERT INTO `sys_datadictionary` VALUES ('PRO_TYPE', 'xql', '需求类', '项目类型', NULL, '1', '1');
INSERT INTO `sys_datadictionary` VALUES ('PRO_TYPE', 'kql', '考勤类', '项目类型', NULL, '2', '1');
INSERT INTO `sys_datadictionary` VALUES ('PRO_TYPE', 'kfl', '开发类', '项目类型', NULL, '3', '1');
INSERT INTO `sys_datadictionary` VALUES ('PRO_TYPE', 'yfl', '研发类', '项目类型', NULL, '5', '1');
INSERT INTO `sys_datadictionary` VALUES ('PRO_TYPE', 'qt', '其它', '项目类型', NULL, '7', '1');

# 项目id添加唯一约束
ALTER TABLE dcms_project_information DROP INDEX Pro_id;
ALTER TABLE dcms_project_information ADD CONSTRAINT uk_Pro_id UNIQUE (Pro_id);

# 修改项目变更表（备份旧表，复制项目信息表）by wwp 2018-04-03
ALTER TABLE dcms_project_changeinformation RENAME dcms_project_changeinformation_bak;
CREATE TABLE dcms_project_changeinformation LIKE dcms_project_information;
ALTER TABLE dcms_project_changeinformation DROP INDEX `uk_Pro_id`;

###########################  项目数据权限 begin  ##############################
# 原‘所有项目权限’角色内的在职人员，配开发中心‘项目数据权限’
INSERT INTO sys_accountdata SELECT 'kfzx', account_id, 'ProjectPurview' FROM sys_accountrole WHERE role_id = 'CenterEmp';

# 删除‘所有项目权限’角色及对应的人员菜单权限、人员角色权限
DELETE FROM sys_role WHERE role_id = 'CenterEmp';
DELETE FROM sys_accountrole WHERE role_id = 'CenterEmp';
DELETE FROM sys_rolemodule WHERE role_id = 'CenterEmp';
###########################  项目数据权限 end  ##############################









#################  OA 合同导入重构 begin ##################################


# 添加字段（dcms_sales_contract_oatemp）
ALTER TABLE dcms_sales_contract_oatemp ADD sale_man_account VARCHAR (100) DEFAULT NULL COMMENT '销售负责人帐号';
ALTER TABLE dcms_sales_contract_oatemp ADD sale_dep_code VARCHAR (100) DEFAULT NULL COMMENT '销售部门编码';
ALTER TABLE dcms_sales_contract_oatemp ADD implement_res_account VARCHAR (100) DEFAULT NULL COMMENT '实施负责人账号';
ALTER TABLE dcms_sales_contract_oatemp ADD implement_dep_code VARCHAR (100) DEFAULT NULL COMMENT '实施部门编码';
ALTER TABLE dcms_sales_contract_oatemp ADD pre_close_gross_rate DECIMAL (16, 4) DEFAULT NULL COMMENT '预计结算毛利率';
ALTER TABLE dcms_sales_contract_oatemp ADD pre_close_cost DECIMAL (16, 2) DEFAULT NULL COMMENT '预计产品结算成本含税';
ALTER TABLE dcms_sales_contract_oatemp ADD pre_close_free_cost DECIMAL (16, 2) DEFAULT NULL COMMENT '预计产品结算成本（不含税）';
ALTER TABLE dcms_sales_contract_oatemp ADD pre_other_cost DECIMAL (16, 2) DEFAULT NULL COMMENT '预计其他成本含税';
ALTER TABLE dcms_sales_contract_oatemp ADD pre_close_gross_profit DECIMAL (16, 2) DEFAULT NULL COMMENT '预计结算毛利';
ALTER TABLE dcms_sales_contract_oatemp ADD pre_other_sale_free_cost DECIMAL (16, 2) DEFAULT NULL COMMENT '预计其他销售成本（不含税）';
ALTER TABLE dcms_sales_contract_oatemp ADD pre_other_sale_free_fee_cost DECIMAL (16, 2) DEFAULT NULL COMMENT '预计其他销售费用化成本（不含税）';
ALTER TABLE dcms_sales_contract_oatemp ADD pre_gross_free_money DECIMAL (16, 2) DEFAULT NULL COMMENT '预计毛利不含资金';
ALTER TABLE dcms_sales_contract_oatemp ADD pre_gross_rate_free_money DECIMAL (16, 2) DEFAULT NULL COMMENT '预计毛利率不含资金';
# 重置导入表tbl_imp_cfg_dtl (0000019) 配置
DELETE FROM `tbl_imp_cfg_dtl` WHERE `imp_id` = '0000019';
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000601', 'gf_cont_id', '股份公司合同编号', '1', '1', '0', NULL, '1', '0');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000602', 'cont_name', '合同名称', '1', '2', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000603', 'cont_desc', '销售合同内容描述', '1', '3', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000604', 'cont_date', '申请日期', '1', '4', '3', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000605', 'cont_sale_man', '销售负责人', '1', '5', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000686', 'sale_man_account', '销售负责人帐号', '1', '6', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000606', 'cont_sale_dep', '销售负责人归属部门', '1', '7', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000687', 'sale_dep_code', '销售部门编码', '1', '8', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000607', 'cont_sale_com', '销售负责人归属公司', '1', '9', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000608', 'cont_Signatory', '结算单元', '1', '10', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000609', 'cont_yi_name', '乙方签署人', '1', '11', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000610', 'cont_cust_name', '客户名称', '1', '12', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000611', 'cont_cust_pro', '客户所属区域', '1', '13', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000612', 'cont_cust_hangye', '客户所属行业', '1', '14', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000613', 'cont_cust_hangye_name', '行业客户名称', '1', '15', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000614', 'cont_jia_com', '甲方单位', '1', '16', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000615', 'cont_jia_man', '甲方联系人', '1', '17', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000616', 'cont_jia_tel', '甲方联系电话', '1', '18', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000617', 'cont_bing_com', '丙方单位', '1', '19', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000618', 'cont_bing_man', '丙方联系人', '1', '20', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000619', 'cont_yewu_type', '主业务类型', '1', '21', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000620', 'main_tax_rate', '主税率', '1', '22', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000621', 'cont_cont_type', '合同形式', '1', '23', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000622', 'cont_isChina', '境内境外标志', '1', '24', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000623', 'cont_suan_self', '内部结算标志', '1', '25', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000624', 'cont_is_tax', '免税或上税标志', '1', '26', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000625', 'cont_plan_qianyue', '预计签约日期', '1', '27', '3', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000626', 'cont_plan_kaishi', '合同预计开始日期', '1', '28', '3', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000627', 'cont_plan_jiesu', '合同预计结束日期', '1', '29', '3', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000628', 'cont_warranty_start', '预计维护开始日期', '1', '30', '3', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000629', 'cont_warranty_end', '保修维护期（月）', '1', '31', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000630', 'cont_isNeed_shishi', '是否需要实施', '1', '32', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000631', 'cont_implement_res_name', '实施负责人', '1', '33', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000688', 'implement_res_account', '实施负责人账号', '1', '34', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000632', 'cont_cust_dep', '销售合同实施部门', '1', '35', '0', NULL, '1', '0');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000689', 'implement_dep_code', '实施部门编码', '1', '36', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000633', 'cont_man_month', '合同预计标准人月', '1', '37', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000634', 'cont_is_zhaobiao', '是否为招投标项目', '1', '38', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000635', 'cont_baozheng_jin', '保证金', '1', '39', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000636', 'cont_baozheng_start', '保证金开始时间', '1', '40', '0', 'com.nantian.imp.impl.EmpDateFirstDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000637', 'cont_baozheng_end', '保证金结束时间', '1', '41', '0', 'com.nantian.imp.impl.EmpDateFirstDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000638', 'cont_baohan', '保函', '1', '42', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000639', 'cont_baohan_start', '保函开始时间', '1', '43', '0', 'com.nantian.imp.impl.EmpDateFirstDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000640', 'cont_baohan_end', '保函结束时间', '1', '44', '0', 'com.nantian.imp.impl.EmpDateFirstDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000641', 'cont_shouhuo_man', '收货人', '1', '45', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000642', 'cont_shouhuo_tel', '收货联系电话', '1', '46', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000643', 'destination', '收货地址', '1', '47', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000644', 'cont_money', '合同金额', '1', '48', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000645', 'cont_tax_free_income', '预计销售收入', '1', '49', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000646', 'cont_tax_cost', '预计产品成本(含税)', '1', '50', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000647', 'cont_tax_free_cost_cp', '预计产品成本(不含税)', '1', '51', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000648', 'cont_tax_free_cost_qita', '预计其他成本(不含税)', '1', '52', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000649', 'cont_market_cost', '预估销售费用', '1', '53', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000650', 'plan_fixed_cost', '实施固定费用', '1', '54', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000651', 'plan_vari_cost', '实施变动费用', '1', '55', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000652', 'cont_fee_sum', '预计费用总和', '1', '56', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000653', 'cont_sales_gro_rate', '预计销售费用毛利率', '1', '57', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000654', 'cont_implement_gro_rate', '预计实施费用毛利率', '1', '58', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000655', 'cont_capital_cost', '预计资金占用费', '1', '59', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000656', 'cont_yinhua_planTax', '预计印花税', '1', '60', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000657', 'cont_yingye_planTax', '预计营业税', '1', '61', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000658', 'cont_advance_gross_profit', '预计毛利', '1', '62', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000659', 'cont_advance_gross_profit_rate', '预计毛利率', '1', '63', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000660', 'cont_plan_pro', '预计利润', '1', '64', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000661', 'cont_plan_proRate', '预计利润率', '1', '65', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000676', 'gf_cont_id_short', '合同简化编号', '1', '66', '0', 'com.nantian.imp.impl.oa.OANoShortDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000678', 'pre_close_cost', '预计产品结算成本含税', '1', '67', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000679', 'pre_close_free_cost', '预计产品结算成本（不含税）', '1', '68', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000680', 'pre_other_cost', '预计其他成本含税', '1', '69', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000681', 'pre_close_gross_profit', '预计结算毛利', '1', '70', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000682', 'pre_close_gross_rate', '预计结算毛利率', '1', '71', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000683', 'pre_other_sale_free_cost', '预计其他销售成本（不含税）', '1', '72', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000684', 'pre_other_sale_free_fee_cost', '预计其他销售费用化成本（不含税）', '1', '73', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000691', 'pre_gross_free_money', '预计毛利不含资金', '1', '74', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000692', 'pre_gross_rate_free_money', '预计毛利率不含资金', '1', '75', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000662', 'spare5', '备注', '1', '76', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000663', 'cont_cust_beianStatus', '销售合同备案状态', '1', '77', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000664', 'cont_cust_kaipiaoStatus', '销售合同开票状态', '1', '78', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000665', 'exe_status_cx', '销售合同撤销状态', '1', '79', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000666', 'cont_sales_status', '销售发货状态', '1', '80', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000667', 'cont_cust_status', '销售合同收款状态', '1', '81', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000668', 'exe_status_gb', '销售合同关闭状态', '1', '82', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000669', 'no_eff_date', '编号生成日期', '1', '83', '3', 'com.nantian.imp.impl.EmpDateFirstDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000670', 'cont_sqe', '销售合同序号', '0', '84', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000671', 'cont_his_id', '历史合同编号', '1', '85', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000672', 'cont_sale_name', '销售负责人ID', '1', '86', '0', 'com.nantian.imp.impl.oa.OASalesDepDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000673', 'cont_cust_id', '客户ID', '1', '87', '0', 'com.nantian.imp.impl.oa.CustNameDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000674', 'cont_implement_dep', '销售实施部门ID', '1', '88', '0', 'com.nantian.imp.impl.oa.ElemSalesDepDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000019', '0000675', 'cont_implement_res', '实施负责人ID', '1', '89', '0', 'com.nantian.imp.impl.oa.OAImpManDefaultValue', '1', '1');


# 添加字段(dcms_plannotepoint)
ALTER TABLE dcms_plannotepoint ADD pnp_stage VARCHAR (50) DEFAULT NULL COMMENT '合同阶段';
ALTER TABLE dcms_plannotepoint ADD pnp_stage_check_date date DEFAULT NULL COMMENT '阶段验收日期';
ALTER TABLE dcms_plannotepoint ADD pnp_confirm_date date DEFAULT NULL COMMENT '收入确认日期';
# 重置导入表tbl_imp_cfg_dtl (0000023) 配置
DELETE FROM `tbl_imp_cfg_dtl` WHERE `imp_id` = '0000023';
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000023', '0001001', 'pnp_contractid', '合同编号', '1', '1', '0', 'com.nantian.imp.impl.oa.plannotepoint.OANoShortDefaultValue', '1', '0');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000023', '0001009', 'pnp_stage', '合同阶段', '1', '2', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000023', '0001003', 'pnp_cont', '开票内容', '1', '3', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000023', '0001004', 'pnp_plannoteamount', '开票金额', '1', '4', '2', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000023', '0001002', 'pnp_date', '开票日期', '1', '5', '3', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000023', '0001010', 'pnp_stage_check_date', '阶段验收日期', '1', '6', '3', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000023', '0001011', 'pnp_confirm_date', '收入确认日期', '1', '7', '3', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000023', '0001005', 'remark', '备注', '1', '8', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000023', '0001006', 'pnp_earlynote', '开票百分比', '1', '9', '2', 'com.nantian.imp.impl.oa.plannotepoint.PnpParDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000023', '0001007', 'pnp_id', '开票计划id', '0', '10', '0', 'com.nantian.imp.GenerateBySeq', '1', '0');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000023', '0001008', 'pnp_scr_id', '合同表id', '1', '11', '0', 'com.nantian.imp.impl.oa.plannotepoint.PnpScridDefaultValue', '1', '1');


# 添加字段（dcms_impdis_plan）
ALTER TABLE dcms_impdis_plan ADD business_classify VARCHAR (100) DEFAULT NULL COMMENT '业务分类';
ALTER TABLE dcms_impdis_plan ADD implement_dep_code VARCHAR (100) DEFAULT NULL COMMENT '实施部门编码';
# 重置导入表tbl_imp_cfg_dtl (0000027) 配置
DELETE FROM `tbl_imp_cfg_dtl` WHERE `imp_id` = '0000027';
INSERT INTO `tbl_imp_cfg_dtl` VALUES ( '0000027', '0001401', 'gf_cont_id', '股份公司合同编号', '1', '1', '0', NULL, '1', '1' );
INSERT INTO `tbl_imp_cfg_dtl` VALUES ( '0000027', '0001402', 'implement_dep', '实施部门', '1', '2', '0', NULL, '1', '1' );
INSERT INTO `tbl_imp_cfg_dtl` VALUES ( '0000027', '0001410', 'implement_dep_code', '实施部门编码', '1', '3', '0', NULL, '1', '1' );
INSERT INTO `tbl_imp_cfg_dtl` VALUES ( '0000027', '0001409', 'business_classify', '业务分类', '1', '4', '0', NULL, '1', '1' );
INSERT INTO `tbl_imp_cfg_dtl` VALUES ( '0000027', '0001403', 'distribution_ratio', '分配比例', '1', '5', '2', 'com.nantian.imp.impl.oa.NullStringDefaultValue', '1', '1' );
INSERT INTO `tbl_imp_cfg_dtl` VALUES ( '0000027', '0001404', 'remark', '备注', '1', '6', '0', NULL, '1', '1' );
INSERT INTO `tbl_imp_cfg_dtl` VALUES ( '0000027', '0001405', 'cont_sqe', '销售合同序号', '1', '7', '0', NULL, '1', '1' );
INSERT INTO `tbl_imp_cfg_dtl` VALUES ( '0000027', '0001406', 'implement_dep_id', '实施部门ID', '1', '8', '0', 'com.nantian.imp.impl.impDisPlan.ImpDepDefaultValue', '1', '1' );
INSERT INTO `tbl_imp_cfg_dtl` VALUES ( '0000027', '0001407', 'impdis_plan_id', '实施分配计划ID', '0', '9', '0', 'com.nantian.imp.GenerateBySeq', '1', '0' );
INSERT INTO `tbl_imp_cfg_dtl` VALUES ( '0000027', '0001408', 'gf_cont_id_short', '合同简化编号', '1', '10', '0', 'com.nantian.imp.impl.oa.OANoShortDefaultValue', '1', '1' );

################### OA 合同导入重构 end  ################################



############################# 人员投入明细菜单 by wwp 2018-05-06 ####################################
# 添加人员投入明细菜单
INSERT INTO `sys_module` VALUES ('ProjectPersonInputDetail', NULL, '人员投入明细', 'SSPrj', '/projectmgr/projectPersion/projectPersonInputDetail.jsp', '1', '1', NULL, NULL, NULL, '15', NULL, '1', NULL, NULL);
INSERT INTO `sys_module` VALUES ('ProjectPersonInputDetail_export', NULL, '导出', 'ProjectPersonInputDetail', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

# 添加菜单角色关系
INSERT INTO sys_rolemodule VALUES ( 'ProjectPersonInputDetail_export', '300021', NULL );
INSERT INTO sys_rolemodule VALUES ( 'ProjectPersonInputDetail_export', '300020', NULL );
INSERT INTO sys_rolemodule VALUES ( 'ProjectPersonInputDetail_export', 'ROLE_IDf3262e45_1e16_45cc_abcb_78fd7d940618', NULL );
INSERT INTO sys_rolemodule VALUES ( 'ProjectPersonInputDetail_export', 'QA', NULL );
INSERT INTO sys_rolemodule VALUES ( 'ProjectPersonInputDetail_export', '400020', NULL );


############################# 人员投入明细菜单 ####################################



