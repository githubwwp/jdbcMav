package common.test;

public class Test4 {

    public static void main(String[] args) {
        // 替换字符或字符串，不能用正则表达式
        System.out.println("abcabc".replace("ab", "t"));
        // 替换第一个与给定正则表达式匹配的字符串
        System.out.println("abcabc".replaceFirst("ab*", "t"));
        // 替换所有与给定正则表达式匹配的字符串
        System.out.println("abcabc".replaceAll("ab", "t"));
        
    }
    
    


}
