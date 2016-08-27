package com.eazy.brush.service;

import java.util.List;
import java.util.Map;

public interface RoleService {

    List<Map<String, Object>> selectRole();

    void addRolePermission(String role_id, String permission_id);

    String addRole(Map<String, String> map);

    Map<String, Object> getRole(String role_id);

    void deleteUserRole(String user_id);

    void updateRole(Map<String, String> map);

    List<Map<String, Object>> getRoles(String cust_id);

    List<Map<String, Object>> getRolePermissions(String id);
}
