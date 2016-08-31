package com.eazy.brush.service.impl;

import com.eazy.brush.dao.entity.DeviceInfo;
import com.eazy.brush.dao.mapper.DeviceInfoMapper;
import com.eazy.brush.service.DeviceInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 设备信息服务类实现
 * author : liufeng
 * create time:2016/8/29 23:53
 */
@Service
public class DeviceInfoServiceImpl implements DeviceInfoService {

    @Autowired
    DeviceInfoMapper deviceInfoMapper;

    @Override
    public DeviceInfo getById(int id) {
        return deviceInfoMapper.getById(id);
    }

    @Override
    public List<DeviceInfo> getList(int offset, int size) {
        return deviceInfoMapper.getList(offset, size);
    }
}
