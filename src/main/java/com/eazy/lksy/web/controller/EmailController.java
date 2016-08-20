package com.eazy.lksy.web.controller;



import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eazy.lksy.web.common.BaseController;
import com.eazy.lksy.web.email.Mail;
import com.eazy.lksy.web.service.EmailService;

/**
 * @author jzx
 * @date 2016/3/21
 * @desc 邮件管理
 */
@Controller
@RequestMapping("/email")
public class EmailController extends BaseController {

	@Autowired
	private EmailService emailService;
	
	/**
	 * 邮件人员列表
	 */
	@RequestMapping(value = "/list", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView list() {
		ModelAndView view = new ModelAndView("sys/email_list");
		view.addObject("data", emailService.selectEmail());
		return view;
	}
	
	/**
	 * 发送邮件 
	 */
	@RequestMapping(value = "/send", method = { RequestMethod.POST, RequestMethod.GET })
	public void send() {
		Map<String,String> req = getFormPage();
		String title = req.get("title");
		String content = req.get("content");
		String toAddress = req.get("toAddress");
		String type = req.get("type");
		if(type.equals("0")) {
			Mail.getInstance().sendText(title, content, toAddress);
		} else if(type.equals("1")) {
			String path = req.get("path");
			Mail.getInstance().sendHTML(title, content, toAddress, path);
		}
		renderResult(true);
	}
	
	/**
	 * 添加人员
	 */
	@RequestMapping(value = "/add", method = { RequestMethod.POST, RequestMethod.GET })
	public void add() {
		emailService.add(getFormPage().get("toAddress"));
		renderResult(true);
	}
	
	/**
	 * 删除人员
	 */
	@RequestMapping(value = "/delete", method = { RequestMethod.POST, RequestMethod.GET })
	public String delete() {
		emailService.delete(getPara("id"));
		return "redirect:/email/list";
	}
	
	/**
	 * 跳转到发送邮件页面
	 */
	@RequestMapping(value = "/toSend/{id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView toSend(@PathVariable String id) {
		Map<String, Object> data = emailService.getEmailById(id);
		return new ModelAndView("sys/email_send",data);
	}
	
	/**
	 * 跳转到人员添加页面
	 */
	@RequestMapping(value = "/toAdd", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView toAdd() {
		return new ModelAndView("sys/email_add");
	}
}
