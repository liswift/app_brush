package com.eazy.lksy.web.service;

import java.util.List;
import java.util.Map;

import com.eazy.lksy.web.core.dao.CommonService;

public interface PermissionService extends CommonService {

	public List<Map<String, Object>> permissionAllList();
	
	public List<Map<String,Object>> permissionList(String currentUserId);
	
	public String addMenu(Map<String,String> map);
	
	public void addPermission(Map<String,String> map);
	
	public void updatePermission(Map<String,String> map);
	
	public void addRolePermission(Map<String,String> map);
	
	public void delsubmenu(String sid);
	
	public void updateSubMenu(Map<String,String> map);
	
	public boolean updateMenu(Map<String,String> map);
	
	public void fksubmenu(String id);
	
	public void addSubMenu(Map<String,String> map);
	
	public Map<String,Object> getPermission(String id);
	
	public List<Map<String, Object>> permissionMenu();
	
	public List<Map<String, Object>> permissionSubMenu(String pid);
	
	public List<Map<String,Object>> permissions(String role_id);
	
	public List<Map<String,Object>> getMenuPermission(String pid);
	
	public List<Map<String,Object>> getSubMenuPermission(String pid);
	
	public void deleteRolePermission(String role_id);
	
}
