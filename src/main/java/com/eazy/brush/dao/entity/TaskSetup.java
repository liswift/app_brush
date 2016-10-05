package com.eazy.brush.dao.entity;

import lombok.Data;

/**
 * Created by yuekuapp on 16-10-5.
 */
@Data
public class TaskSetup {
    private int id;
    private int taskId;
    private int operatorId;
    private int maxNum;
}
