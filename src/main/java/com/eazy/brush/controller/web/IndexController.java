package com.eazy.brush.controller.web;

import com.eazy.brush.controller.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by yuekuapp on 16-10-17.
 */
@Controller
public class IndexController extends BaseController {

    @RequestMapping(value ="/")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("index");
    }
}
