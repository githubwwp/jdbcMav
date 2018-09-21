


# 生成一级菜单 费用补贴明细 by wwp
INSERT INTO `sys_module` VALUES ( 'costSubsidyDetail', NULL, '费用补贴明细 ', 'personelMgr', '/Employeemgr/costSubsidyDetail.jsp', '1', '1', NULL, NULL, NULL, '4', NULL, '1', NULL, NULL );
# 生成费用补贴明细下三级菜单 by wwp
INSERT INTO `sys_module` VALUES ( 'costSubsidyDetail_edit', NULL, '编辑', 'costSubsidyDetail', NULL, '3', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL );
INSERT INTO `sys_module` VALUES ( 'costSubsidyDetail_export', NULL, '导出', 'costSubsidyDetail', NULL, '3', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL );
INSERT INTO `sys_module` VALUES ( 'costSubsidyDetail_geneCommunicationFee', NULL, '生成上月通讯费', 'costSubsidyDetail', NULL, '3', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL );
INSERT INTO `sys_module` VALUES ( 'costSubsidyDetail_geneComputerRent', NULL, '生成上月电脑租金', 'costSubsidyDetail', NULL, '3', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL );
INSERT INTO `sys_module` VALUES ( 'costSubsidyDetail_query', NULL, '查询', 'costSubsidyDetail', NULL, '3', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL );
## 费用补贴明细菜单权限 by wwp
INSERT INTO `sys_rolemodule`  VALUES ('costSubsidyDetail_edit', 'Role_personnel_manage', NULL);

INSERT INTO `sys_rolemodule`  VALUES ('costSubsidyDetail_query', 'Role_personnel_manage', NULL);
INSERT INTO `sys_rolemodule`  VALUES ('costSubsidyDetail_query', 'ROLE_IDf3262e45_1e16_45cc_abcb_78fd7d940618', NULL);
INSERT INTO `sys_rolemodule`  VALUES ('costSubsidyDetail_query', '400020', NULL);
INSERT INTO `sys_rolemodule`  VALUES ('costSubsidyDetail_query', '1000001', NULL);

INSERT INTO `sys_rolemodule`  VALUES ('costSubsidyDetail_export', 'Role_personnel_manage', NULL);
INSERT INTO `sys_rolemodule`  VALUES ('costSubsidyDetail_export', 'ROLE_IDf3262e45_1e16_45cc_abcb_78fd7d940618', NULL);
INSERT INTO `sys_rolemodule`  VALUES ('costSubsidyDetail_export', '400020', NULL);
INSERT INTO `sys_rolemodule`  VALUES ('costSubsidyDetail_export', '1000001', NULL);

INSERT INTO `sys_rolemodule`  VALUES ('costSubsidyDetail_geneCommunicationFee', 'Role_personnel_manage', NULL);

INSERT INTO `sys_rolemodule`  VALUES ('costSubsidyDetail_geneComputerRent', 'Role_personnel_manage', NULL);


# 通讯费级别，金额参数 by wwp
INSERT INTO `dcms_system_par` VALUES ( 'ID7eaeb95a_f4ce_479f_9403_a549eba3fb4a', 'communication_fee_level_quota', NULL, NULL, '1', '5', '0', '职级1额度', '1', '1', 'superadmin', '2018-01-04', NULL );
INSERT INTO `dcms_system_par` VALUES ( 'ID1df75481_5808_478b_bbe0_1d174c719c87', 'communication_fee_level_quota', NULL, NULL, '2', '5', '50', '职级2额度', '1', '1', 'superadmin', '2018-01-04', NULL );
INSERT INTO `dcms_system_par` VALUES ( 'IDf95527ec_92b8_4862_9b21_eedf755a2bf2', 'communication_fee_level_quota', NULL, NULL, '3', '5', '70', '职级3额度', '1', '1', 'superadmin', '2018-01-04', NULL );
INSERT INTO `dcms_system_par` VALUES ( 'IDce58458b_f1dc_480d_9a84_54e196a0dc27', 'communication_fee_level_quota', NULL, NULL, '4', '5', '100', '职级4额度', '1', '1', 'superadmin', '2018-01-04', NULL );
INSERT INTO `dcms_system_par` VALUES ( 'IDbfad8eed_1a8d_44bd_a4ab_ca632a8bbfa4', 'communication_fee_level_quota', NULL, NULL, '5', '5', '100', '职级5额度', '1', '1', 'superadmin', '2018-01-04', NULL );
INSERT INTO `dcms_system_par` VALUES ( 'ID2ab2a5af_87f4_43e8_8664_b663b3eb76f8', 'communication_fee_level_quota', NULL, NULL, '6', '5', '130', '职级6额度', '1', '1', 'superadmin', '2018-01-04', NULL );
INSERT INTO `dcms_system_par` VALUES ( 'ID3f521780_0b63_47a5_ab40_b86991264691', 'communication_fee_level_quota', NULL, NULL, '7', '5', '180', '职级7额度', '1', '1', 'superadmin', '2018-01-04', NULL );
# 通讯费发放方式-报销 by wwp
INSERT INTO `dcms_system_par` VALUES ( 'ID28722fcb_4e0f_49c8_b914_b59c904eb7bc', 'communication_fee_exclude_emp', NULL, NULL, NULL, '5', '1271;1619;1657;5502;5505;6610;6617;6625;6638;6656;6657;6660;6661;6677;6679;6692;6697;6713;6815;6951;2203;', '通讯费发放方式-报销', '1', '1', 'superadmin', '2018-01-04', NULL );

