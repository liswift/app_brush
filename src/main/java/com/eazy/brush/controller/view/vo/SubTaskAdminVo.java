package com.eazy.brush.controller.view.vo;

import lombok.Data;

/**
 * Created by yuekuapp on 16-10-5.
 */
@Data
public class SubTaskAdminVo {
    private int taskId;
    private String userName;
    private String taskName;
    private int todayIncr;
    private int todayRetain;
    private int todaySetup;
}
