package com.eazy.brush.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazy.brush.dao.RoleDao;
import com.eazy.brush.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;
	
	/**
	 * 查询所有角色
	 */
	@Override
	public List<Map<String, Object>> selectRole() {
		return roleDao.selectRole();
	}

	@Override
	public String addRole(Map<String, String> map) {
		return roleDao.addRole(map);
	}

	@Override
	public List<Map<String, Object>> getRolePermissions(String id) {
		return roleDao.getRolePermissions(id);
	}

	@Override
	public List<Map<String, Object>> getRoles(String cust_id) {
		return roleDao.getRoles(cust_id);
	}

	@Override
	public void deleteUserRole(String user_id) {
		roleDao.deleteUserRole(user_id);
	}

	@Override
	public void addRolePermission(String role_id, String permission_id) {
		roleDao.addRolePermission(role_id, permission_id);
	}

	@Override
	public Map<String, Object> getRole(String role_id) {
		return roleDao.getRole(role_id);
	}

	@Override
	public void updateRole(Map<String, String> map) {
		roleDao.updateRole(map);
	}
	

}
