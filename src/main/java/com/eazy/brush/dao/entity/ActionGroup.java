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
    private String name;//组动作名称,
    private String itemId;// 元动作id,
    private int enable;
}
