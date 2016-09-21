package com.eazy.brush.controller.web;

import com.eazy.brush.component.ftp.FtpTool;
import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.controller.view.service.TaskVoService;
import com.eazy.brush.controller.view.vo.TaskVo;
import com.eazy.brush.core.android.apkinfo.bean.ApkInfo;
import com.eazy.brush.core.android.apkinfo.util.ApkUtil;
import com.eazy.brush.core.enums.TaskState;
import com.eazy.brush.core.utils.ActionRequest;
import com.eazy.brush.core.utils.Constants;
import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.model.User;
import com.eazy.brush.service.TaskService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
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

    @RequestMapping(value = "listByUser", method = RequestMethod.GET)
    public ModelAndView listByUser() {
        int curPage = getParaInt("curPage", 1);
        int size = getParaInt("size", 20);

        User user = getCurrentUser();
        ModelAndView model = new ModelAndView("task/list_byuser");
        List<TaskVo> taskVoses = taskVoService.getList(user.getId(), (curPage - 1) * size, size);
        model.addObject("user", user);
        model.addObject("tasks", taskVoses);
        return model;
    }

    @RequestMapping(value = "toAdd", method = RequestMethod.GET)
    public ModelAndView toAdd() {
        return new ModelAndView("task/save");
    }

    @RequestMapping(value = "toEditorPackage", method = RequestMethod.GET)
    public ModelAndView toEditorPackage(ModelMap map){
        Task task=taskService.getById(getParaInt("id",0));
        map.put("task",task);
        return new ModelAndView("task/editorPackage",map);
    }

    @RequestMapping(value = "toEdit", method = {RequestMethod.GET})
    public ModelAndView toEdit(int id) {
        ModelAndView modelAndView = new ModelAndView("task/save");
        modelAndView.addObject("task", taskService.getById(id));
        return modelAndView;
    }

    @RequestMapping(value = "apk/upload", method = {RequestMethod.GET, RequestMethod.POST})
    public void uploadApk(@RequestParam(value = "file") MultipartFile file) {
        String now = DateTime.now().toString("yyyyMMddHHmmssSSS");
        String fileName = now + "_" + file.getOriginalFilename();
        ApkInfo apkInfo = null;
        try {
            ftpTool.connect();
            ftpTool.upload(file.getInputStream(), fileName);
            ftpTool.disconnect();

            File tempFile = new File(fileName);
            FileUtils.copyInputStreamToFile(file.getInputStream(), tempFile);
            apkInfo = ApkUtil.getApkInfo(tempFile);
            FileUtils.forceDelete(tempFile);
            StringBuffer url = request.getRequestURL();
            String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
            apkInfo.setApkUrl(tempContextUrl+"task/apk/download?file="+fileName);
            renderJson200(apkInfo);
        } catch (IOException e) {
            log.error("upload apk file error {}", e);
            e.printStackTrace();
            renderJson500();
        }
    }

    @RequestMapping(value = "save", method = {RequestMethod.POST, RequestMethod.GET})
    public void save(Task task) {
        if (task.getId() <= 0) {
            task.setUserId(getCurrentUser().getId());
            task.setState(TaskState.confirm_ing.getCode());
            task.setDayLimit(Constants.TASK_DAY_LIMIT);
            taskService.add(task);
        } else {
            taskService.update(task);
        }
        renderJson200();
    }

    @RequestMapping(value = "delete", method = {RequestMethod.POST, RequestMethod.GET})
    public void delete(@RequestParam(value = "id") int id) {
        int result = taskVoService.delete(getCurrentUser().getId(),id);
        renderResult(result>0);
    }

    @RequestMapping(value = "start", method = {RequestMethod.POST, RequestMethod.GET})
    public void start(@RequestParam(value = "id") int id) {
        taskVoService.start(getCurrentUser().getId(),id);
        renderJson200();
    }

    @RequestMapping(value = "stop", method = {RequestMethod.POST, RequestMethod.GET})
    public void stop(@RequestParam(value = "id") int id) {
        taskVoService.stop(getCurrentUser().getId(),id);
        renderJson200();
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
