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
    <p class="f-20 text-success">欢迎使用后台管理系统 <span class="f-14">v2.3</span></p>
    <p>登录次数：${count }&nbsp;&nbsp; 当前在线人数：<span id="count"></span></p>
    <p>上次登录IP：${ip }&nbsp; &nbsp; 上次登录时间：${last_time }</p>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th colspan="7" scope="col">信息统计</th>
        </tr>
        <tr class="text-c">
            <th>浏览器类型</th>
            <th>操作系统</th>
            <th>IP地址</th>
            <th>创建时间</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ data }" var="d">
            <tr class="text-c">
                <td>${d.BROWSER }</td>
                <td>${d.OS }</td>
                <td>${d.IP }</td>
                <td>${d.tim }</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script type="text/javascript" src="${ctx }/resources/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/H-ui.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        setInterval(getnums, 1000);
    });
    getnums();
    function getnums() {
        $.get("${ctx}/sessioncount/index", function (data) {
                    $("#count").text(data.count);
                }
        );
    }
</script>
</body>
</html>