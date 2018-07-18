package jdbc.util.excel;

import java.util.List;

/**
 * sheet 内容
 * 
 * @author wwp
 * @date 2018-7-18
 */
public class SheetReadContent {

    private String sheetName;

    private List<RowReadContent> rowReadContents;

    public String getSheetName() {
        return sheetName;
    }

    public void setSheetName(String sheetName) {
        this.sheetName = sheetName;
    }

    public List<RowReadContent> getRowReadContents() {
        return rowReadContents;
    }

    public void setRowReadContents(List<RowReadContent> rowReadContents) {
        this.rowReadContents = rowReadContents;
    }

}
