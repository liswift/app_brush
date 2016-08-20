package com.eazy.lksy.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazy.lksy.core.annotation.Table;
import com.eazy.lksy.web.core.dao.CommonServiceImpl;
import com.eazy.lksy.web.dao.CityDao;
import com.eazy.lksy.web.service.CityService;

@Service
@Table(name="city")
public class CityServiceImpl extends CommonServiceImpl implements CityService {

	@Autowired
	private CityDao cityDao;
	
	@Override
	public List<Map<String, Object>> selectCity() {
		return cityDao.selectCity();
	}

	@Override
	public void delete(String city_id, String status) {
		cityDao.delete(city_id, status);
	}

	@Override
	public void addCity(Map<String, String> map) {
		cityDao.addCity(map);
	}

	@Override
	public void updateCity(Map<String, String> map) {
		cityDao.updateCity(map);
	}

	@Override
	public Map<String, Object> selectColumnExis(String col_name) {
		return cityDao.selectColumnExis(col_name);
	}

}
