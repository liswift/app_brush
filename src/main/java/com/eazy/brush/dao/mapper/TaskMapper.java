package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.Task;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @author feng.liu
 * @date 2016/8/31 18:06
 */
public interface TaskMapper {

    String FEILDS = "id,user_id,app_name,package_name,version_code,app_version,apk_url,remark_name,incr_day,day_limit," +
            "incr_up_down,run_time,run_up_down,run_start_time," +
            "run_end_time,run_speed,retain_day,retain_percent,state,create_time";

    @Select("select " + FEILDS + " from task where id=#{id}")
    Task getById(@Param("id") int id);

    @Select("select " + FEILDS + " from task where state=#{state} order by id asc limit 1")
    Task getByState(@Param("state") int state);

    @Select("select " + FEILDS + " from task where user_id=#{userId} order by id asc limit #{offset},#{size}")
    List<Task> getList(@Param("userId") int userId, @Param("offset") int offset, @Param("size") int size);

    @Update("update task set state=#{state} where id=#{id}")
    void changeState(@Param("id") int id, @Param("state") int state);

    @Update("update task set state=#{state}")
    void changeAllState(@Param("state") int state);

    @Select("select " + FEILDS + " from task where user_id=#{userId}")
    List<Task> getByUserId(@Param("userId") int userId);

    @Select("select " + FEILDS + " from task where state=#{state} limit #{offset},#{size}")
    List<Task> getListByState(@Param("state") int state, @Param("offset") int offset, @Param("size") int size);
}
