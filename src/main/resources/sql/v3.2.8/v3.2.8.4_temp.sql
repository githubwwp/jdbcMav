
# 新增参数 '人力投入维护编辑限制日期'
INSERT INTO `dcms_system_par` ( `id`, `pram_id`, `pare_id`, `use_dep`, `pram_name`, `pram_type`, `pram_val`, `des_text`, `is_use`, `is_main`, `final_modifier`, `final_modify_time`, `orderby` ) VALUES ( 'ID7e4d574a_a424_4cf3_ad90_5e92eca8eec8', 'editLimitDay', NULL, 'gznt', NULL, '0', '5', '人力投入维护编辑限制日期', '1', '1', 'superadmin', '2019-01-10', NULL );

# 修改表存储引擎
ALTER TABLE dcms_relatedmember ENGINE = INNODB;

# 添加折算系数字段
ALTER TABLE dcms_empcost_mem_permonth_sum ADD COLUMN convert_coe DECIMAL (8, 4) DEFAULT NULL COMMENT '折算系数' AFTER post_coe;
ALTER TABLE dcms_empcost_mem_permonth_sum ADD COLUMN convert_coe DECIMAL (8, 4) DEFAULT NULL COMMENT '折算系数' AFTER post_coe;


#  修改一级标题: '项目指标' 改为 '项目账单'
UPDATE `sys_module` SET `module_name` = '项目账单' WHERE `module_id` = 'projectIndicators';

#  修改项目类型参数
UPDATE sys_datadictionary SET dd_text = '人力外包-需求类' WHERE dd_dictname = 'PRO_TYPE' AND dd_id = 'xql';
UPDATE sys_datadictionary SET dd_text = '人力外包-考勤类' WHERE dd_dictname = 'PRO_TYPE' AND dd_id = 'kql';
UPDATE sys_datadictionary SET dd_text = '人力外包-其他类' WHERE dd_dictname = 'PRO_TYPE' AND dd_id = 'qt';
INSERT INTO `sys_datadictionary` (`dd_dictname`, `dd_id`, `dd_text`, `dd_desc`, `dd_flag`, `dd_order`, `dd_enabled`) VALUES ('PRO_TYPE', 'jgk', '人力外包-建广开', '项目类型', NULL, '8', '1');

#  修改项目指标表
ALTER TABLE dcms_project_indicators MODIFY `end_act_total_pm` DECIMAL (10, 4) DEFAULT NULL COMMENT '截止上月实际总人月, 累计实际人月';

ALTER TABLE dcms_project_indicators ADD COLUMN forcast_benefit DECIMAL (16, 4) DEFAULT NULL COMMENT '预测效益';
ALTER TABLE dcms_project_indicators ADD COLUMN pro_fee_rate DECIMAL (16, 4) DEFAULT NULL COMMENT '立项费效比';
ALTER TABLE dcms_project_indicators ADD COLUMN cur_act_pm_devi DECIMAL (16, 4) DEFAULT NULL COMMENT '当前实际人月偏差';
ALTER TABLE dcms_project_indicators ADD COLUMN cur_act_spm_devi DECIMAL (16, 4) DEFAULT NULL COMMENT '当前实际标准人月偏差';
ALTER TABLE dcms_project_indicators ADD COLUMN forecast_fee_rate DECIMAL (16, 4) DEFAULT NULL COMMENT '预测费效比';
ALTER TABLE dcms_project_indicators ADD COLUMN cue_year_act_fee DECIMAL (16, 4) DEFAULT NULL COMMENT '当年实际费用';
ALTER TABLE dcms_project_indicators ADD COLUMN cur_year_act_gro DECIMAL (16, 4) DEFAULT NULL COMMENT '当年实际毛利';
ALTER TABLE dcms_project_indicators ADD COLUMN cur_year_act_fee_rate DECIMAL (16, 4) DEFAULT NULL COMMENT '当年实际费效比';
ALTER TABLE dcms_project_indicators ADD COLUMN settle_pm DECIMAL (16, 4) DEFAULT NULL COMMENT '已结算人月';
ALTER TABLE dcms_project_indicators ADD COLUMN sum_cust_reco_pm DECIMAL (16, 4) DEFAULT NULL COMMENT '累计客户认可人月';
ALTER TABLE dcms_project_indicators ADD COLUMN sum_stock_pm DECIMAL (16, 4) DEFAULT NULL COMMENT '累计库存人月';

