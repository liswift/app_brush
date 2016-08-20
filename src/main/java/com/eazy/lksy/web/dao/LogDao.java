package com.eazy.lksy.web.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.eazy.lksy.web.core.dao.BaseDao;
import com.eazy.lksy.web.model.Log;
import com.eazy.lksy.web.utils.DateUtils;
import com.eazy.lksy.web.utils.StrKit;

@Repository
public class LogDao extends BaseDao {

	public List<Map<String, Object>> selectLog() {
		String sql = "select DATE_FORMAT(create_date, '%Y-%m-%d %H:%i:%s') AS tim,log.id as id,log.* from log order by CREATE_DATE desc ";
		return dao.queryForList(sql);
	}
	
	public List<Map<String, Object>> selectLog(String beginTime,String endTime) {
		String sql = "select DATE_FORMAT(create_date, '%Y-%m-%d %H:%i:%s') AS tim,log.* from log where 1=1 ";
		if(StrKit.notEmpty(beginTime) && StrKit.notEmpty(endTime)) {
			sql += " and CREATE_DATE>='" + beginTime + "' ";
			sql += " and CREATE_DATE<='" + endTime + "' ";
		} else {
			sql += " and CREATE_DATE like '" + DateUtils.getNowTime() + "%' ";
		}
		sql += " order by CREATE_DATE desc";
		return dao.queryForList(sql);
	}

	
	public void save(Log log) {
		String sql = "insert into log(OS,BROWSER,IP,CREATE_DATE) values(?,?,?,?)";
		dao.update(sql, log.getOs(),log.getBrowser(),log.getIp(),log.getCreateDate());
	}
}
