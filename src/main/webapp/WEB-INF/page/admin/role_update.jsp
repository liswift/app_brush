<%@page import="org.springframework.web.context.request.RequestScope"%>
<%@ page language="java" import="java.lang.*, java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="${ctx }/resources/lib/jquery/1.9.1/jquery.min.js"></script> 
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
				<input type="text" class="input-text" value="${role.NAME }" placeholder="" id="user-name" name="name" datatype="*4-16" nullmsg="用户账户不能为空">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">备注：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text" value="${role.DESCRIPTION }" placeholder="" id="" name="desc">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">网站角色：</label>
			<div class="formControls col-10">
			<% 
				List<Map<String,Object>> allMenu  =  (List<Map<String,Object>>)request.getAttribute("allMenu");
			%>
			<% for(Map<String,Object> m : allMenu) { %>
				<dl class="permission-list">
					<dt>
						 <label>
						 	<% if(m.get("menu") != null && m.get("menu").equals(true)) { %>
				       			<input type="checkbox" value="<%=m.get("id") %>" checked="checked" name="check" id="user-Character-0">  
				       			<%=m.get("name") %>
				       		<% } else { %>
				       			<input type="checkbox" value="<%=m.get("id") %>"  name="check" id="user-Character-0">  
				       			<%=m.get("name") %>
				       		<% } %>
						 </label>  
					</dt>
					<dd>
					<% List<Map<String,Object>> subMenu = (List<Map<String,Object>>)m.get("subMenu"); %>
							<% for(Map<String,Object> s : subMenu) { %>
							<dl class="cl permission-list2">
								<dt>
									<label class="">
											<% if(s.get("submenu") != null && s.get("submenu").equals(true)) { %>
								       			<input type="checkbox" value="<%=s.get("id") %>" checked="checked" name="check" id="user-Character-0">  
								       			<%=s.get("name") %>
								       		<% } else { %>
								       			<input type="checkbox" value="<%=s.get("id") %>"  name="check" id="user-Character-0">  
								       			<%=s.get("name") %>
								       		<% } %>
										<% List<Map<String,Object>> funMenu = (List<Map<String,Object>>)s.get("funMenu"); %>
											<% for(Map<String,Object> f : funMenu) { %>
													<% if(f.get("funmenu") != null && f.get("funmenu").equals(true)) { %>
										       			<input type="checkbox" value="<%=f.get("id") %>" checked="checked" name="check" id="user-Character-0">  
										       			<%=f.get("name") %>
										       		<% } else { %>
										       			<input type="checkbox" value="<%=f.get("id") %>"  name="check" id="user-Character-0">  
										       			<%=f.get("name") %>
										       		<% } %>
											<% } %>
										 
									</label>
								</dt>
							</dl>
						<% } %>
					</dd>
				</dl>
				<% } %>
			</div>
		</div>
		<input type="hidden" value="${role.id }" name="id">
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
        $.post("${ctx }/role/updateRole", d, function (result) { 
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