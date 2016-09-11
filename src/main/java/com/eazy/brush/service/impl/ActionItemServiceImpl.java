package com.eazy.brush.service.impl;

import com.eazy.brush.dao.entity.ActionItem;
import com.eazy.brush.dao.mapper.ActionItemMapper;
import com.eazy.brush.service.ActionItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/10 22:37
 */
@Service
public class ActionItemServiceImpl implements ActionItemService {

    @Autowired
    ActionItemMapper actionItemMapper;

    @Override
    public List<ActionItem> getByIds(String actionItemId) {
        return actionItemMapper.getByIds(actionItemId);
    }
}
