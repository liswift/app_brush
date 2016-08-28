package com.eazy.brush.controller.vo.api;

import com.eazy.brush.model.Action;
import com.eazy.brush.model.DeviceInfo;
import com.eazy.brush.model.NetInfo;
import lombok.Data;

/**
 * 元任务
 * author : liufeng
 * create time:2016/8/28 10:44
 */
@Data
public class TaskUnit {
    private int id;
    private String appName;
    private String apkUrl;
    private Action action;                //动作组id
    private DeviceInfo deviceInfo;        //设备信息
    private NetInfo netInfo;              //网络信息
}
