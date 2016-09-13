package com.eazy.brush.service;

import com.eazy.brush.dao.entity.ActionItem;

import java.util.List;

/**
 * 元动作相关服务
 * author : liufeng
 * create time:2016/9/10 22:36
 */
public interface ActionItemService {

    List<ActionItem> getByIds(String actionItemId);


}

