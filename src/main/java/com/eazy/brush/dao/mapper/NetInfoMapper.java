package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.NetInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 网络信息Mapper
 *
 * @author feng.liu
 * @date 2016/8/29 19:37
 */
public interface NetInfoMapper {

    String FEILDS = "id,mac,tel_android_id,subscriber_id,operator,operator_name,line1_number,sim_serial_number,network_type,phone_type,host,port    ";

    @Select("select " + FEILDS + " from net_info limit #{offset},#{size}")
    List<NetInfo> getList(@Param("offset") int offset, @Param("size") int size);
}
