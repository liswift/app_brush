package com.eazy.brush.dao.entity;

import lombok.Data;

/**
 * 网络信息·
 * author : liufeng
 * create time:2016/8/28 10:30
 */
@Data
public class NetInfo {
    private int id;
    private String mac;                //mac地址 唯一
    private String telAndroidId;       //android_id 唯一
    private String subscriberId;       //跟operator有关系，前5位时operator
    private String operator;           //运营商标志码
    private String operatorName;       //中国联通\\中国电信\\中国移动
    private String line1Number;        //联通手机的手机号码
    private String simSerialNumber;    //sim卡串号
    private int networkType;           //网络类型
    private int phoneType;             //手机通话类型
    private String host;               //代理主机地址
    private int port;                  // 端口
}
