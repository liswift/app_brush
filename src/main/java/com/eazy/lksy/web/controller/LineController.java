package com.eazy.lksy.web.controller;

import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eazy.lksy.web.common.BaseController;
import com.eazy.lksy.web.service.CityService;
import com.eazy.lksy.web.service.LineService;
import com.eazy.lksy.web.utils.Bundle;
import com.eazy.lksy.web.utils.JsonKsy;

/**
 * @author jzx
 * @date 2016/2/18
 * @desc 线路管理
 */
@Controller
@RequestMapping(value = "line")
public class LineController extends BaseController {

	@Autowired
	private CityService cityService;
	@Autowired
	private LineService lineService;
	
	/**
	 * 这个方法仅仅在于学习jquery datatables 并没有任何意义，具体页面代码在 
	 * /page/city/line/line_list_jquery.jsp
	 * 可以自行在本地测试
	 */
	@RequestMapping(value = "/index", method = { RequestMethod.POST, RequestMethod.GET })
	public void index() {
		ModelMap map = new ModelMap();
		map.put("data", lineService.selectLineName(getFormPage()));
		renderJson(JsonKsy.converMapToJson(map));
	}
	
	/**
	 * 线路查询列表
	 */
	@RequestMapping(value = "/list", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView list(HttpServletRequest request) {
		ModelAndView view = new ModelAndView("city/line/line_list");
		Map<String,String> map = getFormPage();
		view.addObject("cityData", cityService.selectCity());
		view.addObject("lineData", lineService.selectLineName(map));
		return view;
	}
	
	
	/**
	 * 添加线路
	 */
	@RequestMapping(value = "/addLine", method = RequestMethod.POST)
	public String addLine() {
		Map<String,String> map = getFormPage();
		if(lineService.isExists(map.get("cityid"), map.get("name"))) {
			lineService.addLineName(map);
		}
		return "redirect:/line/list";
	}
	
	/**
	 * 修改线路
	 */
	@RequestMapping(value = "/updateLine", method = RequestMethod.POST)
	public String updateLine(HttpServletRequest request) {
		Map<String,String> map = getFormPage();
		lineService.updateLineName(map);
		return "redirect:/line/list";
	}
	
	/**
	 * 删除线路
	 */
	@RequiresPermissions("sys:line:delete")
	@RequestMapping(value = "/deleteLine/{id}", method = RequestMethod.GET)
	public String deleteLine(@PathVariable String id) {
		lineService.deleteLine(id);
		return "redirect:/line/list";
	}
	
	/**
	 * 跳转到添加线路
	 */
	@RequiresPermissions("sys:line:add")
	@RequestMapping(value = "/toAddLine", method = RequestMethod.GET)
	public ModelAndView toAddLine() {
		ModelAndView view = new ModelAndView("city/line/line_add");
		view.addObject("cityData", cityService.selectCity());
		return view;
	}
	
	/**
	 * 跳转到修改线路页面
	 */
	@RequestMapping(value = "/toUpdateLine/{id}", method = RequestMethod.GET)
	public ModelAndView toUpdateLine(@PathVariable String id) {
		ModelAndView view = new ModelAndView("city/line/line_update");
		Map<String, Object> lineModel = lineService.findViewById("line_name", id);
		Map<String, Object> cityModel = cityService.findViewById("city", Bundle.convStr(lineModel.get("city_id")));
		List<Map<String, Object>> cityArray = cityService.selectCity();
		ListIterator<Map<String,Object>> data = cityArray.listIterator();
		synchronized(data) {
			while(data.hasNext()) {
				Map<String,Object> d = data.next();
				if(cityModel.get("id") == d.get("id")) {
					data.remove();
				}
			}
		}
		cityArray.add(0, cityModel);
		view.addObject("cityData", cityArray);
		view.addObject("line_name",lineModel.get("name"));
		view.addObject("id", lineModel.get("id"));
		return view;
	}
}
