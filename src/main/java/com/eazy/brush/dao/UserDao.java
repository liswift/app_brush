package com.eazy.brush.dao;

import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.eazy.brush.dao.common.BaseDao;
import com.eazy.brush.dao.common.ZQ;
import com.eazy.brush.model.User;
import com.eazy.brush.core.utils.MD5;

@Repository
public class UserDao extends BaseDao {
	
	/**
	 * 根据用户名查询用户信息
	 */
	public Map<String,Object> getUserByName(String name) {
		return queryForMap("select * from user where NAME=?", name);
	}

	/**
	 * 用户查询列表
	 * @return
	 */
	public List<Map<String, Object>> selectUser() {
		return dao.queryForList("select * from user");
	}

	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public User login(User user) {
		String sql = "select * from user where name=? and password=?";
		RowMapper<User> rm = BeanPropertyRowMapper.newInstance(User.class);
		return  dao.queryForObject(sql, rm, new Object[] { user.getName(), user.getPassword() });
	}
	

	/**
	 * 删除用户id
	 * @param id
	 */
	public void delete(String id) {
		dao.update("delete from user where id=?", id);
	}
	
	/**
	 * 修改用户
	 * @param user
	 */
	public void update(User user) {
		ZQ.commonUpdate("update user set password=? where id=?", new Object[]{MD5.encodeString(user.getPassword()),user.getId()});
	}
	
	/**
	 * 添加用户
	 */
	public void add(User user) {
		String sql = "insert into user(name,password,EMAIL) values(?,?,?)";
		dao.update(sql, new Object[]{user.getName(),MD5.encodeString(user.getPassword()),user.getEmail()});
	}
	
	public void addUserRole(String cust_id,String role_id) {
		String sql = "insert into user_role(USER_ID,ROLE_ID) values(?,?)";
		dao.update(sql,cust_id,role_id);
	}
}