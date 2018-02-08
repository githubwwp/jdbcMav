# 合同表添加列
ALTER TABLE dcms_sales_contract_register ADD COLUMN cur_task_emp_id varchar(50) DEFAULT NULL COMMENT '当前任务责任人员工id';


# 初始化合同表任务责任人数据
UPDATE dcms_sales_contract_register cont 
LEFT JOIN ( SELECT aa.* FROM ( SELECT * FROM dcms_sales_contract_taskowner ORDER BY task_starttime DESC ) aa GROUP BY aa.cont_id ) bb ON cont.Cont_id = bb.cont_id 
SET cont.cur_task_emp_id = bb.owner_name;

# 新增销售费用明细-批量编辑规则按钮菜单 by wwp
INSERT INTO `sys_module` VALUES ( 'batchEdit_allocateRule', NULL, '批量编辑规则', 'saleFeeDetail', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL );

# 批量编辑规则添加角色 by wwp
INSERT INTO `sys_rolemodule` VALUES ( 'batchEdit_allocateRule', 'ROLE_ID2a0f0e28_0682_485b_90e5_a57835d95619', NULL );

# 同步费用补贴明细日志表
UPDATE dcms_cost_subsidy_log SET cost_subsidy_ym = '201802' WHERE cost_subsidy_ym = '201801';
UPDATE dcms_cost_subsidy_log SET cost_subsidy_ym = '201801' WHERE cost_subsidy_ym = '201712';

### 费用补贴明细结果表2数据迁移开始 by wwp ###
# 复制主表到临时表，并删除主表数据
CREATE TABLE dcms_dep_cost_subsidy_temp SELECT * FROM dcms_dep_cost_subsidy;
delete from dcms_dep_cost_subsidy;

# 添加部门和费用项
INSERT INTO dcms_dep_cost_subsidy ( dep_id, fee_item, year_no, gmt_create, gmt_modified ) 
SELECT * FROM ( SELECT dep_id, fee_item, '2018', gmt_create, gmt_modified FROM dcms_dep_cost_subsidy_temp ORDER BY gmt_modified DESC ) 
aa GROUP BY dep_id, fee_item;

# 迁移 201801 月数据
UPDATE dcms_dep_cost_subsidy sub
INNER JOIN dcms_dep_cost_subsidy_temp temp ON sub.dep_id = temp.dep_id AND sub.fee_item = temp.fee_item AND temp.year_no = '2018'
SET sub.month2 = temp.month1;

# 迁移 201712 月数据
UPDATE dcms_dep_cost_subsidy sub
INNER JOIN dcms_dep_cost_subsidy_temp temp ON sub.dep_id = temp.dep_id AND sub.fee_item = temp.fee_item AND temp.year_no = '2017'
SET sub.month1 = temp.month12;

# 重新计算小计
UPDATE dcms_dep_cost_subsidy SET month_sum = ( IFNULL(month1, 0) + IFNULL(month2, 0) + IFNULL(month3, 0) + IFNULL(month4, 0) + IFNULL(month5, 0) + IFNULL(month6, 0) + 
	IFNULL(month7, 0) + IFNULL(month8, 0) + IFNULL(month9, 0) + IFNULL(month10, 0) + IFNULL(month11, 0) + IFNULL(month12, 0));

# 删除临时表
DROP TABLE if EXISTS dcms_dep_cost_subsidy_temp;

### 费用补贴明细结果表2数据迁移结束  ###
