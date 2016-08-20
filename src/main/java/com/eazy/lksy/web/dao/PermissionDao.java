package com.eazy.lksy.web.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.eazy.lksy.web.core.dao.BaseDao;
import com.eazy.lksy.web.core.dao.ZQ;

@Repository
public class PermissionDao extends BaseDao {

	/**
	 *  查询用户列表
	 *  用户拥有的权限
	 */
	public List<Map<String, Object>> permissionList(String currentUserId) {
		String sql =  " SELECT p.* FROM permission p "
				+ " INNER JOIN role_permission rp ON p.ID=rp.PERMISSION_ID "
				+ " INNER JOIN role r ON  r.id=rp.ROLE_ID "
				+ " INNER JOIN user_role  ur ON ur.ROLE_ID =rp.ROLE_ID "
				+ " INNER JOIN user u ON u.id = ur.USER_ID "
				+ " WHERE u.id=? ORDER BY p.sort";
		return dao.queryForList(sql,currentUserId);
	}
	
	/**
	 * 获取所有目录
	 */
	public List<Map<String, Object>> permissionMenu() {
		String sql =  " SELECT p.* FROM permission p  WHERE pid IS NULL ORDER BY p.sort ";
		return dao.queryForList(sql);
	}
	
	/**
	 * 查询子菜单
	 */
	public List<Map<String, Object>> permissionSubMenu(String pid) {
		String sql =  " SELECT p.* FROM permission p  WHERE pid=? ORDER BY p.sort ";
		return dao.queryForList(sql,pid);
	}
	
	/**
	 * 查询拥有的权限
	 */
	public List<Map<String, Object>> permissionAllList() {
		String sql =  " SELECT p.* FROM permission p "
				+ "  ORDER BY p.sort";
		return dao.queryForList(sql);
	}
	
	/**
	 * 添加权限
	 */
	public String addMenu(Map<String,String> map) {
		String sql = "insert into permission(NAME,DESCRIPTION,url) values(?,?,?)";
		//dao.update(sql,new Object[]{"F",map.get("name")});
		return ZQ.commonInsertAndGeneryKey(sql, map.get("name"),map.get("desc"),map.get("path"));
	}
	
	public boolean updateMenu(Map<String,String> map) {
		String sql = "update permission set url=?,NAME=?,DESCRIPTION=? where id=?";
		return dao.update(sql, map.get("path"),map.get("name"),map.get("desc"),map.get("id")) == 1;
	}
	
	public void addSubMenu(Map<String,String> map) {
		String sql = "insert into permission(pid,NAME,DESCRIPTION,url) values(?,?,?,?)";
		//dao.update(sql,new Object[]{"F",map.get("name")});
		ZQ.commonInsertAndGeneryKey(sql,map.get("pid"),map.get("name"),map.get("desc"),map.get("path"));
	}
	
	public void addPermission(Map<String,String> map) {
		String sql = "insert into permission(pid,name,PERM_CODE,DESCRIPTION) values(?,?,?,?)";
		dao.update(sql, map.get("pid"),map.get("name"),map.get("code"),map.get("desc"));
	}
	
	public void updatePermission(Map<String,String> map) {
		String sql = "update permission set name=?,PERM_CODE=?,DESCRIPTION=? where id=?";
		dao.update(sql,map.get("name"),map.get("code"),map.get("desc"),map.get("id"));
	}
	
	public void updateSubMenu(Map<String,String> map) {
		String sql = "update  permission set pid=?,NAME=?,DESCRIPTION=?,url=? where id=?";
		//dao.update(sql,new Object[]{"F",map.get("name")});
		ZQ.commonInsertAndGeneryKey(sql,map.get("pid"),map.get("name"),map.get("desc"),map.get("path"),map.get("id"));
	}
	
	public void addRolePermission(Map<String,String> map) {
		String sql = "";
	}

	public List<Map<String, Object>> permissions(String role_id) {
		String sql = "SELECT p.* FROM role_permission rp , permission p WHERE rp.PERMISSION_ID = p.id AND rp.ROLE_ID = ?";
		return dao.queryForList(sql,role_id);
	}
	
	public Map<String,Object> getPermission(String id) {
		return queryForMap("select * from permission where id=?", id);
	}
	
	/**
	 * 删除子菜单
	 */
	public void delsubmenu(String sid) {
		String sql = "delete from permission where ID=?";
		dao.update(sql,sid);
	}
	
	/**
	 * 先删除关联表
	 */
	public void fksubmenu(String id) {
		String sql = "delete from role_permission where PERMISSION_ID=?";
		dao.update(sql, id);
	}
	
	public void deleteRolePermission(String role_id) {
		String sql = "delete from role_permission where ROLE_ID=?";
		dao.update(sql, role_id);
	}
	
	
	public List<Map<String,Object>> getMenuPermission(String pid) {
		return dao.queryForList("select * from permission where id=?",pid);
	}
	public List<Map<String,Object>> getSubMenuPermission(String pid) {
		return dao.queryForList("select * from permission where pid=?",pid);
	}
}
