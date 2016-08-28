package com.eazy.brush.service;

import com.eazy.brush.model.Task;

/**
 * 元任务相关服务
 * author : liufeng
 * create time:2016/8/28 12:57
 */
public interface TaskSubService {

    /**
     * 根据客户提交的任务单生成元任务
     *
     * @param task
     */
    void makeTaskSub(Task task);
}
