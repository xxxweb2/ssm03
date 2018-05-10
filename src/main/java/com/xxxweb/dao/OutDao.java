package com.xxxweb.dao;


import com.xxxweb.entity.Out;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface OutDao {
    public Integer saveOut(Out out);

    public ArrayList<Out> getOutList();

    public int delOutById(int id);

    int updateJlqz(int id);

    int updateBack(@Param("id") int id, @Param("time") String time);
}

