package com.eazy.brush.controller.view.vo;

import com.eazy.brush.dao.entity.ActionItem;
import com.eazy.brush.dao.entity.ActionPage;
import lombok.Data;

import java.util.List;

/**
 * 动作vo
 * author : liufeng
 * create time:2016/8/31 22:04
 */
@Data
public class ActionPageVo {
    private int id;
    private int enable=1;//是否可用默认是1
    private String pageName;//页面名称
    private int taskId;//task Id
    private String pageDesc="";//页面描述


    public void setActionPage(ActionPage actionPage){
        this.enable=actionPage.getEnable();
        this.pageDesc=actionPage.getPageDesc();
        this.taskId=actionPage.getTaskId();
        this.id=actionPage.getId();
        this.pageName=actionPage.getPageName();
    }


    private List<ActionItem> actionItems;//操作动作id集合
    private List<ActionGroupVo> actionGroupVos;
}
