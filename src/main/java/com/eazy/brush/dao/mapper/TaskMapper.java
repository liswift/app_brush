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

    String FEILDS = "id,app_name,app_version,apk_url,remark_name,incr_day,incr_up_down,run_time,run_up_down,run_start_time," +
            "run_end_time,run_speed,retain_day,retain_percent,callback_time";

    @Select("select " + FEILDS + " from task where id=#{id}")
    Task getById(@Param("id") int id);

    @Select("select " + FEILDS + " from task where callback_time=0 order by id asc limit 1")
    Task getByState(@Param("callbackTime") long callbackTime);

    @Update("update task set callback_time=#{callbackTime} where id=#{id}")
    void changeState(@Param("id") int id, @Param("callbackTime") long callbackTime);
}
