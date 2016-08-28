package com.eazy.brush.model;

import lombok.Data;

import java.io.Serializable;

/**
 * 定时任务pojo
 *
 * @author ty
 * @date 2015年1月13日
 */

@Data
public class ScheduleJob implements Serializable {

    private static final long serialVersionUID = 1L;
    private String name;    //任务名
    private String group;    //任务组
    private String cronExpression;    //cron表达式
    private String status;    //状态
    private String description;    //描述
    private String className;    //要执行的任务类路径名

    public ScheduleJob() {
        super();
    }

    public ScheduleJob(String name, String group, String cronExpression,
                       String status, String description, String className) {
        super();
        this.name = name;
        this.group = group;
        this.cronExpression = cronExpression;
        this.status = status;
        this.description = description;
        this.className = className;
    }
}
