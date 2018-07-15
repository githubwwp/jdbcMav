# 采购供应商 ‘开户银行’， ‘银行账户’ 测试数据。
UPDATE dcms_purchase_supplier SET p_open_account_bank = UUID(), p_bank_account = CAST( RAND() * 100000000000 AS DECIMAL (16, 0));

# 获取一个采购合同对应多个销售合同sql
SELECT p_cont_id, GROUP_CONCAT(sale_cont_id) 
FROM ( 
	SELECT DISTINCT p_cont_id, sale_cont_id FROM dcms_purchase_product_detail 
) tt 
GROUP BY p_cont_id 
HAVING count(*) > 3;






