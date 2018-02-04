package jdbc.util;

import java.util.Random;
import java.util.UUID;

public class ObjectUtil {

	private ObjectUtil(){}
	
	/**
	 * 获取随机数字
	 * @param limit
	 * @return
	 */
	public static int getRandInt(int limit){
		Random rand = new Random();
		return rand.nextInt(limit);
	}
	
	/**
	 * 获取uuid
	 * @return
	 */
	public static String getBaseUuid(){
		
		return UUID.randomUUID().toString();
	}
	
}
