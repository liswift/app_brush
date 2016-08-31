package com.eazy.brush.service.impl;

import com.eazy.brush.dao.entity.ActionSub;
import com.eazy.brush.dao.mapper.ActionSubMapper;
import com.eazy.brush.service.ActionSubService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/8/31 22:19
 */
@Service
public class ActionSubServiceImpl implements ActionSubService {

    @Autowired
    ActionSubMapper actionSubMapper;

    @Override
    public List<ActionSub> getByActionIds(String actions) {
        return actionSubMapper.getList(actions);
    }
}
