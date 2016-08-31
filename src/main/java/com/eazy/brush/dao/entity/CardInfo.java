package com.eazy.brush.dao.entity;

import lombok.Data;

/**
 * 手机卡信息
 * author : liufeng
 * create time:2016/8/31 22:53
 */
@Data
public class CardInfo {
    private int id;
    private String telAndroidId;       //android_id 唯一
    private String subscriberId;       //跟operator有关系，前5位时operator
    private String operator;           //运营商标志码
    private String operatorName;       //中国联通\\中国电信\\中国移动
    private String line1Number;        //联通手机的手机号码
    private String simSerialNumber;    //sim卡串号
    private String networkType;        //手机卡网络类型
    private int phoneType;             //手机通话类型
}
