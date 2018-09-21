package common.test;

import java.text.DecimalFormat;
import java.util.Arrays;

import jdbc.util.ObjectUtil;

public class Test4 {

    private static void aa() {
        String str = "中心经营管理、项目QA、市场部销售人员、非市场部销售、中心部门经理";
        String[] arr = str.split("、");
        StringBuffer sb = new StringBuffer();
        System.out.println("length: " + arr.length);
        for (String s : arr) {
            sb.append("'").append(s).append("',");
        }
        String rst = sb.length() > 0? sb.substring(0, sb.length() - 1): sb.toString();
        System.out.println(rst);
    }

    private static void bb(){
        String str = "300020,QA,Role_Channel_manager,ROLE_ID2811915d_77bc_471b_b6ec_3d1d902e97d1,ROLE_ID36d2c3c9_8c6c_46cc_bd63_815b5e50b52f,ROLE_ID38a10b08_d36a_450b_9762_c628948c600b,ROLE_ID43af15aa_a754_4749_8717_55f5ba235f35,ROLE_ID59625eab_e3ac_4529_b09d_33cf64f3bdba,ROLE_ID7215a09e_6006_45f7_bfd7_117dd2942b16,ROLE_ID78f301ba_b308_4dcc_9991_30bf6b04c4c1,ROLE_ID9609fb86_7135_432a_a2aa_4bbef97d1d42,ROLE_IDa19ed45c_f19c_4af9_9338_da740d8b7a3e,ROLE_IDaa767379_7da1_4c69_8bcd_dd777f5107ee,ROLE_IDe0311c9a_d068_4736_8ddd_647d2ffd08f4,ROLE_IDeb5f71b0_ed17_4e37_a0c1_9f2766544ab2,ROLE_IDf3262e45_1e16_45cc_abcb_78fd7d940618,ROLE_IDf81be878_d530_4503_99d6_5ec97faf5347,ROLE_ID_cen_mana,Role_moblie_mamage,Role_moblie_sale";
        String[] arr = str.split(",");
        StringBuffer sb = new StringBuffer();
        System.out.println("length: " + arr.length);
        for (String s : arr) {
            sb.append("'").append(s).append("',");
        }
        System.out.println(sb);
    }
    
    private static void cc(){
        String str = "核算明细ID,简化编号,股份编号,合同名称,客户名称,销售代表,实施部门,所属中心,易汇预计毛利率,发票号码,开票日期,开票金额,税率,确认时间,确认收入含税,确认收入不含税,确认含税成本,确认不含税成本,确认毛利,说明,操作";
        String[] arr = str.split(",");
        StringBuffer sb = new StringBuffer();
        System.out.println("length: " + arr.length);
        for (String s : arr) {
            sb.append("\"").append(s).append("\", ");
        }
        System.out.println(sb);
    }
    
    private static void dd(){
        String str = "BC_ID,CONT_ID,GF_CONT_ID,CONT_NAME,CUST_NAME,SALE_EMP_NAME,IMPLEMENT_ORG_NAME,CENTER_NAME,CONT_ADVANCE_GROSS_PROFIT_RATE,INVOICE_NO,INVOICE_DATE,TOTAL_TAX,TAX_RATE,CONF_DATE,CONF_INCOME_S,CONF_INCOME_K,CONF_COST_S,CONF_COST_K,CONF_GRO,BC_REMARKS,undefined,";
        String[] arr = str.split(",");
        StringBuffer sb = new StringBuffer();
        System.out.println("length: " + arr.length);
        String tem = "ts.add(m.get(\"###\"));";
        for (String s : arr) {
            sb.append(tem.replace("###", s.toLowerCase())).append("\n");
        }
        System.out.println(sb);
    }
    
    public void sfd(){
        // var str=""; Ext.each(Ext.getCmp('accountingDetailGrid').fields,function(v){console.log(v); str += v.title + ","});
        // var str=""; Ext.each(Ext.getCmp('accountingDetailGrid').fields,function(v){console.log(v); str += v.name + ","});
    }
    
    public static void main(String[] args) {
        aa();
    }
}
