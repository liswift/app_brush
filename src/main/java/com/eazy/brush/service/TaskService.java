package com.eazy.brush.service;

import com.eazy.brush.dao.entity.Task;
import org.joda.time.DateTime;

import java.util.List;

/**
 * @author feng.liu
 * @date 2016/8/31 18:02
 */
public interface TaskService {

    Task getById(int id);

    Task getByState(int state);

    List<Task> getList(int userId, int offset, int size);

    void changeState(int id, int state);

    void changeAllState(int state);

    /**
     * 计算 给定时间的子任务数
     *
     * @param task
     * @return
     */
    int calcDayTaskNum(Task task, DateTime dateTime);

    /**
     * 根据userId计算子任务数
     *
     * @param userId
     * @param dateTime
     * @return
     */
    int calcDayTaskNumByUserId(int userId, DateTime dateTime);

    /**
     * 计算任务留存百分比
     * @param task
     * @return
     */
    double calcRetainPercent(Task task);
}
