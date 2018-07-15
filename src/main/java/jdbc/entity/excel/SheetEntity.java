package jdbc.entity.excel;

import java.util.List;

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
    private List<ColTypeEnum> colTypeList;

    /**
     * sheet数据
     */
    private List<List<Object>> dataList;

    /**
     * 合并单元格
     * 
     * @return
     */
    private List<MergeColType> mergeColTypes;

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

    public List<List<Object>> getDataList() {
        return dataList;
    }

    public void setDataList(List<List<Object>> dataList) {
        this.dataList = dataList;
    }

    public List<MergeColType> getMergeColTypes() {
        return mergeColTypes;
    }

    public void setMergeColTypes(List<MergeColType> mergeColTypes) {
        this.mergeColTypes = mergeColTypes;
    }

    public List<ColTypeEnum> getColTypeList() {
        return colTypeList;
    }

    public void setColTypeList(List<ColTypeEnum> colTypeList) {
        this.colTypeList = colTypeList;
    }

}
