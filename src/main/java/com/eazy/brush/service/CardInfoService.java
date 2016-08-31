package com.eazy.brush.service;

import com.eazy.brush.dao.entity.CardInfo;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/8/31 23:07
 */
public interface CardInfoService {

    CardInfo getById(int id);

    List<CardInfo> getList(int offset, int size);
}
