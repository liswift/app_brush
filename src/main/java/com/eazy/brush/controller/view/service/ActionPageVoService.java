package com.eazy.brush.controller.view.service;

import com.eazy.brush.controller.view.vo.ActionPageVo;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/10 21:51
 */
public interface ActionPageVoService {

    List<ActionPageVo> getByTaskId(int id);

    List<ActionPageVo> getByTaskIdNum(int id);
}
