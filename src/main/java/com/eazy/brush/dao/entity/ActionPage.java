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
    private String pageName;//页面名称
    private String pageDesc;//页面描述
    private String actionItemId;//操作动作id集合
    private String actionGroupId;//操作动作组集合
}
