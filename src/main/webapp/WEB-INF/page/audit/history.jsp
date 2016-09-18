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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 任务记录 <a
        class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px"
        href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20" style="padding-top:20px;">

    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-sort" id=task-list-table>
            <thead>
            <tr>
                <th colspan="5" scope="col">任务记录</th>
            </tr>
            <tr class="text-c">
                <th>ID</th>
                <th>应用名称</th>
                <th>应用版本</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ tasks }" var="t">
                <tr class="text-c">
                    <td>${t.id}</td>
                    <td>${t.appName}</td>
                    <td>${t.appVersion}</td>
                    <td>${t.createTime}</td>
                    <c:choose>
                        <c:when test="${t.state=='-1'}">
                            <td>
                                <a href="javascript:;"
                                   onclick="fullOpen('编辑任务详情','${ctx}/audit/editorTask?id=${t.id}')">编辑</a>
                                <a option_id="${t.id}" option_a='2' href="javascript:;">通过</a>
                                <!--通过传递/audit/changeState id,state 2-->
                                <a option_id="${t.id}" option_a='0' href="javascript:;">拒绝</a>
                                <!--通过传递/audit/changeState id,state 0,msg:应用非法-->
                                <a option_id="${t.id}" option_a='-1' href="javascript:;">放回</a><!--/audit/release id-->
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td>
                                <a href="javascript:;" onclick="fullOpen('查看任务详情','${ctx}/audit/toViewTask?id=${t.id}')">查看</a>
                            </td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div id="denyModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="denyLabel">拒绝理由</h3><a class="close" data-dismiss="modal" aria-hidden="true"
                                       href="javascript:void();">×</a>
    </div>
    <div class="modal-body">
        <input type="text" class="input-text" autocomplete="off">
    </div>
    <div class="modal-footer">
        <button id="deny-confirm" class="btn btn-primary">确定</button>
        <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
    </div>
</div>
<script type="text/javascript" src="${ctx }/resources/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${ctx }/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/common.js"></script>
<script type="text/javascript">
    $(function () {

        var $denyModal = $("#denyModal");
        var $denyInput = $("input", $denyModal);
        var currentDenyParams = {};
        $('.table-sort').dataTable({
            "aaSorting": [[3, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 1, 2, 4]}// 制定列不参与排序
            ]
        });

        $("#task-list-table").on('click', 'a[option_a]', function (e) {
            e.stopPropagation();
            var status = $(this).attr('option_a');
            var id = $(this).attr('option_id');
            var url = name == 'release' ? '/audit/release' : '/audit/changeState';
            var params = {id: id};
            status != '-1' && (params.state = +status);
            if (status == '0') {
                denyAction(params);
            } else {
                var uri = status == '2' ? '/audit/changeState' : '/audit/release';
                ajaxPost(uri, params, function (d) {
                    window.location.reload();
                }, function (res) {
                    layer.msg(res.msg)
                    //删除请求失败:
                });
            }

        });

        $("#deny-confirm").click(function (e) {
            var txt = $denyInput.val().trim();
            currentDenyParams.msg = txt;
            ajaxPost('/audit/changeState', currentDenyParams, function (d) {
                window.location.reload();
            }, function (res) {
                layer.msg(d.msg)
                //删除请求失败:
            });
            $denyModal.modal('hide');
        });

        function denyAction(params) {
            currentDenyParams = params;
            $denyModal.modal('show');
        }
    });
</script>
</body>
</html>