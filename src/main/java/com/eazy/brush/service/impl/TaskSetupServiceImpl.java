package com.eazy.brush.service.impl;

import com.eazy.brush.dao.entity.TaskSetup;
import com.eazy.brush.dao.mapper.TaskSetupMapper;
import com.eazy.brush.service.TaskSetupService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by yuekuapp on 16-10-5.
 */
public class TaskSetupServiceImpl implements TaskSetupService{
    @Autowired
    TaskSetupMapper taskSetupMapper;

    @Override
    public List<TaskSetup> getAllTaskSetup() {
        return taskSetupMapper.getAllList();
    }

    @Override
    public void insert(TaskSetup taskSetup) {
        taskSetupMapper.insert(taskSetup);
    }

    @Override
    public void update(TaskSetup taskSetup) {
        taskSetupMapper.update(taskSetup.getMaxNum(),taskSetup.getId());
    }

    @Override
    public TaskSetup getByTaskId(int taskId) {
        return taskSetupMapper.getByTaskId(taskId);
    }
}
