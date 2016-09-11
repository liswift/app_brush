package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.ActionGroup;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 组动作Mapper
 * author : liufeng
 * create time:2016/9/10 17:49
 */
public interface ActionGroupMapper {

    String FEILDS = "id,name,item_id,enable";

    @Select("select " + FEILDS + " from action_group where id in #{actionGroupId}")
    List<ActionGroup> getByIds(String actionGroupId);
}

