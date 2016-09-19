package com.eazy.brush.service;

import com.eazy.brush.dao.entity.TaskHistory;

import java.util.List;

/**
 * Created by yuekuapp on 16-9-19.
 */
public interface TaskHistoryService {
    List<TaskHistory> getByUserId(int userId);

    List<TaskHistory> getActiveTask();

    void insert(TaskHistory taskHistory);
}
