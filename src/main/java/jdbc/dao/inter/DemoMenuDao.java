package jdbc.dao.inter;

import java.util.List;

import jdbc.entity.db.DemoMenu;

public interface DemoMenuDao {
	
    List<DemoMenu> queryAll();
    
}