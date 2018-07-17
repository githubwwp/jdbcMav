package jdbc.util.excel;

import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.RichTextString;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;

/**
 * excel工具类
 * 
 * @author wwp
 * @date 2018-7-13
 */
public class ExcelUtil {

    // 防止实例化
    private ExcelUtil() {
    }

    /**
     * 导出excel 公共方法
     * 
     * 2018-7-17 by wwp
     */
    public static Workbook getExportExcel(String fileName, List<SheetEntity> sheetEntities, boolean isExcel2007) {
        Workbook wk = null;
        if (isExcel2007) {
            wk = new SXSSFWorkbook(); // 处理大数据
        } else {
            wk = new HSSFWorkbook();
        }

        // 初始化样式（不用每一个单元格都创建一次样式，可以极大减少运行速度，并且防止大数据量时的wk 创建样式，字体的限制）
        BaseCellStyle baseCellStyle = new BaseCellStyle(wk);

        // 遍历每一个sheet
        for (SheetEntity se : sheetEntities) {
            String sheetName = se.getSheetName();
            List<Integer> titleRowList = se.getTitleRowList();
            List<ColTypeEnum> colTypeList = se.getColTypeList();
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
                        setCellValue(cell, data, ColTypeEnum.STRING, baseCellStyle);
                    } else {
                        setCellValue(cell, data, colTypeList.get(j), baseCellStyle);
                    }
                }
            }

            // 合并单元格
            List<MergeColType> mctList = se.getMergeColTypes();
            for (MergeColType mct : mctList) {
                CellRangeAddress cellRangeAddress = new CellRangeAddress(mct.getFirstRow(), mct.getLastRow(), mct.getFirstCol(),
                        mct.getLastCol());
                sheet.addMergedRegion(cellRangeAddress);
            }
        }

        return wk;
    }

    /**
     * 设置单元格的值
     */
    private static void setCellValue(Cell cell, Object data, ColTypeEnum dataType, BaseCellStyle baseCellStyle) {
        // cell 为空，不做处理
        if (data != null) {
            cell.setCellStyle(baseCellStyle.getCellStyle(dataType));

            switch (dataType) {
            case BOOLEAN:
                cell.setCellValue((Boolean) data);
                break;
            case DATE:
                cell.setCellValue((Date) data);
                break;
            case DATETIME:
                cell.setCellValue((Date) data);
                break;
            case RICHTEXTSTRING:
                cell.setCellValue((RichTextString) data);
                break;
            case DOUBLE:
                cell.setCellValue((Double) data);
                break;
            default:
                cell.setCellValue(data.toString());
                break;
            }
        }
    }

}
