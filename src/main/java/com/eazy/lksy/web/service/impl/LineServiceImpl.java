package com.eazy.lksy.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazy.lksy.web.core.dao.CommonServiceImpl;
import com.eazy.lksy.web.dao.LineDao;
import com.eazy.lksy.web.service.LineService;

@Service
public class LineServiceImpl extends CommonServiceImpl implements LineService {

	@Autowired
	private LineDao lineDao;
	
	@Override
	public List<Map<String, Object>> selectLineName(Map<String,String> map) {
		return lineDao.selectLineName(map);
	}

	@Override
	public void deleteLine(String line_id) {
		lineDao.deleteLine(line_id);
	}

	@Override
	public boolean isExists(String city_id, String line_name) {
		return lineDao.isExists(city_id, line_name);
	}

	@Override
	public void addLineName(Map<String, String> map) {
		lineDao.addLineName(map);
	}

	@Override
	public void updateLineName(Map<String, String> map) {
		lineDao.updateLineName(map);
	}

	@Override
	public List<Map<String, Object>> selectLine(String city_id) {
		return lineDao.selectLine(city_id);
	}

}
