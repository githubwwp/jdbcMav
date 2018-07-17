package jdbc.util.excel;

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
public class DefaultCellStyleMap extends HashMap<CellTypeEnum, CellStyle> {

    private static final long serialVersionUID = 1L;

    /**
     * 构造函数初始化单元格样式值
     * 
     * @param wk
     */
    public DefaultCellStyleMap(Workbook wk) {
        this.put(CellTypeEnum.BOOLEAN, this.defaultBooleanCellStyle(wk));
        this.put(CellTypeEnum.CALENDAR, this.defaultDateCellStyle(wk));
        this.put(CellTypeEnum.DATE, this.defaultDateCellStyle(wk));
        this.put(CellTypeEnum.DATETIME, this.defaultDateTimeCellStyle(wk));
        this.put(CellTypeEnum.INTEGER, this.defaultIntegerCellStyle(wk));
        this.put(CellTypeEnum.DOUBLE, this.defaultDoubleCellStyle(wk));
        this.put(CellTypeEnum.DOUBLE_PERCENT, this.defaultDoublePerCentCellStyle(wk));
        this.put(CellTypeEnum.RICHTEXTSTRING, this.defaultStringCellStyle(wk));
        this.put(CellTypeEnum.STRING, this.defaultStringCellStyle(wk));
    }

    /**
     * 初始化字符串单元格样式 2018-7-17 by wwp
     */
    private CellStyle defaultStringCellStyle(Workbook wk) {
        // 字符串单元格样式
        CellStyle cellStyle = this.getBaseCellStyle(wk);

        return cellStyle;
    }

    /**
     * 初始化布尔类型单元格样式 2018-7-17 by wwp
     */
    private CellStyle defaultBooleanCellStyle(Workbook wk) {
        CellStyle cellStyle = this.getBaseCellStyle(wk);

        return cellStyle;
    }

    /**
     * 初始化小数类型单元格样式 2018-7-17 by wwp
     */
    private CellStyle defaultDoubleCellStyle(Workbook wk) {
        DataFormat format = wk.createDataFormat();
        CellStyle cellStyle = this.getBaseCellStyle(wk);
        cellStyle.setDataFormat(format.getFormat("0.###"));

        return cellStyle;
    }

    /**
     * 初始化小数类型单元格样式 2018-7-17 by wwp
     */
    private CellStyle defaultIntegerCellStyle(Workbook wk) {
        DataFormat format = wk.createDataFormat();
        CellStyle cellStyle = this.getBaseCellStyle(wk);
        cellStyle.setDataFormat(format.getFormat("0"));

        return cellStyle;
    }

    /**
     * 初始化小数类型单元格样式 2018-7-17 by wwp
     */
    private CellStyle defaultDoublePerCentCellStyle(Workbook wk) {
        DataFormat format = wk.createDataFormat();
        CellStyle cellStyle = this.getBaseCellStyle(wk);
        cellStyle.setDataFormat(format.getFormat("0.00%"));

        return cellStyle;
    }

    /**
     * 初始化date类型单元格样式 2018-7-17 by wwp
     */
    private CellStyle defaultDateCellStyle(Workbook wk) {
        DataFormat format = wk.createDataFormat();
        CellStyle cellStyle = this.getBaseCellStyle(wk);
        cellStyle.setDataFormat(format.getFormat("yyyy-mm-dd"));

        return cellStyle;
    }

    /**
     * 初始化dateTime类型单元格样式 2018-7-17 by wwp
     */
    private CellStyle defaultDateTimeCellStyle(Workbook wk) {
        DataFormat format = wk.createDataFormat();
        // 字符串单元格样式
        CellStyle cellStyle = this.getBaseCellStyle(wk);
        cellStyle.setDataFormat(format.getFormat("yyyy-mm-dd HH:mm:ss"));

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
