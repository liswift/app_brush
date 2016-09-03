package com.eazy.brush.dao.entity;

import com.eazy.brush.core.lottery.Award;
import lombok.Data;

/**
 * 手机设备信息
 * author : liufeng
 * create time:2016/8/28 10:19
 */
@Data
public class DeviceInfo implements Award {
    private int id;
    private String serial;
    private String versionRelease;
    private String brand;
    private String board;
    private String versionIncremental;
    private String buildId;
    private String secureId;
    private int width;
    private int height;
    private int api;
    private double coverage;
    private double screenSize;

    @Override
    public int getIndex() {
        return id;
    }

    @Override
    public double getRate() {
        return coverage;
    }
}
