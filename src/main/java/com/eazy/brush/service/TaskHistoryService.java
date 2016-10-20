package com.eazy.brush.service;

import com.eazy.brush.dao.entity.TaskHistory;

import java.util.List;

/**
 * Created by yuekuapp on 16-9-19.
 */
public interface TaskHistoryService {
    List<TaskHistory> getByUserId(int userId);

    /**
     * 获取存活的留存数据记录,进行留存数据生成
     * @return
     */
    List<TaskHistory> getActiveTask();

    List<TaskHistory> getAllTask();

    void insert(TaskHistory taskHistory);

    void insert(List<TaskHistory> histories);

    /**
     * 改变剩余的留存天数,以及留存率
     * @param history
     */
    void changeRetainPercent(TaskHistory history);
}
