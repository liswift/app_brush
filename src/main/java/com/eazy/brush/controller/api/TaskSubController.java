package com.eazy.brush.controller.api;

import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.controller.view.service.TaskSubVoService;
import com.eazy.brush.controller.view.vo.TaskSubVo;
import com.eazy.brush.core.enums.SubTaskState;
import com.eazy.brush.dao.entity.TaskSub;
import com.eazy.brush.service.TaskSubService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

/**
 * 任务相关接口
 * author : liufeng
 * create time:2016/8/27 17:11
 */
@Controller
@RequestMapping("/api/tasksub")
@Slf4j
public class TaskSubController extends BaseController {

    @Autowired
    TaskSubService taskSubService;

    @Autowired
    TaskSubVoService taskSubVoService;

    @RequestMapping("/consume")
    public void get() {
        String size = getPara("size", "1");
        List<TaskSub> taskSubs = taskSubService.getUnConsumeList(Integer.parseInt(size));
        List<TaskSubVo> taskSubList = taskSubVoService.buildVo(taskSubs);
        taskSubService.changeTaskSubState(taskSubVoService.buildVoIds(taskSubs), SubTaskState.RUNNING);//任务已取走，未回调
        renderJson200(wrapField("tasks", taskSubList));
    }

    @RequestMapping("/callback")
    public void callback() {
        Map<String, String> map = getFormPage();
        String ids = map.get("ids");
        taskSubService.changeTaskSubState(ids, SubTaskState.FINISHED);//回调
        renderJson200();
    }
}
