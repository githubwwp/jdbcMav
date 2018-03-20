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

