package com.eazy.lksy.web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eazy.lksy.web.core.dao.CommonDaoImpl;
import com.eazy.lksy.web.core.dao.DbEntity;
import com.eazy.lksy.web.dao.HotelDao;
import com.eazy.lksy.web.service.HotelService;

@Service
public class HotelServiceImpl extends CommonDaoImpl implements HotelService {

	@Autowired
	private HotelDao hotelDao;

	@Override
	public void addHotel(DbEntity dbEntity) {
		hotelDao.addHotel(dbEntity);
	}

}
