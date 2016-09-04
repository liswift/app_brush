package com.eazy.brush.controller.view.vo;

import lombok.Data;

/**
 * 用户账户VO
 * author : liufeng
 * create time:2016/8/28 10:44
 */
@Data
public class UserAccountVo {
    private int id;
    private int userId;
    private String userRealName;
    private int pointCount;
    private int todayPointNeed;
    private int tomorrowPointNeed;
}
