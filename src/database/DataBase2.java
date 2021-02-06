package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Object.*;

import static database.mysqlJdbc.getConnect;

public class DataBase2 {
    public static String AddAccess(Access a){//添加访问日志信息
        Connection conn = getConnect();
        PreparedStatement state = null;
        String flag = "false";
        try {
            String sql = "insert into 访问日志 values(?,?,?)";
            state =conn.prepareStatement(sql);
            state.setString(1, a.getTime());
            state.setString(2, a.getIp());
            state.setString(3, a.getUser_agent());
            int i = state.executeUpdate( );
            if(i>0){
                flag = "true";
            }
        } catch (Exception e) {
            // TODO: handle exception
//			e.printStackTrace();
            flag=String.valueOf(e);
            if (flag.indexOf("for key 'PRIMARY'")>0){
                flag="该账号存在";
            }
        }
        finally{
            mysqlJdbc.closeResource(state, conn,null);
        }
        return flag;
    }
    public static ArrayList<Access> getAccessList(){//查询所有访问日志信息
        ArrayList<Access> lists=new ArrayList<Access>();
        Access list=null;
        Connection conn = getConnect();
        PreparedStatement state = null;
        ResultSet rs=null;
        try{
            String sql="select * from 访问日志 order by 时间 desc";
            state = conn.prepareStatement(sql);
            //state.setString(1, title);
            //tate.setString(1, time);
            rs = state.executeQuery();
            while(rs.next()){
                list=new Access();
                list.setTime(rs.getString("时间"));
                list.setIp(rs.getString("IP地址"));
                list.setUser_agent(rs.getString("请求头"));
                lists.add(list);
            }
        }
        catch (Exception e) {
            // TODO: handle exception
			e.printStackTrace();
        }
        finally{
            mysqlJdbc.closeResource(state, conn, rs);
        }
        return lists;
    }
    public static String AddLogin_log(Login_log l){//添加登录日志信息
        Connection conn = getConnect();
        PreparedStatement state = null;
        String flag = "false";
        try {
            String sql = "insert into 登录日志 values(?,?,?,?,?)";
            state =conn.prepareStatement(sql);
            state.setString(1, l.getTime());
            state.setString(2, l.getPhone());
            state.setString(3, l.getName());
            state.setString(4, l.getIp());
            state.setString(5, l.getUser_agent());
            int i = state.executeUpdate( );
            if(i>0){
                flag = "true";
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
//            flag=String.valueOf(e);
            if (flag.indexOf("for key 'PRIMARY'")>0){
                flag="该账号存在";
            }
        }
        finally{
            mysqlJdbc.closeResource(state, conn,null);
        }
        return flag;
    }
    public static ArrayList<Login_log> getLogin_logList(){//查询所有登录日志信息
        ArrayList<Login_log> lists=new ArrayList<Login_log>();
        Login_log list=null;
        Connection conn = getConnect();
        PreparedStatement state = null;
        ResultSet rs=null;
        try{
            String sql="select * from 登录日志 order by 时间 desc";
            state = conn.prepareStatement(sql);
            //state.setString(1, title);
            //tate.setString(1, time);
            rs = state.executeQuery();
            while(rs.next()){
                list=new Login_log();
                list.setTime(rs.getString("时间"));
                list.setPhone(rs.getString("账号"));
                list.setName(rs.getString("姓名"));
                list.setIp(rs.getString("IP地址"));
                list.setUser_agent(rs.getString("请求头"));
                lists.add(list);
            }
        }
        catch (Exception e) {
            // TODO: handle exception
			e.printStackTrace();
        }
        finally{
            mysqlJdbc.closeResource(state, conn, rs);
        }
        return lists;
    }
}
