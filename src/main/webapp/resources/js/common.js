/**
 * Created by liswift on 16/9/12.
 */


function ajaxPost(url,data,callback,failback){
    data = data || {};
    return $.ajax({
        type: "post",
        url: url,
        data: data,
        success: function(res) {
            if (res.code == 0) {
                if ($.isFunction(callback)) {
                    callback(res.data, res);
                }
            } else {
                if ($.isFunction(failback)) {
                    failback(res);
                } else {
                    alert(res.desc);
                }
            }
        },
        error: function(request, textStatus, err) {
            console.log(err, "error");
        },
        dataType: "json"
    });
}

function fullOpen(title, url) {
    var index = layer.open({
        type: 2,
        title: title,
        content: url
    });
    layer.full(index);
}
