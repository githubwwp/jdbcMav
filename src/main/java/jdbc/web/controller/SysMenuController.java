package jdbc.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jdbc.entity.db.SysMenu;
import jdbc.entity.vo.SysMenuVo;
import jdbc.service.impl.SysMenuService;

import net.sf.json.spring.web.servlet.view.JsonView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("sysMenu")
@Scope("prototype")
public class SysMenuController {
	
	@Autowired
	private SysMenuService sysMenuService;
	
	@RequestMapping("queryAll")
	public ModelAndView queryAll(){
		Map<String, Object> model = new HashMap<String, Object>();
		List<SysMenu> sysMenus = sysMenuService.queryAll();
		model.put("sysMenus", sysMenus);
		
		return new ModelAndView(new JsonView(), model);
	}
	
	@RequestMapping("queryMenuVos")
	public ModelAndView queryMenuVos(){
		Map<String, Object> model = new HashMap<String, Object>();
		List<SysMenuVo> sysMenuVos = sysMenuService.queryMenuVos();
		model.put("sysMenuVos", sysMenuVos);
		
		return new ModelAndView(new JsonView(), model);
	}
	
	@RequestMapping("getChildrenByPid")
	public ModelAndView getChildrenByPid(String pid){
		Map<String, Object> model = new HashMap<String, Object>();
		Map<String, String> parmMap = new HashMap<String, String>();
		parmMap.put("pid", pid);
		List<SysMenuVo> sysMenuVos = sysMenuService.getChildrenByPid(parmMap);
		model.put("children", sysMenuVos);
		
		return new ModelAndView(new JsonView(), model);
	}

}
