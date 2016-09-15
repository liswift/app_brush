<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <script type="text/javascript" src="lib/PIE-2.0beta1/PIE_IE678.js"></script>
    <![endif]-->
    <link href="${ctx}/resources/css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/resources/css/H-ui.admin.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/resources/lib/icheck/icheck.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/resources/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/resources/css/task-style.css" rel="stylesheet" type="text/css"/>
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>审核任务</title>
</head>
<body>
<div class="add-task-form form-horizontal">

    <div class="row cl">
        <div class="formControls col-xs-6 col-sm-6">
            <label class="form-label col-xs-4 col-sm-4">应用名称：</label>
            <div class="formControls col-xs-8 col-sm-8">
               <label>${task.appName}</label>
            </div>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-6 col-sm-6">
            <label class="form-label col-xs-4 col-sm-4">应用版本：</label>
            <div class="formControls col-xs-8 col-sm-8">
               <lable>${task.appVersion}</ablel>
            </div>
        </div>
    </div>
      <div class="row cl">
            <div class="formControls col-xs-6 col-sm-6">
                <label class="form-label col-xs-4 col-sm-4">应用软件包：</label>
                <div class="formControls col-xs-8 col-sm-8">
                   <a href=${task.apkUrl}>点击下载</a>
                </div>
            </div>
        </div>

</div>

<div class="pd-20">
	<div class="cl pd-5 bg-1 bk-gray"> <span class="l">  <a class="btn btn-primary radius" href="javascript:;" onclick="fullOpen('添加页动作','${ctx}/audit/toAddPageAction?id=${task.id}')" ><i class="Hui-iconfont">&#xe600;</i> 添加页动作</a> </span>  </div>
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="5">页动作</th>
			</tr>
		    <tr class="text-c">
                        <th>页面(Action/Dialog/PopuWindow)</th>
                        <th>描述</th>
                        <th>动作组数量</th>
                        <th>状态</th>
                        <th>操作</th>
            </tr>
        </thead>
            <tbody>
                    <c:forEach items="${ actionPages }" var="t">
                        <tr class="text-c">
                            <td>${t.pageName}</td>
                            <td>${t.pageDesc}</td>
                            <td>${fn:length(t.actionGroupVos)}/td>
                            <c:choose>
                              <c:when test="${t.enable=='1'}">
                                  <td>启用中</td>
                                  <td>
                                     <a href="javascript:;"
                                     onclick="fullOpen('编辑','${ctx}/task/toEdit?id=${t.id}&ac=editor')">编辑</a>
                                     <a href="${ctx}/audit/disable?pageId=${t.id}">禁用</a>
                                  </td>
                              </c:when>
                              <c:otherwise>
                                   <td>禁用中</td>
                                   <td>
                                       <a href="javascript:;"
                                     onclick="fullOpen('编辑','${ctx}/task/toEdit?id=${t.id}&ac=editor')">编辑</a>
                                          <a href="${ctx}/audit/enable?pageId=${t.id}">>启用</a>
                                   </td>
                              </c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
            </tbody>
	</table>
</div>

<script type="text/javascript" src="${txt}/resources/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${txt}/resources/lib/laydate/laydate.js"></script>
<script type="text/javascript" src="${txt}/resources/js/common.js"></script>
<script type="text/javascript" src="${txt}/resources/lib/bootstrap-modal/2.2.4/bootstrap-modalmanager.js"></script>
<script type="text/javascript" src="${txt}/resources/lib/bootstrap-modal/2.2.4/bootstrap-modal.js"></script>
<script type="text/javascript" src="${txt}/resources/lib/webuploader/0.1.5/webuploader.js"></script>
<script type="text/javascript" src="${txt}/resources/js/common.js"></script>
<script type="text/javascript" src="${txt}/resources/js/task.js"></script>
</body>
</html>