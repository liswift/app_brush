package com.eazy.brush.service;

import com.eazy.brush.dao.entity.DeviceInfo;

import java.util.List;

/**
 * 设备信息服务类
 * author : liufeng
 * create time:2016/8/29 23:52
 */
public interface DeviceInfoService {

    List<DeviceInfo> getList(int offset, int size);
}
