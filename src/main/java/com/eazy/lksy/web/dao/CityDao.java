package com.eazy.lksy.web.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.eazy.lksy.web.core.dao.BaseDao;
import com.eazy.lksy.web.utils.StrKit;

@Repository
public class CityDao extends BaseDao {

	public List<Map<String, Object>> selectCity() {
		return dao.queryForList("select * from city where status=0 order by city.id asc");
	}
	
	public void delete(String city_id,String status) {
		dao.update("update city set status=? where id=?", status,city_id);
	}
	
	public void addCity(Map<String, String> map) {
		StrKit.mapValue(map);
		String sql = "insert into city(name,city.`desc`) values(?,?)";
		dao.update(sql, map.get("name"),map.get("desc"));
	}
	
	public void updateCity(Map<String, String> map) {
		String sql = "update city set name=?,city.`desc`=? where id=?";
		dao.update(sql, map.get("name"),map.get("desc"),map.get("id"));
	}
	
	public Map<String,Object> selectColumnExis(String col_name) {
		String sql = "select * from city where name=?";
		return queryForMap(sql,col_name);
	}
		
}
