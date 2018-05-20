package jdbc.service.page;

import java.util.List;
import java.util.Map;

import jdbc.entity.page.PageEntity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class PageUtilService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void getPageEntity(PageEntity pageInfo) {
        String sql = "SELECT menu_id AS menuId, menu_pid AS menuPid, menu_name AS menuName FROM sys_menu limit ?, ? ";

        int pageNum = pageInfo.getPageNum();
        int pageSize = pageInfo.getPageSize();
        int start = (pageNum - 1) * pageSize;
        List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, new Object[] { start, pageSize });
        int count = jdbcTemplate.queryForInt("SELECT count(*) FROM sys_menu");

        pageInfo.setCount(count);
        pageInfo.setResultList(list);

    }

}
