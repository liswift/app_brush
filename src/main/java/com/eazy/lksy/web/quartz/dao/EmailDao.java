package com.eazy.lksy.web.quartz.dao;

import java.util.List;
import java.util.Map;

import com.eazy.lksy.web.core.dao.ZQ;


public class EmailDao {

	public static List<Map<String, Object>> selectEmail() {
		return ZQ.commonResult("select * from mail where status=1 order by id desc");
	}

	public static List<Map<String, Object>> selectLog(String date) {
		return ZQ.commonResult("select * from log where create_date like '" + date + "%' ");
	}
	
	public static List<Map<String, Object>> selectLogCount(String beginTime,String endTime) {
		return ZQ.commonResult("select * from log where create_date >= '"+beginTime+"'  AND create_date <= '"+endTime+"' ");
	}
}
