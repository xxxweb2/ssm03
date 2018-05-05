package com.xxxweb.service.impl;

import com.xxxweb.dao.SignDao;
import com.xxxweb.entity.Sign;
import com.xxxweb.service.SignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SignServiceImpl implements SignService {
	@Autowired
	private SignDao signDao;
	public Integer noClockCountByMonth(int id, int month, int state) {
		return signDao.noClockCountByMonth(id, month,state);
	}


	public void insertSign(Sign sign) {
		signDao.insertSign(sign);
	}

	public int isDa(int day) {
		return signDao.isDa(day);
	}
}
