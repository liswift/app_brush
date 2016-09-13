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
<script type="text/javascript" src="lib/PIE-2.0beta1/PIE_IE678.js"></script>
<![endif]-->
<link href="${ctx }/resources/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/resources/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/resources/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${ctx }/resources/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>建材列表</title>
</head>
<body class="pos-r">
<div class="pos-a" style="width:150px;left:0;top:0; bottom:0; height:100%; border-right:1px solid #e5e5e5; background-color:#f5f5f5">
	<ul id="treeDemo" class="ztree">
	</ul>
</div>
<div style="margin-left:150px;">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 子菜单管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="pd-20">
		<shiro:hasPermission name="sys:subperm:add">
		<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a  class="btn btn-primary radius" href="javascript:;" onclick="add_submenu('添加子菜单','${ctx}/permission/toAddSubMenu/${pid }','700','300')"><i class="Hui-iconfont">&#xe600;</i> 添加子主菜单</a></span></div>
		</shiro:hasPermission>
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="40">ID</th>
						<th width="60">名称</th>
						<th width="60">资源路径</th>
						<th width="60">描述</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${dataMenu }" var="d">
					<tr class="text-c va-m">
						<td>${d.id }</td>
						<td>${d.name }</td>
						<td>${d.URL }</td>
						<td>${d.DESCRIPTION }</td>
						<td class="td-manage">
							<shiro:hasPermission name="sys:subperm:update">
							<a href="javascript:;" onclick="edit_submenu('编辑子菜单','${ctx}/permission/toEditSubMenu/${d.id }/${pid }','700','300')">编辑</a> 
							</shiro:hasPermission>
							<shiro:hasPermission name="sys:subperm:delete">
							<a href="${ctx }/permission/delsubmenu/${d.id}/${d.pid}">删除</a>
							</shiro:hasPermission>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript" src="${ctx }/resources/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${ctx }/resources/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${ctx }/resources/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${ctx }/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${ctx }/resources/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script> 
<script type="text/javascript" src="${ctx }/resources/js/H-ui.js"></script> 
<script type="text/javascript" src="${ctx }/resources/js/H-ui.admin.js"></script> 
<script type="text/javascript">
var setting = {
		view: {
			dblClickExpand: false,
			showLine: false,
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable:true,
				idKey: "id",
				pIdKey: "pId",
				rootPId: ""
			}
		},
		callback: {
			beforeClick: function(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("tree");
				if (treeNode.isParent) {
					zTree.expandNode(treeNode);
					return false;
				} else {
					demoIframe.attr("src",treeNode.file + ".html");
					return true;
				}
			}
		}
	};

	var code;
			
	function showCode(str) {
		if (!code) code = $("#code");
		code.empty();
		code.append("<li>"+str+"</li>");
	}
function add_submenu(title,url,w,h){
	layer_show(title,url,w,h);
}
function edit_submenu(title,url,w,h){
	layer_show(title,url,w,h);
}
		
$(document).ready(function(){
	$.post('${ctx}/submenu/tree/${pid}',function(data){
		var t = $("#treeDemo");
		t = $.fn.zTree.init(t, setting, eval(data));
		demoIframe = $("#testIframe");
		demoIframe.bind("load", loadReady);
		var zTree = $.fn.zTree.getZTreeObj("tree");
		zTree.selectNode(zTree.getNodeByParam("id",'11'));
	},"html");
});

$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[3]}// 制定列不参与排序
	]
});

</script>
</body>
</html>