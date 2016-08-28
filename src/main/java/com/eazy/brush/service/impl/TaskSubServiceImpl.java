package com.eazy.brush.service.impl;

import com.eazy.brush.core.utils.Constants;
import com.eazy.brush.model.*;
import com.eazy.brush.service.TaskSubService;
import com.google.common.collect.Lists;
import org.joda.time.DateTime;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

/**
 * 原任务相关服务
 * author : liufeng
 * create time:2016/8/28 13:02
 */
@Service
public class TaskSubServiceImpl implements TaskSubService {

    private Random random = new Random();

    @Override
    public void makeTaskSub(Task task) {

        List<Action> actionList = getActions(task.getId());
        List<DeviceInfo> deviceInfos = getDeviceInfos();
        List<NetInfo> netInfos = getNetInfos();

        int retainDay = task.getRetainDay();//留存天数
        int upDown = random.nextInt(task.getIncrUpDown());
        upDown = random.nextInt(1) == 0 ? upDown : -upDown;
        int taskNum = task.getIncrDay() + upDown;

        for (int i = 0; i < retainDay; i++) {

            int retainNum = calcRetainNum(task.getRetainPercent(), i, taskNum);

            if(0 == task.getRunSpeed()){
                buildTaskSubs(task, actionList, deviceInfos, netInfos, retainNum);
            }else {
                taskNum = calcTaskNum(task, retainNum);
                DateTime startTime = getStartTime(task, i);
                while (startTime.isBefore(DateTime.now().withHourOfDay(task.getRunEndTime()))) {
                    buildTaskSubs(task, actionList, deviceInfos, netInfos, taskNum);
                    startTime.plusMinutes(Constants.TASK_SUB_PER_MINITE);
                }
            }
        }
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
    private void buildTaskSubs(Task task, List<Action> actionList, List<DeviceInfo> deviceInfos, List<NetInfo> netInfos, int taskNum) {
        List<TaskSub> taskSubs = Lists.newArrayList();
        for (int num = 0; num < taskNum; num++) {
            TaskSub taskSub = new TaskSub();
            taskSub.setTaskId(task.getId());
            taskSub.setActionId(actionList.get(random.nextInt(actionList.size())).getId());
            taskSub.setDeviceInfoId(deviceInfos.get(random.nextInt(deviceInfos.size())).getId());
            taskSub.setNetInfoId(netInfos.get(random.nextInt(netInfos.size())).getId());
            taskSub.setRunTime(task.getRunTime());
            taskSubs.add(taskSub);
        }
        //todo 持久化taskSubs
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

    /**
     * 计算函数投放
     *
     * @param task
     * @return
     */
    private int calcTaskNum(Task task, int retainNum) {
        int pers = (task.getRunEndTime() - task.getRunStartTime()) * 60 / Constants.TASK_SUB_PER_MINITE;
        return retainNum / pers;
    }

    private List<NetInfo> getNetInfos() {
        //todo 获取网络集合
        return Lists.newArrayList();
    }

    private List<DeviceInfo> getDeviceInfos() {
        //todo 获取设备集合
        return Lists.newArrayList();
    }

    private List<Action> getActions(int taskId) {
        //todo 根据taskId 获取动作集合
        return Lists.newArrayList();
    }

    private DateTime getStartTime(Task task, int dayIndex) {
        DateTime startTime = DateTime.now().plusDays(dayIndex).
                withHourOfDay(task.getRunStartTime())
                .withMinuteOfHour(0);

        if (dayIndex == 0) { //当天
            int minute = (DateTime.now().getMinuteOfHour() / Constants.TASK_SUB_PER_MINITE + 1)
                    * Constants.TASK_SUB_PER_MINITE;
            startTime = DateTime.now().withMinuteOfHour(minute);
            if (minute == 60) {
                startTime = DateTime.now().withMinuteOfHour(0).plusHours(1);
            }
        }
        return startTime;
    }
}
