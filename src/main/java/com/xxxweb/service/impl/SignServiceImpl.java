package com.xxxweb.service.impl;

import com.xxxweb.dao.SignDao;
import com.xxxweb.entity.Sign;
import com.xxxweb.service.SignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class SignServiceImpl implements SignService {
    @Autowired
    private SignDao signDao;

    public Integer noClockCountByMonth(int id, int month, int state) {
        return signDao.noClockCountByMonth(id, month, state);
    }


    public void insertSign(Sign sign) {
        signDao.insertSign(sign);
    }

    public int isDa(int day) {
        return signDao.isDa(day);
    }

    public ArrayList<Sign> getSignListDetail(int id, int day) {
        return signDao.getSignListDetail(id, day);
    }

    public int countDa(int id, int year, int month) {
        return signDao.countDa(id, year, month);
    }

    public ArrayList<Sign> daDetail(int id, int year, int month) {
        return signDao.daDetail(id, year, month);
    }

    public ArrayList<Sign> todayDaList(int year, int month, int day) {
        return signDao.todayDaList(year, month, day);
    }

    public ArrayList<Sign> getSignByFilter(int year, int month, int day, int left, int right, int uid) {
        return signDao.getSignByFilter( year,  month,  day,  left,  right,  uid);
    }

    public int getSignCountById(int id) {
        return signDao.getSignCountById(id);
    }

    public ArrayList<Sign> getSignByFilter2(int year, int month, int day, Integer state, int uid) {
        return signDao.getSignByFilter2(year,month,day,state,uid);
    }

}
