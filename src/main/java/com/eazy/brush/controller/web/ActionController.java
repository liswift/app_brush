package com.eazy.brush.controller.web;

import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.core.enums.ActionType;
import com.eazy.brush.core.enums.ArgumentType;
import com.eazy.brush.dao.entity.ActionItem;
import com.eazy.brush.service.ActionGroupService;
import com.eazy.brush.service.ActionItemService;
import com.eazy.brush.service.ActionPageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by yuekuapp on 16-9-15.
 */
@Controller
@RequestMapping("/action")
@Slf4j
public class ActionController extends BaseController {

    @Autowired
    ActionItemService actionItemService;

    @Autowired
    ActionPageService actionPageService;

    @Autowired
    ActionGroupService actionGroupService;

    /**
     * add
     */
    @RequestMapping(value = "toUnitAdd", method = RequestMethod.GET)
    public ModelAndView toUnitAdd(ModelMap map) {
        int unitId = getParaInt("id",0);
        if(unitId!=0){
            ActionItem actionItem=actionItemService.getById(unitId);
            map.put("actionItem",actionItem.transform2Vo());
        }
        map.put("pageId",getParaInt("pageId",0));
        map.put("actions",ActionType.values());
        map.put("arguments", ArgumentType.values());
        return new ModelAndView("action/unit_add",map);
    }

    /**
     * add
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public void add(@RequestBody ActionItem actionItem) {
//        ActionItem actionItem = initActionItem(0);
        actionItemService.add(actionItem);
        renderJson200(actionItem);
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public void update(@RequestBody ActionItem actionItem) {
        actionItemService.update(actionItem);
        renderResult(true);
    }

    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public void delete() {
        actionItemService.deleteItemById(getParaInt("id", 0));
        renderResult(true);
    }

    @RequestMapping(value = "get", method = RequestMethod.GET)
    public void get() {
        List<ActionItem> actionItemList = actionItemService.getByPageId(getParaInt("pageId", 0));
    }


    private ActionItem initActionItem(int id) {
        ActionItem actionItem = new ActionItem();
        if (id != 0) {
            actionItem.setId(id);
        }
        actionItem.setAction(ActionType.fromValue(getPara("action")).getValue());
        actionItem.setActionPageId(getParaInt("actionPageId", 0));
        actionItem.setName(getPara("name"));
        actionItem.setStayTime(getParaInt("stayTime", 50));
        actionItem.setUpDown(getParaInt("upDown", 1));
        actionItem.setActionParams(getPara("actionParams"));
        actionItem.setViewContent(getPara("viewContent"));
        actionItem.setViewId(getPara("viewId"));
        actionItem.setViewName(getPara("viewName"));
        return actionItem;
    }

}

