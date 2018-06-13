# 修改参数邮箱并新增参数邮箱
UPDATE `dcms_system_par` SET `pram_name` = '软件补充邮箱', `des_text` = 'gzntqa@nantian.com.cn 软件经管公共邮箱' WHERE `id` = 'ID7728a7e1_a0b6_422b_84e2_53d460432a86';
INSERT INTO `dcms_system_par` VALUES ( 'IDa1745760_883c_4f09_8861_0d31dfbede32', 'jc_sup_email', NULL, 'gznt', '集成补充邮箱', '2', 'gznt_jcpmo@nantian.com.cn', 'gznt_jcpmo@nantian.com.cn 集成经管公共邮箱', '1', '1', 'superadmin', '2018-06-12', NULL );

# 修改合同表字段注释（'合同签署方' 改为 '销售合同结算单元'）
ALTER TABLE dcms_sales_contract_register MODIFY `Cont_Signatory` VARCHAR (20) NOT NULL DEFAULT '' COMMENT '销售合同结算单元';


