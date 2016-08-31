package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.CardInfo;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * author : liufeng
 * create time:2016/8/31 23:09
 */
public interface CardInfoMapper {

    String FIELDS = "id,tel_android_id,subscriber_id,operator,operator_name,line1_number,sim_serial_number,network_type,phone_type";

    @Select("select " + FIELDS + " from card_info where id=#{id}")
    CardInfo getById(int id);

    @Select("select " + FIELDS + " from card_info limit #{offset},#{size}")
    List<CardInfo> getList(int offset, int size);
}
