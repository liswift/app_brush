    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE HTML>
        <html>
        <head>
        <meta charset="utf-8">
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <!--[if lt IE 9]>
        <script type="text/javascript" src="${ctx}/resources/lib/html5.js"></script>
        <script type="text/javascript" src="${ctx}/resources/lib/respond.min.js"></script>
        <script type="text/javascript" src="${ctx}/resources/lib/PIE_IE678.js"></script>
        <![endif]-->
        <link href="${ctx}/resources/css/H-ui.min.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/resources/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/resources/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/resources/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/resources/css/task-style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/resources/lib/webuploader/0.1.5/webuploader.css">
        <!--[if IE 6]>
        <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
        <script>DD_belatedPNG.fix('*');</script>
        <![endif]-->
        <title>添加动作</title>
        </head>
        <body>
        <div class="add-task-form form-horizontal" style="padding-bottom:50px">
        <div class="row cl">
        <label class="form-label col-xs-2 col-sm-2">页面名称：${taskId},${pageId}</label>
        <div class="col-xs-10 col-sm-10">
        <input type="text" task_name="name" class="input-text" autocomplete="off">
        </div>
        </div>
        <div class="row cl">
        <label class="form-label col-xs-2 col-sm-2">页面描述：</label>
        <div class="col-xs-10 col-sm-10">
        <textarea type="text"  task_name="version" class="textarea" autocomplete="off"></textarea>
        </div>
        </div>
        <div class="row cl">
        <label class="form-label col-xs-2 col-sm-2">操作动作：</label>
        <div class="col-xs-10 col-sm-10 unit-action-box" id="unit-action-box">
        <button action_id="0" class="btn btn-default radius"><span>actionAactionA</span><i class="unit-action-del"></i></button>
        <button action_id="1" class="btn btn-default radius"><span>actionA12</span><i class="unit-action-del"></i></button>
        <button action_id="2" class="btn btn-default radius"><span>actionA</span><i class="unit-action-del"></i></button>
        <button action_id="3" class="btn btn-default radius"><span>action32A</span><i class="unit-action-del"></i></button>
        <button action_id="4" class="btn btn-default radius"><span>action32Aactions</span><i class="unit-action-del"></i></button>
        <button action_id="5" class="btn btn-default radius"><span>actionAactions</span><i class="unit-action-del"></i></button>
        <button action_id="6" class="btn btn-default radius"><span>action43A</span><i class="unit-action-del"></i></button>
        <button action_id="7" class="btn btn-default radius"><span>action411A</span><i class="unit-action-del"></i></button>
        <button action_id="8" class="btn btn-default radius"><span>actionA</span><i class="unit-action-del"></i></button>
        <button action_id="9" class="btn btn-default radius"><span>action1222A</span><i class="unit-action-del"></i></button>
        <button action_id="10" class="btn btn-default radius"><span>actionA</span><i class="unit-action-del"></i></button>
        <button action_id="11" class="btn btn-default radius"><span>actionA</span><i class="unit-action-del"></i></button>
        <button action_id="12" class="btn btn-default radius"><span>actionA</span><i class="unit-action-del"></i></button>
        <button action_id="13" class="btn btn-default radius"><span>actionA</span><i class="unit-action-del"></i></button>
        <button class="btn btn-primary radius" add_btn style="padding: 0 20px">+</button>
        </div>
        </div>
        <div class="row cl">
        <label class="form-label col-xs-2 col-sm-2">动作组：</label>
        <div class="col-xs-10 col-sm-10 group-action-box" id="group-action-box">
        <div class="groups-box">

        </div>
        <div  class="group-action-add">
        <button id="group-action-add" class="btn btn-primary radius">+添加动作组 </button>
        </div>
        </div>
        </div>
        <div class="row cl" style="margin-top:50px">
        <div class="col-xs-10 col-sm-10 col-xs-offset-4 col-sm-offset-5">
        <input id="action-group-add-btn" class="btn btn-primary radius" type="submit" style="width: 90px" value="提交">
        </div>
        </div>
        </div>

        <!--
        <div class="new-action-box">
        <div class="add-task-form form-horizontal">
        <div class="row cl">
        <div class="formControls col-xs-8 col-sm-8">
        <label class="form-label col-xs-3 col-sm-3">名称：</label>
        <div class="formControls col-xs-9 col-sm-9">
        <input type="text" task_name="name"  class="input-text" autocomplete="off">
        </div>
        </div>
        </div>
        <div class="row cl">
        <div class="formControls col-xs-8 col-sm-8">
        <label class="form-label col-xs-3 col-sm-3">View类名：</label>
        <div class="formControls col-xs-9 col-sm-9">
        <input type="text"  action_name="version"  class="input-text" autocomplete="off">
        </div>
        </div>
        </div>
        <div class="row cl">
        <div class="formControls col-xs-8 col-sm-8">
        <label class="form-label col-xs-3 col-sm-3">ViewID：</label>
        <div class="formControls col-xs-9 col-sm-9">
        <input type="text" action_name="memo"  class="input-text" autocomplete="off">
        </div>
        </div>
        </div>
        <div class="row cl">
        <div class="formControls col-xs-8 col-sm-8">
        <label class="form-label col-xs-3 col-sm-3">View内容：</label>
        <div class="formControls col-xs-9 col-sm-9">
        <input type="text" action_name="memo"  class="input-text" autocomplete="off">
        </div>
        </div>
        </div>
        <div class="row cl">
        <div class="formControls col-xs-8 col-sm-8">
        <label class="form-label col-xs-3 col-sm-3">动作：</label>
        <div class="formControls col-xs-9 col-sm-9">
        <span class="select-box">
        <select class="select" size="1" name="actions">
        <option value="" selected>默认select</option>
        <option value="1">菜单一</option>
        <option value="2">菜单二</option>
        <option value="3">菜单三</option>
        </select>
        </span>
        </div>
        </div>
        </div>
        <div class="row cl">
        <label class="form-label col-xs-2 col-sm-2">动作参数：</label>
        <div class="col-xs-6 col-sm-6" id="action-params-box" style="margin-left:-5px">

        <button class="btn btn-primary radius param-add-btn" style="padding: 0 20px;">+</button>
        </div>
        </div>
        <div class="row cl">
        <div class="formControls col-xs-4 col-sm-4">
        <label class="form-label col-xs-6 col-sm-6">停留时间：</label>
        <div class="formControls col-xs-3 col-sm-3">
        <input type="text"  action_name="daily_new"  style="margin-left: 2px" class="input-text" autocomplete="off">
        </div>
        <label class="form-label col-xs-3 col-sm-3">秒，</label>
        </div>
        <div class="formControls col-xs-4 col-sm-4">
        <label class="form-label col-xs-5 col-sm-5">波动范围：</label>
        <div class="formControls col-xs-3 col-sm-3">
        <input type="text"  action_name="daily_new_range" class="input-text" autocomplete="off">
        </div>
        <label class="form-label col-xs-3 col-sm-3">秒</label>
        </div>
        </div>
        <div class="row cl" style="margin-top:50px">
        <div class="col-xs-10 col-sm-10 col-xs-offset-2 col-sm-offset-2">
        <input id="action-confirm-btn" class="btn btn-primary radius" type="submit" style="width: 90px;margin-left:-5px" value="确定">
        <input id="action-cancel-btn" class="btn btn-default radius" type="submit" style="width: 90px;margin-left:150px" value="取消">
        </div>
        </div>
        </div>
        </div>-->

        <div id="editActionModal" class="modal hide fade edit-action-dlg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <!-- <div class="modal-header">
        <h3 id="editActionLabel">添加动作</h3><a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
        </div>
        <div class="modal-body" style="overflow: hidden" id="edit-modal-body" >
        <div class="add-task-form form-horizontal"  style="width: 700px;max-height: 450px;overflow: auto">
        <div class="row cl">
        <div class="formControls col-xs-8 col-sm-8">
        <label class="form-label col-xs-3 col-sm-3">名称：</label>
        <div class="formControls col-xs-9 col-sm-9">
        <input type="text" task_name="name"  class="input-text" autocomplete="off">
        </div>
        </div>
        </div>
        <div class="row cl">
        <div class="formControls col-xs-8 col-sm-8">
        <label class="form-label col-xs-3 col-sm-3">View类名：</label>
        <div class="formControls col-xs-9 col-sm-9">
        <input type="text"  action_name="class"  class="input-text" autocomplete="off">
        </div>
        </div>
        </div>
        <div class="row cl">
        <div class="formControls col-xs-8 col-sm-8">
        <label class="form-label col-xs-3 col-sm-3">ViewID：</label>
        <div class="formControls col-xs-9 col-sm-9">
        <input type="text" action_name="id"  class="input-text" autocomplete="off">
        </div>
        </div>
        </div>
        <div class="row cl">
        <div class="formControls col-xs-8 col-sm-8">
        <label class="form-label col-xs-3 col-sm-3">View内容：</label>
        <div class="formControls col-xs-9 col-sm-9">
        <input type="text" action_name="content"  class="input-text" autocomplete="off">
        </div>
        </div>
        </div>
        <div class="row cl">
        <div class="formControls col-xs-8 col-sm-8">
        <label class="form-label col-xs-3 col-sm-3">动作：</label>
        <div class="formControls col-xs-9 col-sm-9">
        <span class="select-box">
        <select class="select" size="1" name="actions" action_name="action">
        <option value="" selected>默认select</option>
        <option value="1">菜单一</option>
        <option value="2">菜单二</option>
        <option value="3">菜单三</option>
        </select>
        </span>
        </div>
        </div>
        </div>
        <div class="row cl">
        <label class="form-label col-xs-2 col-sm-2">动作参数：</label>
        <div class="col-xs-6 col-sm-6" id="action-params-box" style="margin-left:-5px">

        <button class="btn btn-primary radius param-add-btn" style="padding: 0 20px;">+</button>
        </div>
        </div>
        <div class="row cl">
        <div class="formControls col-xs-4 col-sm-4">
        <label class="form-label col-xs-6 col-sm-6">停留时间：</label>
        <div class="formControls col-xs-3 col-sm-3">
        <input type="text"  action_name="duration"  style="margin-left: 2px" class="input-text" autocomplete="off">
        </div>
        <label class="form-label col-xs-3 col-sm-3">秒，</label>
        </div>
        <div class="formControls col-xs-4 col-sm-4">
        <label class="form-label col-xs-5 col-sm-5">波动范围：</label>
        <div class="formControls col-xs-3 col-sm-3">
        <input type="text"  action_name="range" class="input-text" autocomplete="off">
        </div>
        <label class="form-label col-xs-3 col-sm-3">秒</label>
        </div>
        </div>
        <div class="row cl" style="margin-top:50px">
        <div class="col-xs-10 col-sm-10 col-xs-offset-1 col-sm-offset-1">
        <input id="action-confirm-btn" class="btn btn-primary radius" type="submit" style="width: 90px;margin-left:-5px" value="确定">
        <input id="action-cancel-btn" class="btn btn-default radius" type="submit" data-dismiss="modal" aria-hidden="true" style="width: 90px;margin-left:150px" value="取消">
        </div>
        </div>
        </div>
        </div>-->
        </div>

        <div id="delActionModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
        <h3 id="delLabel">删除确认</h3><a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
        </div>
        <div class="modal-body">
        <p>确定要删除该动作吗?</p>
        </div>
        <div class="modal-footer">
        <button id="del-confirm" class="btn btn-primary">删除</button> <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
        </div>
        </div>

        <div id="delGroupModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
        <h3 id="delGroupLabel">删除确认</h3><a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
        </div>
        <div class="modal-body">
        <p>确定要删除该动作组吗?</p>
        </div>
        <div class="modal-footer">
        <button id="del-group-confirm" class="btn btn-primary">删除</button> <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
        </div>
        </div>

        <div id="renameModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
        <h3 id="renameLabel">修改动作组名称</h3><a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
        </div>
        <div class="modal-body">
        <input type="text" class="input-text" autocomplete="off">
        </div>
        <div class="modal-footer">
        <button id="rename-confirm" class="btn btn-primary">修改</button> <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
        </div>
        </div>

        <script type="text/javascript" src="${ctx}/resources/lib/jquery/1.9.1/jquery.min.js"></script>
        <script type="text/javascript" src="${ctx}/resources/js/common.js"></script>
        <script type="text/javascript" src="${ctx}/resources/lib/bootstrap-modal/2.2.4/bootstrap-modalmanager.js"></script>
        <script type="text/javascript" src="${ctx}/resources/lib/bootstrap-modal/2.2.4/bootstrap-modal.js"></script>
        <script type="text/javascript" src="${ctx}/resources/js/H-ui.js"></script>
        <script type="text/javascript" src="${ctx}/resources/lib/webuploader/0.1.5/webuploader.js"></script>
        <script type="text/javascript" src="${ctx}/resources/js/action.js"></script>

        </body>
        </html>