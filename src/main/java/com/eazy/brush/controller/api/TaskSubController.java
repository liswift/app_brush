package com.eazy.brush.controller.api;

import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.controller.view.vo.TaskSubVo;
import com.eazy.brush.core.utils.DateTimeUitl;
import com.eazy.brush.dao.entity.TaskSub;
import com.eazy.brush.service.TaskSubService;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.joda.time.DateTime;
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

    @RequestMapping("/get")
    public void get() {
        String size = getPara("size", "1");

        DateTime perDateTime = DateTimeUitl.getPerTime(DateTime.now());
        int perTime = Integer.parseInt(perDateTime.toString("yyyyMMddMMHHmm"));
        List<TaskSub> taskSubs = taskSubService.getList(perTime, Integer.parseInt(size));
        List<TaskSubVo> taskSubList = Lists.newArrayList();
        renderJson(taskSubList);
    }

    @RequestMapping("callback")
    public void callback() {
        Map<String, String> map = getFormPage();
        String id = map.get("id");
        taskSubService.finishTaskSub(id);
    }
}
