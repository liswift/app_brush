package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.TaskSetup;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * Created by yuekuapp on 16-10-5.
 * `id` int(11) NOT NULL AUTO_INCREMENT,
 `task_id` int(11) NOT NULL DEFAULT '0',
 `operator_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人员ID',
 `max_num` int NOT NULL
 */

public interface TaskSetupMapper {

    String INSERT_FEILDS = "task_id,operator_id,max_num";

    String INSERT_VALUES = "#{taskId},#{operatorId},#{maxNum}";

    String FEILDS = "id," + INSERT_FEILDS;


    @Select("select " + FEILDS + " from task_setup")
    List<TaskSetup> getAllList();

    @Insert("insert into task_setup(" + INSERT_FEILDS + ") values (" + INSERT_VALUES + ")")
    void insert(TaskSetup taskSetup);

    @Select("select " + FEILDS + " from task_setup where task_id=#{taskId}")
    TaskSetup getByTaskId(@Param("taskId")int taskId);

    @Update("update task_setup set max_num=#{maxNum} where id=#{id}")
    int update(@Param("maxNum")int maxNum,@Param("id") int id);
}
