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
<link href="${ctx }/resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/resources/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>新建网站角色</title>
</head>
<body>
<div class="pd-20">
	<form action="#" method="post" class="form form-horizontal" id="form-member-add">
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>角色名称：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text" value="" placeholder="" id="user-name" name="name" datatype="*4-16" nullmsg="用户账户不能为空">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">备注：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text" value="" placeholder="" id="" name="desc">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">网站角色：</label>
			<div class="formControls col-10">
			<c:forEach items="${all }" var="a">
				<c:if test="${a.pid==null}">
				<dl class="permission-list">
					<dt>
						<label>
							<input type="checkbox" value="${a.id }" name="check" id="user-Character-0">
						${a.name }</label>
					</dt>
					<dd>
						<c:forEach items="${all }" var="p">
						<c:if test="${a.id == p.pid }">
						<dl class="cl permission-list2">
							
							<dt>
								<label class="">
									<input type="checkbox" value="${p.id }"  name="check" id="user-Character-0-0">
									${p.name }</label>
									&nbsp;&nbsp;
									<c:forEach items="${all }" var="v">
										<c:if test="${p.id == v.pid }">
											<label class="">
												<input type="checkbox" value="${v.id }"  name="check" id="user-Character-0-0">
												${v.name }
											</label>
											&nbsp;&nbsp;
										</c:if>
									</c:forEach>
							</dt>
						</dl>
						</c:if>
						</c:forEach>
					</dd>
				</dl>
				</c:if>
				</c:forEach>
			</div>
		</div>
		<div class="row cl">
			<div class="col-10 col-offset-2">
				<button type="button" class="btn btn-success radius" id="save" name="admin-role-save"><i class="icon-ok"></i> 确定</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="${ctx }/resources/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${ctx }/resources/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${ctx }/resources/lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript" src="${ctx }/resources/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${ctx }/resources/js/H-ui.js"></script> 
<script type="text/javascript" src="${ctx }/resources/js/H-ui.admin.js"></script> 
<script>
$(function(){
	$("#save").click(function() {
	    var d= $("#form-member-add").serialize();
        $.post("${ctx }/role/addRole", d, function (result) { 
        	parent.location.reload(); 
        	layer_close();
        }, "text");
	});
	
	$(".permission-list dt input:checkbox").click(function(){
		$(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
	});
	$(".permission-list2 dd input:checkbox").click(function(){
		var l =$(this).parent().parent().find("input:checked").length;
		var l2=$(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
		if($(this).prop("checked")){
			$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
			$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
		}
		else{
			if(l==0){
				$(this).closest("dl").find("dt input:checkbox").prop("checked",false);
			}
			if(l2==0){
				$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
			}
		}
		
	});
});
</script>
</body>
</html>