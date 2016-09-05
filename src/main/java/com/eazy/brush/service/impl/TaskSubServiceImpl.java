package com.eazy.brush.service.impl;

import com.eazy.brush.controller.view.service.Operator;
import com.eazy.brush.controller.view.service.RandomMacAddress;
import com.eazy.brush.core.enums.TaskSpeedType;
import com.eazy.brush.core.lottery.Award;
import com.eazy.brush.core.lottery.LotteryUtil;
import com.eazy.brush.core.utils.Constants;
import com.eazy.brush.core.utils.DateTimeUitl;
import com.eazy.brush.dao.entity.*;
import com.eazy.brush.dao.mapper.TaskSubMapper;
import com.eazy.brush.service.DeviceInfoService;
import com.eazy.brush.service.TaskActionService;
import com.eazy.brush.service.TaskService;
import com.eazy.brush.service.TaskSubService;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Arrays;
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

    @Autowired
    private TaskService taskService;

    class NetType<T> implements Award {

        private T netType;
        private double rate;

        public NetType(T netType, double rate) {
            this.netType = netType;
            this.rate = rate;
        }

        public T getNetType() {
            return netType;
        }

        @Override
        public double getRate() {
            return rate;
        }
    }

    @Override
    public List<TaskSub> getUnConsumeList(long pertime, int size) {
        return taskSubMapper.getList(pertime, size);
    }

    @Override
    public void makeIncrDayTaskSub(Task task) {

        List<Action> actionList = taskActionService.getActionsByTaskId(task.getId());
        List<DeviceInfo> deviceInfos = deviceInfoService.getList(0, Integer.MAX_VALUE);

        int perNum = 0, times = 0;

        if (TaskSpeedType.make_immediate.getCode() == task.getRunSpeed()) {     //立即投放
            times = task.getIncrDay() / Constants.TASK_BATCH_UP + 1;            //需要分多少批次执行
            perNum = times > 0 ? Constants.TASK_BATCH_UP : task.getIncrDay();
        } else {                                                                //函数投放
            times = (task.getRunEndTime() - task.getRunStartTime()) * 60 / Constants.TASK_SUB_PER_MINITE;
            perNum = task.getIncrDay() / times + 1;                             //不能整除，所以多运行几个
        }

        DateTime nowDateTime = DateTime.now();
        DateTime createDateTime = new DateTime(task.getCreateTime());
        int interDay = DateTimeUitl.getDayInter(createDateTime, nowDateTime);
        DateTime startTime = DateTimeUitl.getStartTime(task.getRunStartTime(), interDay);

        int moreNum = times * perNum;                                           //多运行的总任务数

        if (interDay == 0) {                                                    //如果是当天，从当前时间之后算起
            times = times - DateTimeUitl.perTimeNum(task.getRunStartTime(), nowDateTime);
        }

        int i = times;
        while (i-- >= 0) {
            long perTime = Long.parseLong(startTime.toString("yyyyMMddHHmm"));
            if (i == -1) {
                perNum = perNum - (moreNum - task.getIncrDay());                //把多运行的几个减掉
            }
            if (perNum > 0) {
                buildTaskSubs(task, perTime, actionList, deviceInfos, perNum);
            }
            startTime = startTime.plusMinutes(Constants.TASK_SUB_PER_MINITE);
        }
        log.info("### taskId:{},taskNum:{} make finished! ###", task.getId(), task.getIncrDay());
    }

    @Override
    public void makeRetainDayTaskSub(Task task) {
        double retainPercent = taskService.calcRetainPercent(task);

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
            taskSub.setCreateDay(Integer.parseInt(DateTime.now().toString("yyyyMMdd")));
            setCardInfo(taskSub);
            setNetInfo(taskSub);

            taskSubs.add(taskSub);
        }
        insertTaskBatch(taskSubs);
    }

    private void setCardInfo(TaskSub taskSub) {
        List<NetType<String>> netTypes = Lists.newArrayList();
        netTypes.add(new NetType<String>("2g", 301));
        netTypes.add(new NetType<String>("3g", 914));
        netTypes.add(new NetType<String>("4g", 9444));

        Operator[] operators = Operator.getInstances((String) LotteryUtil.lottery(netTypes).getNetType());
        Operator operator = LotteryUtil.lottery(Arrays.asList(operators));
        CardInfo cardInfo = operator.getCardInfo();

        taskSub.setTelAndroidId(cardInfo.getTelAndroidId());       //android_id 唯一
        taskSub.setSubscriberId(cardInfo.getSubscriberId());       //跟operator有关系，前5位时operator
        taskSub.setOperator(cardInfo.getOperator());           //运营商标志码
        taskSub.setOperatorName(cardInfo.getOperatorName());       //中国联通\\中国电信\\中国移动
        taskSub.setLine1Number(cardInfo.getLine1Number());        //联通手机的手机号码
        taskSub.setSimSerialNumber(cardInfo.getSimSerialNumber());    //sim卡串号
        taskSub.setNetworkType(cardInfo.getNetworkType());        //手机卡网络类型
        taskSub.setPhoneType(cardInfo.getPhoneType());            //手机通话类型
    }

    private void setNetInfo(TaskSub taskSub) {
        NetInfo netInfo = new NetInfo();
        netInfo.setMac(RandomMacAddress.getMacAddrWithFormat(":"));
        netInfo.setHost("192.168.1.108");
        netInfo.setPort(8888);
        List<NetType<Integer>> netInfoTypes = Lists.newArrayList();
        netInfoTypes.add(new NetType<>(0, 56937));
        netInfoTypes.add(new NetType<>(1, 10000));
        netInfo.setType(LotteryUtil.lottery(netInfoTypes).getNetType());

        taskSub.setHost(netInfo.getHost());               //代理主机地址
        taskSub.setPort(netInfo.getPort());                  // 端口
        taskSub.setMac(netInfo.getMac());                //mac地址 唯一
        taskSub.setType(netInfo.getType());                  //网络类型 0 手机网络 1 wifi
    }
}
