package com.eazy.lksy.web.dao;

import org.springframework.stereotype.Repository;

import com.eazy.lksy.web.core.dao.BaseDao;
import com.eazy.lksy.web.core.dao.DbEntity;

@Repository
public class HotelDao  extends BaseDao {

	public void addHotel(DbEntity dbEntity) {
		dao.update("insert into hotel(hotel_name,tel,address,img,star) values(?,?,?,?,?)",dbEntity.get("hotel_name"),dbEntity.get("hotel_tel"),dbEntity.get("hotel_addr"),dbEntity.get("photo_name"),dbEntity.get("hotel_star"));
	}
}
