package common.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jdbc.util.FileUtil;

public class Test3 {

    public static void main(String[] args) {
        String fileName = "e:\\z_temp\\dbparse.txt";
        String msg = FileUtil.readTextContent(fileName);
        System.out.println(msg);

//        // 解析字符串
//        String pattern = "'[\u3400-\u9FFF]*'";
//        Pattern r = Pattern.compile(pattern);
//        Matcher m = r.matcher(msg);
//        StringBuffer sb = new StringBuffer();
//        while (m.find()) {
//            sb.append(m.group()).append(", ");
//        }
//        
//        System.out.println(sb.toString().replace("'", "\""));
        
        String[] strs = msg.split(",");
        System.out.println(strs.length);
    }

}
