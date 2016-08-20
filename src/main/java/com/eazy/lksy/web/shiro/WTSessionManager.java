package com.eazy.lksy.web.shiro;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SessionContext;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.Serializable;

/**
 * Created by vincent on 15-9-28.
 */
public class WTSessionManager extends DefaultWebSessionManager {

    private RedisManager redisManager;

    @Override
    protected Serializable getSessionId(ServletRequest request, ServletResponse response) {



        HttpServletRequest servletRequest = (HttpServletRequest) request;
        String equipment_id = servletRequest.getHeader("equitment_id");


        if (StringUtils.isNotBlank(equipment_id)) {

            try {
                Object o = redisManager.get(equipment_id, 1);

                if (o == null) {
                    return null;
                }

                return o.toString();


            } catch (IOException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

        }

        return super.getSessionId(request, response);
    }

    @Override
    protected Session doCreateSession(SessionContext context) {

        Session session = super.doCreateSession(context);


        HttpServletRequest request = WebUtils.getHttpRequest(context);
        String equipment_id = request.getHeader("equitment_id");


        if (StringUtils.isNotBlank(equipment_id)) {

            try {
                redisManager.set(equipment_id, session.getId(), 1);
                return session;
            } catch (IOException e) {
                e.printStackTrace();
            }

        }


        return session;
    }

    public RedisManager getRedisManager() {
        return redisManager;
    }

    public void setRedisManager(RedisManager redisManager) {
        this.redisManager = redisManager;
    }
}
