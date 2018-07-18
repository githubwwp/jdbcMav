package jdbc.util.excel;

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

    public static SheetReadContent readExcel(String filePath, int sheetIndex) {
        Workbook wk = null;
        try {
            wk = WorkbookFactory.create(new File(filePath));
        } catch (InvalidFormatException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        Sheet sheet = wk.getSheetAt(sheetIndex);
        SheetReadContent sheetReadContent = new SheetReadContent();
        List<RowReadContent> rowReadContents = new ArrayList<RowReadContent>();
        sheetReadContent.setSheetName(sheet.getSheetName());
        sheetReadContent.setRowReadContents(rowReadContents);

        // 遍历row
        int lastRowNum = sheet.getLastRowNum();
        for (int j = 0; j <= lastRowNum; j++) { // lastRowNum 表示最后一行行标
            Row row = sheet.getRow(j);
            if (row == null) {
                continue;
            }
            RowReadContent rowContent = new RowReadContent();
            List<Object> celllList = new ArrayList<Object>();
            rowContent.setRowNum(j);
            rowContent.setCellList(celllList);
            rowReadContents.add(rowContent);

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
                celllList.add(cellValue);
            }
        }

        return sheetReadContent;
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

    public static void main(String[] args) {
        String filePath = "e:/z_temp/导出excel.xlsx";
        SheetReadContent sheetReadContent = readExcel(filePath, 0);
        List<RowReadContent> rowList = sheetReadContent.getRowReadContents();
        for (RowReadContent rrc : rowList) {
            System.out.print("\n 第" + rrc.getRowNum() + "行 \t");
            List<Object> cellList = rrc.getCellList();
            for (Object o : cellList) {
                System.out.print(o + "\t");
            }

        }
    }

}
