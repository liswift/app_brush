<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="${ctx }/resources/css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx }/resources/css/H-ui.admin.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx }/resources/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css"/>
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>我的桌面</title>
</head>
<body>
<div class="pd-20" style="padding-top:20px;">
    <p class="f-20 text-success">欢迎您, <span class="f-14">${userAccountVo.userRealName}</span></p>
    <p>帐户余额：${userAccountVo.pointCount},
        今日所需点数：${userAccountVo.todayPointNeed}点，明日所需点数：${userAccountVo.tomorrowPointNeed}点
        <a class="btn btn-primary radius" href="javascript:;"
           onclick="admin_role_add('充值','${ctx}/role/toAddRole','800')">
            <i class="Hui-iconfont">&#xe600;</i> 充值</a>
    </p>
    <div class="cl pd-5 bg-1 bk-gray">
        <span class="l">
            <a class="btn btn-primary radius" href="javascript:;"
               onclick="fullOpen('添加任务','${ctx}/task/toAdd')">
                <i class="Hui-iconfont">&#xe600;</i> 添加任务</a> </span>
    </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-sort">
            <thead>
            <tr>
                <th colspan="9" scope="col">定时任务管理</th>
            </tr>
            <tr class="text-c">
                <th>任务id</th>
                <th>任务名</th>
                <th>上传时间</th>
                <th>预设量</th>
                <th>预设金额(单价点)</th>
                <th>今日量</th>
                <th>昨日量</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ tasks }" var="t">
                <tr class="text-c">
                    <td>${t.id}</td>
                    <td>${t.appName}</td>
                    <td>${t.createTime}</td>
                    <td>${t.incrDay}</td>
                    <td>${t.amount}</td>
                    <td>${t.todayNum}</td>
                    <td>${t.yestodayNum}</td>
                    <td>${t.state}</td>
                    <td>
                        <a href="javascript:;"
                           onclick="fullOpen('编辑任务','${ctx}/task/toEdit?id=${t.id}')">编辑</a>
                        <a href="${ctx}/task/delete?id=${t.id}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript" src="${ctx }/resources/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/common.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/task.js"></script>
<script type="text/javascript">
</script>
</body>
</html>