<div class="modal-header">
    <h3 id="editActionLabel">添加动作</h3><a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
</div>
<div class="modal-body" style="overflow: hidden" id="edit-modal-body" >
    <div class="add-task-form form-horizontal"  style="width: 700px;max-height: 450px;overflow: auto">
        <div class="row cl">
            <div class="formControls col-xs-8 col-sm-8">
                <label class="form-label col-xs-3 col-sm-3">名称：</label>
                <div class="formControls col-xs-9 col-sm-9">
                    <input type="text" action_name="name"  class="input-text" autocomplete="off">
                </div>
            </div>
        </div>
        <div class="row cl">
            <div class="formControls col-xs-8 col-sm-8">
                <label class="form-label col-xs-3 col-sm-3">View类名：</label>
                <div class="formControls col-xs-9 col-sm-9">
                    <input type="text"  action_name="viewName"  class="input-text" autocomplete="off">
                </div>
            </div>
        </div>
        <div class="row cl">
            <div class="formControls col-xs-8 col-sm-8">
                <label class="form-label col-xs-3 col-sm-3">ViewID：</label>
                <div class="formControls col-xs-9 col-sm-9">
                    <input type="text" action_name="viewId"  class="input-text" autocomplete="off">
                </div>
            </div>
        </div>
        <div class="row cl">
            <div class="formControls col-xs-8 col-sm-8">
                <label class="form-label col-xs-3 col-sm-3">View内容：</label>
                <div class="formControls col-xs-9 col-sm-9">
                    <input type="text" action_name="viewContent"  class="input-text" autocomplete="off">
                </div>
            </div>
        </div>
        <div class="row cl">
            <div class="formControls col-xs-8 col-sm-8">
                <label class="form-label col-xs-3 col-sm-3">动作：</label>
                <div class="formControls col-xs-9 col-sm-9">
                        <span class="select-box">
                          <select class="select" size="1" name="action" id="real-action-select" action_name="action">
                              <option value="">请选择动作</option>
                              <option value="ACTION_FOCUS">ACTION_FOCUS</option>
                              <option value="ACTION_CLEAR_FOCUS">ACTION_CLEAR_FOCUS</option>
                              <option value="ACTION_SELECT">ACTION_SELECT</option>
                              <option value="ACTION_CLEAR_SELECTION">ACTION_CLEAR_SELECTION</option>
                              <option value="ACTION_CLICK">ACTION_CLICK</option>
                              <option value="ACTION_LONG_CLICK">ACTION_LONG_CLICK</option>
                              <option value="ACTION_ACCESSIBILITY_FOCUS">ACTION_ACCESSIBILITY_FOCUS</option>
                              <option value="ACTION_CLEAR_ACCESSIBILITY_FOCUS">ACTION_CLEAR_ACCESSIBILITY_FOCUS</option>
                              <option value="ACTION_NEXT_AT_MOVEMENT_GRANULARITY">ACTION_NEXT_AT_MOVEMENT_GRANULARITY</option>
                              <option value="ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY">ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY</option>
                              <option value="ACTION_NEXT_HTML_ELEMENT">ACTION_NEXT_HTML_ELEMENT</option>
                              <option value="ACTION_PREVIOUS_HTML_ELEMENT">ACTION_PREVIOUS_HTML_ELEMENT</option>
                          </select>
                        </span>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-2 col-sm-2">动作参数：</label>
            <div class="col-xs-6 col-sm-6" id="action-params-box" style="margin-left:-5px">

                <button class="btn btn-primary radius param-add-btn" style="padding: 0 20px;">+</button>
            </div>
        </div>
        <div class="row cl">
            <div class="formControls col-xs-4 col-sm-4">
                <label class="form-label col-xs-6 col-sm-6">停留时间：</label>
                <div class="formControls col-xs-3 col-sm-3">
                    <input type="text"  action_name="stayTime"  style="margin-left: 2px" class="input-text" autocomplete="off">
                </div>
                <label class="form-label col-xs-3 col-sm-3">秒，</label>
            </div>
            <div class="formControls col-xs-4 col-sm-4">
                <label class="form-label col-xs-5 col-sm-5">波动范围：</label>
                <div class="formControls col-xs-3 col-sm-3">
                    <input type="text"  action_name="upDown" class="input-text" autocomplete="off">
                </div>
                <label class="form-label col-xs-3 col-sm-3">秒</label>
            </div>
        </div>
        <div class="row cl" style="margin-top:50px">
            <div class="col-xs-10 col-sm-10 col-xs-offset-1 col-sm-offset-1">
                <input id="action-confirm-btn" class="btn btn-primary radius" type="submit" style="width: 90px;margin-left:-5px" value="确定">
                <input id="action-cancel-btn" class="btn btn-default radius" type="submit" data-dismiss="modal" aria-hidden="true" style="width: 90px;margin-left:150px" value="取消">
            </div>
        </div>
    </div>
