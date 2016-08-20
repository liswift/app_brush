<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="${ctx }/resources/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/resources/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>添加用户</title>
</head>
<body>
<div class="pd-20">
 <form action="${ctx }/user/addUserRole" method="post" class="form form-horizontal" id="form-member-add">
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="6">角色管理</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" value="" name=""></th>
				<th width="200">角色名</th>
				<th width="300">描述</th>
			</tr>
		</thead>
		<tbody>
		<input type="hidden" value="${id }" name="user_id"/>
		<c:forEach items="${all }" var="d">
			<tr class="text-c">
				<c:if test="${d.point == 1 }">
				<td><input type="checkbox" checked="checked" value="${d.id }" name="role_id"></td>
				</c:if>
				<c:if test="${d.point == 0 }">
				<td><input type="checkbox" value="${d.id }" name="role_id"></td>
				</c:if>
				<td>${d.NAME }</td>
				<td>${d.DESCRIPTION }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<br>
        <input  id="save" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
</form>
</div>
<script type="text/javascript" src="${ctx }/resources/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="${ctx }/resources/lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/H-ui.js"></script> 
<script type="text/javascript" src="${ctx }/resources/js/H-ui.admin.js"></script>
<script type="text/javascript">
$(function(){
	$("#save").click(function() {
	    var d= $("#form-member-add").serialize();
        $.post("${ctx }/user/addUserRole", d, function (result) { 
        	parent.location.reload(); 
        	layer_close();
        }, "text");
	});
	
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-member-add").Validform({
		tiptype:2,
		callback:function(form){
			form[0].submit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
	});
});
</script>
</body>
</html>