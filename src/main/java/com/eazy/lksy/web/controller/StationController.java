package com.eazy.lksy.web.controller;

import java.util.Iterator;
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
import com.eazy.lksy.web.service.CityService;
import com.eazy.lksy.web.service.LineService;
import com.eazy.lksy.web.service.StationService;
import com.eazy.lksy.web.utils.Bundle;

/**
 * @date 2016.2.23
 * @author jzx
 * @desc 地铁站管理 
 */
@Controller
@RequestMapping("/station")
public class StationController extends BaseController {

	@Autowired
	private StationService stationService;
	@Autowired
	private LineService lineService;
	@Autowired
	private CityService cityService;
	
	/**
	 * 地铁站列表 
	 */
	@RequestMapping(value = "/list/{id}", method = RequestMethod.GET)
	public ModelAndView detail(@PathVariable String id) {
		ModelAndView view = new ModelAndView("city/station/station_list");
		view.addObject("lineData", stationService.selectStation(id));
		Map<String, Object> lineName = lineService.findViewById("line_name", id);
		Map<String, Object> cityName = cityService.findViewById("city", lineName.get("city_id") + "");
		view.addObject("lineName", lineName.get("name"));
		view.addObject("cityName", cityName.get("name"));
		view.addObject("line_id", id);
		return view;
	}
	
	
	/**
	 * 添加站点
	 */
	@RequestMapping(value = "/addStation", method = RequestMethod.POST)
	public String addStation() {
		Map<String,String> map = getFormPage();
		Map<String, Object> data = stationService.findViewById("line_name", map.get("lineid"));
		stationService.addStation(map);
		return "redirect:/station/list/" + data.get("id");
	}
	
	/**
	 * 修改站点
	 */
	@RequestMapping(value = "/updateStation", method = RequestMethod.POST)
	public String updateStation() {
		Map<String, String> map = getFormPage();
		stationService.updateStation(map);
		return "redirect:/station/list/" + map.get("lineid");
	}
	
	/**
	 * 删除站点 
	 */
	@RequiresPermissions("sys:station:delete")
	@RequestMapping(value = "/deleteStation/{id}/{lineid}", method = RequestMethod.GET)
	public String deleteStation(@PathVariable String id,@PathVariable String lineid) {
		stationService.deleteStation(id);
		return "redirect:/station/list/" + lineid;
	}
	
	/**
	 * 跳转到添加站点页面
	 */
	@RequestMapping(value = "/toAddStation/{id}", method = RequestMethod.GET)
	public ModelAndView toAddStation(@PathVariable String id) {
		ModelAndView view = new ModelAndView("city/station/station_add");
		Map<String, Object> lineModel = lineService.findViewById("line_name", id);
		List<Map<String, Object>> data = lineService.selectLine(lineModel.get("city_id") + "");
		for(Iterator<Map<String, Object>> iter = data.iterator(); iter.hasNext();) {
			Map<String,Object> map = iter.next();
			if(id.equals(Bundle.convStr(map.get("id")))) {
				iter.remove();
			}
		}
		data.add(0, lineModel);
		view.addObject("data", data);
		return view;
	}
	
	/**
	 * 跳转到修改站点页面
	 */
	@RequestMapping(value = "toUpdateStation/{id}/{lineid}", method = RequestMethod.GET)
	public ModelAndView toUpdateStation(@PathVariable String id,@PathVariable String lineid) {
		ModelAndView view = new ModelAndView("city/station/station_update");
		Map<String, Object> lineModel = lineService.findViewById("line_name", lineid);
		List<Map<String, Object>> data = lineService.selectLine(lineModel.get("city_id") + "");
		for(Iterator<Map<String, Object>> iter = data.iterator(); iter.hasNext();) {
			Map<String,Object> map = iter.next();
			if(lineid.equals(Bundle.convStr(map.get("id")))) {
				iter.remove();
			}
		}
		data.add(0, lineModel);
		view.addObject("data", data);
		view.addObject("station", stationService.findViewById("line", id));
		return view;
	}
	
}
