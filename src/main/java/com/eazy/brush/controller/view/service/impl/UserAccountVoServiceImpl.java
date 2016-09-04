package com.eazy.brush.controller.view.service.impl;

import com.eazy.brush.controller.view.service.UserAccountVoService;
import com.eazy.brush.controller.view.vo.UserAccountVo;
import com.eazy.brush.core.enums.ConfKey;
import com.eazy.brush.dao.entity.UserAccount;
import com.eazy.brush.service.ConfService;
import com.eazy.brush.service.TaskService;
import com.eazy.brush.service.UserAccountService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * author : liufeng
 * create time:2016/9/4 14:24
 */
@Service
public class UserAccountVoServiceImpl implements UserAccountVoService {

    @Autowired
    UserAccountService userAccountService;

    @Autowired
    TaskService taskService;

    @Autowired
    ConfService confService;

    @Override
    public UserAccountVo getByUserId(int id) {
        UserAccountVo userAccountVo = new UserAccountVo();
        UserAccount userAccount = userAccountService.getByUserId(id);
        userAccountVo.setUserId(id);
        userAccountVo.setUserRealName(userAccount.getUserRealName());

        int k = confService.getNumberValueByKey(ConfKey.task_cost_point.name()).intValue();
        userAccountVo.setPointCount(k * userAccount.getPointCount());
        userAccountVo.setTodayPointNeed(k * taskService.calcDayTaskNumByUserId(id, DateTime.now()));
        userAccountVo.setTomorrowPointNeed(k * taskService.calcDayTaskNumByUserId(id, DateTime.now().plusDays(1)));
        return userAccountVo;
    }
}
