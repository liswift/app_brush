package com.eazy.lksy.web.service.impl;  
  
import java.util.List;  
import java.util.Map;  
  
import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Service;

import com.eazy.lksy.web.core.dao.CommonServiceImpl;
import com.eazy.lksy.web.dao.UserDao;
import com.eazy.lksy.web.model.User;
import com.eazy.lksy.web.service.UserService;  
  
  
@Service  
public class UserServiceImpl extends CommonServiceImpl implements UserService {  
  
    @Autowired  
    private UserDao userDao;  
      
    public List<Map<String, Object>> selectUser() {  
        return userDao.selectUser();  
    }

	@Override
	public User login(User user) {
		return userDao.login(user);
	}

	@Override
	public void delete(String id) {
		userDao.delete(id);
	}

	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public void add(User user) {
		userDao.add(user);
	}

	@Override
	public Map<String, Object> getUserByName(String name) {
		return userDao.getUserByName(name);
	}

	@Override
	public void addUserRole(String cust_id, String role_id) {
		userDao.addUserRole(cust_id, role_id);
	}

  
}  