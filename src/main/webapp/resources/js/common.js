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



top.window.eventEmitter = {
    _events: {},
    emit: function (event, data) {
        if (!this._events[event]) return;
        var len = this._events[event].length , i = 0;
        for (; i < len; i++) {
            typeof this._events[event][i] =='function' && this._events[event][i](data);
        }
        return this;
    },
    addListener: function (event, callback) {
        if (!this._events[event]){
            this._events[event] = [];
        }
        this._events[event].push(callback);
        return this;
    },
    removeListener:function(event,callback){
        if (!this._events[event]) return;
        this._events[event] = null;
        delete this._events[event];
        typeof callback =='function' && callback();
        return this;
    }

};

function fullOpen(title, url) {
    var index = layer.open({
        type: 2,
        title: title,
        content: url
    });
    layer.full(index);
}

