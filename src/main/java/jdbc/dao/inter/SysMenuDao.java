package jdbc.dao.inter;

import java.util.List;
import java.util.Map;

import jdbc.entity.db.SysMenu;
import jdbc.entity.vo.SysMenuVo;


public interface SysMenuDao {
	
	List<SysMenu> queryAll();
	
	List<SysMenuVo> queryMenuVos();
	
	List<SysMenuVo> getChildrenByPid(Map<String, String> parmMap);
	
	SysMenu querySysMenuById(Map<String, String> parmMap);
	
	int updateSysMenu(SysMenu sysMenu);
	
	int insertSysMenu(SysMenu sysMenu);
	
}
