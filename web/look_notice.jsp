<%@ page import="database.HTMLUtil" %>
<%@ page import="database.DataBase" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="database.Notice" %>
<%@ page import="Util.zh.Resuilt" %><%--
  Created by IntelliJ IDEA.
  User: 张恒
  Date: 2021/1/19 0019
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%try {
        request.setCharacterEncoding("utf-8");
    String time=request.getParameter("time");
    String phone=request.getParameter("phone");
        Resuilt resuilt=new Resuilt(2);
        resuilt.setpwd(phone);
        phone=resuilt.getresuilt();
    DataBase dataBase=new DataBase();
    ArrayList<Notice> list=dataBase.getNoticeListByPhoneAndTime(phone,time);
    time=HTMLUtil.delHTMLTag(list.get(0).getTime());
    String name=HTMLUtil.delHTMLTag(list.get(0).getName());
    String title=HTMLUtil.delHTMLTag(list.get(0).getTitle());
    String content=list.get(0).getContent();
    String tit="";
    if (title.length()>9){
        tit=title.substring(0,8)+"...";
    }else {
        tit=title;
    }
    %>
    <title>星曦向荣网《<%=tit%>》</title>
</head>
<body style="background: #eee5d8;width: 100%">
<div style="width: 100%;height: 10%;text-align: center">
<center>
<h1 style="text-align: center;width: 100%;font-size: 60px"><%=title%></h1>
</center>
<div style="float: left;width: 50%;text-align: left"><label style="font-size: 35px;padding-left: 50px">作者：<%=name%></label></div>
<div style="float: right;width: 50%;text-align: right"><label style="font-size: 35px;padding-right: 50px"><%=time%></label></div>
<br>
</div>
<textarea readonly="readonly" style="border: none;font-size: 40px;line-height: 65px;text-indent: 0em;letter-spacing: 1px;width: 100%;height: 90%;background: #eee5d8;padding: 15px; resize:none;"><%=content%></textarea>
<%}catch (Exception e){
        if (String.valueOf(e).indexOf("Index: 0, Size: 0")>0){
%><h1 style="text-align: center;width: 100%;font-size: 50px;color: #ffe767">抱歉，没有找到文章</h1>     <%
        }else {
       %><h1 style="text-align: center;width: 100%;font-size: 50px;color: red">错误：<%=e%></h1>     <%
}}%>
</body>
</html>
