package jdbc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import jdbc.entity.db.ExcelCol;

public class DbExcel {

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        List<ExcelCol> ecs = getExcelCols("test");
        System.out.println(ecs);

    }

    public static List<ExcelCol> getExcelCols(String excelId) {
        String driverClassName = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/sqltest?useUnicode=true&characterEncoding=gbk";
        String username = "root";
        String password = "123";

        // 连接数据库
        // 加载驱动
        try {
            Class.forName(driverClassName);
            Connection con = DriverManager.getConnection(url, username, password);
            // 获取数据库连接
            // 通过数据库的连接操作数据库，实现curd
            // String sql = "select org_id, org_name  from sys_org";
            String sql = "SELECT * FROM excel_col where excel_id = '" + excelId + "' order by col_sort";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            List<ExcelCol> list = new ArrayList<ExcelCol>();
            // 处理数据的返回结果
            while (rs.next()) {
                ExcelCol ec = new ExcelCol();
                ec.setExcelId(rs.getString("excel_id"));
                ec.setColSort(rs.getInt("col_sort"));
                ec.setColName(rs.getString("col_name"));
                ec.setColDataType(rs.getInt("col_data_type"));

                list.add(ec);
            }

            // 关闭 资源
            rs.close();
            ps.close();
            con.close();
            return list;
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

}
