package com.eazy.brush.service.impl;

import com.eazy.brush.controller.view.service.Operator;
import com.eazy.brush.controller.view.service.RandomMacAddress;
import com.eazy.brush.core.enums.SubTaskState;
import com.eazy.brush.core.enums.SubTaskType;
import com.eazy.brush.core.enums.TaskSpeedType;
import com.eazy.brush.core.lottery.Award;
import com.eazy.brush.core.lottery.LotteryUtil;
import com.eazy.brush.core.utils.Constants;
import com.eazy.brush.core.utils.RandomUtil;
import com.eazy.brush.dao.entity.*;
import com.eazy.brush.dao.mapper.TaskSubMapper;
import com.eazy.brush.service.DeviceInfoService;
import com.eazy.brush.service.ProxyIpService;
import com.eazy.brush.service.TaskService;
import com.eazy.brush.service.TaskSubService;
import com.eazy.brush.service.rank.HcountService;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;

/**
 * 元任务相关服务
 * author : liufeng
 * create time:2016/8/28 13:02
 */
@Slf4j
@Service
public class TaskSubServiceImpl implements TaskSubService {
    private static final int MAXINSERTNUMBER=100;

    @Autowired
    private TaskSubMapper taskSubMapper;

    @Autowired
    private DeviceInfoService deviceInfoService;

    @Autowired
    private HcountService hcountService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private ProxyIpService proxyIpService;

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
    public List<TaskHistory> getHistoryByCreateDay(int createDay) {
        return taskSubMapper.getHistoryCount(createDay);//计算前天的数据;
    }

    /**
     * 根据当前的时间点,随机获取当前时间点之前所有未完成的subTask
     * @param size
     * @return
     */
    @Override
    public List<TaskSub> getUnConsumeList(int size) {
        long perTime = Long.parseLong(DateTime.now().toString("yyyyMMddHHmm"));
        return taskSubMapper.getRandomList(perTime,taskSubMapper.getRandomCount(perTime),size);
    }

    /**
     * 生成新增数据序列
     * @param task
     */
    @Override
    public void makeIncrDayTaskSub(Task task) {
        /**
         * 获取所有的deviceId
         */
        List<DeviceInfo> deviceInfos = deviceInfoService.getList(0, Integer.MAX_VALUE);
        int createDay = Integer.parseInt(DateTime.now().toString("yyyyMMdd"));

        int newnumber=task.getIncrDay();
        int newupdown=task.getIncrUpDown();
        int number = newnumber-newupdown + new Random().nextInt(2*newupdown);//计算当天的新增数量总数

        int times = 0;
        int perNum=0;

        if (TaskSpeedType.make_immediate.getCode() == task.getRunSpeed()) {     //立即投放,一次性全部生成,去任务的时候,会自动进行随机获取
            times = 1;            //需要分多少批次执行
            perNum = number;
        } else {                                                                //函数投放,暂时是均匀函数投放
            times = (task.getRunEndTime() - task.getRunStartTime()) * 60 / Constants.TASK_SUB_PER_MINITE;
            perNum = number / times + 1;                             //不能整除，所以多运行一个
        }
        log.info("### times:{},perNum:{} maxnumber:{} ###", times, perNum,number);
        DateTime startTime = DateTime.now().withHourOfDay(task.getRunStartTime()).withMinuteOfHour(0); //设定开始时间
        while (times-- > 0) {
            long perTime = Long.parseLong(startTime.toString("yyyyMMddHHmm"));
            if (perNum > 0&&number>0) {
                if(number < perNum){//最后的数目不够了,直接全部运行完
                    perNum = number;
                }
                buildTaskSubs(task, perTime, deviceInfos, perNum,createDay);
                number=number-perNum;
            }
            startTime = startTime.plusMinutes(Constants.TASK_SUB_PER_MINITE);
        }

        log.info("### taskId:{},taskNum:{} make finished! ###", task.getId(), task.getIncrDay());
    }

    /**
     * 生成留存数据序列
     * @param task
     */
    @Override
    public void makeRetainDayTaskSub(TaskHistory task) {
        int createDay = Integer.parseInt(DateTime.now().toString("yyyyMMdd"));
        int retainDay = task.getRetainDay();
        int percent = task.getRetainPercent();

        if(retainDay==0||percent==0){//留存天数为0,或者剩余留存率为0,直接return
            return;
        }

        int number = task.getIncrDay()*task.getRetainPercent()/100;//获取留存数目

        if(number>MAXINSERTNUMBER){
            int newnumber = MAXINSERTNUMBER;
            int tasktimes = number/MAXINSERTNUMBER+1;//增加一次
            int mintaskNumber=task.getIncrDay()/tasktimes;//把总任务进行分割
            while (tasktimes-->0){
                if(tasktimes==0){
                    newnumber = number%MAXINSERTNUMBER;//取到最后剩余的余数
                }
                insertSub(task,createDay,(tasktimes-1)*mintaskNumber,newnumber);//通过offset进行总数量分割拿取
            }
        }else{
            insertSub(task, createDay,0,number);
        }
    }

