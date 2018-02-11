package common.test;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;

import jdbc.util.ObjectUtil;

public class Test {
	public static void main(String[] args) throws UnsupportedEncodingException, ParseException, InterruptedException {
		System.out.println(ObjectUtil.getBaseUuid());
	}
}
