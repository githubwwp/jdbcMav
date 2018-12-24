package common.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Test {

	public static void main(String[] args) throws IOException {
		
//		Properties pros = System.getProperties();
//		for(Entry<Object, Object> entry: pros.entrySet()){
//			System.out.println(entry.getKey() + ": " + entry.getValue());
//		}
//		
//		String p_cont_id = new String("323e".getBytes("ISO-8859-1"),"UTF-8");
//		System.out.println(p_cont_id);
//		
//		System.out.println("ab\"");
//		
//		System.out.println("2013GF-000221,YS-2014-23 2015GF-000086,ys-2018-110; 2015GF-000874,ys-2018-111".length());
//		
		System.out.println(0.1 + 0.2 - 0.3);
		
		List list = new ArrayList(Arrays.asList(1, 3, 5));
		list.add(3);
		
		System.out.println(list);
	}

}
