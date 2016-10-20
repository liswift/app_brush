package com.eazy.brush.service;

import com.eazy.brush.dao.common.CommonDao;
import com.eazy.brush.model.User;

import java.util.List;
import java.util.Map;


public interface UserService extends CommonDao {

    List<Map<String, Object>> selectUser();

    User getById(int userId);

    Map<String, Object> getUserByName(String name);

    User login(User user);

    void delete(String id);

    void update(User user);

    void addUserRole(String cust_id, String role_id);

    void add(User user);
} 