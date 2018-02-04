package jdbc.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jdbc.dao.inter.DemoMenuDao;
import jdbc.entity.db.DemoMenu;
import net.sf.json.spring.web.servlet.view.JsonView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("test")
@Scope("prototype")
public class TestController {

	@Autowired
	private DemoMenuDao demoMenuDao;
	
	@RequestMapping("test")
	public ModelAndView test(Map<String, Object> map){
		Map<String, Object> rstMap = new HashMap<String, Object>();
		rstMap.put("s", "23");
		List<DemoMenu> list = demoMenuDao.queryAll();
		rstMap.put("list", list);
		
		return new ModelAndView(new JsonView(), rstMap);
	}
	
	
}
