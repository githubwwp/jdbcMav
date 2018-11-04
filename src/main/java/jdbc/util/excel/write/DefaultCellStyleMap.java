package jdbc.util.excel.write;

import java.util.HashMap;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Workbook;

/**
 * 单元格样式
 * 
 * @author wwp
 * @date 2018-7-17
 */
public class DefaultCellStyleMap extends HashMap<Integer, CellStyle> {

    private static final long serialVersionUID = 1L;

    /**
     * 构造函数初始化单元格样式值
     * 
     * @param wk
     */
    public DefaultCellStyleMap(Workbook wk) {
        this.put(ExcelWriteUtil.BOOLEAN, this.defaultCommonCellStyle(wk, null));
        this.put(ExcelWriteUtil.CALENDAR, this.defaultCommonCellStyle(wk, "yyyy-mm-dd"));
        this.put(ExcelWriteUtil.DATE, this.defaultCommonCellStyle(wk, "yyyy-mm-dd"));
        this.put(ExcelWriteUtil.DATETIME, this.defaultCommonCellStyle(wk, "yyyy-mm-dd HH:mm:ss"));
        this.put(ExcelWriteUtil.INTEGER, this.defaultCommonCellStyle(wk, "0"));
        this.put(ExcelWriteUtil.DOUBLE, this.defaultCommonCellStyle(wk, "0.###"));
        this.put(ExcelWriteUtil.DOUBLE_PERCENT, this.defaultCommonCellStyle(wk, "0.00%"));
        this.put(ExcelWriteUtil.RICHTEXTSTRING, this.defaultCommonCellStyle(wk, "TEXT"));
        this.put(ExcelWriteUtil.STRING, this.defaultCommonCellStyle(wk, "TEXT"));
    }

    /**
     * 初始化单元格样式
     * <p />
     * by wwp
     */
    private CellStyle defaultCommonCellStyle(Workbook wk, String formatStyle) {
        CellStyle cellStyle = this.getBaseCellStyle(wk);
        if (formatStyle != null && !"".equals(formatStyle.trim())) {
            DataFormat format = wk.createDataFormat();
            cellStyle.setDataFormat(format.getFormat(formatStyle));
        }

        return cellStyle;
    }

    /**
     * 基本的样式 2018-7-17 by wwp
     */
    private CellStyle getBaseCellStyle(Workbook wk) {
        CellStyle cellStyle = wk.createCellStyle();
        cellStyle.setBorderBottom(CellStyle.BORDER_THIN);
        cellStyle.setBorderLeft(CellStyle.BORDER_THIN);
        cellStyle.setBorderRight(CellStyle.BORDER_THIN);
        cellStyle.setBorderTop(CellStyle.BORDER_THIN);
        cellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);// 垂直居中

        return cellStyle;
    }

}
