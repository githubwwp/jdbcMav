package jdbc.web.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("util")
@Scope("prototype")
public class UtilController {

    @ResponseBody
    @RequestMapping("sqlToSb")
    public String sqlToSb(String str) {
        Pattern p = Pattern.compile("^.*", Pattern.MULTILINE);
        Matcher m = p.matcher(str);
        StringBuffer sb = new StringBuffer();
        while (m.find()) {
            String s = "sb.append(\" ## \");\n";
            sb.append(s.replace("##", m.group()));
        }

        return sb.toString();
    }

    @ResponseBody
    @RequestMapping("getTableFields")
    public String getTableFields(String str) {
        Pattern p = Pattern.compile("^\\s*`(\\w+)`", Pattern.MULTILINE);
        Matcher m = p.matcher(str);
        StringBuffer sb = new StringBuffer();
        while (m.find()) {
            sb.append(m.group()).append(", ");
        }

        return sb.toString();
    }

}
