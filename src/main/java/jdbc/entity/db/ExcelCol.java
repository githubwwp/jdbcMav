package jdbc.entity.db;

public class ExcelCol {

    private String excelId;

    private int colSort;

    private String colName;

    private int colDataType;

    public String getExcelId() {
        return excelId;
    }

    public void setExcelId(String excelId) {
        this.excelId = excelId;
    }

    public int getColSort() {
        return colSort;
    }

    public void setColSort(int colSort) {
        this.colSort = colSort;
    }

    public String getColName() {
        return colName;
    }

    public void setColName(String colName) {
        this.colName = colName;
    }

    public int getColDataType() {
        return colDataType;
    }

    public void setColDataType(int colDataType) {
        this.colDataType = colDataType;
    }

}
