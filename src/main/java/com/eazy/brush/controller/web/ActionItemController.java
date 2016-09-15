package com.eazy.brush.controller.web;

import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.dao.entity.ActionItem;
import com.eazy.brush.service.ActionItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by yuekuapp on 16-9-15.
 */
@Controller
@RequestMapping("/action")
@Slf4j
public class ActionItemController extends BaseController {

    @Autowired
    ActionItemService actionItemService;


    /**
     * add
     */
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public void add() {
        ActionItem actionItem = initActionItem(0);
        actionItemService.add(actionItem);
        renderResult(true);
    }

    private ActionItem initActionItem(int id) {
        ActionItem actionItem = new ActionItem();
        if (id != 0) {
            actionItem.setId(id);
        }
        actionItem.setAction(getPara("action"));
        actionItem.setActionPageId(getParaInt("actionPageid", 0));
        actionItem.setName(getPara("name"));
        actionItem.setStayTime(getParaInt("stayTime", 50));
        actionItem.setUpDown(getParaInt("upDown", 1));
        actionItem.setAcitionParam(getPara("param"));
        actionItem.setViewContent(getPara("viewContent"));
        actionItem.setViewId(getPara("viewId"));
        actionItem.setViewName(getPara("viewName"));
        return actionItem;
    }

    @RequestMapping(value = "update", method = RequestMethod.GET)
    public void update() {
        actionItemService.update(initActionItem(getParaInt("id", 0)));
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


}

