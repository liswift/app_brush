package com.eazy.brush.service;

import com.eazy.brush.dao.entity.ActionGroup;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/10 22:45
 */
public interface ActionGroupService {

    List<ActionGroup> getByIds(String actionGroupId);

    List<ActionGroup> getByPageActionId(int pageActionId);

    void deleteByPageId(int pageId);

    void insert(List<ActionGroup> actionGroups);
}
