package com.eazy.lksy.web.dao;

import org.springframework.stereotype.Repository;

import com.eazy.lksy.web.core.dao.BaseDao;
import com.eazy.lksy.web.core.dao.DbEntity;

@Repository
public class CommentDao extends BaseDao {

	public boolean addComment(DbEntity dbEntity) {
		return dao.update("insert into comment(comment,u_id) values(?,?)", dbEntity.get("desc"),dbEntity.get("uid")) == 1;
	}
}
