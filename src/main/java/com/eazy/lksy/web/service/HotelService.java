package com.eazy.lksy.web.service;

import com.eazy.lksy.web.core.dao.CommonService;
import com.eazy.lksy.web.core.dao.DbEntity;

public interface HotelService extends CommonService {

	public void addHotel(DbEntity dbEntity);
}
