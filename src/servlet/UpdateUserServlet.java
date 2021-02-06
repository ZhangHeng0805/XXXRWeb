package servlet;

import database.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String time=request.getParameter("time");
        String phone=request.getParameter("phone");
        String name=request.getParameter("name");
        String pwd=request.getParameter("pwd1");
        User u=new User();
        u.setTime(time);
        u.setUsername(name);
        u.setPassword(pwd);
        DataBase dataBase=new DataBase();
        String s=dataBase.UpdateUser(phone,u);
        System.out.println("修改账号："+s);
        if ("true".equals(s)){
            request.setAttribute("n","true");
            request.getRequestDispatcher("updateUser.jsp").forward(request,response);
        }else {
            request.setAttribute("n","false");
            request.getRequestDispatcher("updateUser.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doPost(request,response);
    }
}
