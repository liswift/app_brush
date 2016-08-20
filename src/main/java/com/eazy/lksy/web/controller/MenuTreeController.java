package com.eazy.lksy.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eazy.lksy.web.common.BaseController;
import com.eazy.lksy.web.service.PermissionService;
import com.eazy.lksy.web.utils.Bundle;
import com.google.common.collect.Lists;

/**
 * 主菜单树
 */
@Controller
@RequestMapping("/menu")
public class MenuTreeController extends BaseController {

	@Autowired
	private PermissionService permissionService;
	
	/**
	 * tree 菜单
	 */
	@RequestMapping(value = "tree" , method = { RequestMethod.POST, RequestMethod.GET })
	public void tree() throws IOException {
		List<Map<String,Object>> menu = permissionService.permissionMenu();
		List<Map<String,Object>> coll = Lists.newArrayList();
		for(int i =0 ; i< menu.size(); i++) {
			Map<String,Object> m = menu.get(i);
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("id", m.get("id"));
			param.put("pId", m.get("pid"));
			param.put("name", m.get("name"));
			param.put("open", true);
			coll.add(param);
			List<Map<String, Object>> sub = permissionService.permissionSubMenu(Bundle.convStr(m.get("id")));
			for(int j =0; j< sub.size(); j++) {
				Map<String,Object> s = sub.get(j);
				Map<String,Object> param2 = new HashMap<String,Object>();
				param2.put("id", s.get("id"));
				param2.put("pId", s.get("pid"));
				param2.put("name", s.get("name"));
				param2.put("open", true);
				coll.add(param2);
			}
		}
		renderJson(coll);
	}
	
}
