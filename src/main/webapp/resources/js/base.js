define(function (require, exports, module) {
    var E = module.exports = {

        easyuiValidateBoxInit: function () {

            $.extend($.fn.validatebox.defaults.rules, {
                account: {
                    validator: function (value, param) {
                        value = $.trim(value);
                        return value.length >= param[0] && value.length <= param[1];
                    },
                    message: '账号格式错误'
                }
            });
            $.extend($.fn.validatebox.defaults.rules, {
                password: {
                    validator: function (value, param) {
                        value = $.trim(value);
                        return value.length >= param[0] && value.length <= param[1];
                    },
                    message: '密码格式错误'
                }
            });
            $.extend($.fn.validatebox.defaults.rules, {
                verifycode: {
                    validator: function (value, param) {
                        value = $.trim(value);
                        return value.length == param[0];
                    },
                    message: '验证码格式错误'
                }
            });
            $.extend($.fn.validatebox.defaults.rules, {
                permissionName: {
                    validator: function (value, param) {
                        value = $.trim(value);
                        return value.length <= param[1] && value.length >= param[0];
                    },
                    message: '权限名字格式错误'
                }
            });
            $.extend($.fn.validatebox.defaults.rules, {
                permissionKey: {
                    validator: function (value, param) {
                        value = $.trim(value);
                        return value.length <= param[1] && value.length >= param[0];
                    },
                    message: '权限键值格式错误'
                }
            });
            $.extend($.fn.validatebox.defaults.rules, {
                roleName: {
                    validator: function (value, param) {
                        value = $.trim(value);
                        return value.length <= param[1] && value.length >= param[0];
                    },
                    message: '角色名字格式错误'
                }
            });
            $.extend($.fn.validatebox.defaults.rules, {
                roleKey: {
                    validator: function (value, param) {
                        value = $.trim(value);
                        return value.length <= param[1] && value.length >= param[0];
                    },
                    message: '角色键值格式错误'
                }
            });
            $.extend($.fn.validatebox.defaults.rules, {
                order: {
                    validator: function (value, param) {
                        value = $.trim(value);
                        var reg = /^[0-9]+$/;
                        return value.length <= param[1] && value.length >= param[0]&&reg.test(value);
                    },
                    message: '排序格式错误'
                }
            });
            $.extend($.fn.validatebox.defaults.rules, {
                menuName: {
                    validator: function (value, param) {
                        value = $.trim(value);
                        return value.length <= param[1] && value.length >= param[0];
                    },
                    message: '菜单名字格式错误'
                }
            });
            $.extend($.fn.validatebox.defaults.rules, {
                menuUrl: {
                    validator: function (value, param) {
                        value = $.trim(value);
                        return value.length <= param[1] && value.length >= param[0];
                    },
                    message: '菜单URL格式错误'
                }
            });
            $.extend($.fn.validatebox.defaults.rules, {
                deparetmentName: {
                    validator: function (value, param) {
                        value = $.trim(value);
                        return value.length <= param[1] && value.length >= param[0];
                    },
                    message: '部门名字格式错误'
                }
            });
        },

        init: function () {
            E.easyuiValidateBoxInit();
        },
        ajaxRequest: function (url, data, succefunc, failfunc, method, async) {
            if (!url) {
                url = "";
            }
            var _data = {"ajax": "true"};
            if (!data) {
                data = {};
            }
            data = $.extend(_data, data);
            if (!async) {
                async = true;
            }
            if (!failfunc) {
                failfunc = E.ajaxError;
            }
            if (!succefunc) {
                succefunc = E.ajaxSuccess;
            }
            if (!method) {
                method = 'post';
            }
            $.ajax({
                url: url,
                data: data,
                async: async,
                type: method,
                dataType: 'json',
                error: failfunc,
                success: succefunc
            });
        },
        ajaxError: function (XMLHttpRequest, textStatus, errorThrown) {
            E.loadError("");
        },
        ajaxSuccess: function (data, textStatus, jqXHR) {
            E.ajaxSuccessData(data);
        },
        ajaxSuccessData: function (data) {
            if (data.ok) {
                if (data.msg && $.trim(data.msg).length > 0) {
                    $.messager.show({
                        title: '提示',
                        msg: data.msg,
                        showType: 'show'
                    });
                }
                return;
            }
            $.messager.alert('提示', data.msg, 'warning', function () {
                if (data.url && $.trim(data.url).length > 0) {
                    window.location.href = data.url;
                }
            });
        },
        loadError: function (arg) {
            console.error(arg);
            $.messager.alert('提示', '系统繁忙', 'error');
        },
        perList: {
            permission: {
                del: false,
                edit: false,
                create: false,
                check: false
            },
            menu: {
                edit: false,
                del: false,
                create: false,
                check:false,
                checkPermission:false,
                grant:false
            } ,
            role: {
                edit: false,
                del: false,
                create: false,
                grant:false,
                checkPermission:false,
                check:false
            } ,
            department: {
                edit: false,
                del: false,
                create: false
            } ,
            user: {
                edit: false,
                del: false,
                create: false,
                check:false,
                distribute_role:false,
                edit_dep:false
            }
        }
    };
});