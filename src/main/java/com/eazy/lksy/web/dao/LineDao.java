package com.eazy.lksy.web.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.eazy.lksy.web.core.dao.BaseDao;
import com.eazy.lksy.web.utils.StrKit;

@Repository
public class LineDao extends BaseDao {

	/**
	 * 查询线路名称
	 * @return
	 */
	public List<Map<String, Object>> selectLineName(Map<String,String> map) {
		String sql = "SELECT lne.`id`,c.`name`,lne.`name`  AS lname,lne.`create_time` FROM city c INNER JOIN line_name lne ON c.`id` = lne.`city_id` where 1=1 ";
		if(StrKit.notEmpty(map.get("cityid"))) {
			sql += " and c.id=" + map.get("cityid");
		}
		if(StrKit.notEmpty(map.get("begintime")) && StrKit.notEmpty(map.get("endtime"))) {
			sql += " and lne.create_time>='" + map.get("begintime") + "' and lne.create_time<='" + map.get("endtime") + "' ";
		}
		sql += " order by c.id asc";
		return dao.queryForList(sql);
	}
	
	public List<Map<String, Object>> selectLine(String city_id) {
		String sql = "select * from line_name where city_id=?";
		return dao.queryForList(sql,city_id);
	}
	
	/**
	 * 删除线路
	 */
	public void deleteLine(String line_id) {
		String sql = "delete from line_name where id=?";
		dao.update(sql, line_id);
	}
	
	/**
	 * 查看线路是否存在
	 */
	public boolean isExists(String city_id,String line_name) {
		String sql = "SELECT * FROM line_name  where city_id=? and name=?";
		Map<String,Object> result = queryForMap(sql, city_id,line_name);
		return result != null ? false : true;
	}
	
	/**
	 * 添加线路
	 */
	public void addLineName(Map<String,String> map) {
		String sql = "insert into line_name(name,city_id) values(?,?)";
		dao.update(sql, map.get("name"),map.get("cityid"));
	}
	
	/**
	 * 修改线路
	 */
	public void updateLineName(Map<String,String> map) {
		String sql = "update line_name set name=?,city_id=? where id=?";
		dao.update(sql, map.get("name"),map.get("cityid"),map.get("id"));
	}
}
