<%@ page import="Util.TimeUtil" %><%--
  Created by IntelliJ IDEA.
  User: 张恒
  Date: 2021/1/24 0024
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
    <meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <title>星曦向荣网地图</title>
    <!--引用百度地图API-->
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=fajTIS8KhipiqBmR0vdkRqys7U8Vf5qb"></script>
<%--    <script type="text/javascript" src="//api.map.baidu.com/api?type=webgl&v=1.0&ak=PgBb565lrjcChKlq6706oQI6rqwjzA4A"></script>--%>
    <script type="text/javascript" src="//mapopen.cdn.bcebos.com/github/BMapGLLib/DistanceTool/src/DistanceTool.min.js"></script>
    <script type="text/javascript" src="//api.map.baidu.com/api?type=webgl&v=1.0&ak=7Cc5Kmn672miPzG4qQhvlOrERcXMMinq"></script>
    <script type="text/javascript" src="js/location.js"></script>
    <style type="text/css">
        ul li {list-style: none;}
        .drawing-panel {
            z-index: 999;
            position: fixed;
            bottom: 3.5rem;
            margin-left: 3rem;
            padding: 1rem 1rem;
            border-radius: .25rem;
            background-color: #fff;
            box-shadow: 0 2px 6px 0 rgba(27, 142, 236, 0.5);
        }
        .draw-btn {
            width: 75px;
            height: 30px;
            background-color: #fff;
            color: rgba(27, 142, 236, 1);
            border:1px solid rgba(27, 142, 236, 1);
            border-radius: 5px;
            margin: 0 5px;
        }
    </style>
</head>
<body>
<%System.out.println(TimeUtil.getSystemTime()+"：地图");%>
<ul class = "drawing-panel"style="display: none">
    <input type="button" class="draw-btn" value="开启测距" onclick="myDis.open()">
    <input type="button" class="draw-btn" value="关闭测距" onclick="myDis.close()">
</ul>
<!--百度地图容器-->
<div style="width:100%;height:100%;border:#ccc solid 1px;font-size:12px" id="map"></div>

</body>
<script type="text/javascript">


    geolocation();

        //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMapOverlay();//向地图添加覆盖物

    }
    function createMap(){//创建地图
        // map = new BMap.Map("map",{enableMapClick:false});
        map.centerAndZoom(new BMap.Point(113.413841,30.857617),9);// 初始化地图,设置中心点坐标和地图级别
        // myDis= new BMapGLLib.DistanceTool(map);
        // 创建城市选择控件
        var cityControl = new BMapGL.CityListControl({
            // 控件的停靠位置（可选，默认左上角）
            anchor: BMAP_ANCHOR_TOP_LEFT,
            // 控件基于停靠位置的偏移量（可选）
            offset: new BMapGL.Size(10, 5)
        });
        // 将控件添加到地图上
        map.addControl(cityControl);

    }
    function setMapEvent(){//设置地图事件
        map.enableScrollWheelZoom(true);
        map.enableKeyboard();
        map.enableDragging();
        // map.enableDoubleClickZoom()
    }
    function addClickHandler(target,window){
        target.addEventListener("click",function(){
            target.openInfoWindow(window);
        });

    }
    function Event() {
        myDis.addEventListener('drawend', function(e) {
            console.log("drawend");
            console.log(e.points);
            console.log(e.overlays);
            console.log(e.distance);
        });
        myDis.addEventListener("addpoint", function(e) {
            console.log("addpoint");
            console.log(e.point);
            console.log(e.pixel);
            console.log(e.index);
            console.log(e.distance);
        });
        myDis.addEventListener("removepolyline", function(e) {
            console.log("removepolyline");
            console.log(e);
        });
        map.addEventListener('click', function (e) {
            alert('点击位置经纬度：' + e.latlng.lng + ',' + e.latlng.lat);
        });
    }
    function addMapOverlay(){//向地图添加覆盖物
        var markers = [
            {content:"张恒的位置",title:"张恒家",imageOffset: {width:-92,height:-46},position:{lat:30.904896,lng:113.593237}},
            {content:"贺驰明的位置",title:"贺驰明家",imageOffset: {width:-23,height:-21},position:{lat:31.986152,lng:112.115182}},
            {content:"张思远的位置",title:"张思远家",imageOffset: {width:-115,height:3},position:{lat:30.361886,lng:113.463547}},
            // {content:"我的位置",title:"我在这里",imageOffset: {width:-115,height:3},position:{lat:30.361886,lng:113.463547}}
        ];
        for(var index = 0; index < markers.length; index++ ){
            var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
            var marker = new BMap.Marker(point,
                {icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),
                        {imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
                })});
            var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
            var opts = {
                width: 200,
                title: markers[index].title,
                enableMessage: false
            };
            var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
            marker.setLabel(label);
            addClickHandler(marker,infoWindow);
            map.addOverlay(marker);
        };
    }
    //向地图添加控件
    function addMapControl(){
        var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});// 添加比例尺控件
        scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
        map.addControl(scaleControl);
        var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:0});
        map.addControl(navControl);
        var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:true});
        map.addControl(overviewControl);
    }

    var map = new BMap.Map("map");
    var  myDis= new BMapGLLib.DistanceTool(map);
    initMap();
    Event();
    var cityControl = new BMapGL.CityListControl({
        // 控件的停靠位置（可选，默认左上角）
        anchor: BMAP_ANCHOR_TOP_LEFT,
        // 控件基于停靠位置的偏移量（可选）
        offset: new BMapGL.Size(10, 5)
    });
    // 将控件添加到地图上
    map.addControl(cityControl);
    // var myDis= new BMapGLLib.DistanceTool(map);
    // myDis.addEventListener('drawend', function(e) {
    //     console.log("drawend");
    //     console.log(e.points);
    //     console.log(e.overlays);
    //     console.log(e.distance);
    // });
    // myDis.addEventListener("addpoint", function(e) {
    //     console.log("addpoint");
    //     console.log(e.point);
    //     console.log(e.pixel);
    //     console.log(e.index);
    //     console.log(e.distance);
    // });
    // myDis.addEventListener("removepolyline", function(e) {
    //     console.log("removepolyline");
    //     console.log(e);
    // });
    // map.addEventListener('click', function (e) {
    //     alert('点击位置经纬度：' + e.latlng.lng + ',' + e.latlng.lat);
    // });

</script>
</body>
</html>
