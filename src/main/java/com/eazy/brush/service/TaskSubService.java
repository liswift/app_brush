package com.eazy.brush.service;

import com.eazy.brush.core.enums.SubTaskState;
import com.eazy.brush.core.enums.SubTaskType;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.dao.entity.TaskHistory;
import com.eazy.brush.dao.entity.TaskSub;

import java.util.List;

/**
 * 元任务相关服务
 * author : liufeng
 * create time:2016/8/28 12:57
 */
public interface TaskSubService {


    /**
     * 这个数据返回的是当前的运行的历史数据
     * 每天凌晨进行历史数据计算,并返回历史数据
     * @return
     */
    List<TaskHistory> getHistoryByCreateDay(int createDay);

    /**
     * 获取未消费的任务集合
     *
     * @param size
     * @return
     */
    List<TaskSub> getUnConsumeList(int size);

    /**
     * 生成每日新增TaskSub
     *
     * @param task
     */
    void makeIncrDayTaskSub(Task task);

    /**
     * 生成每日留存TaskSub
     *
     * @param taskHistory
     */
    void makeRetainDayTaskSub(TaskHistory taskHistory);


    void insertTaskBatch(List<TaskSub> taskSubList);

    /**
     * 修改子任务运行状态
     *
     * @param ids
     * @param subTaskState
     */
    void changeTaskSubState(String ids,SubTaskState subTaskState);


    /**
     * 获取任务今天执行的数目
     * @param taskId
     * @return
     */
    int getTodayCount(int taskId);

    /**
     * 获取昨日的数据量
     * @param taskId
     * @return
     */
    int getYestdayCount(int taskId);

    /**
     * 根据状态获取昨日的历史记录,
     * @param taskType
     * @param state
     * @return
     */
    int getSubTaskCount(SubTaskType taskType,SubTaskState state);


    /**
     * 根据状态获取记录,并删除记录
     * @param taskType
     * @param subTaskState
     * @return
     */
    int getSubTaskAndDelete(SubTaskType taskType,SubTaskState subTaskState);

    /**
     * 删除没用的记录task,
     * 新增失败,新增未做
     * 以及所有留存数据
     */
    void deleteOldUnUseData(int createDay);
}

