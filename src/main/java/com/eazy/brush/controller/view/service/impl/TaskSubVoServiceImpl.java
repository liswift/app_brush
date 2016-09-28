package com.eazy.brush.controller.view.service.impl;

import com.eazy.brush.controller.view.service.ActionPageVoService;
import com.eazy.brush.controller.view.service.TaskSubVoService;
import com.eazy.brush.controller.view.vo.ActionPageApiVo;
import com.eazy.brush.controller.view.vo.TaskSubApiVo;
import com.eazy.brush.dao.entity.*;
import com.eazy.brush.model.ProxyModel;
import com.eazy.brush.service.ActionPageService;
import com.eazy.brush.service.DeviceInfoService;
import com.eazy.brush.service.ProxyIpService;
import com.eazy.brush.service.TaskService;
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
    ActionPageService actionPageService;


    @Autowired
    DeviceInfoService deviceInfoService;

    @Autowired
    ActionPageVoService actionPageVoService;

    @Autowired
    ProxyIpService proxyIpService;

    @Override
    public List<TaskSubApiVo> buildVo(List<TaskSub> list) {
        List<TaskSubApiVo> voList = Lists.newArrayList();
        for (TaskSub taskSub : list) {

            Task task = taskService.getById(taskSub.getTaskId());
            DeviceInfo deviceInfo = buildDeviceInfo(taskSub);
            List<ActionPageApiVo> actionPageVos = actionPageVoService.getApiByTaskId(task.getId());

            TaskSubApiVo taskSubVo = new TaskSubApiVo();
            taskSubVo.setId(taskSub.getId());
            taskSubVo.setFromId(taskSub.getFromId());
            taskSubVo.setFileName(taskSub.getFileName());
            taskSubVo.setRunTime(taskSub.getRunTime());
            taskSubVo.setRemarkName(task.getRemarkName());
            taskSubVo.setPackageName(task.getPackageName());
            taskSubVo.setVersionCode(task.getVersionCode());
            taskSubVo.setApkUrl(task.getApkUrl());
            taskSubVo.setPageActions(actionPageVos);
            taskSubVo.setDeviceInfo(deviceInfo);

            taskSubVo.setCardInfo(buildCardInfo(taskSub));
            taskSubVo.setNetInfo(buildNetInfo(taskSub));

            voList.add(taskSubVo);
        }
        return voList;
    }

    private DeviceInfo buildDeviceInfo(TaskSub taskSub) {
        DeviceInfo deviceInfo = deviceInfoService.getById(taskSub.getDeviceInfoId());
        deviceInfo.setVersionIncremental(taskSub.getVersionIncremental());
        deviceInfo.setBuildId(taskSub.getBuildId());
        deviceInfo.setSecureId(taskSub.getSecureId());
        deviceInfo.setSerial(taskSub.getSerial());
        return deviceInfo;
    }

    private CardInfo buildCardInfo(TaskSub taskSub) {
        CardInfo cardInfo = new CardInfo();
        cardInfo.setTelAndroidId(taskSub.getTelAndroidId());       //android_id 唯一
        cardInfo.setSubscriberId(taskSub.getSubscriberId());       //跟operator有关系，前5位时operator
        cardInfo.setOperator(taskSub.getOperator());           //运营商标志码
        cardInfo.setOperatorName(taskSub.getOperatorName());       //中国联通\\中国电信\\中国移动
        cardInfo.setLine1Number(taskSub.getLine1Number());        //联通手机的手机号码
        cardInfo.setSimSerialNumber(taskSub.getSimSerialNumber());    //sim卡串号
        cardInfo.setNetworkType(taskSub.getNetworkType());        //手机卡网络类型
        cardInfo.setPhoneType(taskSub.getPhoneType());            //手机通话类型
        return cardInfo;
    }

    private NetInfo buildNetInfo(TaskSub taskSub) {
        NetInfo netInfo = new NetInfo();

        ProxyModel proxyModel = proxyIpService.getRandom();
        netInfo.setHost(proxyModel.getIp());              //代理主机地址
        netInfo.setPort(proxyModel.getPort());                  // 端口
        netInfo.setMac(taskSub.getMac());               //mac地址 唯一
        netInfo.setType(taskSub.getType());                  //网络类型 0 手机网络 1 wifi
        return netInfo;
    }

    @Override
    public String buildVoIds(List<TaskSub> taskSubs) {
        List<String> ids = Lists.newArrayList();
        for (TaskSub taskSub : taskSubs) {
            ids.add(taskSub.getId());
        }
        return StringUtils.join(ids, ",");
    }
}
