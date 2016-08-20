package com.eazy.lksy.web.controller;  
  
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eazy.lksy.web.common.BaseController;
import com.eazy.lksy.web.model.User;
import com.eazy.lksy.web.service.RoleService;
import com.eazy.lksy.web.service.UserService;
import com.eazy.lksy.web.utils.Bundle;
  

/**
 * @date 2016/1/28
 * @author jzx 
 * @desc 用户管理
 */
@Controller  
@RequestMapping("/user")  
public class UserController extends BaseController {  
  
    @Autowired  
    private UserService userService;  
    @Autowired
    private RoleService roleService;
    
    
    /**
     * 查询用户列表
     */
    @RequestMapping(value = "list" , method = RequestMethod.GET)  
    public ModelAndView selectUser(Model model) {  
    	model.addAttribute("data", userService.selectUser());
        return new ModelAndView("user/user_list");  
    }  
    
    /**
     * 添加用户角色
     */
    @RequestMapping(value = "addUserRole" , method = { RequestMethod.POST, RequestMethod.GET })  
    public String addUserRole(HttpServletRequest req) {
    	String user_id = req.getParameter("user_id");
    	String [] role_id = req.getParameterValues("role_id");
    	
    	roleService.deleteUserRole(user_id);
    	
    	for(int i =0 ; i< role_id.length; i++) {
    		userService.addUserRole(user_id, role_id[i]);
    	}
    	return "redirect:/user/list";
    }  
    
    
    /**
     * 添加用户
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String addUser() {
    	String name = getRequest().getParameter("name");
    	Map<String, String> maps = getFormPage();
    	userService.add(new User(name,maps.get("pwd"),maps.get("email")));
    	return "redirect:/user/list";
    }
    
    /**
     * 修改用户 
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String updateUser(HttpServletRequest request) {
    	Map<String, String> maps = getFormPage();
    	userService.update(new User(Bundle.convInt(maps.get("id")), maps.get("name"), maps.get("password")));
    	return "redirect:/user/list";
    }
  
    
    /**
     * 删除用户 
     */
    @RequiresPermissions("sys:user:delete")
    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable String id) {
    	userService.delete(id);
    	return "redirect:/user/list";
    }
    
    /**
     * 跳转到设置角色页面
     */
    @RequiresPermissions("sys:user:toRole")
    @RequestMapping(value = "toRole/{id}", method = RequestMethod.GET)
    public ModelAndView toRole(@PathVariable String id) {
    	List<Map<String, Object>> self_role = roleService.getRoles(id); // 用户拥有角色
    	List<Map<String, Object>> all_role = roleService.selectRole(); // 所有角色
    	
    	for (Map<String, Object> all : all_role) {
    		all.put("point", 0);
			for (Map<String,Object> self : self_role) {
				if(Bundle.convStr(self.get("ID")).equals(Bundle.convStr(all.get("ID")))) {
					all.put("point", 1);
				}
			}
		}
    	
    	ModelMap map = new ModelMap("all",all_role);
    	map.put("id", id);
    	return new ModelAndView("user/user_role",map);
    }
    
    
    /**
     * 跳转到修改用户页面并获取用户ID
     */
    @RequestMapping(value = "toUpdate", method = RequestMethod.GET)
    public ModelAndView toUpdateUser(@RequestParam String id) {
    	ModelAndView modelAndView = new ModelAndView("/user/update");
    	modelAndView.addObject("user", getCurrentUser());
    	return modelAndView;
    }
    
    /**
     * 跳转到添加用户页面
     */
    @RequiresPermissions("sys:user:add")
    @RequestMapping(value = "toAdd", method = RequestMethod.GET)
    public ModelAndView toAddUser(HttpServletRequest request) {
    	return new ModelAndView("user/user_add");
    }
}