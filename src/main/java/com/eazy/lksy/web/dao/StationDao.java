package com.eazy.lksy.web.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.eazy.lksy.web.core.dao.BaseDao;

@Repository
public class StationDao extends BaseDao {

	/**
	 * 查询站名
	 * @return
	 */
	public List<Map<String, Object>> selectStation(String id) {
		String sql = "SELECT * FROM line WHERE line_id=?";
		return dao.queryForList(sql,id);
	}
	
	/**
	 * 添加站名
	 */
	public void addStation(Map<String,String> map) {
		String sql = "insert into line(name,line_id) values(?,?)";
		dao.update(sql, map.get("name"),map.get("lineid"));
	}
	
	/**
	 * 修改站名
	 */
	public void updateStation(Map<String,String> map) {
		String sql = "update line set name=?,line_id=? where id=?";
		dao.update(sql, map.get("name"),map.get("lineid"),map.get("id"));
	}
	
	/**
	 * 删除站名
	 */
	public void deleteStation(String stationId) {
		String sql = "delete from line where id=?";
		dao.update(sql, stationId);
	}
}
