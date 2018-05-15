package jdbc.entity.excel;

import java.util.List;
import java.util.Map;

public class SheetEntity {

    /**
     * sheet 名称
     */
    private String sheetName;

    /**
     * 标题行
     */
    private List<Integer> titleRowList;

    /**
     * 列数据类型
     */
    private List<Integer> colTypeList;

    /**
     * sheet数据
     */
    private List<List<Object>> dataList;

    public String getSheetName() {
        return sheetName;
    }

    public void setSheetName(String sheetName) {
        this.sheetName = sheetName;
    }

    public List<Integer> getTitleRowList() {
        return titleRowList;
    }

    public void setTitleRowList(List<Integer> titleRowList) {
        this.titleRowList = titleRowList;
    }

    public List<Integer> getColTypeList() {
        return colTypeList;
    }

    public void setColTypeList(List<Integer> colTypeList) {
        this.colTypeList = colTypeList;
    }

    public List<List<Object>> getDataList() {
        return dataList;
    }

    public void setDataList(List<List<Object>> dataList) {
        this.dataList = dataList;
    }

}
