package common.test;

import java.math.RoundingMode;
import java.text.DecimalFormat;


public class Test {

	public static void main(String[] args) {
		DecimalFormat d = new DecimalFormat("0.##");
		d.setRoundingMode(RoundingMode.HALF_UP);
		System.out.println(d.format(1.363));
		DecimalFormat d2 = new DecimalFormat("0.#");
		System.out.println(d2.format(1.369));
		DecimalFormat df = new DecimalFormat("###############0.00");// 16位整数位，2小数位
		Double dou = 2.555;
		System.out.println(df.format(dou));
		
		System.out.println();
//		String str = "简化编号,股份编号,客户群,客户名称,行业,合同名称,合同所属周期,销售代表,当前任务责任人,实施部门,所属中心,合同金额,主业务类型,销售主税率,预计总成本含税,计划第三方采购,易汇预计毛利率,OA登记毛利率,预计净毛利率,实施固定费用,实施变动费用,计划费效比,年份,期初开票%,期初收款%,期初成本%,期初开票含税,期初开票不含税,期初收款,期初存货,期初估价,期初核算成本不含税,期初收票含税,期初收票核算不含税,期初付款,期初核算毛利,期初毛利率,当年结转合同额,当年开票含税,当年核算收入含税,当年开票不含税,当年核算收入不含税,当年收款,当年核算成本含税,当年核算成本不含税,当年收票含税,当年收票核算不含税,当年付款,当年核算毛利,当年毛利率,期末核算毛利,期末毛利率,期末开票含税,期末开票不含税,期末收款,期末存货,期末估价,存货估价说明,期末核算成本不含税,期末收票含税,期末收票核算不含税,期末付款,期末开票%,期末收款%,期末成本%,实际人月,实际标准人月,实际变动费用,实际费效比,是否中心解除监管,解除说明";
//		String str2 = "String,String,String,String,String,String,String,String,String,String,String,doubel,String,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,String,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,String,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,doubel,String,String,";
//		String str3 = "agno,gf_cont_id,cust_group,custName,custIndustry,ag_name,ag_state,account_name,currentowner_name,orgName,center_name,ag_money,cont_yewu_type,est_cont_rate,play_outsou_money,plan_total_proc,est_groMar,oa_register_gross_rate,est_groMar_pur,plan_fixed_cost,plan_vari_cost,plan_roi,yearNo,begincMoneySPer,begincMoneyPer,beginCostPer,beg_incMoney_s,beg_incMoney_k,beg_impMoney,beg_reserve,beg_price,beg_cost_k,beg_impBill_s,beg_impBill_k,beg_expMoney,beg_groSar,beg_groMar,jiezhuanMoney,now_sumMoney_s,now_incMoney_s,now_sumMoney_k,now_incMoney_k,now_impMoney,now_cost_s,now_cost_k,now_outsouMoney_s,now_outsouMoney_k,now_expMoney,now_groSar,now_groMar,end_groSar,end_groMar,all_incMoney,all_incMoney_k,all_impMoney,end_reserve,end_price,inventory_valuation_explain,end_cost_k,end_impBilll_s,end_impBilll_k,end_expMoney,allincPer,allimpPer,allCostPer,der_falg,der_desc,,,,,,,2";
//		String[] arr = str.split(",");
//		String[] arr2 = str2.split(",");
//		String[] arr3 = str3.split(",");
//		StringBuffer sb = new StringBuffer();
//		for(int i=0; i< arr.length; i++){
//			sb.append("ts.add(new CellObject(\""+arr[i]+"\", CType."+arr2[i]+", m.get(\""+arr3[i]+"\")));");
//			sb.append("\n");
//		}
//		System.out.println(sb);
	}

}
