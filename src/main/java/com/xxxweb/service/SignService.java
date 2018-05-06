package com.xxxweb.service;

import com.xxxweb.entity.Sign;

import java.util.ArrayList;

public interface SignService {
    //     未打卡
    Integer noClockCountByMonth(int id, int month, int state);

    void insertSign(Sign sign);
    int isDa(int day);
    ArrayList<Sign> getSignListDetail(int id, int day);
}
