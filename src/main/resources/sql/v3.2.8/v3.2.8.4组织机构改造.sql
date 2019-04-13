
# 修改费用导入表,导入结果表, 将中心为 'kfzx'的 替换为 'gzrjzx' by wwp 2019-04-13
UPDATE dcms_fee_report SET center = 'gzrjzx' WHERE center = 'kfzx';
UPDATE dcms_fee_report_result SET center = 'gzrjzx' WHERE center = 'kfzx';

