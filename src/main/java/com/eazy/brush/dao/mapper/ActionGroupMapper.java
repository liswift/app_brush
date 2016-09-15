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

    String INSERT_FEILDS = "action_page_id,name,action_item_ids,enable";
    String FEILDS = "id," + INSERT_FEILDS;

    @Select("select " + FEILDS + " from action_group where id in (#{actionGroupId})")
    List<ActionGroup> getByIds(@Param("actionGroupId") String actionGroupId);

    @Select("select " + FEILDS + " from action_group where action_page_id in (#{actionPageId})")
    List<ActionGroup> getByActionPageId(@Param("actionPageId") int actionPageId);

    @Insert("insert into action_group(" + INSERT_FEILDS + ") values(#{actionPageId},#{name},#{actionItemIds},#{enable})")
    void insert(ActionGroup actionGroup);

    @Update("update action_group set name=#{name},action_item_ids=#{actionItemIds},enable=#{enable} where id=#{id}")
    void update(ActionGroup actionGroup);

    @Delete("delete from action_group where id=#{id}")
    void delete(@Param("id") int id);
}

