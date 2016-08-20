// 所有模块都通过 define 来定义
define(function (require, exports, module) {
    var base = require('base');
    // 通过 require 引入依赖
    var F = module.exports = {
        basepath: '',
        selectors: {
            addDialog: $('#main-menu-manage-add-dialog'),
            addDialogForm: $('#main-menu-manage-add-dialog-form'),
            addDialogMenuList: $('#main-menu-manage-add-dialog-parent-menulist'),
            menuManageTb: $('#main-menu-manage-menu-tb'),
            editDialog: $('#main-menu-manage-edit-dialog'),
            editDialogMenuList: $('#main-menu-manage-edit-dialog-parent-menulist'),
            editDialogForm: $('#main-menu-manage-edit-dialog-form'),
            checkPermissionDialog: $('#main-menu-manage-check-permission-dialog'),
            checkPermissionDialogPermissionList: $('#main-menu-manage-check-permission-dialog-pers')
        },
        init: function (_basepath) {
            F.basepath = _basepath;

            window.deleteMenu = F.deleteMenu;
            window.editMenu = F.editMenu;
            window.checkMenuPermission = F.checkPermission;

            var _menuTreeGridConfig = {
                url: F.basepath + '/main/menu/get-show-menus.html',
                idField: 'id',
                treeField: 'text',
                columns: [[
                    {title: '菜单', field: 'text', width: '30%'},
                    {field: 'url', title: '链接地址', width: '35%'},
                    {field: 'order', title: '菜单排序', width: '5%'},
                    {
                        field: 'action',
                        title: '操作',
                        width: '30%',
                        hidden:true,
                        formatter: function (value, row, index) {
                            var _action = "";
                            if (base.perList.menu.checkPermission) {
                                _action += "<a href='javascript:void(0)' class='easyui-linkbutton' onclick='checkMenuPermission(" + row.id + ")'  iconCls='icon-chakan' plain='true'>查看权限</a>";
                            }
                            if (base.perList.menu.edit) {
                                _action += "<a href='javascript:void(0)' class='easyui-linkbutton' onclick='editMenu(" + row.id + ")' iconCls='icon-edit' plain='true'>编辑</a>";
                            }
                            if (base.perList.menu.del) {
                                _action += "<a href='javascript:void(0)' class='easyui-linkbutton' onclick='deleteMenu(" + row.id + ")' iconCls='icon-remove' plain='true'>删除</a>";
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
                    if (base.perList.menu.checkPermission||base.perList.menu.edit||base.perList.menu.del){
                        F.selectors.menuManageTb.treegrid("showColumn", "action");
                    }
                },
                loadFilter: function (data, pId) {
                    if (data.ok) {
                        return data.data;
                    }
                    base.ajaxSuccessData(data);
                }
            };
            if (base.perList.menu.create) {
                _menuTreeGridConfig.toolbar = [
                    {
                        iconCls: 'icon-add',
                        text: '添加菜单',
                        handler: function () {
                            F.selectors.addDialog.show().dialog({
                                cache: false,
                                onClose: function () {
                                    F.selectors.addDialogForm.form('clear');
                                },
                                onOpen: function () {
                                    F.selectors.addDialogMenuList.combotree({
                                        loadFilter: function (data) {
                                            if (data.ok) {
                                                return data.data;
                                            }
                                            base.ajaxSuccessData(data);
                                        }
                                    });
                                    //表单初始化
                                    F.selectors.addDialogForm.form({
                                            url: F.basepath + '/main/menu/create.html',
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
                                                    F.selectors.menuManageTb.treegrid('load');
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
            if (base.perList.menu.check) {
                F.selectors.menuManageTb.treegrid(_menuTreeGridConfig);
            }

        },
        deleteMenu: function (id) {
            var node = F.selectors.menuManageTb.treegrid('find', id);
            $.messager.confirm('提示', '你确定要删除菜单『' + node.text + '』吗？（删除之后子级菜单也会被删除）', function (r) {
                if (r) {
                    base.ajaxRequest(F.basepath + "/main/menu/del.html", {"id": id}, function (data) {
                        base.ajaxSuccessData(data);
                        F.selectors.menuManageTb.treegrid('load');
                    }, false, "post");
                }
            });
        },
        editMenu: function (id) {

            var node = F.selectors.menuManageTb.treegrid('find', id);

            F.selectors.editDialog.show().dialog({
                cache: false,
                onOpen: function () {
                    //上级菜单设值
                    F.selectors.editDialogMenuList.combotree({
                        queryParams: {'menuId': id},
                        loadFilter: function (data) {
                            if (data.ok) {
                                return data.data;
                            }
                            base.ajaxSuccessData(data);
                        },
                        onLoadSuccess: function () {
                            var parentNode = F.selectors.menuManageTb.treegrid('getParent', id);
                            if (parentNode) {
                                F.selectors.editDialogMenuList.combotree('setValue', parentNode.id);
                            }
                        }
                    });
                    //菜单名字设值
                    $('#main-menu-manage-edit-dialog-form-name').textbox('setValue', node.text);
                    //设置菜单url
                    $('#main-menu-manage-edit-dialog-form-url').textbox('setValue', node.url);
                    //设置菜单排序
                    $('#main-menu-manage-edit-dialog-form-order').textbox('setValue', node.order);
                    //表单初始化
                    F.selectors.editDialogForm.form({
                            url: F.basepath + '/main/menu/edit.html',
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
                                    F.selectors.menuManageTb.treegrid('load');
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
            var _cancel = {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    F.selectors.checkPermissionDialog.dialog('close');
                }
            };
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
                    //菜单
                    var selectedMenu = F.selectors.menuManageTb.treegrid('getSelected');
                    base.ajaxRequest(F.basepath + "/main/menu/grant.html", {
                        "id": selectedMenu.id,
                        peridArray: arr
                    }, function (data) {
                        base.ajaxSuccessData(data);
                        F.selectors.checkPermissionDialog.dialog('close');
                    }, false, "post");
                }
            };
            var _buttons = [];
            if (base.perList.menu.grant) {
                _buttons[0] = _grant;
                _buttons[1] = _cancel;
            } else {
                _buttons[0] = _cancel;
            }
            var newVar = {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    F.selectors.checkPermissionDialog.dialog('close');
                }
            };
            F.selectors.checkPermissionDialog.show().dialog({
                onOpen: function () {
                    F.selectors.checkPermissionDialogPermissionList.tree({
                        url: F.basepath + '/main/get-menu-show-permissions.html',
                        lines: true,
                        checkbox: true,
                        queryParams: {"menuId": id},
                        animate: true,
                        cascadeCheck:false,
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
