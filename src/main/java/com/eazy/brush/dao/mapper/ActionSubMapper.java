package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.ActionSub;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 元动作Mapper
 *
 * @author feng.liu
 * @date 2016/8/29 19:39
 */
public interface ActionSubMapper {

    String FEILDS = "id,action,run_time,name";

    @Select("select " + FEILDS + " from action_sub where id in (${actionIds})")
    List<ActionSub> getList(@Param("actionIds") String actionIds);
}
