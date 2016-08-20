package com.eazy.lksy.web.service;

import java.util.List;
import java.util.Map;

import com.eazy.lksy.web.core.dao.CommonDao;

public interface LineService extends CommonDao {
	
	public void deleteLine(String line_id);
	
	public boolean isExists(String city_id,String line_name);
	
	public void addLineName(Map<String,String> map);
	
	public void updateLineName(Map<String,String> map);
	
	public List<Map<String, Object>> selectLine(String city_id);

	public List<Map<String, Object>> selectLineName(Map<String,String> map);
	
}