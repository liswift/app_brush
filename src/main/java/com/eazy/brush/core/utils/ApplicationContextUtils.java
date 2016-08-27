package com.eazy.brush.core.utils;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ApplicationContextUtils {

	private ClassPathXmlApplicationContext context;
	
	public ApplicationContextUtils(String xml) {
		context = new ClassPathXmlApplicationContext(xml);
	}
	public ApplicationContextUtils() {
	}
	
	public Object getBean(String beanName) {
		return context.getBean(beanName);
	}
	
}
