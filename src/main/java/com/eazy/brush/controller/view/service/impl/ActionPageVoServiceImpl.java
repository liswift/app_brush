package com.eazy.brush.controller.view.service.impl;

import com.eazy.brush.controller.view.service.ActionGroupVoService;
import com.eazy.brush.controller.view.service.ActionPageVoService;
import com.eazy.brush.controller.view.vo.ActionPageVo;
import com.eazy.brush.dao.entity.ActionPage;
import com.eazy.brush.service.ActionItemService;
import com.eazy.brush.service.ActionPageService;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/10 21:52
 */
@Service
public class ActionPageVoServiceImpl implements ActionPageVoService {

    @Autowired
    ActionPageService actionPageService;

    @Autowired
    ActionGroupVoService actionGroupVoService;

    @Autowired
    ActionItemService actionItemService;

    @Override
    public List<ActionPageVo> getByIds(String ids) {
        List<ActionPage> actionPageList = actionPageService.getByIds(ids);
        List<ActionPageVo> list = Lists.newArrayList();
        for (ActionPage actionPage : actionPageList) {
            ActionPageVo actionPageVo = new ActionPageVo();
            actionPageVo.setId(actionPage.getId());
            actionPageVo.setPageName(actionPage.getPageName());
            actionPageVo.setPageDesc(actionPage.getPageDesc());
            actionPageVo.setActionGroupVos(actionGroupVoService.getByIds(actionPage.getActionGroupId()));
            actionPageVo.setActionItems(actionItemService.getByIds(actionPage.getActionItemId()));
            list.add(actionPageVo);
        }
        return list;
    }
}
