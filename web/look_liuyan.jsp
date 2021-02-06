<%@ page import="database.DataBase" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="database.MessageForm" %>
<%@ page import="database.HTMLUtil" %>
<%@ page import="Util.TimeUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: 张恒
  Date: 2021/1/18 0018
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言信息</title>
    <style>
        body{
            text-align: center;
            background: #d1ffa0;
        }
        h1{
            color: #72d3ff;
            font-size: 60px;
            letter-spacing: 50px;
            margin-left: 60px;
        }
        .d1{
            text-align: center;
        }
        table tr th{
            padding: 10px;
        }
        table tr td{
            padding: 10px;
        }
        input{
            font-size: 30px;
        }
    </style>
</head>
<body>
<h1>留言清单</h1>

    <form action="look_liuyan.jsp?phone=13733430842"method="post">
        <p style="font-size: 35px">
            时间查询：<input type="text"name="time"placeholder="请输入要查询的时间（模糊查询）"style="width: 610px;padding: 10px">
    <input type="submit"value="查      询"style="height: 60px;font-size: 35px"></p>
</form>

<div class="d1">
<%
    request.setCharacterEncoding("utf-8");
    String time=request.getParameter("time");
    String phone= request.getParameter("phone");
    System.out.println(TimeUtil.getSystemTime()+"：查看留言："+time);
    if (phone!=null){
        if ("13733430842".equals(phone)){
    DataBase dataBase=new DataBase();
            ArrayList<MessageForm> list=null;
            if (time==null||time.length()<1) {
                list = dataBase.getMessageFormList();
%><p style="font-size: 50px">《全部》的留言</p><%
            }else {
                list =dataBase.getMessageFormListByTime(time);
%><p style="font-size: 50px">《<label style="color: springgreen"><%=time%></label>》的留言</p><%
            }
    if (list.size()>0){
%>
<table border="2" cellspacing="0"style="text-align: center;font-size: 25px;width: 100%;">
    <tr>
        <th>时间</th>
        <th>姓名</th>
        <th>联系方式</th>
        <th>留言内容</th>
        <th>备注</th>
    </tr>
    <%for (MessageForm f:list){%>
    <tr>
        <td><%=HTMLUtil.delHTMLTag(f.getTime())%></td>
        <td><%=HTMLUtil.delHTMLTag(f.getName())%></td>
        <td><%=HTMLUtil.delHTMLTag(f.getContact())%></td>v
        <td style="">
<%--            <textarea readonly="readonly" style="border: none;text-indent: 0em;font-size:25px;padding:10px;width:100%;height:100%;background: #d1ffa0;resize:none;">--%>
                <%=HTMLUtil.delHTMLTag(f.getContent())%>
<%--            </textarea>--%>
        </td>
        <td><%=HTMLUtil.delHTMLTag(f.getNote())%></td>
    </tr>
    <%}%>
</table>
    <%}else {%>
    <p style="font-size: 40px;color: lightcoral">很干净，没有留言信息</p>
    <%}}else {
    %><jsp:forward page="index.jsp">
    <jsp:param name="n" value="4"/>
</jsp:forward><%
    }
        }else {
        %><jsp:forward page="index.jsp">
    <jsp:param name="n" value="4"/>
</jsp:forward><%
    }%>
</div>
</body>
</html>
