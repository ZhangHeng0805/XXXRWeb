function geolocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition,showError,option);
    } else {
        alert("浏览器不支持地理定位。");
    }

    function showError(error) {
        switch (error.code) {
            case error.PERMISSION_DENIED:
                // alert("定位失败,用户拒绝请求地理定位");
                break;
            case error.POSITION_UNAVAILABLE:
                alert("定位失败,位置信息是不可用");
                break;
            case error.TIMEOUT:
                alert("定位失败,请求获取用户位置超时");
                break;
            case error.UNKNOWN_ERROR:
                alert("定位失败,定位系统失效");
                break;
        }
    }
    function showPosition(position) {
        var lat = position.coords.latitude; //纬度
        var lag = position.coords.longitude; //经度
        alert('纬度:' + lat + ',经度:' + lag);
    }
    var option = {
        enableHighAccuracy: true, //设置提升定位的精准度
        maximumAge: 0,  //禁用缓存
        timeout: 30000  //开始获取定位信息30秒后超时
    }
}
// geolocation();