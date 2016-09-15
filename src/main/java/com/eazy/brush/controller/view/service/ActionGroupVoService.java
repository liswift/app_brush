package com.eazy.brush.controller.view.service;

import com.eazy.brush.controller.view.vo.ActionGroupVo;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/10 22:40
 */
public interface ActionGroupVoService {

    List<ActionGroupVo> getByIds(String actionGroupId);

    List<ActionGroupVo> getByPageId(int pageId);
}

