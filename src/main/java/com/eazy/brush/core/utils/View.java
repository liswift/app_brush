package com.eazy.brush.core.utils;


import org.springframework.web.servlet.ModelAndView;

public class View extends ModelAndView {

	public View() {
	}
	
	public View(String viewName, String modelName, Object modelObject) {
		super(viewName, modelName, modelObject);
	}
	
	public static void main(String[] args) {
		System.out.println(new View());
	}
}
