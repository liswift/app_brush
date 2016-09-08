package com.eazy.brush.schedule;

import com.eazy.brush.core.enums.TaskState;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.service.TaskService;
import com.eazy.brush.service.TaskSubService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/8/31 23:47
 */
@Component
@Slf4j
public class TaskSubScheduler {

    @Autowired
    TaskService taskService;

    @Autowired
    TaskSubService taskSubService;


    @Scheduled(cron = "0 0 0  * * ? ")
    public void resetTaskState() {
        log.info("### start resetTaskState ###");
        taskService.changeAllState(TaskState.confirm_passed.getCode());
        log.info("### end invokeMakeTaskSub ###");
    }

    /**
     * 生成每日task_sub
     */
    @Scheduled(cron = "0 0/1 *  * * ? ")
    public void invokeMakeTaskSub() {

        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        log.info("### start invokeMakeTaskSub ###");

        Task task = taskService.getByState(TaskState.confirm_passed.getCode());

        if (null != task) {
            taskService.changeState(task.getId(), TaskState.running.getCode());

            log.info("### start makeIncrDayTaskSub ###");
            taskSubService.makeIncrDayTaskSub(task);
            log.info("### end makeIncrDayTaskSub,cost {} s ###", stopWatch.getTotalTimeSeconds());

            taskService.changeState(task.getId(), TaskState.run_end.getCode());
            log.info("### make tasksubs success！,task_id {} ###", task.getId());
        }

        log.info("### end invokeMakeTaskSub,cost {} s ###", stopWatch.getTotalTimeSeconds());
        stopWatch.stop();
    }

    @Scheduled(cron = "0 0 0  * * ? ")
    public void changeTaskState() {
        List<Task> list = taskService.getEnableList(TaskState.stoped.getCode(), 0, Integer.MAX_VALUE);
        for (Task task : list) {
            taskService.changeState(task.getId(), TaskState.confirm_passed.getCode());
        }
        log.info("### change enable Task State success ###");
    }

    @Scheduled(cron = "0 0 0  * * ? ")
    public void makeRetainDayTaskSub() {
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        log.info("### start makeRetainDayTaskSub ###");

        List<Task> list = taskService.getListByState(TaskState.confirm_passed.getCode(), 0, Integer.MAX_VALUE);
        for (Task task : list) {
            log.info("### start makeRetainDayTaskSub ###");
            taskSubService.makeRetainDayTaskSub(task);
            log.info("### end makeRetainDayTaskSub,cost {} s ###", stopWatch.getTotalTimeSeconds());
        }

        log.info("### end makeRetainDayTaskSub,cost {} s ###", stopWatch.getTotalTimeSeconds());
        stopWatch.stop();
    }
}
