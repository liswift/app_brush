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
    private String fromId="";
    private String fileName="";//文件Name
    private int taskId;              //任务id
    private long perTime;             //时间粒度
    private int deviceInfoId;        //设备信息,例如三星/索尼/...
    private int runTime;             //任务运行时间 秒单位
    private int createDay;           //任务执行运行日期
    private int state;              //三种状态 0 init,1 running,2 finish
    private int taskType;           //有两种类型,一种是留存任务0,一种是激活任务1

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
