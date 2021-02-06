<%@ page import="Util.TimeUtil" %><%--
  Created by IntelliJ IDEA.
  User: 张恒
  Date: 2021/1/18 0018
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>星曦向荣网_留言反馈</title>
    <link  rel="stylesheet" type="text/css"href="css/liuyan.css">
    <script type="text/javascript" src="js/liuyan.js"></script>
</head>
<body>
<h1>留言表</h1>
<div class="d1">
<%
String n=request.getParameter("n");
    System.out.println(TimeUtil.getSystemTime() +"：留言："+n);
if ("1".equals(n)){%>
    <p>留言成功！</p>
    <a href="index.jsp"><button style="font-size: 35px;height:60px;width: 300px;color: orange">返回登录</button></a>
    <%
}else if("2".equals(n)){%>
    <p>留言失败！请重新留言（不要添加表情）</p><%
}else if ("3".equals(n)){%>
    <p>留言失败！请重新留言</p>
    <%
}
%>
</div>
<div class="d2">
    <form action="liuyan2.jsp"name="myForm" method="post" onsubmit="return myFunction()">
        <p>时间：<input type="text"name="time"id="Date"value="<%=TimeUtil.getSystemTime()%>"readonly unselectable="on"style="background-color:transparent;border-color: transparent;width: 610px"></p>
        <p>姓名：<input type="text"name="name"placeholder="姓名\昵称"></p>
        <div class="d2_2"><label style="">联系方式：</label><br>
            <textarea rows="3" cols="30"name="contact"style="font-size: 50px;width: 90%"placeholder="微信号\QQ号\电话号码\邮箱号码"></textarea><br>
        </div>
        <div class="d2_2"><label style="">留言内容：</label><br>
            <textarea rows="10" cols="30"name="content"style="font-size: 50px;width: 90%"placeholder="请留言"wrap="hard"></textarea><br>
        </div>
        <div class="d2_2"><label style="">备注：</label><br>
            <textarea rows="2" cols="30"name="note"style="font-size: 50px;width: 90%"placeholder="选填"></textarea><br>
        </div>
        <p><input type="submit"value="提 交 留 言"id="btnGo"style="padding: 30px"></p>
    </form>
    <label style="font-size: 50px">点击
        <a target="_blank" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=wriqo6ylqqespezy_vL3grOz7KGtrw" style="text-decoration:none;">
            <img src="http://rescdn.qqmail.com/zh_CN/htmledition/images/function/qm_open/ico_mailme_12.png"style="height: 45px"/>
        </a>可通过QQ邮箱直接联系我</label>
</div>
</body>
</html>
