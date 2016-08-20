package com.eazy.lksy.web.email;

import com.eazy.lksy.web.utils.Base64;
import com.eazy.lksy.web.utils.Bundle;

public class Mail {

	private static Mail config = new Mail();

	private Mail() {
	}

	public static Mail getInstance() {
		return config;
	}

	public void sendText(String title, String content, String toAddress) {
		SimpleMailSender sms = new SimpleMailSender();
		sms.sendTextMail(getConfig(title,content,toAddress,null)); // 发送文体格式
	}
	
	public void sendHTML(String title, String content, String toAddress,String path) {
		SimpleMailSender sms = new SimpleMailSender();
		sms.sendHtmlMail(getConfig(title,content,toAddress,path)); // 发送html格式
	}
	
	public void sendHTML(String title, String content, String toAddress) {
		SimpleMailSender sms = new SimpleMailSender();
		sms.sendHtmlMail(getConfig(title,content,toAddress,null)); // 发送html格式
	}
	
	private MailSenderInfo getConfig(String title, String content, String toAddress,String path)  {
		MailSenderInfo mailInfo = new MailSenderInfo("testlksy@163.com",toAddress,"testlksy@163.com",Bundle.convUTF8(Base64.decryptBASE64("dGVzdGxrc3kxMjM0"), "UTF-8"),title,content,path);
		mailInfo.setMailServerHost("smtp.163.com");
		mailInfo.setMailServerPort("25");
		mailInfo.setValidate(true);
		return mailInfo;
	}
}
