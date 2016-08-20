package com.eazy.lksy.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazy.lksy.web.dao.LogDao;
import com.eazy.lksy.web.model.Log;
import com.eazy.lksy.web.service.LogService;
@Service
public class LogServiceImpl implements LogService {

	/**
	 * 2016/3/14 19:37
	 * 新添加功能
	 */
	@Autowired 
	private LogDao logDao;

	@Override
	public List<Map<String, Object>> selectLog() {
		return logDao.selectLog();
	}

	@Override
	public void save(Log log) {
		logDao.save(log);
	}

	@Override
	public List<Map<String, Object>> selectLog(String beginTime, String endTime) {
		return logDao.selectLog(beginTime, endTime);
	}
	
	
}
