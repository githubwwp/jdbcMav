package jdbc.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jdbc.service.impl.SysMenuService;

import net.sf.json.spring.web.servlet.view.JsonView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("test")
@Scope("prototype")
public class TestController {

	
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SysMenuService sysMenuService;
	
	
	@RequestMapping("jdbcTest")
	public ModelAndView jdbcTest(Map<String, Object> map){
	    Map<String, Object> rstMap = new HashMap<String, Object>();
	    List<Map<String, Object>> list = jdbcTemplate.queryForList("select user_id, username, age from t_user");
	    rstMap.put("list", list);
	    
	    sysMenuService.queryAll2();
	    
	    return new ModelAndView(new JsonView(), rstMap);
	}
	
	
	
}
