package com.eazy.brush.controller.view.service.impl;

import com.eazy.brush.controller.view.vo.ActionVo;
import com.eazy.brush.controller.view.vo.TaskSubVo;
import com.eazy.brush.controller.view.service.TaskSubVoService;
import com.eazy.brush.dao.entity.*;
import com.eazy.brush.service.*;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
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

    @Autowired
    ActionService actionService;

    @Autowired
    ActionSubService actionSubService;

    @Autowired
    DeviceInfoService deviceInfoService;

    @Autowired
    NetInfoService netInfoService;

    @Override
    public List<TaskSubVo> buildVo(List<TaskSub> list) {
        List<TaskSubVo> voList = Lists.newArrayList();
        for (TaskSub taskSub : list) {

            Task task = taskService.getById(taskSub.getTaskId());
            Action action = actionService.getById(taskSub.getActionId());
            DeviceInfo deviceInfo = deviceInfoService.getById(taskSub.getDeviceInfoId());
            NetInfo netInfo = netInfoService.getById(taskSub.getNetInfoId());

            ActionVo actionVo = new ActionVo();
            actionVo.setId(taskSub.getActionId());
            actionVo.setName(action.getName());
            actionVo.setActionSubs(actionSubService.getByActionIds(action.getActions()));

            TaskSubVo taskSubVo = new TaskSubVo();
            taskSubVo.setId(taskSub.getId());
            taskSubVo.setAppName(task.getAppName());
            taskSubVo.setApkUrl(taskSubVo.getApkUrl());
            taskSubVo.setActionVo(actionVo);
            taskSubVo.setDeviceInfo(deviceInfo);
            taskSubVo.setNetInfo(netInfo);

            voList.add(taskSubVo);
        }
        return voList;
    }

    @Override
    public String buildVoIds(List<TaskSub> taskSubs) {
        List<Integer> ids = Lists.newArrayList();
        for (TaskSub taskSub : taskSubs) {
            ids.add(taskSub.getId());
        }
        return StringUtils.join(ids, ",");
    }
}
