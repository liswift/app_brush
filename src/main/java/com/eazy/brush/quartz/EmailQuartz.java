package com.eazy.brush.quartz;


import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.eazy.brush.core.email.Mail;
import com.eazy.brush.dao.TzEmailDao;
import com.eazy.brush.core.utils.DateUtils;


/**
 * @author jzx
 * @date 2016.3.22
 * @desc 邮件定时发送
 */
@DisallowConcurrentExecution
public class EmailQuartz implements Job {

	private static final Logger logger = Logger.getLogger(EmailQuartz.class);    
	
	
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		StringBuffer html = new StringBuffer();
		html.append("" 
	+	"<html>"
	+	"<style type='text/css'>" 
		      +"table { "
		      +    "border-collapse:collapse;border:solid #999;border-width:1px 0 0 1px; text-align: center;" 
		      +"}" 
		      +"table th, table td {" 
		      +    "border:solid #999; border-width:0 1px 1px 0;padding:2px;"
		      + "}" 
		    +"</style>" 
	+	"<body>"
	+	"");
		html.append("<table border='1'>");
		html.append("	<tr> "
					+	" <th>日期</th> ");
						for(String hour :  DateUtils.getHour()) {
								html.append("<th>"+hour+"</th>");
						}
				html.append(" <th>总量</th> ");
				html.append(" </tr> ");
			String emailTime []  = DateUtils.getEmailTime();
			for(String date : emailTime) {
				html.append("<tr> "
						   + " <td> " + date + "</td> " );
							String hour [] = DateUtils.getHour();
							String newHour [] = new String[25];
							System.arraycopy(hour, 0, newHour, 0, hour.length);
							newHour[newHour.length - 1] = "00:00";
							List<Map<String, Object>> s = TzEmailDao.selectLog(date);
							for(int i=0; i< newHour.length - 1; i++) {
								List<Map<String, Object>> c = TzEmailDao.selectLogCount(date + " " + newHour[i], date + " " + newHour [i + 1]);
								html.append(" <td> " + c.size() + "</td> " );
							}
							html.append("<td>" + s.size() + "</td></tr>");
			}
			html.append("</table> "
						+ " </body> "
					+ "</html>");
		List<Map<String, Object>> process = TzEmailDao.selectEmail();
		for(int i =0; i< process.size() ; i ++) {
			Mail.getInstance().sendHTML("系统访问量统计", html.toString(), process.get(i).get("name") + "");
		}
	}
}
