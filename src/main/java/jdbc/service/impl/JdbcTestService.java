package jdbc.service.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.spring.web.servlet.view.JsonView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Service
@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
public class JdbcTestService {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void batchUpdateTest() {
		Map<String, Object> rstMap = new HashMap<String, Object>();

		// 批量参数
		List params = new ArrayList();
		 params.add(new Object[] { 1, 332 });
		 params.add(new Object[] { 2, "wef" });
		 params.add(new Object[] { 3, "23" });
//		params.add(new ArrayList(Arrays.asList(1, 23)));
//		params.add(new ArrayList(Arrays.asList(2, "34")));
//		params.add(new ArrayList(Arrays.asList(3, 25)));

		String sql = " insert into t_ht(语文 , 数学) values ( ?, ? ) ";
		jdbcTemplate.batchUpdate(sql, params);
//		Map rm = promemindBatchUpdate(sql, params);
	}
	
	public void tranTest(){
		String sql = " insert into t_ht(语文 , 数学) values ( ?, ? ) ";
		jdbcTemplate.update(sql, new Object[]{ 1, 23 });
		if(sql != null){
			throw new RuntimeException("tran test exceptin test");
		}
		jdbcTemplate.update(sql, new Object[]{ 2, 34 });
		
	}

	private Map promemindBatchUpdate(String insertsql, final List insertparam) {
		if (insertparam == null || insertparam.size() == 0) {
			return null;
		}
		jdbcTemplate.batchUpdate(insertsql, new BatchPreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pstm, int idx) throws SQLException {
				List ps = (List) insertparam.get(idx);
				for (int i = 0; i < ps.size(); i++) {
					pstm.setObject(i + 1, ps.get(i));
				}
			}

			@Override
			public int getBatchSize() {
				return insertparam.size();
			}
		});
		return null;
	}

}
