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
<script type="text/javascript" src="lib/PIE-2.0beta1/PIE_IE678.js"></script>
<![endif]-->
<link href="${ctx }/resources/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/resources/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/resources/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="${ctx }/resources/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>设置唤醒</title>
</head>
<body>
<div class="pd-20">
  <form action="${ctx }/tasksetup/addoup" method="post" class="form form-horizontal" id="form-member-add">
   	<div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>用户名：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text" value="${taskSetup.maxNum}" placeholder="" name="name" datatype="n" nullmsg="不能为空" errormsg="请输入数字">
      </div>
      <div class="col-4"> </div>
    </div>

    <div class="row cl">
      <div class="col-9 col-offset-3">
        <input class="btn btn-primary radius" id="save" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
      </div>
    </div>
    <div hidden>
      <input disabled hidden type="text" value="${taskSetup.id}" name="id">
      <input disabled hidden type="text" value="${taskSetup.taskId}" name="taskId">
    </div>
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
	<%--$("#save").click(function() {--%>
	    <%--var d= $("#form-member-add").serialize();--%>
        <%--$.post("${ctx }/tasksetup/addoup", d, function (result) {--%>
        	<%--parent.location.reload(); --%>
        	<%--layer_close();--%>
        <%--}, "text");--%>
	<%--});--%>

	$("#form-member-add").Validform({
      btnSubmit:"#save",
      ajaxPost:true,
      tiptype:2,
      callback:function(data){
        console.info(data);
        var index = parent.layer.getFrameIndex(window.name);
        parent.$('.btn-refresh').click();
        parent.layer.close(index);
      }
	});
});
</script>
</body>
</html>