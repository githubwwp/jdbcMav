package jdbc.util.excel.write;

import java.util.List;


public class SheetExportEntity {

    /**
     * sheet 名称
     */
    private String sheetName;

    /**
     * sheet数据
     */
    private List<List<WriteCell>> dataList;

    /**
     * 合并单元格
     * 
     * @return
     */
    private List<MergeColEntity> mergeColTypes;

    public String getSheetName() {
        return sheetName;
    }

    public void setSheetName(String sheetName) {
        this.sheetName = sheetName;
    }

    public List<MergeColEntity> getMergeColTypes() {
        return mergeColTypes;
    }

    public void setMergeColTypes(List<MergeColEntity> mergeColTypes) {
        this.mergeColTypes = mergeColTypes;
    }

    public List<List<WriteCell>> getDataList() {
        return dataList;
    }

    public void setDataList(List<List<WriteCell>> dataList) {
        this.dataList = dataList;
    }

}
