package com.eazy.brush.service;

import com.eazy.brush.dao.entity.ActionPage;

import java.util.List;

/**
 * 任务，动作映射关系服务
 * author : liufeng
 * create time:2016/8/29 23:25
 */
public interface TaskActionService {

    List<ActionPage> getActionsByTaskId(int taskId);
}
