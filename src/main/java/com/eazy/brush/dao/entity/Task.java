package com.eazy.brush.dao.entity;

import lombok.Data;

/**
 * 运营后台添加的任务单
 * author : liufeng
 * create time:2016/8/28 10:58
 */
@Data
public class Task {
    private int id;
    private String appName;         //应用名称
    private String appVersion;      //应用版本
    private String remarkName;      //备注名称
    private int incrDay;            //每日新增用户数
    private int incrUpDown;         //上下波动范围
    private int runTime;            //应用运行时长
    private int runUpDown;          //运行市场上下波动范围
    private int runStartTime;      //投放开始时间
    private int runEndTime;        //投放结束时间
    private int runSpeed;           //投放速度
    private int retainDay;          //留存天数
    private int retainPercent;      //留存率
}
