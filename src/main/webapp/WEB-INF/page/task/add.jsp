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
    <script type="text/javascript" src="lib/PIE_IE678.js"></script>
    <![endif]-->
    <link href="../../../resources/css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../../resources/css/H-ui.admin.css" rel="stylesheet" type="text/css"/>
    <link href="../../../resources/lib/icheck/icheck.css" rel="stylesheet" type="text/css"/>
    <link href="../../../resources/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css"/>
    <link href="../../../resources/css/task-style.css" rel="stylesheet" type="text/css"/>
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>添加任务</title>
</head>
<body>
<div class="add-task-form form-horizontal">
    <div class="add-task-item">
        <span><span class="required-dot">*</span>应用apk文件：</span>
        <span class="btn-upload" style="margin-left:10px" id="select-file">
            <a href="javascript:void(0);" class="btn btn-primary radius">上传应用</a>
            <input type="file" multiple name="file_0" class="input-file"/>
        </span>
        <div class="progress task-progress">
            <div class="progress-bar">
                <span class="task-progress-tint">25%</span>
                <span class="sr-only" style="width:25%"></span>
            </div>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-6 col-sm-6">
            <label class="form-label col-xs-4 col-sm-4">应用名称：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" task_name="name" class="input-text" autocomplete="off">
            </div>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-6 col-sm-6">
            <label class="form-label col-xs-4 col-sm-4">应用版本：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" task_name="version" class="input-text" autocomplete="off">
            </div>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-6 col-sm-6">
            <label class="form-label col-xs-4 col-sm-4">备注名称：</label>
            <div class="formControls col-xs-8 col-sm-8">
                <input type="text" task_name="memo" class="input-text" autocomplete="off">
            </div>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-4 col-sm-4">
            <label class="form-label col-xs-6 col-sm-6">每日新增用户：</label>
            <div class="formControls col-xs-3 col-sm-3">
                <input type="text" task_name="daily_new" class="input-text" autocomplete="off">
            </div>
            <label class="form-label col-xs-3 col-sm-3">个，</label>
        </div>
        <div class="formControls col-xs-4 col-sm-4">
            <label class="form-label col-xs-6 col-sm-6">上下波动范围：</label>
            <div class="formControls col-xs-3 col-sm-3">
                <input type="text" task_name="daily_new_range" class="input-text" autocomplete="off">
            </div>
            <label class="form-label col-xs-3 col-sm-3">个</label>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-4 col-sm-4">
            <label class="form-label col-xs-6 col-sm-6">应用运行时长：</label>
            <div class="formControls col-xs-3 col-sm-3">
                <input type="text" task_name="daily_time" class="input-text" autocomplete="off">
            </div>
            <label class="form-label col-xs-3 col-sm-3">分，</label>
        </div>
        <div class="formControls col-xs-4 col-sm-4">
            <label class="form-label col-xs-6 col-sm-6">上下波动范围：</label>
            <div class="formControls col-xs-3 col-sm-3">
                <input type="text" task_name="daily_time_range" class="input-text" autocomplete="off">
            </div>
            <label class="form-label col-xs-3 col-sm-3">秒</label>
        </div>
    </div>
    <div class="row cl">
        <div class="formControls col-xs-6 col-sm-6">
            <label class="form-label col-xs-4 col-sm-4">投放时间：</label>
            <div class="formControls col-xs-3 col-sm-3">
                <input type="text" task_name="daily_date_start" class="input-text" autocomplete="off">
            </div>
            <label class="form-label col-xs-1 col-sm-1" style="text-align: center;">—</label>
            <div class="formControls col-xs-3 col-sm-3">
                <input type="text" task_name="daily_date_end" class="input-text" autocomplete="off">
            </div>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-2 col-sm-2">每日投放速度：</label>
        <div id="daily-speed" class="HuiTab formControls col-xs-10 col-sm-10" style="margin-left:-4px">
            <div class="tabBar cl tabBar-1" task_name="daily_speed">
                <span task_value="fast">最快投放</span>
                <span task_value="average">均匀投放</span>
            </div>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-2 col-sm-2">留存率：</label>
        <div id="daily-stay" class="HuiTab formControls col-xs-8 col-sm-8" style="margin-left:-4px">
            <div class="tabBar cl tabBar-1" task_name="daily_stay">
                <span task_value="0">无留存</span>
                <span task_value="1">1天</span>
                <span task_value="7">7天</span>
                <span task_value="14">14天</span>
                <span task_value="30">30天</span>
                <span task_value="60">60天</span>
            </div>
        </div>
        <div class="formControls col-xs-2 col-sm-2" style="margin-left: 2px">
            <input task_name="daily_stay_percent" maxlength="2" type="text" class="input-text" autocomplete="off"
                   style="width:60px">
            <label>%</label>
        </div>
    </div>
    <div class="row cl">
        <div class="col-xs-10 col-sm-10 col-xs-offset-4 col-sm-offset-5">
            <input id="task-add-btn" class="btn btn-primary radius" type="submit" style="width: 90px" value="提交">
        </div>
    </div>
</div>

<!--<a data-toggle="modal" href="#myModal" class="btn btn-primary size-L">弹出对话框</a>-->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <h3 id="myModalLabel">对话框标题</h3><a class="close" data-dismiss="modal" aria-hidden="true"
                                           href="javascript:void();">×</a>
    </div>
    <div class="modal-body">
        <p>对话框内容…</p>
    </div>
    <div class="modal-footer">
        <button class="btn btn-primary">确定</button>
        <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    </div>
</div>

<script type="text/javascript" src="../../../resources/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../../../resources/lib/bootstrap-modal/2.2.4/bootstrap-modalmanager.js"></script>
<script type="text/javascript" src="../../../resources/lib/bootstrap-modal/2.2.4/bootstrap-modal.js"></script>
<script>
    $('#daily-speed,#daily-stay').on('click', 'span', function () {
        var self = $(this);
        self.addClass('speed-select').siblings().removeClass('speed-select');
    });

    var params = {};
    $('#task-add-btn').on('click', function (e) {
        $("[task_name]").each(function (index, item) {
            item = $(item);
            var name = item.attr('task_name');
            if (item.is('input')) {
                params[name] = item.val();
            }
            else if (name == 'daily_speed' || name == 'daily_stay') {
                params[name] = $('span.speed-select', item).attr('task_value');
            }
        });
        console.log(params)
    });
    $("#select-file").on('change', 'input', function (e, b) {
        $("#select-file a").text(this.files[0].name)
    });


</script>
</body>
</html>