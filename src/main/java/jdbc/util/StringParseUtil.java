package jdbc.util;

public class StringParseUtil {

	private StringParseUtil() {

	}

	public static String parseStr(String str) {
		return parseStr(str, ",", "\"");
	}

	public static String parseStr(String str, String sperator, String addition) {
		if (str != null) {
			String[] arr = str.split(sperator);
			StringBuffer sb = new StringBuffer();
			System.out.println("length: " + arr.length);
			for (String s : arr) {
				sb.append(addition).append(s.trim()).append(addition).append(",");
			}

			// 移除最后的分隔符
			String rst = sb.length() > 0 ? sb.substring(0, sb.length() - 1) : sb.toString();
			return rst;
		} else {
			return null;
		}
	}

	public static String geneExportList(String str) {
		String[] arr = str.split(",");
		StringBuffer sb = new StringBuffer();
		System.out.println("length: " + arr.length);
		for (String s : arr) {
			sb.append("ts.add(m.get(\"").append(s.toLowerCase().trim()).append("\"));").append("\n");
		}

		return sb.toString();
	}


	// test
	public static void main(String[] args) {
		String origin = "300020,QA,Role_Channel_manager,ROLE_ID2811915d_77bc_471b_b6ec_3d1d902e97d1,ROLE_ID36d2c3c9_8c6c_46cc_bd63_815b5e50b52f,ROLE_ID38a10b08_d36a_450b_9762_c628948c600b,ROLE_ID43af15aa_a754_4749_8717_55f5ba235f35,ROLE_ID59625eab_e3ac_4529_b09d_33cf64f3bdba,ROLE_ID7215a09e_6006_45f7_bfd7_117dd2942b16,ROLE_ID78f301ba_b308_4dcc_9991_30bf6b04c4c1,ROLE_ID9609fb86_7135_432a_a2aa_4bbef97d1d42,ROLE_IDa19ed45c_f19c_4af9_9338_da740d8b7a3e,ROLE_IDaa767379_7da1_4c69_8bcd_dd777f5107ee,ROLE_IDe0311c9a_d068_4736_8ddd_647d2ffd08f4,ROLE_IDeb5f71b0_ed17_4e37_a0c1_9f2766544ab2,ROLE_IDf3262e45_1e16_45cc_abcb_78fd7d940618,ROLE_IDf81be878_d530_4503_99d6_5ec97faf5347,ROLE_ID_cen_mana,Role_moblie_mamage,Role_moblie_sale";
		// System.out.println(geneExportList(origin));

	}

}
