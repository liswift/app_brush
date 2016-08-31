package com.eazy.brush.service;

import com.eazy.brush.dao.entity.Task;

/**
 * @author feng.liu
 * @date 2016/8/31 18:02
 */
public interface TaskService {

    Task getById(int id);

    Task getByState(long callbackTime);

    void changeState(int id, long callbackTime);
}
