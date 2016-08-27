package com.eazy.brush.service.common;

import com.eazy.brush.dao.common.CommonDaoImpl;

import java.util.List;
import java.util.Map;

public class CommonServiceImpl extends CommonDaoImpl implements CommonService {

	@Override
	public List<Map<String, Object>> select() {
		return super.select();
	}

	@Override
	public Map<String, Object> getResultFromId(String id) {
		return super.getResultFromId(id);
	}

}
