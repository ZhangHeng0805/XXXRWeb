<%@ page import="database.MessageForm" %>
<%@ page import="database.DataBase" %><%--
  Created by IntelliJ IDEA.
  User: 张恒
  Date: 2021/1/18 0018
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        request.setCharacterEncoding("utf-8");
        String time=request.getParameter("time");
        String name=request.getParameter("name");
        String contact=request.getParameter("contact");
        String content=request.getParameter("content");
        String note=request.getParameter("note");
        if(time!=null){
        if(note.length()<1){
            note="\"空\"";
        }
    %>
    <title><%=name%>的留言</title>
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
    MessageForm messageForm=new MessageForm();
    messageForm.setTime(time);
    messageForm.setName(name);
    messageForm.setContact(contact);
    messageForm.setContent(content);
    messageForm.setNote(note);
    DataBase dataBase=new DataBase();
    String f=dataBase.AddMessageForm(messageForm);
    System.out.println("留言："+f);
    if ("true".equals(f)){
%>
<h1>留言成功</h1>
<div class="d1">
<p>时间：<%=time%></p>
<p>姓名：<%=name%></p>
<p>联系方式：<%=contact%></p>
<p>留言内容：<%=content%></p>
<p>备注：<%=note%></p>
</div>
<jsp:forward page="liuyan.jsp">
    <jsp:param name="n" value="1"/>
</jsp:forward>
<%}else{%>
<h1>留言失败!</h1>
<jsp:forward page="liuyan.jsp">
    <jsp:param name="n" value="2"/>
</jsp:forward>
<%
}%>
<a href="index.jsp"><button style="font-size: 35px;height:60px;width: 300px;color: orange">返回登录</button></a>
<%}else {%>
<jsp:forward page="liuyan.jsp">
    <jsp:param name="n" value="3"/>
</jsp:forward>
<%
}
        %>
</body>
</html>
