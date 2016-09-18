package com.eazy.brush.controller.view.service;

import com.eazy.brush.controller.view.vo.ActionPageVo;
import com.eazy.brush.dao.entity.ActionPage;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/10 21:51
 */
public interface ActionPageVoService {

    List<ActionPageVo> getByTaskId(int id);

    List<ActionPageVo> getByTaskIdNum(int id);

    /**
     * 获取actionPageVo 如果pageId没有的话,会自动填充一个默认的ActionPage
     *
     * @param taskId
     * @param pageId
     * @return
     */
    ActionPageVo getByTaskIdOrPageId(int taskId,int pageId);

    void update(ActionPage actionPage);

    void deleteById(int id);
}
