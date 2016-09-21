package com.eazy.brush.controller.view.vo;

import lombok.Data;

/**
 * Created by yuekuapp on 16-9-21.
 */
@Data
public class ActionItemApiArgument {

    public ActionItemApiArgument(){}
    public ActionItemApiArgument(String argumentType,String argmentValue){
        this.argumentType=argumentType;
        this.argmentValue=argmentValue;
    }

    /**
     * 类型一共是四种 boolean／int／string/CHARSEQUENCE
     *
     */
    private String argumentType;

    /**
     * 如果是以boolean结尾的 argmentValue:"true"/"false"
     * 如果是以int结尾的，argmentValue：“124”
     * 如果是以charsequence结尾，argumentValue：
     * 其余按照String处理
     */
    private String argmentValue;
}
