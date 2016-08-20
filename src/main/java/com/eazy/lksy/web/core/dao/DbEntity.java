package com.eazy.lksy.web.core.dao;

import java.util.HashMap;
import java.util.Map;

public class DbEntity extends HashMap<String, Object> implements Map<String,Object> {

	private static final long serialVersionUID = -4397169135713755508L;

	public DbEntity() {
	}
	
	public DbEntity set(String key,Object value) {
		put(key, value);
		return this;
	}
	
	public Object getAttr(String key) {
		return get(key);
	}
	
}
