package com.eazy.brush.controller.web;

import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.core.enums.TaskState;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by yuekuapp on 16-9-15.
 */
@Controller
@RequestMapping("/audit")
public class AuditController extends BaseController {
    @Autowired
    private TaskService taskService;


    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(ModelMap map) {
        int userId=getCurrentUser().getId();
        Task task=taskService.getAuditSingleTask(userId,TaskState.confirm_ing.getCode());
        if(task==null){
            task=taskService.getRandomTask(userId);
        }
        if(task==null){//没有可以审核的任何task,直接返回欢迎页面
            return new ModelAndView("audit/index",map);
        }


        return new ModelAndView("index/index", map);
    }

}
