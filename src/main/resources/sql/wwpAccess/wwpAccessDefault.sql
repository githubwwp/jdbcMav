
###########################  给帐号‘NT20000446’添加所有角色和数据权限 begin #####################################
DELETE FROM `sys_accountrole` WHERE account_id = 'NT20000446';
INSERT IGNORE INTO sys_accountrole (role_id, account_id) SELECT DISTINCT role_id, 'NT20000446' FROM sys_role;

# DELETE FROM sys_rolemodule WHERE role_id = '500022';

# INSERT IGNORE INTO sys_rolemodule (role_id, module_id) SELECT '500022', module_id FROM sys_module;

INSERT IGNORE INTO sys_accountdata (org_id, account_id, dt_id) 
SELECT DISTINCT 'gznt', 'NT20000446', DT_ID FROM sys_accountdata;
############################  给帐号‘NT20000446’添加所有菜单、角色和数据权限 end ####################################




###################################### 删除销售合同管理下原二级菜单‘计划销项明细管理’‘计划开票’‘计划收款’实际开票收款’ begin  #####################################
DELETE m, rm 
FROM sys_module m 
LEFT JOIN sys_rolemodule rm on m.module_id = rm.module_id WHERE 
	m.module_id IN ( 
	SELECT * FROM ( 
		SELECT module_id FROM sys_module 
		WHERE module_id IN ( '' ) 
		OR pmodule_id IN ( '' ) 
	) aa 
)
;
###################################### 删除销售合同管理下原二级菜单‘计划销项明细管理’‘计划开票’‘计划收款’实际开票收款’ end  #####################################



###################################### 根据角色名称获取角色ID begin  #####################################
SELECT
   GROUP_CONCAT(CONCAT('\'', CONVERT(role_id, CHAR), '\''))
FROM
   sys_role
WHERE
ROLE_NAME IN ( '市场部销售人员' )
;
###################################### 根据角色名称获取角色ID end  #####################################

# myeclipse 搜索范围： (*.css, *.html, *.java, *.js, *.json, *.log, *.pom, *.sql, *.tag, *.tld, *.txt, *.xml)

# 修改用户邮箱地址
UPDATE dcms_employee_information SET emp_inemail = 'wwp231@163.com';

