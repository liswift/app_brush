package com.eazy.brush.controller.view.vo;

import com.eazy.brush.dao.entity.CardInfo;
import com.eazy.brush.dao.entity.DeviceInfo;
import com.eazy.brush.dao.entity.NetInfo;
import lombok.Data;

import java.util.List;

/**
 * 元任务
 * author : liufeng
 * create time:2016/8/28 10:44
 */
@Data
public class TaskSubVo {
    private String id;
    private String appName;
    private String packageName;
    private int versionCode;
    private int runTime;
    private String apkUrl;
    private String versionIncremental;
    private List<ActionPageVo> actionPageVo;
    private DeviceInfo deviceInfo;
    private CardInfo cardInfo;
    private NetInfo netInfo;
}
