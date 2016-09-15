package com.eazy.brush.controller.web;

import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.controller.view.service.ActionPageVoService;
import com.eazy.brush.controller.view.vo.ActionPageVo;
import com.eazy.brush.core.enums.TaskState;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.service.ActionPageService;
import com.eazy.brush.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yuekuapp on 16-9-15.
 */
@Controller
@RequestMapping("/audit")
public class AuditController extends BaseController {
    @Autowired
    private TaskService taskService;

    @Autowired
    private ActionPageVoService actionPageVoService;

    @Autowired
    private ActionPageService actionPageService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(ModelMap map) {
        int userId=getCurrentUser().getId();
        Task task=taskService.getAuditSingleTask(userId,TaskState.confirm_ing.getCode());
        List<ActionPageVo> actionPages=new ArrayList<>();
        if(task==null){
            task = taskService.getRandomTask(userId);
        }else{
            actionPages = actionPageVoService.getByTaskIdNum(task.getId());
        }

        if(task==null){//没有可以审核的任何task,直接返回欢迎页面
            return new ModelAndView("audit/welcome");
        }else{
            map.put("task",task);
            map.put("actionPages",actionPages);
            return new ModelAndView("audit/index", map);
        }
    }

    @RequestMapping(value = "/toAddPageAction", method = RequestMethod.GET)
    public ModelAndView addPageActions(ModelMap map) {
       String taskId = getPara("id");
        map.put("taskId",taskId);
       return new ModelAndView("action/add",map);
    }

    @RequestMapping(value="/enable" ,method=RequestMethod.GET)
    public String changeState(String pageId){
        int curPage = getParaInt("pageId", 0);
        if(curPage==0){
            return "redirect:/sys/error";
        }
        actionPageService.changeState(curPage,1);
        return "redirect:/audit/index";
    }

    @RequestMapping(value="/disable" ,method=RequestMethod.GET)
    public String disableState(String pageId){
        int curPage = getParaInt("pageId", 0);
        if(curPage==0){
            return "redirect:/sys/error";
        }
        actionPageService.changeState(curPage,0);
        return "redirect:/audit/index";
    }

}
