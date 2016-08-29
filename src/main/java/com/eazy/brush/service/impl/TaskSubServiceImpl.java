package com.eazy.brush.service.impl;

import com.eazy.brush.core.utils.Constants;
import com.eazy.brush.core.utils.DateTimeUitl;
import com.eazy.brush.dao.entity.*;
import com.eazy.brush.dao.mapper.TaskSubMapper;
import com.eazy.brush.service.DeviceInfoService;
import com.eazy.brush.service.NetInfoService;
import com.eazy.brush.service.TaskActionService;
import com.eazy.brush.service.TaskSubService;
import com.google.common.collect.Lists;
import org.joda.time.DateTime;
import org.omg.CORBA.INTERNAL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

/**
 * 元任务相关服务
 * author : liufeng
 * create time:2016/8/28 13:02
 */
@Service
public class TaskSubServiceImpl implements TaskSubService {

    private Random random = new Random();

    @Autowired
    private TaskSubMapper taskSubMapper;

    @Autowired
    private TaskActionService taskActionService;

    @Autowired
    private DeviceInfoService deviceInfoService;

    @Autowired
    private NetInfoService netInfoService;

    @Override
    public void makeTaskSub(Task task) {

        List<Action> actionList = taskActionService.getActionsByTaskId(task.getId());
        List<DeviceInfo> deviceInfos = deviceInfoService.getList(0, Integer.MAX_VALUE);
        List<NetInfo> netInfos = netInfoService.getList(0, Integer.MAX_VALUE);

        int retainDay = task.getRetainDay();//留存天数
        int upDown = random.nextInt(task.getIncrUpDown());
        upDown = random.nextInt(1) == 0 ? upDown : -upDown;
        int dayNum = task.getIncrDay() + upDown;

        for (int i = 0; i < retainDay; i++) {

            int retainNum = calcRetainNum(task.getRetainPercent(), i, dayNum);

            int perNum = 0, times = 0;

            if (0 == task.getRunSpeed()) {//立即投放
                times = retainNum / Constants.TASK_BATCH_UP; //需要分多少批次执行
                perNum = times > 0 ? Constants.TASK_BATCH_UP : retainNum;
            } else {    //函数投放
                times = (task.getRunEndTime() - task.getRunStartTime()) * 60 / Constants.TASK_SUB_PER_MINITE;
                perNum = retainNum / times;
            }

            DateTime startTime = DateTimeUitl.getStartTime(task.getRunStartTime(), i);
            while (times-- >= 0) {
                int perTime = Integer.parseInt(startTime.toString("yyyyMMddHHmm"));
                buildTaskSubs(task, perTime, actionList, deviceInfos, netInfos, perNum);
                startTime.plusMinutes(Constants.TASK_SUB_PER_MINITE);
            }
        }
    }

    @Override
    public void insertTaskSub(TaskSub taskSub) {
        taskSubMapper.insertTaskSub(taskSub);
    }

    @Override
    public void insertTaskBatch(List<TaskSub> taskSubList) {
        taskSubMapper.insertTaskSubBatch(taskSubList);
    }

    /**
     * 生成任务元
     *
     * @param task
     * @param actionList
     * @param deviceInfos
     * @param netInfos
     * @param taskNum
     */
    private void buildTaskSubs(Task task, int perTime,
                               List<Action> actionList,
                               List<DeviceInfo> deviceInfos,
                               List<NetInfo> netInfos, int taskNum) {

        List<TaskSub> taskSubs = Lists.newArrayList();
        for (int num = 0; num < taskNum; num++) {
            TaskSub taskSub = new TaskSub();
            taskSub.setTaskId(task.getId());
            taskSub.setPerTime(perTime);
            taskSub.setActionId(actionList.get(random.nextInt(actionList.size())).getId());
            taskSub.setDeviceInfoId(deviceInfos.get(random.nextInt(deviceInfos.size())).getId());
            taskSub.setNetInfoId(netInfos.get(random.nextInt(netInfos.size())).getId());
            taskSub.setRunTime(task.getRunTime());
            taskSubs.add(taskSub);
        }
        insertTaskBatch(taskSubs);
    }

    /**
     * 计算留存
     *
     * @param retainPercent
     * @param day
     * @param taskNum
     * @return
     */
    private int calcRetainNum(int retainPercent, int day, int taskNum) {
        double percent = 1.0;
        while (day-- > 1) {
            percent *= retainPercent / 100;
        }
        taskNum = Double.valueOf(percent * taskNum).intValue();
        return taskNum;
    }
}
