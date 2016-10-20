package com.eazy.brush.controller.view.service.impl;

import com.eazy.brush.controller.api.service.ActionItemNetService;
import com.eazy.brush.controller.view.service.ActionGroupVoService;
import com.eazy.brush.controller.view.vo.ActionGroupApiVo;
import com.eazy.brush.controller.view.vo.ActionGroupVo;
import com.eazy.brush.controller.view.vo.ActionItemApiArgument;
import com.eazy.brush.controller.view.vo.ActionItemApiVo;
import com.eazy.brush.dao.entity.ActionGroup;
import com.eazy.brush.service.ActionGroupService;
import com.eazy.brush.service.ActionItemService;
import com.eazy.brush.service.ActionItemVoService;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/10 22:41
 */
@Slf4j
@Service
public class ActionGroupVoServiceImpl implements ActionGroupVoService {

    @Autowired
    ActionItemVoService actionItemVoService;

    @Autowired
    ActionItemService actionItemService;

    @Autowired
    ActionGroupService actionGroupService;

    @Override
    public List<ActionGroupVo> getByIds(String actionGroupId) {
        List<ActionGroup> actionGroups = actionGroupService.getByIds(actionGroupId);
        return transforActionGroup(actionGroups);
    }

    @Override
    public List<ActionGroupVo> getByPageId(int pageId) {
        return transforActionGroup(actionGroupService.getByPageActionId(pageId));
    }

    @Override
    public List<ActionGroupApiVo> getApiByPageId(int pageId) {
        return transforActionGroupApi(actionGroupService.getByPageActionId(pageId));
    }

    @Override
    public void update(int pageId, List<ActionGroup> actionGroups) {
        actionGroupService.deleteByPageId(pageId);
        actionGroupService.insert(actionGroups);
    }

    @Override
    public void deleteByPageId(int pageId) {
        actionGroupService.deleteByPageId(pageId);
    }


    private List<ActionGroupApiVo> transforActionGroupApi(List<ActionGroup> actionGroups){

        ActionItemNetService service = new ActionItemNetService();

        List<ActionGroupApiVo> actionGroupApiVos=Lists.newArrayList();
        for(ActionGroup actionGroup:actionGroups){
            if(actionGroup.getEnable()==1&&StringUtils.isNotEmpty(actionGroup.getActionItemIds())){
                ActionGroupApiVo actionGroupApiVo=new ActionGroupApiVo();
                actionGroupApiVo.setActions(actionItemVoService.getApiByIds(actionGroup.getActionItemIds(),service));
                actionGroupApiVos.add(actionGroupApiVo);
            }
        }

        //重新循环过滤,设置新的值。将所有动态参数,替换成静态参数值
        for(ActionGroupApiVo actionGroupApiVo:actionGroupApiVos){
            List<ActionItemApiVo> actions = actionGroupApiVo.getActions();
            for(ActionItemApiVo actionItemApiVo:actions){
                List<ActionItemApiArgument> arguments = actionItemApiVo.getArguments();
                for(ActionItemApiArgument argument:arguments){
                    log.info("change argument:"+argument);
                    argument.setArgmentValue(service.transforValue(argument.getArgmentValue()));
                }
            }
        }

        return actionGroupApiVos;
    }

    private List<ActionGroupVo> transforActionGroup(List<ActionGroup> actionGroups){
         List<ActionGroupVo> actionGroupVos = Lists.newArrayList();
        for (ActionGroup actionGroup : actionGroups) {
            ActionGroupVo actionGroupVo = new ActionGroupVo();
            actionGroupVo.setId(actionGroup.getId());
            actionGroupVo.setName(actionGroup.getName());
            actionGroupVo.setEnable(actionGroup.getEnable());
            if(StringUtils.isNotEmpty(actionGroup.getActionItemIds())){
                actionGroupVo.setAcitionItems(actionItemService.getByIds(actionGroup.getActionItemIds()));
            }
            actionGroupVos.add(actionGroupVo);
        }
       return actionGroupVos;
    }

}
