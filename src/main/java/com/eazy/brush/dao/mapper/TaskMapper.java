package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.Task;
import com.eazy.brush.dao.provider.TaskProvider;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author feng.liu
 * @date 2016/8/31 18:06
 */
public interface TaskMapper {

    String INSERT_FEILDS = "user_id,audit_user_id,app_name,package_name,version_code,app_version,apk_url,remark_name,incr_day,day_limit," +
            "incr_up_down,run_time,run_up_down,run_start_time," +
            "run_end_time,run_speed,retain_day,retain_percent,state,create_time,msg";

    String INSERT_VALUES = "#{userId},#{auditUserId},#{appName},#{packageName},#{versionCode},#{appVersion},#{apkUrl}," +
            "#{remarkName},#{incrDay},#{dayLimit},#{incrUpDown},#{runTime},#{runUpDown},#{runStartTime}," +
            "#{runEndTime},#{runSpeed},#{retainDay},#{retainPercent},#{state},#{createTime},#{msg}";

    String FEILDS = "id," + INSERT_FEILDS;

    @Select("select " + FEILDS + " from task where id=#{id}")
    Task getById(@Param("id") int id);

    @Select("select " + FEILDS + " from task where state=#{state} order by id asc limit 1")
    Task getByState(@Param("state") int state);

    @Delete("delete from task where id=#{id}")
    void delete(@Param("id") int id);

    @Select("select " + FEILDS + " from task order by id asc limit #{offset},#{size}")
    List<Task> getList(@Param("offset") int offset, @Param("size") int size);

    @Select("select " + FEILDS + " from task where user_id=#{userId} order by id asc limit #{offset},#{size}")
    List<Task> getListByUserId(@Param("userId") int userId, @Param("offset") int offset, @Param("size") int size);

    @Insert("insert into task(" + INSERT_FEILDS + ") values (" + INSERT_VALUES + ")")
    void insert(Task task);

    @Update("update task set state=#{state},msg=#{msg} where id=#{id} and audit_user_id=#{auditUserId}")
    void changeState(@Param("id") int id,@Param("auditUserId")int auditUserId ,@Param("state") int state,@Param("msg")String msg);

    @Update("update task set state=#{state},msg=#{msg} where id=#{id}")
    int changeState(@Param("id") int id, @Param("state")int state,@Param("msg")String msg);

    @Update("update task set state=#{state}")
    void changeAllState(@Param("state") int state);

    /**
     * 根据当前用户的Id获取,当前普通人员所有任务
     * @param userId
     * @return
     */
    @Select("select " + FEILDS + " from task where user_id=#{userId}")
    List<Task> getByUserId(@Param("userId") int userId);

    /**
     * 根据auditUserId获取当前审核员的所有Task
     * @param auditUserId
     * @return
     */
    @Select("select "+ FEILDS + " from task where audit_user_id=#{auditUserId}")
    List<Task> getByAuditUserId(@Param("auditUserId")int auditUserId);

    /**
     * 随机获取一条数据Task,进行审核该条task
     * @return
     */
    @Select("select "+ FEILDS+" from task where audit_user_id=0 limit 1")
    Task getSingleTask();

    /**
     * 根据任务状态获取当前用户的task
     * @param auditUserId
     * @param state
     * @return
     */
    @Select("select "+FEILDS+" from task where audit_user_id=#{auditUserId} and state =#{state} limit 1")
    Task getAuditSingleTask(@Param("auditUserId")int auditUserId,@Param("state")int state);
    /**
     * 分配当前任务于当前用户名下
     * @param id
     */
    @Update("update task set audit_user_id=#{auditUserId} where id=#{id}")
    void assignAuditUserId(@Param("auditUserId")int auditUserId,@Param("id")int id);

    /**
     *  审核员离职操作
      * @param currentUserId,需要被赋予任务的审核员
     * @param outUserid 离职的审核员
     */
    @Update("update task set audit_user_id=#{auditUserId} where audit_user_id=#{id}")
    void changeAuditUserId(@Param("auditUserId") int currentUserId,@Param("id")int outUserid);

    @Select("select " + FEILDS + " from task where state=#{state} limit #{offset},#{size}")
    List<Task> getListByState(@Param("state") int state, @Param("offset") int offset, @Param("size") int size);

    @Select("select " + FEILDS + " from task where state>#{state} limit #{offset},#{size}")
    List<Task> getEnableList(@Param("state") int state, @Param("offset") int offset, @Param("size") int size);

    @UpdateProvider(type = TaskProvider.class, method = "update")
    void update(Task task);
}
