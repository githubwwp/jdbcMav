package common.test;

import java.io.IOException;
import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

public class Test {

	public static void main(String[] args) throws IOException, ParseException {
		double d = 12;
		System.out.println(3/2);
		System.out.println(d/45);
		
		System.out.println(1*1/23);
		
		System.out.println(UUID.randomUUID().toString().replace("-", ""));
	}

}
