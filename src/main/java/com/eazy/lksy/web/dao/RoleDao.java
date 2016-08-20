package com.eazy.lksy.web.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.eazy.lksy.web.core.dao.BaseDao;
import com.eazy.lksy.web.core.dao.ZQ;

@Repository
public class RoleDao extends BaseDao {

	public List<Map<String, Object>> selectRole() {
		return dao.queryForList("select * from role");
	}
	
	public void updateRole(Map<String,String> map) {
		String sql = "update role set name=?,role_code=?,DESCRIPTION=? where id=?";
		dao.update(sql, map.get("name"),map.get("name"),map.get("desc"),map.get("id"));
	}
	
	public void addRolePermission(String role_id,String permission_id) {
		String sql = "insert into role_permission(ROLE_ID,PERMISSION_ID) values(?,?)";
		dao.update(sql, role_id,permission_id);
	}
	
	/**
	 * 添加角色
	 */
	public String addRole(Map<String,String> map) {
		String sql = "insert into role(name,role_code,DESCRIPTION) values(?,?,?)";
		return ZQ.commonInsertAndGeneryKey(sql, map.get("name"),map.get("name"),map.get("desc"));
	}
	
	/**
	 * 获取角色拥有的权限ID集合
	 */
	public List<Map<String, Object>> getRolePermissions(String id) {
		String sql = "SELECT p.* FROM role_permission rp INNER JOIN permission p ON rp.`PERMISSION_ID` = p.`ID` WHERE rp.`ROLE_ID` = ?";
		return dao.queryForList(sql,id);
	}

	public List<Map<String, Object>> getRoles(String cust_id) {
		String sql = "SELECT r.* FROM user_role ur, role r WHERE ur.role_id = r.id AND ur.user_id=?";
		return dao.queryForList(sql, cust_id);
	}
	
	public void deleteUserRole(String user_id) {
		String sql = "delete from user_role where user_id=?";
		dao.update(sql, user_id);
	}
	
	public Map<String,Object> getRole(String role_id) {
		String sql = "select * from role where id=?";
		return queryForMap(sql, role_id);
	}
}
