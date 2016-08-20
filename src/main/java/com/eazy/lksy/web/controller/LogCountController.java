package com.eazy.lksy.web.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eazy.lksy.web.common.BaseController;
import com.eazy.lksy.web.service.LogService;
import com.eazy.lksy.web.utils.DateUtils;
import com.eazy.lksy.web.utils.HighCharts;

/**
 * @author jzx
 * @desc 系统统计
 */
@Controller
@RequestMapping("/logcount")
public class LogCountController extends BaseController {

	@Autowired
	private LogService logService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		return new ModelAndView("/count/log_list");
	}

	/**
	 * 系统访问个数 --数据图
	 */
	@RequestMapping(value = "/actDataArray", method = { RequestMethod.POST, RequestMethod.GET })
	public void actDataArray() throws IOException {
		String type = getPara("type");
		Map<String, Object> result = null;
		if (type.equals("days")) {
			List<Map<String, Object>> data = logService.selectLog("", "");
			result = HighCharts.daysArray(data);
		} else if (type.equals("week")) {
			String [] date = DateUtils.getStartEnd();
			List<Map<String, Object>> data = logService.selectLog(date[0], date[1]);
			result = HighCharts.weekArray(data);
		}
		renderJson(result);
	}
}
