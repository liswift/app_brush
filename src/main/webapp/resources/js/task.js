/**
 * Created by liswift on 16/9/12.
 */

$(document).ready(function () {
    $('#daily-speed,#daily-stay').on('click', 'span', function () {
        var self = $(this);
        self.addClass('speed-select').siblings().removeClass('speed-select');
    });

    var params = {};
    $('#task-add-btn').on('click', function (e) {
        if (state == 'uploading') {
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
            alert("保存成功！");
        }, function (d) {
            alert("保存失败！");
        });
    });

    //上传文件
    var uploader = WebUploader.create({
        // swf文件路径
        swf: '${ctx}/resources/lib/webuploader/0.1.5' + '/js/Uploader.swf',

        // 文件接收服务端。
        server: '/task/apk/upload',

        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: '#file-input',

        // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
        resize: false
    });
    // 文件上传过程中创建进度条实时显示。
    var $progressBar = $("#progress-bar");
    var $progressText = $('.task-progress-tint', $progressBar);
    var $progressPer = $('.sr-only', $progressBar);
    uploader.on('uploadProgress', function (file, percentage) {
        $progressText.text(percentage + '%');
        $progressPer.css('width', percentage + '%');
        console.log(percentage)
    });

    uploader.on('uploadSuccess', function (file) {
        $progressBar.hide();
        console.log('uploadSuccess')
    });

    uploader.on('uploadError', function (file) {
        $progressBar.hide();
        console.log('uploadError')
    });

    uploader.on('uploadComplete', function (file) {
        $progressBar.hide();
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
        $progressBar.show();
        uploader.upload();
    });

    var date_start = {
        elem: '#date_start',
        format: 'YYYY/MM/DD hh:mm',
        min: laydate.now(), //设定最小日期为当前日期
        max: '2099-06-16 23:59:59', //最大日期
        istime: true,
        istoday: false,
        choose: function (datas) {
            params.daily_date_end = +new Date(datas);
            date_end.min = datas; //开始日选好后，重置结束日的最小日期
            date_end.start = datas;//将结束日的初始值设定为开始日
        }
    };
    var date_end = {
        elem: '#date_end',
        format: 'YYYY/MM/DD hh:mm',
        min: laydate.now(),
        max: '2099-06-16 23:59:59',
        istime: true,
        istoday: false,
        choose: function (datas) {
            params.daily_date_start = +new Date(datas);
            date_start.max = datas; //结束日选好后，重置开始日的最大日期
        }
    };
    laydate(date_start);
    laydate(date_end);
});



