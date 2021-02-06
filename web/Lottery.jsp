<%@ page import="Util.TimeUtil" %><%--
  Created by IntelliJ IDEA.
  User: 张恒
  Date: 2021/1/26 0026
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style type="text/css">
        body{
            background: #9fffe4;
            width: 100%;
        }
        #d1{
            display: block;
            margin: 5% 1% 3% 1%;
            border-radius: 50%;
            height: 300px;
            width: auto;
            font-size: 80px;
            background: #ffc787;

        }
        #l1{
            display: block;
            padding-top: 100px;
            text-align: center;
        }
        #b1{
            height: 100px;
            font-size: 60px;
            background: #00faff;
            padding: auto;
        }
        #d2{

            margin-top: 10%;
            background: #d1ffa0;
        }
        h2{
            text-align: center;
            font-size: 60px;
        }
        #d2_l{
            float: left;
            padding-left: 20px;
            width: 48%;
            text-align: center;
        }
        #d2_l input{
            padding: 10px;
            font-size: 40px;
        }
        #d2_r{
            width: 45%;
            float: right;
            padding-right: 25px;
            text-align: center;
            font-size: 35px;
        }
    </style>
    <title>星曦向荣网抽奖系统</title>
    <%System.out.println(TimeUtil.getSystemTime()+"：抽奖");%>
<%--    <script type="text/javascript"src="js/jquery.min.js"></script>--%>
    <script type="text/javascript"src="js/Lottery.js"></script>
</head>
<body>
<div id="d1">
    <label id="l1">抽奖区</label>
</div>
<center><input id="b1" value="抽         奖"type="button" onclick="run()"></center>
<div id="d2">
    <h2>设置抽奖</h2>
    <div id="d2_l">
        <input type="text"id="val"size="30"placeholder="请输入奖品名称">
        <br><br>
        <input onclick="setlist()"type="submit" value="添加奖品"size="15">
        <label style="font-size: 25px;color: #ff332e">添加多次可以增加几率</label>
        <br><br>
        <input onclick="dellist()"type="button" value="清空奖品"size="15">
        <label style="font-size: 25px;color: #ff332e">刷新页面可以重置奖品</label>
    </div>
    <div id="d2_r"style="background: #ffeec3">
        <label style="color: #14fa4c;font-size: 55px">奖       池</label>
        <p id="show">奖品区</p>
    </div>
</div>
</body>
</html>
