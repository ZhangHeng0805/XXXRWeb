package servlet;

import database.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ZhuCeServlet")
public class ZhuCeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String name=request.getParameter("input1");
        String pwd=request.getParameter("input2");
        User u=new User();
        u.setUsername(name);
        u.setPassword(pwd);
        DataBase db=new DataBase();
        if(db.AddUser(u).equals("true")){
            request.setAttribute("resuilt","true");
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }else{
            request.setAttribute("resuilt","false");
            request.getRequestDispatcher("zhuce.jsp").forward(request,response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
