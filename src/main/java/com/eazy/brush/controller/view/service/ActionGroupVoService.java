package com.eazy.brush.controller.view.service;

import com.eazy.brush.controller.view.vo.ActionGroupVo;
import com.eazy.brush.dao.entity.ActionGroup;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/10 22:40
 */
public interface ActionGroupVoService {

    List<ActionGroupVo> getByIds(String actionGroupId);

    List<ActionGroupVo> getByPageId(int pageId);

    void update(int pageId,List<ActionGroup>  actionGroup);

    void deleteByPageId(int pageId);
}

