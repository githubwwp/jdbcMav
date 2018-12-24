package common.test;

import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.Workbook;

import cn.afterturn.easypoi.excel.entity.params.ExcelExportEntity;

public class EasyPoiTest {

	public static void main(String[] args) {
		List<ExcelExportEntity> entity = new ArrayList<ExcelExportEntity>();
		
		entity.add(new ExcelExportEntity("姓名  ", "name"));
		entity.add(new ExcelExportEntity("性别  ", "sex"));
		
		Workbook wk = null;
		
		
		
	}
	
	
}
