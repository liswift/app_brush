package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.Task;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author feng.liu
 * @date 2016/8/31 18:06
 */
public interface TaskMapper {

    String INSERT_FEILDS = "user_id,app_name,package_name,version_code,app_version,apk_url,remark_name,incr_day,day_limit," +
            "incr_up_down,run_time,run_up_down,run_start_time," +
            "run_end_time,run_speed,retain_day,retain_percent,action_page_id,state,create_time";

    String INSERT_VALUES = "#{userId},#{appName},#{packageName},#{versionCode},#{appVersion},#{apkUrl}," +
            "#{remarkName},#{incrDay},#{dayLimit},#{incrUpDown},#{runTime},#{runUpDown},#{runStartTime}," +
            "#{runEndTime},#{runSpeed},#{retainDay},#{retainPercent},#{actionPageId},#{state},#{createTime}";

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

    @Update("update task set state=#{state} where id=#{id}")
    void changeState(@Param("id") int id, @Param("state") int state);

    @Update("update task set state=#{state}")
    void changeAllState(@Param("state") int state);

    @Select("select " + FEILDS + " from task where user_id=#{userId}")
    List<Task> getByUserId(@Param("userId") int userId);

    @Select("select " + FEILDS + " from task where state=#{state} limit #{offset},#{size}")
    List<Task> getListByState(@Param("state") int state, @Param("offset") int offset, @Param("size") int size);

    @Select("select " + FEILDS + " from task where state>#{state} limit #{offset},#{size}")
    List<Task> getEnableList(@Param("state") int state, @Param("offset") int offset, @Param("size") int size);
}
