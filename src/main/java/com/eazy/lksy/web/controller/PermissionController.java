package com.eazy.lksy.web.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eazy.lksy.web.common.BaseController;
import com.eazy.lksy.web.service.PermissionService;

/**
 * @date 2016/2/6
 * @author jzx 
 * @desc 权限管理
 */
@Controller
@RequestMapping("/permission")
public class PermissionController extends BaseController {

	@Autowired
	private PermissionService permissionService;
	
	/**
	 * 获取权限列表
	 */
	@RequestMapping(value = "list" , method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView permissionList(HttpServletRequest request,HttpServletResponse response) throws IOException {
		ModelAndView view = new ModelAndView("admin/menu_list");
		view.addObject("dataMenu", permissionService.permissionMenu());
		return view;
	}
	
	/**
	 * 获取权限列表子菜单
	 */
	@RequestMapping(value = "submenu/{pid}" , method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView submenu(@PathVariable String pid) throws IOException {
		ModelAndView view = new ModelAndView("admin/submenu_list");
		view.addObject("dataMenu", permissionService.permissionSubMenu(pid));
		view.addObject("pid", pid);
		return view;
	}
	
	/**
	 * 修改主菜单
	 */
	@RequestMapping(value = "/updateMenu", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView updateMenu() {
		Map<String,String> map = getFormPage();
		permissionService.updateMenu(map);
		return new ModelAndView("redirect:/permission/list");
	}
	
	/**
	 * 添加主菜单
	 */
	@RequestMapping(value = "/addMenu",  method = RequestMethod.POST)
	public String addMenu() {
		Map<String,String> actionRequest = getFormPage();
		permissionService.addMenu(actionRequest);
		return "redirect:/permission/list";
	}
	
	/**
	 * 添加子菜单
	 */
	@RequestMapping(value = "/addSubMenu",  method = RequestMethod.POST)
	public String addSubMenu() {
		Map<String,String> actionRequest = getFormPage();
		permissionService.addSubMenu(actionRequest);
		return "redirect:/permission/list";
	}
	
	/**
	 * 修改子菜单
	 */
	@RequestMapping(value = "/updateSubMenu",  method = RequestMethod.POST)
	public String updateSubMenu() {
		Map<String,String> actionRequest = getFormPage();
		permissionService.updateSubMenu(actionRequest);
		return "redirect:/permission/list";
	}
	
	/**
	 * 删除子菜单
	 */
	@RequestMapping(value = "delsubmenu/{sid}/{pid}" , method = { RequestMethod.POST, RequestMethod.GET })
	public String delsubmenu(@PathVariable String sid,@PathVariable String pid) throws IOException {
		// 先删除关联表
		permissionService.fksubmenu(sid);
		// 在删除主表
		permissionService.delsubmenu(sid);
		return "redirect:/permission/submenu/" + pid;
	}
	
	/**
	 * 删除主菜单
	 */
	@RequestMapping(value = "delmenu/{pid}" , method = { RequestMethod.POST, RequestMethod.GET })
	public String delmenu(@PathVariable String pid) throws IOException {
		List<Map<String,Object>> menu = permissionService.getMenuPermission(pid);
		for(Map<String,Object> m : menu) {
			List<Map<String,Object>> subMenu =  permissionService.getSubMenuPermission(pid);
			if(subMenu.size() > 0) {
				for(Map<String,Object> s : subMenu) {
					permissionService.fksubmenu(s.get("ID") + "");
					permissionService.delsubmenu(s.get("ID") + "");
				}
			} else {
				permissionService.fksubmenu(m.get("ID") + "");
				permissionService.delsubmenu(m.get("ID") + "");
			}
		}
		return "redirect:/permission/list";
	}
	
	
	/**
	 * 跳转到添加菜单页面
	 */
	@RequestMapping(value = "/toAddMenu", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView toAddMenu(HttpServletRequest request) {
		return new ModelAndView("admin/menu_add");
	}
	
	/**
	 * 跳转到编辑菜单页面
	 */
	@RequestMapping(value = "/toEditMenu/{id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView toEditMenu(@PathVariable String id) {
		Map<String,Object> permission = permissionService.getPermission(id);
		ModelMap model = new ModelMap("data",permission);
		model.put("id", id);
		return new ModelAndView("admin/menu_update",model);
	}
	
	/**
	 * 跳转到编辑子菜单页面
	 */
	@RequestMapping(value = "/toEditSubMenu/{id}/{pid}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView toEditSubMenu(@PathVariable String id,@PathVariable String pid) {
		Map<String,Object> permission = permissionService.getPermission(id);
		ModelMap model = new ModelMap("data",permission);
		model.put("id", id);
		model.put("pid", pid);
		return new ModelAndView("admin/submenu_update",model);
	}
	
	/**
	 * 跳转到添加子菜单页面
	 */
	@RequestMapping(value = "/toAddSubMenu/{pid}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView toAddSubMenu(@PathVariable String pid) {
		return new ModelAndView("admin/submenu_add","pid",pid);
	}
	
}
