package common.test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.poi.hssf.extractor.ExcelExtractor;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

public class Test2 {
    private static void testBoolean() {
        Boolean b = true;
        boolean b2 = b.booleanValue();
        System.out.println(b2);
        System.out.println(b.hashCode());
        System.out.println(Boolean.parseBoolean(null));
        System.out.println(Double.parseDouble(null));
    }

    private static void testByte() {
        System.out.println("Byte_max_value: " + Byte.MAX_VALUE);
        System.out.println("Byte_min_value: " + Byte.MIN_VALUE);
        System.out.println("Byte_size: " + Byte.SIZE);
        System.out.println("Byte_type: " + Byte.TYPE);
    }

    private static void testClass() throws ClassNotFoundException {
        System.out.println(Boolean.TYPE);
        System.out.println(Boolean.class);
        System.out.println(new Integer(2).getClass().getName());
        Class thread = Class.forName("java.lang.Thread");
        System.out.println(thread.getSimpleName());
    }

    public static void main(String[] args) throws FileNotFoundException, IOException {
        String fileName = "e:/z_temp/导出excel.xls";
        HSSFWorkbook wb = new HSSFWorkbook(new POIFSFileSystem(new FileInputStream(fileName)));
        ExcelExtractor extractor = new ExcelExtractor(wb);
    
        extractor.setFormulasNotResults(true);
        extractor.setIncludeSheetNames(false);
        String text = extractor.getText();
        System.out.println(text);
    }

}
