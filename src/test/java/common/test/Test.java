package common.test;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;

public class Test {
	public static void main(String[] args) throws UnsupportedEncodingException, ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");
		System.out.println(sdf.parse(null));
	}
}
