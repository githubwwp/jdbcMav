package jdbc.util.excel.read;

import java.util.List;

/**
 * row 内容
 * 
 * @author wwp
 * @date 2018-7-18
 */
public abstract class RowMapping {

    /**
     * 行数(从0开始)
     */
    private int rowNum;

    private List<CellMapping> cellList;

    // 初始化
    public abstract void defaultColMappings();

    public int getRowNum() {
        return rowNum;
    }

    public void setRowNum(int rowNum) {
        this.rowNum = rowNum;
    }

    public List<CellMapping> getCellList() {
        return cellList;
    }

    public void setCellList(List<CellMapping> cellList) {
        this.cellList = cellList;
    }

}
