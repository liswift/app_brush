package com.eazy.lksy.web.service;

import java.util.List;
import java.util.Map;

import com.eazy.lksy.web.core.dao.CommonDao;

public interface AreaService extends CommonDao {
	
	public void addArea(String area_name, String city_id);
	
	public void deleteArea(String areaid);
	
	public void updateArea(Map<String,String> map) ;

	public List<Map<String, Object>> selectArea(String city_id);
}
