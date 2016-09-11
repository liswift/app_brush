package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.ActionItem;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 元动作Mapper
 *
 * @author feng.liu
 * @date 2016/8/29 19:39
 */
public interface ActionItemMapper {

    String FEILDS = "id,name,view_name,view_id,view_content,action,acition_param,stay_time,up_down";

    @Select("select " + FEILDS + " from action_item where id in (${actionItemId})")
    List<ActionItem> getByIds(@Param("actionItemId") String actionItemId);
}
