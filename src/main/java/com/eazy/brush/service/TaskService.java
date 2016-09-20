package com.eazy.brush.service;

import com.eazy.brush.core.android.apkinfo.bean.ApkInfo;
import com.eazy.brush.dao.entity.Task;
import org.joda.time.DateTime;

import java.util.List;

/**
 * @author feng.liu
 * @date 2016/8/31 18:02
 */
public interface TaskService {

    Task getById(int id);

    List<Task> getByState(int state);

    List<Task> getList(int offset, int size);

    List<Task> getList(int userId, int offset, int size);

    void add(Task task);

    void update(Task task);

    int changeState(int id, int auditUserId, int state, String msg);

    int changeState(int id, int state, String msg);

    void changeAllState(int state);

    /**
     * 获取当前审核人员的所有Task
     *
     * @param auditUserId
     * @return
     */
    List<Task> getByAuditUserId(int auditUserId);

    /**
     * 随机获取一个未被审核的Task
     *
     * @return
     */
    Task getRandomTask(int auditUserId);

    /**
     * 根据状态获取当前用户的task
     *
     * @param auditUserId
     * @param state
     * @return
     */
    Task getAuditSingleTask(int auditUserId, int state);

    /**
     * 审核人员离职,调用此方法,切换负责人
     *
     * @param currentUserId
     * @param outUserid
     */
    void changeAuditUserId(int currentUserId, int outUserid);

    /**
     * 放回操作
     *
     * @param auditUserId
     * @param taskId
     */
    void assignAuditUserId(int auditUserId, int taskId);

    /**
     * 计算 给定时间的子任务数
     *
     * @param task
     * @return
     */
    int calcDayTaskNum(Task task, DateTime dateTime);

    /**
     * 计算 给定任务在datetime的留存子任务数
     *
     * @param task
     * @return
     */
    int calcDayRetainNum(Task task, DateTime datetime);

    /**
     * 根据userId计算子任务数
     *
     * @param userId
     * @param dateTime
     * @return
     */
    int calcDayTaskNumByUserId(int userId, DateTime dateTime);

    /**
     * 计算任务留存百分比
     *
     * @param task
     * @return
     */
    double calcRetainPercent(Task task);

    /**
     * 获取指定状态的任务集合
     *
     * @param state
     * @param offset
     * @param size
     * @return
     */
    List<Task> getListByState(int state, int offset, int size);

    /**
     * @param state
     * @param offset
     * @param size
     * @return
     */
    List<Task> getEnableList(int state, int offset, int size);

    /**
     * @param id
     */
    void delete(int id);

    /**
     * 更新应用信息
     *
     * @param id
     * @param apkInfo
     * @param fileName
     */
    void updateApkInfo(int id, ApkInfo apkInfo, String fileName);
}
