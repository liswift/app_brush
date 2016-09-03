package com.eazy.brush.dao.common;

import com.eazy.brush.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.*;

import java.util.Collection;
import java.util.List;
import java.util.Map;

@SuppressWarnings("deprecation")
public abstract class BaseDao {

	@Autowired
	protected JdbcTemplate dao;


	public JdbcTemplate getDao() {
		return dao;
	}
	
	public DB getDB() {
		return new DB();
	}

	public User findViewById(String id) {
		String sql = "select * from user where name=? and password=?";
		RowMapper<User> rm = BeanPropertyRowMapper.newInstance(User.class);
		return dao.queryForObject(sql, rm, new Object[] { id });
	}

	public Map<String, Object> findViewById(String tableName, String id) {
		String sql = "select * from " + tableName + " where id=?";
		return new DB().queryForMap(sql, id);
	}

	public Map<String, Object> queryForMap(String sql, Object... args) {
		return new DB().queryForMap(sql, args);
	}

	class DB {
		protected PreparedStatementSetter newArgPreparedStatementSetter(Object[] args) {
			return new ArgumentPreparedStatementSetter(args);
		}

		public <T> Map<String, Object> queryForMap(String sql, Object... args) {
			return queryForObject(sql, args, getColumnMapRowMapper());
		}

		public <T> T queryForObject(String sql, Object[] args, RowMapper<T> rowMapper) throws DataAccessException {
			List<T> results = query(sql, args, new RowMapperResultSetExtractor<T>(rowMapper, 1));
			return requiredSingleResult(results);
		}

		public <T> T query(String sql, Object[] args, ResultSetExtractor<T> rse) throws DataAccessException {
			return query(sql, newArgPreparedStatementSetter(args), rse);
		}

		public <T> T query(String sql, PreparedStatementSetter pss, ResultSetExtractor<T> rse)
				throws DataAccessException {
			return getDao().query(sql, pss, rse);
		}

		protected RowMapper<Map<String, Object>> getColumnMapRowMapper() {
			return new ColumnMapRowMapper();
		}

		public <T> T requiredSingleResult(Collection<T> results) throws IncorrectResultSizeDataAccessException {
			int size = (results != null ? results.size() : 0);
			if (size == 0) {
				return null;
			}
			if (results.size() > 1) {
				throw new IncorrectResultSizeDataAccessException(1, size);
			}
			return results.iterator().next();
		}
	}

}
