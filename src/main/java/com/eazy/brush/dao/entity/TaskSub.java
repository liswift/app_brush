package com.eazy.brush.dao.entity;

import lombok.Data;

/**
 * 元任务
 * author : liufeng
 * create time:2016/8/28 10:44
 */
@Data
public class TaskSub {
    private int id;
    private int taskId;              //任务id
    private long perTime;             //时间粒度
    private int actionId;            //动作组id
    private int deviceInfoId;        //设备信息
    private int cardInfoId;          //手机卡信息
    private int netInfoId;           //网络信息
    private int runTime;             //任务执行时间
    private int callbackTime;        //任务执行完回调时间 0 未取走 1已取走未回调 time 回调
}
