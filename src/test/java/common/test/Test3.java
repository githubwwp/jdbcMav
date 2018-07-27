package common.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jdbc.util.FileUtil;

public class Test3 {

    public static void main(String[] args) {
//        String fileName = "abcdef123";
//        String msg = FileUtil.readTextContent(fileName);
//        System.out.println(msg);
//
//        // 解析字符串
//        String pattern = "`[a-zA-Z0-9_]*`";
//        Pattern r = Pattern.compile(pattern);
//        Matcher m = r.matcher(msg);
//        while (m.find()) {
//            System.out.print(m.group() + ", ");
//        }
        
        String str = "abcdeabc123abc!@#";
        Pattern p = Pattern.compile("abc(?!de|12)");
        Matcher m = p.matcher(str);
        while(m.find()){
            System.out.println(m.group());
        }
    }

}
