package com.eazy.brush.controller.web;

import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.dao.entity.TaskHistory;
import com.eazy.brush.model.User;
import com.eazy.brush.service.TaskHistoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by yuekuapp on 16-9-20.
 */
@Controller
@RequestMapping("/taskhistory")
@Slf4j
public class TaskHistoryController extends BaseController {

    @Autowired
    TaskHistoryService taskHistoryService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public ModelAndView listByUser(ModelMap map) {
        User user = getCurrentUser();
        List<TaskHistory> byUserId = taskHistoryService.getByUserId(user.getId());
        map.put("taskhistories",byUserId);
        return new ModelAndView("taskhistory/list",map);
    }
}
