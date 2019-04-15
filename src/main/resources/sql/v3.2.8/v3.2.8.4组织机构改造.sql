
# 修改费用导入表,导入结果表, 将中心为 'kfzx'的 替换为 'gzrjzx' by wwp 2019-04-13
# UPDATE dcms_fee_report SET center = 'gzrjzx' WHERE center = 'kfzx';
# UPDATE dcms_fee_report_result SET center = 'gzrjzx' WHERE center = 'kfzx';

# 修改参数表, 将为 'kfzx'的 替换为 'gzrjzx' by wwp 2019-04-14
UPDATE `dcms_system_par` SET use_dep = 'gzrjzx' WHERE `pare_id` = 'fee_dep' AND use_dep = 'kfzx';

