package servlet;

import message.Message;
import message.math;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "MessageServlet")
public class MessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        String s = request.getParameter("phone");
        Message m = new Message(s, math.radom(6));
        System.out.println(s + "\n" + m.getNumcode());
        String resuilt=m.Main();
        System.out.println("r"+resuilt);
        PrintWriter pw = response.getWriter();
        if ("发送成功".equals(resuilt)) {
            pw.write(s + "\n" + m.getNumcode());
        }else {
            pw.write(resuilt);
        }
        pw.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
