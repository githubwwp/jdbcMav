package jdbc.util.excel;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Workbook;

/**
 * 单元格样式
 * 
 * @author wwp
 * @date 2018-7-17
 */
public class BaseCellStyle {

    private CellStyle stringCellStyle;

    private CellStyle doubleCellStyle;

    private CellStyle dateCellStyle;

    private CellStyle dateTimeCellStyle;

    /**
     * 获取单元格样式 2018-7-17 by wwp
     */
    public CellStyle getCellStyle(ColTypeEnum cloTypeEnum) {
        switch (cloTypeEnum) {
        case DOUBLE:
            return this.doubleCellStyle;
        case DATE:
            return this.dateCellStyle;
        case DATETIME:
            return this.dateTimeCellStyle;
        case RICHTEXTSTRING:
            return this.stringCellStyle;
        case BOOLEAN:
            return this.stringCellStyle;
        default:
            return this.stringCellStyle;
        }
    }

    /**
     * 构造函数初始化单元格样式值
     * 
     * @param wk
     */
    public BaseCellStyle(Workbook wk) {
        this.stringCellStyle = this.defaultStringCellStyle(wk);
        this.doubleCellStyle = this.defaultDoubleCellStyle(wk);
        this.dateCellStyle = this.defaultDateCellStyle(wk);
        this.dateTimeCellStyle = this.defaultDateTimeCellStyle(wk);
    }

    // 初始化字符串单元格样式
    private CellStyle defaultStringCellStyle(Workbook wk) {
        // 字符串单元格样式
        CellStyle cellStyle = wk.createCellStyle();
        cellStyle.setBorderBottom(CellStyle.BORDER_THIN);
        cellStyle.setBorderLeft(CellStyle.BORDER_THIN);
        cellStyle.setBorderRight(CellStyle.BORDER_THIN);
        cellStyle.setBorderTop(CellStyle.BORDER_THIN);
        cellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);// 垂直居中

        return cellStyle;
    }

    // 初始化布尔类型单元格样式
    private CellStyle defaultBooleanCellStyle(Workbook wk) {
        // 字符串单元格样式
        CellStyle cellStyle = wk.createCellStyle();
        cellStyle.setBorderBottom(CellStyle.BORDER_THIN);
        cellStyle.setBorderLeft(CellStyle.BORDER_THIN);
        cellStyle.setBorderRight(CellStyle.BORDER_THIN);
        cellStyle.setBorderTop(CellStyle.BORDER_THIN);
        cellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);// 垂直居中

        return cellStyle;
    }

    // 初始化小数类型单元格样式
    private CellStyle defaultDoubleCellStyle(Workbook wk) {
        // 字符串单元格样式
        CellStyle cellStyle = wk.createCellStyle();
        cellStyle.setBorderBottom(CellStyle.BORDER_THIN);
        cellStyle.setBorderLeft(CellStyle.BORDER_THIN);
        cellStyle.setBorderRight(CellStyle.BORDER_THIN);
        cellStyle.setBorderTop(CellStyle.BORDER_THIN);
        cellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);// 垂直居中

        return cellStyle;
    }

    // 初始化date类型单元格样式
    private CellStyle defaultDateCellStyle(Workbook wk) {
        DataFormat format = wk.createDataFormat();
        // 字符串单元格样式
        CellStyle cellStyle = wk.createCellStyle();
        cellStyle.setBorderBottom(CellStyle.BORDER_THIN);
        cellStyle.setBorderLeft(CellStyle.BORDER_THIN);
        cellStyle.setBorderRight(CellStyle.BORDER_THIN);
        cellStyle.setBorderTop(CellStyle.BORDER_THIN);
        cellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);// 垂直居中
        cellStyle.setDataFormat(format.getFormat("yyyy-mm-dd"));

        return cellStyle;
    }

    // 初始化dateTime类型单元格样式
    private CellStyle defaultDateTimeCellStyle(Workbook wk) {
        DataFormat format = wk.createDataFormat();
        // 字符串单元格样式
        CellStyle cellStyle = wk.createCellStyle();
        cellStyle.setBorderBottom(CellStyle.BORDER_THIN);
        cellStyle.setBorderLeft(CellStyle.BORDER_THIN);
        cellStyle.setBorderRight(CellStyle.BORDER_THIN);
        cellStyle.setBorderTop(CellStyle.BORDER_THIN);
        cellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);// 垂直居中
        cellStyle.setDataFormat(format.getFormat("yyyy-mm-dd HH:mm:ss"));

        return cellStyle;
    }

}
