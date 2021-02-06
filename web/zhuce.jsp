<%@ page import="java.util.Date" %>
<%@ page import="Util.TimeUtil" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>星曦向荣网_用户注册</title>
    <style type="text/css">
        body {
            background-image: url("http://browser9.qhimg.com/bdr/__85/t013a4ed4683039d101.jpg");
            background-position: center center;
            background-size: cover;
            text-align: center;
            zoom: 100%;
        }
        input{
            padding: 10px;
            border-radius: 15px
        }
        h1{
            font-size: 105px;
            margin-left: 40px;
            color: dodgerblue;
            font-family: 华文楷体;
            letter-spacing: 50px;
        }
    </style>
<script type="text/javascript">
    function login() {
        var login=document.getElementById("btnGo");
        var t=5;
        var i;
        login.disabled="disabled";
        function run() {
            if (t>0) {
                login.value=t+"秒后可操作";
                t--;
            }else {
                login.disabled="";
                clearInterval(i);
                login.value="注    册";
            }
        }
        i=setInterval(run,1000);
    }
function myFunction(){
        login();
	var name =document.getElementById("username").value;
    var time =document.getElementById("Date").value;
	var phonenum =document.getElementById("phonenum").value;
	var pwd=document.getElementById("password").value.replace(" ","");
	var pwd2=document.getElementById("password2").value;
	if(phonenum.length<1||pwd.length<1||name.length<1||time.length<1){
		alert("输入框不能为空");
		return false;
	}else{
	    if(phonenum.length==11) {
	        if (name.length<21) {
                if (pwd == pwd2) {
                    if (pwd.length < 19&&pwd.length>5) {
                        // alert("注册成功");
                        return true;
                    } else {
                        alert("密码长度限制（6~18位）");
                        return false;
                    }
                } else {
                    pwd.value = "";
                    pwd2.value = "";
                    alert("两次密码不一致");
                    return false;
                }
            }else {
                alert("姓名长度超过限制（20位）");
                return false;
            }
        }else {
            alert("账号为11位电话号码");
            return false;
        }
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
// var GoSecond=8;
// var LastSecond;
// function TimeDown(){
//     var aaa=document.getElementById("btnGo");
//     if(aaa){
//         if(GoSecond==0){
//             aaa.disabled="";
//             aaa.value="注        册";
//         }
//         else{
//             aaa.value=GoSecond+"秒后可注册";
//             GoSecond--;
//             aaa.disabled="disabled"
//         }
//     }
// }
// LastSecond=setInterval("TimeDown()",1000);//每隔1秒刷新时间
</script>
</head>
<body style="width: 100%;height: 100%;" >

<center>
    <div style="margin:50px auto;font-size:50px">
<h1>用户注册</h1>
        <div style="color: red;font-size: 35px;">
    <%
        String i=request.getParameter("n");
        System.out.println(TimeUtil.getSystemTime() +"：注册："+i);
        if("1".equals(i)){%>
    <p>注册失败，请重新尝试！
        <% } else if("2".equals(i)){%>
    <p>该账号已被注册，请重新注册！
    <% }else if ("3".equals(i)){
            %>
            <p>该电话号码格式错误，请重新注册！
                    <%
    }else if ("4".equals(i)){
            %>
            <p>注册内容为空，请重新注册！
                    <%
    }
        else if(i==null){
    }else if (i.length()>6){%>
    <p><%=i%>，请重新尝试！
                <%}else{%>
    <p>注册错误，请重新尝试！
            <% }
    %>
        </div>
<form action="zhuce2.jsp" method="post" onsubmit="return myFunction()">
    <p>时间：<input type="text"name="date"value="<%=TimeUtil.getSystemTime()%>" id="Date"readonly unselectable="on"style="font-size: 50px;width: 610px;background-color:transparent;border-color: transparent;">
        <p>账号：<input type="number"name="input1" id="phonenum"placeholder="请输入手机号" title="11位手机号"onkeyup="this.value=this.value.replace(/\D/g,'')"style="font-size: 50px;width: 600px;background: #edfffd"></p>
        <p>姓名：<input type="text"name="input2" id="username"placeholder="请输入姓名\昵称" title="最大字符数8位"style="font-size: 50px;width: 600px;background: #edfffd"></p>
密码：<input type="password"name="input3"id="password"placeholder="请输入密码"title="输入长度范围6~18" onkeyup="this.value=this.value.replace(/[^\w_.]/g,'')"onkeydown="if(event.keyCode==32||event.keyCode==13){return false;}"style="font-size: 50px;width: 600px;background: #edfffd"><br>
        <label style="color: deeppink;font-size: 35px;">提示:密码中的符号只能输入_和.</label><br>
<p>确认：<input type="password"name="input"id="password2" placeholder="请再次输入密码"title="输入长度范围6~18" onkeyup="this.value=this.value.replace(/[^\w_.]/g,'')"onkeydown="if(event.keyCode==32||event.keyCode==13){return false;}"style="font-size: 50px;width: 600px;background: #edfffd">
        <br>
        <br>
        <p><input type="submit"value="注    册" id="btnGo"style="width:350px;height:100px;font-size:50px;margin-right:20px;background: #ffc787">
        <a href="index.jsp"><input type="button"value="去登录"style="width:350px;height:100px;font-size:50px;margin-left:20px"></a></p>
</form>
</div>
    <div>
        <a href="liuyan.jsp"><h2 style="color: #14fa4c;font-size: 40px">问题反馈，去留言</h2></a>
    </div>
</center>
</body>
</html>