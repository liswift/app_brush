package com.eazy.brush.service;

import com.eazy.brush.controller.view.vo.ActionItemApiVo;

import java.util.List;

/**
 * Created by yuekuapp on 16-9-21.
 */
public interface ActionItemVoService {
    public List<ActionItemApiVo> getApiByIds(String ids);
}
