<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <lable>${task.appVersion}</lable>
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
    <div class="cl pd-5 bg-1 bk-gray"><span class="l">  <a class="btn btn-primary radius" href="javascript:;"
                                                           onclick="fullOpen('添加页动作','${ctx}/audit/toAddPageAction?id=${task.id}')"><i
            class="Hui-iconfont">&#xe600;</i> 添加页动作</a> </span></div>
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
                <td>${fn:length(t.actionGroupVos)}</td>
                <c:choose>
                    <c:when test="${t.enable=='1'}">
                        <td>启用中</td>
                        <td>
                            <a href="javascript:;"
                               onclick="fullOpen('编辑页动作','${ctx}/audit/toAddPageAction?id=${t.taskId}&pageId=${t.id}')">编辑</a>
                            <a href="javascript:;"
                               onclick="javascript:funReflocak(${t.id},${t.taskId},'deleteActionPage');">删除</a>
                            <a href="javascript:;"
                               onclick="javascript:funReflocak(${t.id},${t.taskId},'disable');">禁用</a>
                        </td>
                    </c:when>
                    <c:otherwise>
                        <td>禁用中</td>
                        <td>
                            <a href="javascript:;"
                               onclick="fullOpen('编辑页动作','${ctx}/audit/toAddPageAction?id=${t.taskId}&pageId=${t.id}')">编辑</a>
                            <a href="javascript:;"
                               onclick="javascript:funReflocak(${t.id},${t.taskId},'deleteActionPage');">删除</a>
                            <a href="javascript:;"
                               onclick="javascript:funReflocak(${t.id},${t.taskId},'enable');">启用</a>
                        </td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<input class="btn btn-primary size-M radius" type="button" value="通过"><!--通过传递/audit/changeState id,state 2-->
<input class="btn btn-primary size-M radius" type="button" value="拒绝"><!--通过传递/audit/changeState id,state 0,msg:应用非法-->
<input class="btn btn-default size-M radius" type="button" value="放回"><!--/audit/release id-->

<script type="text/javascript" src="${ctx }/resources/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/common.js"></script>
<script type="text/javascript">

    function funReflocak(pageId,taskId, action) {
        var param = {};
        param.pageId = pageId;
        ajaxPost('${ctx}/audit/' + action, param, function (d) {
            window.location.href='${ctx}/audit/editorTask?id='+taskId;
        }, function (res) {
            layer.msg("操作失败")
        });
    }


    function forget(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

</script>
</body>
</html>