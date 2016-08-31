package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.Task;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @author feng.liu
 * @date 2016/8/31 18:06
 */
public interface TaskMapper {

    String FEILDS = "id,app_name,app_version,remark_name,incr_day,incr_up_down,run_time,run_up_down,run_start_time,run_end_time,run_speed,retain";

    @Select("select " + FEILDS + " from task where id=#{id}")
    Task getById(@Param("id") int id);
}
