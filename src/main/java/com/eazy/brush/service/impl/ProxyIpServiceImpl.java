package com.eazy.brush.service.impl;

import com.eazy.brush.cache.CommonRedisCache;
import com.eazy.brush.core.utils.HttpUtil;
import com.eazy.brush.model.ProxyModel;
import com.eazy.brush.service.ProxyIpService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.Random;

/**
 * author : liufeng
 * create time:2016/9/11 17:30
 */
@Slf4j
@Service
public class ProxyIpServiceImpl implements ProxyIpService {

    String cacheKey = "app_brush.list.proxyip";

    @Autowired
    CommonRedisCache commonRedisCache;

    @PostConstruct
    public void init() {
        store(HttpUtil.get(url));
    }

    @Override
    public void store(String proxys) {
        boolean first=true;
        String[] proxyIps = StringUtils.splitByWholeSeparator(proxys, "\n");
        for (String proxyIp : proxyIps) {
            if(HttpUtil.checkAviable(proxyIp)){
                if(first){
                    first=false;
                    del();
                }
                commonRedisCache.lPush(cacheKey, proxyIp);
            }
        }
    }

    @Override
    public void del() {
        commonRedisCache.delete(cacheKey);
    }

    @Override
    public ProxyModel getRandom() {
        Long len = commonRedisCache.lLen(cacheKey);
        String proxyIpPort = commonRedisCache.lIndex(cacheKey, new Random().nextInt(len.intValue()));
        String[] proxyIpPortArr = StringUtils.splitByWholeSeparator(proxyIpPort, ":");
        ProxyModel proxyModel = new ProxyModel();
        proxyModel.setIp(proxyIpPortArr[0]);
        try {
            proxyModel.setPort(Integer.parseInt(proxyIpPortArr[1]));
            return proxyModel;
        } catch (Exception e) {
            log.error("parse port error,proxyIpPort is {} error {}", proxyIpPort, e);
        }
        return proxyModel;
    }
}
