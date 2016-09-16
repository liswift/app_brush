package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.ActionPage;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 页动作 Mapper
 *
 * @author feng.liu
 * @date 2016/8/29 19:39
 */
public interface ActionPageMapper {

    String INSERT_FIELDS = "task_id,page_name,page_desc,enable";
    String FIELDS = "id," + INSERT_FIELDS;

    @Select("select "+FIELDS+" from action_page where task_id=#{taskId}")
    List<ActionPage> getByTaskId(@Param("taskId")int taskId);

    @Update("update action_page set enable=#{enable} where id=#{id}")
    void updateEnable(@Param("id")int id,@Param("enable")int enable);


    @Select("select " + FIELDS + " from action_page where id=#{id}")
    ActionPage getById(@Param("id") int id);

    @Select("select " + FIELDS + " from action_page where id in (#{ids})")
    List<ActionPage> getListByIds(@Param("ids") String ids);

    @Insert("insert into action_page(" + INSERT_FIELDS + ") values(#{taskId},#{pageName},#{pageDesc}," +
            "#{enable})")
    void insert(ActionPage actionPage);


    @Update("update action_page set page_name=#{pageName},page_desc=#{pageDesc},enable=#{enable} where id=#{id}")
    void update(ActionPage actionPage);

    @Delete("delete from action_page where id=#{id}")
    void delete(@Param("id") int id);
}