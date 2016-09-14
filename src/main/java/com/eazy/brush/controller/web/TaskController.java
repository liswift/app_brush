package com.eazy.brush.controller.web;

import com.eazy.brush.component.ftp.FtpTool;
import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.controller.view.service.TaskVoService;
import com.eazy.brush.controller.view.service.UserAccountVoService;
import com.eazy.brush.controller.view.vo.TaskVo;
import com.eazy.brush.controller.view.vo.UserAccountVo;
import com.eazy.brush.core.enums.TaskState;
import com.eazy.brush.core.utils.ActionRequest;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.model.User;
import com.eazy.brush.service.TaskService;
import lombok.extern.slf4j.Slf4j;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.Date;
import java.util.List;

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

    @Autowired
    private TaskVoService taskVoService;

    @Autowired
    private UserAccountVoService userAccountVoService;

    @RequestMapping(value = "listByUser", method = RequestMethod.GET)
    public ModelAndView listByUser() {
        int curPage = getParaInt("curPage", 1);
        int size = getParaInt("size", 20);

        User user = getCurrentUser();
        ModelAndView model = new ModelAndView("task/list_byuser");
        UserAccountVo userAccountVo = userAccountVoService.getByUserId(user.getId());
        List<TaskVo> taskVoses = taskVoService.getList(user.getId(), (curPage - 1) * size, size);
        model.addObject("userAccountVo", userAccountVo);
        model.addObject("tasks", taskVoses);
        return model;
    }

    @RequestMapping(value = "toAdd", method = RequestMethod.GET)
    public ModelAndView toAdd() {
        return new ModelAndView("task/save");
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

    @RequestMapping(value = "save", method = {RequestMethod.POST, RequestMethod.GET})
    public void save(Task task) {
        if (task.getId() <= 0) {
            task.setUserId(getCurrentUser().getId());
            task.setCreateTime(new Date());
            task.setPackageName("");
            task.setApkUrl("");
            task.setActionPageId("");
            task.setState(TaskState.confirm_ing.getCode());
            taskService.add(task);
        } else {
            taskService.update(task);
        }
        renderJsonResponse();
    }

    @RequestMapping(value = "delete", method = {RequestMethod.POST, RequestMethod.GET})
    public String delete(@RequestParam(value = "id") int id) {
        taskService.delete(id);
        return "redirect:/task/listByUser";
    }

    @RequestMapping(value = "toEdit", method = {RequestMethod.GET})
    public ModelAndView toEdit(int id) {
        ModelAndView modelAndView = new ModelAndView("task/save");
        modelAndView.addObject("task", taskService.getById(id));
        return modelAndView;
    }

    @RequestMapping(value = "apk/download", method = RequestMethod.GET)
    public void downloadApk(@RequestParam(value = "file") String file) {
        try {
            ActionRequest.renderStream(file, response);
            ftpTool.connect();
            ftpTool.downLoadToOutputStream(file, response.getOutputStream());
            ftpTool.disconnect();
        } catch (IOException e) {
            log.error("down file error,{}", e);
        }
    }
}
