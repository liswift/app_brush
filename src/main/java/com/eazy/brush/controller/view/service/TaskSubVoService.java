package com.eazy.brush.controller.view.service;

import com.eazy.brush.controller.view.vo.TaskSubVo;
import com.eazy.brush.dao.entity.TaskSub;

import java.util.List;

/**
 * 任务元拼装服务
 *
 * @author feng.liu
 * @date 2016/8/31 17:55
 */
public interface TaskSubVoService {

    List<TaskSubVo> buildVo(List<TaskSub> list);

    String buildVoIds(List<TaskSub> taskSubs);
}
