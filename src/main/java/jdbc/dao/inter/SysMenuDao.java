package jdbc.dao.inter;

import java.util.List;
import java.util.Map;

import jdbc.entity.db.SysMenu;
import jdbc.entity.vo.SysMenuChildVo;
import jdbc.entity.vo.SysMenuVo;

import org.apache.ibatis.annotations.Param;


public interface SysMenuDao {
	
	List<SysMenu> queryAll();
	
	List<SysMenu> queryAll2();
	
	List<SysMenuChildVo> queryMenuChildVos();
	
	List<SysMenuVo> getChildrenByPid(Map<String, String> parmMap);
	
	SysMenu querySysMenuById(Map<String, String> parmMap);
	
	int updateSysMenu(SysMenu sysMenu);
	
	int insertSysMenu(SysMenu sysMenu);
	
	int deleteMenuById(@Param("menuId") String menuId);
	
	int getCountByPid(@Param("menuId") String menuId);
	
}
