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
        @WebServlet(description = "Servlet", urlPatterns = { "/Servlet" })
        public class Servlet extends HttpServlet {
            private static final long serialVersionUID = 1L;

            /**
             * @see HttpServlet#HttpServlet()
             */
            public Servlet() {
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
                String code=request.getParameter("code");
                Main main=new Main();
                PrintWriter pw=response.getWriter();
//                System.out.println(main.getCode()+"\n="+code);
                if (main.getCode()==code) {
                    pw.write("success");
                }else {
                    pw.write("err");
                }

                pw.close();
            }

        }