ALTER TABLE dcms_project_indicators ADD COLUMN pro_dcms_total_pm DECIMAL (16, 4) DEFAULT NULL COMMENT '项目易汇合同总人月';
ALTER TABLE dcms_project_indicators ADD COLUMN cust_total_pm DECIMAL (16, 4) DEFAULT NULL COMMENT '累计客户认可人月';
ALTER TABLE dcms_project_indicators ADD COLUMN stock_total_pm DECIMAL (16, 4) DEFAULT NULL COMMENT '累计库存人月';
ALTER TABLE dcms_project_indicators ADD COLUMN signed_stock_pm DECIMAL (16, 4) DEFAULT NULL COMMENT '已签合同库存人月';
ALTER TABLE dcms_project_indicators ADD COLUMN unsigned_stock_pm DECIMAL (16, 4) DEFAULT NULL COMMENT '未签合同库存人月';
ALTER TABLE dcms_project_indicators ADD COLUMN remark VARCHAR(200) DEFAULT NULL COMMENT '备注';

# 添加邮箱模版表
INSERT INTO `dcms_system_push_emailmodel` (`id`, `ModelType`, `InfoType`, `Title`, `Cont`, `Atta`) VALUES ('ID88a1f5a3_93e4_45c8_93ff_d48fc9d47b78', 'refresh_workload_single', '0', '${a}', '${a}', NULL);
INSERT INTO `dcms_system_push_emailmodel` (`id`, `ModelType`, `InfoType`, `Title`, `Cont`, `Atta`) VALUES ('IDb232a602_3922_4607_88c3_616c4db0a1dd', 'refresh_workload_multiple', '0', '${a}', '${a}', NULL);


# 新增表 '项目月度指标'
DROP TABLE IF EXISTS dcms_project_indicators_mon;
CREATE TABLE `dcms_project_indicators_mon` (
	`pro_id` VARCHAR (50) NOT NULL COMMENT '项目编号',
	`yearMon` VARCHAR (6) NOT NULL COMMENT '年月',
	`pm_devi` DECIMAL (16, 4) DEFAULT NULL COMMENT '人月偏差',
	`spm_devi` DECIMAL (16, 4) DEFAULT NULL COMMENT '标准人月偏差',
	`forcast_fee` decimal(16,4) DEFAULT NULL COMMENT '预测费用',
	`plan_fee_rate` DECIMAL (16, 4) DEFAULT NULL COMMENT '预测费效比',
	PRIMARY KEY (`pro_id`, `yearMon`)
) ENGINE = INNODB DEFAULT CHARSET = gbk COMMENT = '项目月度指标';

# 新增菜单及权限 '编辑库存人月'
INSERT INTO `sys_module` (`module_id`, `module_opcode`, `module_name`, `pmodule_id`, `module_entry`, `module_type`, `module_valid`, `module_pic_big`, `module_pic_small`, `help_page`, `module_order`, `module_hide`, `module_version`, `module_target`, `module_canedit`) VALUES ('projectIndicators_editStockPm', NULL, '编辑库存人月', 'projectIndicators', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_rolemodule` (`module_id`, `role_id`, `pro_id`) VALUES ('projectIndicators_editStockPm', 'ROLE_ID87b41a83_5ffb_4a62_a831_eca52303f59e', NULL);
INSERT INTO `sys_rolemodule` (`module_id`, `role_id`, `pro_id`) VALUES ('projectIndicators_editStockPm', 'ROLE_IDe0311c9a_d068_4736_8ddd_647d2ffd08f4', NULL);

ALTER TABLE dcms_empcost_mem_permonth_sum_baseline ADD COLUMN convert_coe DECIMAL (8, 4) DEFAULT NULL COMMENT '折算系数' AFTER post_coe;

# 添加 '初始化人力可投入数据' (超级管理员使用) by wpp 2019-02-27
INSERT INTO `sys_module` ( `module_id`, `module_opcode`, `module_name`, `pmodule_id`, `module_entry`, `module_type`, `module_valid`, `module_pic_big`, `module_pic_small`, `help_page`, `module_order`, `module_hide`, `module_version`, `module_target`, `module_canedit` ) VALUES ( 'projectIndicators_defualtInputData', NULL, '初始化人力可投入数据', 'projectIndicators', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL );

# '项目占合同比' 可空
ALTER TABLE dcms_contract_project_connection MODIFY `pro_percent` DECIMAL (6, 2) DEFAULT NULL COMMENT '项目占合同比';


# 新增字段 '已签合同人月'
ALTER TABLE dcms_project_indicators ADD COLUMN signed_cont_pm DECIMAL (16, 4) DEFAULT NULL COMMENT '已签合同人月';


