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

    public void invokeMakeTaskSub() {

        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        log.info("### start invokeMakeTaskSub ###");

        Task task = taskService.getByState(0);

        if (null != task) {
            taskService.changeState(task.getId(), 1);
            taskSubService.makeTaskSub(task);
            taskService.changeState(task.getId(), TaskState.running.getCode());
            log.info("### make tasksubs success！,task_id {} ###", task.getId());
        }

        log.info("### end invokeMakeTaskSub,cost {} s ###", stopWatch.getTotalTimeSeconds());
        stopWatch.stop();
    }

    @Test
    public void testInvokeMakeTaskSub() {
        invokeMakeTaskSub();
    }
}
