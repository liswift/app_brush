package com.eazy.brush.controller.view.vo;

import lombok.Data;

import java.util.List;

/**
 * Created by yuekuapp on 16-9-21.
 */
@Data
public class ActionPageApiVo {
    private String pageName;
    private List<ActionGroupApiVo> groupActions;
}
