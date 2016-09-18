package com.eazy.brush.controller.view.service.impl;

import com.eazy.brush.controller.view.service.ActionGroupVoService;
import com.eazy.brush.controller.view.service.ActionPageVoService;
import com.eazy.brush.controller.view.vo.ActionPageVo;
import com.eazy.brush.dao.entity.ActionPage;
import com.eazy.brush.service.ActionItemService;
import com.eazy.brush.service.ActionPageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/10 21:52
 */
@Service
@Slf4j
public class ActionPageVoServiceImpl implements ActionPageVoService {

    @Autowired
    ActionPageService actionPageService;

    @Autowired
    ActionGroupVoService actionGroupVoService;

    @Autowired
    ActionItemService actionItemService;


    @Override
    public List<ActionPageVo> getByTaskId(int id) {

        return new ArrayList<>();
    }




    @Override
    public List<ActionPageVo> getByTaskIdNum(int taskId) {
        List<ActionPage> actionPages = actionPageService.getByTaskId(taskId);
        List<ActionPageVo> result=new ArrayList<>();
        for(ActionPage actionPage:actionPages){
            ActionPageVo actionPageVo=new ActionPageVo();
            actionPageVo.setActionPage(actionPage);
            actionPageVo.setActionGroupVos(actionGroupVoService.getByPageId(actionPage.getId()));
            result.add(actionPageVo);
        }
        return result;
    }

    @Override
    public ActionPageVo getByTaskIdOrPageId(int taskId, int pageId) {
        ActionPageVo actionPageVo = new ActionPageVo();
        if(pageId==0){
            actionPageVo.setActionPage(actionPageService.insertAndGetKey(taskId));
        }else{
            actionPageVo.setActionPage(actionPageService.getById(pageId));
            actionPageVo.setActionGroupVos(actionGroupVoService.getByPageId(pageId));
            actionPageVo.setActionItems(actionItemService.getByPageId(pageId));
        }
        return actionPageVo;
    }

    @Override
    public void update(ActionPage actionPage) {
        actionPageService.update(actionPage);
        log.info("actionPage info >>>>>>>>>>>>"+actionPage.toString());
        actionGroupVoService.update(actionPage.getId(),actionPage.getActionGroups());
    }

    @Override
    public void deleteById(int id) {
        actionPageService.deleteById(id);
        actionItemService.deleteByPageid(id);
        actionGroupVoService.deleteByPageId(id);
    }
}
