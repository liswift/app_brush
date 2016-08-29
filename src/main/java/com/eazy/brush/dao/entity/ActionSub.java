package com.eazy.brush.dao.entity;

import lombok.Data;

/**
 * 子动作
 * author : liufeng
 * create time:2016/8/28 10:41
 */
@Data
public class ActionSub {

    private int id;
    private String name;
    private String action;
    private int runTime;        //运行时长
}
