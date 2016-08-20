package com.eazy.lksy.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eazy.lksy.web.common.BaseController;
import com.eazy.lksy.web.core.reptile.Room;
import com.eazy.lksy.web.core.reptile.RoomImg;
import com.eazy.lksy.web.service.RoomService;

/**
 * @author jzx
 * @date 2016/04/01
 * @desc 房间管理
 */
@Controller
@RequestMapping(value = "room")
public class RoomController extends BaseController {

	@Autowired
	private RoomService roomService;
	
	/**
	 * 房间查询列表
	 */
	@RequestMapping(value = "/list", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView list() {
		ModelAndView view = new ModelAndView("room/room_list"); 
		view.addObject("data", roomService.getListMap(" SELECT r.*,h.hotel_name,h.img FROM room r,hotel h WHERE r.`h_id` = h.id"));
		return view;
	}
	
	/**
	 * 添加酒店房间
	 */
	@RequestMapping(value = "/addRoom", method = { RequestMethod.POST, RequestMethod.GET })
	public void addRoom() {
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
		
		String room_name = getPara("name");
		String room_price = getPara("price");
		String hotel_id = getPara("hotel_name");
		
		// 以下代码来源于 reptile 项目lksy项目的基础数据基于jsoup编写的，具体下载地址加QQ群335102947 不知不觉又打了广告
		
		// 先添加room表数据
		Room room = new Room(room_name, hotel_id, room_price).execute("");
		
		// 在添加关联表数据
		for(int i=0; i< title.length; i++) {
			String photo_name = title[i]; 
			photo_name = photo_name.substring(0, photo_name.lastIndexOf("."));
			new RoomImg(photo_name, room.getId()).execute("");
		}
		renderJson200();
	}
	
	/**
	 * 跳转到房间添加页面
	 */
	@RequestMapping(value = "/toAddRoom", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView toAddRoom() {
		return new ModelAndView("/room/room-add","data",roomService.getListMap("select * from hotel"));
	}
	
	/**
	 * 跳转到房间图片
	 */
	@RequestMapping(value = "/toRoomImage/{id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView toRoomImage(@PathVariable String id) {
		ModelAndView view = new ModelAndView("room/room_image"); 
		view.addObject("data", roomService.getListMap("SELECT ri.*,r.`name` FROM room r,room_image ri WHERE r.`id` = ri.`r_id`  AND r.id=" + id));
		return view;
	}
}
