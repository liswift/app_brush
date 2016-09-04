package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.UserAccount;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * 用户账户信息Mapper
 * author : liufeng
 * create time:2016/8/28 16:07
 */
public interface UserAccountMapper {

    String FEILDS = "user_id,user_realname,point_count";

    @Select("select " + FEILDS + " from user_account where user_id=#{userId}")
    UserAccount getByUserId(@Param("userId") int userId);
}