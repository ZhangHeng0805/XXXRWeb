<%@ page import="database.DataBase" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="database.User" %>
<%@ page import="Util.TimeUtil" %>
<%@ page import="Util.zh.ASCII" %><%--
  Created by IntelliJ IDEA.
  User: 张恒
  Date: 2021/1/19 0019
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>星曦向荣网_公告栏</title>
    <style>
        body{
            height: 100%;
            width: 100%;
            text-align: center;
            background: #ffc787;
        }
        h1{
            font-family: 楷体;
            font-size: 110px;
            letter-spacing: 50px;
            margin-left: 40px;
        }
        form p{
            font-size: 50px;
        }
        form input{
            font-size: 50px;
            width: 600px;
            padding: 10px;
            border-radius: 15px
        }
        .d1{
            color: red;
            font-size: 35px;
        }
        .d2{
            text-align: center;
        }
        .d2_2{
            font-size: 50px;
        }
    </style>
    <script type="text/javascript" src="js/notice.js"></script>
</head>
<body>
<h1>公告表</h1>
<div class="d1">
    <%
        String n=request.getParameter("n");
        System.out.println(TimeUtil.getSystemTime() +"：公告："+n);
        String phone=request.getParameter("phone");
        if (phone!=null&&phone.length()==11){
            DataBase dataBase=new DataBase();
            ArrayList<User> list=dataBase.getUserListByPhong(phone);
            ASCII ascii=new ASCII();
            ascii.setpwd(list.get(0).getPassword());
            String pwd=ascii.getresuilt(1);
            if (list.size()>0){
        if ("1".equals(n)){%>
    <p>公告发布成功！</p>
<%--    <a href="index.jsp"><button style="font-size: 35px;height:60px;width: 300px;color: orange">返回登录</button></a>--%>
    <a href="success.jsp?input1=<%=phone%>&&input2=<%=pwd%>"><button style="font-size: 35px;padding: 15px">返 回 主 页</button></a>
    <%
    }else if("2".equals(n)){%>
    <p>公告发布失败！请重新提交（不要添加表情）</p><%
}else if ("3".equals(n)){%>
    <p>公告发布失败！请重新提交</p>
    <%
        }
    %>
</div>
<div class="d2">
    <form action="notice2.jsp"name="myForm" method="post" onsubmit="return myFunction()">
        <p>时间：<input type="text"name="time"id="Date"value="<%=TimeUtil.getSystemTime()%>"style="background-color:transparent;border-color: transparent;width: 610px"readonly unselectable="on"></p>
        <p>账号：<input type="text"name="phone"placeholder="电话号码"value="<%=list.get(0).getPhonenum()%>"style="background-color:transparent;border-color: transparent;width: 610px"readonly unselectable="on"></p>
        <p>姓名：<input type="text"name="name"placeholder="姓名\昵称"value="<%=list.get(0).getUsername()%>"style="background-color:transparent;border-color: transparent;width: 610px"readonly unselectable="on"></p>
        <p style="color:blue;margin-right: 60px">状态：
            <input type="radio"name="state"value="1"style="zoom:2.5;width: 35px"><label style="margin-right: 100px">公开</label>
            <input type="radio"name="state"value="2"style="zoom:2.5;width: 35px">私密<br>
            <label style="font-size: 25px;color: #ff332e">公开：在公告栏展示，所有人可见/私密：在公告管理中展示，仅本人可见</label>
            </p>
        <div class="d2_2"><label style="">公告标题：</label><br>
            <textarea rows="3" cols="30"name="title"style="font-size: 50px;width: 90%"placeholder="请输入公告标题"></textarea><br>
        </div>
        <div class="d2_2"><label style="">公告内容：</label><br>
            <textarea rows="10" cols="30"name="content"style="font-size: 50px;width: 90%"placeholder="请输入公告内容"wrap="hard"></textarea><br>
        </div>
        <p><input type="submit"value="发 布 公 告"id="btnGo"style="padding: 30px"></p>
    </form>
    <%}else {
    %><jsp:forward page="index.jsp">
    <jsp:param name="n" value="5"/>
</jsp:forward><%
    }}else{
            %><jsp:forward page="index.jsp">
    <jsp:param name="n" value="5"/>
</jsp:forward><%
    }%>
</div>
</body>
</html>

