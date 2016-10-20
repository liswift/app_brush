package com.eazy.brush.dao.entity;

import lombok.Data;

import java.util.Date;

/**
 * 运营后台添加的任务单
 * author : liufeng
 * create time:2016/8/28 10:58
 */
@Data
public class Task {
    private int id;
    private int userId;
    private int auditUserId;
    private int minSdkVersion;
//    private String appName;         //应用名称
    private String packageName;     //应用程序包名
    private int versionCode;        //versionCode
    private String appVersion;      //应用版本
    private String apkUrl;          //下载地址
    private String remarkName;      //备注名称
    private int incrDay;            //每日新增用户数
    private int dayLimit;           //每日任务上限
    private int incrUpDown;         //上下波动范围
    private int runTime;            //应用运行时长:秒
    private int runUpDown;          //运行市场上下波动范围
    private int runStartTime;       //投放开始时间
    private int runEndTime;         //投放结束时间
    private int runSpeed;           //投放速度
    private int retainDay;          //留存天数
    private int retainPercent;      //留存率
    private int state;              //任务被执行回调时间
    private Date createTime;        //创建时间
    private String msg;             //备注内容,例如审核失败的内容
    private int deleted;           //默认是0 ,删除是1
}
