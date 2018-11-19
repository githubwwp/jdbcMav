package jdbc.web.controller.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.spring.web.servlet.view.JsonView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * jar包：springframework\spring-jdbc\3.2.0.RELEASE\spring-jdbc-3.2.0.RELEASE.jar
 * 
 * @author wwp
 * @date 2018-11-8
 */
@RequestMapping("jdbcTest")
@Controller
public class JdbcTestController {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@RequestMapping("queryForList")
	public ModelAndView queryForList() {
		Map<String, Object> rstMap = new HashMap<String, Object>();

		String str = " select * from ( select * from t_ht) aa ";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(str);

		rstMap.put("list", list);
		return new ModelAndView(new JsonView(), rstMap);
	}

	/**
	 * 执行 queryForMap 方法返回的结果集如果大于1行或者没有数据，会抛出异常 <br />
	 */
	@RequestMapping("queryForMap")
	public ModelAndView queryForMap(@RequestParam Map<String, String> parMap) {
		Map<String, Object> rstMap = new HashMap<String, Object>();

		String sql = " select *, 姓名  aa, round(id, 1) as bb from t_ht limit 1 ";
		Map<String, Object> map = jdbcTemplate.queryForMap(sql);

		rstMap.put("map", map);
		return new ModelAndView(new JsonView(), rstMap);
	}

	@RequestMapping("queryForObject")
	public ModelAndView queryForObject(@RequestParam Map<String, String> parMap) {
		Map<String, Object> rstMap = new HashMap<String, Object>();

		String sql = " SELECT id FROM t_ht LIMIT 1 ";
		Date id = jdbcTemplate.queryForObject(sql, Date.class);

		rstMap.put("id", id);
		return new ModelAndView(new JsonView(), rstMap);
	}

	@RequestMapping("update")
	public ModelAndView update(@RequestParam Map<String, String> parMap) {
		Map<String, Object> rstMap = new HashMap<String, Object>();

		String sql = " update t_ht set 语文  = ? where id = ? ";
		int i = jdbcTemplate.update(sql, new Object[] { new Date(), 3 });

		rstMap.put("ints", i);
		return new ModelAndView(new JsonView(), rstMap);
	}

	@RequestMapping("batchUpdate")
	public ModelAndView batchUpdate(@RequestParam Map<String, String> parMap) {
		Map<String, Object> rstMap = new HashMap<String, Object>();

		// 批量参数
		List<Object[]> params = new ArrayList<Object[]>();
		params.add(new Object[] { 3, 332 });
		params.add(new Object[] { 3, 332 });
		params.add(new Object[] { new Date(), 3 });
		params.add(new Object[] { 3, 332 });

		String sql = " update t_ht set 语文  = ? where id = ? ";
		int[] ints = jdbcTemplate.batchUpdate(sql, params);

		rstMap.put("ints", ints);
		return new ModelAndView(new JsonView(), rstMap);
	}

	@RequestMapping("execute")
	public ModelAndView execute(@RequestParam Map<String, String> parMap) {
		Map<String, Object> rstMap = new HashMap<String, Object>();

		String sql1 = " DROP TABLE IF EXISTS t_new_create ";
		String sql2 = " CREATE TABLE `t_new_create` (`id` INT(11) NOT NULL, PRIMARY KEY(`id`)) ENGINE = INNODB DEFAULT CHARSET = gbk ";
		jdbcTemplate.execute(sql1);
		jdbcTemplate.execute(sql2);

		return new ModelAndView(new JsonView(), rstMap);
	}

}