# 新建人员费用补贴表 by wwp
DROP TABLE IF EXISTS dcms_emp_cost_subsidy;
CREATE TABLE `dcms_emp_cost_subsidy` (
  `subsidy_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `emp_id` varchar(50) NOT NULL COMMENT '员工id ',
  `year_mon` char(6) NOT NULL COMMENT '年月',
  `center_id` varchar(100) NOT NULL COMMENT '中心部门id',
  `lunch_subsidy` decimal(16,4) DEFAULT NULL COMMENT '午餐补贴',
  `meal_miss_subsidy` decimal(16,4) DEFAULT NULL COMMENT '误餐补贴',
  `computer_rent` decimal(16,4) DEFAULT NULL COMMENT '电脑租金',
  `communication_fee` decimal(16,4) DEFAULT NULL COMMENT '通讯费',
  `subsidy_remark` varchar(200) DEFAULT NULL COMMENT '说明',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`subsidy_id`),
  UNIQUE KEY `uni_empId_yearmon` (`emp_id`,`year_mon`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=gbk COMMENT='费用补贴明细';



# 费用补贴类型
INSERT INTO `sys_datadictionary` (`dd_dictname`, `dd_id`, `dd_text`, `dd_desc`, `dd_flag`, `dd_order`, `dd_enabled`) VALUES ('COST_SUBSIDY_TYPE', '0', '电脑租金', '费用补贴类型', NULL, '1', '1');
INSERT INTO `sys_datadictionary` (`dd_dictname`, `dd_id`, `dd_text`, `dd_desc`, `dd_flag`, `dd_order`, `dd_enabled`) VALUES ('COST_SUBSIDY_TYPE', '1', '通讯费', '费用补贴类型', NULL, '2', '1');
INSERT INTO `sys_datadictionary` (`dd_dictname`, `dd_id`, `dd_text`, `dd_desc`, `dd_flag`, `dd_order`, `dd_enabled`) VALUES ('COST_SUBSIDY_TYPE', '2', '午餐补贴', '费用补贴类型', NULL, '3', '1');
INSERT INTO `sys_datadictionary` (`dd_dictname`, `dd_id`, `dd_text`, `dd_desc`, `dd_flag`, `dd_order`, `dd_enabled`) VALUES ('COST_SUBSIDY_TYPE', '3', '误餐补贴', '费用补贴类型', NULL, '4', '1');

# 创建部门费用补贴统计表
DROP TABLE IF EXISTS dcms_dep_cost_subsidy;
CREATE TABLE `dcms_dep_cost_subsidy` (
  `subsidy_id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_id` varchar(100) NOT NULL COMMENT '部门id',
  `fee_item` tinyint(4) NOT NULL COMMENT '费用项（0：电脑租金；1：通讯费；2：午餐补贴；3：误餐补贴；）',
  `year_no` char(4) NOT NULL COMMENT '年份',
  `month_sum` decimal(16,4) DEFAULT NULL COMMENT '小计',
  `month1` decimal(16,4) DEFAULT NULL COMMENT '一月',
  `month2` decimal(16,4) DEFAULT NULL COMMENT '二月',
  `month3` decimal(16,4) DEFAULT NULL COMMENT '三月',
  `month4` decimal(16,4) DEFAULT NULL COMMENT '四月',
  `month5` decimal(16,4) DEFAULT NULL COMMENT '五月',
  `month6` decimal(16,4) DEFAULT NULL COMMENT '六月',
  `month7` decimal(16,4) DEFAULT NULL COMMENT '七月',
  `month8` decimal(16,4) DEFAULT NULL COMMENT '八月',
  `month9` decimal(16,4) DEFAULT NULL COMMENT '九月',
  `month10` decimal(16,4) DEFAULT NULL COMMENT '十月',
  `month11` decimal(16,4) DEFAULT NULL COMMENT '十一月',
  `month12` decimal(16,4) DEFAULT NULL COMMENT '十二月',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`subsidy_id`),
  UNIQUE KEY `uk_dfy` (`dep_id`,`fee_item`,`year_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=gbk COMMENT='部门费用补贴表';

----- 人员导入修改 begin ------
## 修改表dcms_employee_record
ALTER TABLE dcms_employee_record ADD COLUMN post_race varchar(64) CHARACTER SET gbk DEFAULT NULL COMMENT '职位族1' after Emp_dep_path;
ALTER TABLE dcms_employee_record ADD COLUMN post_type varchar(64) CHARACTER SET gbk DEFAULT NULL COMMENT '职位类1' after post_race;

# 在职记录表配置修改
DELETE FROM tbl_imp_cfg_dtl WHERE imp_id='0000032';
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003201', 'Emp_oa_no', '人员编码', '1', '1', '0', NULL, '1', '0');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003202', 'Emp_name', '姓名', '1', '2', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003203', 'Emp_begintime', '开始日期', '1', '3', '0', 'com.nantian.imp.impl.RecordDateDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003204', 'Emp_endtime', '结束日期', '1', '4', '0', 'com.nantian.imp.impl.RecordDateDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003205', 'Accounting_institution', '所属核算机构', '1', '5', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003206', 'Emp_org', '组织', '1', '6', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003207', 'Emp_type', '人员类别', '1', '7', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003208', 'Emp_dep_name', '部门', '1', '8', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003209', 'Emp_dep_path', '部门路径', '1', '9', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003210', 'post_race', '职位族1', '1', '10', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003211', 'post_type', '职位类1', '1', '11', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003212', 'Emp_post_type', '职务类别', '1', '12', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003213', 'Emp_post', '职务', '1', '13', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003216', 'Change_type', '异动类型', '1', '16', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003217', 'Change_reason', '异动原因', '1', '17', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003218', 'Report_leader', '汇报领导姓名', '1', '18', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003219', 'Emp_workspace', '工作驻地', '1', '19', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003220', 'Emp_form', '招聘类型', '1', '20', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003221', 'Emp_ditch', '招聘渠道', '1', '21', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003215', 'Emp_level', '职级', '1', '15', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003223', 'imp_state', '导入状态', '1', '23', '0', 'com.nantian.imp.impl.RecordImpStateDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000032', '0003214', 'Emp_position', '职位（劳务、实习）', '1', '14', '0', NULL, '1', '1');

# 离职记录表配置修改
DELETE FROM tbl_imp_cfg_dtl WHERE imp_id='0000033';
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003301', 'Emp_oa_no', '人员编码', '1', '1', '0', NULL, '1', '0');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003302', 'Emp_name', '姓名', '1', '2', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003303', 'Emp_begintime', '开始日期', '1', '3', '0', 'com.nantian.imp.impl.RecordDateDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003304', 'Emp_endtime', '结束日期', '1', '4', '0', 'com.nantian.imp.impl.RecordDateDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003305', 'Accounting_institution', '所属核算机构', '1', '5', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003306', 'Emp_org', '组织', '1', '6', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003307', 'Emp_type', '人员类别', '1', '7', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003308', 'Emp_dep_name', '部门', '1', '8', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003309', 'Emp_dep_path', '部门路径', '1', '9', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003310', 'post_race', '职位族1', '1', '10', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003311', 'post_type', '职位类1', '1', '11', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003312', 'Emp_post_type', '职务类别', '1', '12', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003313', 'Emp_post', '职务', '1', '13', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003316', 'Change_type', '异动类型', '1', '16', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003317', 'Change_reason', '异动原因', '1', '17', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003318', 'Report_leader', '汇报领导姓名', '1', '18', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003319', 'Emp_workspace', '工作驻地', '1', '19', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003320', 'Emp_form', '招聘类型', '1', '20', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003321', 'Emp_ditch', '招聘渠道', '1', '21', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003315', 'Emp_level', '职级', '1', '15', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003323', 'imp_state', '导入状态', '1', '23', '0', 'com.nantian.imp.impl.RecordImpStateDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000033', '0003314', 'Emp_position', '职位（劳务、实习）', '1', '14', '0', NULL, '1', '1');

# 在职人员资料学历信息
DELETE FROM tbl_imp_cfg_dtl WHERE imp_id='0000037';
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000037', '0003701', 'emp_oa_no', '人员编码', '1', '1', '0', NULL, '1', '0');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000037', '0003702', 'emp_name', '姓名', '1', '2', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000037', '0003703', 'emp_highqua', '最高学历', '1', '3', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000037', '0003704', 'is_emp_qua', '是否最高学位', '1', '4', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000037', '0003705', 'emp_jtime', '入学日期', '1', '5', '3', 'com.nantian.imp.impl.RecordDateDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000037', '0003706', 'emp_gtime', '毕业日期', '1', '6', '3', 'com.nantian.imp.impl.RecordDateDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000037', '0003707', 'sch_type', '院校类型', '1', '7', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000037', '0003708', 'emp_sch', '学校', '1', '8', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000037', '0003709', 'emp_qua_profession', '学历专业类别', '1', '9', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000037', '0003710', 'emp_profession', '专业', '1', '10', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000037', '0003711', 'emp_qua', '学历', '1', '11', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000037', '0003712', 'emp_degree', '学位', '1', '12', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000037', '0003713', 'edu_style', '学习方式', '1', '13', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000037', '0003714', 'emp_certification_result', '学历认证结果', '1', '14', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000037', '0003715', 'imp_state', '导入状态', '1', '15', '0', 'com.nantian.imp.impl.RecordImpStateDefaultValue', '1', '1');

# 离职人员资料学历信息
DELETE FROM tbl_imp_cfg_dtl WHERE imp_id='0000038';
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000038', '0003801', 'emp_oa_no', '人员编码', '1', '1', '0', NULL, '1', '0');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000038', '0003802', 'emp_name', '姓名', '1', '2', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000038', '0003803', 'emp_highqua', '最高学历', '1', '3', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000038', '0003804', 'is_emp_qua', '是否最高学位', '1', '4', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000038', '0003805', 'emp_jtime', '入学日期', '1', '5', '3', 'com.nantian.imp.impl.RecordDateDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000038', '0003806', 'emp_gtime', '毕业日期', '1', '6', '3', 'com.nantian.imp.impl.RecordDateDefaultValue', '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000038', '0003807', 'sch_type', '院校类型', '1', '7', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000038', '0003808', 'emp_sch', '学校', '1', '8', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000038', '0003809', 'emp_qua_profession', '学历专业类别', '1', '9', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000038', '0003810', 'emp_profession', '专业', '1', '10', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000038', '0003811', 'emp_qua', '学历', '1', '11', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000038', '0003812', 'emp_degree', '学位', '1', '12', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000038', '0003813', 'edu_style', '学习方式', '1', '13', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000038', '0003814', 'emp_certification_result', '学历认证结果', '1', '14', '0', NULL, '1', '1');
INSERT INTO `tbl_imp_cfg_dtl` VALUES ('0000038', '0003815', 'imp_state', '导入状态', '1', '15', '0', 'com.nantian.imp.impl.RecordImpStateDefaultValue', '1', '1');


