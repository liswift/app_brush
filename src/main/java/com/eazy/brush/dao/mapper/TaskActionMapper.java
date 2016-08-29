package com.eazy.brush.dao.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 任务，动作，映射关系Mapper
 * author : liufeng
 * create time:2016/8/29 23:17
 */
public interface TaskActionMapper {

    @Select("select action_id from task_action where task_id=#{taskId}")
    List<Integer> getActionsByTaskId(@Param("taskId") int taskId);
}
