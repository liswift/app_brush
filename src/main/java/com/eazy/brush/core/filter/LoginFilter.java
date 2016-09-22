package com.eazy.brush.core.filter;

import com.eazy.brush.core.utils.UserUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


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

            if (!url.equals("/") && !url.contains("api") && !url.contains("apk")) {
                if (filterURL.get(url) == null) {
                    if (UserUtil.getCurrentUser() == null) {
                        res.sendRedirect("/index.jsp");
                        return;
                    }
                }
            }
        }
        if(!url.contains("api")&&UserUtil.getCurrentUser()==null){
            res.sendRedirect("/sys/logout");
            return ;
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
