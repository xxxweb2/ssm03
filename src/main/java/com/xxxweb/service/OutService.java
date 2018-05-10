package com.xxxweb.service;

import com.xxxweb.entity.Out;

import java.util.ArrayList;

public interface OutService {
    public Integer saveOut(Out out);
    public ArrayList<Out> getOutList();
    public int delOutById(int id);
    int updateJlqz(int id);
    int updateBack(int id, String time);
}
