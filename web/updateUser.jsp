<%@ page import="database.DataBase" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="database.User" %>
<%@ page import="Util.TimeUtil" %>
<%@ page import="Util.zh.Resuilt" %><%--
  Created by IntelliJ IDEA.
  User: 张恒
  Date: 2021/1/19 0019
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>星曦向荣网_用户资料修改</title>
    <script type="text/javascript">
        function login() {
            var t=5;
            var i;
            var login=document.getElementById("btnGo");
            login.disabled="disabled";
            function run() {
                if (t>0) {
                    login.value=t+"秒后可操作";
                    t--;
                }else {
                    login.disabled="";
                    clearInterval(i);
                    login.value="提 交 修 改";
                }
            }
            i=setInterval(run,1000);
        }
        function myFunction() {
            login();
            var time=document.forms["myForm"]["time"].value;
            var phone=document.forms["myForm"]["phone"].value;
            var name=document.forms["myForm"]["name"].value;
            var pwd1=document.forms["myForm"]["pwd1"].value;
            var pwd2=document.forms["myForm"]["pwd2"].value;

            if (time.length>0&&name.length>0&&phone.length>0&&pwd1.length>0&&pwd2.length>0){
                if (time.length < 21) {
                    if (phone.length == 11) {
                        if (name.length < 21) {
                            if (pwd1==pwd2) {
                                if (pwd1.length < 19) {
                                    if (pwd2.length>5) {
                                        alert('时间：'+time + '\n账号：' + phone + '\n姓名：' + name + '\n新密码：' + pwd1+'\n状态：信息提交中...');
                                        return true;
                                    }else{
                                        alert("密码长度限制（6~18位）");
                                        return false;
                                    }
                                } else {
                                    alert("密码长度超过限制（18位）");
                                    return false;
                                }
                            } else {
                                alert("两次密码不一致");
                                return false;
                            }
                        } else {
                            alert("姓名长度超过限制（20位）");
                            return false;
                        }
                    } else {
                        alert("账号为11位电话号码");
                        return false;
                    }
                }else {
                    alert("时间长度超过限制（20位）");
                    return false;
                }
            } else {
                alert("输入框不能为空");
                return false;
            }
        }
        setInterval(function(){
            var date = new Date();
            var year = date.getFullYear();    //获取当前年份
            var mon = date.getMonth()+1;      //获取当前月份   js从0开始取
            var da = date.getDate();          //获取当前日
            var day = date.getDay();          //获取当前星期几
            var h = date.getHours();          //获取小时
            var m = date.getMinutes();        //获取分钟
            var s = date.getSeconds();        //获取秒
            monthText = mon < 10 ? "0" + mon : mon
            daText = da < 10 ? "0" + da : da;
            hoursText = h < 10 ? "0" + h : h;
            minutesText = m < 10 ? "0" + m : m;
            secondText = s < 10 ? "0" + s : s;
            var d = document.getElementById("Date");
            d.value=year+'年'+monthText+'月'+daText+'日'+' '+hoursText+':'+minutesText+':'+secondText;
            //d.value=date.toLocaleString()+' 星期' + '日一二三四五六'.charAt(day);
        },1000);

        // var GoSecond=6;
        // var LastSecond;
        // function TimeDown(){
        //     var aaa=document.getElementById("btnGo");
        //     if(aaa){
        //         if(GoSecond==0){
        //             aaa.disabled="";
        //             aaa.value="提 交 修 改";
        //         }
        //         else{
        //             aaa.value=GoSecond+"秒后可提交";
        //             GoSecond--;
        //             aaa.disabled="disabled"
        //         }
        //     }
        // }
        // LastSecond=setInterval("TimeDown()",1000);//每隔1秒刷新时间
    </script>
    <style>
        body{
            width: 100%;
            height: 100%;
            background: #74fff5;
            text-align: center;
        }
        form input{
            font-size: 50px;
            padding: 10px;
            border-radius: 15px
        }
        p label{
            color: red;
        }
        .n{
            color: red;
            padding: 25px;
            font-size: 50px;
        }
    </style>
</head>
<body>
<%
    try {
    String n= (String) request.getAttribute("n");
    if ("true".equals(n)){
%>
<p class="n">修改信息成功</p>
<a href="index.jsp?n=7"><button style="font-size: 50px;letter-spacing: 25px;padding: 15px">重新登录</button></a>
<%
}else if ("false".equals(n)){
%>
<p class="n">修改信息失败，请重试，或留言联系</p>
<a href="liuyan.jsp"><button style="font-size: 50px;letter-spacing: 25px;padding: 15px">去留言反馈</button></a>
<%}else {

String phone=request.getParameter("phone");
String pwd=request.getParameter("pwd");
    Resuilt resuilt=new Resuilt(3);
    resuilt.setpwd(pwd);
    pwd=resuilt.getresuilt();
DataBase dataBase=new DataBase();
    ArrayList<User> userlist=dataBase.getUserListByPhong(phone);
    if (userlist.size()>0){
        if (userlist.get(0).getPassword().equals(pwd)){
            %>
<h1 style="font-size: 100px;letter-spacing: 30px;margin-left: 50px"> 修改账号信息</h1>
<form action="UpdateUserServlet"name="myForm"method="post" onsubmit="return myFunction()">
    <div style="font-size: 50px;padding-top: 60px;letter-spacing: 25px;line-height: 120px">
        <p>时间：<input type="text" name="time" id="Date" value="<%=TimeUtil.getSystemTime()%>" style="background-color:transparent;border-color: transparent;width: 610px" readonly unselectable="on"></p>
        <p>账号：<input type="text"name="phone"placeholder="电话号码"value="<%=userlist.get(0).getPhonenum()%>"style="background-color:transparent;border-color: transparent;width: 610px"readonly unselectable="on"></p>
        <p><label>姓名：</label><input type="text"name="name"placeholder="请输入新的姓名\昵称"value="<%=userlist.get(0).getUsername()%>"style="width: 610px"></p>
        <p><label>密码：</label><input type="password" name="pwd1" placeholder="请输入新的密码"style="width: 610px"></p>
        <p><label>确认：</label><input type="password" name="pwd2"placeholder="请再次输入新的密码"style="width: 610px"></p>
        <br><input type="submit"value="提 交 修 改"id="btnGo"style="width: 450px;padding: 25px">
    </div>
</form>
<%
        }else {
%>
<h1>对不起，查询到你的账户信息错误</h1>
<form action="success.jsp"method="post">
    <div style="display:none">
        <input name="input1" value="<%=phone%>">
        <input  type="password" name="input2"value="<%=pwd%>">
    </div>
    <input type="submit"value="返回主页">
</form>
<%
        }
    }else {
        %>
<h1>对不起，没有查询到你的账户信息</h1>
<form action="success.jsp"method="post">
    <div style="display:none">
        <input name="input1" value="<%=phone%>">
        <input type="password" name="input2"value="<%=pwd%>">
    </div>
    <input type="submit"value="返回主页">
</form>
<%
    }}}catch (Exception e){
        %>
<jsp:forward page="index.jsp">
    <jsp:param name="n" value="6"/>
</jsp:forward>
<%
    }
%>

</body>
</html>
