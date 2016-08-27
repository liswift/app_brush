package com.eazy.brush.controller.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eazy.brush.controller.common.BaseController;
import com.eazy.brush.component.shiro.RedisManager;
import com.eazy.brush.component.shiro.RedisSessionDao;

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
