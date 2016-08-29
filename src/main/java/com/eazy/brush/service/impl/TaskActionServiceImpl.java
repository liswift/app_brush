package com.eazy.brush.service.impl;

import com.eazy.brush.dao.entity.Action;
import com.eazy.brush.dao.mapper.ActionMapper;
import com.eazy.brush.dao.mapper.TaskActionMapper;
import com.eazy.brush.service.TaskActionService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/8/29 23:26
 */
@Service
public class TaskActionServiceImpl implements TaskActionService {

    @Autowired
    TaskActionMapper taskActionMapper;

    @Autowired
    ActionMapper actionMapper;

    @Override
    public List<Action> getActionsByTaskId(int taskId) {
        List<Integer> actionIds = taskActionMapper.getActionsByTaskId(taskId);
        return actionMapper.getListByIds(StringUtils.join(actionIds, ","));
    }
}
