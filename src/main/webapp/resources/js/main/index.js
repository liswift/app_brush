// 所有模块都通过 define 来定义
define(function (require, exports, module) {
    var base = require('base');
    base.init()
    // 通过 require 引入依赖
    var F = module.exports = {
        basepath: '',
        init: function (_basepath) {
            F.basepath = _basepath;
            //菜单导航初始化
            $('#navigation-menu').tree({
                url: F.basepath + '/main/menu/get-show-menus.html',
                animate: true,
                lines: true,
                onClick: function (node) {
                    var text = node.text;
                    var url = node.attributes.url;

                    var isExist = $('#center-content').tabs('exists', text);
                    if (isExist) {
                        //tab已存在
                        $('#center-content').tabs('select', text);
                    } else {
                        if (!url || $.trim(url).length <= 0) {
                            return;
                        }
                        url = F.basepath + url;
                        $('#center-content').tabs('add', {
                            title: text,
                            href: url,
                            closable: false,
                            selected: true/*,
                            tools: [{
                                iconCls: 'icon-mini-refresh',
                                handler: function () {
                                    //刷新操作
                                    var tab = $('#center-content').tabs('getSelected');  // get selected panel
                                    tab.panel('refresh', url);
                                }
                            }]*/
                        });
                    }
                },
                onLoadError: function (arg) {
                    base.loadError();
                },
                loadFilter: function (data, parent) {
                    if (data.ok) {
                        return data.data;
                    }

                    base.ajaxSuccessData(data);
                }
            });

            $('#message-board-button').click(function(){
                $('#main-message-board-dialog').show().dialog({
                buttons:[{
                    text:'提交',
                    iconCls:'icon-ok',
                    handler:function(){
                        var val = $('#main-message-board-dialog textarea').val();
                        if($.trim(val).length<=0){
                            $.messager.alert('提示','请输入留言内容','warning');
                            return;
                        }

                        if(val.length>1000){
                            $.messager.alert('提示','阁下,1000个字符还无法表达您的愤怒吗?','warning');
                            return;
                        }

                        $.ajax({
                            url: F.basepath+"/main/save-message-board.html",
                            data:{'msg':val},
                            dataType:'json',
                            type:'post',
                            success:function(data){
                                base.ajaxSuccess(data);
                                if(data.ok) {
                                    $('#main-message-board-dialog').dialog('close');
                                    $('#main-message-board-dialog textarea').val('');
                                }
                            },
                            error:function(XMLHttpRequest, textStatus, errorThrown){
                                base.ajaxError(XMLHttpRequest, textStatus, errorThrown);
                            }
                        });
                    }
                }]
                });
            });
        }
    };

});
