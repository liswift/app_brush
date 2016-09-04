package com.eazy.brush.service.impl;

import com.eazy.brush.core.utils.DateTimeUitl;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.dao.mapper.TaskMapper;
import com.eazy.brush.service.TaskService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * @author feng.liu
 * @date 2016/8/31 18:03
 */
@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    TaskMapper taskMapper;

    @Override
    public Task getById(int id) {
        return taskMapper.getById(id);
    }

    @Override
    public Task getByState(int state) {
        return taskMapper.getByState(state);
    }

    @Override
    public List<Task> getList(int userId, int offset, int size) {
        return taskMapper.getList(userId, offset, size);
    }

    @Override
    public void changeState(int id, int state) {
        taskMapper.changeState(id, state);
    }

    @Override
    public void changeAllState(int state) {
        taskMapper.changeAllState(state);
    }

    /**
     * 计算
     *
     * @param task 每日留存百分百比
     * @return
     */
    @Override
    public int calcDayTaskNum(Task task, DateTime dateTime) {

        //Math.pow(27,1d/3) == 27 开 3 次方
        double percent = Math.pow(task.getRetainPercent() * 1.0 / 100, 1d / task.getRetainDay());
        DateTime createDateTime = new DateTime(task.getCreateTime());
        int interHour = task.getRunEndTime() - createDateTime.getHourOfDay();

        //第一天需要跑的任务占比
        double dayOnePercent = task.getRunSpeed() == 0 ?
                1.0 : interHour * 1.0 / (task.getRunEndTime() - task.getRunStartTime());
        int dayTaskNum = 0;

        int interDay = DateTimeUitl.getDayInter(createDateTime, dateTime);
        for (int i = 0; i < interDay && i < task.getRetainDay(); i++) {
            dayTaskNum += task.getIncrDay() * Math.pow(percent, i);
        }
        dayTaskNum += task.getIncrDay() * dayOnePercent * Math.pow(percent, interDay);
        if (dayTaskNum >= task.getDayLimit()) {
            dayTaskNum = task.getDayLimit();
        }
        return dayTaskNum;
    }

    @Override
    public int calcDayTaskNumByUserId(int userId, DateTime dateTime) {
        int sum = 0;
        List<Task> list = taskMapper.getByUserId(userId);
        if (!CollectionUtils.isEmpty(list)) {
            for (Task task : list) {
                sum += calcDayTaskNum(task, dateTime);
            }
        }
        return sum;
    }
}
