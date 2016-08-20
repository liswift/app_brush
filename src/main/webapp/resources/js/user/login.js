// 所有模块都通过 define 来定义
define(function (require, exports, module) {
    // 通过 require 引入依赖
    var base = require("base");
    var E = module.exports = {
            basepath: '',
            verifyCodeImageUrl: '/user/authCode/{timestamp}.html',
            init: function (basepath) {//初始化
                E.basepath = basepath;

                var _verifyCodeImageUrl = E.verifyCodeImageUrl.replace("{timestamp}", (new Date()).valueOf());

                $('#verifyCodeImg').attr('src', E.basepath + _verifyCodeImageUrl);

                $('#verifyCodeImg').click(function () {
                    var $this = $(this);
                    E.changetVerifyCodeImg($this);
                });
                $('#verifyCodeImg').next('a').click(function () {
                        var $this = $(this).prev('img');
                        E.changetVerifyCodeImg($this);
                    }
                );
                $('#login-dialog').dialog({
                    buttons: [{
                        text: '登录',
                        iconCls: 'icon-ok',
                        handler: function () {
                            E.login();
                        }
                    }]
                });
                //表单初始化
                $('#login-form').form({
                        url: E.basepath + '/user/check-login.html',
                        ajax: true,
                        success: function (data) {
                            data = $.parseJSON(data);
                            base.ajaxSuccessData(data);
                            if (!data.ok) {
                                E.changetVerifyCodeImg($('#verifyCodeImg'));
                            } else {
                                window.location.href = E.basepath + "/main/index.html";
                            }
                        },
                        onSubmit: function (param) {
                            param.ajax = 'true';
                            return $('#login-form').form('validate');
                        },
                        onLoadError: function () {
                            base.loadError('');
                        }
                    }
                );

                //表单验证
                $('#login-form').form('validate');

                //表单回车
                $('#login-form input').keydown(function (e) {
                    if (e.keyCode == 13) {
                        E.login();
                    }
                });
            },
            //改变验证码图片
            changetVerifyCodeImg: function ($this) {
                var src = E.basepath + E.verifyCodeImageUrl.replace("{timestamp}", (new Date()).valueOf());
                $this.attr('src', src);
            }
            ,
            //登录
            login: function () {
                $('#login-form').submit();
            }
        }
        ;
})
;
