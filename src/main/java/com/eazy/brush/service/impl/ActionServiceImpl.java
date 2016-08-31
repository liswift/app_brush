package com.eazy.brush.service.impl;

import com.eazy.brush.dao.entity.Action;
import com.eazy.brush.dao.mapper.ActionMapper;
import com.eazy.brush.service.ActionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * author : liufeng
 * create time:2016/8/31 22:11
 */
@Service
public class ActionServiceImpl implements ActionService {

    @Autowired
    ActionMapper actionMapper;

    @Override
    public Action getById(int id) {
        return actionMapper.getById(id);
    }
}
