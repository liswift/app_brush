package com.eazy.brush.controller.view.service.impl;

import com.eazy.brush.controller.view.service.ActionGroupVoService;
import com.eazy.brush.controller.view.service.ActionPageVoService;
import com.eazy.brush.controller.view.vo.ActionPageVo;
import com.eazy.brush.service.ActionItemService;
import com.eazy.brush.service.ActionPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/10 21:52
 */
@Service
public class ActionPageVoServiceImpl implements ActionPageVoService {

    @Autowired
    ActionPageService actionPageService;

    @Autowired
    ActionGroupVoService actionGroupVoService;

    @Autowired
    ActionItemService actionItemService;


    @Override
    public List<ActionPageVo> getByTaskId(int id) {

        return new ArrayList<>();
    }
}
