package com.eazy.brush.controller.web;

import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.controller.view.service.SubTaskAdminVoService;
import com.eazy.brush.controller.view.vo.SubTaskAdminVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by yuekuapp on 16-10-5.
 */
@Controller
@RequestMapping("/admin")
@Slf4j
public class SubTaskAdminControl extends BaseController{

    @Autowired
    SubTaskAdminVoService subTaskAdminVoService;


    @RequestMapping(value = "todayTask", method = RequestMethod.GET)
    public ModelAndView adminTaskList(ModelMap map){
        List<SubTaskAdminVo> allTodyTask = subTaskAdminVoService.getAllTodyTask();
        map.put("subTaskAdminVos",allTodyTask);
        return new ModelAndView("count/tasklist",map);
    }



    @RequestMapping(value = "taskhistory", method = {RequestMethod.GET, RequestMethod.POST})
    public void openTime(@RequestParam(value = "taskId")String taskId, @RequestParam(value = "percent")int percent){


    }
}
