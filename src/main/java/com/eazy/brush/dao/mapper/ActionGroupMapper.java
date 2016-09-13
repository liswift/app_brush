package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.ActionGroup;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 组动作Mapper
 * author : liufeng
 * create time:2016/9/10 17:49
 */
public interface ActionGroupMapper {

    String INSERT_FEILDS = "name,item_id,enable";
    String FEILDS = "id," + INSERT_FEILDS;

    @Select("select " + FEILDS + " from action_group where id in (#{actionGroupId})")
    List<ActionGroup> getByIds(@Param("actionGroupId") String actionGroupId);

    @Insert("insert into action_group(" + INSERT_FEILDS + ") values(#{name},#{itemId},#{enable})")
    void insert(ActionGroup actionGroup);

    @Update("update action_group set name=#{name},item_id=#{itemId},enable=#{enable} where id=#{id}")
    void update(ActionGroup actionGroup);

    @Delete("delete from action_group where id=#{id}")
    void delete(@Param("id") int id);
}

