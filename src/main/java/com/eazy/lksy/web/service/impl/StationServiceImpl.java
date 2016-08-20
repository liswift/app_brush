package com.eazy.lksy.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazy.lksy.web.core.dao.CommonServiceImpl;
import com.eazy.lksy.web.dao.StationDao;
import com.eazy.lksy.web.service.StationService;

@Service
public class StationServiceImpl extends CommonServiceImpl implements StationService {

	@Autowired
	private StationDao stationDao;
	
	@Override
	public List<Map<String, Object>> selectStation(String id) {
		return stationDao.selectStation(id);
	}

	@Override
	public void addStation(Map<String, String> map) {
		stationDao.addStation(map);
	}

	@Override
	public void updateStation(Map<String, String> map) {
		stationDao.updateStation(map);
	}

	@Override
	public void deleteStation(String stationId) {
		stationDao.deleteStation(stationId);
	}
	
	

}
