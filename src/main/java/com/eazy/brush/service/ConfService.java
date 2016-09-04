package com.eazy.brush.service;

import com.eazy.brush.dao.entity.Conf;

import java.util.List;

/**
 * 配置服务
 * author : liufeng
 * create time:2016/8/29 23:24
 */
public interface ConfService {

    void insert(Conf conf);

    List<Conf> getList(int offset, int size);

    Conf getByKey(String key);

    Number getNumberValueByKey(String key);

    void update(Conf conf);
}
