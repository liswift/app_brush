/**
 * Created by liswift on 16/9/12.
 */

$(document).ready(function () {
    var $unitActionBox = $("#unit-action-box");
    var $addActionBtn = $("button[add_btn]", $unitActionBox);
    var $groupActionBox = $("#group-action-box");
    var $delActionModal = $("#delActionModal");
    var $delGroupModal = $("#delGroupModal");
    var $renameModal = $("#renameModal");
    var $editActionModal = $("#editActionModal");
    var $actionGroupAddBtn = $("#action-group-add-btn");
    var $renameInput = $("input", $renameModal);
    var actionsObj = {};
    var currentActionId = null;
    var currentNameDom = null;
    var currentGroupDom = null;

    var taskId = $('#add-page-hidden').attr('task_id');
    var pageId = $('#add-page-hidden').attr('page_id');


    //全局事件派发器,可在不同子iframe间通信.
    top.window.eventEmitter.addListener('actionSubmitOk', function (data) {
        $editActionModal.modal('hide');
        updateActions(data);
    });

    $actionGroupAddBtn.on('click', function () {
        var params = {};
        params.id = pageId;
        params.taskId = taskId;
        params.pageName = $("#page-name").val().trim();
        params.pageDesc = $("#page-desc").val().trim();

        var actionsGroups = [];
        $('div.group-action-item', $groupActionBox).each(function (index, item) {
            var $item = $(item);
            var name = $(".group-action-name span", $item).text();
            var actionItemIds = [];
            $('a.action-selected-a', $item).each(function (idx, itemA) {
                var aId = $(itemA).attr('action_id');
                if(typeof(aId)!='undefined'){
                    actionItemIds.push(aId);
                }
            });
            actionsGroups.push({
                actionPageId: pageId,
                name: name,
                actionItemIds: actionItemIds.join(',')
            })
        });
        params.actionGroups=actionsGroups;
        ajaxPostJSON("/audit/addActionPage",params,function(d){
            parent.location.reload();
            layer_close();
        },function (res) {
            alert("添加失败")
        });
        //top.window.eventEmitter.emit('actionSubmitOk',{action_id:'0',action_name:'hahaha'})
    });


    $('button:not([add_btn])', $unitActionBox).each(function (index, item) {
        var actionId = $(item).attr('action_id');
        var $span = $('span', item);
        actionsObj['action_' + actionId] = $span.text();

    });

    //删除元动作
    $unitActionBox.on('click', 'button i', function (e) {
        e.stopPropagation();
        currentActionId = $(this).parent().attr('action_id');
        $delActionModal.modal('show');
    });

    //添加查看修改元动作
    $unitActionBox.on('click', 'button', function (e) {
        currentActionId = $(this).attr('action_id');
        /*var isAdd = $(this).is('[add_btn]');
         var $newBody = createActionModalBody({},isAdd);
         console.log($newBody)
         $editModalBody.empty().append($newBody);*/

        //$editActionModal.modal('show');

        if(typeof (currentActionId)=="undefined"){
            currentActionId=0;
        }
        $editActionModal.load('../action/toUnitAdd?id=' + currentActionId + '&pageId=' + pageId, function () {
            $editActionModal.modal();
        })
    });

    $("#del-confirm").click(function (e) {
        delAction(currentActionId);
        $delActionModal.modal('hide');
    });

    $("#rename-confirm").click(function (e) {
        var txt = $renameInput.val().trim();
        currentNameDom && currentNameDom.text(txt);
        $renameModal.modal('hide');
    });


    //确认删除动作组
    $("#del-group-confirm").click(function (e) {
        currentGroupDom && currentGroupDom.remove();
        $delGroupModal.modal('hide');
    });

    //动作组改名
    $groupActionBox.on('click', '.group-action-name i', function (e) {
        currentNameDom = $(this).prev();
        $renameInput.val('');
        $renameModal.modal('show');
    });

    //删除动作组弹窗
    $groupActionBox.on('click', 'i.group-action-del', function (e) {
        currentGroupDom = $(this).parent();
        $delGroupModal.modal('show');
    });

    //添加动作组
    $("#group-action-add").click(function () {
        $('.groups-box', $groupActionBox).append($(createActionGroup()));
    });


    //动作组里选择动作
    $groupActionBox.on('click', 'li.action-li', function (e) {
        var txt = $(this).text();
        var actionId = $(this).attr('action_id');
        var $a = $(this).parent().siblings('a');
        $a.text(txt).attr('action_id', actionId);
        var $span = $(this).parent().parent();
        var $nextSpan = $span.next('span');
        if (!$nextSpan.length) {
            $span.after($(createActionsHtml(actionsObj)));
        }
    });

    //删除动作组里某个已选动作
    $groupActionBox.on('click', 'li.del-unit-action-btn', function (e) {
        var $span = $(this).parent().parent();
        deleteActionSpan($span);
    });


    //删除动作组里某个已选动作
    function deleteActionSpan($span) {
        var $nextSpan = $span.next('span');
        var $prevSpan = $span.prev('span');
        if (!$prevSpan.length && !$nextSpan.length) {
            $span.children('.action-selected-a').attr('action_id', null).text('选择动作');
        }
        else {
            $span.remove();
        }
    }

    //动作组里所有和将要被删除的元动作有关的动作,都要删除掉.
    function delSelectedActions(action_id) {
        $('a.action-selected-a', $groupActionBox).each(function (index, item) {
            var actionId = $(item).attr('action_id');
            if (action_id == actionId) {
                deleteActionSpan($(item).parent());
            }

        });
        $('li.action-li', $groupActionBox).each(function (index, item) {
            var actionId = $(item).attr('action_id');
            if (action_id == actionId) {
                $(item).remove();
            }

        });
    }

    //新增或修改某个元动作后,更新动作组页面里与此元动作相关的结构.
    function updateActions(data) {
        var action_id = data.action_id;
        var action_name = data.action_name;

        var $action_btn = $('button[action_id=' + action_id + ']', $unitActionBox);
        if ($action_btn.length) {
            $action_btn.find('span').text(action_name);
        } else {
            var html = '<button action_id="' + action_id + '" class="btn btn-default radius"><span>' + action_name + '</span><i class="unit-action-del"></i></button>';
            $addActionBtn.before($(html));
        }

        var items_a = $('a.action-selected-a,li.action-li', $groupActionBox).filter(function (index, item) {
            var actionId = $(item).attr('action_id');
            return action_id == actionId;
        });

        if (items_a.length) {
            items_a.each(function (index, item) {
                var txt = $(item).text();
                $(item).is('a') ? $(item).text(action_name) : $(item).children('a').text(action_name);
            });
        } else {
            actionsObj['action_' + action_id] = action_name;
            $('.action-ul', $groupActionBox).each(function (index, item) {
                $(item).append($('<li action_id="' + action_id + '" class="action-li"><a>' + action_name + '</a></li>'));
            });
        }

    }

    //删除元动作
    function delAction(actionId) {
        var $btn = $('button[action_id=' + actionId + ']', $unitActionBox);
        var param={};
        if ($btn.length) {
            var txt = $('span', $btn);
            param.id=actionId;
            ajaxPost('/action/delete',param,function(d){
                //删除请求成功:
                $btn.remove();
                delete actionsObj['action_' + actionId];
                delSelectedActions(actionId);
            },function(res){
                //删除请求失败:
                alert('删除失败');
            });
        }
    }

    function createActionsHtml(actions) {
        var html = '<span class="dropDown dropDown_hover"><a class="dropDown_A action-selected-a">选择动作</a> >&nbsp;' +
            '<ul class="dropDown-menu menu radius box-shadow action-ul" style="max-height: 200px;overflow: auto">' +
            '<li class="del-unit-action-btn"><a>删除此动作</a></li>';
        for (var key in actions) {
            html += '<li action_id="' + key.split('_')[1] + '" class="action-li"><a>' + actions[key] + '</a></li>';
        }
        html += '</ul></span>';

        return html;
    }

    function createActionGroup(data) {
        var html = '<div group_id="0" class="group-action-item"><div class="group-action-name"><span>动作组一</span><i>ed</i></div>' +
            '<i class="group-action-del">del</i><div class="group-actions">';

        html += createActionsHtml(actionsObj);
        html += '</div></div>';

        return html;
    }


});



