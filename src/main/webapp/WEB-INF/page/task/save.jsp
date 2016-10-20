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
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/lib/webuploader/0.1.5/webuploader.css">
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>添加任务</title>
</head>
<body>
<div class="add-task-form form-horizontal">
    <c:if test="${task == null}">
        <div class="add-task-item">
            <span><span class="required-dot">*</span>应用apk文件：</span>
            <span class="btn-upload" style="margin-left:10px" id="select-file">
               <a href="javascript:void(0);" class="btn btn-primary radius">上传应用</a>
        </span>
            <div class="progress task-progress">
                <div class="progress-bar" id="progress-bar">
                    <span class="task-progress-tint">0%</span>
                    <span class="sr-only" style="width:0%"></span>
                </div>
            </div>
        </div>
        <div class="row cl">
            <div class="formControls col-xs-6 col-sm-6">
                <label class="form-label col-xs-4 col-sm-4">应用包名：</label>
                <div class="formControls col-xs-8 col-sm-8">
                    <input type="text" task_name="packageName" value="${task.packageName}" class="input-text" id="packageName"
                           autocomplete="off" readonly="readonly">
                </div>
            </div>
        </div>
        <div class="row cl">
            <div class="formControls col-xs-6 col-sm-6">
                <label class="form-label col-xs-4 col-sm-4">应用版本：</label>
                <div class="formControls col-xs-8 col-sm-8">
                    <input type="text" task_name="appVersion" value="${task.appVersion}" class="input-text" id="appVersion"
                           autocomplete="off" readonly="readonly">
                </div>
            </div>
        </div>
    </c:if>
    <div class="row cl">
        <div class="formControls col-xs-6 col-sm-6">
            <label class="form-label col-xs-4 col-sm-4">备注名称：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" task_name="remarkName" value="${task.remarkName}" class="input-text"
                       autocomplete="off">
            </div>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-4 col-sm-4">
            <label class="form-label col-xs-6 col-sm-6">每日新增用户：</label>
            <div class="formControls col-xs-3 col-sm-3">
                <input type="text" task_name="incrDay" value="${task.incrDay}" class="input-text"
                       autocomplete="off">
            </div>
            <label class="form-label col-xs-3 col-sm-3">个，</label>
        </div>
        <div class="formControls col-xs-4 col-sm-4">
            <label class="form-label col-xs-6 col-sm-6">上下波动范围：</label>
            <div class="formControls col-xs-3 col-sm-3">
                <input type="text" task_name="incrUpDown" value="${task.incrUpDown}" class="input-text"
                       autocomplete="off">
            </div>
            <label class="form-label col-xs-3 col-sm-3">个</label>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-4 col-sm-4">
            <label class="form-label col-xs-6 col-sm-6">应用运行时长：</label>
            <div class="formControls col-xs-3 col-sm-3">
                <input type="text" task_name="runTime" value="${task.runTime}" class="input-text"
                       autocomplete="off">
            </div>
            <label class="form-label col-xs-3 col-sm-3">秒，</label>
        </div>
        <div class="formControls col-xs-4 col-sm-4">
            <label class="form-label col-xs-6 col-sm-6">上下波动范围：</label>
            <div class="formControls col-xs-3 col-sm-3">
                <input type="text" task_name="runUpDown" value="${task.runUpDown}" class="input-text"
                       autocomplete="off">
            </div>
            <label class="form-label col-xs-3 col-sm-3">秒</label>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-6 col-sm-6">
            <label class="form-label col-xs-4 col-sm-4">投放时间：</label>
            <div class="formControls col-xs-3 col-sm-3">
                <input type="text" task_name="runStartTime" value="${task.runStartTime}" class="input-text"
                       autocomplete="off">
            </div>
            <label class="form-label col-xs-1 col-sm-1" style="text-align: center;">—</label>
            <div class="formControls col-xs-3 col-sm-3">
                <input type="text" task_name="runEndTime" value="${task.runEndTime}" class="input-text"
                       autocomplete="off">
            </div>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-2 col-sm-2">每日投放速度：</label>
        <div id="daily-speed" class="HuiTab formControls col-xs-10 col-sm-10" style="margin-left:-4px">
            <div class="tabBar cl tabBar-1" task_name="runSpeed">
                <span task_value="0" <c:if test="${task.runSpeed eq 0}">class="speed-select" </c:if>>最快投放</span>
                <span task_value="1" <c:if test="${task.runSpeed eq 1}">class="speed-select" </c:if>>均匀投放</span>
            </div>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-2 col-sm-2">留存率：</label>
        <div id="daily-stay" class="HuiTab formControls col-xs-8 col-sm-8" style="margin-left:-4px">
            <div class="tabBar cl tabBar-1" task_name="retainDay">
                <span task_value="0"
                      <c:if test="${task.retainDay eq 0}">class="speed-select" </c:if> >无留存</span>
                <span task_value="1" <c:if test="${task.retainDay eq 1}">class="speed-select" </c:if>>1天</span>
                <span task_value="7" <c:if test="${task.retainDay eq 7}">class="speed-select" </c:if>>7天</span>
                <span task_value="14" <c:if test="${task.retainDay eq 14}">class="speed-select" </c:if>>14天</span>
                <span task_value="30" <c:if test="${task.retainDay eq 30}">class="speed-select" </c:if>>30天</span>
                <span task_value="60" <c:if test="${task.retainDay eq 60}">class="speed-select" </c:if>>60天</span>
            </div>
        </div>
        <div class="formControls col-xs-2 col-sm-2" style="margin-left: 2px">
            <input task_name="retainPercent" maxlength="2" type="text" class="input-text" autocomplete="off"
                   style="width:60px" value="${task.retainPercent}">
            <label>%</label>
        </div>
    </div>
    <div class="row cl">
        <div class="col-xs-10 col-sm-10 col-xs-offset-4 col-sm-offset-5">
            <input id="task-add-btn" class="btn btn-primary radius" type="submit" style="width: 90px" value="提交">
        </div>
    </div>
