<%@ page import="java.util.ArrayList" %>
<%@ page import="Util.zh.Resuilt" %>
<%@ page import="Util.zh.ASCII" %>
<%@ page import="database.*" %>
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
    <title>星曦向荣网_我的公告</title>
    <script type="text/javascript">
        function del() {
            var msg = "您真的确定要删除吗？\n\n请确认！";
            if (confirm(msg)==true){
                return true;
                }else{
                return false;
                }
        }
    </script>
    <style>
        body{
            text-align: center;
            background: #d1ffa0;
        }
        h1{
            color: #72d3ff;
            font-size: 60px;
            letter-spacing: 20px;
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
<%
    request.setCharacterEncoding("utf-8");
    String n= (String) request.getAttribute("n");
    String n1= (String) request.getAttribute("phone");
    String phone1= request.getParameter("phone");
    String time=request.getParameter("time");
    String state=request.getParameter("state");
    if (n1!=null){
    phone1=n1;
    }
    if (phone1!=null){
        String phone="";
        if (phone1.length()==11) {
            phone=phone1;
        }else {
            Resuilt resuilt = new Resuilt(2);
            resuilt.setpwd(phone1);
            phone=resuilt.getresuilt();
        }
//        System.out.println(state);
        DataBase dataBase =new DataBase();
        ArrayList<Notice> list1=dataBase.getNoticeListByPhone(phone);
        ArrayList<User> li_user=dataBase.getUserListByPhong(phone);
        ASCII ascii=new ASCII();
        ascii.setpwd(li_user.get(0).getPassword());
        String pwd=ascii.getresuilt(1);
        String sta="";
        if (state==null||state.length()<1){
            sta="全部状态";
        }else if ("1".equals(state)){
            sta="公开";
        }else if ("2".equals(state)){
            sta="私密";
        }
        if (list1.size()>0){
    %>
<h1><<%=list1.get(0).getName()%>><%=sta%>的公告</h1>
<a href="success.jsp?input1=<%=phone%>&&input2=<%=pwd%>"><button style="font-size: 35px;padding: 15px">返 回 主 页</button></a>
<form action="list_notice.jsp?phone=<%=phone1%>"method="post">
    <p style="font-size: 35px">
        状态：
        <%if (state==null||state.length()<1){%>
        <input type="radio" name="state" value=""style="width: 30px;zoom: 2.5"checked="checked">全部状态
        <input type="radio"name="state" value="1"style="width: 30px;zoom: 2.5">公开
        <input type="radio" name="state"value="2"style="width: 30px;zoom: 2.5">私密<br>
        <%}else if ("1".equals(state)){
        %>
        <input type="radio" name="state" value=""style="width: 30px;zoom: 2.5">全部状态
        <input type="radio"name="state" value="1"style="width: 30px;zoom: 2.5"checked="checked">公开
        <input type="radio" name="state"value="2"style="width: 30px;zoom: 2.5">私密<br>
        <%
        }else if ("2".equals(state)){
        %>
        <input type="radio" name="state" value=""style="width: 30px;zoom: 2.5">全部状态
        <input type="radio"name="state" value="1"style="width: 30px;zoom: 2.5">公开
        <input type="radio" name="state"value="2"style="width: 30px;zoom: 2.5"checked="checked">私密<br>
        <%
        }%>
        时间：<input type="text"name="time"placeholder="请输入要查询的时间（模糊查询）"style="width: 580px;padding: 10px">
        <input type="submit"value="查      询"style="height: 60px;font-size: 35px">
        <br><label style="color: #ff6000;font-size: 25px">提示：状态不选择默认查询全部状态/时间为空默认查询全部时间</label></p>
</form>
<%
if ("true".equals(n)){%>
<p style="font-size: 50px;color: red">公告删除成功！</p>
<%--    <a href="index.jsp"><button style="font-size: 35px;height:60px;width: 300px;color: orange">返回登录</button></a>--%>
<%
}else if("false".equals(n)){%>
<p style="font-size: 50px;color: red">公告删除失败！请重新尝试</p><%
}else if ("3".equals(n)){%>
<p style="font-size: 50px;color: red">公告删除错误！请重新尝试，如果不行，请反馈</p>
<a href="liuyan.jsp"><button style="font-size: 50px;letter-spacing: 25px;padding: 15px">去留言反馈</button></a>
<%
    }
%>
<div class="d1">
    <%if (list1.get(0).getPhonenum().equals(phone)){
//                DataBase dataBase=new DataBase();
                ArrayList<Notice> list=null;
                if (time==null||time.length()<1) {
                    list = list1;
    %><p style="font-size: 50px">《全部》的公告</p><%
}else {
    list =dataBase.getNoticeListByPhoneAndTime(phone,time);
    if (list.size()>0){
%><p style="font-size: 50px"><%=list.get(0).getName()%>《<label style="color: springgreen"><%=time%></label>》的公告</p><%
        }else {
%><script>alert("请使用查询进行刷新")</script><%
        }
    }
    if (list.size()>0){
%>
    <table border="2" cellspacing="0"style="text-align: center;font-size: 25px;width: 100%;">
        <tr>
            <th>时间</th>
            <th>账号</th>
            <th>姓名</th>
            <th>公告标题</th>
            <th>状态</th>
            <th>修改公告</th>
            <th>删除公告</th>
        </tr>
        <%for (Notice t:list){
        if (state==null||state.length()<1){
        %>
        <tr>
            <td><%=HTMLUtil.delHTMLTag(t.getTime())%></td>
            <td><%=HTMLUtil.delHTMLTag(t.getPhonenum())%></td>
            <td><%=HTMLUtil.delHTMLTag(t.getName())%></td>
            <td><%=HTMLUtil.delHTMLTag(t.getTitle())%></td>
            <td style="color: #ff332e"><% if ("1".equals(t.getState())){
                %>公开<%
            }else if ("2".equals(t.getState())){
            %>私密<%
            }%> </td>
            <td>
                <form action="updateNotice.jsp"method="post">
                <div style="display: none">
                    <input name="time" value="<%=t.getTime()%>">
                    <input name="phone" value="<%=t.getPhonenum()%>">
                </div>
                <input type="submit" value="修改该公告">
            </form>
            </td>
            <td>
                <form action="DelNoticeServlet"method="post" onsubmit="return del()">
                    <div style="display: none">
                        <input name="time" value="<%=t.getTime()%>">
                        <input name="phone" value="<%=t.getPhonenum()%>">
                    </div>
                    <input type="submit" value="删除该公告">
                </form>
            </td>
        </tr>
        <%}else if ("1".equals(state)){
            if ("1".equals(t.getState())){
                %>
        <tr>
            <td><%=HTMLUtil.delHTMLTag(t.getTime())%></td>
            <td><%=HTMLUtil.delHTMLTag(t.getPhonenum())%></td>
            <td><%=HTMLUtil.delHTMLTag(t.getName())%></td>
            <td><%=HTMLUtil.delHTMLTag(t.getTitle())%></td>
            <td style="color: #ff332e"><% if ("1".equals(t.getState())){
            %>公开<%
            }else if ("2".equals(t.getState())){
            %>私密<%
                }%> </td>
            <td>
                <form action="updateNotice.jsp"method="post">
                    <div style="display: none">
                        <input name="time" value="<%=t.getTime()%>">
                        <input name="phone" value="<%=t.getPhonenum()%>">
                    </div>
                    <input type="submit" value="修改该公告">
                </form>
            </td>
            <td>
                <form action="DelNoticeServlet"method="post" onsubmit="return del()">
                    <div style="display: none">
                        <input name="time" value="<%=t.getTime()%>">
                        <input name="phone" value="<%=t.getPhonenum()%>">
                    </div>
                    <input type="submit" value="删除该公告">
                </form>
            </td>
        </tr>
        <%
            }
        }else if ("2".equals(state)){
                if ("2".equals(t.getState())){
        %>
        <tr>
            <td><%=HTMLUtil.delHTMLTag(t.getTime())%></td>
            <td><%=HTMLUtil.delHTMLTag(t.getPhonenum())%></td>
            <td><%=HTMLUtil.delHTMLTag(t.getName())%></td>
            <td><%=HTMLUtil.delHTMLTag(t.getTitle())%></td>
            <td style="color: #ff332e"><% if ("1".equals(t.getState())){
            %>公开<%
            }else if ("2".equals(t.getState())){
            %>私密<%
                }%> </td>
            <td>
                <form action="updateNotice.jsp"method="post">
                    <div style="display: none">
                        <input name="time" value="<%=t.getTime()%>">
                        <input name="phone" value="<%=t.getPhonenum()%>">
                    </div>
                    <input type="submit" value="修改该公告">
                </form>
            </td>
            <td>
                <form action="DelNoticeServlet"method="post" onsubmit="return del()">
                    <div style="display: none">
                        <input name="time" value="<%=t.getTime()%>">
                        <input name="phone" value="<%=t.getPhonenum()%>">
                    </div>
                    <input type="submit" value="删除该公告">
                </form>
            </td>
        </tr>
        <%
                    }
        }
        }%>
    </table>
    <%}else {%>
    <p style="font-size: 40px;color: lightcoral">很干净，没有公告信息</p>
    <%}}else {
    %><jsp:forward page="index.jsp">
    <jsp:param name="n" value="6"/>
</jsp:forward><%
    }
    }else {
            %><p style="font-size: 40px;color: lightcoral">很干净，你没有发布公告，请先去发布公告！</p>
    <a href="success.jsp?input1=<%=phone%>&&input2=<%=pwd%>"><button style="font-size: 35px;padding: 15px">返 回 主 页</button></a><%
    }

}else {
%><jsp:forward page="index.jsp">
    <jsp:param name="n" value="4"/>
</jsp:forward><%
    }%>
</div>
</body>
</html>
