package com.eazy.brush.controller.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.service.PermissionService;
import com.eazy.brush.core.utils.StrKit;

/**
 * @author jzx
 * @date 2016.3.24
 * @desc 功能权限
 */
@Controller
@RequestMapping("/function")
public class FunPermissionController extends BaseController {

	@Autowired
	private PermissionService permissionService;
	
	/**
	 * 获取功能列表
	 */
	@RequestMapping(value = "list" , method = {RequestMethod.GET })
	public ModelAndView permissionList() throws IOException {
		ModelAndView view = new ModelAndView("admin/permission_list");
		String id = getPara("id");
		String pid = getPara("pid");
		List<Map<String,Object>> data = null;
		if(StrKit.notEmpty(id)) {
			data = permissionService.getSubMenuPermission(id);
		}
		view.addObject("id", id);
		view.addObject("pid", pid);
		view.addObject("data", data);
		return view;
	}
	
	/**
	 * 功能添加
	 */
	@RequestMapping(value = "add" , method = {RequestMethod.POST })
	public String add(){
		Map<String,String> map = getFormPage();
		permissionService.addPermission(map);
		return "redirect:/function/list";
	}
	
	/**
	 * 功能修改
	 */
	@RequestMapping(value = "update" , method = {RequestMethod.POST })
	public String update() {
		Map<String,String> map = getFormPage();
		permissionService.updatePermission(map);
		return "redirect:/function/list";
	}
	
	/**
	 * 功能删除
	 */
	@RequestMapping(value = "delete/{id}/{pid}" , method = {RequestMethod.GET })
	public String delete(@PathVariable String id,@PathVariable String pid) {
		permissionService.fksubmenu(id);
		permissionService.delsubmenu(id);
		return "redirect:/function/list?id=" + pid;
	}
	
	/**
	 * 跳转到功能添加页面
	 */
	@RequestMapping(value = "toAdd/{id}" , method = {RequestMethod.GET })
	public ModelAndView toAdd(@PathVariable String id)  {
		ModelAndView view = new ModelAndView("admin/permission_add");
		view.addObject("id", id);
		return view;
	}
	
	/**
	 * 跳转到功能修改页面
	 */
	@RequestMapping(value = "toUpdate/{id}" , method = {RequestMethod.GET })
	public ModelAndView toUpdate(@PathVariable String id)  {
		ModelAndView view = new ModelAndView("admin/permission_update");
		Map<String,Object> result = permissionService.getPermission(id);
		view.addObject("id", id);
		view.addObject("data", result);
		return view;
	}
}
