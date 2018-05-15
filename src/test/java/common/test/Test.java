package common.test;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import jdbc.entity.excel.ColType;
import jdbc.entity.excel.SheetEntity;
import jdbc.util.ExcelUtil;

import org.apache.poi.ss.usermodel.Workbook;

public class Test {

    private static SheetEntity getSheet1() {
        SheetEntity sheet1 = new SheetEntity();

        List<Integer> titleRowList = new ArrayList<Integer>();
        List<Integer> colTypeList = new ArrayList<Integer>();
        List<List<Object>> dataList = new ArrayList<List<Object>>();

        sheet1.setTitleRowList(titleRowList);
        sheet1.setColTypeList(colTypeList);
        sheet1.setDataList(dataList);

        // sheet name
        sheet1.setSheetName("abc");

        // 标题行
        titleRowList.add(2);

        // 列类型
        colTypeList.add(ColType.BOOLEAN);
        colTypeList.add(ColType.CALENDAR);
        colTypeList.add(ColType.DATETIME);
        colTypeList.add(ColType.DOUBLE);
        colTypeList.add(ColType.STRING);

        // 所有数据
        for (int i = 0; i < 100; i++) {
            List<Object> tl = new ArrayList<Object>();
            if (i % 3 == 0) {
                tl.add(true);
            } else {
                tl.add(false);
            }
            tl.add(Calendar.getInstance());
            if(i%2 == 0){
                tl.add(new Date());
            } else{
                tl.add(null);
            }
            tl.add(23.4);
            tl.add("我是一个字符串");
            dataList.add(tl);
        }

        return sheet1;
    }

    // 测试
    public static void main(String[] args) throws IOException {
        List<SheetEntity> sheetEntities = new ArrayList<SheetEntity>();
        boolean isExcel2007 = true;
        String fileName = "g:/temp/export_test";
        if (isExcel2007) {
            fileName += ".xlsx";
        } else {
            fileName += ".xls";
        }

        sheetEntities.add(getSheet1());
        Workbook wk = ExcelUtil.getExportExcel(fileName, sheetEntities, isExcel2007);
        FileOutputStream fos = new FileOutputStream(fileName);
        wk.write(fos);
        fos.close();
        System.out.println("导出成功");
        
        System.out.println("test");
    }

}
