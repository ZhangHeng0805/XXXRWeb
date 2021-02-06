package servlet;

import Util.CusAccessObjectUtil;
import Util.TimeUtil;
import Object.*;
import database.DataBase;
import database.DataBase2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "AdressServlet")
public class AdressServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ip=CusAccessObjectUtil.getIpAddress(request);
        String ua=CusAccessObjectUtil.getUser_Agent(request);
        Access access=new Access();
        access.setTime(TimeUtil.getSystemTime());
        access.setIp(ip);
        access.setUser_agent(ua);
        String f=DataBase2.AddAccess(access);
        System.out.println(TimeUtil.getSystemTime()+"/"+ip);
        System.out.println(ua);
        if ("true".equals(f)){
            System.out.println("访问日志成功");
        }else if ("false".equals(f)){
            System.out.println("访问日志失败");
        }else {
            System.out.println("访问日志错误");
        }
//        CusAccessObjectUtil.printAdress(request);
        request.getRequestDispatcher("index.jsp").forward(request,response);

    }
}
