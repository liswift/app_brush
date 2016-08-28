package com.eazy.brush.model;

import lombok.Data;

/**
 * 手机设备信息
 * author : liufeng
 * create time:2016/8/28 10:19
 */
@Data
public class DeviceInfo {
    private int id;
    private String serial;
    private String versionRelease;
    private String brand;
    private String board;
    private String versionIncremental;
    private String buildId;
    private String secureId;
    private int width;
    private int hight;
}
