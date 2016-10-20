package com.eazy.brush.service;

import com.eazy.brush.dao.entity.TaskSetup;

import java.util.List;

/**
 * Created by yuekuapp on 16-10-5.
 */
public interface TaskSetupService {

    List<TaskSetup> getAllTaskSetup();

    void insert(TaskSetup taskSetup);

    void update(TaskSetup taskSetup);

    TaskSetup getByTaskId(int taskId);
}
