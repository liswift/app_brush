define(function (require, exports, module) {
        var base = require('base');
        // 通过 require 引入依赖
        var F = module.exports = {
            basepath: '',
            selectors: {
                dg: $('#main-user-manage-tb'),
                addDialog: $('#main-user-manage-add-dialog'),
                addDialogForm: $('#main-user-manage-add-dialog-form'),
                addDialogDepsComboTree: $('#main-user-manage-add-dialog-form input[name=dep]'),
                editDepDialog: $('#main-user-manage-edit-dep-dialog'),
                editDepDialogDeps: $('#main-user-manage-edit-dep-dialog_tree_deps'),
                editRoleDialog: $('#main-user-manage-edit-role-dialog'),
                editRoleDialogRoles: $('#main-user-manage-edit-role-dialog_roles')
            },
            init: function (_basepath) {
                F.basepath = _basepath;

                window.deleteuser = F.delete;
                window.editUserDep = F.editDep;
                window.editUserRole = F.editRole;

                var config = {
                    url: F.basepath + "/user/get-manage-user.html",
                    fitColumns: true,
                    idField: 'id',
                    striped: true,
                    pagination: true,
                    rownumbers: true,
                    singleSelect: true,
                    loadFilter: function (data) {
                        if (data.ok) {
                            return data.data;
                        }
                    },
                    onLoadError: function (arg) {
                        base.loadError(arg);
                    },
                    onLoadSuccess: function (data) {
                        $('.easyui-linkbutton').linkbutton();
                        if (base.perList.user.edit || base.perList.user.del || base.perList.user.edit_dep || base.perList.user.distribute_role) {
                            F.selectors.dg.datagrid("showColumn", "action");
                        }
                    },
                    columns: [[
                        {field: 'id', title: '账号id', width: '10%', hidden: true},
                        {field: 'account', title: '账号', width: '15%'},
                        {field: 'dep_name', title: '部门名字', width: '20%'},
                        {field: 'roleNames', title: '角色名字', width: '20%'},
                        {
                            field: 'action',
                            title: '操作',
                            width: '30%',
                            hidden: true,
                            formatter: function (value, row, index) {
                                var action = "";
                                if (base.perList.user.edit) {
                                    action += "<a href='javascript:void(0)' plain='true' class='easyui-linkbutton' iconCls='icon-edit'>编辑用户</a>";
                                }
                                if (base.perList.user.edit_dep) {
                                    action += "<a href='javascript:void(0)' onclick='editUserDep(" + row.id + ")'  plain='true' class='easyui-linkbutton' iconCls='icon-edit'>修改部门</a>";
                                }
                                if (base.perList.user.distribute_role) {
                                    action += "<a href='javascript:void(0)' onclick='editUserRole(" + row.id + ")' plain='true' class='easyui-linkbutton' iconCls='icon-edit'>分配角色</a>";
                                }
                                if (base.perList.user.del) {
                                    action += "<a href='javascript:void(0)' plain='true' onclick='deleteuser(" + row.id + ")' class='easyui-linkbutton' iconCls='icon-remove'>删除用户</a>";
                                }
                                return action;
                            }
                        }
                    ]]
                };

                if (base.perList.user.create) {
                    config.toolbar = [
                        {
                            iconCls: 'icon-add',
                            text: '添加用户',
                            handler: function () {
                                F.selectors.addDialog.show().dialog({
                                    cache: false,
                                    onClose: function () {
                                        F.selectors.addDialogForm.form('clear');
                                    },
                                    onOpen: function () {
                                        F.selectors.addDialogDepsComboTree.combotree({
                                            url: F.basepath + "/main/department/get-show-departments.html",
                                            loadFilter: function (data) {
                                                if (data.ok) {
                                                    return data.data;
                                                }
                                                base.ajaxSuccessData(data);
                                            }
                                        })
                                        //表单初始化
                                        F.selectors.addDialogForm.form({
                                                url: F.basepath + '/user/create.html',
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
                                                        F.selectors.dg.datagrid('load');
                                                    }
                                                },
                                                onLoadError: function () {
                                                    base.loadError('');
                                                }
                                            }
                                        );

                                    },
                                    buttons: [{
                                        text: '添加',
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

                if (base.perList.user.check) {
                    F.selectors.dg.datagrid(config);
                }
            },
            delete: function (id) {
                F.selectors.dg.datagrid('selectRecord', id);
                var selectRow = F.selectors.dg.datagrid('getSelected');
                $.messager.confirm('提示', '你确定要删除用户『' + selectRow.account + '』吗？', function (r) {
                    if (r) {
                        base.ajaxRequest(F.basepath + "/user/delete.html", {"userId": id}, function (data) {
                            base.ajaxSuccessData(data);
                            F.selectors.dg.datagrid('load');
                        }, false, "post");
                    }
                });
            },
            editDep: function (uid) {
                F.selectors.editDepDialog.show().dialog({
                    onOpen: function () {
                        F.selectors.editDepDialogDeps.tree({
                            animate: true,
                            lines: true,
                            checkbox: true,
                            cascadeCheck: false,
                            queryParams: {
                                checkUserId: uid
                            },
                            onCheck: function (node, checked) {
                                if (checked) {
                                    var treeCheckedNodes = F.selectors.editDepDialogDeps.tree('getChecked', "checked");
                                    $(treeCheckedNodes).each(function (i, v) {
                                        if (v.id != node.id) {
                                            var _1a1 = F.selectors.editDepDialogDeps.tree('find', v.id);
                                            F.selectors.editDepDialogDeps.tree('uncheck', _1a1.target);
                                        }
                                    });
                                }
                            },
                            loadFilter: function (data) {
                                if (data.ok) {
                                    return data.data;
                                }
                                base.ajaxSuccessData(data);
                            },
                            url: F.basepath + "/main/department/get-show-departments.html"
                        });
                    },
                    buttons: [{
                        text: '修改',
                        iconCls: 'icon-ok',
                        handler: function () {
                            var treeCheckedNodes = F.selectors.editDepDialogDeps.tree('getChecked', "checked");
                            if (treeCheckedNodes.length <= 0) {
                                $.messager.alert('提示', '请选择部门', 'warning');
                                return;
                            }
                            var depId = treeCheckedNodes[0].id;
                            $.ajax({
                                url: F.basepath + "/user/edit-user-dep.html",
                                data: {
                                    'userId': uid,
                                    'depId': depId
                                },
                                dataType: 'json',
                                async: false,
                                type: 'post',
                                error: function (XMLHttpRequest, textStatus, errorThrown) {
                                    base.ajaxError(XMLHttpRequest, textStatus, errorThrown);
                                },
                                success: function (data) {
                                    base.ajaxSuccess(data);
                                    F.selectors.editDepDialog.dialog('close');
                                    F.selectors.dg.datagrid('load');
                                }
                            })
                        }
                    }]
                });
            },
            editRole: function (uid) {
                F.selectors.editRoleDialog.show().dialog({
                    onOpen: function () {
                        F.selectors.editRoleDialogRoles.datalist({
                            checkbox: true,
                            lines: false,
                            queryParams: {
                                checkUserId: uid
                            },
                            valueField: 'id',
                            textField: 'name',
                            singleSelect: false,
                            selectOnCheck: true,
                            checkOnSelect: true,
                            loadFilter: function (data) {
                                if (data.ok) {
                                    var rows = data.data;
                                    return rows;
                                }
                                base.ajaxSuccessData(data);
                            },
                            onLoadSuccess: function (data) {
                                $(data.rows).each(function (i, v) {
                                    if (v.checked) {
                                        F.selectors.editRoleDialogRoles.datalist('selectRow', i);
                                    }
                                });
                            },
                            url: F.basepath + "/main/role/show-roles.html"
                        });
                    },
                    buttons: [{
                        text: '修改',
                        iconCls: 'icon-ok',
                        handler: function () {
                            var checkNodes = F.selectors.editRoleDialogRoles.datalist('getChecked');
                            var roleIds = "";
                            if (checkNodes.length > 0) {
                                $(checkNodes).each(function (i, v) {
                                    roleIds += "," + v.id;
                                })

                                roleIds = roleIds.substring(1);
                            }
                            if (checkNodes.length <= 0) {
                                $.messager.confirm('提示', '你确定不分配任何角色吗？', function (r) {
                                    if (r) {
                                        F.sendAjaxUpdateRole(uid,roleIds);
                                    }
                                });
                            }else{
                                F.sendAjaxUpdateRole(uid,roleIds);

                            }
                        }
                    }]
                });
            },
            sendAjaxUpdateRole:function(userId,roleIds){
                $.ajax({
                    url: F.basepath + "/user/edit-user-role.html",
                    data: {
                        'userId': userId,
                        'roleIds': roleIds
                    },
                    dataType: 'json',
                    async: false,
                    type: 'post',
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        base.ajaxError(XMLHttpRequest, textStatus, errorThrown);
                    },
                    success: function (data) {
                        base.ajaxSuccess(data);
                        F.selectors.editRoleDialog.dialog('close');
                        F.selectors.dg.datagrid('load');
                    }
                })
            }
        }
    }
);