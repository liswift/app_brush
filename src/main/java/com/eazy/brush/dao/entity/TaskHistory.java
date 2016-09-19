package com.eazy.brush.dao.entity;

import lombok.Data;

import java.sql.Date;

/**
 * Created by yuekuapp on 16-9-19.
 */
@Data
public class TaskHistory {
    //#{userId},#{taskId},#{appName},#{remarkName},#{incrDay},#{retainDay},#{retainPercent},#{createDate}"
    private int id;
    private int userId;//记录对应的用户id
    private int taskId;//当前记录对应的taskid
    private String appName;//当前记录对应的应用名称
    private String remarkName;//当前应用对应的应用备注名称
    private int incrDay;//当前新增数字
    private int retainDay;//当前留存数字
    private int retainPercent;//当前的留存率,(用于计算当前新任务的留存数据)重要
    private Date createDate;//任务对应的日期
}
