package com.eazy.brush.service;

import java.util.List;
import java.util.Map;

import com.eazy.brush.model.Log;

public interface LogService {

	void save(Log log);
	List<Map<String,Object>> selectLog();
	List<Map<String, Object>> selectLog(String beginTime,String endTime);
}
