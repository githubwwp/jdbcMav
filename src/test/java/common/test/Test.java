package common.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import jdbc.util.excel.SheetEntity;

public class Test {

    private static SheetEntity getSheet1() {
        SheetEntity sheet1 = new SheetEntity();

        List<Integer> titleRowList = new ArrayList<Integer>();
        List<Integer> colTypeList = new ArrayList<Integer>();
        List<List<Object>> dataList = new ArrayList<List<Object>>();

        sheet1.setTitleRowList(titleRowList);
//        sheet1.setColTypeList(colTypeList);
        sheet1.setDataList(dataList);

        // sheet name
        sheet1.setSheetName("abc");

        // 标题行
        titleRowList.add(2);


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
        
    }

}
