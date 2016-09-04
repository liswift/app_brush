package com.eazy.brush.service.impl;

import com.eazy.brush.dao.entity.UserAccount;
import com.eazy.brush.dao.mapper.UserAccountMapper;
import com.eazy.brush.service.UserAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * author : liufeng
 * create time:2016/8/29 23:26
 */
@Service
public class UserAccountServiceImpl implements UserAccountService {

    @Autowired
    UserAccountMapper userAccountMapper;

    @Override
    public UserAccount getByUserId(int userId) {
        return userAccountMapper.getByUserId(userId);
    }
}
