// 所有模块都通过 define 来定义
define(function (require, exports, module) {
    var base = require('base');
    // 通过 require 引入依赖
    var F = module.exports = {
        basepath: '',
        selectors: {
            addDialog: $('#main-role-manage-add-dialog'),
            addDialogForm: $('#main-role-manage-add-dialog-form'),
            loginlogTb: $('#main-role-manage-role-tb'),
            editDialog: $('#main-role-manage-edit-dialog'),
            editDialogForm: $('#main-role-manage-edit-dialog-form'),
            checkPermissionDialog: $('#main-role-manage-check-permission-dialog'),
            checkPermissionDialogPermissionList: $('#main-role-manage-check-permission-dialog-pers')
        },
        init: function (_basepath) {
            F.basepath = _basepath;

            window.deleteRole = F.deleteRole;
            window.editRole = F.editRole;
            window.checkRolePermission = F.checkPermission;


            var _roleTreeGridConfig = {
                url: F.basepath + '/main/role/show-roles.html',
                idField: 'id',
                fitColumns: true,
                striped: true,
                rownumbers: true,
                singleSelect: true,
                columns: [[
                    {title: '角色名字', field: 'name', width: '30%'},
                    {field: 'key', title: '角色键值', width: '35%'},
                    {
                        field: 'action',
                        title: '操作',
                        width: '30%',
                        hidden:true,
                        formatter: function (value, row, index) {
                            var _action = "";
                            if (base.perList.role.checkPermission) {
                                _action += "<a href='javascript:void(0)' class='easyui-linkbutton' onclick='checkRolePermission(" + row.id + ")'  iconCls='icon-chakan' plain='true'>查看权限</a>";
                            }
                            if (base.perList.role.edit) {
                                _action += "<a href='javascript:void(0)' class='easyui-linkbutton' onclick='editRole(" + row.id + ")' iconCls='icon-edit' plain='true'>编辑</a>";
                            }
                            if (base.perList.role.del) {
                                _action += "<a href='javascript:void(0)' class='easyui-linkbutton' onclick='deleteRole(" + row.id + ")' iconCls='icon-remove' plain='true'>删除</a>";
                            }
                            return _action;
                        }
                    }

                ]],
                onLoadError: function (arg) {
                    base.loadError(arg);
                },
                onLoadSuccess: function (data) {
                    $('.easyui-linkbutton').linkbutton();
                    if (base.perList.role.checkPermission||base.perList.role.edit||base.perList.role.del){
                        F.selectors.loginlogTb.datagrid("showColumn", "action");
                    }
                },
                loadFilter: function (data, pId) {
                    if (data.ok) {
                        return data.data;
                    }
                    base.ajaxSuccessData(data);
                }
            };
            if (base.perList.role.create) {
                _roleTreeGridConfig.toolbar = [
                    {
                        iconCls: 'icon-add',
                        text: '添加角色',
                        handler: function () {
                            F.selectors.addDialog.show().dialog({
                                cache: false,
                                onClose: function () {
                                    F.selectors.addDialogForm.form('clear');
                                },
                                onOpen: function () {
                                    //表单初始化
                                    F.selectors.addDialogForm.form({
                                            url: F.basepath + '/main/role/create.html',
                                            ajax: true,
                                            success: function (data) {
                                                data = $.parseJSON(data);
                                                base.ajaxSuccessData(data);
                                                if (data.ok) {
                                                    F.selectors.addDialog.dialog('close');
                                                    F.selectors.loginlogTb.datagrid('load');
                                                }
                                            },
                                            onSubmit: function (param) {
                                                param.ajax = 'true';
                                                return F.selectors.addDialogForm.form('validate');
                                            },
                                            onLoadError: function () {
                                                base.loadError('');
                                            }
                                        }
                                    );
                                },
                                buttons: [{
                                    text: '创建',
                                    iconCls: 'icon-ok',
                                    handler: function () {
                                        F.selectors.addDialogForm.form('submit');
                                    }
                                }]
                            });
                        }
                    }
                ];
            }
            if (base.perList.role.check) {
                F.selectors.loginlogTb.datagrid(_roleTreeGridConfig);
            }

        },
        deleteRole: function (id) {
            var rows = F.selectors.loginlogTb.datagrid('getRows');
            var node;
            for (var i = 0; i < rows.length; i++) {
                var r = rows[i];
                if (r.id == id) {
                    node = r;
                    break;
                }
            }
            $.messager.confirm('提示', '你确定要删除角色『' + node.name + '』吗？', function (r) {
                if (r) {
                    base.ajaxRequest(F.basepath + "/main/role/del.html", {"id": id}, function (data) {
                        base.ajaxSuccessData(data);
                        F.selectors.loginlogTb.datagrid('load');
                    }, false, "post");
                }
            });
        },
        editRole: function (id) {
            var rows = F.selectors.loginlogTb.datagrid('getRows');
            var node;
            for (var i = 0; i < rows.length; i++) {
                var r = rows[i];
                if (r.id == id) {
                    node = r;
                    break;
                }
            }
            F.selectors.editDialog.show().dialog({
                cache: false,
                onOpen: function () {

                    //设置角色名字
                    $('#main-role-manage-edit-dialog-form_name').textbox('setValue', node.name);
                    //设置角色键值
                    $('#main-role-manage-edit-dialog-form_key').textbox('setValue', node.key);
                    //表单初始化
                    F.selectors.editDialogForm.form({
                            url: F.basepath + '/main/role/edit.html',
                            ajax: true,
                            queryParams: {
                                "id": id
                            },
                            onSubmit: function (param) {
                                param.ajax = 'true';
                                return F.selectors.editDialogForm.form('validate');
                            },
                            success: function (data) {
                                data = $.parseJSON(data);
                                base.ajaxSuccessData(data);
                                if (data.ok) {
                                    F.selectors.editDialog.dialog('close');
                                    F.selectors.loginlogTb.datagrid('load');
                                    F.selectors.editDialogForm.form('clear');
                                }
                            },
                            onLoadError: function () {
                                base.loadError('');
                            }
                        }
                    );

                },
                buttons: [{
                    text: '修改',
                    iconCls: 'icon-edit',
                    handler: function () {
                        F.selectors.editDialogForm.form('submit');
                    }
                }]
            });
        },
        checkPermission: function (id) {
            var _grant = {
                text: '授权',
                iconCls: 'icon-ok',
                handler: function () {
                    //权限集合
                    var checkedPermissons = F.selectors.checkPermissionDialogPermissionList.tree('getChecked');
                    var arr = new Array();
                    $(checkedPermissons).each(function (i, v) {
                        arr[i] = v.id;
                    });
                    //角色
                    var selectedRole = F.selectors.loginlogTb.datagrid('getSelected');
                    base.ajaxRequest(F.basepath + "/main/role/grant.html", {
                        "id": selectedRole.id,
                        peridArray: arr
                    }, function (data) {
                        base.ajaxSuccessData(data);
                        F.selectors.checkPermissionDialog.dialog('close');
                    }, false, "post");
                }
            };
            var _cancel = {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    F.selectors.checkPermissionDialog.dialog('close');
                }
            };
            var _buttons = [];

            if (base.perList.role.grant) {
                //角色授权
                _buttons[0] = _grant;
                _buttons[1] = _cancel;
            } else {
                _buttons[0] = _cancel;
            }

            F.selectors.checkPermissionDialog.show().dialog({
                onOpen: function () {
                    F.selectors.checkPermissionDialogPermissionList.tree({
                        url: F.basepath + '/main/get-role-show-permissions.html',
                        lines: true,
                        checkbox: true,
                        cascadeCheck:false,
                        queryParams: {"roleId": id},
                        animate: true,
                        loadFilter: function (data) {
                            if (data.ok) {
                                return data.data;
                            }
                            base.ajaxSuccessData(data);
                        }
                    });
                },
                buttons: _buttons
            });
        }
    };

});
