package com.eazy.lksy.web.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazy.lksy.web.core.dao.CommonDaoImpl;
import com.eazy.lksy.web.core.dao.DbEntity;
import com.eazy.lksy.web.dao.CommentDao;
import com.eazy.lksy.web.service.CommentService;
@Service
public class CommentServiceImpl extends CommonDaoImpl implements CommentService{

	@Autowired
	private CommentDao commentDao;
	
	@Override
	public boolean addComment(DbEntity dbEntity) {
		return commentDao.addComment(dbEntity);
	}
}
