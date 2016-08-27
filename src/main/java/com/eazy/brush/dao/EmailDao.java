package com.eazy.brush.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.eazy.brush.dao.common.BaseDao;

@Repository
public class EmailDao extends BaseDao  {

	public List<Map<String, Object>> selectEmail() {
		return dao.queryForList("select * from mail where status=1 order by id desc");
	}
	
	public List<Map<String, Object>> selectEmail(String date) {
		return dao.queryForList("select * from mail where create_date like='"+date+"%' ");
	}
	
	public Map<String, Object> getEmailById(String id) {
		return queryForMap("select * from mail where id=?", id); 
	}
	
	public void add(String name) {
		dao.update("insert into mail(name,status) values(?,?)", name,"1");
	}
	
	public void delete(String id) {
		dao.update("delete from mail where id=?", id);
	}
	
}
