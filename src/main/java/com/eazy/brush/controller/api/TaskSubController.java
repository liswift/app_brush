package com.eazy.brush.controller.api;

import com.eazy.brush.component.ftp.FtpTool;
import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.controller.view.service.TaskSubVoService;
import com.eazy.brush.controller.view.vo.TaskSubApiVo;
import com.eazy.brush.core.enums.SubTaskState;
import com.eazy.brush.core.utils.ActionRequest;
import com.eazy.brush.core.utils.PathUtil;
import com.eazy.brush.dao.entity.TaskSub;
import com.eazy.brush.service.TaskSubService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

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
    private FtpTool ftpTool;

    @Autowired
    TaskSubService taskSubService;

    @Autowired
    TaskSubVoService taskSubVoService;

    @RequestMapping("/consume")
    public void get() {
        int size=getParaInt("size",1);
        List<TaskSub> taskSubs = taskSubService.getUnConsumeList(size);
        List<TaskSubApiVo> taskSubList = taskSubVoService.buildVo(taskSubs);
        taskSubService.changeTaskSubState(taskSubVoService.buildVoIds(taskSubs), SubTaskState.RUNNING);//任务已取走，未回调
        renderJson200(wrapField("tasks", taskSubList));
    }

    /**
     * 下载文件,zip文件
     * @param file
     */
    @RequestMapping(value = "/download", method = {RequestMethod.GET,RequestMethod.POST})
    public void downloadApk(@RequestParam(value = "file") String file) {
        try {
            ActionRequest.renderStream(file, response);
            ftpTool.downLoadToOutputStream(file,PathUtil.getPathByCreateDayAndUuid(file),response.getOutputStream());
        } catch (IOException e) {
            log.error("down file error,{}", e);
        }
    }

    @RequestMapping(value = "/upload", method = {RequestMethod.GET, RequestMethod.POST})
    public void uploadApk(@RequestParam(value = "file") MultipartFile file,@RequestParam(value="id")String id,@RequestParam(value = "fromId")String fromId) {
        try {
            String fileName=StringUtils.isNotEmpty(fromId)?fromId:id;
            if(file!=null){//如果文件没有传上来,直接更新完成状态不需要存储file
                ftpTool.uploadToInoutStream(fileName,PathUtil.getPathByCreateDayAndUuid(fileName),file.getInputStream());//只需要更新原始新增的数据文件
            }
            taskSubService.changeTaskSubState(id,SubTaskState.FINISHED,fileName);//新增任务完成需要更新文件名字

            renderJson200();
        } catch (IOException e) {
            log.error("upload apk file error {}", e);
            e.printStackTrace();
            renderJson500();
        }
    }
}
