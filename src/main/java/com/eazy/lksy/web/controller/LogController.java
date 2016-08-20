package com.eazy.lksy.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eazy.lksy.web.common.BaseController;
import com.eazy.lksy.web.export.ExportExcel;
import com.eazy.lksy.web.export.ExportPdf;
import com.eazy.lksy.web.export.ExportWord;
import com.eazy.lksy.web.redis.Redis;
import com.eazy.lksy.web.service.LogService;
import com.eazy.lksy.web.utils.StrKit;
import com.google.common.collect.Lists;

/**
 * @author jzx
 * @date 2016.3.14
 */
@Controller
@RequestMapping("/log")
public class LogController extends BaseController {

	@Autowired
	private LogService logService;

	/**
	 * 获取日志列表页
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView selectLog() {
		ModelAndView modelAndView = new ModelAndView("sys/log_list");
		modelAndView.addObject("data", logService.selectLog());
		return modelAndView;
	}
	
	/**
	 * 倒出数据
	 */
	@RequestMapping(value = "importFile", method = RequestMethod.GET)
	public void importFile() {

		List<Map<String, Object>> result = null;
		if (Redis.exists("welcome")) {
			String load = Redis.get("welcome");
			result = toGson(load);
		} else {
			result = logService.selectLog();
			String load = toJson(result);
			Redis.put("welcome", load);
		}

		List<String[]> list1 = Lists.newArrayList();

		for (Map<String, Object> rs : result) {
			String[] s = new String[5];
			s[0] = StrKit.null2Blank(rs.get("ID"));
			s[1] = StrKit.null2Blank(rs.get("BROWSER"));
			s[2] = StrKit.null2Blank(rs.get("OS"));
			s[3] = StrKit.null2Blank(rs.get("IP"));
			s[4] = StrKit.null2Blank(rs.get("tim"));
			list1.add(s);
		}
		switch (getPara("type")) {
		case "0":
			renderExcel("log.xls", ExportExcel.LOGMANAGER, list1);
			break;
		case "1":
			renderWord("log.doc", ExportWord.LOGMANAGER, list1);
			break;
		case "2":
			renderPdf("log.pdf", ExportPdf.LOGMANAGER, list1);
			break;
		default:
		}
	}

}
