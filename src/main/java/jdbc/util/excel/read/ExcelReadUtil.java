package jdbc.util.excel.read;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

    public static List<List<Object>> readExcel(String filePath, int sheetIndex) {
        Workbook wk = null;
        try {
            wk = WorkbookFactory.create(new File(filePath));
        } catch (InvalidFormatException e) {
            e.printStackTrace();
            throw new RuntimeException("异常", e);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("异常", e);
        }

        List<List<Object>> dataList = new ArrayList<List<Object>>();
        Sheet sheet = wk.getSheetAt(sheetIndex);
        // 遍历row
        int lastRowNum = sheet.getLastRowNum();
        for (int j = 0; j <= lastRowNum; j++) { // lastRowNum 表示最后一行行标，不是总行数
            List<Object> list = new ArrayList<Object>();
            dataList.add(list);
            Row row = sheet.getRow(j);
            if (row == null) {
                continue;
            }

            // 遍历col
            short lastCellNum = row.getLastCellNum(); // lastCellNum 表示最后一个不为空行的
            for (int k = 0; k < lastCellNum; k++) {
                Cell cell = row.getCell(k);
                Object cellValue = null;
                if (cell != null) {
                    cellValue = getCellValue(cell);
                } else {
                    cellValue = "";
                }
                list.add(cellValue);
            }
        }

        return dataList;
    }

    /**
     * 获取单元格的值 2018-7-18 by wwp
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
    }
}
