package servlet;

import database.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateNoticeServlet")
public class UpdateNoticeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String time=request.getParameter("time");
        String oldtime=request.getParameter("oldtime");
        String phone=request.getParameter("phone");
        String name=request.getParameter("name");
        String title=request.getParameter("title");
        String content=request.getParameter("content");
        String state=request.getParameter("state");
        Notice notice=new Notice();
        notice.setTime(time);
        notice.setPhonenum(phone);
        notice.setName(name);
        notice.setTitle(title);
        notice.setContent(content);
        notice.setState(state);
        DataBase dataBase=new DataBase();
        String s=dataBase.UpdateNotice(oldtime,notice);
        System.out.println("修改公告："+s);
        if ("true".equals(s)){
            request.setAttribute("n","true");
            request.setAttribute("phone",phone);
            request.setAttribute("time",time);
            request.getRequestDispatcher("updateNotice.jsp").forward(request,response);
        }else if("false".equals(s)){
            request.setAttribute("n","false");
            request.setAttribute("phone",phone);
            request.setAttribute("time",time);
            request.getRequestDispatcher("updateNotice.jsp").forward(request,response);
        }else {
            request.setAttribute("n","3");
            request.setAttribute("phone",phone);
            request.setAttribute("time",time);
            request.getRequestDispatcher("updateNotice.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
