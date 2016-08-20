package com.eazy.lksy.web.quartz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.apache.log4j.Logger;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.eazy.lksy.web.email.Email;
import com.eazy.lksy.web.email.MailBean;
import com.eazy.lksy.web.quartz.dao.EmailDao;
import com.eazy.lksy.web.utils.ApplicationContextUtils;
import com.eazy.lksy.web.utils.DateUtils;
import com.eazy.lksy.web.utils.StrKit;

/**
 * @author jzx
 * @date 2016.05.19 23:42:39
 * @desc 邮件定时发送
 * spring email 存在执行超时错误
 */
@DisallowConcurrentExecution
public class SpringEmailQuartz implements Job {

	private static final Logger logger = Logger.getLogger(SpringEmailQuartz.class);    
	

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		logger.debug("mail quartz 定时执行 ！！！！");
		
		StringBuffer html = new StringBuffer(new Email().readTemplate());
		
		MailBean mailBean = new MailBean();  
        mailBean.setFrom("testlksy@163.com");  
        mailBean.setSubject("系统访问量统计");  
        List<Map<String, Object>> process = EmailDao.selectEmail();
        mailBean.setToEmails(StrKit.converStr(process, "name"));  
        mailBean.setTemplate(html.toString());  
        
        StringBuffer date = new StringBuffer();
        for(String hour :  DateUtils.getHour()) {
        	date.append("<th>"+hour+"</th>");
        }
        
        StringBuffer content = new StringBuffer();
        String emailTime []  = DateUtils.getEmailTime();
		for (String date_ : emailTime) {
			content.append("<tr> " + " <td> " + date_ + "</td> ");
			String hour[] = DateUtils.getHour();
			String newHour[] = new String[25];
			System.arraycopy(hour, 0, newHour, 0, hour.length);
			newHour[newHour.length - 1] = "00:00";
			List<Map<String, Object>> s = EmailDao.selectLog(date_);
			for (int i = 0; i < newHour.length - 1; i++) {
				List<Map<String, Object>> c = EmailDao.selectLogCount(date_ + " " + newHour[i],date_ + " " + newHour[i + 1]);
				content.append(" <td> " + c.size() + "</td> ");
			}
			content.append("<td>" + s.size() + "</td></tr>");
		}
    	
        Map map = new HashMap();  
        map.put("date",date);  
        map.put("content",content);  
        mailBean.setData(map);  
        
        try {
        	ApplicationContextUtils context1 = new ApplicationContextUtils("spring-email.xml");
        	Email email = (Email) context1.getBean("email");
			email.send(mailBean);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
