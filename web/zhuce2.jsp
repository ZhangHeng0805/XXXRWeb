<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ page import="database.*" %>
<%@ page import="Util.TimeUtil" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
     <script language="javascript" type="text/javascript">
          var GoSecond=3;
          var LastSecond;
          function TimeDown() {
               var aaa = document.getElementById("tiaozhuan");
               if (aaa) {
                    if (GoSecond == 0) {
                         window.location.href="index.jsp";
                    } else {
                         aaa.innerHTML = GoSecond + "秒后自动跳转";
                         GoSecond--;
                    }
               }
          }
          LastSecond=setInterval("TimeDown()",1000);//每隔1秒刷新时间
     </script>
<title>注册成功</title>
</head>
<body style="width: 100%;height: 100%;text-align: center">
<%
try {
request.setCharacterEncoding("utf-8");
String phone=request.getParameter("input1");
String name=request.getParameter("input2");
String pwd=request.getParameter("input3").replace(" ","");
String time=request.getParameter("date");
if (phone!=null){
     name=HTMLUtil.delHTMLTag(name);
     pwd=HTMLUtil.delHTMLTag(pwd);
if (PhoneNum.isMobile(phone)){
     User user=new User();
     user.setPhonenum(phone);
     user.setUsername(name);
     user.setPassword(pwd);
     user.setTime(time);
     DataBase dataBase=new DataBase();
     String f=dataBase.AddUser(user);
     System.out.println(TimeUtil.getSystemTime()+"：注册："+f);

if("true".equals(f)){
%>
<div style="margin: 100px auto">
<h1>尊敬的：<label style="color:#ff7d2d"><%=name%></label></h1>
<h2>恭喜您注册成功!
     <a href="index.jsp"><div id="tiaozhuan">自动跳转至登录</div></a>
</h2>
</div>
<%}else if ("flase".equals(f)){%>
<jsp:forward page="zhuce.jsp">
     <jsp:param name="n" value="1"/>
</jsp:forward>
<%
}else if ("该账号存在".equals(f)){%>
<jsp:forward page="zhuce.jsp">
     <jsp:param name="n" value="2"/>
</jsp:forward>
<%}else if (f.indexOf("java.lang.NullPointerException")>1){
%>
<jsp:forward page="zhuce.jsp">
     <jsp:param name="n" value="4"/>
</jsp:forward>
<%
}
}else {
%>
<jsp:forward page="zhuce.jsp">
     <jsp:param name="n" value="3"/>
</jsp:forward>
<%
}}else {
%>
<jsp:forward page="zhuce.jsp">
     <jsp:param name="n" value="4"/>
</jsp:forward>
<%
}

}catch (Exception e){
     e.printStackTrace();
     String flag=String.valueOf(e);
     if (flag.indexOf("for key 'PRIMARY'")>1){
          flag="该账号存在";
     }
     if (flag.indexOf("java.lang.NullPointerException")>1){
          flag="注册内容为空";
     }
%>
<jsp:forward page="zhuce.jsp">
     <jsp:param name="n" value="<%=flag%>"/>
</jsp:forward>
<%}%>
</body>
</html>