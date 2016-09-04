package com.eazy.brush.controller.view.vo;

import lombok.Data;

/**
 * 任务Vo
 * author : liufeng
 * create time:2016/8/28 10:44
 */
@Data
public class TaskVo {
    private int id;
    private String appName;
    private String packageName;
    private String createTime;
    private int incrDay;
    private int amount;
    private int todayNum;
    private int yestodayNum;
    private String state;
}
