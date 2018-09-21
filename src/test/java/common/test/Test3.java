package common.test;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

public class Test3 {

    public static void main(String[] args) {
//        String fileName = "e:\\z_temp\\dbparse.txt";
//        System.out.println(geneSbSql(fileName));
        
        String str = "简化编号  股份编号    合同名称    客户名称    销售代表    实施部门    所属中心    开票日期    开票金额    税率  收款时间    收款金额    是否预收";
        String[] arrs = str.split("[ ]+");
        System.out.println(Arrays.toString(arrs));
        StringBuffer sb = new StringBuffer();
        for(String s: arrs){
            sb.append("\"").append(s).append("\", ");
        }
        System.out.println(sb.toString());
    }


}
