package jdbc.util.excel.write;

/**
 * 单元格类
 * 
 * @author wwp
 * @date 2018-7-18
 */
public class CellEntity {

    private Object data;

    private CellTypeEnum colTypeEnum;

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public CellTypeEnum getColTypeEnum() {
        return colTypeEnum;
    }

    public void setColTypeEnum(CellTypeEnum colTypeEnum) {
        this.colTypeEnum = colTypeEnum;
    }

    public CellEntity(Object data, CellTypeEnum colTypeEnum) {
        super();
        this.data = data;
        this.colTypeEnum = colTypeEnum;
    }

}
