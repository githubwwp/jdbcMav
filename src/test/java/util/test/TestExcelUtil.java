package util.test;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jdbc.util.ObjectUtil;
import jdbc.util.excel.ColTypeEnum;
import jdbc.util.excel.ExcelUtil;
import jdbc.util.excel.MergeColType;
import jdbc.util.excel.SheetEntity;

import org.apache.poi.ss.usermodel.Workbook;

public class TestExcelUtil {

    private static SheetEntity getSheet1() {
        SheetEntity se = new SheetEntity();
        String sheetName = "this is sheet" + System.currentTimeMillis();
        ArrayList<Integer> titleRowList = new ArrayList<Integer>();
        titleRowList.add(0);

        List<ColTypeEnum> colTypeList = new ArrayList<ColTypeEnum>();
        colTypeList.add(ColTypeEnum.STRING);
        colTypeList.add(ColTypeEnum.DATE);
        colTypeList.add(ColTypeEnum.DOUBLE);

        List<List<Object>> dataList = new ArrayList<List<Object>>();
        List<Object> titleList = new ArrayList<Object>();
        titleList.add("字符串");
        titleList.add("日期");
        titleList.add("数字");
        dataList.add(titleList);

        int dataRow = 60000;
        for (int i = 0; i < dataRow; i++) {
            String str = ObjectUtil.getBaseUuid();
            Date date = new Date();
            Double db = 23.2;

            List<Object> tl = new ArrayList<Object>();
            tl.add(str);
            tl.add(date);
            tl.add(db);
            dataList.add(tl);
        }

        // 合并单元格
        List<MergeColType> mergeColTypes = new ArrayList<MergeColType>() {
            {
                add(new MergeColType(0, 1, 0, 1));
            }
        };

        se.setSheetName(sheetName);
        se.setTitleRowList(titleRowList);
        se.setColTypeList(colTypeList);
        se.setDataList(dataList);
        se.setMergeColTypes(mergeColTypes);

        return se;
    }

    public static void main(String[] args) {

        // 获取数据
        String fileName = "导出excel";
        boolean isExcel2007 = true;
        List<SheetEntity> sheetEntities = new ArrayList<SheetEntity>();
        sheetEntities.add(getSheet1());
//        sheetEntities.add(getSheet1());
//        sheetEntities.add(getSheet1());

        System.out.println("开始导出数据...");
        Workbook wk = ExcelUtil.getExportExcel(fileName, sheetEntities, isExcel2007);

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
