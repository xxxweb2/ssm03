package com.xxxweb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xxxweb.dao.LoginDao;
import com.xxxweb.service.LoginService;
@Service
public class LoginServiceImpl implements LoginService{
@Autowired
private LoginDao loginDao;
	public String getPassword(String username) {
		return loginDao.getPassword(username);
	}
}
