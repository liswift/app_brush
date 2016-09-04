package com.eazy.brush.controller.view.service.impl;

import com.eazy.brush.controller.view.service.Operator;
import com.eazy.brush.controller.view.service.RandomMacAddress;
import com.eazy.brush.controller.view.service.TaskSubVoService;
import com.eazy.brush.controller.view.vo.ActionVo;
import com.eazy.brush.controller.view.vo.TaskSubVo;
import com.eazy.brush.core.lottery.Award;
import com.eazy.brush.core.lottery.LotteryUtil;
import com.eazy.brush.dao.entity.*;
import com.eazy.brush.service.ActionService;
import com.eazy.brush.service.ActionSubService;
import com.eazy.brush.service.DeviceInfoService;
import com.eazy.brush.service.TaskService;
import com.google.common.collect.Lists;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

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
    public List<TaskSubVo> buildVo(List<TaskSub> list) {
        List<TaskSubVo> voList = Lists.newArrayList();
        List<NetType> netTypes = Lists.newArrayList();
        netTypes.add(new NetType("2g", 301));
        netTypes.add(new NetType("3g", 914));
        netTypes.add(new NetType("4g", 9444));

        for (TaskSub taskSub : list) {

            Task task = taskService.getById(taskSub.getTaskId());
            Action action = actionService.getById(taskSub.getActionId());
            DeviceInfo deviceInfo = deviceInfoService.getById(taskSub.getDeviceInfoId());

            Operator[] operators = Operator.getInstances((String) LotteryUtil.lottery(netTypes).getNetType());
            Operator operator = LotteryUtil.lottery(Arrays.asList(operators));
            CardInfo cardInfo = operator.getCardInfo();

            NetInfo netInfo = new NetInfo();
            netInfo.setMac(RandomMacAddress.getMacAddrWithFormat(":"));
            netInfo.setHost("192.168.1.108");
            netInfo.setPort(8888);

            List<NetType<Integer>> netInfoTypes = Lists.newArrayList();
            netInfoTypes.add(new NetType<>(0, 56937));
            netInfoTypes.add(new NetType<>(1, 10000));
            netInfo.setType(LotteryUtil.lottery(netInfoTypes).getNetType());

            ActionVo actionVo = new ActionVo();
            actionVo.setId(taskSub.getActionId());
            actionVo.setName(action.getName());
            actionVo.setActionSubs(actionSubService.getByActionIds(action.getActions()));

            TaskSubVo taskSubVo = new TaskSubVo();
            taskSubVo.setId(taskSub.getId());
            taskSubVo.setAppName(task.getAppName());
            taskSubVo.setApkUrl(task.getApkUrl());
            taskSubVo.setActionVo(actionVo);
            taskSubVo.setDeviceInfo(deviceInfo);
            taskSubVo.setCardInfo(cardInfo);
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
