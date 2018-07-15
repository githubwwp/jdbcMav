package jdbc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jdbc.dao.inter.SysMenuDao;
import jdbc.entity.db.SysMenu;
import jdbc.entity.vo.SysMenuChildVo;
import jdbc.entity.vo.SysMenuVo;

import org.apache.ibatis.annotations.Select;
import org.apache.poi.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SysMenuService {

	@Autowired
	private SysMenuDao sysMenuDao;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<SysMenu> queryAll(){
		return sysMenuDao.queryAll();
	}
	
	public List<SysMenuChildVo> queryMenuChildVos(){
		return sysMenuDao.queryMenuChildVos();
	}
	
	public List<SysMenuVo> getChildrenByPid(Map<String, String> parmMap){
		return sysMenuDao.getChildrenByPid(parmMap);
	}
	
	public SysMenu querySysMenuById(Map<String, String> parmMap){
	    return sysMenuDao.querySysMenuById(parmMap);
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public int updateSysMenu(SysMenu sysMenu){
	    return sysMenuDao.updateSysMenu(sysMenu);
	}
	
	public int insertSysMenu(SysMenu sysMenu){
	    return sysMenuDao.insertSysMenu(sysMenu);
	}
	
	public int deleteMenuById(String menuId){
	    return sysMenuDao.deleteMenuById(menuId);
	}
	
	public int getCountByPid(String menuId){
	    return sysMenuDao.getCountByPid(menuId);
	}
	
    public Map<String, Object> getPageMenus(String query, int page, int start, int limit) {
        Map<String, Object> map = new HashMap<String, Object>();
        String sql = "SELECT menu_id AS menuId, menu_pid AS menuPid, menu_name AS menuName, menu_url AS menuUrl, menu_remark AS menuRemark, menu_order AS menuOrder FROM sys_menu WHERE menu_name LIKE concat('%', ?, '%') ";
        query = query == null ? "" : query.trim();
        List<Map<String, Object>> sysMenus = jdbcTemplate.queryForList("select * from ( " + sql + " ) tt limit ?, ?", new Object[] { query, start, limit });
        int count = jdbcTemplate.queryForInt("select count(*) from ( " + sql + ") tt", new Object[] { query });

        map.put("count", count);
        map.put("sysMenus", sysMenus);
        return map;
    }
    
    public List<SysMenu> queryAll2() {
        return sysMenuDao.queryAll2();
    }
	
}
