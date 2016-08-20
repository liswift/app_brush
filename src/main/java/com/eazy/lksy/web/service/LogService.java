package com.eazy.lksy.web.service;

import java.util.List;
import java.util.Map;

import com.eazy.lksy.web.model.Log;

public interface LogService {

	public void save(Log log);
	public List<Map<String,Object>> selectLog();
	public List<Map<String, Object>> selectLog(String beginTime,String endTime);
}
