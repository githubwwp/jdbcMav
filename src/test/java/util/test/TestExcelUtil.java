package util.test;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import jdbc.util.ObjectUtil;
import jdbc.util.excel.CellEntity;
import jdbc.util.excel.CellTypeEnum;
import jdbc.util.excel.ExcelWritelUtil;
import jdbc.util.excel.MergeColType;
import jdbc.util.excel.SheetExportEntity;

import org.apache.poi.ss.usermodel.Workbook;

public class TestExcelUtil {

    private static SheetExportEntity getSheet1() {
        SheetExportEntity se = new SheetExportEntity();
        String sheetName = "this is sheet" + UUID.randomUUID().toString();
        ArrayList<Integer> titleRowList = new ArrayList<Integer>();
        titleRowList.add(0);

        List<List<CellEntity>> dataList = new ArrayList<List<CellEntity>>();
        // 添加标题
        List<CellEntity> titleList = new ArrayList<CellEntity>();
        titleList.add(new CellEntity("字符串", CellTypeEnum.STRING));
        titleList.add(new CellEntity("日期", CellTypeEnum.STRING));
        titleList.add(new CellEntity("小数", CellTypeEnum.STRING));
        titleList.add(new CellEntity("整数", CellTypeEnum.STRING));
        titleList.add(new CellEntity("Calender", CellTypeEnum.STRING));
        titleList.add(new CellEntity("boolean", CellTypeEnum.STRING));
        dataList.add(titleList);

        // 添加数据
        int dataRow = 5000;
        for (int i = 0; i < dataRow; i++) {
            if (i == 1) {
                dataList.add(new ArrayList<CellEntity>());
                continue;
            }
            List<CellEntity> tl = new ArrayList<CellEntity>();
            tl.add(new CellEntity(ObjectUtil.getBaseUuid(), CellTypeEnum.STRING));
            tl.add(new CellEntity(null, CellTypeEnum.DATETIME));
            tl.add(new CellEntity(Math.random(), CellTypeEnum.DOUBLE_PERCENT));
            tl.add(new CellEntity(new Random().nextInt(987), CellTypeEnum.INTEGER));
            tl.add(new CellEntity(Calendar.getInstance(), CellTypeEnum.CALENDAR));
            tl.add(new CellEntity(i % 3 == 0, CellTypeEnum.BOOLEAN));

            dataList.add(tl);
        }

        // 合并单元格
        List<MergeColType> mergeColTypes = new ArrayList<MergeColType>();
        mergeColTypes.add(new MergeColType(0, 1, 0, 1));

        se.setSheetName(sheetName);
        se.setDataList(dataList);
        se.setMergeColTypes(mergeColTypes);

        return se;
    }

    public static void main(String[] args) {

        // 获取数据
        String fileName = "导出excel";
        boolean isExcel2007 = true;
        List<SheetExportEntity> sheetEntities = new ArrayList<SheetExportEntity>();
        sheetEntities.add(getSheet1());
        sheetEntities.add(getSheet1());
        sheetEntities.add(getSheet1());

        System.out.println("开始导出数据...");
        Workbook wk = ExcelWritelUtil.getExportExcel(fileName, sheetEntities, isExcel2007);

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

}
