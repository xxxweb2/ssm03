package com.xxxweb.service;

import com.xxxweb.entity.Sign;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface SignService {
    //     未打卡
    Integer noClockCountByMonth(int id, int month, int state);

    void insertSign(Sign sign);
    int isDa(int day);
    ArrayList<Sign> getSignListDetail(int id, int day);
    int countDa(@Param("id")int id, @Param("year")int year, @Param("month")int month);
    ArrayList<Sign> daDetail(@Param("id")int id, @Param("year")int year, @Param("month")int month);
    ArrayList<Sign> todayDaList(@Param("year")int year, @Param("month")int month, @Param("day")int day);
    ArrayList<Sign> getSignByFilter(@Param("year")int year,@Param("month")int month,@Param("day")int day,@Param("left")int left,@Param("right")int right,@Param("uid")int uid);
}
