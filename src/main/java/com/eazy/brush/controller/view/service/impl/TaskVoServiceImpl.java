package com.eazy.brush.controller.view.service.impl;

import com.eazy.brush.controller.view.service.TaskVoService;
import com.eazy.brush.controller.view.vo.TaskVo;
import com.eazy.brush.core.enums.TaskState;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.service.ConfService;
import com.eazy.brush.service.TaskService;
import com.eazy.brush.service.TaskSubService;
import com.google.common.collect.Lists;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/4 17:27
 */
@Service
public class TaskVoServiceImpl implements TaskVoService {

    @Autowired
    TaskService taskService;

    @Autowired
    TaskSubService taskSubService;

    @Autowired
    ConfService confService;

    public List<TaskVo> getTaskVos(List<Task> tasks) {
        List<TaskVo> taskVos = Lists.newArrayList();


        for (Task task : tasks) {
            TaskVo taskVo = new TaskVo();
            taskVo.setId(task.getId());
            taskVo.setMsg(task.getMsg());
            taskVo.setRemarkName(task.getRemarkName());
            taskVo.setCreateTime(new DateTime(task.getCreateTime()).toString("yyyy-MM-dd HH:mm:ss"));
            taskVo.setIncrDay(task.getIncrDay());

            taskVo.setAmount(task.getIncrDay());
            taskVo.setTodayNum(taskSubService.getTodayCount(task.getId()));
            taskVo.setYestodayNum(taskSubService.getYestdayCount(task.getId()));
            taskVo.setIntState(task.getState());
            TaskState taskState = TaskState.valueOf(task.getState());
            if (null != taskState) {
                taskVo.setState(taskState.getName());
            }

            taskVos.add(taskVo);
        }
        return taskVos;
    }

    @Override
    public List<TaskVo> getList(int userId, int offset, int size) {

        List<Task> tasks = taskService.getList(userId, offset, size);
        return getTaskVos(tasks);
    }

    @Override
    public List<TaskVo> getList(int offset, int size) {
        List<Task> tasks = taskService.getList(offset, size);
        return getTaskVos(tasks);
    }

    @Override
    public List<TaskVo> getList(int userId) {
        List<Task> tasks=taskService.getList(userId);
        return getTaskVos(tasks);
    }

    @Override
    public int stop(int userId, int task_id) {
        int size=taskSubService.deleteByUserIdTaskId(userId,task_id);
        taskService.changeState(task_id,TaskState.stoped.getCode(),"用户手动停止");
        return size;
    }

    @Override
    public int start(int userId, int task_id) {
        Task task=taskService.getById(task_id);
        taskSubService.makeIncrDayTaskSub(task);
        taskService.changeState(task_id,TaskState.running.getCode(),"");
        return 0;
    }

    @Override
    public int delete(int userId, int task_id) {
        //先把所有的子任务删除,如果有的话,然后直接把任务删除
        taskSubService.deleteByUserIdTaskId(userId,task_id);
        taskService.delete(task_id);
        return taskService.delete(task_id);
    }

    @Override
    public void changeStrategy(int userId, int task_id) {
       taskSubService.deleteByUserIdTaskId(userId,task_id);//删除老策略任务
       Task task=taskService.getById(task_id);
        if(task.getState()==TaskState.running.getCode()){
            taskService.changeState(task_id,TaskState.stoped.getCode(),"更新策略,自动停止,需要重新启动");
        }
    }
}
