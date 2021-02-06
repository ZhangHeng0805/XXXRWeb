<%--
  Created by IntelliJ IDEA.
  User: 张恒
  Date: 2021/1/24 0024
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    <script type="text/javascript" src="js/jquery.min.js"></script>--%>
    <title>测试</title>
    <script type="text/javascript">
        function a() {

            // $.ajax({
            //     type: "post",
            //     url: "MessageServlet",
            //     data: {
            //         phone: $("#phone").val(),
            //     },
            //     success: function (data) {
            //         alert(data)
            //     }
            // })
            time();
        }
        function time() {
            var GoSecond = 60;
            var LastSecond;
            function TimeDown() {
                var aaa = document.getElementById("btnGo");
                if (aaa) {
                    if (GoSecond == 0) {
                        aaa.disabled = "";
                        aaa.value = "发送验证码";
                    } else {
                        aaa.value = GoSecond + "秒后再次可发送";
                        GoSecond--;
                        aaa.disabled = "disabled";
                        l()
                    }
                }
            }
            function l() {
                LastSecond = setInterval("TimeDown()", 1000);//每隔1秒刷新时间
            }
        }
        var t;
        var i;
        function login() {
            t=5;
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
<FORM METHOD="get" ACTION="https://www.ip138.com/iplookup.asp" name="ipform" target="_blank">
    <tr><td align="center">IP地址：<input type="text" name="ip" size="16">
        <input type="submit" value="查询"><INPUT TYPE="hidden" name="action" value="2">
    </td></tr>
</FORM><br>
    手机号：<input id="phone" type="number"size="16">
            <input type="button"id="login" value="发送验证码"onclick="login()">
</body>
</html>
