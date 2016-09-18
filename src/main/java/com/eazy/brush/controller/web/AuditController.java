package com.eazy.brush.controller.web;

import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.controller.view.service.ActionPageVoService;
import com.eazy.brush.controller.view.vo.ActionPageVo;
import com.eazy.brush.core.enums.TaskState;
import com.eazy.brush.dao.entity.ActionPage;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.service.ActionPageService;
import com.eazy.brush.service.TaskService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by yuekuapp on 16-9-15.
 */
@Controller
@RequestMapping("/audit")
@Slf4j
public class AuditController extends BaseController {
    @Autowired
    private TaskService taskService;

    @Autowired
    private ActionPageVoService actionPageVoService;

    @Autowired
    private ActionPageService actionPageService;

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(ModelMap map) {
        int userId = getCurrentUser().getId();
        Task task = taskService.getAuditSingleTask(userId, TaskState.confirm_ing.getCode());
        List<ActionPageVo> actionPages = new ArrayList<>();
        if (task == null) {
            task = taskService.getRandomTask(userId);
        } else {
            actionPages = actionPageVoService.getByTaskIdNum(task.getId());
        }

        if (task == null) {//没有可以审核的任何task,直接返回欢迎页面
            return new ModelAndView("audit/welcome");
        } else {
            map.put("task", task);
            map.put("actionPages", actionPages);
            return new ModelAndView("audit/index", map);
        }
    }

    /**
     * 放回操作
     */
    @RequestMapping(value = "release", method = RequestMethod.GET)
    public void release() {
        taskService.assignAuditUserId(getCurrentUser().getId(), getParaInt("id", 0));
        renderResult(true);
    }

    /**
     * 通过 拒绝操作
     */
    @RequestMapping(value = "changeState", method = RequestMethod.GET)
    public void changeState() {
        int taskId = getParaInt("id", 0);
        int state = getParaInt("state", -10);
        if (!TaskState.isEnable(state)) {
            renderResult(false);
            return;
        }
        String message = getPara("msg", "");

        int result = taskService.changeState(taskId, getCurrentUser().getId(), state, message);
        renderResult(result > 0);
    }


    @RequestMapping(value = "editorTask", method = RequestMethod.GET)
    public ModelAndView editorTask(ModelMap map) {
        Task task = taskService.getById(getParaInt("id", 0));
        List<ActionPageVo> actionPages = actionPageVoService.getByTaskIdNum(task.getId());
        map.put("task", task);
        map.put("actionPages", actionPages);
        return new ModelAndView("audit/index", map);
    }

    @RequestMapping(value = "historyList", method = RequestMethod.GET)
    public ModelAndView historyList(ModelMap map) {
        List<Task> tasks = taskService.getByAuditUserId(getCurrentUser().getId());
        map.put("tasks", tasks);
        return new ModelAndView("audit/history", map);
    }

    @RequestMapping(value = "toViewTask", method = RequestMethod.GET)
    public ModelAndView toViewTask(ModelMap map) {
        Task task = taskService.getById(getParaInt("id", 0));
        List<ActionPageVo> actionPageVos = actionPageVoService.getByTaskIdNum(task.getId());
        map.put("task", task);
        map.put("actionPages", actionPageVos);
        return new ModelAndView("audit/viewTask", map);
    }


    @RequestMapping(value = "toAddPageAction", method = RequestMethod.GET)
    public ModelAndView toAddPageAction(ModelMap map) {
        int taskId = getParaInt("id", 0);
        int pageId=getParaInt("pageId",0);
        ActionPageVo actionPageVo=actionPageVoService.getByTaskIdOrPageId(taskId,pageId);
        map.put("actionPageVo", actionPageVo);
        map.put("view",getParaInt("view",0));
        return new ModelAndView("action/add", map);
    }

    @RequestMapping(value = "addActionPage", method = RequestMethod.POST)
    public void addPageAction(@RequestBody ActionPage actionPage) {
        actionPageVoService.update(actionPage);
        renderResult(true);
    }

    @RequestMapping(value = "editActionPage", method = RequestMethod.POST)
    public void editActionPage() {
        Map<String, String> formPage = getFormPage();
        ActionPageVo actionPageVo = new ActionPageVo();
//        actionPageVo.setTaskId(IntegerConstant.valueOf(formPage.get("taskId"));
        renderResult(true);
    }

    @RequestMapping(value = "deleteActionPage", method = RequestMethod.POST)
    public void deleteActionPage() {
        Map<String, String> formPage = getFormPage();
        ActionPageVo actionPageVo = new ActionPageVo();
//        actionPageVo.setTaskId(IntegerConstant.valueOf(formPage.get("taskId"));
        renderResult(true);
    }

    @RequestMapping(value = "enable", method = RequestMethod.GET)
    public String enable(ModelMap map) {
        int curPage = getParaInt("pageId", 0);
        if (curPage == 0) {
            return "redirect:/sys/error";
        }
        actionPageService.changeState(curPage, 1);
        return "redirect:/audit/index";
    }

    @RequestMapping(value = "disable", method = RequestMethod.GET)
    public String disable(ModelMap map) {
        int curPage = getParaInt("pageId", 0);
        if (curPage == 0) {
            return "redirect:/sys/error";
        }
        actionPageService.changeState(curPage, 0);
        return "redirect:/audit/index";
    }

}
