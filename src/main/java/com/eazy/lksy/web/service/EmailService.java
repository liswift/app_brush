package com.eazy.lksy.web.service;

import java.util.List;
import java.util.Map;

public interface EmailService {

	public Map<String, Object> getEmailById(String id);
	
	public void add(String name);
	
	public void delete(String id);
	
	public List<Map<String, Object>> selectEmail(String date);
	
	public List<Map<String, Object>> selectEmail();
}
