package jdbc.entity.page;

import java.util.List;
import java.util.Map;

public class PageEntity {

    /**
     * 页码
     */
    private int pageNum;
    /**
     * 每页条数
     */
    private int pageSize;
    /**
     * 总页数
     */
    private int totalPage;
    /**
     * 计数
     */
    private int count;
    /**
     * 结果集
     */
    private List<Map<String, Object>> resultList;

    /**
     * sql
     */
    private String sql;

    /**
     * 参数列表
     */
    private List<PageParam> pageParams;

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<Map<String, Object>> getResultList() {
        return resultList;
    }

    public void setResultList(List<Map<String, Object>> resultList) {
        this.resultList = resultList;
    }

    public List<PageParam> getPageParams() {
        return pageParams;
    }

    public void setPageParams(List<PageParam> pageParams) {
        this.pageParams = pageParams;
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

}
