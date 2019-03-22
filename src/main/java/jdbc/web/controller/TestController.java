package jdbc.web.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import jdbc.entity.db.SysMenu;
import jdbc.service.impl.CycTest1;
import jdbc.service.impl.CycTest2;
import jdbc.service.impl.SysMenuService;
import jdbc.util.ObjectUtil;
import net.sf.json.spring.web.servlet.view.JsonView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("test")
@Scope("prototype")
public class TestController {

	
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private SysMenuService sysMenuService;
	
	@Autowired
	private CycTest1 cycTest1;
	
	@Autowired
	private CycTest2 cycTest2;
	
	@RequestMapping("springCycTest")
	public ModelAndView springCycTest(@RequestParam Map<String, String> parMap) {
		Map<String, Object> rstMap = new HashMap<String, Object>();
		
		rstMap.put("cycTest1", cycTest1.getClass());
		rstMap.put("cycTest2", cycTest2.getClass());
		
		return new ModelAndView(new JsonView(), rstMap);
	}
	
	
	@RequestMapping("jdbcTest")
	public ModelAndView jdbcTest(Map<String, Object> map){
	    Map<String, Object> rstMap = new HashMap<String, Object>();
	    rstMap.put("a", 3);
        rstMap.put("b", "4");
        
        String sql = " insert into date_test(dd) values(null) ";
        jdbcTemplate.update(sql);
	    
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
	
	/**
	 * 新增t_user表 数据 <br />
	 * 2018-12-6 by wwp
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	@RequestMapping("defaultTUserData")
	public ModelAndView defaultTUserData(@RequestParam Map<String, String> parMap) {
		Map<String, Object> rstMap = new HashMap<String, Object>();

		// 清空用户表
		jdbcTemplate.update(" delete from key_test.t_user ");

		// 新增数据
		List<Object[]> params = new ArrayList<Object[]>();
		for (int i = 0; i < 15; i++) {
			String username = "username_" + ObjectUtil.getRandStr(3 + new Random().nextInt(7));
			int gender = i % 3 == 0 ? 0 : 1;
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DAY_OF_MONTH, -(3650 + 100 * i));
			Date birthday = cal.getTime();
			String address = "add" + ObjectUtil.getRandStr(25);

			Object[] objs = new Object[] { username, gender, birthday, address };
			params.add(objs);
		}
		String insertSql = " insert into key_test.t_user ( username, gender, birthday, address ) values ( ?, ?, ?, ? ) ";
		jdbcTemplate.batchUpdate(insertSql, params);
		
		this.defaultTOrgData();
		
		this.defaultTOrg2Data();
		
		this.geneExtraOrgTable(null);

		rstMap.put("msg", "succ");
		return new ModelAndView(new JsonView(), rstMap);
	}
	
	/**
	 * 生成组织机构冗余表 <br/>
	 * 2018-12-7 by wwp
	 */
	@RequestMapping("geneExtraOrgTable")
	public ModelAndView geneExtraOrgTable(@RequestParam Map<String, String> parMap) {
		Map<String, Object> rstMap = new HashMap<String, Object>();
		
		this.geneExtraOrgTable();

		rstMap.put("msg", "ok");
		return new ModelAndView(new JsonView(), rstMap);
	}
	
	
	private void geneExtraOrgTable() {
		//	新增数据sql
		String insertSql = " INSERT INTO `key_test`.t_org_rela (parent, children) VALUES (?, ?) ";

		//	获取所有组织机构
		List<Map<String, Object>> allOrgList = jdbcTemplate.queryForList(" SELECT * FROM `key_test`.`t_org` WHERE org_id != org_p_id ");
		List<Object[]> params = new ArrayList<Object[]>();

		//	遍历
		for (Map<String, Object> m : allOrgList) {
			String org_id = (String) m.get("org_id");
			params.add(new Object[] { org_id, org_id });

			this.addChildOrg(org_id, org_id, allOrgList, params);
		}

		//	清空关系表
		jdbcTemplate.update(" delete from key_test.t_org_rela ");
		//	批量插入数据
		jdbcTemplate.batchUpdate(insertSql, params);
	}
	
	private void addChildOrg(String topParent, String curParent, List<Map<String, Object>> allOrgList, List<Object[]> params) {

		for (Map<String, Object> m : allOrgList) {
			String org_id = (String) m.get("org_id");
			String org_p_id = (String) m.get("org_p_id");

			if (curParent.equals(org_p_id)) {
				params.add(new Object[] { topParent, org_id });
				this.addChildOrg(topParent, org_id, allOrgList, params);
			}
		}
	}
	
	/**
	 * 初始化组织机构数据 <br />
	 * 2018-12-6 by wwp
	 */
	private void defaultTOrgData() {
		// 清空用户表
		jdbcTemplate.update(" delete from key_test.t_org ");
		String insertSql = " INSERT INTO `key_test`.`t_org` ( `org_id`, `org_p_id`, `org_name`, `use_state`, `order`) VALUES ( ?, ?, ?, ?, ?) ";


		{
			String org_id = "root";
			String org_p_id = "&&&";
			String org_name = "name_" + ObjectUtil.getRandStr(5);
			int user_state = 1;
			int order = new Random().nextInt(100);

			Object[] objs = new Object[] { org_id, org_p_id, org_name, user_state, order };
			jdbcTemplate.update(insertSql, objs);
		}

		// 新增数据
		for (int i = 0; i < 3; i++) {
			List<Map<String, Object>> allList = jdbcTemplate.queryForList(" SELECT * FROM `key_test`.`t_org` ");

			List<String> pids = new ArrayList<String>();
			for (Map<String, Object> m : allList) {
				pids.add(m.get("org_id").toString());
			}

			List<Object[]> params = new ArrayList<Object[]>();
			for (int j = 0; j < 4; j++) {
				String org_id = "org_" + ObjectUtil.getRandStr(7);
				String org_p_id = pids.get(new Random().nextInt(pids.size()));
				String org_name = "name_" + ObjectUtil.getRandStr(6);
				int user_state = 1;
				int order = new Random().nextInt(1000);

				Object[] objs = new Object[] { org_id, org_p_id, org_name, user_state, order };
				params.add(objs);
			}

			jdbcTemplate.batchUpdate(insertSql, params);
		}
	}
	
	/**
	 * 初始化组织机构2数据 <br />
	 * 2018-12-6 by wwp
	 */
	private void defaultTOrg2Data() {
		Map<String, Object> rstMap = new HashMap<String, Object>();
		// 清空用户表
		jdbcTemplate.update(" delete from key_test.t_org2 ");

		// 新增数据
		for (int i = 0; i < 3; i++) {
			List<Object[]> params = new ArrayList<Object[]>();
			List<Map<String, Object>> allList = jdbcTemplate.queryForList(" SELECT * FROM `key_test`.`t_org2` ");
			if (allList.size() > 0) {
				List<String> pids = new ArrayList<String>();
				for (Map<String, Object> m : allList) {
					pids.add(m.get("org_rela").toString());
				}

				for (int j = i * 5; j < (i+1)* 5; j++) {
					String org_id = "org_" + ObjectUtil.getRandStr(7);
					String org_rela = pids.get(new Random().nextInt(pids.size())) + "-0" + j;
					String org_name = "name_" + ObjectUtil.getRandStr(6);
					int user_state = 1;
					int order = new Random().nextInt(1000);

					Object[] objs = new Object[] { org_id, org_rela, org_name, user_state, order };
					params.add(objs);
				}
			} else {
				// 添加根节点下的组织机构
				for (int j = 0; j < 3; j++) {
					String org_id = "org_" + ObjectUtil.getRandStr(3);
					String org_rela = "00"+j;
					String org_name = "name_" + ObjectUtil.getRandStr(5);
					int user_state = 1;
					int order = new Random().nextInt(100);

					Object[] objs = new Object[] { org_id, org_rela, org_name, user_state, order };
					params.add(objs);
				}
			}

			String insertSql = " INSERT INTO `key_test`.`t_org2` ( `org_id`, `org_rela`, `org_name`, `use_state`, `order`) VALUES ( ?, ?, ?, ?, ?) ";
			jdbcTemplate.batchUpdate(insertSql, params);
		}

	}
	
	@ResponseBody
	@RequestMapping("respTest")
	public Map<String, Object> respTest() {
		Map<String, Object> rstMap = new HashMap<String, Object>();
		rstMap.put("a", "b");
		rstMap.put("sysMenu", new SysMenu());

		return rstMap;
	}
	
	@ResponseBody
	@RequestMapping("respTest2")
	public String respTest2() {
		Map<String, Object> rstMap = new HashMap<String, Object>();
		rstMap.put("a", "b");
		rstMap.put("sysMenu", new SysMenu());
		
		return "wejfiwejj";
	}
	
}
