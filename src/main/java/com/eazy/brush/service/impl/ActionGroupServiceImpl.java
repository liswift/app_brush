package com.eazy.brush.service.impl;

import com.eazy.brush.dao.entity.ActionGroup;
import com.eazy.brush.dao.mapper.ActionGroupMapper;
import com.eazy.brush.service.ActionGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/10 22:46
 */
@Service
public class ActionGroupServiceImpl implements ActionGroupService {

    @Autowired
    ActionGroupMapper actionGroupMapper;

    @Override
    public List<ActionGroup> getByIds(String actionGroupId) {
        return actionGroupMapper.getByIds(actionGroupId);
    }

    @Override
    public List<ActionGroup> getByPageActionId(int pageActionId) {
        return actionGroupMapper.getByActionPageId(pageActionId);
    }

    @Override
    public void deleteByPageId(int pageId) {
        actionGroupMapper.deleteByPageId(pageId);
    }

    @Override
    public void insert(List<ActionGroup> actionGroups) {
        for (ActionGroup actionGroup:actionGroups){
            actionGroupMapper.insert(actionGroup);
        }
    }
}
