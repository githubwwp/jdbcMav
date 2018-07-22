package jdbc.util.excel.read;

public class CellMapping {

    public CellMapping(Class<?> dataType, Object dataVal) {
        super();
        this.dataType = dataType;
        this.dataVal = dataVal;
    }

    private Class<?> dataType; // 数据类型 0：字符串；1：数字；2：日期；

    private Object dataVal; // 数据值。 T标识数据类型

    public Class<?> getDataType() {
        return dataType;
    }

    public void setDataType(Class<?> dataType) {
        this.dataType = dataType;
    }

    public Object getDataVal() {
        return dataVal;
    }

    public void setDataVal(Object dataVal) {
        this.dataVal = dataVal;
    }

}
