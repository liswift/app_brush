package com.eazy.brush.dao.entity;

import lombok.Data;

/**
 * 子动作
 * author : liufeng
 * create time:2016/8/28 10:41
 */
@Data
public class ActionGroup {

    private int id;
    private int actionPageId;//也动作id
    private String name;//组动作名称,
    private String actionItemIds;// 元动作id,以逗号分割开来
    private int enable;
}
