package com.eazy.brush.dao.entity;

import lombok.Data;

/**
 * 网络信息·
 * author : liufeng
 * create time:2016/8/28 10:30
 */
@Data
public class NetInfo {
    private String host;               //代理主机地址
    private int port;                  // 端口
    private String mac;                //mac地址 唯一
    private int type;                  //网络类型 0 手机网络 1 wifi

}
