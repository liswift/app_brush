package com.eazy.brush.service.impl;

import com.eazy.brush.dao.entity.NetInfo;
import com.eazy.brush.dao.mapper.NetInfoMapper;
import com.eazy.brush.service.NetInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/8/30 0:03
 */
@Service
public class NetInfoServiceImpl implements NetInfoService {

    @Autowired
    NetInfoMapper netInfoMapper;

    @Override
    public List<NetInfo> getList(int offset, int size) {
        return netInfoMapper.getList(offset, size);
    }

    @Override
    public NetInfo getById(int netInfoId) {
        return netInfoMapper.getById(netInfoId);
    }
}
