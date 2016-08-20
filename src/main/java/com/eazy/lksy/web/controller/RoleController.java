package com.eazy.lksy.web.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eazy.lksy.web.common.BaseController;
import com.eazy.lksy.web.service.PermissionService;
import com.eazy.lksy.web.service.RoleService;
import com.google.common.collect.Maps;

/**
 * @date 2016/1/28
 * @author jzx 
 * @desc 角色管理
 */
@Controller  
@RequestMapping("/role")  
public class RoleController extends BaseController {

	@Autowired
	private RoleService roleService;
	@Autowired
	private PermissionService permissionService;
	
	/**
     * 查询用角色列表
     */
    @RequestMapping(value = "list" , method = RequestMethod.GET)  
    public ModelAndView selectRole() {
    	ModelAndView andView = new ModelAndView("admin/role_list");
    	List<Map<String, Object>> data = roleService.selectRole();
    	andView.addObject("data", data);
    	return andView;
    }
	
    /**
     * 添加角色
     */
    @RequestMapping(value = "addRole" , method = RequestMethod.POST)
    public String addRole() {
    	Map<String,String> map = getFormPage();
    	String role_id = roleService.addRole(map);
    	String[] check = getParaValues("check"); // 获取选中的菜单 
    	for(int i =0 ; i< check.length; i++) {
    		roleService.addRolePermission(role_id, check[i]);
    	}
    	return "redirect:/role/list";
    }
    
    /**
     * 修改角色
     */
    @RequestMapping(value = "updateRole" , method = RequestMethod.POST)
    public String updateRole() {
    	Map<String,String> map = getFormPage();
    	String role_id = map.get("id");
    	roleService.updateRole(map);
    	permissionService.deleteRolePermission(role_id);
    	String[] check = getParaValues("check"); // 获取选中的菜单 
    	
    	for(int i =0 ; i< check.length; i++) {
    		roleService.addRolePermission(role_id, check[i]);
    	}
    	return "redirect:/role/list";
    }
    
    /**
     * 删除角色
     */
    @RequestMapping(value = "deleteRole" , method = RequestMethod.GET)
    public String deleteRole() {
    	Map<String,String> map = getFormPage();
    	roleService.addRole(map);
    	return "redirect:/role/list";
    }
    
    /**
	 * 角色添加页面跳转
	 */
    @RequiresPermissions("sys:role:add")
    @RequestMapping(value = "toAddRole" , method = RequestMethod.GET)  
    public ModelAndView toAddRole() {
    	Map<String,Object> map = Maps.newHashMap();
    	List<Map<String,Object>> all = permissionService.permissionAllList();
    	map.put("all", all);
    	return new ModelAndView("admin/role_add",map);
    }
    
    /**
     * 跳转到修改角色页面
     */
    @RequiresPermissions("sys:role:update")
    @RequestMapping(value = "toUpdateRole/{id}" , method = RequestMethod.GET)
    public ModelAndView toUpdateRole(@PathVariable String id) {
    	Map<String,Object> maps = Maps.newHashMap();
    	List<Map<String,Object>> check = roleService.getRolePermissions(id);
    	
    	// 1)获取所有菜单
    	List<Map<String,Object>> allMenu = permissionService.getListMap("SELECT * FROM permission p WHERE p.`PID` IS NULL order by SORT asc ");
    	// 2)获取所有子菜单
    	for (Map<String, Object> a : allMenu) {
    		for (Map<String, Object> c : check) {
    			if(a.get("id") == c.get("id")) {
    				a.put("menu", true);
    			}
    		}
    		List<Map<String,Object>> subMenu = permissionService.getListMap("SELECT * FROM permission p WHERE p.`PID`=" + a.get("id"));
    		
    		// 3)获取所有功能
    		for(Map<String,Object> b : subMenu) {
    			for (Map<String, Object> c : check) {
        			if(b.get("id") == c.get("id")) {
        				b.put("submenu", true);
        			}
        		}
    			List<Map<String,Object>> funMenu = permissionService.getListMap("SELECT * FROM permission p WHERE p.`PID`=" + b.get("id"));
    			for(Map<String,Object> f : funMenu) {
        			for (Map<String, Object> c : check) {
            			if(f.get("id") == c.get("id")) {
            				f.put("funmenu", true);
            			}
            		}
    			}
    			b.put("funMenu", funMenu);
    		}
    		a.put("subMenu", subMenu);
		}
    	maps.put("role", permissionService.getMap("select * from role where id=" + id));
    	setAttr("check", check);
    	setAttr("allMenu", allMenu);
    	return new ModelAndView("admin/role_update",maps);
    }
    
}