# 修改人员信息表配置
UPDATE tbl_imp_cfg_dtl SET fld_caption = '人员编码' WHERE imp_id = '0000018' AND dtl_id = '0000501' AND fld_nm = 'Emp_oa_no';
UPDATE tbl_imp_cfg_dtl SET fld_caption = '私人邮箱' WHERE imp_id = '0000018' AND dtl_id = '0000523' AND fld_nm = 'Emp_mail';
UPDATE tbl_imp_cfg_dtl SET fld_caption = '目前居住地址' WHERE imp_id = '0000018' AND dtl_id = '0000524' AND fld_nm = 'Emp_add';
UPDATE tbl_imp_cfg_dtl SET fld_caption = '参加工作日期' WHERE imp_id = '0000018' AND dtl_id = '0000525' AND fld_nm = 'Emp_wtime';
UPDATE tbl_imp_cfg_dtl SET fld_caption = '南天当前司龄（月）' WHERE imp_id = '0000018' AND dtl_id = '0000541' AND fld_nm = 'Emp_curr_intime';
UPDATE tbl_imp_cfg_dtl SET fld_caption = '入职南天外工龄（月）' WHERE imp_id = '0000018' AND dtl_id = '0000543' AND fld_nm = 'Emp_total_notintime';
UPDATE tbl_imp_cfg_dtl SET fld_caption = '社会工龄（月）' WHERE imp_id = '0000018' AND dtl_id = '0000544' AND fld_nm = 'Emp_society_time';

# dcms_empinfo_temp 添加字段 ‘试用类型’，‘试用结果’
ALTER TABLE dcms_empinfo_temp ADD COLUMN trial_type varchar(64) DEFAULT NULL COMMENT '试用类型';
ALTER TABLE dcms_empinfo_temp ADD COLUMN trial_result varchar(64) DEFAULT NULL COMMENT '试用结果';

# dcms_employee_information 添加字段 ‘试用类型’，‘试用结果’
ALTER TABLE dcms_employee_information ADD COLUMN trial_type varchar(64) DEFAULT NULL COMMENT '试用类型';
ALTER TABLE dcms_employee_information ADD COLUMN trial_result varchar(64) DEFAULT NULL COMMENT '试用结果';

----- 人员导入修改 end -----



