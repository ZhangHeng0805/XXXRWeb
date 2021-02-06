
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
    //             aaa.value="修 改 公 告";
    //         }
    //         else{
    //             aaa.value=GoSecond+"秒后可修改";
    //             GoSecond--;
    //             aaa.disabled="disabled"
    //         }
    //     }
    // }
    // LastSecond=setInterval("TimeDown()",1000);//每隔1秒刷新时间
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
            login.value="修 改 公 告";
        }
    }
    i=setInterval(run,1000);
}
function myFunction() {
    login();
    var time=document.forms["myForm"]["time"].value;
    var phone=document.forms["myForm"]["phone"].value;
    var name=document.forms["myForm"]["name"].value;
    var title=document.forms["myForm"]["title"].value;
    var content=document.forms["myForm"]["content"].value;
    var state=document.forms["myForm"]["state"].value;

    if (time.length>0&&name.length>0&&phone.length>0&&content.length>0&&title.length>0){
        if (time.length < 21) {
            if (phone.length == 11) {
                if (name.length < 21) {
                    if (title.length < 31) {
                        if (content.length < 1500) {
                            if (state.length>0) {
                                alert("修改中，请稍后...");
                                return true;
                            }else {
                                alert("请选择发布状态");
                                return false;
                            }
                        } else {
                            alert("内容长度超过限制（1500位）");
                            return false;
                        }
                    } else {
                        alert("标题长度超过限制（30位）");
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