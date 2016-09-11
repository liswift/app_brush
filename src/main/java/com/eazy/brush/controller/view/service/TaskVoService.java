package com.eazy.brush.controller.view.service;

import com.eazy.brush.controller.view.vo.TaskVo;

import java.util.List;

/**
 * 任务拼装服务
 *
 * @author feng.liu
 * @date 2016/8/31 17:55
 */
public interface TaskVoService {

    List<TaskVo> getList(int userId,int offset,int size);

    List<TaskVo> getList(int offset,int size);
}
