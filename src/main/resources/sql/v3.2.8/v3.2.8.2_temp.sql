# 修改字段 精确度 by wwp 2018-07-16
ALTER TABLE dcms_001bill_rece_relation MODIFY `allo_amount` DECIMAL (16, 4) DEFAULT NULL COMMENT '分配金额';

# 销售任务表新增统计字段 by wwp 2018-07-25
ALTER TABLE dcms_sale_task ADD jc_add_cont_task DECIMAL (16, 4) DEFAULT NULL COMMENT '集成新增合同金额任务' AFTER jc_rece_task;
ALTER TABLE dcms_sale_task ADD jc_notax_rece_task DECIMAL (16, 4) DEFAULT NULL COMMENT '集成不含税收款任务' AFTER jc_rece_task;
ALTER TABLE dcms_sale_task ADD jc_bill_notax_gross_task DECIMAL (16, 4) DEFAULT NULL COMMENT '集成开票不含税毛利任务' AFTER jc_rece_task;
ALTER TABLE dcms_sale_task ADD rj_add_cont_task DECIMAL (16, 4) DEFAULT NULL COMMENT '软件新增合同金额任务' AFTER rj_rece_task;
ALTER TABLE dcms_sale_task ADD rj_notax_rece_task DECIMAL (16, 4) DEFAULT NULL COMMENT '软件不含税收款任务' AFTER rj_rece_task;
ALTER TABLE dcms_sale_task ADD rj_bill_notax_gross_task DECIMAL (16, 4) DEFAULT NULL COMMENT '软件开票不含税毛利任务' AFTER rj_rece_task;
ALTER TABLE dcms_sale_task ADD sum_add_cont_task DECIMAL (16, 4) DEFAULT NULL COMMENT '新增合同金额任务合计' AFTER sum_rece_task;
ALTER TABLE dcms_sale_task ADD sum_notax_rece_task DECIMAL (16, 4) DEFAULT NULL COMMENT '不含税收款任务合计' AFTER sum_rece_task;
ALTER TABLE dcms_sale_task ADD sum_bill_notax_gross_task DECIMAL (16, 4) DEFAULT NULL COMMENT '开票不含税毛利任务合计' AFTER sum_rece_task;


# 销售任务历史表新增统计字段 by wwp 2018-08-02
ALTER TABLE dcms_sale_task_his ADD sum_confirm_bill_notax_gross DECIMAL (16, 4) DEFAULT NULL COMMENT '已确认开票不含税毛利合计' AFTER sum_sale_create;
ALTER TABLE dcms_sale_task_his ADD sum_act_bill_notax_gross DECIMAL (16, 4) DEFAULT NULL COMMENT '实际开票不含税毛利合计' AFTER sum_sale_create;
ALTER TABLE dcms_sale_task_his ADD sum_bill_notax_gross_task DECIMAL (16, 4) DEFAULT NULL COMMENT '开票不含税毛利任务合计' AFTER sum_sale_create;
ALTER TABLE dcms_sale_task_his ADD sum_notax_rece DECIMAL (16, 4) DEFAULT NULL COMMENT '不含税收款金额合计' AFTER sum_sale_create;
ALTER TABLE dcms_sale_task_his ADD sum_notax_rece_task DECIMAL (16, 4) DEFAULT NULL COMMENT '不含税收款任务合计' AFTER sum_sale_create;
ALTER TABLE dcms_sale_task_his ADD sum_add_cont DECIMAL (16, 4) DEFAULT NULL COMMENT '新增合同金额合计' AFTER sum_sale_create;
ALTER TABLE dcms_sale_task_his ADD sum_add_cont_task DECIMAL (16, 4) DEFAULT NULL COMMENT '新增合同金额任务合计' AFTER sum_sale_create;

ALTER TABLE dcms_sale_task_his ADD rj_confirm_bill_notax_gross DECIMAL (16, 4) DEFAULT NULL COMMENT '软件已确认开票不含税毛利' AFTER rj_actual_rece;
ALTER TABLE dcms_sale_task_his ADD rj_act_bill_notax_gross DECIMAL (16, 4) DEFAULT NULL COMMENT '软件实际开票不含税毛利' AFTER rj_actual_rece;
ALTER TABLE dcms_sale_task_his ADD rj_bill_notax_gross_task DECIMAL (16, 4) DEFAULT NULL COMMENT '软件开票不含税毛利任务' AFTER rj_actual_rece;
ALTER TABLE dcms_sale_task_his ADD rj_notax_rece DECIMAL (16, 4) DEFAULT NULL COMMENT '软件不含税收款金额' AFTER rj_actual_rece;
ALTER TABLE dcms_sale_task_his ADD rj_notax_rece_task DECIMAL (16, 4) DEFAULT NULL COMMENT '软件不含税收款任务' AFTER rj_actual_rece;
ALTER TABLE dcms_sale_task_his ADD rj_add_cont DECIMAL (16, 4) DEFAULT NULL COMMENT '软件新增合同金额' AFTER rj_actual_rece;
ALTER TABLE dcms_sale_task_his ADD rj_add_cont_task DECIMAL (16, 4) DEFAULT NULL COMMENT '软件新增合同金额任务' AFTER rj_actual_rece;

ALTER TABLE dcms_sale_task_his ADD jc_confirm_bill_notax_gross DECIMAL (16, 4) DEFAULT NULL COMMENT '集成已确认开票不含税毛利' AFTER jc_actual_rece;
ALTER TABLE dcms_sale_task_his ADD jc_act_bill_notax_gross DECIMAL (16, 4) DEFAULT NULL COMMENT '集成实际开票不含税毛利' AFTER jc_actual_rece;
ALTER TABLE dcms_sale_task_his ADD jc_bill_notax_gross_task DECIMAL (16, 4) DEFAULT NULL COMMENT '集成开票不含税毛利任务' AFTER jc_actual_rece;
ALTER TABLE dcms_sale_task_his ADD jc_notax_rece DECIMAL (16, 4) DEFAULT NULL COMMENT '集成不含税收款金额' AFTER jc_actual_rece;
ALTER TABLE dcms_sale_task_his ADD jc_notax_rece_task DECIMAL (16, 4) DEFAULT NULL COMMENT '集成不含税收款任务' AFTER jc_actual_rece;
ALTER TABLE dcms_sale_task_his ADD jc_add_cont DECIMAL (16, 4) DEFAULT NULL COMMENT '集成新增合同金额' AFTER jc_actual_rece;
ALTER TABLE dcms_sale_task_his ADD jc_add_cont_task DECIMAL (16, 4) DEFAULT NULL COMMENT '集成新增合同金额任务' AFTER jc_actual_rece;





