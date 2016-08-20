package com.eazy.lksy.web.service;

import java.util.List;
import java.util.Map;

import com.eazy.lksy.web.core.dao.CommonDao;

public interface CityService extends CommonDao {

	public List<Map<String, Object>> selectCity();

	public void addCity(Map<String, String> map);
	
	public void updateCity(Map<String, String> map);
	
	public void delete(String city_id,String status);
	
	public Map<String,Object> selectColumnExis(String col_name);
}
