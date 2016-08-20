package com.eazy.lksy.web.core.dao;

import java.sql.Connection;
import java.sql.ParameterMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;



/**
 * db 简单封装
 * @author jzx
 * @date 2016/2/2 
 */
public class ZQ {

    private volatile static boolean pmdKnownBroken = false;
	
	//------------ 修改
	public static void commonUpdate(String sql,String id) {
		try {
			Connection conn = DbConn.getConn();
			PreparedStatement stmt = conn.prepareStatement(sql);
			fillStatement(stmt, id);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void commonUpdate(String sql,Object ... args) {
		try {
			Connection conn = DbConn.getConn();
			PreparedStatement stmt = conn.prepareStatement(sql);
			fillStatement(stmt, args);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// ----------- 删除
	public static void commonDelete(String TableName,String primaryKey) {
		try {
			Connection conn = DbConn.getConn();
			PreparedStatement stmt = conn.prepareStatement("delete  from " + TableName + " where id=" + primaryKey);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void commonDelete(String sql,Object ... args) {
		try {
			Connection conn = DbConn.getConn();
			PreparedStatement stmt = conn.prepareStatement(sql);
			fillStatement(stmt, args);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//------------ 添加
	public static void commonInsert(String sql) {
		try {
			Connection conn = DbConn.getConn();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void commonInsert(String sql,Object ... args) {
		try {
			Connection conn = DbConn.getConn();
			PreparedStatement stmt = conn.prepareStatement(sql);
			fillStatement(stmt, args);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static String commonInsertAndGeneryKey(String sql,Object ... args) {
		try {
			Connection conn = DbConn.getConn();
			PreparedStatement stmt = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS); 
			fillStatement(stmt, args);
			stmt.executeUpdate();
			ResultSet rs  = stmt.getGeneratedKeys();  
	        if(rs.next())
	        	return rs.getObject(1).toString();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	

	//------------ 查询
	public static List<Map<String, Object>> commonResult(String sql,Object... params) {
		Connection conn = null;
		try {
			 conn = DbConn.getConn();
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			List<Map<String,Object>> maps = Lists.newArrayList();
			fillStatement(stmt, params);
			 
			while(rs.next()) {
		        ResultSetMetaData rsmd = rs.getMetaData();
		        int cols = rsmd.getColumnCount();
	
		        Map<String,Object> result = Maps.newHashMap();
		        for (int i = 1; i <= cols; i++) {
		            String columnName = rsmd.getColumnLabel(i);
		            if (null == columnName || 0 == columnName.length()) {
		              columnName = rsmd.getColumnName(i);
		            }
		            result.put(columnName, rs.getObject(i));
		        }
		        maps.add(result);
			}
			return maps;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	  public static void fillStatement(PreparedStatement stmt, Object... params)
	            throws SQLException {

	        // check the parameter count, if we can
	        ParameterMetaData pmd = null;
	        if (!pmdKnownBroken) {
	            pmd = stmt.getParameterMetaData();
	            int stmtCount = pmd.getParameterCount();
	            int paramsCount = params == null ? 0 : params.length;

	            if (stmtCount != paramsCount) {
	                throw new SQLException("Wrong number of parameters: expected "
	                        + stmtCount + ", was given " + paramsCount);
	            }
	        }

	        // nothing to do here
	        if (params == null) {
	            return;
	        }

	        for (int i = 0; i < params.length; i++) {
	            if (params[i] != null) {
	                stmt.setObject(i + 1, params[i]);
	            } else {
	                // VARCHAR works with many drivers regardless
	                // of the actual column type. Oddly, NULL and
	                // OTHER don't work with Oracle's drivers.
	                int sqlType = Types.VARCHAR;
	                if (!pmdKnownBroken) {
	                    try {
	                        /*
	                         * It's not possible for pmdKnownBroken to change from
	                         * true to false, (once true, always true) so pmd cannot
	                         * be null here.
	                         */
	                        sqlType = pmd.getParameterType(i + 1);
	                    } catch (SQLException e) {
	                        pmdKnownBroken = true;
	                    }
	                }
	                stmt.setNull(i + 1, sqlType);
	            }
	        }
	    }
}
