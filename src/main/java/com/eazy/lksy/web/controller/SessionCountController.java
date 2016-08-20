package com.eazy.lksy.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eazy.lksy.web.common.BaseController;
import com.eazy.lksy.web.shiro.RedisManager;
import com.eazy.lksy.web.shiro.RedisSessionDao;

@Controller
@RequestMapping("/sessioncount")
public class SessionCountController extends BaseController {
	
	@Autowired
	private RedisSessionDao redisSessionDao;
	@Autowired
	private RedisManager redisManager;

	@RequestMapping("index")
	public void index() {
		Map<String, String> map = new HashMap<>();
		map.put("count", redisSessionDao.getActiveSessions().size() + "");
		renderJson(map);
	}
}
