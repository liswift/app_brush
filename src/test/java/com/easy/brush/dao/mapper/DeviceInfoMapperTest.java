package com.easy.brush.dao.mapper;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.eazy.brush.dao.entity.DeviceInfo;
import com.eazy.brush.dao.mapper.DeviceInfoMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.File;
import java.io.IOException;

/**
 * author : liufeng
 * create time:2016/9/3 14:48
 */
@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class DeviceInfoMapperTest {

    @Autowired
    DeviceInfoMapper deviceInfoMapper;

    @Test
    public void testInsert() throws IOException {
        String json = FileUtils.readFileToString(
                new File("F:\\workplace\\app_brush\\json\\device_info.json"));
        JSONArray jsonArray = JSONObject.parseArray(json);
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            DeviceInfo deviceInfo = new DeviceInfo();
            deviceInfo.setScreenSize(jsonObject.getDouble("screenSize"));
            deviceInfo.setBrand(jsonObject.getString("brandAbbr"));
            deviceInfo.setBoard(jsonObject.getString("modelName"));
            deviceInfo.setHeight(jsonObject.getInteger("dpiHeight"));
            deviceInfo.setWidth(jsonObject.getInteger("dpiWidth"));
            deviceInfo.setCoverage(jsonObject.getDouble("coverageRate"));
            deviceInfo.setVersionRelease(jsonObject.getString("4.2.2"));
            deviceInfo.setApi(jsonObject.getInteger("sdkVer"));

            deviceInfo.setVersionRelease(jsonObject.getString("releaseVer"));
            deviceInfo.setSerial("");
            deviceInfo.setSecureId("");
            deviceInfoMapper.insert(deviceInfo);
        }
    }

}
