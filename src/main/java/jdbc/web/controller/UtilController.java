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
        Map<String, Object> map = new HashMap<String, Object>();
        Pattern p = Pattern.compile("^.*", Pattern.MULTILINE);
        Matcher m = p.matcher(str);
        StringBuffer sb = new StringBuffer();
        while (m.find()) {
            String s = "sb.append(\" ## \");\n";
            sb.append(s.replace("##", m.group()));
        }
        map.put("str", sb.toString());

        return new ModelAndView(new JsonView(), map);
    }

    @RequestMapping("getTableFields")
    public ModelAndView getTableFields(String str) {
        Map<String, Object> map = new HashMap<String, Object>();
        Pattern p = Pattern.compile("^\\s*`(\\w+)`", Pattern.MULTILINE);
        Matcher m = p.matcher(str);
        StringBuffer sb = new StringBuffer();
        while (m.find()) {
            sb.append(m.group()).append(", ");
        }

        map.put("str", sb.toString());
        return new ModelAndView(new JsonView(), map);
    }

}
