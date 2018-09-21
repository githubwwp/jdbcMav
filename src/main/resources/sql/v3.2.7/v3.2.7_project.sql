###############################  项目改造 begin by wwp 2018-05-02 ########################################
# 添加菜单 项目信息_new
INSERT INTO `sys_module`  VALUES ('projectInfoMgr', NULL, '项目信息_new', 'SSPrj', '/projectmgr/projectInfoManage.jsp', '1', '1', NULL, NULL, NULL, '2', NULL, '1', NULL, NULL);
INSERT INTO `sys_module`  VALUES ('projectInfoMgr_query', NULL, '查询', 'projectInfoMgr', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

# 项目信息表备份
DROP TABLE IF EXISTS dcms_project_information_20180502;
CREATE TABLE dcms_project_information_20180502 LIKE dcms_project_information;
INSERT INTO dcms_project_information_20180502 SELECT * FROM dcms_project_information;

# 项目id添加唯一约束
ALTER TABLE dcms_project_information DROP INDEX Pro_id;
ALTER TABLE dcms_project_information ADD CONSTRAINT uk_Pro_id UNIQUE (Pro_id);

# 添加项目信息表字段
ALTER TABLE dcms_project_information ADD pro_contract_spm DECIMAL (16, 2) DEFAULT NULL COMMENT '项目合同人月' AFTER `Pro_money`;
ALTER TABLE dcms_project_information ADD pro_contract_cost DECIMAL (16, 2) DEFAULT NULL COMMENT '项目合同成本' AFTER `Pro_money`;
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


# 修改项目信息表相关人员字段
ALTER TABLE dcms_project_information MODIFY `Pro_state` VARCHAR (50) NOT NULL DEFAULT '' COMMENT '项目状态';
ALTER TABLE dcms_project_information MODIFY `Pro_money` DECIMAL(16,2) DEFAULT NULL COMMENT '项目金额';
ALTER TABLE dcms_project_information MODIFY `Pro_conper` varchar(50) DEFAULT NULL COMMENT '项目主控';
ALTER TABLE dcms_project_information MODIFY `pro_manager` varchar(50) DEFAULT NULL COMMENT '项目经理';
ALTER TABLE dcms_project_information MODIFY `Pro_manager2` varchar(100) DEFAULT NULL COMMENT '项目副经理';
ALTER TABLE dcms_project_information MODIFY `Pro_technicalmanager` varchar(100) DEFAULT NULL COMMENT '技术经理';
ALTER TABLE dcms_project_information MODIFY `Pro_qa` varchar(100) DEFAULT NULL COMMENT '项目QA';
ALTER TABLE dcms_project_information MODIFY `Pro_sales` varchar(100) DEFAULT NULL COMMENT '销售代表';
ALTER TABLE dcms_project_information MODIFY `pro_teamleader` varchar(100) DEFAULT NULL COMMENT '小组长';
ALTER TABLE dcms_project_information MODIFY `Pro_id` varchar(50) NOT NULL DEFAULT '' COMMENT '项目编号';
ALTER TABLE dcms_project_information MODIFY `Pro_type` varchar(50) NOT NULL DEFAULT 'kfl' COMMENT '项目类型';
ALTER TABLE dcms_project_information MODIFY `Pro_name` varchar(100) DEFAULT NULL COMMENT '项目名称';
ALTER TABLE dcms_project_information MODIFY `Pro_shortname` varchar(50) DEFAULT NULL COMMENT '项目简称';
ALTER TABLE dcms_project_information MODIFY `Pro_dep` varchar(50) NOT NULL DEFAULT '' COMMENT '项目所属部门';
ALTER TABLE dcms_project_information MODIFY `Pro_plbgtime` date DEFAULT NULL COMMENT '项目计划开始时间(废弃)';
ALTER TABLE dcms_project_information MODIFY `Pro_plendtime` date DEFAULT NULL COMMENT '计划退场时间';
ALTER TABLE dcms_project_information MODIFY `Pro_actbgtime` date DEFAULT NULL COMMENT '项目进场时间';
ALTER TABLE dcms_project_information MODIFY `Pro_actendtime` date DEFAULT NULL COMMENT '项目实际退场时间';

# 项目变更表备份
DROP TABLE IF EXISTS dcms_project_changeinformation_20180502;
CREATE TABLE dcms_project_changeinformation_20180502 LIKE dcms_project_changeinformation;
INSERT INTO dcms_project_changeinformation_20180502 SELECT * FROM dcms_project_changeinformation;
# 修改项目变更表
DROP TABLE IF EXISTS dcms_project_changeinformation;
CREATE TABLE dcms_project_changeinformation LIKE dcms_project_information;
# 移除项目变更合同唯一约束
ALTER TABLE dcms_project_changeinformation DROP INDEX uk_Pro_id;

# 修改数据字典表 项目类型
delete from sys_datadictionary where dd_dictname = 'PRO_TYPE';
INSERT INTO `sys_datadictionary` VALUES ('PRO_TYPE', 'xql', '需求类', '项目类型', NULL, '1', '1');
INSERT INTO `sys_datadictionary` VALUES ('PRO_TYPE', 'kql', '考勤类', '项目类型', NULL, '2', '1');
INSERT INTO `sys_datadictionary` VALUES ('PRO_TYPE', 'kfl', '开发类', '项目类型', NULL, '3', '1');
INSERT INTO `sys_datadictionary` VALUES ('PRO_TYPE', 'yfl', '研发类', '项目类型', NULL, '5', '1');
INSERT INTO `sys_datadictionary` VALUES ('PRO_TYPE', 'qt', '其它', '项目类型', NULL, '7', '1');

# 修改数据字典表 项目状态
DELETE from sys_datadictionary where dd_dictname = 'PRO_STATE';
INSERT INTO `sys_datadictionary` VALUES ('PRO_STATE', '1', '已关闭', '项目当前状态', NULL, '7', '1');
INSERT INTO `sys_datadictionary` VALUES ('PRO_STATE', '3', '实施', '项目当前状态', NULL, '1', '1');
INSERT INTO `sys_datadictionary` VALUES ('PRO_STATE', '6', '已结项', '项目当前状态', NULL, '3', '1');
INSERT INTO `sys_datadictionary` VALUES ('PRO_STATE', '9', '已退场', '项目当前状态', NULL, '5', '1');

# 项目信息表数据初始化

# 删除项目报表及对应的 角色菜单关系
DELETE m, rm 
FROM sys_module m 
LEFT JOIN sys_rolemodule rm on m.module_id = rm.module_id WHERE 
	m.module_id = 'proReportMgr' OR m.pmodule_id IN ( SELECT * FROM ( SELECT module_id FROM sys_module WHERE module_id = 'proReportMgr' OR pmodule_id = 'proReportMgr' ) aa );
	
# 删除软件项目下部分菜单
DELETE m, rm 
FROM sys_module m 
LEFT JOIN sys_rolemodule rm on m.module_id = rm.module_id WHERE 
	m.module_id IN ( 
	SELECT * FROM ( 
		SELECT module_id FROM sys_module WHERE module_id IN ( 'SSPrjMgr', 'progressMgr', 'taskreqiureTree', 'PlanChgFee', 'ActChgFee', 'projectMonthReportMgr' ) OR pmodule_id IN ( 'SSPrjMgr', 'progressMgr', 'taskreqiureTree', 'PlanChgFee', 'ActChgFee', 'projectMonthReportMgr' ) 
	) aa 
);


###############################  项目改造 end ########################################