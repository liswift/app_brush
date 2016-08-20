<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="${ctx }/resources/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/resources/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/resources/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>折线图</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 统计管理 <span class="c-gray en">&gt;</span> 折线图 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
		<div class="text-c">
			查询范围:
			<span class="select-box inline">
				<select id="type" name="type" class="select">
						<option value="days">今天</option>
						<option value="week">一星期</option>
				</select>	
			</span>  
		</div>
	<div id="container" style="min-width:700px;height:400px"></div>
</div>
<script type="text/javascript" src="${ctx }/resources/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${ctx }/resources/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${ctx }/resources/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/H-ui.js"></script> 
<script type="text/javascript" src="${ctx }/resources/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${ctx }/resources/lib/Highcharts/4.1.7/js/highcharts.js"></script>
<script type="text/javascript" src="${ctx }/resources/lib/Highcharts/4.1.7/js/modules/exporting.js"></script>
<script type="text/javascript">
$(function () {
	$("#type").change(function() {
		openDataArray();
	});
	openDataArray();
	function openDataArray(){
		var type = $("#type").val();
		$.post('${ctx}/logcount/actDataArray',{type :type },function(data){
			var x = eval('('+ data.categories + ')');
	    	var bj = eval('('+ data.xArray + ')');
	    	highcharts (x,bj,data.max,data.subheading);
		},"json");
	};
	
	function highcharts (x, bj, max, subheading) {
	    $('#container').highcharts({
	        title: {
	            text: '统计系统访问量',
	            x: -20 //center
	        },
	        subtitle: {
	        	text: subheading,
	            x: -20
	        },
	        xAxis: {
	        	categories: x
	        },
	        yAxis: {
	            title: {
	                text: '系统访问量'
	            },
	            plotLines: [{
	                value: 0,
	                width: 1,
	                color: '#808080'
	            }]
	        },
	        tooltip: {
	            valueSuffix: '个'
	        },
	        legend: {
	            layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'middle',
	            borderWidth: 0
	        },
	        series: [{    
				name: '访问个数', 
	            data: bj
	        }]
	    });
	}
});
</script>
</body>
</html>