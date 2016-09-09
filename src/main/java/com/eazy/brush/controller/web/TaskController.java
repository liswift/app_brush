package com.eazy.brush.controller.web;

import com.eazy.brush.component.ftp.FtpTool;
import com.eazy.brush.controller.common.BaseController;
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
import java.io.OutputStream;

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

    @RequestMapping(value = "toAdd", method = RequestMethod.GET)
    public ModelAndView toAddUser(HttpServletRequest request) {
        return new ModelAndView("task/task_add");
    }

    @RequestMapping(value = "apk/upload", method = RequestMethod.GET)
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
        renderJson(fileName);
    }

    @RequestMapping(value = "apk/download", method = RequestMethod.GET)
    public void downloadApk(@RequestParam(value = "file") String file) {
        response.setContentType("application/octet-stream");
//        OutputStream out = response.getOutputStream();
//        out.close();
    }
}
