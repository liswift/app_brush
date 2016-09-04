package com.eazy.brush.controller.web;

import com.eazy.brush.component.redis.Redis;
import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.controller.view.service.TaskVoService;
import com.eazy.brush.controller.view.service.UserAccountVoService;
import com.eazy.brush.controller.view.vo.TaskVo;
import com.eazy.brush.controller.view.vo.UserAccountVo;
import com.eazy.brush.core.enums.Role;
import com.eazy.brush.core.utils.DataUtil;
import com.eazy.brush.core.utils.MD5;
import com.eazy.brush.core.utils.StrKit;
import com.eazy.brush.model.User;
import com.eazy.brush.service.LogService;
import com.eazy.brush.service.PermissionService;
import com.eazy.brush.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @author jzx
 * @desc 登录管理
 * @date 2016/2/29
 */
@Controller
@RequestMapping("/sys")
public class LoginController extends BaseController {

    @Resource
    private JmsTemplate jmsTemplate;
    @Autowired
    private UserService userService;
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private UserAccountVoService userAccountVoService;
    @Autowired
    private TaskVoService taskVoService;

    @Autowired
    private LogService logService;

    /**
     * 用户登录
     */
    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public String login(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        Map<String, String> map = getPageData(request);

        if (StrKit.isEmpty(map.get("name")) && StrKit.isEmpty(map.get("pwd"))) {
            redirectAttributes.addFlashAttribute("msg", "用户名和密码不能为空");
        } else if (StrKit.isEmpty(map.get("name"))) {
            redirectAttributes.addFlashAttribute("msg", "用户名不能为空");
        } else if (StrKit.isEmpty(map.get("pwd"))) {
            redirectAttributes.addFlashAttribute("msg", "密码不能为空");
        } else {
            // 需要的时候再去拿session
            HttpSession sessionCode = request.getSession();
            String code = sessionCode.getAttribute("code").toString();

            if (!code.equalsIgnoreCase(map.get("code"))) {
                redirectAttributes.addFlashAttribute("msg", "验证码输入错误");
            } else {
                try {
                    UsernamePasswordToken token = new UsernamePasswordToken(map.get("name"), MD5.encodeString(map.get("pwd")));
                    token.setRememberMe(true);
                    Subject currentUser = SecurityUtils.getSubject();
                    currentUser.login(token);
                    // 验证是否登录成功
                    if (currentUser.isAuthenticated()) {
                        // 删除产生的废弃验证码
                        sessionCode.removeAttribute(map.get("code"));

                        final String ip = DataUtil.getIpAddr(request);
                        //发送日志
                        jmsTemplate.send(new MessageCreator() {
                            @Override
                            public Message createMessage(Session session) throws JMSException {
                                MapMessage message = session.createMapMessage();
                                message.setString("type", "login");
                                message.setString("account", getCurrentUser().getName());
                                message.setString("ip", ip);
                                message.setString("logintime", String.valueOf(System.currentTimeMillis()));
                                return message;
                            }
                        });
                        return "redirect:index";
                    } else {
                        token.clear();
                    }
                } catch (AuthenticationException ex) {
                    redirectAttributes.addFlashAttribute("msg", "用户名或者密码输入错误!!!");
                    ex.printStackTrace();
                }
            }
        }
        return "redirect:error";
    }

    /**
     * 用户登出
     */
    @RequestMapping(value = "/logout", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView logout() {
        ModelAndView andView = new ModelAndView("login/login");
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return andView;
    }

    /**
     * 修改登录密码
     */
    @RequestMapping(value = "/forgetpwd", method = RequestMethod.POST)
    public String updatePwd(@RequestBody User user) {
        userService.update(user);
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/sys/login";
    }

    /**
     * 跳转到欢迎页
     */
    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public ModelAndView welcome() {

        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole(Role.guest.name())) {
            return getUserModelAndView();
        }
        return getAdminModelAndView();
    }

    /**
     * 普通用户欢迎页
     *
     * @return
     */
    public ModelAndView getUserModelAndView() {
        int curPage = getParaInt("curPage", 1);
        int size = getParaInt("size", 20);

        User user = getCurrentUser();
        ModelAndView model = new ModelAndView("index/welcome_user");
        UserAccountVo userAccountVo = userAccountVoService.getByUserId(user.getId());
        List<TaskVo> taskVoses = taskVoService.getList(user.getId(), (curPage - 1) * size, size);
        model.addObject("userAccountVo", userAccountVo);
        model.addObject("tasks", taskVoses);
        return model;
    }

    /**
     * 跳转到首页
     */
    @RequiresAuthentication
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(ModelMap map) {
        String value = getCurrentUser().getId().toString();
        List<Map<String, Object>> result = permissionService.permissionList(value);
        map.put("data", result);
        return new ModelAndView("index/index", map);
    }

    /**
     * 跳转到登录失败页面
     */
    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public ModelAndView error(ModelMap model) {
        return new ModelAndView("login/login", model);
    }


    /**
     * 跳转到修改密码页面
     */
    @RequestMapping(value = "/forget", method = RequestMethod.GET)
    public ModelAndView toUpdatePwd() {
        ModelAndView modelAndView = new ModelAndView("admin/admin_pwd");
        modelAndView.addObject("user", getCurrentUser());
        return modelAndView;
    }

    private ModelAndView getAdminModelAndView() {

        List<Map<String, Object>> data = null;

        if (Redis.exists("welcome")) {
            String load = Redis.get("welcome");
            data = toGson(load);
        } else {
            data = logService.selectLog();
            String load = toJson(data);
            Redis.put("welcome", load);
        }
        ModelAndView model = new ModelAndView("index/welcome_admin");
        model.addObject("data", data);
        model.addObject("count", data.size());

        model.addObject("ip", "");
        model.addObject("last_time", "");
        // 获取当前时间第一个登录用户
        if (data != null) {
            model.addObject("ip", data.get(0).get("IP"));
            model.addObject("last_time", data.get(0).get("tim"));
        }

        return model;
    }
}
