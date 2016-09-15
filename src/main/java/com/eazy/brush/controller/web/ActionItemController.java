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
public class ActionItemController extends BaseController{

    @Autowired
    ActionItemService actionItemService;


    /**
     * add
     */
    @RequestMapping(value="add",method = RequestMethod.GET)
    public void add(){
        ActionItem actionItem=new ActionItem();
        actionItem.setAction(getPara("action"));
        actionItem.setActionPageId(getParaInt("actionPageid",0));
        actionItem.setName(getPara("name"));
        actionItem.setStayTime(getParaInt("stayTime",5));


        actionItemService.add(actionItem);
        renderResult(true);
    }

    @RequestMapping(value="delete",method = RequestMethod.GET)
    public void delete(){
        actionItemService.deleteItemById(getParaInt("id",0));
        renderResult(true);
    }

    @RequestMapping(value="get",method = RequestMethod.GET)
    public void get(){
        List<ActionItem> actionItemList=actionItemService.getByPageId(getParaInt("pageId",0));
    }


}

