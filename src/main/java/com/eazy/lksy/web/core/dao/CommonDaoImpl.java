package com.eazy.lksy.web.core.dao;

import java.util.List;
import java.util.Map;

import com.eazy.lksy.core.annotation.Table;

public class CommonDaoImpl extends BaseDao implements CommonDao {

	protected Table table;

	public CommonDaoImpl() {
		table = this.getClass().getAnnotation(Table.class);
	}
	
	@Override
	public Map<String, Object> findViewById(String tableName, String id) {
		return super.findViewById(tableName, id);
	}

	@Override
	public List<Map<String, Object>> getListMap(String sql) {
		return dao.queryForList(sql);
	}

	@Override
	public Map<String, Object> getMap(String sql) {
		return dao.queryForMap(sql);
	}

	@Override
	public List<Map<String, Object>> select() {
		return getDao().queryForList("select * from " + table.name());
	}

	@Override
	public Map<String, Object> getResultFromId(String id) {
		return getDB().queryForMap("select * from " + table.name() + " where id=?", id);
	}

}
