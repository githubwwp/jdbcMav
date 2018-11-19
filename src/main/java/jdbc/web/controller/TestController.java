package jdbc.web.controller;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jdbc.service.impl.SysMenuService;
import net.sf.json.spring.web.servlet.view.JsonView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	    rstMap.put("a", 3);
        rstMap.put("b", "4");
	    
	    return new ModelAndView(new JsonView(), rstMap);
	}
	
	@RequestMapping("jdbcPatchTest")
	public ModelAndView jdbcPatchTest(@RequestParam Map<String, String> parMap) {
		Map<String, Object> rstMap = new HashMap<String, Object>();
		
		String sql = "INSERT INTO t_user (user_id, username, age) VALUES (?, ?, ?)";
		final List<Object[]> paramList = new ArrayList<Object[]>();
		
		paramList.add(new Object[] { 1, "ljj", 33 });
		paramList.add(new Object[] { 2, "t2", 22 });
		paramList.add(new Object[] { 3, "name_3", 33 });
		
		jdbcTemplate.batchUpdate(sql, paramList);
		
		return new ModelAndView(new JsonView(), rstMap);
	}
	
	
	
}
