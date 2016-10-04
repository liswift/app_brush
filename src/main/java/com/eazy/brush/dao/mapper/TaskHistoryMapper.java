package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.TaskHistory;
import com.eazy.brush.dao.provider.TaskHistoryProvider;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * Created by yuekuapp on 16-9-19.
 */
public interface TaskHistoryMapper {


    String INSERT_FEILDS = "user_id,task_id,app_name,remark_name,incr_day,incr_fail,incr_unfinish,retain_day,retain_fail,retain_unfinish,retain_percent,retain_stayday,create_day";

    String INSERT_VALUES = "#{userId},#{taskId},#{appName},#{remarkName},#{incrDay},#{incrFail},#{incrUnfinish},#{retainDay},#{retainFail},#{retainUnfinish},#{retainPercent},#{retainStayday},#{createDay}";

    String FEILDS = "id," + INSERT_FEILDS;


    @Select("select " + FEILDS + " from task_history where user_id=#{userId} order by id asc")
    List<TaskHistory> getListByUserId(@Param("userId") int userId);


    @Select("select " + FEILDS + " from task_history where retain_percent> #{retainPercent} and retain_stayday>0")
    List<TaskHistory> getListByMinRetainPercent(@Param("retainPercent")int retainPercent);

    @Insert("insert into task_history(" + INSERT_FEILDS + ") values (" + INSERT_VALUES + ")")
    void insert(TaskHistory task);

    @InsertProvider(type = TaskHistoryProvider.class, method = "insertTaskHistoryBatch")
    void insertBatch(@Param("histories") List<TaskHistory> histories);


    @Update("update task_history set retain_percent=#{retainPercent},retain_stayday=#{retainStayday} where id=#{id}")
    void changeRetain(@Param("retainPercent")int retainPercent, @Param("retainStayday")int retainStayday, @Param("id")int id);
}
