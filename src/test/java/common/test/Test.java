package common.test;

import java.math.RoundingMode;
import java.text.DecimalFormat;

public class Test {

	public static void main(String[] args) {
		Double d = 123235434234.0000007;

		// 0 的用法 (不存在用0填充)
		DecimalFormat d1 = new DecimalFormat("00000000000,000.000000");
		d1.setRoundingMode(RoundingMode.HALF_UP);
		System.out.println(d1.format(d));

		// # 的用法
		DecimalFormat d2 = new DecimalFormat("####.#####");
		System.out.println(d2.format(d));

		// E 的用法
		DecimalFormat d3 = new DecimalFormat("0.##E0");//
		System.out.println(d3.format(d));

		// % 的用法
		DecimalFormat d4 = new DecimalFormat("0.00%");
		System.out.println(d4.format(d));
		
		Double dou = 0.00;
		System.out.println(dou);
		System.out.println(0 == dou);
		System.out.println(0 == 0.0);
	}

}
