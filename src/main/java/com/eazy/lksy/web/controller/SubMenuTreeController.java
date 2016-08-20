package com.eazy.lksy.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eazy.lksy.web.common.BaseController;
import com.eazy.lksy.web.service.PermissionService;
import com.google.common.collect.Lists;

/**
 * 子菜单树 
 */
@Controller
@RequestMapping("/submenu")
public class SubMenuTreeController extends BaseController {
	
	@Autowired
	private PermissionService permissionService;
	
	/**
	 * 第二层tree
	 */
	@RequestMapping(value = "tree/{pid}" , method = { RequestMethod.POST, RequestMethod.GET })
	public void tree2(@PathVariable String pid) throws IOException {
		List<Map<String, Object>> permission =  permissionService.permissionSubMenu(pid);
		List<Map<String,Object>> coll = Lists.newArrayList();
		for(int i =0 ; i< permission.size(); i++) {
			Map<String,Object> m = permission.get(i);
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("id", m.get("id"));
			param.put("pId", m.get("pid"));
			param.put("name", m.get("name"));
			param.put("open", true);
			coll.add(param);
		}
		renderJson(coll);
	}
	
}
