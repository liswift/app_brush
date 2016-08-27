package com.eazy.brush.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazy.brush.dao.EmailDao;
import com.eazy.brush.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private EmailDao emailDao;
	
	@Override
	public List<Map<String, Object>> selectEmail() {
		return emailDao.selectEmail();
	}

	@Override
	public Map<String, Object> getEmailById(String id) {
		return emailDao.getEmailById(id);
	}

	@Override
	public void add(String name) {
		emailDao.add(name);
	}

	@Override
	public void delete(String id) {
		emailDao.delete(id);
	}

	@Override
	public List<Map<String, Object>> selectEmail(String date) {
		return emailDao.selectEmail(date);
	}

}
