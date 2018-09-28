package jdbc.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FileUtil {

	private FileUtil() {

	}

	public static String CHARSET_UTF8 = "utf-8";

	public static String CHARSET_GBK = "gbk";

	// 获取文件内容
	public static String readTextContent(String fileName, String charset) {
		StringBuffer message = new StringBuffer();
		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(new FileInputStream(fileName), charset));
			String line = null;
			while ((line = br.readLine()) != null) {
				message.append(line).append("\n");
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return message.toString();
	}

	/**
	 * 用正则表达式替换文本 <br/>
	 * 2018-9-28 by wwp
	 */
	public static String replaceText(String fileName, String charset) {
		String str = FileUtil.readTextContent(fileName, charset);
		String[] strs = str.split("\\n");
		System.out.println(strs.length);
		StringBuffer sb = new StringBuffer();
		int i = 0;
		for (String s : strs) {
			sb.append(s.replaceAll("\\[\\d*\\]", "[".concat(i++ + "").concat("]"))).append("\n");
		}

		return sb.toString();
	}

	/**
	 * 用正则表达式 匹配文本 <br />
	 * 2018-9-28 by wwp
	 */
	public static String matchText(String fileName, String charset) {
		String str = FileUtil.readTextContent(fileName, charset);
		Pattern p = Pattern.compile("\\[\\d*\\]", Pattern.MULTILINE);
		Matcher m = p.matcher(str);
		StringBuffer sb = new StringBuffer();
		int i = 0;
		while (m.find()) {
			sb.append(m.group()).append(", ");
			i++;
		}
		System.out.println(i);
		return sb.toString();
	}

	// test
	public static void main(String[] args) {
		System.out.println(matchText("E:\\z_temp\\dbparse.txt", CHARSET_UTF8));
	}

}
