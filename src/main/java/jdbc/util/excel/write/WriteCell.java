package jdbc.util.excel.write;

/**
 * 单元格类
 * 
 * @author wwp
 * @date 2018-7-18
 */
public class WriteCell {

    /**
     * 数据实际值
     */
    private Object data;

    /**
     * 单元格数据类型
     */
    private int colType;

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public int getColType() {
        return colType;
    }

    public void setColType(int colType) {
        this.colType = colType;
    }

    public WriteCell(Object data, int colType) {
        super();
        this.data = data;
        this.colType = colType;
    }

}
