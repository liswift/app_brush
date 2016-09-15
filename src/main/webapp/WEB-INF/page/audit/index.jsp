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
                   <lable>${task.apkUrl}</lablel>
                </div>
            </div>
        </div>

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