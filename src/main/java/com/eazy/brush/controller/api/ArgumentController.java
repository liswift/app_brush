package com.eazy.brush.controller.api;

import com.eazy.brush.controller.api.vo.DynamicArgument;
import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.service.PhoneNumberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by yuekuapp on 16-10-18.
 * 网络请求接口形式>netapi|type_argument
 * argument>key=value&key=value
 */
@Controller
@RequestMapping("/api/argument")
@Slf4j
public class ArgumentController extends BaseController {

    @Autowired
    PhoneNumberService phoneNumberService;

    /**
     * 静态参数:
     * 客户端回调网络请求获取数据: netapi|getPhonenumberCode_{arg1}&{arg2} 动态参数,传递到客户端变为固定参数,网络请求的时候必须为固定参数
     * 直接网络请求获取数据:      net|getMobilenum_key=value&key=value  内部参数只能是固定参数,过来就会触发网络请求
     *
     * 动态参数:
     * netapi|getPhonenumberCode_{key1}&{key2}
     */
    @RequestMapping("/get")
    public void get() {
        String argument = getPara("argument");
        DynamicArgument dynamicArgument = DynamicArgument.trans2Dynamic(argument);
        String code = "";
        if (dynamicArgument.getType().equals("getPhonenumberCode")) {//获取验证码
            code = phoneNumberService.getMobileCodeAndRelease(dynamicArgument.getValue("pid"), dynamicArgument.getValue("mobile"));
        }
        renderJson200(code);
    }
}
