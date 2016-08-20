package com.eazy.lksy.web.controller;

import java.util.Map;


import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eazy.lksy.web.common.BaseController;
import com.eazy.lksy.web.service.AreaService;

/**
 * @author jzx
 * @date 2016/2/15
 * @desc 区域管理
 */
@Controller
@RequestMapping("/area")
public class AreaController extends BaseController {

	
	@Autowired
	private AreaService areaService;
	
	/**
	 * 区域查询
	 */
	@RequestMapping(value = "list/{id}" , method = RequestMethod.GET)
	public String selectArea(@PathVariable String id,Model model) {
		model.addAttribute("data",  areaService.selectArea(id));
		model.addAttribute("city_id", id);
		return "city/area/area_list";
	}
	

	/**
	 * 区域添加
	 */
	@RequestMapping(value = "addArea" , method = RequestMethod.POST)
	public String addArea() {
		String name = getPara("name");
		String cityId = getPara("city_id");
		areaService.addArea(name, cityId);
		return "redirect:/area/list/" + cityId;
	}

	/**
	 * 区域修改
	 */
	@RequestMapping(value = "updateArea" , method = RequestMethod.POST)
	public String updateArea() {
		areaService.updateArea(getFormPage());
		return "redirect:/area/list/" + getStr("cityid");
	}

	/**
	 * 区域删除
	 */
	@RequiresPermissions("sys:area:delete")
	@RequestMapping(value = "deleteArea/{id}/{cityid}" , method = RequestMethod.GET)
	public String deleteArea(@PathVariable String id,@PathVariable String cityid) {
		areaService.deleteArea(id);
		return "redirect:/area/list/" + cityid;
	}

	/**
	 * 跳转到区域添加
	 */
	@RequestMapping(value = "toAddarea/{id}" , method = RequestMethod.GET)
	public ModelAndView toAddarea(@PathVariable String id) {
		return new ModelAndView("city/area/area_add","city_id",id);
	}

	/**
	 * 跳转到区域修改
	 */
	@RequestMapping(value = "toUpdatearea/{id}" , method = RequestMethod.GET)
	public ModelAndView toUpdatearea(@PathVariable String id) {
		ModelAndView andView = new ModelAndView("city/area/area_update");
		Map<String, Object> result = areaService.findViewById("area", id);
		andView.addObject("data", result);
		return andView;
	}
}
