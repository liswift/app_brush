package com.eazy.lksy.web.service;

import java.util.List;
import java.util.Map;

public interface RoleService {

	public List<Map<String, Object>> selectRole();
	
	public void addRolePermission(String role_id,String permission_id);
	
	public String addRole(Map<String,String> map);
	
	public Map<String,Object> getRole(String role_id);
	
    public void deleteUserRole(String user_id);
    
    public void updateRole(Map<String,String> map);
	
	public List<Map<String,Object>> getRoles(String cust_id);
	
	public List<Map<String, Object>> getRolePermissions(String id);
}
