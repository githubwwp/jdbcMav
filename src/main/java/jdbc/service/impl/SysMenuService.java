package jdbc.service.impl;

import java.util.List;
import java.util.Map;

import jdbc.dao.inter.SysMenuDao;
import jdbc.entity.db.SysMenu;
import jdbc.entity.vo.SysMenuVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SysMenuService {

	@Autowired
	private SysMenuDao sysMenuDao;
	
	public List<SysMenu> queryAll(){
		return sysMenuDao.queryAll();
	}
	
	public List<SysMenuVo> queryMenuVos(){
		return sysMenuDao.queryMenuVos();
	}
	
	public List<SysMenuVo> getChildrenByPid(Map<String, String> parmMap){
		return sysMenuDao.getChildrenByPid(parmMap);
	}
	
	public SysMenu querySysMenuById(Map<String, String> parmMap){
	    return sysMenuDao.querySysMenuById(parmMap);
	}
	
	public int updateSysMenu(SysMenu sysMenu){
	    return sysMenuDao.updateSysMenu(sysMenu);
	}
	
	public int insertSysMenu(SysMenu sysMenu){
	    return sysMenuDao.insertSysMenu(sysMenu);
	}
	
}
