package common.test;

import java.text.ParseException;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jdbc.util.ObjectUtil;

import sun.security.util.Length;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/**
 * 测试<p />
 * @author wwp
 * @date 2018-3-12
 */
public class Test {
    public static void main(String[] args) throws ParseException {
        String str = " `Pro_id` VARCHAR (50) NOT NULL DEFAULT '' COMMENT '项目ID', `Pro_type` VARCHAR (50) NOT NULL DEFAULT 'kfl' COMMENT '项目类型', `Pro_name` VARCHAR (100) DEFAULT NULL COMMENT '项目名称', `Pro_money` FLOAT (10, 2) UNSIGNED DEFAULT '0.00' COMMENT '项目金额', `Pro_shortname` VARCHAR (50) DEFAULT NULL COMMENT '项目简称', `Pro_conper` VARCHAR (50) DEFAULT NULL, `Pro_manager` VARCHAR (50) DEFAULT NULL COMMENT '项目经理', `Pro_qa` VARCHAR (50) DEFAULT NULL COMMENT '项目Qa', `Pro_state` VARCHAR (50) NOT NULL DEFAULT '售前' COMMENT '项目当前状态', `Pro_plbgtime` date DEFAULT NULL COMMENT '项目计划开始时间(废弃)', `Pro_plendtime` date DEFAULT NULL COMMENT '计划退场时间', `Pro_actbgtime` date DEFAULT NULL COMMENT '项目进场时间', `Pro_actendtime` date DEFAULT NULL COMMENT '项目实际退场时间', `Pro_des` VARCHAR (2000) DEFAULT NULL, `Pro_suit` VARCHAR (2000) DEFAULT NULL, `Pro_remark` VARCHAR (2000) DEFAULT NULL COMMENT '项目备注', `IsDeleted` INT (1) NOT NULL DEFAULT '0' COMMENT '是否删除', `Pro_dep` VARCHAR (50) NOT NULL DEFAULT '', `pro_need_warning` TINYINT (1) NOT NULL DEFAULT '1' COMMENT '1', `pro_warning` TINYINT (1) NOT NULL DEFAULT '0', `pro_need_apportion` INT (1) NOT NULL DEFAULT '1', `PRO_CHECKTASKLEVEL` INT (11) DEFAULT '2', `LastModifyTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最近一次更新数据时间', `a` VARCHAR (30) DEFAULT NULL, `pro_parentid` VARCHAR (50) DEFAULT NULL, `pro_confirmstatus` VARCHAR (25) DEFAULT 'yes', `pro_qainfluence` VARCHAR (25) DEFAULT NULL, `Pro_conper2` VARCHAR (50) DEFAULT NULL, `Pro_manager2` VARCHAR (50) DEFAULT NULL, `Pro_technicalmanager` VARCHAR (50) DEFAULT NULL, `pro_qa2` VARCHAR (50) DEFAULT NULL, `pro_qa3` VARCHAR (50) DEFAULT NULL, `pro_waringtime` date DEFAULT NULL, `pro_wariingdateafter` INT (11) DEFAULT NULL, `pro_assistant` VARCHAR (50) DEFAULT NULL, `pro_lastplanmonth` VARCHAR (7) DEFAULT NULL, `pro_plwmnt` FLOAT DEFAULT NULL, `pro_plcost` FLOAT DEFAULT NULL COMMENT '项目计划成本', `pro_changecost` FLOAT DEFAULT NULL COMMENT '项目计划变动成本', `pro_plprofund` FLOAT DEFAULT NULL, `pro_plbuycost` FLOAT DEFAULT NULL, `pro_plothercost` FLOAT DEFAULT NULL COMMENT '项目其他成本', `pro_plsumcost` FLOAT DEFAULT NULL COMMENT '项目总成本', `pro_lastactmonth` VARCHAR (7) DEFAULT NULL, `pro_actwmnt` FLOAT DEFAULT NULL, `pro_actcost` FLOAT DEFAULT NULL COMMENT '项目实际成本', `pro_actchangecost` FLOAT DEFAULT NULL COMMENT '项目实际变动成本', `pro_actprocost` FLOAT DEFAULT NULL, `pro_actbuycost` FLOAT DEFAULT NULL, `pro_actother` FLOAT DEFAULT NULL COMMENT '项目实际其他成本', `pro_actsumcost` FLOAT DEFAULT NULL COMMENT '项目实际总成本', `Pro_business_type` VARCHAR (10) DEFAULT NULL COMMENT '业务类型', `Pro_influArea` VARCHAR (10) DEFAULT NULL COMMENT '项目影响范围', `Pro_reuseMaturity` VARCHAR (10) DEFAULT NULL COMMENT '原型化程度-方案成熟度', `Pro_reuseDepplatform` VARCHAR (10) DEFAULT NULL COMMENT '原型化程度-开发平台重用程度', `Pro_reuseBusinessmodel` VARCHAR (10) DEFAULT NULL COMMENT '原型化程度-业务模型重用程度', `Pro_reuseCode` VARCHAR (10) DEFAULT NULL COMMENT '原型化程度-代码重用程度', `Pro_level` VARCHAR (10) DEFAULT NULL COMMENT '项目级别', `Pro_depmamager` VARCHAR (10) DEFAULT NULL COMMENT '部门经理', `Pro_sales` VARCHAR (50) DEFAULT NULL COMMENT '销售代表', `Pro_PMO` VARCHAR (10) DEFAULT NULL COMMENT 'PMO主控', `pro_QAmanager` VARCHAR (10) DEFAULT NULL COMMENT 'QA经理', `Pro_QCprincipal` VARCHAR (10) DEFAULT NULL COMMENT 'Qc负责人', `Pro_participateQC` VARCHAR (10) DEFAULT NULL COMMENT 'Qc参与程度', `Pro_buildtime` date DEFAULT NULL COMMENT '立项时间', `pro_actknottime` date DEFAULT NULL COMMENT '项目实际结项时间', `Pro_onlinetime` VARCHAR (50) DEFAULT NULL COMMENT '计划上线时间', `reqchange_workloadRatio` FLOAT DEFAULT '0' COMMENT '需求变更工作量比率目标', `rangedevrate` FLOAT DEFAULT '0' COMMENT '范围偏差率目标', `Durationdevrate` FLOAT DEFAULT '0' COMMENT '工期偏差率目标', `Costdevrate` FLOAT DEFAULT '0' COMMENT '成本偏差率目标', `Target_des` VARCHAR (2000) DEFAULT NULL COMMENT '目标描述', `Pl_contId` VARCHAR (50) DEFAULT NULL COMMENT '合同编号', `Pl_contMoney` FLOAT DEFAULT '0' COMMENT '预计合同额', `Pl_contManMonth` FLOAT DEFAULT '0' COMMENT '预计合同人月', `Pl_contSignedtime` VARCHAR (50) DEFAULT NULL COMMENT '预计合同签订时间', `Pl_contSignedremark` VARCHAR (2000) DEFAULT NULL COMMENT '预计合同签订说明', `contManMonth` FLOAT DEFAULT '0' COMMENT '合同人月', `Pro_changetime` date DEFAULT NULL COMMENT '项目变更时间', `Pro_changephase` VARCHAR (10) DEFAULT NULL COMMENT '所处阶段', `Pro_changelevel` VARCHAR (10) DEFAULT NULL COMMENT '变更分级', `Pro_changestage` VARCHAR (2000) DEFAULT NULL COMMENT '变更原因', `Pro_actCostRecordTime` datetime DEFAULT NULL COMMENT '实际变动成本最后保存时间', `Os_Nstan_months` FLOAT DEFAULT NULL COMMENT 'M413外购非人力', `CustSatisfaction` VARCHAR (10) DEFAULT NULL COMMENT 'M505客户满意度率', `pro_Abnormal` VARCHAR (2000) DEFAULT NULL COMMENT '项目异常原因', `os_stan_months` FLOAT DEFAULT NULL COMMENT 'M410项目计划外购人力成本', `AcceptancePlnTime` date DEFAULT NULL COMMENT '计划客户验收时间', `AcceptanceActTime` date DEFAULT NULL COMMENT '实际客户验收时间', `AcceptanceDoc` VARCHAR (200) DEFAULT NULL COMMENT '客户验收电子文档', `pro_teamleader` VARCHAR (10) DEFAULT NULL COMMENT '小组长', `Os_manmonths` DECIMAL (7, 2) DEFAULT '0.00' COMMENT 'M112项目外购人月', `pro_teamleader2` VARCHAR (10) DEFAULT NULL, `pro_teamleader3` VARCHAR (10) DEFAULT NULL, `pro_skill_performance` VARCHAR (100) DEFAULT NULL COMMENT '技术及性能', `pro_sys_framework` VARCHAR (100) DEFAULT NULL COMMENT '系统架构', `pro_technical_system` VARCHAR (100) DEFAULT NULL COMMENT '技术体系（语言等）', `pro_use_platform` VARCHAR (100) DEFAULT NULL COMMENT '使用平台', `pro_year_data` DECIMAL (16, 2) DEFAULT NULL COMMENT '年数据量（万）', `pro_week_customer` DECIMAL (16, 2) DEFAULT NULL COMMENT '周客户量（个）', `pro_plan_ysbg_date` date DEFAULT NULL COMMENT '验收报告计划归档时间', `pro_act_ysbg_date` date DEFAULT NULL COMMENT '验收报告实际归档时间', `pro_ysbg_id` VARCHAR (100) DEFAULT NULL COMMENT '验收报告编号', `pro_plan_mon_avg` DECIMAL (16, 2) DEFAULT NULL COMMENT '计划月均人数', `pro_per_peak` DECIMAL (16, 2) DEFAULT NULL COMMENT '人员峰值', `pro_close_date` date DEFAULT NULL COMMENT '项目关闭日期',";
        Pattern pattern = Pattern.compile("`[a-zA-Z0-9_]+`");
        Matcher matcher = pattern.matcher(str);
        String rst = "";
        while(matcher.find()){
            String s = matcher.group(0);
            rst += s + " as " + s.replaceAll("`", "").toLowerCase() + ",";
        }
        System.out.println(rst);
    }
}
