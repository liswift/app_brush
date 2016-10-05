package com.eazy.brush.controller.web;

import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.dao.entity.TaskSetup;
import com.eazy.brush.service.TaskSetupService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by yuekuapp on 16-10-5.
 */
@Controller
@RequestMapping("/tasksetup")
@Slf4j
public class TaskSetupController extends BaseController{

    @Autowired
    TaskSetupService taskSetupService;

    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public ModelAndView listByUser(ModelMap map) {
        int taskId=getParaInt("taskId",0);
        TaskSetup taskSetup = taskSetupService.getByTaskId(taskId);
        if(taskSetup==null|| taskSetup.getId()==0){
            taskSetup=new TaskSetup();
            taskSetup.setTaskId(taskId);
        }
        map.put("taskSetup",taskSetup);
        return new ModelAndView("tasksetup/tasksetup_add",map);
    }

    /**
     * 添加或者更新
     * @return
     */
    @RequestMapping(value = "addoup", method = RequestMethod.POST)
    public void addOrUP(TaskSetup taskSetup) {
        taskSetup.setOperatorId(getCurrentUser().getId());
        if(taskSetup.getId()==0){
            taskSetupService.insert(taskSetup);
        }else{
            taskSetupService.update(taskSetup);
        }
        renderJson200();
    }
}
