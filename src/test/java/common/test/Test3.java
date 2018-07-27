package common.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jdbc.util.FileUtil;

public class Test3 {

    public static void main(String[] args) {
        String fileName = "e:/z_temp/dbparse.txt";
        String msg = FileUtil.readTextContent(fileName);
        System.out.println(msg);

        // 解析字符串
        String pattern = "`[a-zA-Z0-9_]*`";
        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(msg);
        while (m.find()) {
            System.out.print(m.group() + ", ");
        }
    }


}
