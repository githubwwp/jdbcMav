package jdbc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbExcel {

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        String driverClassName = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/sqltest?useUnicode=true&characterEncoding=gbk";
        String username = "root";
        String password = "123";

        // 连接数据库
        // 加载驱动
        Class.forName(driverClassName);
        // 获取数据库连接
        Connection con = DriverManager.getConnection(url, username, password);
        // 通过数据库的连接操作数据库，实现curd
        String sql = "select org_id, org_name  from sys_org";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        // 处理数据的返回结果
        while (rs.next()) {
            System.out.println(rs.getString("org_id") + ", " + rs.getString("org_name"));
        }

        // 关闭 资源
        rs.close();
        ps.close();
        con.close();

    }

}
