package com.eazy.brush.service;

import java.util.List;
import java.util.Map;

import com.eazy.brush.dao.common.CommonDao;
import com.eazy.brush.model.User;


public interface UserService extends CommonDao {

    List<Map<String, Object>> selectUser();

    Map<String, Object> getUserByName(String name);

    User login(User user);

    void delete(String id);

    void update(User user);

    void addUserRole(String cust_id, String role_id);

    void add(User user);
} 