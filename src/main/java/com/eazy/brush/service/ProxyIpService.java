package com.eazy.brush.service;

import com.eazy.brush.model.ProxyModel;

/**
 * author : liufeng
 * create time:2016/9/11 17:23
 */
public interface ProxyIpService {

    String url = "http://dev.kuaidaili.com/api/getproxy/?orderid=967359281758741&num=999&area=%E5%A4%A7%E9%99%86&b_pcchrome=1&b_pcie=1&b_pcff=1&b_android=1&b_iphone=1&b_ipad=1&protocol=1&method=1&an_an=1&an_ha=1&sp1=1&sep=2";

    /**
     * 持久化
     *
     * @param proxys
     */
    void store(String proxys);

    /**
     * 清掉已过期
     */
    void del();

    /**
     * 随机获取一个
     *
     * @return
     */
    ProxyModel getRandom();

}
