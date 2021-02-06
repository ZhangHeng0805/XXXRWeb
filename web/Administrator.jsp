<%@ page import="database.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Object.*" %>
<%@ page import="Util.TimeUtil" %>
<%--
  Created by IntelliJ IDEA.
  User: 张恒
  Date: 2021/1/25 0025
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>星曦向荣网_管理员</title>
    <style>
        body{
            background: #e2fff8;
        }
        *{
            padding:0;
            margin:0;
            font-family:"微软雅黑";
            text-align: center;
            font-size:20px;}
        #tabs{
            width:100%;
            height:100%;
            margin:20px auto;}
        #tabs ul{
            list-style:none;
            height:80px;
            }
        #tabs ul li{

            float:left;
            width:30%;
            height:80px;
            font-size: 50px;
            text-align:center;
            border:3px solid #fff500;
            padding-top: 18px;
            margin-left:1.5%;
            border-bottom:none;
            display:inline-block;}
        #tabs ul li.on{
            border-top:3px solid red;
            border-bottom:2px solid rgba(121, 128, 119, 0.53);
            background: #ffc787;
        }
        #tabs div{
            text-align: center;
            width:100%;
            height:auto;
            line-height:30px;
            border:1px solid #ccc;
            clear:both;
            border-top:3px solid red;
            padding-top: 30px;
            }
        .hide{display:none;}
        table tr td{
            padding: 10px;
        }
        table tr th{
            padding: 10px;
        }
    </style>
    <script type="text/javascript">
        window.onload = function(){
            var a = document.getElementById("tabs");
            var b = document.getElementsByTagName("li");
            var c = a.getElementsByTagName("div");
            for (i=0;i<b.length;i++){
                b[i].index = i;
                b[i].onmouseover = function(){
                    for(n=0;n<b.length;n++){
                        b[n].className = "";
                        c[n].className = "hide";
                    }
                    this.className = "on";
                    c[this.index].className = "";
                }
            }
        }
    </script>
</head>
<%System.out.println(TimeUtil.getSystemTime()+"：管理员界面");%>
<body>
<%try {
    DataBase db=new DataBase();
    ArrayList<Access> list_a=DataBase2.getAccessList();
    ArrayList<Login_log> list_l=DataBase2.getLogin_logList();
    ArrayList<User> list_u=db.getUserList();
    ArrayList<Notice> list_n=db.getNoticeList();
    ArrayList<MessageForm> list_m=db.getMessageFormList();
    if (list_a.size()>0&&list_l.size()>0){
%>
<div id="tabs" >
    <ul id="b">
        <li class="on">所有数据</li>
        <li>访问数据</li>
        <li>登录数据</li>
    </ul>
    <div id="div">
        <table border="2" cellspacing="0"style="text-align: center;font-size: 35px;width: 100%;">
            <tr>
                <th>数据名称</th>
                <th>起始时间</th>
                <th>截止时间</th>
                <th>数据量</th>
            </tr>
            <tr>
                <td>网站<label style="color: red">访问</label>次数</td>
                <td><%=list_a.get(list_a.size()-1).getTime()%></td>
                <td><%=list_a.get(0).getTime()%></td>
                <td><%=list_a.size()%>次</td>
            </tr>
            <tr>
                <td>网站<label style="color: red">登录</label>次数</td>
                <td><%=list_l.get(list_l.size()-1).getTime()%></td>
                <td><%=list_l.get(0).getTime()%></td>
                <td><%=list_l.size()%>次</td>
            </tr>
            <tr>
                <td>网站<label style="color: red">用户</label>数量</td>
                <td><%=list_u.get(list_u.size()-1).getTime()%></td>
                <td><%=list_u.get(0).getTime()%></td>
                <td><%=list_u.size()%>人</td>
            </tr>
            <tr>
                <td>发布<label style="color: red">公告</label>次数</td>
                <td><%=list_n.get(list_n.size()-1).getTime()%></td>
                <td><%=list_n.get(0).getTime()%></td>
                <td><%=list_n.size()%>次</td>
            </tr>
            <tr>
                <td>网站<label style="color: red">留言</label>次数</td>
                <td><%=list_m.get(list_m.size()-1).getTime()%></td>
                <td><%=list_m.get(0).getTime()%></td>
                <td><%=list_m.size()%>次</td>
            </tr>

        </table>
    </div>
    <div class="hide">
       访问数据
    </div>
    <div class="hide">
        登录数据
    </div>
</div>
<%}else {
%><h1>暂无数据</h1><%
}
    }catch (Exception e){
    %><h1 style="color: red">错误：<%=e%></h1><%
    }
%>
</body>
</html>
