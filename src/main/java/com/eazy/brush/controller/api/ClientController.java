package com.eazy.brush.controller.api;

import com.eazy.brush.controller.common.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * author : liufeng
 * create time:2016/9/11 16:26
 */
@Controller
@RequestMapping("/api/ip")
@Slf4j
public class ClientController extends BaseController {

    @RequestMapping("/get")
    public void get() {
        String ip = null;
        if (request.getHeader("x-forwarded-for") == null) {
            ip = request.getRemoteAddr();
        } else {
            ip = request.getHeader("x-forwarded-for");
        }
        renderJson(wrapField("ip", ip));
    }
}