</div>


<div aria-hidden="true">
    <input type="hidden" task_name="id" class="input-text" hidden value="${task.id}"
           autocomplete="off" readonly="readonly">
    <c:if test="${task ==null}"><!--task 等于空说明是新增,新增得时候显示,修改不显示包相关信息-->
        <input type="hidden" task_name="apkUrl" class="input-text" hidden value="${task.apkUrl}" id="apkUrl"
               autocomplete="off" readonly="readonly">
        <input type="hidden" task_name="versionCode" class="input-text" hidden value="${task.versionCode}" id="versionCode"
               autocomplete="off" readonly="readonly">
        <input type="hidden" task_name="minSdkVersion" class="input-text" hidden value="${task.minSdkVersion}" id="minSdkVersion"
               autocomplete="off" readonly="readonly"><!--minSdkVersion-->
    </c:if>
</div>

<script type="text/javascript" src="${ctx}/resources/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/lib/laydate/laydate.js"></script>
<script type="text/javascript" src="${ctx}/resources/lib/bootstrap-modal/2.2.4/bootstrap-modalmanager.js"></script>
<script type="text/javascript" src="${ctx}/resources/lib/bootstrap-modal/2.2.4/bootstrap-modal.js"></script>
<script type="text/javascript" src="${ctx}/resources/lib/webuploader/0.1.5/webuploader.js"></script>
<script type="text/javascript" src="${ctx}/resources/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/common.js"></script>
<script>
    $(document).ready(function () {
        $('#daily-speed,#daily-stay').on('click', 'span', function () {
            var self = $(this);
            self.addClass('speed-select').siblings().removeClass('speed-select');
        });

        var params = {};
        $('#task-add-btn').on('click', function (e) {
            if (state == 'uploading') {
                layer.msg('等待上传完成!');
                return;
            }
            $("[task_name]").each(function (index, item) {
                item = $(item);
                var name = item.attr('task_name');
                if (item.is('input')) {
                    params[name] = item.val();
                }
                else if (name == 'runSpeed' || name == 'retainDay') {
                    params[name] = $('span.speed-select', item).attr('task_value');
                }
            });
            ajaxPost('/task/save', params, function (d) {
                layer.msg('更新成功!');
                parent.location.reload();
                layer_close();
            }, function (d) {
                layer.msg('更新失败!')
            });
        });

        //上传文件
        var uploader = WebUploader.create({
            // swf文件路径
            swf: '${ctx}/resources/lib/webuploader/0.1.5/Uploader.swf',

            // 文件接收服务端。
            server: '/task/apk/upload',

            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#select-file',
            auto: true,
            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: false
        });

        var $packageName=$("#packageName");
        var $appVersion = $("#appVersion");

        var $apkUrl=$("#apkUrl");
        var $versionCode=$("#versionCode");
        var $minSdkVersion=$("#minSdkVersion");
        // 文件上传过程中创建进度条实时显示。
        var $progressBar = $("#progress-bar");
        var $progressText = $('.task-progress-tint', $progressBar);
        var $progressPer = $('.sr-only', $progressBar);
        uploader.on('uploadProgress', function (file, percentage) {
            var percentInt = parseInt(percentage * 100);
            $progressText.text(percentInt + '%');
            $progressPer.css('width', percentInt + '%');
            console.log(percentage)
        });

        uploader.on("beforeFileQueued", function (file) {
            var filename = file.name;
            if (file.size >= 250 * 1024 * 1024) {
                layer.msg("'文件大小不能大于250M'")
                return false;
            }
            if (!/[^.]\.apk$/.test(filename)) {
                layer.msg('不是有效的安装文件');
                return false;
            }
        });
        uploader.on('uploadSuccess', function (file, response) {
            if (response.code == 200) {
                $appVersion.val(response.data.versionName);
                $versionCode.val(response.data.versionCode);
                $packageName.val(response.data.apkPackage);
                $apkUrl.val(response.data.apkUrl);
                $minSdkVersion.val(response.data.minSdkVersion);
                $progressText.text('上传成功!');
            } else {
                $progressText.text('上传失败!');
            }

            console.log('uploadSuccess')
        });

        uploader.on('uploadError', function (file) {
            $progressBar.hide();
            layer.msg("上传失败");
        });

        uploader.on('uploadComplete', function (file) {
            console.log('uploadComplete')
        });

        var state = 'pending';
        uploader.on('all', function (type) {
            if (type === 'startUpload') {
                state = 'uploading';
            } else if (type === 'stopUpload') {
                state = 'paused';
            } else if (type === 'uploadFinished') {
                state = 'done';
            }

            if (state === 'uploading') {
            } else {
            }
        });

        $("#select-file").on('change', 'input', function (e, b) {
            $("#select-file a").text(this.files[0].name);
        });

    });

</script>
</body>
</html>