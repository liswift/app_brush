package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.provider.TaskSubProvider;
import com.eazy.brush.dao.entity.TaskSub;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 元任务Mapper
 * author : liufeng
 * create time:2016/8/28 16:07
 */
public interface TaskSubMapper {

    String INSERT_FEILDS = "task_id,per_time,action_id,device_info_id,run_time,create_day,tel_android_id," +
            "subscriber_id,operator,operator_name,line1_number,simSerial_number,network_type," +
            "phone_type,`host`,`port`,mac,type";

    String INSERT_VALUES = "#{taskId},#{perTime},#{actionId},#{deviceInfoId},#{runTime},#{create_day},#{telAndroidId}," +
            "#{subscriberId},#{operator},#{operatorName},#{line1Number},#{simSerialNumber},#{networkType}," +
            "#{phoneType},#{host},#{port},#{mac},#{type}";

    String FEILDS = "id," + INSERT_FEILDS + ",callback_time";

    @Select("select " + FEILDS + " from task_sub where per_time=#{perTime} " +
            " and callback_time=0" +
            " order by id asc limit #{size}")
    List<TaskSub> getList(@Param("perTime") long perTime, @Param("size") int size);

    @Insert("insert into task_sub(" + INSERT_FEILDS + ") values " + INSERT_VALUES)
    void insertTaskSub(TaskSub taskSub);

    @InsertProvider(type = TaskSubProvider.class, method = "insertTaskSubBatch")
    void insertTaskSubBatch(@Param("taskSubs") List<TaskSub> taskSubs);

    @Update("update task_sub set callback_time=#{callbackTime} where id in (#{ids})")
    void changeTaskSubState(@Param("ids") String ids, @Param("callbackTime") long callbackTime);

    @Select("select " + FEILDS + " from task_sub where create_day=#{createDay} " +
            " and callback_time>0" +
            " order by rand() limit #{size}")
    List<TaskSub> getRandList(@Param("createDay") int createDay, @Param("size") int size);

    @Delete("delete from task_sub where create_day=#{createDay} and callback_time>0")
    int deleteUnRetain(@Param("createDay") int createDay);

    @Delete("delete from task_sub where task_id=#{taskId} and create_day=#{createDay} limit #{size}")
    int deleteRand(@Param("taskId") int taskId, @Param("createDay") int createDay, @Param("size") int size);

    @Update("update task_sub set callback_time=#{callbackTime},per_time=#{perTime} where id=#{id}")
    void makeRetain(TaskSub taskSub);
}