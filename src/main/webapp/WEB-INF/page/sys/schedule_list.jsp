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
<link href="${ctx }/resources/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 城市管理 <span class="c-gray en">&gt;</span> 线路列表 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<shiro:hasPermission name="sys:quartz:add">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a class="btn btn-primary radius" href="javascript:;" onclick="add_schedule('添加定时任务','${ctx }/schedule/toAddSchedule','700','400')" ><i class="Hui-iconfont">&#xe600;</i> 添加定时任务</a></span> <span class="r">共有数据：<strong>88</strong> 条</span> </div>
	</shiro:hasPermission>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="7">定时任务管理</th>
			</tr>
			<tr class="text-c">
				<th width="90">任务名</th>
				<th width="100">任务组</th>
				<th width="100">cron表达式</th>
				<th width="100">状态</th>
				<th width="100">任务类</th>
				<th width="100">描述</th>
				<th width="180">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${data }" var="d">
				<tr class="text-c">
					<td>${d.name}</td>
					<td>${d.group }</td>
					<td>${d.cronExpression }</td>
					<td>${d.status }</td>
					<td>${d.className }</td>
					<td>${d.description }</td>
					<td class="f-14">
						<shiro:hasPermission name="sys:quartz:stop">
						<a  href="${ctx }/schedule/stop?name=${d.name }&group=${d.group}">暂停</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="sys:quartz:resume">
						<a  href="${ctx }/schedule/resume?name=${d.name }&group=${d.group}">恢复</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="sys:quartz:start">
						<a  href="${ctx }/schedule/startNow?name=${d.name }&group=${d.group}">立即运行一次</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="sys:quartz:delete">
						<a  href="${ctx }/schedule/delete?name=${d.name }&group=${d.group}">删除</a>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>
<script type="text/javascript" src="${ctx }/resources/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${ctx }/resources/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${ctx }/resources/lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript" src="${ctx }/resources/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${ctx }/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${ctx }/resources/js/H-ui.js"></script> 
<script type="text/javascript" src="${ctx }/resources/js/H-ui.admin.js"></script> 
<script type="text/javascript">
function add_schedule(title,url,w,h){
	layer_show(title,url,w,h);
}
function edit_line(title,url,w,h){
	layer_show(title,url,w,h);
}
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,4]}// 制定列不参与排序
		]
	});
	$('.table-sort tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});
});
</script> 
</body>
</html>