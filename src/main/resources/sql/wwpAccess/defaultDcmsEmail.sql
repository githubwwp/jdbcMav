UPDATE sys_account SET account_password = '45,-48,-60,-95,40,126,-44,121,',account_inv_date='2522-01-01 00:00:00',ACCOUNT_EMAIL = '';
#内部邮箱
UPDATE dcms_employee_information SET emp_inemail = 'hjchen@nantian.com.cn;lijingru@nantian.com.cn';
#UPDATE dcms_employee_information SET emp_inemail = 'hlli@nantian.com.cn';
#补充邮箱参数
UPDATE dcms_system_par SET pram_val = 'hjchen@nantian.com.cn;lijingru@nantian.com.cn' WHERE pram_id IN ('ReceivablesEmailSj','sup_email');


#补充移动端邮箱参数
UPDATE a_sys_prarmeter SET sys_text = 'hjchen@nantian.com.cn;lijingru@nantian.com.cn' WHERE sys_no IN ('not_per_plan_sendee','no_plian_sendee','plan_uncomp_list_sendee');


DELETE FROM dcms_system_push ;
DELETE FROM sys_logger WHERE DATE_FORMAT(log_lastTime,'%Y')< DATE_FORMAT(NOW(),'%Y');

#----------------------------------测试角色创建
#创建TEST角色 sys_role
DELETE FROM sys_role WHERE role_id = 'ROLE_ID_TEST_ALL';
INSERT INTO sys_role (role_id, ROLE_NAME, role_desc, role_grant, role_type, ORG_ID, ROLE_CREATTIME, ROLE_CREATOR, ROLE_MENDTIME, ROLE_MENDER, role_enabled, role_canDelete) 
	VALUES ('ROLE_ID_TEST_ALL', 'TEST', '', '0', '0', 'gznt', '2018-08-21', 'superadmin', NULL, NULL, '1', NULL);

# 人 角色 关系 sys_accountrole
DELETE FROM sys_accountrole WHERE role_id = 'ROLE_ID_TEST_ALL';
INSERT INTO `sys_accountrole` (`role_id`, `account_id`, `role_order`) VALUES ('ROLE_ID_TEST_ALL', '1225', '0');
INSERT INTO `sys_accountrole` (`role_id`, `account_id`, `role_order`) VALUES ('ROLE_ID_TEST_ALL', 'NT20000446', '0');

# 角色 对应 菜单 sys_rolemodule
DELETE FROM sys_rolemodule WHERE role_id = 'ROLE_ID_TEST_ALL';
INSERT INTO sys_rolemodule(module_id,role_id)  SELECT module_id,'ROLE_ID_TEST_ALL' FROM sys_module WHERE module_type = 3;

#----------------------------------测试人员数据权限初始化
DELETE FROM sys_accountdata WHERE ACCOUNT_ID = '1225';
INSERT INTO `sys_accountdata` (`ORG_ID`, `ACCOUNT_ID`, `DT_ID`) VALUES ('gznt', '1225', '001');
INSERT INTO `sys_accountdata` (`ORG_ID`, `ACCOUNT_ID`, `DT_ID`) VALUES ('gznt', '1225', '002');
INSERT INTO `sys_accountdata` (`ORG_ID`, `ACCOUNT_ID`, `DT_ID`) VALUES ('gznt', '1225', '003');
INSERT INTO `sys_accountdata` (`ORG_ID`, `ACCOUNT_ID`, `DT_ID`) VALUES ('gznt', '1225', 'ProjectPurview');


