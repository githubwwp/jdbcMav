# 修改费用导表配置 by wwp 2018-03-29
delete from `tbl_imp_cfg_dtl` where `imp_id` = '0000017';
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000400', 'fee_subject', '会计科目', '0', '1', '0', NULL, 'n', '0');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000401', 'dep1', '部门1', '1', '2', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000402', 'dep2', '部门2', '1', '3', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000403', 'dep3', '部门3', '1', '4', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000404', 'dep4', '部门4', '1', '5', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000405', 'dep5', '部门5', '1', '6', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000406', 'dep6', '部门6', '1', '7', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000407', 'dep7', '部门7', '1', '8', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000408', 'dep8', '部门8', '1', '9', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000409', 'dep9', '部门9', '1', '10', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000410', 'dep10', '部门10', '1', '11', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000411', 'dep11', '部门11', '1', '12', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000414', 'dep12', '部门12', '1', '13', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000416', 'dep13', '部门13', '1', '17', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000417', 'dep14', '部门14', '1', '18', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000418', 'dep15', '部门15', '1', '19', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000419', 'dep16', '部门16', '1', '20', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000420', 'dep17', '部门17', '1', '21', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000421', 'dep18', '部门18', '1', '22', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000422', 'dep19', '部门19', '1', '23', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000423', 'dep20', '部门20', '1', '24', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000412', 'total_money', '合计', '1', '34', '2', 'com.nantian.imp.impl.ActInvDecimalDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000413', 'yearmonth', '年月', '0', '35', '0', 'com.nantian.imp.impl.FeeYearMonthDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000017', '0000415', 'center', '中心', '1', '36', '0', 'com.nantian.imp.impl.FeeCenterDefaultValue', '1', '1');

# 修改参数表 by wwp 2018-03-29
DELETE FROM dcms_system_par WHERE pram_id = 'depCenter' AND pare_id = 'fee_dep';

# 调整费用导入临时表字段顺序 by wwp 2018-03-26
ALTER TABLE dcms_fee_report MODIFY `center` VARCHAR (100) DEFAULT NULL COMMENT '部门中心' AFTER `fee_subject`;
ALTER TABLE dcms_fee_report MODIFY `yearmonth` CHAR (6) DEFAULT NULL COMMENT '年月' AFTER `center`;
ALTER TABLE dcms_fee_report MODIFY `total_money` DECIMAL (16, 2) DEFAULT NULL AFTER `yearmonth`;

# 添加费用导入临时表字段 by wwp 2018-03-26
ALTER TABLE `dcms_fee_report` ADD `dep15` decimal(16,2) DEFAULT NULL;
ALTER TABLE `dcms_fee_report` ADD `dep16` decimal(16,2) DEFAULT NULL;
ALTER TABLE `dcms_fee_report` ADD `dep17` decimal(16,2) DEFAULT NULL;
ALTER TABLE `dcms_fee_report` ADD `dep18` decimal(16,2) DEFAULT NULL;
ALTER TABLE `dcms_fee_report` ADD `dep19` decimal(16,2) DEFAULT NULL;
ALTER TABLE `dcms_fee_report` ADD `dep20` decimal(16,2) DEFAULT NULL;

# 修改费用导入结果表 by wwp 2018-03-29
ALTER TABLE dcms_fee_report_result MODIFY `center` VARCHAR (100) DEFAULT NULL COMMENT '部门中心' FIRST;
ALTER TABLE dcms_fee_report_result CHANGE `fee_detail1` `fee_tender` DECIMAL (16, 2) DEFAULT NULL COMMENT '招标费';

# 初始化费用导入结果表数据 by wwp 2018-03-29
ALTER TABLE dcms_fee_report_result ADD dep_id VARCHAR (100) NOT NULL COMMENT '部门id' AFTER `fee_dep`;
UPDATE
	dcms_fee_report_result rst
INNER JOIN dcms_system_par par ON rst.center = par.use_dep
AND rst.fee_dep = par.pram_id
SET rst.dep_id = par.pram_name;
# 删除字段 fee_dep by wwp 2018-03-29
ALTER TABLE dcms_fee_report_result DROP `fee_dep`;
ALTER TABLE dcms_fee_report_result DROP fee_detail2;
ALTER TABLE dcms_fee_report_result DROP fee_detail3;
ALTER TABLE dcms_fee_report_result DROP fee_detail4;
ALTER TABLE dcms_fee_report_result DROP fee_detail5;
