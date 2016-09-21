package com.eazy.brush.service.impl;

import com.eazy.brush.controller.view.vo.ActionItemApiVo;
import com.eazy.brush.dao.entity.ActionItem;
import com.eazy.brush.service.ActionItemService;
import com.eazy.brush.service.ActionItemVoService;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yuekuapp on 16-9-21.
 */
@Service
public class ActionItemVoServiceImpl implements ActionItemVoService {

    @Autowired
    ActionItemService actionItemService;

    @Override
    public List<ActionItemApiVo> getApiByIds(String ids) {
        List<ActionItem> byIds = actionItemService.getByIds(ids);
        List<ActionItemApiVo> actionItemApiVos = Lists.newArrayList();
        for (ActionItem actionItem : byIds) {
           actionItemApiVos.add(actionItem.transform2ApiVo());
        }
        return actionItemApiVos;
    }
}
