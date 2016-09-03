package com.eazy.brush.schedule;

import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.service.TaskService;
import com.eazy.brush.service.TaskSubService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

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
        taskService.changeAllState(System.currentTimeMillis());
        log.info("### end invokeMakeTaskSub ###");
    }

    @Scheduled(cron = "0 0/1 *  * * ? ")
    public void invokeMakeTaskSub() {

        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        log.info("### start invokeMakeTaskSub ###");

        Task task = taskService.getByState(0);

        if (null != task) {
            taskService.changeState(task.getId(), 1);
            taskSubService.makeTaskSub(task);
            taskService.changeState(task.getId(), System.currentTimeMillis());
            log.info("### make tasksubs success！,task_id {} ###", task.getId());
        }

        log.info("### end invokeMakeTaskSub,cost {} s ###", stopWatch.getTotalTimeSeconds());
        stopWatch.stop();
    }
}
