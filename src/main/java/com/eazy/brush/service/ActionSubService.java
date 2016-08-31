package com.eazy.brush.service;

import com.eazy.brush.dao.entity.ActionSub;

import java.util.List;

/**
 * 自动作服务
 * author : liufeng
 * create time:2016/8/29 23:24
 */
public interface ActionSubService {

    List<ActionSub> getByActionIds(String actions);
}