</div>

<script>
    /*
     * 新增/编辑元动作
     *
     * */
    var $editModalBody = $("#edit-modal-body");
    var $actionParamBox = $("#action-params-box");
    var $realActionSelect = $("#real-action-select");
    var taskId = $('#add-page-hidden').attr('task_id');
    var pageId = $('#add-page-hidden').attr('page_id');

    $actionParamBox.on('click','button.param-add-btn',function(e){
        $(this).before($(createActionParam()));
    });
    $actionParamBox.on('click','button.param-del-btn',function(e){
        var $paramItem = $(this).parent().parent();
        delActionParam($paramItem);
    });

    $editModalBody.on('click','#action-confirm-btn',function(){
        var params = {};

        $("input[action_name]",$editModalBody).each(function(index,item){
            var $input = $(item);
            var name = $input.attr('action_name')||'';
            params[name] = $input.val().trim();
        });
        params.action =  $realActionSelect.val();

        var actionsArr = [];
        $(".action-params-item",$actionParamBox).each(function(index,item){
            var $item = $(item);
            var $select = $('select',$item);
            var $childInput = $('input',$item);
            actionsArr.push($select.val()+':'+$childInput.val().trim());
        });
        params.actionParams = actionsArr.join(';');

        params.id = taskId;
        params.actionPageId = pageId;

        ajaxPost('/action/add',params,function(d){
            console.log(d);
        },function(res){
            console.log(res)
        });

        top.window.eventEmitter.emit('actionSubmitOk',{action_id:'0',action_name:'ha21ha'});
    });

    function submitForm(params){
        ajaxPost('/api',params,function(d){

            //通知动作组页面执行关闭动作页面或更新修改了的动作.
            top.window.eventEmitter.emit('actionSubmitOk',{action_id:12,action_name:'haha'});
        },function(d){});
    }

    function delActionParam($paramItem){
        $paramItem.remove();
    }

    function createActionParam(){
        var html = '';
        html += '<div class="action-params-item"><div class="col-xs-5 col-sm-5"><span class="select-box">' +
                '<select class="select" size="1" name="arguments">' +
                '<option value="" selected>请填写动作参数类型</option>' +
                '<option value="ACTION_ARGUMENT_MOVEMENT_GRANULARITY_INT">ACTION_ARGUMENT_MOVEMENT_GRANULARITY_INT</option>' +
                '<option value="ACTION_ARGUMENT_HTML_ELEMENT_STRING">ACTION_ARGUMENT_HTML_ELEMENT_STRING</option>' +
                '</select></span></div>' +
                '<div class="col-xs-5 col-sm-5" style="margin-left: 10px">' +
                '<input type="text" class="input-text" placeholder="请填写动作参数值" autocomplete="off"></div>' +
                '<div class="col-xs-1 col-sm-1" style="margin-left: 10px">' +
                '<button class="btn btn-danger radius param-del-btn" style="padding: 0 10px;width:31px">x</button>' +
                '</div></div>';

        return html;
    }

    function getEditData(callback){
        ajaxPost('/api',{},function(d){
            $.isFunction(callback) && callback(d);
        },function(d){});
    }

    function createActionModalBody(data,isAdd){
        var $newBody = $('div.add-task-form',$editModalBody).clone(true);
        $('input,select',$newBody).each(function(index,item){
            var $item = $(item);
            var prop = $item.is('input') ? 'readonly' : 'disabled';
            if(!isAdd){
                $item.prop(prop,true);
            }
            else{
                $item.prop(prop,false);
            }
        });

        $('input,select',$actionParamBox).each(function(index,item){
            var $item = $(item);
            var prop = $item.is('input') ? 'readonly' : 'disabled';
            if(!isAdd){
                $item.prop(prop,true);
            }
            else{
                $item.prop(prop,false);
            }
        });

        if(!isAdd){
            $('.param-del-btn,.param-add-btn',$newBody).remove();
            $('#action-confirm-btn',$newBody).remove();
            $('#action-cancel-btn',$newBody).css('margin-left','120px').text('关闭');
        }

        return $newBody;
    }
</script>
