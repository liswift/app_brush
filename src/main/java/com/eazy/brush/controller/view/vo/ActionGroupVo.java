package com.eazy.brush.controller.view.vo;

import com.eazy.brush.dao.entity.ActionItem;
import lombok.Data;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/10 21:28
 */
@Data
public class ActionGroupVo {
    private int id;
    private String name;//组动作名称,
    private int enable;
    private List<ActionItem> acitionItems;
}
