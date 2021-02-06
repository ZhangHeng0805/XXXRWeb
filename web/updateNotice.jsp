<%@ page import="database.DataBase" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="database.User" %>
<%@ page import="Util.TimeUtil" %>
<%@ page import="Util.zh.ASCII" %>
<%@ page import="database.Notice" %><%--
  Created by IntelliJ IDEA.
  User: 张恒
  Date: 2021/1/19 0019
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>星曦向荣网_修改公告</title>
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
    <script type="text/javascript" src="js/UpdateNotice.js"></script>
    <script type="text/javascript" src="jquery.min.js"></script>
</head>
<body>
<h1>公告表</h1>
<div class="d1">
    <%try {


        request.setCharacterEncoding("utf-8");
        String n= (String) request.getAttribute("n");
        String n1= (String) request.getAttribute("phone");
        String n2= (String) request.getAttribute("time");
        System.out.println(TimeUtil.getSystemTime() +"：修改公告："+n);
        String phone=request.getParameter("phone");
        String oldtime=request.getParameter("time");
        if (n1!=null&&n2!=null){
            phone=n1;
            oldtime=n2;
        }
        System.out.println(phone+oldtime);
        if (phone!=null&&phone.length()==11){
            DataBase dataBase=new DataBase();
            ArrayList<Notice> list=dataBase.getNoticeListByPhoneAndTime(phone,oldtime);
            ArrayList<User> li_user=dataBase.getUserListByPhong(phone);
            ASCII ascii=new ASCII();
            ascii.setpwd(li_user.get(0).getPassword());
            String pwd=ascii.getresuilt(1);

            ASCII ascii2=new ASCII();
            ascii2.setpwd(phone);
            String pho=ascii2.getresuilt(2);
            if (list.size()>0){
                if ("true".equals(n)){%>
    <p>公告修改成功！</p>
    <%--    <a href="index.jsp"><button style="font-size: 35px;height:60px;width: 300px;color: orange">返回登录</button></a>--%>
    <a href="success.jsp?input1=<%=phone%>&&input2=<%=pwd%>"><button style="font-size: 35px;padding: 15px">返 回 主 页</button></a>
    <%
    }else if("false".equals(n)){%>
    <p>公告修改失败！请重新提交修改（不要添加表情）</p><%
}else if ("3".equals(n)){%>
    <p>公告修改错误！请重新提交修改，如果不行，请反馈</p>
    <a href="liuyan.jsp"><button style="font-size: 50px;letter-spacing: 25px;padding: 15px">去留言反馈</button></a>
    <%
        }
    %>
</div>
<div class="d2">
    <form action="UpdateNoticeServlet"name="myForm" method="post" onsubmit="return myFunction()">
        <p>时间：<input type="text"name="time"id="Date"value="<%=TimeUtil.getSystemTime()%>"style="background-color:transparent;border-color: transparent;width: 610px"readonly unselectable="on"></p>
        <div style="display: none"><input name="oldtime" value="<%=oldtime%>"></div>
        <p>账号：<input type="text"name="phone"placeholder="电话号码"value="<%=list.get(0).getPhonenum()%>"style="background-color:transparent;border-color: transparent;width: 610px"readonly unselectable="on"></p>
        <p>姓名：<input type="text"name="name"placeholder="姓名\昵称"value="<%=list.get(0).getName()%>"style="background-color:transparent;border-color: transparent;width: 610px"readonly unselectable="on"></p>
        <p style="color:blue;margin-right: 60px">状态：
            <%if ("1".equals(list.get(0).getState())){%>
            <input type="radio"name="state"value="1"style="zoom:2.5;width: 35px"checked="checked"><label style="margin-right: 100px">公开</label>
            <input type="radio"name="state"value="2"style="zoom:2.5;width: 35px">私密<br>
            <%}else if ("2".equals(list.get(0).getState())){
            %>
            <input type="radio"name="state"value="1"style="zoom:2.5;width: 35px"><label style="margin-right: 100px">公开</label>
            <input type="radio"name="state"value="2"style="zoom:2.5;width: 35px"checked="checked">私密<br>
            <%
            }%>
            <label style="font-size: 25px;color: #ff332e">公开：在公告栏展示，所有人可见/私密：在公告管理中展示，仅本人可见</label>
        </p>
        <div class="d2_2"><label style="">公告标题：</label><br>
            <textarea rows="3" cols="30"name="title"id="title"style="font-size: 50px;width: 90%"placeholder="请输入公告标题"><%=list.get(0).getTitle()%></textarea><br>
        </div>
        <div class="d2_2"><label style="">公告内容：</label><br>
            <textarea rows="20" cols="30"name="content"id="content"style="font-size: 50px;width: 90%"placeholder="请输入公告内容"><%=list.get(0).getContent()%></textarea><br>
        </div>
        <p><input type="submit"value="修 改 公 告"id="btnGo"style="padding: 30px;background: orchid"></p>
    </form><br>
    <a href="success.jsp?input1=<%=phone%>&&input2=<%=pwd%>"><button style="font-size: 45px;padding: 15px;width: 300px">返 回 主 页</button></a>
    <%}else {
    %><jsp:forward page="index.jsp">
    <jsp:param name="n" value="5"/>
</jsp:forward><%
    }}else{
%><jsp:forward page="index.jsp">
    <jsp:param name="n" value="5"/>
</jsp:forward><%
    }}catch (Exception e){
%><jsp:forward page="index.jsp">
    <jsp:param name="n" value="6"/>
</jsp:forward><%
    }%>
</div>
</body>
</html>

