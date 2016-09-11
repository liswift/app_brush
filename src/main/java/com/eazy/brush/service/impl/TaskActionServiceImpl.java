package com.eazy.brush.service.impl;

import com.eazy.brush.dao.entity.ActionPage;
import com.eazy.brush.dao.mapper.ActionPageMapper;
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
    ActionPageMapper actionPageMapper;

    @Override
    public List<ActionPage> getActionsByTaskId(int taskId) {
        List<Integer> actionIds = taskActionMapper.getActionsByTaskId(taskId);
        return actionPageMapper.getListByIds(StringUtils.join(actionIds, ","));
    }
}
