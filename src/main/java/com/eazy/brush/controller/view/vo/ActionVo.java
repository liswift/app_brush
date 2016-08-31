package com.eazy.brush.controller.view.vo;

import com.eazy.brush.dao.entity.ActionSub;
import lombok.Data;

import java.util.List;

/**
 * 动作vo
 * author : liufeng
 * create time:2016/8/31 22:04
 */
@Data
public class ActionVo {
    private int id;
    private String name;
    private List<ActionSub> actionSubs;
}
