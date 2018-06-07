package com.xxxweb.dao;


import com.xxxweb.entity.Department;
import com.xxxweb.entity.QfUser;

import java.util.ArrayList;

public interface UserDao {
    public QfUser getUserByName(String username);

    public void saveUser(QfUser qfUser);

    public ArrayList<QfUser> getUserList();

    public Integer delteUserById(int id);

    public QfUser getUserById(int id);

    public int updateUser(QfUser qfUser);

    //    通过模糊查询 根据姓名查找id
    public Integer getIdByName(String name);
    ArrayList<QfUser> getAllOutListByWeight(int weight);
    Department getDepById(int id);
}
