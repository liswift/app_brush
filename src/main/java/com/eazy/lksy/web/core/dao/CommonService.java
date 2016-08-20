package com.eazy.lksy.web.core.dao;

import java.util.List;
import java.util.Map;

public interface CommonService {
	
	public List<Map<String, Object>> getListMap(String sql);
	
	public Map<String,Object> getMap(String sql);
	
	public List<Map<String,Object>> select();
	
	public Map<String,Object> getResultFromId(String id);
}
