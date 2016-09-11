package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.ActionPage;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 页动作 Mapper
 *
 * @author feng.liu
 * @date 2016/8/29 19:39
 */
public interface ActionPageMapper {

    String FIELDS = "id,page_name,page_desc,action_item_id,action_group_id";

    @Select("select " + FIELDS + " from action_page where id=#{id}")
    ActionPage getById(@Param("id") int id);

    @Select("select " + FIELDS + " from action_page where id in (#{ids})")
    List<ActionPage> getListByIds(@Param("ids") String ids);
}