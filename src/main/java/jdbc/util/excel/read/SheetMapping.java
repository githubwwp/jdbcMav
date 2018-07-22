package jdbc.util.excel.read;

import java.util.List;


/**
 * sheet 内容
 * 
 * @author wwp
 * @date 2018-7-18
 */
public class SheetMapping {

    private String sheetName;

    private List<RowMapping> rowReadContents;

    public String getSheetName() {
        return sheetName;
    }

    public void setSheetName(String sheetName) {
        this.sheetName = sheetName;
    }

    public List<RowMapping> getRowReadContents() {
        return rowReadContents;
    }

    public void setRowReadContents(List<RowMapping> rowReadContents) {
        this.rowReadContents = rowReadContents;
    }

}
