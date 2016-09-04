package com.eazy.brush.controller.view.service;

import com.eazy.brush.controller.view.vo.UserAccountVo;

/**
 * 用户账户Vo服务
 *
 * @author feng.liu
 * @date 2016/8/31 17:55
 */
public interface UserAccountVoService {

    UserAccountVo getByUserId(int id);
}
