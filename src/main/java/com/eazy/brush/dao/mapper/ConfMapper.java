package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.Conf;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/9/4 10:32
 */
public interface ConfMapper {

    String FEILDS = "`key`,value,'desc'";

    @Insert("insert into conf(" + FEILDS + ") values(#{key},#{value},#{desc})")
    void insert(Conf conf);

    @Select("select id," + FEILDS + " from conf limit #{offset},#{size}")
    List<Conf> getList(@Param("offset") int offset, @Param("size") int size);

    @Select("select id," + FEILDS + " from conf where `key`=#{key} limit 1")
    Conf getByKey(@Param("key") String key);

    @Update("update conf set `key`=#{key},value=#{value},`desc`=#{desc} where id=#{id}")
    void udpate(Conf conf);
}
