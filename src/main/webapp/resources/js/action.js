/**
 * Created by liswift on 16/9/12.
 */

$(document).ready(function(){
    var $unitActionBox = $("#unit-action-box");
    var $groupActionBox = $("#group-action-box");
    var $delActionModal = $("#delActionModal");
    var $delGroupModal = $("#delGroupModal");
    var $renameModal = $("#renameModal");
    var $renameInput = $("input",$renameModal);
    var actionsObj = {};
    var currentActionId = null;
    var currentNameDom = null;
    var currentGroupDom = null;

    $('button:not([add_btn])',$unitActionBox).each(function(index,item){
        var actionId = $(item).attr('action_id');
        var $span = $('span',item);
        actionsObj['action_'+actionId] = $span.text();

    });

    $unitActionBox.on('click','button i',function(e){
        e.stopPropagation();
        currentActionId = $(this).parent().attr('action_id');
        $delActionModal.modal('show');
    });

    $("#del-confirm").click(function(e){
        delAction(currentActionId);
        $delActionModal.modal('hide');
    });

    $("#rename-confirm").click(function(e){
        var txt = $renameInput.val().trim();
        currentNameDom && currentNameDom.text(txt);
        $renameModal.modal('hide');
    });


    //确认删除动作组
    $("#del-group-confirm").click(function(e){
        currentGroupDom && currentGroupDom.remove();
        $delGroupModal.modal('hide');
    });

    //动作组改名
    $groupActionBox.on('click','.group-action-name i',function(e){
        currentNameDom = $(this).prev();
        $renameInput.val('');
        $renameModal.modal('show');
    });

    //删除动作组弹窗
    $groupActionBox.on('click','i.group-action-del',function(e){
        currentGroupDom = $(this).parent();
        $delGroupModal.modal('show');
    });

    //添加动作组
    $("#group-action-add").click(function(){
        $('.groups-box',$groupActionBox).append($(createActionGroup()));
    });


    //选择动作
    $()


    //删除动作
    function delAction(actionId){
        var $btn = $('button[action_id='+actionId+']',$unitActionBox);
        if($btn.length){
            var txt = $('span',$btn);
            $btn.remove();
            delete actionsObj['action_'+actionId];
        }
    }

    function createActionsHtml(actions){
        var html = '<span class="dropDown dropDown_hover"><a class="dropDown_A">选择动作</a> >' +
            '<ul class="dropDown-menu menu radius box-shadow" style="max-height: 200px;overflow: auto">' +
            '<li del_li class="del-unit-action-btn"><a>删除此动作</a></li>';
        for(var key in actions){
            html += '<li action_id="'+key.split()[1]+'" class=""><a>'+actions[key]+'</a></li>';
        }
        html += '</ul></span>';

        return html;
    }

    function createActionGroup(data){
        var html = '<div group_id="0" class="group-action-item"><div class="group-action-name"><span>动作组一</span><i>ed</i></div>' +
            '<i class="group-action-del">del</i><div class="group-actions">';

        html += createActionsHtml(actionsObj);
        html += '</div></div>';

        return html;
    }

});



