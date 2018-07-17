package jdbc.util.excel;

import java.io.File;
import java.io.IOException;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
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

    public void readExcel(String filePath) {
        Workbook wk = null;
        try {
            wk = WorkbookFactory.create(new File(filePath));
        } catch (InvalidFormatException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        
        // 遍历sheet
        
        
        // 遍历row
        
        
        // 遍历col
        
        // 解析每个单元格
        
    }

}
