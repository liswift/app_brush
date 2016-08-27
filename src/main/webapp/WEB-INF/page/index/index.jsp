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
<LINK rel="Bookmark" href="${ctx }/resources/favicon.ico" >
<LINK rel="Shortcut Icon" href="${ctx }/resources/favicon.ico" />

<script type="text/javascript" src="${ctx }/resources/lib/html5.js"></script>
<script type="text/javascript" src="${ctx }/resources/lib/respond.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/lib/PIE_IE678.js"></script>

<link href="${ctx }/resources/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/resources/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/resources/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/resources/skin/default/skin.css" rel="stylesheet" type="text/css" id="skin" />
<link href="${ctx }/resources/css/style.css" rel="stylesheet" type="text/css" />

<title>酒店管理系统 v2.3</title>
<meta name="keywords" content="H-ui.admin v2.3,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v2.3，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<header class="Hui-header cl"> <a class="Hui-logo l" title="H-ui.admin v2.3" href="${ctx }/resources/skin/">酒店管理系统</a> <a class="Hui-logo-m l" href="${ctx }/resources/skin/" title="H-ui.admin"></a> <span class="Hui-subtitle l">V2.3</span>
	<ul class="Hui-userbar">
		<li>超级管理员</li>
		<li class="dropDown dropDown_hover"><a href="#" class="dropDown_A" <i class="Hui-iconfont">&#xe6d5;</i></a>
			<ul class="dropDown-menu radius box-shadow">
				<li><a href="javascript:;" onclick="forget('修改密码','${ctx }/sys/forget','1','500','400')" href="">修改密码</a></li>
				<li><a href="${ctx }/sys/logout">切换账户</a></li>
				<li><a href="${ctx }/sys/logout">退出</a></li>
			</ul>
		</li>
		<li id="Hui-msg"> <a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>
		<li id="Hui-skin" class="dropDown right dropDown_hover"><a href="javascript:;" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
			<ul class="dropDown-menu radius box-shadow">
				<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
				<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
				<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
				<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
				<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
				<li><a href="javascript:;" data-val="orange" title="绿色">橙色</a></li>
			</ul>
		</li>
	</ul>
	<a href="javascript:;" class="Hui-nav-toggle Hui-iconfont" aria-hidden="false">&#xe667;</a> </header>
<aside class="Hui-aside">
	<input runat="server" id="divScrollValue" type="hidden" value="" />
	<div class="menu_dropdown bk_2">
		<c:forEach items="${ data }" var="permission" varStatus="status">
			<dl id="menu-system">
				<c:if test="${permission.pid==null}">
					<dt><i class="Hui-iconfont">${permission.icon }</i> ${permission.name }<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
					<dd>
						<c:forEach items="${data }" var="p">
							<c:if test="${permission.id == p.pid }">
								<ul>
									<li><a _href="${p.url }" data-title="${permission.name }" href="javascript:void(0)">${p.name }</a></li>
								</ul>
							</c:if>
						</c:forEach>
					</dd>
				</c:if>
			</dl>
		</c:forEach>
	</div>
</aside>
<div class="dislpayArrow"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="首页" data-href="welcome.html">首页</span><em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="${ctx }/sys/welcome"></iframe>
		</div>
	</div>
</section>
<script type="text/javascript" src="${ctx }/resources/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${ctx }/resources/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${ctx }/resources/js/H-ui.js"></script> 
<script type="text/javascript" src="${ctx }/resources/js/H-ui.admin.js"></script> 
<script type="text/javascript">
function forget(title,url,id,w,h){
	layer_show(title,url,w,h);
}
</script>
</body>
</html>