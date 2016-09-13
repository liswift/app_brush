package com.eazy.brush.dao.entity;

import lombok.Data;

/**
 * 元任务
 * author : liufeng
 * create time:2016/8/28 10:44
 */
@Data
public class TaskSub {

    private String id;
    private int taskId;              //任务id
    private long perTime;             //时间粒度
    private int deviceInfoId;        //设备信息
    private int runTime;             //任务执行时间
    private int callbackTime;        //任务执行完回调时间 0 未取走 1已取走未回调 time 回调
    private int createDay;          //任务创建日期

    //cardInfo 信息
    private String telAndroidId;       //android_id 唯一
    private String subscriberId;       //跟operator有关系，前5位时operator
    private String operator;           //运营商标志码
    private String operatorName;       //中国联通\\中国电信\\中国移动
    private String line1Number;        //联通手机的手机号码
    private String simSerialNumber;    //sim卡串号
    private int networkType;        //手机卡网络类型
    private String phoneType;             //手机通话类型

    //netInfo 信息
    private String mac;                //mac地址 唯一
    private int type;                  //网络类型 0 手机网络 1 wifi

    //deviceinfo 信息
    private String versionIncremental;
    private String buildId;
    private String secureId;
    private String serial;              //16位

}
