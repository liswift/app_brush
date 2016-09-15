package com.eazy.brush.controller.web;

import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.core.enums.TaskState;
import com.eazy.brush.dao.entity.ActionPage;
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
    private ActionPageService actionPageService;


    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(ModelMap map) {
        int userId=getCurrentUser().getId();
        Task task=taskService.getAuditSingleTask(userId,TaskState.confirm_ing.getCode());
        List<ActionPage> actionPages=new ArrayList<>();
        if(task==null){
            task = taskService.getRandomTask(userId);
        }else{
            actionPages = actionPageService.getByTaskId(task.getId());
        }

        if(task==null){//没有可以审核的任何task,直接返回欢迎页面
            return new ModelAndView("audit/welcome",map);
        }else{
            map.put("task",task);
            map.put("actionPages",actionPages);
            return new ModelAndView("audit/index", map);
        }
    }

}
