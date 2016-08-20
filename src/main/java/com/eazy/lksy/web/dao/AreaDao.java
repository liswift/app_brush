package com.eazy.lksy.web.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.eazy.lksy.web.core.dao.BaseDao;

@Repository
public class AreaDao extends BaseDao {

	public List<Map<String, Object>> selectArea(String city_id) {
		return dao.queryForList("select * from area where city_id=?",city_id);
	}
	
	public void addArea(String area_name,String city_id) {
		String sql = "insert into area(name,city_id) values(?,?)";
		dao.update(sql, area_name,city_id);
	}
	
	public void updateArea(Map<String,String> map) {
		String sql = "update area set name=? where id=?";
		dao.update(sql, map.get("name"),map.get("id"));
	}
	
	public void deleteArea(String areaid) {
		dao.update("delete from area where id=?",areaid);
	}
	
}
