package common.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test2 {
    public static void main(String[] args) {

        String p = "(a)(b)(c)"; // 正则表达式
        String str = "abcsefweljabcwef"; // 待匹配字符串
        Pattern pattern = Pattern.compile(p);
        Matcher matcher = pattern.matcher(str);
        int count = matcher.groupCount(); // 获取分组计数

        int n = 1;
        // 依次查找匹配的字符串
        while (matcher.find()) {
            System.out.println("circle: " + n++);
            for (int i = 0; i <= count; i++) {
                System.out.println("\tgroup(" + i + "): " + matcher.group(i));
            }
        }
    }

}
