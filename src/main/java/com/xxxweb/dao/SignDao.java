package com.xxxweb.dao;


import com.xxxweb.entity.Sign;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface SignDao {
    //     未打卡
// 0 正常打卡 1未打卡 2迟到 3早退
    Integer noClockCountByMonth(@Param("id") int id, @Param("month") int month, @Param("state") int state);

    void insertSign(Sign sign);

    //    是否打卡
    int isDa(int day);

    ArrayList<Sign> getSignListDetail(@Param("id") int id, @Param("day") int day);

    int countDa(@Param("id") int id, @Param("year") int year, @Param("month") int month);

    ArrayList<Sign> daDetail(@Param("id") int id, @Param("year") int year, @Param("month") int month);

    ArrayList<Sign> todayDaList(@Param("year") int year, @Param("month") int month, @Param("day") int day);

    ArrayList<Sign> getSignByFilter(@Param("year") int year, @Param("month") int month, @Param("day") int day, @Param("left") int left, @Param("right") int right, @Param("uid") int uid);

    int getSignCountById(int id);
    ArrayList<Sign> getSignByFilter2(@Param("year") int year, @Param("month") int month, @Param("day") int day, @Param("state") Integer state,  @Param("uid") int uid);
}
