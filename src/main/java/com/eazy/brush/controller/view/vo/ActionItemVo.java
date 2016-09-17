package com.eazy.brush.controller.view.vo;

import lombok.Data;
import org.apache.commons.collections.keyvalue.DefaultKeyValue;

import java.util.List;

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
    private List<DefaultKeyValue> actionParams;//动作参数,type:value;type:value
    private int stayTime;//停留时间,秒
    private int upDown;//波动范围,秒

}
