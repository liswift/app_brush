package com.eazy.brush.service.impl;

import com.eazy.brush.dao.entity.TaskHistory;
import com.eazy.brush.dao.mapper.TaskHistoryMapper;
import com.eazy.brush.service.TaskHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yuekuapp on 16-9-19.
 */
@Service
public class TaskHistoryServiceImpl implements TaskHistoryService {

    private static final int MIN_RETAINPERCENT=5;//暂时定义>=5的任务记录,可以做留存,小于这个数字留存直接不跑了

    @Autowired
    TaskHistoryMapper taskHistoryMapper;

    @Override
    public List<TaskHistory> getByUserId(int userId) {
        return taskHistoryMapper.getListByUserId(userId);
    }

    @Override
    public List<TaskHistory> getActiveTask() {
        return taskHistoryMapper.getListByMinRetainPercent(MIN_RETAINPERCENT);
    }

    @Override
    public void insert(TaskHistory taskHistory) {
        taskHistoryMapper.insert(taskHistory);
    }


}
