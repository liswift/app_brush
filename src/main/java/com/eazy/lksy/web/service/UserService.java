package com.eazy.lksy.web.service;  
  
import java.util.List;  
import java.util.Map;

import com.eazy.lksy.web.core.dao.CommonDao;
import com.eazy.lksy.web.model.User;

  
public interface UserService extends CommonDao {  
  
    public List<Map<String,Object>> selectUser();  
    
    public Map<String,Object> getUserByName(String name);
    
    public User login(User user);
    
    public void delete(String id);
    
    public void update(User user);
    

    
    public void addUserRole(String cust_id,String role_id);
    
    public void add(User user);
} 