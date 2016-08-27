package com.eazy.brush.core.mapping;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.HandlerExecutionChain;
import org.springframework.web.servlet.HandlerMapping;

public class UrlJessionId implements HandlerMapping {

	@Override
	public HandlerExecutionChain getHandler(HttpServletRequest request) throws Exception {
		return null;
	}

}
