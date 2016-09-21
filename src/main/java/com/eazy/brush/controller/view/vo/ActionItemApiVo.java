package com.eazy.brush.controller.view.vo;

import lombok.Data;

import java.util.List;

/**
 * Created by yuekuapp on 16-9-21.
 */
@Data
public class ActionItemApiVo {
    //这里是 秒
    private int delayTime;
    private int updownTime;
    /**
     * 此动作的标示
     * 1.className
     * 2.viewId，如果当前界面只有一个此view的id，比较常用
     * 3.text(内容)
     *
     * 三者至少有其中一个
     */
    private String className;
    private String viewId;
    private String text;

    private List<ActionItemApiArgument> arguments;
    /**
     */
    private int realAction;


}
