package com.xxxweb.dao;


import com.xxxweb.entity.QfUser;

import java.util.ArrayList;

public interface UserDao {
    public QfUser getUserByName(String username);

    public void saveUser(QfUser qfUser);

    public ArrayList<QfUser> getUserList();

    public Integer delteUserById(int id);

    public QfUser getUserById(int id);
    public int updateUser(QfUser qfUser);
}
