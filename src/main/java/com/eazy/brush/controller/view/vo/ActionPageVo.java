package com.eazy.brush.controller.view.vo;

import com.eazy.brush.dao.entity.ActionItem;
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
    private String pageName;//页面名称
    private String pageDesc;//页面描述
    private List<ActionItem> actionItems;//操作动作id集合
    private List<ActionGroupVo> actionGroupVos;
}
