package com.eazy.brush.dao.entity;

import lombok.Data;

/**
 * 元动作
 * author : liufeng
 * create time:2016/9/10 20:21
 */
@Data
public class ActionItem {
    private int id;
    private String name;//元动作名称,
    private String viewName; //view类名,
    private String viewContent; //view内容,
    private String action;//动作,
    private String acitionParam;//动作参数,
    private int stayTime;//停留时间,
    private int upDown;//波动范围,
}
