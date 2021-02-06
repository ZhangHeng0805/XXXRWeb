
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
    //             aaa.value="提 交 留 言";
    //         }
    //         else{
    //             aaa.value=GoSecond+"秒后可提交";
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
            login.value="提 交 留 言";
        }
    }
    i=setInterval(run,1000);
}
function myFunction() {
    login();
    var time=document.forms["myForm"]["time"].value;
    var name=document.forms["myForm"]["name"].value;
    var contact=document.forms["myForm"]["contact"].value;
    var content=document.forms["myForm"]["content"].value;
    var note=document.forms["myForm"]["note"].value;

    if (time.length>0&&name.length>0&&contact.length>0&&content.length>0){
        if (name.length<21){
            if (contact.length<255){
                if (content.length<255){
                    if (note.length<255){
                        alert("提交中，请稍后...");
                        return true;
                    } else {
                        alert("备注长度超过限制（255位）");
                        return false;
                    }
                }else {
                    alert("留言内容长度超过限制（255位）");
                    return false;
                }
            }else {
                alert("联系方式长度超过限制（255位）");
                return false;
            }
        } else {
            alert("姓名长度超过限制（20位）");
            return false;
        }
    } else {
        alert("除了备注，其他输入框不能为空");
        return false;
    }
}