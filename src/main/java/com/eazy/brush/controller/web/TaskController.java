package com.eazy.brush.controller.web;

import com.eazy.brush.component.ftp.FtpTool;
import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.core.utils.ActionRequest;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.service.TaskService;
import com.google.common.collect.Maps;
import lombok.extern.slf4j.Slf4j;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

/**
 * 任务管理Controller
 *
 * @author feng.liu
 * @date 2016/9/8 15:58
 */
@Controller
@RequestMapping("/task")
@Slf4j
public class TaskController extends BaseController {

    @Autowired
    private FtpTool ftpTool;

    @Autowired
    private TaskService taskService;

    @RequestMapping(value = "toAdd", method = RequestMethod.GET)
    public ModelAndView toAdd(HttpServletRequest request) {
        return new ModelAndView("task/task_add");
    }

    @RequestMapping(value = "apk/upload", method = {RequestMethod.GET, RequestMethod.POST})
    public void uploadApk(@RequestParam(value = "file", required = false) MultipartFile file) {
        String now = DateTime.now().toString("yyyyMMddHHmmssSSS");
        String fileName = now + "_" + file.getOriginalFilename();
        try {
            ftpTool.upload(file.getInputStream(), fileName);
        } catch (IOException e) {
            log.error("upload apk file error {}", e);
            e.printStackTrace();
            renderJson500();
        }
        renderJson200(wrapField("fileName", fileName));
    }

    @RequestMapping(value = "add", method = {RequestMethod.POST, RequestMethod.GET})
    public String add(Task task) {
        taskService.add(task);
        return "redirect:/task/list";
    }

    @RequestMapping(value = "get", method = {RequestMethod.GET})
    public ModelAndView get(int id) {
        ModelAndView modelAndView = new ModelAndView("/task/task_update");
        modelAndView.addObject("task", taskService.getById(id));
        return modelAndView;
    }

    @RequestMapping(value = "apk/download", method = RequestMethod.GET)
    public void downloadApk(@RequestParam(value = "file") String file) {
        try {
            ActionRequest.renderStream(file, response);
            ftpTool.downLoadToOutputStream(file, response.getOutputStream());
        } catch (IOException e) {
            log.error("down file error,{}", e);
        }
    }
}
