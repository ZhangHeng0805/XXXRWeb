package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.Statement;
import java.util.ArrayList;
import static database.mysqlJdbc.getConnect;

/*
* 用户信息表
* */
public class DataBase {
	public String AddUser(User m){//添加用户信息
		Connection conn = getConnect();
		PreparedStatement state = null;
		String flag = "false";
		try {
			String sql = "insert into 用户信息 values(?,?,?,?,?)";
			state =conn.prepareStatement(sql);
			state.setString(1, m.getPhonenum());
			state.setString(2, m.getUsername());
			state.setString(3, m.getPassword());
			state.setString(4, m.getTime());
			state.setString(5, m.getIdentity());
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
	
	
	public ArrayList<User> getUserListByPhong(String phone){//根据账号查询用户
		ArrayList<User> lists=new ArrayList<User>();
		User list=null;
		Connection conn = getConnect();
		PreparedStatement state = null;
		ResultSet rs=null;
		try{
			String sql="select * from 用户信息 where 账号=?";
			state = conn.prepareStatement(sql);
			//state.setString(1, title);
			state.setString(1, phone);
			rs = state.executeQuery();
			while(rs.next()){
				list=new User();
				list.setPhonenum(rs.getString("账号"));
				list.setUsername(rs.getString("姓名"));
				list.setPassword(rs.getString("密码"));
				list.setTime(rs.getString("时间"));
				list.setIdentity(rs.getString("身份"));
				lists.add(list);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
//			e.printStackTrace();
		}
		finally{
			mysqlJdbc.closeResource(state, conn, rs);
		}
		return lists;
	}
	public ArrayList<User> getUserList(){//查询所有用户
		ArrayList<User> lists=new ArrayList<User>();
		User list=null;
		Connection conn = getConnect();
		PreparedStatement state = null;
		ResultSet rs=null;
		try{
			String sql="select * from 用户信息 order by 时间 desc";
			state = conn.prepareStatement(sql);
			rs = state.executeQuery();
			while(rs.next()){
				list=new User();
				list.setPhonenum(rs.getString("账号"));
				list.setUsername(rs.getString("姓名"));
				list.setPassword(rs.getString("密码"));
				list.setTime(rs.getString("时间"));
				list.setIdentity(rs.getString("身份"));
				lists.add(list);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
//			e.printStackTrace();
		}
		finally{
			mysqlJdbc.closeResource(state, conn, rs);
		}
		return lists;
	}
	public String UpdateUser(String phone, User m){//修改用户信息
		Connection conn = getConnect();
		PreparedStatement state = null;
		String flag = "false";
		try {
			String sql = "update 用户信息 set 姓名=? , 密码=? , 时间=? where 账号=?";
			state =conn.prepareStatement(sql);
			state.setString(1, m.getUsername());
			state.setString(2, m.getPassword());
			state.setString(3, m.getTime());
			state.setString(4, phone);
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

	/*
	*留言表
	* */
	public String AddMessageForm(MessageForm m){//添加留言信息
		Connection conn = getConnect();
		PreparedStatement state = null;
		String flag = "false";
		try {
			String sql = "insert into 留言表 values(?,?,?,?,?)";
			state =conn.prepareStatement(sql);
			state.setString(1, m.getTime());
			state.setString(2, m.getName());
			state.setString(3, m.getContact());
			state.setString(4,m.getContent());
			state.setString(5,m.getNote());
			int i = state.executeUpdate( );
			if(i>0){
				flag = "true";
			}
		} catch (Exception e) {
			// TODO: handle exception
//			e.printStackTrace();
			flag=String.valueOf(e);
			if (flag.indexOf("for key 'PRIMARY'")>0){
				flag="主键重复";
			}
		}
		finally{
			mysqlJdbc.closeResource(state, conn,null);
		}
		return flag;
	}
	public ArrayList<MessageForm> getMessageFormList(){//查询所有留言信息
		ArrayList<MessageForm> lists=new ArrayList<MessageForm>();
		MessageForm list=null;
		Connection conn = getConnect();
		PreparedStatement state = null;
		ResultSet rs=null;
		try{
			String sql="select * from 留言表 order by 时间 desc";
			state = conn.prepareStatement(sql);
			//state.setString(1, title);
//			state.setString(1, phone);
			rs = state.executeQuery();
			while(rs.next()){
				list=new MessageForm();
				list.setTime(rs.getString("时间"));
				list.setName(rs.getString("姓名"));
				list.setContact(rs.getString("联系方式"));
				list.setContent(rs.getString("留言内容"));
				list.setNote(rs.getString("备注"));
				lists.add(list);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
//			e.printStackTrace();
		}
		finally{
			mysqlJdbc.closeResource(state, conn, rs);
		}
		return lists;
	}
	public ArrayList<MessageForm> getMessageFormListByTime(String time){//根据时间模糊查询留言信息
		ArrayList<MessageForm> lists=new ArrayList<MessageForm>();
		MessageForm list=null;
		Connection conn = getConnect();
		PreparedStatement state = null;
		ResultSet rs=null;
		try{
			String sql="select * from 留言表 where 时间 like ? order by 时间 desc";
			state = conn.prepareStatement(sql);
			//state.setString(1, title);
			state.setString(1, "%"+time+"%");
			rs = state.executeQuery();
			while(rs.next()){
				list=new MessageForm();
				list.setTime(rs.getString("时间"));
				list.setName(rs.getString("姓名"));
				list.setContact(rs.getString("联系方式"));
				list.setContent(rs.getString("留言内容"));
				list.setNote(rs.getString("备注"));
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

	/*
	* 公告表
	* */
	public String AddNotice(Notice m){//添加公告信息
		Connection conn = getConnect();
		PreparedStatement state = null;
		String flag = "false";
		try {
			String sql = "insert into 公告表 values(?,?,?,?,?,?)";
			state =conn.prepareStatement(sql);
			state.setString(1, m.getTime());
			state.setString(2, m.getPhonenum());
			state.setString(3, m.getName());
			state.setString(4, m.getTitle());
			state.setString(5,m.getContent());
			state.setString(6,m.getState());
			int i = state.executeUpdate( );
			if(i>0){
				flag = "true";
			}
		} catch (Exception e) {
			// TODO: handle exception
//			e.printStackTrace();
			flag=String.valueOf(e);
			if (flag.indexOf("for key 'PRIMARY'")>0){
				flag="主键重复";
			}
		}
		finally{
			mysqlJdbc.closeResource(state, conn,null);
		}
		return flag;
	}
	public ArrayList<Notice> getNoticeListByPhoneAndTime(String phonenum, String time){//根据账号和(模糊)时间查询公告
		ArrayList<Notice> lists=new ArrayList<Notice>();
		Notice list=null;
		Connection conn = getConnect();
		PreparedStatement state = null;
		ResultSet rs=null;
		try{
			String sql="select * from 公告表 where 时间 like ? and 账号=? order by 时间 desc";
			state = conn.prepareStatement(sql);
			//state.setString(1, title);
			state.setString(1, "%"+time+"%");
			state.setString(2, phonenum);
			rs = state.executeQuery();
			while(rs.next()){
				list=new Notice();
				list.setTime(rs.getString("时间"));
				list.setPhonenum(rs.getString("账号"));
				list.setName(rs.getString("姓名"));
				list.setTitle(rs.getString("标题"));
				list.setContent(rs.getString("内容"));
				list.setState(rs.getString("状态"));
				lists.add(list);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
//			e.printStackTrace();
		}
		finally{
			mysqlJdbc.closeResource(state, conn, rs);
		}
		return lists;
	}
    public ArrayList<Notice> getNoticeListByPhone(String phonenum){//根据账号公告
        ArrayList<Notice> lists=new ArrayList<Notice>();
        Notice list=null;
        Connection conn = getConnect();
        PreparedStatement state = null;
        ResultSet rs=null;
        try{
            String sql="select * from 公告表 where 账号=? order by 时间 desc";
            state = conn.prepareStatement(sql);
            state.setString(1, phonenum);
            rs = state.executeQuery();
            while(rs.next()){
                list=new Notice();
                list.setTime(rs.getString("时间"));
                list.setPhonenum(rs.getString("账号"));
                list.setName(rs.getString("姓名"));
                list.setTitle(rs.getString("标题"));
                list.setContent(rs.getString("内容"));
                list.setState(rs.getString("状态"));
                lists.add(list);
            }
        }
        catch (Exception e) {
            // TODO: handle exception
//            e.printStackTrace();
        }
        finally{
            mysqlJdbc.closeResource(state, conn, rs);
        }
        return lists;
    }
	public ArrayList<Notice> getNoticeList(){//查询所有公告
		ArrayList<Notice> lists=new ArrayList<Notice>();
		Notice list=null;
		Connection conn = getConnect();
		PreparedStatement state = null;
		ResultSet rs=null;
		try{
			String sql="select * from 公告表 order by 时间 desc";
			state = conn.prepareStatement(sql);
			//state.setString(1, title);
            //tate.setString(1, time);
			rs = state.executeQuery();
			while(rs.next()){
				list=new Notice();
				list.setPhonenum(rs.getString("账号"));
				list.setTime(rs.getString("时间"));
				list.setName(rs.getString("姓名"));
				list.setTitle(rs.getString("标题"));
				list.setContent(rs.getString("内容"));
				list.setState(rs.getString("状态"));
				lists.add(list);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
//			e.printStackTrace();
		}
		finally{
			mysqlJdbc.closeResource(state, conn, rs);
		}
		return lists;
	}
    public String DelNotice(String phone,String time){//删除公告信息
        Connection conn = getConnect();
        PreparedStatement state = null;
        String flag = "false";
        try {
            String sql = "delete from 公告表 where 账号=? and 时间=?";
            state =conn.prepareStatement(sql);
            state.setString(1, phone);
            state.setString(2, time);
            int i = state.executeUpdate( );
            if(i>0){
                flag = "true";
            }
        } catch (Exception e) {
            // TODO: handle exception
//			e.printStackTrace();
            flag=String.valueOf(e);
            if (flag.indexOf("for key 'PRIMARY'")>0){
                flag="主键重复";
            }
        }
        finally{
            mysqlJdbc.closeResource(state, conn,null);
        }
        return flag;
    }
    public String UpdateNotice(String time, Notice n){//修改用户信息
        Connection conn = getConnect();
        PreparedStatement state = null;
        String flag = "false";
        try {
            String sql = "update 公告表 set 时间=? , 标题=? , 内容=? , 状态=? where 账号=? and 时间=?";
            state =conn.prepareStatement(sql);
			state.setString(1, n.getTime());
            state.setString(2, n.getTitle());
            state.setString(3, n.getContent());
            state.setString(4, n.getState());
            state.setString(5, n.getPhonenum());
            state.setString(6, time);
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
	
}
