// 所有模块都通过 define 来定义
define(function (require, exports, module) {
    var base = require('base');
    // 通过 require 引入依赖
    var F = module.exports = {
        basepath: '',
        selectors: {
            loginlogTb: $('#main-log-manage-login-tb')
        },
        init: function (_basepath) {
            F.basepath = _basepath;
            var _logGridConfig = {
                url: F.basepath + '/main/log/query-login.html',
                idField: 'id',
                fitColumns: true,
                striped: true,
                rownumbers: true,
                singleSelect: true,
                nowrap:false,
                pagination:true,
                pageSize:20,
                pageList:[20,40,80,100,200],
                columns: [[
                    {title: '账号', field: 'account', width: '10%'},
                    {field: 'loginIp', title: 'IP', width: '10%'},
                    {field: 'showLoginTime', title: '登录时间', width: '10%'},
                    {field: 'address', title: '登录地址', width: '10%'},
                    {field: 'detailAddress', title: '详细地址', width: '15%'},
                    {field: 'pointX', title: '经度', width: '10%'},
                    {field: 'pointY', title: '纬度', width: '10%'},
                    {field: 'province', title: '省', width: '5%'},
                    {field: 'city', title: '城市', width: '5%'},
                    {field: 'cityCode', title: '城市码', width: '5%'}

                ]],
                onLoadError: function (arg) {
                    base.loadError(arg);
                },
                onLoadSuccess: function (data) {
                    $('.easyui-linkbutton').linkbutton();
                },
                loadFilter: function (data, pId) {
                    if (data.ok) {
                        return data.data;
                    }
                    base.ajaxSuccessData(data);
                }
            };
                F.selectors.loginlogTb.datagrid(_logGridConfig);

        }
    };

});
