package com.xxxweb.dao;


import com.xxxweb.entity.Sign;
import org.apache.ibatis.annotations.Param;

public interface SignDao {
    //     未打卡
// 0 正常打卡 1未打卡 2迟到 3早退
    Integer noClockCountByMonth(@Param("id") int id, @Param("month") int month, @Param("state") int state);

    void insertSign(Sign sign);

    //    是否打卡
    int isDa(int day);
}
