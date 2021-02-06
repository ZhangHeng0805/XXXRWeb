package database;
import java.sql.*;

public class mysqlJdbc {
    static Connection con = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;

    //连接MySQL
    static final String Driver = "com.mysql.jdbc.Driver";
    static final String url = "jdbc:mysql://127.0.0.1:3306/test?characterEncoding=UTF-8";
    //连接数据库
    public static Connection getConnect(){
        try {
            Class.forName(Driver);
            con = DriverManager.getConnection(url,"root","root");
        }catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
    public static void closeStatement(Statement state){
        if(state!=null){
            try {
                state.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
    public static void closeConnection(Connection conn){
        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
    public static void closeResultSet(ResultSet rs){
        if(rs!=null){
            try {
                rs.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    public static void closeResource(Statement state,Connection conn,ResultSet rs){
        closeStatement(state);
        closeConnection(conn);
        closeResultSet(rs);

    }


    //无参查询
    public static ResultSet getResultSet(String sql){
        con = getConnect();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
    //有参查询
    public static ResultSet getResultSet(String sql,Object[] params){
        con = getConnect();
        try {
            ps = con.prepareStatement(sql);
            for (int i = 0; i < params.length; i++)
                ps.setObject(i+1, params[i]);
            rs = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
    //增删改
    public static int modifyEntiy(String sql, Object[] params){
        int num = 0;
        con = getConnect();
        try {
            ps = con.prepareStatement(sql);
            if(params != null){
                for (int i = 0; i < params.length; i++) {
                    ps.setObject(i+1, params[i]);
                }
            }
            num = ps.executeUpdate();
            closeAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return num;
    }

    public static void closeAll(){
        if (ps != null){
            try {
                ps.close();
                ps = null;
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        if(con != null){
            try {
                con.close();
                con = null;
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

}
