package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.TaskHistory;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by yuekuapp on 16-9-19.
 */
public interface TaskHistoryMapper {


    String INSERT_FEILDS = "user_id,task_id,app_name,remark_name,incr_day,retain_day,retain_percent,create_date";

    String INSERT_VALUES = "#{userId},#{taskId},#{appName},#{remarkName},#{incrDay},#{retainDay},#{retainPercent},#{createDate}";

    String FEILDS = "id," + INSERT_FEILDS;


    @Select("select " + FEILDS + " from task_history where user_id=#{userId} order by id asc")
    List<TaskHistory> getListByUserId(@Param("userId") int userId);


    @Select("select " + FEILDS + " from task_history where retain_percent >= #{retainPercent}")
    List<TaskHistory> getListByMinRetainPercent(int retainPercent);

    @Insert("insert into task_history(" + INSERT_FEILDS + ") values (" + INSERT_VALUES + ")")
    void insert(TaskHistory task);

}
