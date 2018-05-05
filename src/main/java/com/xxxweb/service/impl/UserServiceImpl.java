package com.xxxweb.service.impl;

import com.xxxweb.dao.UserDao;
import com.xxxweb.entity.QfUser;
import com.xxxweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    public QfUser getUserByName(String username) {
        return userDao.getUserByName(username);
    }

    public void saveUser(QfUser qfUser) {
        userDao.saveUser(qfUser);
    }

    public ArrayList<QfUser> getUserList() {
        return userDao.getUserList();
    }

    public Integer delteUserById(int id) {
        return userDao.delteUserById(id);
    }

    public QfUser getUserById(int id) {
        return userDao.getUserById(id);
    }

    public int updateUser(QfUser qfUser) {
        return userDao.updateUser(qfUser);
    }

}
