package servlet;

import message.Main;
import message.Message;
import message.math;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(description = "LoginServlet", urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String phone_num=request.getParameter("phone_num");
		String i=math.radom(6);
		Main main=new Main();
		main.setCode(i);
		//Message message=new Message(phone_num,i);
		//String str=message.Main();
		String str="成功";


		PrintWriter pw=response.getWriter();
		pw.write("账号："+username+"\n密码："+password+"\n号码："+phone_num+"\n情况："+str+"\n验证码："+i);
//		pw.write("账号："+username+"\n密码："+password);
		pw.close();
//	if (username=="123"&&password=="123") {
//		pw.write(1);
//	}
//		else {
//			pw.write(2);
//		}
	}

}
