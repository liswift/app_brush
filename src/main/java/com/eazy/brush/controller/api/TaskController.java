package com.eazy.brush.controller.api;

import com.eazy.brush.controller.common.BaseController;
import com.google.common.collect.Maps;
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

    @RequestMapping("/get")
    public void get() {
        Map<String, String> map = Maps.newHashMap();
        map.put("serial", "2323232");
        map.put("brand", "3232232");
        renderJson(map);
    }
}
