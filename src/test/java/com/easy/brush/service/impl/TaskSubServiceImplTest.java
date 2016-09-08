package com.easy.brush.service.impl;

import com.eazy.brush.core.enums.TaskState;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.service.TaskService;
import com.eazy.brush.service.TaskSubService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.StopWatch;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/2 22:58
 */
@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TaskSubServiceImplTest {

    @Autowired
    TaskSubService taskSubService;

    @Autowired
    TaskService taskService;

    public void invokeMakeIncrDayTaskSub() {

        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        log.info("### start invokeMakeTaskSub ###");

        Task task = taskService.getByState(TaskState.confirm_passed.getCode());

        if (null != task) {
            taskService.changeState(task.getId(), TaskState.running.getCode());
            taskSubService.makeIncrDayTaskSub(task);
            taskService.changeState(task.getId(), TaskState.run_end.getCode());
            log.info("### make tasksubs success！,task_id {} ###", task.getId());
        }

        log.info("### end invokeMakeTaskSub,cost {} s ###", stopWatch.getTotalTimeSeconds());
        stopWatch.stop();
    }

    @Test
    public void testInvokeMakeTaskSub() {
        invokeMakeIncrDayTaskSub();
    }

    @Test
    public void testMakeRetainDayTaskSub() {
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        log.info("### start makeRetainDayTaskSub ###");

        List<Task> list = taskService.getEnableList(TaskState.stoped.getCode(), 0, Integer.MAX_VALUE);
        for (Task task : list) {
            log.info("### start makeRetainDayTaskSub ###");
            taskSubService.makeRetainDayTaskSub(task);
            log.info("### end makeRetainDayTaskSub,cost {} s ###", stopWatch.getTotalTimeSeconds());
        }

        log.info("### end makeRetainDayTaskSub,cost {} s ###", stopWatch.getTotalTimeSeconds());
        stopWatch.stop();
    }

}
