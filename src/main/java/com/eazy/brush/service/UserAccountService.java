package com.eazy.brush.service;

import com.eazy.brush.dao.entity.UserAccount;

/**
 * 用户帐户相关服务
 * author : liufeng
 * create time:2016/8/28 12:57
 */
public interface UserAccountService {

    UserAccount getByUserId(int userId);
}
