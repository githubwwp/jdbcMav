# 删除没有关联的预收款开票 
DELETE br
FROM dcms_001bill_rece br 
WHERE 
	br.is_advance IN ('yhtys', 'whtys') 
	AND NOT EXISTS ( SELECT * FROM dcms_001bill_rece_relation WHERE br_id = br.br_id );
