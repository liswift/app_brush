package com.eazy.brush.core.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.eazy.brush.core.utils.UserUtil;


/**
 * 用了shiro注解  @RequiresAuthentication 可以判断是否是未登录的
 * 所以此处基本上也没有什么用了。
 * <p>
 * 如果付出的没有回报你还会坚持下去嘛，为什么？
 */
public class LoginFilter implements Filter {


    static Map<String, String> filterURL = new HashMap<String, String>();

    static {
        filterURL.put("/sys/login", "/sys/login");
        filterURL.put("/sys/logout", "/sys/logout");
        filterURL.put("/sys/forgetpwd", "/sys/forgetpwd");
        filterURL.put("/sys/index", "/sys/index");
        filterURL.put("/sys/error", "/sys/error");
        filterURL.put("/sys/forget", "/sys/forget");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String url = req.getRequestURI();

        if (!url.contains("JSESSIONID")
                && !url.contains("/favicon.ico")
                && !url.contains("/code/code")
                && !url.contains(".css")
                && !url.contains(".js")
                && !url.contains("/resources/css/")
                && !url.contains("/resources/lib/")
                && !url.contains("/resources/js/")
                && !url.contains("/resources/images/")) {

            if (!url.equals("/") && !url.contains("api")) {
                if (filterURL.get(url) == null) {
                    if (UserUtil.getCurrentUser() == null) {
                        res.sendRedirect("/index.jsp");
                    }
                }
            }
        }
        chain.doFilter(req, res);
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
    }


    @Override
    public void destroy() {

    }

}
