package com.eazy.brush.service;

import java.util.List;
import java.util.Map;

import com.eazy.brush.service.common.CommonService;

public interface PermissionService extends CommonService {

    List<Map<String, Object>> permissionAllList();

    List<Map<String, Object>> permissionList(String currentUserId);

    String addMenu(Map<String, String> map);

    void addPermission(Map<String, String> map);

    void updatePermission(Map<String, String> map);

    void addRolePermission(Map<String, String> map);

    void delsubmenu(String sid);

    void updateSubMenu(Map<String, String> map);

    boolean updateMenu(Map<String, String> map);

    void fksubmenu(String id);

    void addSubMenu(Map<String, String> map);

    Map<String, Object> getPermission(String id);

    List<Map<String, Object>> permissionMenu();

    List<Map<String, Object>> permissionSubMenu(String pid);

    List<Map<String, Object>> permissions(String role_id);

    List<Map<String, Object>> getMenuPermission(String pid);

    List<Map<String, Object>> getSubMenuPermission(String pid);

    void deleteRolePermission(String role_id);

}
