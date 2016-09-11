package com.eazy.brush.controller.view.service.impl;

import com.eazy.brush.controller.view.service.ActionGroupVoService;
import com.eazy.brush.controller.view.vo.ActionGroupVo;
import com.eazy.brush.dao.entity.ActionGroup;
import com.eazy.brush.service.ActionGroupService;
import com.eazy.brush.service.ActionItemService;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/10 22:41
 */
@Service
public class ActionGroupVoServiceImpl implements ActionGroupVoService {

    @Autowired
    ActionItemService actionItemService;

    @Autowired
    ActionGroupService actionGroupService;

    @Override
    public List<ActionGroupVo> getByIds(String actionGroupId) {
        List<ActionGroup> actionGroups = actionGroupService.getByIds(actionGroupId);
        List<ActionGroupVo> actionGroupVos = Lists.newArrayList();
        for (ActionGroup actionGroup : actionGroups) {
            ActionGroupVo actionGroupVo = new ActionGroupVo();
            actionGroupVo.setId(actionGroup.getId());
            actionGroupVo.setName(actionGroup.getName());
            actionGroupVo.setEnable(actionGroup.getEnable());
            actionGroupVo.setAcitionItems(actionItemService.getByIds(actionGroup.getItemId()));
            actionGroupVos.add(actionGroupVo);
        }
        return actionGroupVos;
    }
}
