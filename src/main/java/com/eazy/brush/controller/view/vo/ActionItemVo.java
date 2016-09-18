package com.eazy.brush.controller.view.vo;

import lombok.Data;

import java.util.Map;

/**
 * Created by yuekuapp on 16-9-17.
 */
@Data
public class ActionItemVo {
    private int id;
    private int actionPageId;//页动作id
    private String name;//元动作名称,
    private String viewName; //view类名,
    private String viewId; //viewId,
    private String viewContent; //view内容,
    private int action;//动作,
    private Map<String,String> actionParams;//动作参数,type:value;type:value,注意一个key只能对应一个Value
    private int stayTime;//停留时间,秒
    private int upDown;//波动范围,秒

}
