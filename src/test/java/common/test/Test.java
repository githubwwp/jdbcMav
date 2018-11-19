package common.test;

import java.util.ArrayList;
import java.util.List;

public class Test {

	public static void main(String[] args) {
		
		for(String s: args){
			System.out.println(s);
		}
		
		System.out.println(args);
		System.out.println(args.length);
		
		String str = new String();
		List<String> lis = new ArrayList<String>();
		System.out.println(lis);
		
	}

}
