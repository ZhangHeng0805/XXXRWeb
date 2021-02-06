package database;



import java.util.ArrayList;

import static database.mysqlJdbc.getConnect;

public class Test {


    public static void main(String[] args) {
        String s="Mozilla/5.0 (Linux; Android 10; COL-AL10 Build/HUAWEICOL-AL10; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.120 MQQBrowser/6.2 TBS/045511 Mobile Safari/537.36 MMWEBID/7288 MicroMessenger/7.0.22.1820(0x2700163B) Process/tools WeChat/arm64 Weixin NetType/4G Language/zh_CN ABI/arm64";

        System.out.println();
    }
    static String getStr(){
        String s="";
        for (int i=1;i<=10;i++){
            int sum=(int) (Math.random()*10);
            s+=sum;
        }
//        System.out.println(s+"\n"+s.length());
        return s;
    }
    public static String sumit(String phonenum,String name,String pwd){//注册
        User user=new User();
        user.setPhonenum(phonenum);
        user.setUsername(name);
        user.setPassword(pwd);
        DataBase dataBase=new DataBase();
        String f=dataBase.AddUser(user);
        System.out.println("状态:"+f);
        mysqlJdbc mysqlJdbc=new mysqlJdbc();
        System.out.println("连接:"+getConnect());
        System.out.println("name:"+name+"\npwd:"+pwd);
        return f;
    }
    public static void login(String phone){
        DataBase dataBase=new DataBase();
        ArrayList<User> list=dataBase.getUserListByPhong(phone);
        for (User u:list) {
            String uPhone = u.getPhonenum();
            String uName = u.getUsername();
            String uPwd = u.getPassword();
            System.out.println(uPhone+"\n"+uName+"\n"+uPwd);
        }

    }
}
