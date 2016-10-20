/**
 * Created by yuekuapp on 16-9-14.
 */
$(document).ready(function () {

$('.table-sort').dataTable({
    "aaSorting": [[2, "desc"]],//默认第几个排序
    "bStateSave": true,//状态保存
    "aoColumnDefs": [
        //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
        {"orderable": false, "aTargets": [1,6,7]}// 制定列不参与排序
    ]
});
});