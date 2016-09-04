package com.eazy.brush.service.impl;

import com.eazy.brush.core.lottery.LotteryUtil;
import com.eazy.brush.core.utils.Constants;
import com.eazy.brush.core.utils.DateTimeUitl;
import com.eazy.brush.dao.entity.Action;
import com.eazy.brush.dao.entity.DeviceInfo;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.dao.entity.TaskSub;
import com.eazy.brush.dao.mapper.TaskSubMapper;
import com.eazy.brush.service.DeviceInfoService;
import com.eazy.brush.service.TaskActionService;
import com.eazy.brush.service.TaskSubService;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Random;

/**
 * 元任务相关服务
 * author : liufeng
 * create time:2016/8/28 13:02
 */
@Slf4j
@Service
public class TaskSubServiceImpl implements TaskSubService {

    private Random random = new Random();

    @Autowired
    private TaskSubMapper taskSubMapper;

    @Autowired
    private TaskActionService taskActionService;

    @Autowired
    private DeviceInfoService deviceInfoService;

    @Override
    public List<TaskSub> getUnConsumeList(long pertime, int size) {
        return taskSubMapper.getList(pertime, size);
    }

    @Override
    public void makeTaskSub(Task task) {

        List<Action> actionList = taskActionService.getActionsByTaskId(task.getId());
        List<DeviceInfo> deviceInfos = deviceInfoService.getList(0, Integer.MAX_VALUE);

        int perNum = 0, times = 0;

        if (0 == task.getRunSpeed()) {//立即投放
            times = task.getIncrDay() / Constants.TASK_BATCH_UP; //需要分多少批次执行
            perNum = times > 0 ? Constants.TASK_BATCH_UP : task.getIncrDay();
        } else {    //函数投放
            times = (task.getRunEndTime() - task.getRunStartTime()) * 60 / Constants.TASK_SUB_PER_MINITE;
            perNum = task.getIncrDay() / times;
        }

        DateTime createDateTime = new DateTime(task.getCreateTime());
        int interDay = DateTimeUitl.getDayInter(createDateTime, DateTime.now());
        DateTime startTime = DateTimeUitl.getStartTime(task.getRunStartTime(), interDay);

        while (times-- >= 0) {
            long perTime = Long.parseLong(startTime.toString("yyyyMMddHHmm"));
            buildTaskSubs(task, perTime, actionList, deviceInfos, perNum);
            startTime = startTime.plusMinutes(Constants.TASK_SUB_PER_MINITE);
        }
        log.info("### taskId:{},taskNum:{} make finished! ###", task.getId(), task.getIncrDay());
    }

    @Override
    public void insertTaskSub(TaskSub taskSub) {
        taskSubMapper.insertTaskSub(taskSub);
    }

    @Override
    public void insertTaskBatch(List<TaskSub> taskSubList) {
        if (!CollectionUtils.isEmpty(taskSubList)) {
            taskSubMapper.insertTaskSubBatch(taskSubList);
        }
    }

    @Override
    public void changeTaskSubState(String ids, long callbackTime) {
        taskSubMapper.changeTaskSubState(ids, callbackTime);
    }

    /**
     * 生成任务元
     *
     * @param task
     * @param actionList
     * @param deviceInfos
     * @param taskNum
     */
    private void buildTaskSubs(Task task, long perTime, List<Action> actionList,
                               List<DeviceInfo> deviceInfos, int taskNum) {

        List<TaskSub> taskSubs = Lists.newArrayList();
        for (int num = 0; num < taskNum; num++) {
            TaskSub taskSub = new TaskSub();
            taskSub.setTaskId(task.getId());
            taskSub.setPerTime(perTime);
            taskSub.setActionId(actionList.get(random.nextInt(actionList.size())).getId());
            taskSub.setDeviceInfoId(LotteryUtil.lottery(deviceInfos).getId());
            taskSub.setRunTime(task.getRunTime());
            taskSubs.add(taskSub);
        }
        insertTaskBatch(taskSubs);
    }

}
