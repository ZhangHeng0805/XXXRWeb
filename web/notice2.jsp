<%--
  Created by IntelliJ IDEA.
  User: 张恒
  Date: 2021/1/19 0019
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="database.MessageForm" %>
<%@ page import="database.DataBase" %>
<%@ page import="database.Notice" %>
<%@ page import="Util.TimeUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        request.setCharacterEncoding("utf-8");
        String time=request.getParameter("time");
        String phone=request.getParameter("phone");
        String name=request.getParameter("name");
        String title=request.getParameter("title");
        String content=request.getParameter("content");
        String state=request.getParameter("state");
        if(time!=null){
    %>
    <title><%=name%>的公告</title>
    <style>
        body{
            text-align: center;
        }
        h1{
            font-size: 55px;
            color: #00faff;
        }
        .d1{
            font-size: 35px;
        }
    </style>
</head>
<body>
<%
    Notice notice=new Notice();
    notice.setTime(time);
    notice.setPhonenum(phone);
    notice.setName(name);
    notice.setTitle(title);
    notice.setContent(content);
    notice.setState(state);
    DataBase dataBase=new DataBase();
    String f=dataBase.AddNotice(notice);
    System.out.println(TimeUtil.getSystemTime()+"：公告："+f);
    if ("true".equals(f)){
%>
<h1>留言成功</h1>
<div class="d1">
</div>
<jsp:forward page="notice.jsp">
    <jsp:param name="n" value="1"/>
</jsp:forward>
<%}else{%>
<h1>留言失败!</h1>
<jsp:forward page="notice.jsp">
    <jsp:param name="n" value="2"/>
</jsp:forward>
<%
    }%>
<a href="index.jsp"><button style="font-size: 35px;height:60px;width: 300px;color: orange">返回登录</button></a>
<%}else {%>
<jsp:forward page="notice.jsp">
    <jsp:param name="n" value="3"/>
</jsp:forward>
<%
    }%>
</body>
</html>
