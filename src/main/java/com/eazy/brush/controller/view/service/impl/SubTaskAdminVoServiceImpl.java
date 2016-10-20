package com.eazy.brush.controller.view.service.impl;

import com.eazy.brush.controller.view.service.SubTaskAdminVoService;
import com.eazy.brush.controller.view.vo.SubTaskAdminVo;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.service.TaskService;
import com.eazy.brush.service.TaskSubService;
import com.eazy.brush.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yuekuapp on 16-10-5.
 */
@Service
@Slf4j
public class SubTaskAdminVoServiceImpl implements SubTaskAdminVoService{
    @Autowired
    TaskService taskService;

    @Autowired
    TaskSubService taskSubService;

    @Autowired
    UserService userService;

    @Override
    public List<SubTaskAdminVo> getAllTodyTask() {
        int today = Integer.parseInt(DateTime.now().toString("yyyyMMdd"));
        List<SubTaskAdminVo> taskAdminVos=taskSubService.getTodayTaskCountByCreateDay(today);
        for(SubTaskAdminVo subTaskAdminVo:taskAdminVos){
            Task task=taskService.getById(subTaskAdminVo.getTaskId());
            subTaskAdminVo.setTaskName(task.getRemarkName());
            subTaskAdminVo.setUserName(userService.getById(task.getUserId()).getName());
        }
        return taskAdminVos;
    }
}
