package com.eazy.brush.service;

import com.eazy.brush.dao.entity.ActionPage;

import java.util.List;

/**
 * 动作服务
 * author : liufeng
 * create time:2016/8/29 23:24
 */
public interface ActionPageService {

    ActionPage getById(int id);

    List<ActionPage> getByIds(String ids);

    List<ActionPage> getByTaskId(int taskId);

    void changeState(int id,int enable);

    ActionPage insertAndGetKey(int taskId);

    void update(ActionPage actionPage);

    void deleteById(int id);
}
