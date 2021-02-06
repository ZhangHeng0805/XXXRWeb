package servlet;

import database.DataBase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DelNoticeServlet")
public class DelNoticeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String phone=request.getParameter("phone");
        String time=request.getParameter("time");
        System.out.println(phone+time);
        DataBase dataBase=new DataBase();
        String s=dataBase.DelNotice(phone,time);
        System.out.println("删除："+phone+":"+s);
        if ("true".equals(s)){
            request.setAttribute("n","true");
            request.setAttribute("phone",phone);
            request.getRequestDispatcher("list_notice.jsp").forward(request,response);
        }else if("false".equals(s)){
            request.setAttribute("n","false");
            request.setAttribute("phone",phone);
            request.getRequestDispatcher("list_notice.jsp").forward(request,response);
        }else {
            request.setAttribute("n","3");
            request.setAttribute("phone",phone);
            request.getRequestDispatcher("list_notice.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
