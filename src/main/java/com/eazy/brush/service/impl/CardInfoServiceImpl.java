package com.eazy.brush.service.impl;

import com.eazy.brush.dao.entity.CardInfo;
import com.eazy.brush.dao.mapper.CardInfoMapper;
import com.eazy.brush.service.CardInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/8/31 23:08
 */
@Service
public class CardInfoServiceImpl implements CardInfoService {

    @Autowired
    CardInfoMapper cardInfoMapper;

    @Override
    public CardInfo getById(int id) {
        return cardInfoMapper.getById(id);
    }

    @Override
    public List<CardInfo> getList(int offset, int size) {
        return cardInfoMapper.getList(offset, size);
    }
}
