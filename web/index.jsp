<%@ page import="Util.TimeUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<html>
<head>
<title>星曦向荣网_用户登录</title>
    <style type="text/css">
        body {
            background-image: url("http://browser9.qhimg.com/bdr/__85/t01d684f9e7454a98c4.jpg");
            background-position: center center;
            background-size: cover;
            text-align: center;
            zoom: 100%;
        }
        .input1 {
            padding: 10px;
            background: #e8fffc;
            color: #666;
            border: 5px solid rgb(250, 248, 229);
            font-size: 50px;
            width: 600px;
            letter-spacing: 3px;
            box-shadow: 0 3px 6px 0 rgba(236, 226, 101, 0.5);
            border-radius: 15px;
            z-index: 999;
            position: center;

        }
        form{
            color: #111111;
            text-shadow: 0 3px 6px 0 rgba(202, 197, 194, 0.73);
        }
        .input2{
             width:350px;
             height:100px;
             font-size:50px;
             background: #ffdf91;
            box-shadow: 0 3px 6px 0 rgba(202, 153, 5, 0.73);
         }
        .input3{
              width:350px;
              height:100px;
              font-size:50px;
              background: #a5fdff;
            box-shadow: 0 3px 6px 0 rgba(27, 142, 236, 0.5);
          }
        h1{
            font-size: 115px;
            margin-left: 45px;
            color: #00faff;
            font-family: 楷体;
            letter-spacing: 50px;
        }
    </style>
<script type="text/javascript">
function validateForm(){
    login();
	var x=document.forms["myForm"]["input1"].value;
	var y=document.forms["myForm"]["input2"].value;
	  if (x.length<1||y.length<1)
	  {
	    alert("输入框不能为空");
	    return false;
	  }else{
	      if(x.length!=11){
              alert("账号为11位电话号码");
              return false;
          }else {
	          if(y.length>18&&y.length<6){
                  alert("密码长度限制（6~18位）");
                  return false;
              }else {
                  // alert("登录成功");
	              return true
              }
          }
	  }
}

function login() {
    var t=3;
    var i;
    var login=document.getElementById("login");
    login.disabled="disabled";

    function run() {
        if (t>0) {
            login.value=t+"秒后可操作";
            t--;
        }else {
            login.disabled="";
            clearInterval(i);
            login.value="登         录";
        }
    }
    i=setInterval(run,1000);
}

</script>
</head>
<body>
<center>
<div style="margin:100px auto;font-size:50px">
<h1>用户登录</h1>
    <div style="color: red;font-size: 35px;">
    <%
    String n=request.getParameter("n");
        System.out.println(TimeUtil.getSystemTime() +"：登录："+n);
    if ("1".equals(n)){
        %>
    <p>账号错误或没有此账号,请重新登录！</p>
    <%
    }else if ("2".equals(n)){
        %>
    <p>密码错误</p>
    <%
    }else if ("3".equals(n)){
        %>
    <p>登录出错，请重新登录！</p>
    <%
    }else if ("4".equals(n)){
        %>
        <p>对不起你没有权限</p>
        <%
    }else if ("5".equals(n)){
        %>
        <p>对不起,请先登录后再操作</p>
        <%
    }else if ("6".equals(n)){
        %>
        <p>信息出错，请重新登录！</p>
        <%
    }else if ("7".equals(n)){
        %>
        <p>信息更新，请重新登录！</p>
        <%}
    else{
        %>
    <p></p>
    <%
    }
    %>
    </div>
<form action="success.jsp"name="myForm"method="post" style=""onsubmit="return validateForm()">
    <p>账号：<input type="number"id="phonenum" name="input1" class="input1" placeholder="请输入手机号"title="11位手机号" onkeyup="this.value=this.value.replace(/\D/g,'')"></p>
    密码：<input type="password"id="password" name="input2" class="input1"placeholder="请输入密码"title="输入长度范围6~18" onkeyup="this.value=this.value.replace(/[^\w_.]/g,'')"></br>
    <label style="color: #ff7100;font-size: 35px;">提示:密码中的符号只能输入_和.</label>
    <br>
    <br>
    <p><input type="submit"value="登         录"class="input2" id="login" style="margin-right:40px;border-radius: 15px">
    <a href="zhuce.jsp"><input type="button" value="注       册"class="input3"style="margin-left:40px;border-radius: 15px"></a>
</form>
    <div>
        <a href="liuyan.jsp"target="_blank"><h2 style="color: rgba(0,208,255,0.99);font-size: 40px">问题反馈，去留言</h2></a>
        <a href="location.jsp"target="_blank"><h2 style="color: rgba(0,208,255,0.99);font-size: 40px">地图位置</h2></a>
        <a href="Administrator.jsp"target="_blank"><h2 style="color: rgba(0,208,255,0.99);font-size: 40px">网站数据</h2></a>
        <a href="Lottery.jsp"target="_blank"><h2 style="color: rgba(0,208,255,0.99);font-size: 40px">网站抽奖</h2></a>
    </div>
    <div style="text-align: center;width: 100%;padding:15px;">
        <a href="https://mp.weixin.qq.com/s/tFKa0JSYIjwuFpjKJKuXaw">
            <h5>点我了解更多</h5>
            <img src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhiphotos.baidu.com%2Ffeed%2Fpic%2Fitem%2F0824ab18972bd407e25d1bb676899e510eb309e7.jpg&refer=http%3A%2F%2Fhiphotos.baidu.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1613403719&t=1f3abfc9169d59fbcef47091086c62b5">
        </a>
    </div>
</div>
</center>
</body>
</html>