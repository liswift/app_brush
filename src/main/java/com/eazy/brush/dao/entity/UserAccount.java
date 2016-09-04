package com.eazy.brush.dao.entity;

import lombok.Data;

/**
 * author : liufeng
 * create time:2016/9/4 10:31
 */
@Data
public class UserAccount {
    private int id;
    private int userId;
    private int pointCount;
    private String userRealName;
}
