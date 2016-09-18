package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.ActionItem;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 元动作Mapper
 *
 * @author feng.liu
 * @date 2016/8/29 19:39
 */
public interface ActionItemMapper {

    String INSERT_FEILDS = "action_page_id,name,view_name,view_id,view_content,action,action_params,stay_time,up_down";
    String FEILDS = "id," + INSERT_FEILDS;
    String INSERT_VALUES = "#{actionPageId},#{name},#{viewName},#{viewId},#{viewContent},#{action},#{actionParams},#{stayTime},#{upDown}";

    @Select("select " + FEILDS + " from action_item where id in (${actionIds})")
    List<ActionItem> getByIds(@Param("actionIds") String actionItemId);

    @Select("select " + FEILDS + " from action_item where id =${id}")
    ActionItem getById(@Param("id") int actionItemId);

    @Select("select " + FEILDS + " from action_item where action_page_id in (${actionPageId})")
    List<ActionItem> getByPageId(@Param("actionPageId") int actionPageId);

    @Insert("insert into action_item(" + INSERT_FEILDS + ") values(" + INSERT_VALUES + ")")
    @Options(useGeneratedKeys=true,keyProperty="id")
    void insert(ActionItem actionItem);

    @Update("update action_item set name=#{name},view_name=#{viewName},view_id=#{viewId},view_content=#{viewContent}," +
            "action=#{action},action_params=#{actionParams},stay_time=#{stayTime},up_down=#{upDown} where id=#{id}")
    void update(ActionItem actionItem);

    @Delete("delete from action_item where id=#{id}")
    void delete(@Param("id") int id);
}
