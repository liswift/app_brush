package com.eazy.brush.core.utils;

/**
 * 静态常量
 * author : liufeng
 * create time:2016/8/28 13:09
 */
public interface Constants {

    /**
     * 任务时间粒度
     */
    int TASK_SUB_PER_MINITE = 10;

    /**
     * 快速投放，时间粒度内，执行元任务的上限
     */
    int TASK_BATCH_UP = 1000;
}
