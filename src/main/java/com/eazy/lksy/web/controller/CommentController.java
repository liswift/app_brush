package com.eazy.lksy.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eazy.lksy.web.common.BaseController;
import com.eazy.lksy.web.core.dao.DbEntity;
import com.eazy.lksy.web.service.CommentService;

/**
 * @author jzx
 * @date 2016.5.25
 * @desc 评论管理 
 */
@Controller
@RequestMapping("/comment")
public class CommentController extends BaseController {

	@Autowired
	private CommentService commentService;
	
	/**
	 * 虽然做了评论管理，可以反馈或者改进系统but你说了我也不会改→_→怪我咯
	 */
	@RequestMapping(value = "index" , method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView view = new ModelAndView("comment/comment-list");
		view.addObject("data", commentService.getListMap("select c.*,u.`NAME` from comment c left join user u on c.u_id = u.ID"));
		return view;
	}
	
	@RequestMapping(value = "addComment" , method = RequestMethod.POST)
	public void addComment() {
		DbEntity dbEntity = new DbEntity();
		dbEntity.set("desc", getPara("desc"));
		dbEntity.set("uid", getCurrentUser().getId());
		if(commentService.addComment(dbEntity)) {
			renderJson200();
		} else {
			renderJson500();
		}
	}
	
	
	/**
	 * 跳转到评论添加页面
	 */
	@RequestMapping(value = "toAddComment" , method = RequestMethod.GET)
	public ModelAndView toAddComment() {
		return new ModelAndView("comment/comment-add");
	}
}
