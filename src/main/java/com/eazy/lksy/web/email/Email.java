package com.eazy.lksy.web.email;  
  
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringWriter;  
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

import javax.mail.MessagingException;  
import javax.mail.internet.MimeMessage;  
  
import org.apache.log4j.Logger;  
import org.apache.velocity.VelocityContext;  
import org.apache.velocity.app.VelocityEngine;  
import org.apache.velocity.exception.VelocityException;  
import org.springframework.mail.javamail.JavaMailSender;  
import org.springframework.mail.javamail.MimeMessageHelper;  
  
/** 
 * spring发送mail工具 
 * @author: haleywang,@created on: 2012-9-20 
 */  
public class Email {  
  
    Logger log = Logger.getLogger(Email.class);  
      
    private JavaMailSender javaMailSender;  
    private VelocityEngine velocityEngine;          //模板解析  
    
      
    /** 
     * @param mailBean 
     * @return 
     * @throws MessagingException 
     */  
    public boolean send(MailBean mailBean) throws MessagingException {  
  
        MimeMessage msg = createMimeMessage(mailBean);  
        if(msg == null){  
            return false;  
        }  
          
        this.sendMail(msg, mailBean);  
          
        return true;  
    }  
      
    private void sendMail(MimeMessage msg, MailBean mailBean){  
                javaMailSender.send(msg);  
                log.info("$$$ Send mail Subject:" +  mailBean.getSubject()   
                        + ", TO:" + arrayToStr(mailBean.getToEmails()) );  
  
    }  
      
    /* 
     * 记日记用的 
     */  
    private String arrayToStr(String[] array){  
        if(array == null || array.length == 0){  
            return null;  
        }  
        StringBuffer sb = new StringBuffer();  
        for(String str : array){  
            sb.append(str+" , ") ;  
        }  
        return sb.toString();  
    }  
  
    /*  
     * 根据 mailBean 创建 MimeMessage 
     */  
    private MimeMessage createMimeMessage(MailBean mailBean) throws MessagingException {  
        if (!checkMailBean(mailBean)) {  
            return null;  
        }  
        String text = getMessage(mailBean);  
        if(text == null){  
            log.warn("@@@ warn mail text is null (Thread name="   
                    + Thread.currentThread().getName() + ") @@@ " +  mailBean.getSubject());  
            return null;  
        }  
        MimeMessage msg = javaMailSender.createMimeMessage();  
        MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");  
        //messageHelper.setFrom(mailBean.getFrom());  
        try {  
            messageHelper.setFrom(mailBean.getFrom(), mailBean.getFromName());  
        } catch (UnsupportedEncodingException e) {  
            log.error(e);  
  
        }  
        messageHelper.setSubject(mailBean.getSubject());  
        messageHelper.setTo(mailBean.getToEmails());  
        messageHelper.setText(text, true); // html: true  
          
        return msg;  
    }  
      
    /* 
     * 模板解析 
     * @param mailBean 
     * @return 
     */  
    private String getMessage(MailBean mailBean) {  
        StringWriter writer = null;  
        try {  
  
            writer = new StringWriter();  
            VelocityContext context = new VelocityContext(mailBean.getData());  
  
            velocityEngine.evaluate(context, writer, "", mailBean.getTemplate());  
  
            return writer.toString();  
        } catch (VelocityException e) {  
            log.error(" VelocityException : " + mailBean.getSubject() + "\n" + e);  
        } catch (IOException e) {  
            log.error(" IOException : " + mailBean.getSubject() + "\n" + e);  
        } finally {  
            if (writer != null) {  
                try {  
                    writer.close();  
                } catch (IOException e) {  
                    log.error("###StringWriter close error ... ");  
                }  
            }  
        }  
        return null;  
    }  
      
    /* 
     * check 邮件 
     */  
    private boolean checkMailBean(MailBean mailBean){  
        if (mailBean == null) {  
            log.warn("@@@ warn mailBean is null (Thread name="   
                    + Thread.currentThread().getName() + ") ");  
            return false;  
        }  
        if (mailBean.getSubject() == null) {  
            log.warn("@@@ warn mailBean.getSubject() is null (Thread name="   
                    + Thread.currentThread().getName() + ") ");  
            return false;  
        }  
        if (mailBean.getToEmails() == null) {  
            log.warn("@@@ warn mailBean.getToEmails() is null (Thread name="   
                    + Thread.currentThread().getName() + ") ");  
            return false;  
        }  
        if (mailBean.getTemplate() == null) {  
            log.warn("@@@ warn mailBean.getTemplate() is null (Thread name="   
                    + Thread.currentThread().getName() + ") ");  
            return false;  
        }  
        return true;  
    }  
  
      
    /*===================== setter & getter =======================*/  
    public void setJavaMailSender(JavaMailSender javaMailSender) {  
        this.javaMailSender = javaMailSender;  
    }  
  
    public void setVelocityEngine(VelocityEngine velocityEngine) {  
        this.velocityEngine = velocityEngine;  
    }  
  
    public StringBuffer readTemplate() {
    	try {
    		StringBuffer stringBuffer = new StringBuffer();
			InputStream is = this.getClass().getResourceAsStream("/velocity/emailTemplate.html");
			BufferedReader reader = new BufferedReader(new InputStreamReader(is, Charset.defaultCharset()));
			String tempString = null;
			while ((tempString = reader.readLine()) != null) {
				stringBuffer.append(tempString);
			}
			return stringBuffer;
		} catch (IOException e) {
			e.printStackTrace();
		}
    	return null;
    }
}  