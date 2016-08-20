// 所有模块都通过 define 来定义
define(function (require, exports, module) {
    var base = require('base');
    // 通过 require 引入依赖
    var F = module.exports = {
        basepath: '',
        init: function (_basepath) {
            F.basepath = _basepath;
            var _treeConfig ={
                url: F.basepath + '/main/department/get-show-departments.html',
                idField: 'id',
                treeField: 'text',
                singleSelect: true,
                lines: true,
                animate: true,
                rownumbers: false,
                columns: [[
                    {
                        title: '部门名字',
                        field: 'text',
                        width: '60%'
                    },
                    {
                        field: 'order',
                        title: '排序',
                        width: '5%'
                    },
                    {
                        field: 'action',
                        title: '操作',
                        width: '30%',
                        hidden:true,
                        formatter: function (value, row, index) {

                            var _btnAction = "";
                            if (base.perList.department.edit) {
                                _btnAction += "<a href='javascript:void(0)' onclick='editDepartment(" + row.id + ")' class='easyui-linkbutton'iconCls='icon-edit' plain='true'>编辑</a>";
                            }
                            if (base.perList.department.del) {
                                _btnAction += "<a href='javascript:void(0)' onclick='delDepartment(" + row.id + ")' plain='true' class='easyui-linkbutton'iconCls='icon-remove'>删除</a>";
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
                    if (base.perList.department.edit||base.perList.department.del) {
                        $('#main-department-manage-department-tb').treegrid("showColumn", "action");
                    }
                },
                loadFilter: function (data, pId) {
                    if (data.ok) {
                        return data.data
                    }
                    base.ajaxSuccessData(data);
                }

            };
            if(base.perList.department.create){
                _treeConfig.toolbar=[
                    {
                        iconCls: 'icon-add',
                        text: '添加部门',
                        handler: function () {
                            $('#main-department-manage-add-dialog').show().dialog({
                                cache: false,
                                onClose:function(){
                                    $('#main-department-manage-add-dialog-form').form('clear');
                                },
                                onOpen: function () {
                                    $('#main-department-manage-add-dialog-parent-deplist').combotree({
                                        loadFilter: function (data) {
                                            if (data.ok) {
                                                return data.data;
                                            }
                                            base.ajaxSuccessData(data);
                                        }
                                    });
                                    //表单初始化
                                    $('#main-department-manage-add-dialog-form').form({
                                            url: F.basepath + '/main/department/create.html',
                                            ajax: true,
                                            onSubmit: function(param){
                                                param.ajax = 'true';
                                            },
                                            success: function (data) {
                                                data = $.parseJSON(data);
                                                base.ajaxSuccessData(data);
                                                if (data.ok) {
                                                    $('#main-department-manage-add-dialog').dialog('close');
                                                    $('#main-department-manage-department-tb').treegrid('load');

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
                                        $('#main-department-manage-add-dialog-form').form('submit');
                                    }
                                }]
                            });
                        }
                    }
                ];
            }
            $('#main-department-manage-department-tb').treegrid(_treeConfig);
        },
        delDepartment: function (id) {
            var node = $('#main-department-manage-department-tb').treegrid('find', id);

            var parentNode = $('#main-department-manage-department-tb').treegrid('getParent', id);
            if (!parentNode) {
                $.messager.alert('提示', '根级部门不能删除', 'warning');
                return;
            }

            $.messager.confirm('提示', '你确定要删除部门『' + node.text + '』吗？（删除之后子级部门以及相关部门人员也会被删除）', function (r) {
                if (r) {
                    base.ajaxRequest(F.basepath + "/main/department/del.html", {"depId": id}, function (data) {
                        base.ajaxSuccessData(data);
                        $('#main-department-manage-department-tb').treegrid('load');
                    }, false, "post");
                }
            });
        },
        editDepartment: function (id) {
            var node = $('#main-department-manage-department-tb').treegrid('find', id);
            var parentNode = $('#main-department-manage-department-tb').treegrid('getParent', id);
            if (!parentNode) {
                $.messager.alert('提示', '您所在部门不能编辑', 'warning');
                return;
            }

            $('#main-department-manage-edit-dialog').show().dialog({
                cache: false,
                onOpen: function () {
                    //上级部门设值
                    $('#main-department-manage-edit-dialog-parent-departmentlist').combotree({
                        queryParams:{'depId':id},
                        loadFilter: function (data) {
                            if (data.ok) {
                                return data.data;
                            }
                            base.ajaxSuccessData(data);
                        },
                        onLoadSuccess: function () {
                            var parentNode = $('#main-department-manage-department-tb').treegrid('getParent', id);
                            if (parentNode) {
                                $('#main-department-manage-edit-dialog-parent-departmentlist').combotree('setValue', parentNode.id);
                            }
                        }
                    });
                    //部门名字设值
                    $('#main-department-manage-edit-dialog-form-name').textbox('setValue', node.text);
                    //部门权限排序
                    $('#main-department-manage-edit-dialog-form-order').textbox('setValue', node.order);
                    //表单初始化
                    $('#main-department-manage-edit-dialog-form').form({
                            url: F.basepath + '/main/department/edit.html',
                            ajax: true,
                            queryParams: {
                                "id": id
                            },
                            onSubmit: function(param){
                                param.ajax = 'true';
                            },
                            success: function (data) {
                                data = $.parseJSON(data);
                                base.ajaxSuccessData(data);
                                if (data.ok) {
                                    $('#main-department-manage-edit-dialog').dialog('close');
                                    $('#main-department-manage-department-tb').treegrid('load');
                                    $('#main-department-manage-edit-dialog-form').form('clear');
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
                        $('#main-department-manage-edit-dialog-form').form('submit');
                    }
                }]
            });
        }
    };
    window.delDepartment = F.delDepartment;
    window.editDepartment = F.editDepartment;

});
