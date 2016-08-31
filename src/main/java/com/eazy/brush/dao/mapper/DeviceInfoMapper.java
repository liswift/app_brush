package com.eazy.brush.dao.mapper;

import com.eazy.brush.dao.entity.DeviceInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 设备信息 Mapper
 *
 * @author feng.liu
 * @date 2016/8/29 19:38
 */
public interface DeviceInfoMapper {

    String FEILDS = "id,version_release,brand,board,width,height";

    @Select("select " + FEILDS + " from device_info limit #{offset},#{size}")
    List<DeviceInfo> getList(@Param("offset") int offset, @Param("size") int size);

    @Select("select" + FEILDS + " from device_info where id=#{id}")
    DeviceInfo getById(@Param("id") int id);
}
