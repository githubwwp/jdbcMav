package util.test;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import jdbc.util.ObjectUtil;
import jdbc.util.excel.read.ColEntity;
import jdbc.util.excel.read.ExcelReadUtil;
import jdbc.util.excel.read.RowMapping;
import jdbc.util.excel.read.SheetMapping;
import jdbc.util.excel.write.WriteCell;
import jdbc.util.excel.write.CellTypeEnum;
import jdbc.util.excel.write.ExcelWriteUtil;
import jdbc.util.excel.write.MergeColEntity;
import jdbc.util.excel.write.SheetExportEntity;

import org.apache.poi.ss.usermodel.Workbook;

public class TestExcelUtil {

    private static SheetExportEntity getSheet1() {
        SheetExportEntity se = new SheetExportEntity();
        String sheetName = "this is sheet" + UUID.randomUUID().toString();
        ArrayList<Integer> titleRowList = new ArrayList<Integer>();
        titleRowList.add(0);

        List<List<WriteCell>> dataList = new ArrayList<List<WriteCell>>();
        // 添加标题
        List<WriteCell> titleList = new ArrayList<WriteCell>();
        titleList.add(new WriteCell("字符串", CellTypeEnum.STRING));
        titleList.add(new WriteCell("日期", CellTypeEnum.STRING));
        titleList.add(new WriteCell("小数", CellTypeEnum.STRING));
        titleList.add(new WriteCell("整数", CellTypeEnum.STRING));
        titleList.add(new WriteCell("Calender", CellTypeEnum.STRING));
        titleList.add(new WriteCell("boolean", CellTypeEnum.STRING));
        dataList.add(titleList);

        // 添加数据
        int dataRow = 3;
        for (int i = 0; i < dataRow; i++) {
            if (i == 1) {
                dataList.add(new ArrayList<WriteCell>());
                continue;
            }
            List<WriteCell> tl = new ArrayList<WriteCell>();
            tl.add(new WriteCell(ObjectUtil.getBaseUuid(), CellTypeEnum.STRING));
            tl.add(new WriteCell(null, CellTypeEnum.DATETIME));
            tl.add(new WriteCell(Math.random(), CellTypeEnum.DOUBLE_PERCENT));
            tl.add(new WriteCell(new Random().nextInt(987), CellTypeEnum.INTEGER));
            tl.add(new WriteCell(Calendar.getInstance(), CellTypeEnum.CALENDAR));
            tl.add(new WriteCell(i % 3 == 0, CellTypeEnum.BOOLEAN));

            dataList.add(tl);
        }

        // 合并单元格
        List<MergeColEntity> mergeColTypes = new ArrayList<MergeColEntity>();
        mergeColTypes.add(new MergeColEntity(0, 1, 0, 1));

        se.setSheetName(sheetName);
        se.setDataList(dataList);
        se.setMergeColTypes(mergeColTypes);

        return se;
    }

    public static void main(String[] args) {

        // 导出测试
        excelWriteTest();

        System.out.println("\n");

        // 导入测试
        excelReadTest();

    }

    // 导出测试
    private static void excelWriteTest() {
        // 获取数据
        String fileName = "导出excel";
        boolean isExcel2007 = false;
        List<SheetExportEntity> sheetEntities = new ArrayList<SheetExportEntity>();
        sheetEntities.add(getSheet1());
        sheetEntities.add(getSheet1());
        sheetEntities.add(getSheet1());

        System.out.println("开始导出数据...");
        Workbook wk = ExcelWriteUtil.getExportExcel(fileName, sheetEntities, isExcel2007);

        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream("e:/z_temp/" + fileName + (isExcel2007 ? ".xlsx" : ".xls"));
            wk.write(fos);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        System.out.println("导出完成...");
    }

    private static void excelReadTest() {
        String filePath = "e:/z_temp/导出excel.xlsx";
        System.out.println("开始导入数据。。。");
        List<List<Object>> dataList = ExcelReadUtil.readExcel(filePath, 0);
        System.out.println("导入完成，显示如下： ");

        for (int i = 0; i < dataList.size(); i++) {
            System.out.print("\n 第" + (i + 1) + "行 \t");
            List<Object> cellList = dataList.get(i);

            // 验证表头

            // 验证数据类型

            // 其它验证

            // 处理数据

            // 获取数据
            for (int j = 0; j < 7; j++) {
                if (j < cellList.size()) {
                    System.out.print((String) cellList.get(j));
                } else {
                    System.out.print("null");
                }
                System.out.print("\t");
            }
        }

    }

}
