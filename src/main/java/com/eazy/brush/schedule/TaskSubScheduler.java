package com.eazy.brush.schedule;

import com.eazy.brush.core.enums.TaskState;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.service.TaskService;
import com.eazy.brush.service.TaskSubService;
import com.google.common.base.Stopwatch;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.concurrent.TimeUnit;

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

        Stopwatch stopwatch = Stopwatch.createStarted();
        log.info("### start invokeMakeTaskSub ###");

        Task task = taskService.getByState(TaskState.confirm_passed.getCode());

        if (null != task) {
            taskService.changeState(task.getId(), TaskState.running.getCode(),"");

            log.info("### start makeIncrDayTaskSub ###");
            taskSubService.makeIncrDayTaskSub(task);
            log.info("### end makeIncrDayTaskSub,cost {} s ###", stopwatch.elapsed(TimeUnit.SECONDS));

            taskService.changeState(task.getId(), TaskState.run_end.getCode(),"");
            log.info("### make tasksubs success！,task_id {} ###", task.getId());
        }

        log.info("### end invokeMakeTaskSub,cost {} s ###", stopwatch.elapsed(TimeUnit.SECONDS));
        stopwatch.stop();
    }

    /**
     * 这个写的不对吧?
     * 把所有已经停止的任务,全部搞成通过?什么个意思?
     */
    @Scheduled(cron = "0 0 0  * * ? ")
    public void changeTaskState() {
        List<Task> list = taskService.getEnableList(TaskState.stoped.getCode(), 0, Integer.MAX_VALUE);
        for (Task task : list) {
            taskService.changeState(task.getId(), TaskState.confirm_passed.getCode(),"");
        }
        log.info("### change enable Task State success ###");
    }

    @Scheduled(cron = "0 0 0  * * ? ")
    public void makeRetainDayTaskSub() {
        Stopwatch stopWatch = Stopwatch.createStarted();
        log.info("### start makeRetainDayTaskSub ###");

        List<Task> list = taskService.getListByState(TaskState.confirm_passed.getCode(), 0, Integer.MAX_VALUE);
        for (Task task : list) {
            log.info("### start makeRetainDayTaskSub ###");
            taskSubService.makeRetainDayTaskSub(task);
            log.info("### end makeRetainDayTaskSub,cost {} s ###", stopWatch.elapsed(TimeUnit.SECONDS));
        }

        log.info("### end makeRetainDayTaskSub,cost {} s ###", stopWatch.elapsed(TimeUnit.SECONDS));
        stopWatch.stop();
    }
}
