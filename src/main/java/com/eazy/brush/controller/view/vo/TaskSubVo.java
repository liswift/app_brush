package com.eazy.brush.controller.view.vo;

import com.eazy.brush.dao.entity.Action;
import com.eazy.brush.dao.entity.DeviceInfo;
import com.eazy.brush.dao.entity.NetInfo;
import lombok.Data;

/**
 * 元任务
 * author : liufeng
 * create time:2016/8/28 10:44
 */
@Data
public class TaskSubVo {
    private int id;
    private String appName;
    private String apkUrl;
    private Action action;                //动作组id
    private DeviceInfo deviceInfo;        //设备信息
    private NetInfo netInfo;              //网络信息
}
