package com.eazy.brush.service.impl;

import com.eazy.brush.dao.entity.ActionPage;
import com.eazy.brush.dao.mapper.ActionPageMapper;
import com.eazy.brush.service.ActionPageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/8/31 22:11
 */
@Service
@Slf4j
public class ActionPageServiceImpl implements ActionPageService {

    @Autowired
    ActionPageMapper actionPageMapper;

    @Override
    public ActionPage getById(int id) {
        return actionPageMapper.getById(id);
    }

    @Override
    public List<ActionPage> getByIds(String ids) {
        return actionPageMapper.getListByIds(ids);
    }

    @Override
    public List<ActionPage> getByTaskId(int taskId) {
        return actionPageMapper.getByTaskId(taskId);
    }

    @Override
    public void changeState(int id,int enable) {
        actionPageMapper.updateEnable(id,enable);
    }

    @Override
    public ActionPage insertAndGetKey(int taskId) {
        ActionPage actionPage=new ActionPage();
        actionPage.setTaskId(taskId);
        actionPage.setPageName("默认页面名称");
        actionPageMapper.insert(actionPage);
        return actionPage;
    }

    @Override
    public void update(ActionPage actionPage) {
        actionPageMapper.update(actionPage);
    }

    @Override
    public void deleteById(int id) {
        actionPageMapper.delete(id);
    }
}
