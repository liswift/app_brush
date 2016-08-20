// 所有模块都通过 define 来定义
define(function (require, exports, module) {
    var base = require('base');
    // 通过 require 引入依赖
    var F = module.exports = {
        basepath: '',
        selectors: {
            addDialog: $('#main-permission-manage-add-dialog'),
            addDialogForm: $('#main-permission-manage-add-dialog-form'),
            addDialogPermissionList: $('#main-permission-manage-add-dialog-parent-permissionlist'),
            permissionManageTb: $('#main-permission-manage-permission-tb'),
            editDialogPermissionList: $('#main-permission-manage-edit-dialog-parent-permissionlist'),
            editDialog: $('#main-permission-manage-edit-dialog'),
            editDialogForm: $('#main-permission-manage-edit-dialog-form')
        },
        init: function (_basepath) {
            F.basepath = _basepath;
            window.delPermission = F.delPermission;
            window.editPermission = F.editPermission;
            var _treeConfig = {
                url: F.basepath + '/main/get-show-permissions.html',
                idField: 'id',
                treeField: 'text',
                singleSelect: true,
                lines: true,
                animate: true,
                rownumbers: false,
                columns: [[
                    {
                        title: '权限名字',
                        field: 'text',
                        width: '40%'
                    },
                    {
                        field: 'key',
                        title: '权限键值',
                        width: '30%'
                    },
                    {
                        field: 'order',
                        title: '排序',
                        width: '5%'
                    },
                    {
                        field: 'action',
                        title: '操作',
                        width: '20%',
                        hidden:true,
                        formatter: function (value, row, index) {
                            var _btnAction = "";
                            if (base.perList.permission.edit) {
                                _btnAction += "<a href='javascript:void(0)' onclick='editPermission(" + row.id + ")' class='easyui-linkbutton'iconCls='icon-edit' plain='true'>编辑</a>";
                            }
                            if (base.perList.permission.del) {
                                _btnAction += "<a href='javascript:void(0)' onclick='delPermission(" + row.id + ")' plain='true' class='easyui-linkbutton'iconCls='icon-remove'>删除</a>";
                            }
                            return _btnAction;
                        }
                    }

                ]],
                onLoadError: function (arg) {
                    base.loadError(arg);
                },
                onLoadSuccess: function (data) {
                    $('.easyui-linkbutton').linkbutton();
                    if (base.perList.permission.edit||base.perList.permission.del){
                        F.selectors.permissionManageTb.treegrid("showColumn", "action");
                    }

                },
                loadFilter: function (data, pId) {
                    if (data.ok) {
                        return data.data
                    }
                    base.ajaxSuccessData(data);
                }

            };
            if (base.perList.permission.create) {
                _treeConfig.toolbar = [
                    {
                        iconCls: 'icon-add',
                        text: '添加权限',
                        handler: function () {
                            F.selectors.addDialog.show().dialog({
                                cache: false,
                                onClose: function () {
                                    F.selectors.addDialogForm.form('clear');
                                },
                                onOpen: function () {
                                    F.selectors.addDialogPermissionList.combotree({
                                        loadFilter: function (data) {
                                            if (data.ok) {
                                                return data.data;
                                            }
                                            base.ajaxSuccessData(data);
                                        }
                                    });
                                    //表单初始化
                                    F.selectors.addDialogForm.form({
                                            url: F.basepath + '/main/permission/create.html',
                                            ajax: true,
                                            onSubmit: function (param) {
                                                param.ajax = 'true';
                                                return F.selectors.addDialogForm.form('validate');
                                            },
                                            success: function (data) {
                                                data = $.parseJSON(data);
                                                base.ajaxSuccessData(data);
                                                if (data.ok) {
                                                    F.selectors.addDialog.dialog('close');
                                                    F.selectors.permissionManageTb.treegrid('load');
                                                }
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
            if (base.perList.permission.check) {
                F.selectors.permissionManageTb.treegrid(_treeConfig);
            }
        },
        delPermission: function (id) {
            var node = F.selectors.permissionManageTb.treegrid('find', id);

            var parentNode = F.selectors.permissionManageTb.treegrid('getParent', id);
            if (!parentNode) {
                $.messager.alert('提示', '根级权限不能删除', 'warning');
                return;
            }

            $.messager.confirm('提示', '你确定要删除权限『' + node.text + '』吗？（删除之后子级权限也会被删除）', function (r) {
                if (r) {
                    base.ajaxRequest(F.basepath + "/main/permission/del.html", {"id": id}, function (data) {
                        base.ajaxSuccessData(data);
                        F.selectors.permissionManageTb.treegrid('load');
                    }, false, "post");
                }
            });
        },
        editPermission: function (id) {
            var node = F.selectors.permissionManageTb.treegrid('find', id);

            F.selectors.editDialog.show().dialog({
                cache: false,
                onOpen: function () {
                    //上级权限设值
                    F.selectors.editDialogPermissionList.combotree({
                        queryParams: {'perId': id},
                        loadFilter: function (data) {
                            if (data.ok) {
                                return data.data;
                            }
                            base.ajaxSuccessData(data);
                        },
                        onLoadSuccess: function () {
                            var parentNode = F.selectors.permissionManageTb.treegrid('getParent', id);
                            if (parentNode) {
                                F.selectors.editDialogPermissionList.combotree('setValue', parentNode.id);
                            }
                        }
                    });
                    //权限名字设值
                    $('#main-permission-manage-edit-dialog-form-name').textbox('setValue', node.text);
                    //设置权限键值
                    $('#main-permission-manage-edit-dialog-form-key').textbox('setValue', node.key);
                    //设置权限排序
                    $('#main-permission-manage-edit-dialog-form-order').textbox('setValue', node.order);
                    //表单初始化
                    F.selectors.editDialogForm.form({
                            url: F.basepath + '/main/permission/edit.html',
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
                                    F.selectors.permissionManageTb.treegrid('load');
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
        }
    };
});
