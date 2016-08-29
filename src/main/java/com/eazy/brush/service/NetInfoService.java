package com.eazy.brush.service;

import com.eazy.brush.dao.entity.NetInfo;

import java.util.List;

/**
 * 网络信息服务类
 * author : liufeng
 * create time:2016/8/30 0:02
 */
public interface NetInfoService {

    List<NetInfo> getList(int offset, int size);
}
