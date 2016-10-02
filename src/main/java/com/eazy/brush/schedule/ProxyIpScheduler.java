package com.eazy.brush.schedule;

import com.eazy.brush.core.utils.HttpUtil;
import com.eazy.brush.service.ProxyIpService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * author : liufeng
 * create time:2016/9/11 17:42
 */
@Component
@Slf4j
public class ProxyIpScheduler {

    @Autowired
    ProxyIpService proxyIpService;

    /**
     * 生成每日task_sub
     * 秒 分 时 日 月
     */
    @Scheduled(cron = "0 0/5 *  * * ? ")
    public void store() {
        log.info("### start store ProxyIp ###");
        proxyIpService.store(HttpUtil.get(ProxyIpService.url));
        log.info("### end store ProxyIp ###");
    }
}
