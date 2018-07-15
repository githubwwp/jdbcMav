package jdbc.entity.excel;

/**
 * 合并单元格类
 * 
 * @author wwp23
 * 
 */
public class MergeColType {

    /**
     * 开始行
     */
    private int firstRow;
    /**
     * 最后列
     */
    private int lastRow;
    /**
     * 开始列
     */
    private int firstCol;
    /**
     * 最后列
     */
    private int lastCol;

    public int getFirstRow() {
        return firstRow;
    }

    public MergeColType(int firstRow, int lastRow, int firstCol, int lastCol) {
        super();
        this.firstRow = firstRow;
        this.lastRow = lastRow;
        this.firstCol = firstCol;
        this.lastCol = lastCol;
    }

    public void setFirstRow(int firstRow) {
        this.firstRow = firstRow;
    }

    public int getLastRow() {
        return lastRow;
    }

    public void setLastRow(int lastRow) {
        this.lastRow = lastRow;
    }

    public int getFirstCol() {
        return firstCol;
    }

    public void setFirstCol(int firstCol) {
        this.firstCol = firstCol;
    }

    public int getLastCol() {
        return lastCol;
    }

    public void setLastCol(int lastCol) {
        this.lastCol = lastCol;
    }

}
