package common.test;

import java.text.ParseException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/**
 * 测试<p />
 * @author wwp
 * @date 2018-3-12
 */
public class Test {
    public static void main(String[] args) throws ParseException {
        String str = "{'a': 'c'}";
        JSONObject jb = JSONObject.fromObject(str);
        JSONArray ja = jb.getJSONArray("a");
        System.out.println(ja);
    }
}
