package com.eazy.brush.service.impl;

import com.eazy.brush.core.enums.TaskSpeedType;
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
    public List<Task> getList(int offset, int size) {
        return taskMapper.getList(offset, size);
    }

    @Override
    public List<Task> getList(int userId, int offset, int size) {
        return taskMapper.getListByUserId(userId, offset, size);
    }

    @Override
    public void add(Task task) {
        taskMapper.insert(task);
    }

    @Override
    public void changeState(int id, int state) {
        taskMapper.changeState(id, state);
    }

    @Override
    public void changeAllState(int state) {
        taskMapper.changeAllState(state);
    }

    @Override
    public double calcRetainPercent(Task task) {
        //Math.pow(27,1d/3) == 27 开 3 次方
        return Math.pow(task.getRetainPercent() * 1.0 / 100, 1d / task.getRetainDay());
    }

    @Override
    public List<Task> getListByState(int state, int offset, int size) {
        return taskMapper.getListByState(state, offset, size);
    }

    @Override
    public List<Task> getEnableList(int state, int offset, int size) {
        return taskMapper.getEnableList(state, offset, size);
    }

    @Override
    public int calcDayTaskNum(Task task, DateTime dateTime) {

        DateTime createDateTime = new DateTime(task.getCreateTime());
        int interHour = task.getRunEndTime() - createDateTime.getHourOfDay();

        //第一天需要跑的任务占比
        double dayOnePercent = task.getRunSpeed() == TaskSpeedType.make_immediate.getCode() ?
                1.0 : interHour * 1.0 / (task.getRunEndTime() - task.getRunStartTime());
        int dayTaskNum = 0;

        int interDay = DateTimeUitl.getDayInter(createDateTime, dateTime);
        double retainPercent = calcRetainPercent(task);
        for (int i = 0; i < interDay && i < task.getRetainDay(); i++) {
            dayTaskNum += task.getIncrDay() * Math.pow(retainPercent, i);
        }
        dayTaskNum += task.getIncrDay() * dayOnePercent * Math.pow(retainPercent, interDay);
        if (dayTaskNum >= task.getDayLimit()) {
            dayTaskNum = task.getDayLimit();
        }
        return dayTaskNum;
    }

    @Override
    public int calcDayRetainNum(Task task, DateTime datetime) {
        DateTime createDateTime = new DateTime(task.getCreateTime());
        int interDay = DateTimeUitl.getDayInter(createDateTime, datetime);
        double retainPercent = calcRetainPercent(task);
        Double num = task.getIncrDay() * Math.pow(retainPercent, interDay);
        return num.intValue();
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
