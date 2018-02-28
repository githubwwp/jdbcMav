package jdbc.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jdbc.entity.db.SysMenu;
import jdbc.entity.vo.SysMenuChildVo;
import jdbc.entity.vo.SysMenuVo;
import jdbc.service.impl.SysMenuService;
import jdbc.util.ObjectUtil;
import jdbc.web.WebConstant;

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
	
	/**
	 * 一次加载所有的菜单
	 * 2018-2-9 by wwp
	 */
	@RequestMapping("queryMenuVos")
	public ModelAndView queryMenuVos(){
		Map<String, Object> model = new HashMap<String, Object>();
		List<SysMenuChildVo> sysMenuChildVos  = sysMenuService.queryMenuChildVos(); // 所有菜单集合
		
		// 获取根目录
		for(SysMenuChildVo mc: sysMenuChildVos){
            if("0".equals(mc.getMenuPid())){
                // 递归获取树结构菜单
                treeSysMenu1(sysMenuChildVos, mc);
                model.put("sysMenuChildVo", mc);
                break;
            }
        }
		
		return new ModelAndView(new JsonView(), model);
	}
	
	private void treeSysMenu1(List<SysMenuChildVo> sysMenuChildVos, SysMenuChildVo pmc){
	    for(SysMenuChildVo mc: sysMenuChildVos){
	        if(mc.getMenuPid().equals(pmc.getMenuId())){
	            if(pmc.getChildren() == null){
	                pmc.setChildren(new ArrayList<SysMenuChildVo>());
	            }
	            pmc.getChildren().add(mc);
	            treeSysMenu1(sysMenuChildVos, mc); // 递归
	        }
	    }
	}
	
	/**
	 * 异步加载数据 <p /> 
	 * 2018-2-7 by wwp
	 */
	@RequestMapping("getChildrenByPid")
	public ModelAndView getChildrenByPid(String pid){
		Map<String, Object> model = new HashMap<String, Object>();
		Map<String, String> parmMap = new HashMap<String, String>();
		parmMap.put("pid", pid);
		List<SysMenuVo> sysMenuVos = sysMenuService.getChildrenByPid(parmMap);
		model.put("children", sysMenuVos);
		
		return new ModelAndView(new JsonView(), model);
	}
	
	/**
	 * 根据id 获取菜单
	 * 2018-2-7 by wwp
	 */
	@RequestMapping("querySysMenuById")
	public ModelAndView querySysMenuById(String menuId){
	    Map<String, Object> model = new HashMap<String, Object>();
        Map<String, String> parmMap = new HashMap<String, String>();
        parmMap.put("menuId", menuId);
        SysMenu sysMenu = sysMenuService.querySysMenuById(parmMap);
        model.put("sysMenu", sysMenu);
        
        return new ModelAndView(new JsonView(), model);
	}
	
	/**
	 * 编辑菜单
	 * 2018-2-7 by wwp
	 */
	@RequestMapping("editSysMenu")
	public ModelAndView editSysMenu(SysMenu sysMenu){
	    @SuppressWarnings("unused")
        int effRow;
        Map<String, Object> model = new HashMap<String, Object>();
        effRow = sysMenuService.updateSysMenu(sysMenu);
        
        return new ModelAndView(new JsonView(), model);
    }
	
	/**
     * 新增菜单
     * 2018-2-7 by wwp
     */
    @RequestMapping("addSysMenu")
    public ModelAndView addSysMenu(SysMenu sysMenu){
        @SuppressWarnings("unused")
        int effRow;
        Map<String, Object> model = new HashMap<String, Object>();
        String seq = ObjectUtil.getBaseUuid();
        sysMenu.setMenuId(seq);
        
        effRow = sysMenuService.insertSysMenu(sysMenu); // 新增菜单
        
        return new ModelAndView(new JsonView(), model);
    }
    
    /**
     * 删除菜单
     * 2018-2-7 by wwp
     */
    @RequestMapping("deleteSysMenu")
    public ModelAndView deleteSysMenu(String menuId){
        @SuppressWarnings("unused")
        int effRow;
        Map<String, Object> model = new HashMap<String, Object>();
        
        // 判断是否存在子菜单
        int count = sysMenuService.getCountByPid(menuId);
        if(count == 0){
            // 删除菜单
            effRow = sysMenuService.deleteMenuById(menuId);
            model.put(WebConstant.RST_MSG, WebConstant.SUCC_STATUS);
        } else{
            model.put(WebConstant.RST_MSG, "存在子菜单，无法删除！");
        }
        
        return new ModelAndView(new JsonView(), model);
    }
    
}
