package com.xxxweb.service.impl;

import com.xxxweb.dao.OutDao;
import com.xxxweb.entity.Out;
import com.xxxweb.service.OutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class OutServiceImpl implements OutService {
    @Autowired
    private OutDao outDao;

    public Integer saveOut(Out out) {
        return outDao.saveOut(out);
    }

    public ArrayList<Out> getOutList() {
        return outDao.getOutList();
    }

    public int delOutById(int id) {
        return outDao.delOutById(id);
    }

    public int updateJlqz(int id) {
        return outDao.updateJlqz(id);
    }

    public int updateBack(int id, String time) {
        return outDao.updateBack(id, time);
    }

    public int getNoDo() {
        return outDao.getNoDo();
    }

    public ArrayList<Out> getMinmeOutList(int id) {
        return outDao.getMinmeOutList(id);
    }

    public ArrayList<Out> getAllOutListByWeight(int weight) {
        return outDao.getAllOutListByWeight(weight);
    }

}
