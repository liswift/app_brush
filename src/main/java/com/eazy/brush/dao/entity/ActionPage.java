package com.eazy.brush.dao.entity;

import lombok.Data;

/**
 * 动作
 * author : liufeng
 * create time:2016/8/28 10:40
 */
@Data
public class ActionPage {
    private int id;
    private int taskId;//task Id
    private String pageName;//页面名称
    private String pageDesc;//页面描述
    private int enable=1;//是否可用默认是1
}
