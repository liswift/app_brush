package com.eazy.brush.controller.api;

import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.dao.entity.TaskSub;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

/**
 * 任务相关接口
 * author : liufeng
 * create time:2016/8/27 17:11
 */
@Controller
@RequestMapping("/api/task")
public class TaskController extends BaseController {

    static Logger logger = LoggerFactory.getLogger(TaskController.class);

    @RequestMapping("/get")
    public void get() {
        TaskSub taskSub = new TaskSub();
        renderJson(taskSub);
    }

    @RequestMapping("callback")
    public void callback() {
        Map<String, String> map = getFormPage();
        String queueKey = map.get("queueKey");
        String queueIndex = map.get("queueIndex");
    }
}
