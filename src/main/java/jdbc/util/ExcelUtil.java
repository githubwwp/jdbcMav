package jdbc.util;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import jdbc.entity.excel.ColType;
import jdbc.entity.excel.SheetEntity;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.RichTextString;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelUtil {

    private ExcelUtil() {
    }

    public static Workbook getExportExcel(String fileName, List<SheetEntity> sheetEntities, boolean isExcel2007) {
        Workbook wk = null;
        if (isExcel2007) {
            wk = new XSSFWorkbook();
        } else {
            wk = new HSSFWorkbook();
        }

        // 遍历每一个sheet
        for (SheetEntity se : sheetEntities) {
            String sheetName = se.getSheetName();
            List<Integer> titleRowList = se.getTitleRowList();
            List<Integer> colTypeList = se.getColTypeList();
            List<List<Object>> dataList = se.getDataList();

            Sheet sheet = wk.createSheet(sheetName); // 创建sheet

            // 遍历每一行
            for (int i = 0, iLen = dataList.size(); i < iLen; i++) {
                List<Object> rowData = dataList.get(i);
                Row row = sheet.createRow(i);

                // 遍历每一列
                for (int j = 0, jLen = rowData.size(); j < jLen; j++) {
                    Cell cell = row.createCell(j);
                    Object data = rowData.get(j);
                    // 如果是标题行，统一做字符串处理
                    if (titleRowList.contains(i)) {
                        setCellValue(cell, data, ColType.STRING);
                    } else {
                        setCellValue(cell, data, colTypeList.get(j));
                    }
                }
            }
        }

        return wk;
    }

    /**
     * 设置单元格的值
     */
    private static void setCellValue(Cell cell, Object data, Integer dataType) {
        Workbook wk = cell.getRow().getSheet().getWorkbook();
        DataFormat format = wk.createDataFormat();
        // cell 为空，不做处理
        if (data != null) {
            if (ColType.BOOLEAN == dataType) {
                cell.setCellValue((Boolean) data);
            } else if (ColType.CALENDAR == dataType) {
                CellStyle cellDateStyle = wk.createCellStyle();// 创建一个样式对象
                cellDateStyle.setDataFormat(format.getFormat("yyyy-mm-dd"));
                cellDateStyle.setBorderBottom(CellStyle.BORDER_THIN);
                cellDateStyle.setBorderLeft(CellStyle.BORDER_THIN);
                cellDateStyle.setBorderRight(CellStyle.BORDER_THIN);
                cellDateStyle.setBorderTop(CellStyle.BORDER_THIN);
                cellDateStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);// 垂直居中
                cellDateStyle.setAlignment(CellStyle.ALIGN_LEFT);// 左对齐
                cell.setCellStyle(cellDateStyle);
                cell.setCellValue((Calendar) data);
            } else if (ColType.DATE == dataType) {
                CellStyle cellDateStyle = wk.createCellStyle();// 创建一个样式对象
                cellDateStyle.setDataFormat(format.getFormat("yyyy-mm-dd"));
                cellDateStyle.setBorderBottom(CellStyle.BORDER_THIN);
                cellDateStyle.setBorderLeft(CellStyle.BORDER_THIN);
                cellDateStyle.setBorderRight(CellStyle.BORDER_THIN);
                cellDateStyle.setBorderTop(CellStyle.BORDER_THIN);
                cellDateStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);// 垂直居中
                cell.setCellStyle(cellDateStyle);
                cell.setCellValue((Date) data);
            } else if (ColType.DATETIME == dataType) {
                CellStyle cellDateStyle = wk.createCellStyle();// 创建一个样式对象
                cellDateStyle.setDataFormat(format.getFormat("yyyy-mm-dd HH:mm:ss"));
                cellDateStyle.setBorderBottom(CellStyle.BORDER_THIN);
                cellDateStyle.setBorderLeft(CellStyle.BORDER_THIN);
                cellDateStyle.setBorderRight(CellStyle.BORDER_THIN);
                cellDateStyle.setBorderTop(CellStyle.BORDER_THIN);
                cellDateStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);// 垂直居中
                cell.setCellStyle(cellDateStyle);
                cell.setCellValue((Date) data);
            } else if (ColType.RICHTEXTSTRING == dataType) {
                cell.setCellValue((RichTextString) data);
            } else if (ColType.DOUBLE == dataType) {
                cell.setCellValue(Double.parseDouble(data.toString()));
            } else {
                cell.setCellValue(data.toString());
            }
        }
    }

}
