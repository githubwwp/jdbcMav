package jdbc.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期工具类
 * 
 * @author wwp
 * @date 2018-2-1
 */
public class DateUtil {

	/* 基本格式 */
	public static final String YYYY = "yyyy";
	public static final String YYYY_MM = "yyyy-MM";
	public static final String YYYY_MM_DD = "yyyy-MM-dd";
	public static final String YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";

	public static final String YYYYMM = "yyyyMM";
	public static final String YYYYMMDD = "yyyyMMdd";

	private DateUtil() {
	}

	/**
	 * 格式化日期
	 */
	public synchronized static String formatDate(Date date, String formatStr) {
		if (date != null) {
			return getSimpleDateFormat(formatStr).format(date);
		} else {
			return null;
		}
	}

	/**
	 * 转换字符串到日期
	 */
	public synchronized static Date parseStr2Date(String dateStr, String formatStr) throws ParseException {
		if (dateStr != null) {
			SimpleDateFormat format = new SimpleDateFormat(formatStr);
			Date date = format.parse(dateStr);
			return date;
		} else {
			return null;
		}
	}

	/**
	 * 获取调整时间后格式化的日期
	 */
	public synchronized static String getAddDateStr(int field, int amount, String formatStr) {
		Calendar cal = Calendar.getInstance();
		cal.add(field, amount); // 修改时间
		String str = formatDate(cal.getTime(), formatStr);
		return str;
	}

	/**
	 * 获取日期格式化对象
	 */
	private synchronized static SimpleDateFormat getSimpleDateFormat(String formatStr) {
		return new SimpleDateFormat(formatStr);
	}

	/**
	 * 测试方法
	 */
	public static void main(String[] args) {
		System.out.println(formatDate(new Date(), DateUtil.YYYYMM));
	}

}
