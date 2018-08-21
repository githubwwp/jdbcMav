package common.test;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jdbc.util.FileUtil;

public class Test3 {

    public static void main(String[] args) {
        String fileName = "e:\\z_temp\\dbparse.txt";
        System.out.println(geneSbSql(fileName));
//        String msg = FileUtil.readTextContent(fileName);
//        System.out.println(msg);

        // 解析字符串
        // String pattern = "`\\w+`";
        // Pattern r = Pattern.compile(pattern);
        // Matcher m = r.matcher(msg);
        // StringBuffer sb = new StringBuffer();
        // while (m.find()) {
        // sb.append("m.get(").append(m.group()).append("), ");
        // }
        //
        // System.out.println(sb.toString().replaceAll("`", "\""));
    }

    // 根据文件生成 StringBuffer sql
    public static String geneSbSql(String fileName) {
        String message = "";
        BufferedReader br = null;
        try {
            br = new BufferedReader(new InputStreamReader(new FileInputStream(fileName), "gbk"));
            String line = null;
            while ((line = br.readLine()) != null) {
                String s = "sb.append(\" ## \");\n";
                message += s.replace("##", line);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                br.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return message;
    }

}
