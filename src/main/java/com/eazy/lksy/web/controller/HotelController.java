package com.eazy.lksy.web.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eazy.lksy.web.common.BaseController;
import com.eazy.lksy.web.core.dao.DbEntity;
import com.eazy.lksy.web.service.HotelService;

/**
 * @author jzx
 * @date 2016/3/30
 * @desc 酒店管理
 */
@Controller
@RequestMapping(value = "hotel")
public class HotelController  extends BaseController {

	/**
	 * 2016.5.24 增加酒店添加功能
	 */
	@Autowired
	private HotelService hotelService;
	/**
	 * 酒店查询列表
	 */
	@RequestMapping(value = "/list", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView list() {
		ModelAndView view = new ModelAndView("hotel/hotel_list"); 
		view.addObject("data", hotelService.getListMap("select * from hotel"));
		return view;
	}
	
	/**
	 * 酒店添加功能
	 * 由于之前有人说这个系统没有图片上传功能，本次加入此功能
	 */
	@RequestMapping(value = "/addHotel", method = { RequestMethod.POST, RequestMethod.GET })
	public void addHotel(HttpServletRequest request) {
		// 获取多张酒店图片，由于数据库只支持存储一张酒店图片，所以此处只是记录一张
		// 对于批量上传功能只是起到一个抛砖引玉的作用
		// 如果想实现的化具体做法就是在数据库增加一张酒店图片和酒店信息的关联表
		String [] title = getParaValues("title");
		String [] success = getParaValues("success");
		
		if(title == null) {
			renderJsonError("酒店图片不能为空");
			return;
		}
		if(success == null) {
			renderJsonError("请先批量上传图片，然后在提交！！！！");
			return;
		}
		
		String photo_name = title[0]; 
		photo_name = photo_name.substring(0, photo_name.lastIndexOf("."));
		String hotel_name = getPara("name");
		String hotel_tel = getPara("tel");
		String hotel_addr = getPara("addr");
		String hotel_star = getPara("star");
		
		DbEntity dbEntity = new DbEntity();
		dbEntity.set("photo_name", photo_name);
		dbEntity.set("hotel_name", hotel_name);
		dbEntity.set("hotel_tel", hotel_tel);
		dbEntity.set("hotel_addr", hotel_addr);
		dbEntity.set("hotel_star", hotel_star);

		hotelService.addHotel(dbEntity);
		renderJson200();
	}
	
	/**
	 * 跳转到酒店添加页面
	 */
	@RequestMapping(value = "/toAddHotel", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView toAddHotel() {
		return new ModelAndView("/hotel/hotel-add");
	}
	
	/**
	 * 跳转到房间图片
	 */
	@RequestMapping(value = "/toRoomImage/{id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView toRoomImage(@PathVariable String id) {
		ModelAndView view = new ModelAndView("hotel/room_image"); 
		view.addObject("data", hotelService.getListMap("SELECT ri.*,r.`name` FROM room r,room_image ri WHERE r.`id` = ri.`r_id`  AND r.`h_id`=" + id));
		return view;
	}
	
	
}
