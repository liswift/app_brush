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

    @Override
    public ActionItem getById(int id) {
        return actionItemMapper.getById(id);
    }

    @Override
    public List<ActionItem> getByPageId(int pageid) {
        return actionItemMapper.getByPageId(pageid);
    }

    @Override
    public void deleteItemById(int id) {
        actionItemMapper.delete(id);
    }

    @Override
    public void deleteByPageid(int pageId) {
        actionItemMapper.deleteByPageId(pageId);
    }

    @Override
    public void add(ActionItem actionItem) {
        actionItemMapper.insert(actionItem);
    }

    @Override
    public void update(ActionItem actionItem) {
        actionItemMapper.update(actionItem);
    }


}
