package jdbc.web.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.spring.web.servlet.view.JsonView;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("util")
@Scope("prototype")
public class UtilController {

	@RequestMapping("sqlToSb")
	public ModelAndView sqlToSb(String str) {
		// \ 和 $ 两个符号会引起异常: Illegal group reference
		str = str.replace("\\", "\\\\");
		str = str.replace("$", "\\$");
		Map<String, Object> map = new HashMap<String, Object>();
		Pattern p = Pattern.compile("^.*", Pattern.MULTILINE);
		Matcher m = p.matcher(str);
		StringBuffer sb = new StringBuffer();
		while (m.find()) {
			m.appendReplacement(sb, "sb.append(\" " + m.group() + " \");");
		}
		m.appendTail(sb);

		map.put("str", sb.toString());
		return new ModelAndView(new JsonView(), map);
	}

	@RequestMapping("getTableFields")
	public ModelAndView getTableFields(String str) {
		Map<String, Object> map = new HashMap<String, Object>();
		Pattern p = Pattern.compile("^\\s*(`\\w+`)", Pattern.MULTILINE);
		Matcher m = p.matcher(str);
		StringBuffer sb = new StringBuffer();
		while (m.find()) {
			sb.append(m.group(1)).append(", ");
		}

		map.put("str", sb.toString());
		return new ModelAndView(new JsonView(), map);
	}

}
