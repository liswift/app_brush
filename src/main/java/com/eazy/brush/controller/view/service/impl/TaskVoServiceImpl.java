package com.eazy.brush.controller.view.service.impl;

import com.eazy.brush.controller.view.service.TaskVoService;
import com.eazy.brush.controller.view.vo.TaskVo;
import com.eazy.brush.core.enums.ConfKey;
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

    @Override
    public List<TaskVo> getList(int userId, int offset, int size) {

        List<TaskVo> taskVos = Lists.newArrayList();
        List<Task> tasks = taskService.getList(userId, offset, size);

        int todayDay = Integer.parseInt(DateTime.now().toString("yyyyMMdd"));
        int yestoday = Integer.parseInt(DateTime.now().minusDays(1).toString("yyyyMMdd"));

        for (Task task : tasks) {
            TaskVo taskVo = new TaskVo();
            taskVo.setId(task.getId());
            taskVo.setAppName(task.getAppName());
            taskVo.setCreateTime(new DateTime(task.getCreateTime()).toString("yyyy-MM-dd HH:mm:ss"));
            taskVo.setIncrDay(task.getIncrDay());

            int k = confService.getNumberValueByKey(ConfKey.task_cost_point.name()).intValue();
            taskVo.setAmount(task.getIncrDay() * k);
            taskVo.setTodayNum(taskSubService.count(task.getId(), todayDay) * k);
            taskVo.setYestodayNum(taskSubService.count(task.getId(), yestoday) * k);

            TaskState taskState = TaskState.valueOf(task.getState());
            if (null != taskState) {
                taskVo.setState(taskState.getName());
            }

            taskVos.add(taskVo);
        }
        return taskVos;
    }
}
