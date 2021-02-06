<%@ page import="Util.TimeUtil" %>
<%@ page import="Util.zh.ASCII" %>
<%@ page import="Util.zh.Resuilt" %>
<%@ page import="database.*" %>
<%@ page import="Object.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Util.CusAccessObjectUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: 张恒
  Date: 2020/12/12 0012
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/succsee.css"/>
    <%try {
        request.setCharacterEncoding("utf-8");
        String phone=request.getParameter("input1");
        String pwd=request.getParameter("input2");
        boolean falg=true;
        if (pwd.indexOf(" ")>1){
            Resuilt resuilt=new Resuilt(1);
            resuilt.setpwd(pwd);
            pwd=resuilt.getresuilt();
            falg=false;
        }
        DataBase dataBase=new DataBase();
        ArrayList<User> list=dataBase.getUserListByPhong(phone);
        if (list.size()>0){
            if (list.get(0).getPassword().equals(pwd)){
                if (falg) {
                    System.out.println(TimeUtil.getSystemTime() + "：登录成功:" + phone);
                    Login_log login = new Login_log();
                    login.setTime(TimeUtil.getSystemTime());
                    login.setPhone(list.get(0).getPhonenum());
                    login.setName(list.get(0).getUsername());
                    login.setIp(CusAccessObjectUtil.getIpAddress(request));
                    login.setUser_agent(CusAccessObjectUtil.getUser_Agent(request));
                    String f = DataBase2.AddLogin_log(login);
                    if ("true".equals(f)) {
                        System.out.println("登录日志成功");
                    } else if ("false".equals(f)) {
                        System.out.println("登录日志失败");
                    } else {
                        System.out.println("登录日志错误");
                    }
                }
    %>
    <title>星曦向荣网_<%=list.get(0).getUsername()%>主页</title>
</head>
<body>
<div class="header">
    <label style="padding: 20px;font-size: 50px"><%=list.get(0).getUsername()%>的主页</label>
</div>
<div class="menu">
    <ul>
        <%
            ASCII ascii=new ASCII();
            ascii.setpwd(pwd);
            String Pwd=ascii.getresuilt(3);
            ASCII ascii2=new ASCII();
            ascii2.setpwd(phone);
            String ph=ascii2.getresuilt(2);
        %>
        <a href="updateUser.jsp?phone=<%=list.get(0).getPhonenum()%>&&pwd=<%=Pwd%>"><li class="a">修改账户</li></a>
        <a href="list_notice.jsp?phone=<%=ph%>"><li class="b">公告管理</li></a>
        <a href="notice.jsp?phone=<%=list.get(0).getPhonenum()%>"><li class="c">发布公告</li></a>
        <%
        if (list.get(0).getPhonenum().equals("13733430842")){
        %><a href="look_liuyan.jsp?phone=<%=list.get(0).getPhonenum()%>"><li class="d">查看留言</li></a><%
        }else {
            %><a href="https://www.ip138.com/"><li class="d">功能四</li></a><%
        }
        %>
        <a href="ExitServlet"><li class="e"><b>退出登录</b></li></a>
    </ul>
</div>
<div style="width:100%;font-size: 50px;font-style:italic;background: #ffc787;text-align: center">
    <div style="padding: 20px"><label>《公告栏》</label></div>
</div>
    <%
    ArrayList<Notice> notices=dataBase.getNoticeList();
    if (notices.size()<1){
    %><div class="list_title" style="text-align: center;width:100%;color: #ff332e;font-size: 50px"><p>暂无公告！</p></div></div><%
    }else {
for (Notice n:notices){
    String title=HTMLUtil.delHTMLTag(n.getTitle());
    String content=HTMLUtil.delHTMLTag(n.getContent());
    ASCII ascii1=new ASCII();
    ascii1.setpwd(n.getPhonenum());
    String phone_n= ascii1.getresuilt(2);
    content=content.replace("'","\"");
    if (title.length()>18){
        title=title.substring(0,18)+"...";
    }
    if ("1".equals(n.getState())){
%>
<a  target="_blank"style="text-decoration: none"href='look_notice.jsp?time=<%=n.getTime()%>&&phone=<%=phone_n%>' >
    <div class="List"style="width: 100%;height:150px;background: antiquewhite;margin-bottom: 15px">
    <div class="list_title" style="font-size: 45px; color: #000000;width: 100%;padding-top:25px;margin-bottom: 10px;text-align: left"><label style="margin-left: 50px"><%=title%></label></div>
    <div class="list_left"style="float: left;width: 50%;font-size: 25px;"><label style="margin-left: 50px"><%=n.getTime()%></label></div>
    <div class="list_right"style="float: right;width: 50%;font-size: 25px;text-align: right"><label style="margin-right: 100px;"><%=HTMLUtil.delHTMLTag(n.getName())%></label></div>
    </div>
</a>
<%}else {

    }
}}%>
    <%}else {System.out.println("密码错误");%>
    <jsp:forward page="index.jsp">
        <jsp:param name="n" value="2"/>
    </jsp:forward>
    <%}}else {
                System.out.println("账号错误");
            %>
    <jsp:forward page="index.jsp">
        <jsp:param name="n" value="1"/>
    </jsp:forward>
    <%}
   %><%}catch (Exception e){
//e.printStackTrace();
        System.out.println("登录错误");
%>
    <jsp:forward page="index.jsp">
        <jsp:param name="n" value="3"/>
    </jsp:forward>
    <%
    }%>
</body>
</html>