    private void insertSub(TaskHistory task, int createDay,int offset, int number) {
        List<TaskSub> listByCreateDay = taskSubMapper.getListByCreateDay(task.getTaskId(),task.getCreateDay(),offset,number);
        int times = 24*60/ Constants.TASK_SUB_PER_MINITE;//平均分配24小时运行
        int perNum = number/times+1;

        DateTime startTime = DateTime.now().withHourOfDay(0).withMinuteOfHour(0); //设定开始时间

        while(times-->0){
            long perTime = Long.parseLong(startTime.toString("yyyyMMddHHmm"));
            if (perNum > 0&&number>0) {
                if(listByCreateDay.size() < perNum){//最后的数目不够了,直接全部运行完
                    perNum = listByCreateDay.size();
                }
                List<TaskSub> taskSubs = listByCreateDay.subList(0, perNum);
                List<TaskSub> newList=new ArrayList<>(taskSubs);
                taskSubs.clear();//子视图删除以后,原来的父类也会删除这些元素
                reUseTaskSub(newList,perTime,createDay);
            }
            startTime = startTime.plusMinutes(Constants.TASK_SUB_PER_MINITE);
        }
    }

    private void reUseTaskSub(List<TaskSub> taskSubs,long perTime,int createDay) {
        for(TaskSub tasksub:taskSubs){
            tasksub.setId(UUID.randomUUID().toString());
            tasksub.setPerTime(perTime);
            tasksub.setTaskType(SubTaskType.RETAIN.getCode());
            tasksub.setState(SubTaskState.INIT.getState());
            tasksub.setCreateDay(createDay);
        }
        insertTaskBatch(taskSubs);
    }


    @Override
    public void insertTaskBatch(List<TaskSub> taskSubList) {
        if (!CollectionUtils.isEmpty(taskSubList)) {
            taskSubMapper.insertTaskSubBatch(taskSubList);
        }
    }

    @Override
    public void changeTaskSubState(String ids, SubTaskState subTaskState) {
        taskSubMapper.changeTaskSubState(subTaskState.getState(),ids);
    }

    /**
     * 获取今天新增的数据
     * @param taskId
     * @return
     */
    @Override
    public int getTodayCount(int taskId) {
        int createDay = Integer.parseInt(DateTime.now().toString("yyyyMMdd"));
        return  taskSubMapper.getCountByTaskId(taskId,createDay,SubTaskState.FINISHED.getState(),SubTaskType.ACTIVE.getCode());
    }

    /**
     * 获取昨天新增的数据
     * @param taskId
     * @return
     */
    @Override
    public int getYestdayCount(int taskId) {
        int createDay = Integer.parseInt(DateTime.now().minusDays(1).toString("yyyyMMdd"));
        return  taskSubMapper.getCountByTaskId(taskId,createDay,SubTaskState.FINISHED.getState(),SubTaskType.ACTIVE.getCode());
    }

    /**
     * 获取昨天的历史数据
     * @param taskType
     * @return
     */
    @Override
    public int getSubTaskCount(SubTaskType taskType, SubTaskState subTaskState) {
        int createDay = Integer.parseInt(DateTime.now().minusDays(1).toString("yyyyMMdd"));
        return taskSubMapper.getCount(createDay,taskType.getCode(),subTaskState.getState());
    }

    /**
     * 获取昨天的历史数据
     * @param taskType
     * @param subTaskState
     * @return
     */
    @Override
    public int getSubTaskAndDelete(SubTaskType taskType, SubTaskState subTaskState) {
        int createDay = Integer.parseInt(DateTime.now().minusDays(1).toString("yyyyMMdd"));
        return taskSubMapper.deleteGetCount(createDay,taskType.getCode(),subTaskState.getState());
    }

    @Override
    public void deleteOldUnUseData() {
        taskSubMapper.deleteUnUserData();
    }


    /**
     * 生成新增subTask
     *
     * @param task
     * @param deviceInfos
     * @param taskNum
     */
    private void buildTaskSubs(Task task, long perTime,
                               List<DeviceInfo> deviceInfos, int taskNum,int createDay) {
        log.info("##### begin buildTaskSubs perTime:"+perTime+" taskNum:"+taskNum+" createDay:"+createDay);
        int number=MAXINSERTNUMBER;
        int time=1;
        if(taskNum >number){
            time = taskNum/number+1;
        }
        while(time-->0){
            if(time == 0){//此时最后运行完,已经等于0了
                number=taskNum%number;
            }
            log.info("##### insert number:" + number+" time:"+time);
            List<TaskSub> taskSubs = Lists.newArrayList();
            for (int num = 0; num < number; num++) {

                TaskSub taskSub = new TaskSub();
                taskSub.setId(UUID.randomUUID().toString());
                taskSub.setTaskId(task.getId());
                taskSub.setPerTime(perTime);
                taskSub.setDeviceInfoId(LotteryUtil.lottery(deviceInfos).getId());
                taskSub.setRunTime(task.getRunTime()*60-task.getRunUpDown()+ new Random().nextInt(2*task.getRunUpDown()));//设置运行时间
                taskSub.setCreateDay(createDay);
                taskSub.setTaskType(SubTaskType.ACTIVE.getCode());//新增任务
                taskSub.setState(SubTaskState.INIT.getState());//状态初始化
                setCardInfo(taskSub);
                setNetInfo(taskSub);
                taskSub.setVersionIncremental(RandomUtil.generateMixString(13));
                taskSub.setBuildId(RandomUtil.generateMixString(7));
                taskSub.setSecureId(UUID.randomUUID().toString());
                taskSub.setSerial(RandomUtil.generateMixString(16));
                taskSubs.add(taskSub);
            }
            insertTaskBatch(taskSubs);
        }

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

        List<NetType<Integer>> netInfoTypes = Lists.newArrayList();
        netInfoTypes.add(new NetType<>(0, 56937));
        netInfoTypes.add(new NetType<>(1, 10000));
        netInfo.setType(LotteryUtil.lottery(netInfoTypes).getNetType());
        taskSub.setMac(netInfo.getMac());                //mac地址 唯一
        taskSub.setType(netInfo.getType());                  //网络类型 0 手机网络 1 wifi
    }
}
