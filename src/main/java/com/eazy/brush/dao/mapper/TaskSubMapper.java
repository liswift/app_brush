package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.provider.TaskSubProvider;
import com.eazy.brush.dao.entity.TaskSub;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 元任务Mapper
 * author : liufeng
 * create time:2016/8/28 16:07
 */
public interface TaskSubMapper {

    String INSERT_FEILDS = "task_id,per_time,action_id,device_info_id,net_info_id,run_time";
    String INSERT_VALUES = "#{taskId},#{perTime},#{actionId},#{deviceInfoId},#{netInfoId},#{runTime}";
    String FEILDS = "id," + INSERT_FEILDS + ",callback_time";

    @Select("select " + FEILDS + " from task_sub where per_time=#{perTime} limit #{size} order by id asc")
    List<TaskSub> getTaskSub(@Param("perTime") int perTime, @Param("size") int size);

    @Insert("insert into task_sub(" + INSERT_FEILDS + ") values " + INSERT_VALUES)
    void insertTaskSub(TaskSub taskSub);

    @InsertProvider(type = TaskSubProvider.class, method = "insertTaskSubBatch")
    void insertTaskSubBatch(@Param("taskSubs") List<TaskSub> taskSubs);
}