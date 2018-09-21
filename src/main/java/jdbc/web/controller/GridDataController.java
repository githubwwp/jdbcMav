package jdbc.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import jdbc.util.ObjectUtil;
import net.sf.json.spring.web.servlet.view.JsonView;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("gridData")
@Scope("prototype")
public class GridDataController {

	
	@RequestMapping("getBaseData")
	public ModelAndView getBaseData(){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Map<String, Object>> datas = new ArrayList<Map<String,Object>>();
		Random rand = new Random(47);
		for(int i=0; i< 5; i++){
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("col1", rand.nextInt(1000));
			m.put("col2", Math.random());
			m.put("col3", UUID.randomUUID().toString());
			m.put("col4", UUID.randomUUID().toString());
			m.put("col5", new Date());
			datas.add(m);
		}
		model.put("items", datas);
		
		return new ModelAndView(new JsonView(), model);
	}
	
	@RequestMapping("getModelData")
	public ModelAndView getModelData(){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Map<String, Object>> datas = new ArrayList<Map<String,Object>>();
		Random rand = new Random(47);
		for(int i=0; i< 10; i++){
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("id", ObjectUtil.getRandInt(100));
			m.put("name", ObjectUtil.getBaseUuid());
			datas.add(m);
		}
		model.put("datas", datas);
		
		return new ModelAndView(new JsonView(), model);
	}
	
}
