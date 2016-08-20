package com.eazy.lksy.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazy.lksy.web.core.dao.CommonServiceImpl;
import com.eazy.lksy.web.dao.PermissionDao;
import com.eazy.lksy.web.service.PermissionService;

@Service
public class PermissionServiceImpl extends CommonServiceImpl implements PermissionService {

	@Autowired
	private PermissionDao permissionDao;
	
	@Override
	public List<Map<String, Object>> permissionList(String currentUserId) {
		return permissionDao.permissionList(currentUserId);
	}

	@Override
	public String addMenu(Map<String, String> map) {
		return permissionDao.addMenu(map);
	}

	@Override
	public List<Map<String, Object>> permissionAllList() {
		return permissionDao.permissionAllList();
	}

	@Override
	public List<Map<String, Object>> permissionMenu() {
		return permissionDao.permissionMenu();
	}

	@Override
	public List<Map<String, Object>> permissionSubMenu(String pid) {
		return permissionDao.permissionSubMenu(pid);
	}

	@Override
	public List<Map<String, Object>> permissions(String role_id) {
		return permissionDao.permissions(role_id);
	}

	@Override
	public void delsubmenu(String sid) {
		permissionDao.delsubmenu(sid);
	}

	@Override
	public void fksubmenu(String id) {
		permissionDao.fksubmenu(id);
	}

	@Override
	public List<Map<String, Object>> getMenuPermission(String pid) {
		return permissionDao.getMenuPermission(pid);
	}

	@Override
	public List<Map<String, Object>> getSubMenuPermission(String pid) {
		return permissionDao.getSubMenuPermission(pid);
	}

	@Override
	public void addRolePermission(Map<String, String> map) {
		permissionDao.addRolePermission(map);
	}

	@Override
	public Map<String, Object> getPermission(String id) {
		return permissionDao.getPermission(id);
	}

	@Override
	public boolean updateMenu(Map<String, String> map) {
		return permissionDao.updateMenu(map);
	}

	@Override
	public void addSubMenu(Map<String, String> map) {
		permissionDao.addSubMenu(map);
	}

	@Override
	public void updateSubMenu(Map<String, String> map) {
		permissionDao.updateSubMenu(map);
	}

	@Override
	public void deleteRolePermission(String role_id) {
		permissionDao.deleteRolePermission(role_id);
	}

	@Override
	public void addPermission(Map<String, String> map) {
		permissionDao.addPermission(map);
	}

	@Override
	public void updatePermission(Map<String, String> map) {
		permissionDao.updatePermission(map);
	}

}
