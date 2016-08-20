<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
<link href="${ctx }/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/resources/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>城市列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 城市管理 <span class="c-gray en">&gt;</span> 城市列表 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<shiro:hasPermission name="sys:city:add">
		<div class="cl pd-5 bg-1 bk-gray"> <span class="l">  <a class="btn btn-primary radius" href="javascript:;" onclick="add_city('添加城市','${ctx}/city/toAddcity','700','300')" ><i class="Hui-iconfont">&#xe600;</i> 添加城市</a> </span>  </div>
	</shiro:hasPermission>
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="6">城市列表</th>
			</tr>
			<tr class="text-c">
				<th width="40">ID</th>
				<th width="200">城市名称</th>
				<th width="200">描述</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${data }" var="d">
				<tr class="text-c">
					<td>${d.id}</td>
					<td>${d.name }</td>
					<td>${d.desc }</td>
					<td class="f-14">
						<a href="${ctx }/area/list/${d.id}">查看区域</a>
						<shiro:hasPermission name="sys:city:update">
						<a href="javascript:;" onclick="edit_city('修改城市','${ctx }/city/toUpdatecity/${d.id}','700','300')">编辑</a>
						</shiro:hasPermission>
						<a href="${ctx }/city/deletecity/${d.id}">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script type="text/javascript" src="${ctx }/resources/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${ctx }/resources/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${ctx }/resources/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${ctx }/resources/js/H-ui.js"></script> 
<script type="text/javascript" src="${ctx }/resources/js/H-ui.admin.js"></script> 
<script type="text/javascript">
/*添加城市*/
function add_city(title,url,w,h){
	layer_show(title,url,w,h);
}
function edit_city(title,url,w,h){
	layer_show(title,url,w,h);
}
</script>
</body>
</html>