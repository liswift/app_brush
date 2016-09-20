package com.eazy.brush.dao.entity;

import lombok.Data;

/**
 * Created by yuekuapp on 16-9-19.
 */
@Data
public class TaskHistory {
    //"#{userId},#{taskId},#{appName},#{remarkName},#{incrDay},#{incrFail},#{incrUnfinish},#{retainDay},#{retainFail},#{retainUnfinish},#{retainPercent},#{createDate}"

    private int id;
    private int userId;//记录对应的用户id
    private int taskId;//当前记录对应的taskid
    private String appName;//当前记录对应的应用名称
    private String remarkName;//当前应用对应的应用备注名称
    private int incrDay;//当前新增数字
    private int incrFail;//当天失败的量,一般来说是客户端没有成功回调
    private int incrUnfinish;//当天未来及做的量,一般来说是阻塞量
    private int retainDay;//当前留存数字多少,注意不要跟task里面的retainDay混淆,task里面表示留存天数
    private int retainFail;//当天的失败量,一般来说是客户端没有回调成功
    private int retainUnfinish;//当前的阻塞量
    private int retainPercent;//当前的留存率,(用于计算当前新任务的留存数据)重要
    private int retainStayday;//当前剩余的留存天数
    private int createDate;//任务对应的日期
}
