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
	

    // 获取随机字符串
    public static String getRandStr(int length) {
        char[] chs = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w',
                'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
        Random ran = new Random();
        StringBuffer sb = new StringBuffer();
        int chsLength = chs.length;
        for (int i = 0; i < length; i++) {
            sb.append(chs[ran.nextInt(chsLength)]);
        }
        return sb.toString();
    }

	/**
	 * 获取uuid
	 * @return
	 */
	public static String getBaseUuid(){
		
		return UUID.randomUUID().toString().replace('-', '_');
	}
	
	// test
	public static void main(String[] args) {
	    System.out.println(getBaseUuid());
    }
	
}
