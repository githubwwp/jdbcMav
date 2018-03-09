package common.test;

import java.text.ParseException;

import org.apache.commons.collections.map.CaseInsensitiveMap;


public class Test {
    public static void main(String[] args) throws ParseException {
        CaseInsensitiveMap map = new CaseInsensitiveMap();
        map.put("B", "sd");
        System.out.println(map.get("b"));
        
    }
}
