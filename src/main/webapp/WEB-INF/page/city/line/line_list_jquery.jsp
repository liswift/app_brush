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
	<form action="${ctx }/line/list" method="post">
	
		<div class="text-c">
		城市列表:
		<span class="select-box inline">
			<select name="cityid" class="select">
				<c:forEach items="${cityData }" var="type">
					<option value="${type.id }">${type.name }</option>
				</c:forEach>
			</select>	
		</span>  日期范围：
			<input type="text" name="begintime" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
			-
			<input type="text" name="endtime" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
			<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</div>
	</form>
	<shiro:hasPermission name="sys:line:add">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a class="btn btn-primary radius" href="javascript:;" onclick="add_line('添加线路','${ctx }/line/toAddLine','700','400')" ><i class="Hui-iconfont">&#xe600;</i> 添加线路</a></span> <span class="r">共有数据：<strong>88</strong> 条</span> </div>
	</shiro:hasPermission>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="6">城市管理</th>
			</tr>
			<tr class="text-c">
				<th width="40">ID</th>
				<th width="150">城市名称</th>
				<th width="150">线路名称</th>
				<th width="150">创建时间</th>
				<th width="100">操作</th>
			</tr>
		</thead>
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
function add_line(title,url,w,h){
	layer_show(title,url,w,h);
}
function edit_line(title,url,w,h){
	layer_show(title,url,w,h);
}
$(function(){
	$('.table-sort').dataTable({
		//"lengthMenu": [ [10, 25, 50, -1], [10, 25, 50, "All"] ],
		"bStateSave": false,//状态保存
		"bDeferRender": true,
		"ajax": "${ctx}/line/index",
		"columns": [
	      {'data': 'id'},
	      {'data': 'name'},
	      {'data': 'lname'},
	      {'data': 'create_time'},
	    ],
	    "columnDefs": [
		      {
		    	  'targets': [4],
		    	  'data' : 'id',
		    	  'render': function(data, type, row, meta) {
	    	    	  var result ="<a href=\'javascript:update(\""+data+"\")\' title=\'查看站点\'>查看站点</a>&nbsp;&nbsp;";   
	    	    	      result+="<a href=\'javascript:;\' onclick='edit_line('编辑线路','${ctx }/line/toUpdateLine/${d.id}','700','400')\' >编辑</a> &nbsp;&nbsp;";
	    	    	    "<shiro:hasPermission name='sys:line:delete'>"
							 result+="<a href=\'javascript:show(\""+data+"\")\'  title=\'删除\'>删除</a>";
						"</shiro:hasPermission>"
	    	    	         	  
	    	    	  return result;
	     	      }	
		      }
		    ]
	});
	
	function update(id) {
		alert(id);
	}
	
	function del(id) {
		alert(id);
	}
	
	function show(id) {
		alert(id);
	}
});
</script> 
</body>
</html>