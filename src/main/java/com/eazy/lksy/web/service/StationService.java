package com.eazy.lksy.web.service;

import java.util.List;
import java.util.Map;

import com.eazy.lksy.web.core.dao.CommonDao;

public interface StationService extends CommonDao {

	public void deleteStation(String stationId);
	
	public void addStation(Map<String,String> map);
	
	public void updateStation(Map<String,String> map);
	
	public List<Map<String, Object>> selectStation(String id);
}
