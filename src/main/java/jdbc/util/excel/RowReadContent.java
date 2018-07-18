package jdbc.util.excel;

import java.util.List;

/**
 * row 内容
 * 
 * @author wwp
 * @date 2018-7-18
 */
public class RowReadContent {

    /**
     * 行数(从0开始)
     */
    private int rowNum;

    private List<Object> cellList;

    public int getRowNum() {
        return rowNum;
    }

    public void setRowNum(int rowNum) {
        this.rowNum = rowNum;
    }

    public List<Object> getCellList() {
        return cellList;
    }

    public void setCellList(List<Object> cellList) {
        this.cellList = cellList;
    }

}
