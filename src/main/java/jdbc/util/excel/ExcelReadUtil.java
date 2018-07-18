package jdbc.util.excel;

import java.io.File;
import java.io.IOException;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

/**
 * 导入excel工具类
 * 
 * @author wwp
 * @date 2018-7-17
 */
public class ExcelReadUtil {

    // 防止实例化
    private ExcelReadUtil() {
    }

    public static void readExcel(String filePath) {
        Workbook wk = null;
        try {
            wk = WorkbookFactory.create(new File(filePath));
        } catch (InvalidFormatException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        // 遍历sheet
        int sheetNum = wk.getNumberOfSheets();
        for (int i = 0; i < sheetNum; i++) {
            Sheet sheet = wk.getSheetAt(i);
            if (sheet == null) {
                continue;
            }

            // 遍历row
            int lastRowNum = sheet.getLastRowNum();
            for (int j = 0; j <= lastRowNum; j++) {
                System.out.println("\n");
                Row row = sheet.getRow(j);
                if (row == null) {
                    continue;
                }

                // 遍历col
                short lastCellNum = row.getLastCellNum();
                for (int k = 0; k < lastCellNum; k++) {
                    Cell cell = row.getCell(k);
                    if (cell != null) {
                        System.out.print(getCellValue(cell) + "\t");
                    } else {
                        System.out.print("空\t");
                    }
                }
            }
        }
    }

    /**
     * 获取单元格的值
     * 2018-7-18 by wwp
     */
    private static Object getCellValue(Cell cell) {

        switch (cell.getCellType()) {
        case Cell.CELL_TYPE_STRING:
            return cell.getRichStringCellValue().getString();
        case Cell.CELL_TYPE_NUMERIC:
            if (DateUtil.isCellDateFormatted(cell)) {
                return cell.getDateCellValue();
            } else {
                return cell.getNumericCellValue();
            }
        case Cell.CELL_TYPE_BOOLEAN:
            return cell.getBooleanCellValue();
        case Cell.CELL_TYPE_FORMULA:
            return cell.getCellFormula();
        case Cell.CELL_TYPE_BLANK:
            return "";
        default:
            return "";
        }

        // switch (cell.getCellType()) {
        // case CellType.STRING:
        // System.out.println(cell.getRichStringCellValue().getString());
        // break;
        // case CellType.NUMERIC:
        // if (DateUtil.isCellDateFormatted(cell)) {
        // System.out.println(cell.getDateCellValue());
        // } else {
        // System.out.println(cell.getNumericCellValue());
        // }
        // break;
        // case CellType.BOOLEAN:
        // System.out.println(cell.getBooleanCellValue());
        // break;
        // case CellType.FORMULA:
        // System.out.println(cell.getCellFormula());
        // break;
        // case CellType.BLANK:
        // System.out.println();
        // break;
        // default:
        // System.out.println();
        //
    }

    public static void main(String[] args) {
        String filePath = "e:/z_temp/导出excel.xlsx";
        readExcel(filePath);
    }

}
