package com.eazy.lksy.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazy.lksy.core.annotation.Table;
import com.eazy.lksy.web.core.dao.CommonServiceImpl;
import com.eazy.lksy.web.dao.AreaDao;
import com.eazy.lksy.web.service.AreaService;

@Service
@Table(name = "area") // 区域表
public class AreaServiceImpl extends CommonServiceImpl implements AreaService {

	@Autowired
	private AreaDao areaDao; 
	
	@Override
	public List<Map<String, Object>> selectArea(String city_id) {
		return areaDao.selectArea(city_id);
	}

	@Override
	public void addArea(String area_name, String city_id) {
		areaDao.addArea(area_name, city_id);
	}

	@Override
	public void updateArea(Map<String, String> map) {
		areaDao.updateArea(map);
	}

	@Override
	public void deleteArea(String areaid) {
		areaDao.deleteArea(areaid);
	}

}
