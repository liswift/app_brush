package com.eazy.lksy.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eazy.lksy.web.common.BaseController;
import com.eazy.lksy.web.service.CityService;
import com.eazy.lksy.web.utils.Bundle;

/**
 * @author jzx
 * @date 2016/2/15
 * @desc 城市管理 
 */
@Controller
@RequestMapping("/city")
public class CityController extends BaseController {

	@Autowired
	private CityService cityService;
	
	/**
	 * 城市查询
	 */
	@RequestMapping(value = "list" , method = RequestMethod.GET)
	public ModelAndView selectCity() {
		List<Map<String, Object>> data = cityService.selectCity();
		return new ModelAndView("city/city_list","data",data);
	}
	
	/**
	 * 城市添加功能
	 */
	@RequestMapping(value = "addcity" , method = RequestMethod.POST)
	public void addCity() {
		cityService.addCity(getData());
		renderResult(true);
	}

	/**
	 * 城市修改功能
	 */
	@RequestMapping(value = "updatecity" , method = RequestMethod.POST)
	public void updCity(HttpServletRequest request) {
		cityService.updateCity(getData());
		renderResult(true);
	}
	
	/**
	 * 城市删除
	 */
	@RequiresPermissions("sys:city:delete")
	@RequestMapping(value = "deletecity/{id}" , method = RequestMethod.GET)
	public String delCity(@PathVariable String id) {
		Map<String,Object> entity = cityService.getResultFromId(id);
		String status = Bundle.convStr(entity.get("status"));
		if(status.equals("0"))
			cityService.delete(id, "1");
		else
			cityService.delete(id, "0");
		return "redirect:/city/list";
	}
	
	/**
	 * 跳转到城市添加页面
	 */
	@RequestMapping(value = "toAddcity" , method = RequestMethod.GET)
	public ModelAndView toAddcity() {
		return new ModelAndView("city/city_add");
	}
	
	/**
	 * 跳转到城市修改页面
	 */
	@RequestMapping(value = "toUpdatecity/{id}" , method = RequestMethod.GET)
	public ModelAndView toUpdatecity(@PathVariable String id) {
		return new ModelAndView("city/city_update",cityService.getResultFromId(id));
	}
	
}
