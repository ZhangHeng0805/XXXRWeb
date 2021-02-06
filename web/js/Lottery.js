var time;
var flag=true;
var list=new Array();
function run() {

    if (list.length>0) {
        if (flag) {
            start();
            flag = !flag;
        } else {
           stop();
            flag = !flag;
        }
    }else {
        alert("请先添加奖品")
    }
}
function start() {
    time = setInterval(change, 100);
    document.getElementById("b1").value = "停      止";
}
function stop() {
    clearInterval(time);
    document.getElementById("b1").value = "抽      奖";
}
function change() {
         // list.push("张恒","张振","张帆","张丹","张怡","张应峰");
    if (list.length>0) {
        var radom = Math.floor(Math.random() * list.length);
        document.getElementById("l1").innerText = list[radom];
    }else {
        stop();
    }
}
function setlist() {
    var a=document.getElementById("val").value;
    if (a.length<20) {
        if (a.length > 0 && a != null) {
            list.push(a)
        } else {
            alert("输入框不能为空")
        }
    }else {
        alert('奖品名称过长(限制长度19位)');
    }
    document.getElementById("val").value="";
}
function getlist() {
    if (list.length > 0) {
        var str="";
        for (var i=0;i<list.length;i++) {
            str+=list[i]+"\n";
        }
        document.getElementById("show").innerText=str;
    }else {
        document.getElementById("show").innerText='奖池区为空';
    }
}
function dellist(){
    if (list.length>0){
        list.splice(0,list.length);
    }else {
        alert("奖池已经为空")
    }
}
setInterval(getlist,100);