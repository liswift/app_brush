package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.Action;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 动作组合Mapper
 *
 * @author feng.liu
 * @date 2016/8/29 19:39
 */
public interface ActionMapper {

    String FIELDS = "id,actions,name";

    @Select("select " + FIELDS + " from action where id=#{taskId}")
    Action getById(@Param("taskId") int taskId);

    @Select("select " + FIELDS + "from action where id in (${ids})")
    List<Action> getListByIds(@Param("ids") String ids);
}