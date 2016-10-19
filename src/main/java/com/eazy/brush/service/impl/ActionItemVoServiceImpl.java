package com.eazy.brush.service.impl;

import com.eazy.brush.controller.api.service.ActionItemNetService;
import com.eazy.brush.controller.view.vo.ActionItemApiVo;
import com.eazy.brush.dao.entity.ActionItem;
import com.eazy.brush.service.ActionItemService;
import com.eazy.brush.service.ActionItemVoService;
import com.eazy.brush.service.PhoneNumberService;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yuekuapp on 16-9-21.
 */
@Slf4j
@Service
public class ActionItemVoServiceImpl implements ActionItemVoService {

    @Autowired
    ActionItemService actionItemService;

    @Autowired
    PhoneNumberService phoneNumberService;

    @Override
    public List<ActionItemApiVo> getApiByIds(String ids,ActionItemNetService service) {
        List<ActionItem> byIds = actionItemService.getByIds(ids);
        List<ActionItemApiVo> actionItemApiVos = Lists.newArrayList();
        log.info("ActinItemVoServcieImpl getApiByIds:"+ids+" sizeback:"+byIds.size());
        for (ActionItem actionItem : byIds) {
           actionItemApiVos.add(actionItem.transform2ApiVo(service,phoneNumberService));
        }
        return actionItemApiVos;
    }
}
