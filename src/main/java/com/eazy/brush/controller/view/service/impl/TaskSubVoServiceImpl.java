package com.eazy.brush.controller.view.service.impl;

import com.eazy.brush.controller.view.vo.TaskSubVo;
import com.eazy.brush.controller.view.service.TaskSubVoService;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.dao.entity.TaskSub;
import com.eazy.brush.service.TaskService;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 任务元拼装服务
 *
 * @author feng.liu
 * @date 2016/8/31 17:55
 */
@Service
public class TaskSubVoServiceImpl implements TaskSubVoService {

    @Autowired
    TaskService taskService;

    @Override
    public List<TaskSubVo> buildVo(List<TaskSub> list) {
        List<TaskSubVo> voList = Lists.newArrayList();
        for (TaskSub taskSub : list) {

            TaskSubVo taskSubVo = new TaskSubVo();
            taskSubVo.setId(taskSub.getId());

            Task task = taskService.getById(taskSub.getTaskId());


            taskSubVo.setAppName(task.getAppName());
//            taskSubVo.setAction();

            voList.add(taskSubVo);
        }
        return voList;
    }
}
