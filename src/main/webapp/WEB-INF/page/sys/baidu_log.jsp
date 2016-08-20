<%--
  Created by IntelliJ IDEA.
  User: vincent
  Date: 15-9-15
  Time: 下午1:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>加载闪烁点</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <style type="text/css">
        #map {
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<style type="text/css">
    #map {
        width: 100%;
        height: 100%;
    }
</style>

<div id="map"></div>
<script type="text/javascript" src="${ctx }/resources/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${ctx }/resources/seajs/sea.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=cTYtHPV1spdnWgFSeKfXqjTh"></script>

<script type="text/javascript">
	seajs.config({
	    base: "${ctx}/resources/js/",
	    alias: {
	        'baidumap1':'http://api.map.baidu.com/api?v=2.0&ak=cTYtHPV1spdnWgFSeKfXqjTh',
	        'baidumap2':'http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js',
	        'baidumap3':'http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js'
	    }
	});
    seajs.use(['baidumap2','baidumap3'], function (b2,b3) {
        // 百度地图API功能
        var map = new BMap.Map("map");
        map.centerAndZoom(new BMap.Point(105, 32), 6);
        map.enableScrollWheelZoom();
        var MAX = 10;
        var markers = [];
        var pt = null;
        var i = 0;




        $.ajax({
            url:"/baidu/getLocations",
            dataType:'json',
            success:function(data){
                if(!data.ok){
                    return;
                }
                data=data.data;
                for (i=0; i < data.length; i++) {
                    var item = data[i];
                    pt = new BMap.Point(item.x, item.y);
                    markers.push(new BMap.Marker(pt));
                }
                //最简单的用法，生成一个marker数组，然后调用markerClusterer类即可。
                var markerClusterer = new BMapLib.MarkerClusterer(map, {markers:markers});
            }
        });

    });


</script>
</body>
</html>

