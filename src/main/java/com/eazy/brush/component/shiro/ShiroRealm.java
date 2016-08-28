package com.eazy.brush.component.shiro;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.eazy.brush.model.User;
import com.eazy.brush.service.PermissionService;
import com.eazy.brush.service.RoleService;
import com.eazy.brush.service.UserService;


public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private PermissionService permissionService;

    /**
     * 为当前登录的Subject授予角色和权限
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        //获取当前登录的用户名,等价于(String)principals.fromRealm(this.getName()).iterator().next()  
        String currentUsername = (String) super.getAvailablePrincipal(principals);
        List<String> roleList = new ArrayList<String>();
        List<String> permissionList = new ArrayList<String>();
        Map<String, Object> map = userService.getUserByName(currentUsername);
        User user = new User(Integer.valueOf(map.get("ID") + ""), map.get("name") + "", map.get("PASSWORD") + "");
        List<Map<String, Object>> roles = roleService.getRoles(user.getId() + "");
        //实体类User中包含有用户角色的实体类信息
        if (null != roles && roles.size() > 0) {
            //获取当前登录用户的角色
            for (Map<String, Object> role : roles) {
                roleList.add(role.get("NAME") + "");
                //实体类Role中包含有角色权限的实体类信息
                List<Map<String, Object>> permission = permissionService.permissions(role.get("ID") + "");
                if (null != permission && permission.size() > 0) {
                    //获取权限
                    for (Map<String, Object> pmss : permission) {
                        if (!StringUtils.isEmpty(pmss.get("PERM_CODE") + "")) {
                            permissionList.add(pmss.get("PERM_CODE") + "");
                        }
                    }
                }
            }
        }
        //为当前用户设置角色和权限
        SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
        simpleAuthorInfo.addRoles(roleList);
        simpleAuthorInfo.addStringPermissions(permissionList);
        return simpleAuthorInfo;
    }

    /**
     * 验证当前登录的Subject
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        //获取基于用户名和密码的令牌  
        //实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的  
        //两个token的引用都是一样的
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;

        if (token.getPassword().toString() != null && token.getUsername() != null) {
            char[] ch = token.getPassword();
            String password = String.valueOf(ch);
            User check = userService.login(new User(token.getUsername(), password));
            //此处无需比对,比对的逻辑Shiro会做,我们只需返回一个和令牌相关的正确的验证信息
            //说白了就是第一个参数填登录用户名,第二个参数填合法的登录密码(可以是从数据库中取到的,本例中为了演示就硬编码了)
            //这样一来,在随后的登录页面上就只有这里指定的用户和密码才能通过验证
            if (check != null) {
                AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(check.getName(), check.getPassword(), this.getName());
                this.setSession("user", check);
                return authcInfo;
            }
            //没有返回登录用户名对应的SimpleAuthenticationInfo对象时,就会在LoginController中抛出UnknownAccountException异常
        }
        return null;
    }


    /**
     * 将一些数据放到ShiroSession中,以便于其它地方使用
     */
    private void setSession(Object key, Object value) {
        Subject currentUser = SecurityUtils.getSubject();
        if (null != currentUser) {
            Session session = currentUser.getSession();
            System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
            if (null != session) {
                session.setAttribute(key, value);
            }
        }
    }
}