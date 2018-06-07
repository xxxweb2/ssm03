package com.xxxweb.service;

import com.xxxweb.entity.Department;
import com.xxxweb.entity.QfUser;

import java.util.ArrayList;

public interface UserService {
	public QfUser getUserByName(String username);
	public void saveUser(QfUser qfUser);
	public ArrayList<QfUser> getUserList();
	public Integer delteUserById(int id);
	public QfUser getUserById(int id);
	public int updateUser(QfUser qfUser);
	public Integer getIdByName(String name);
	ArrayList<QfUser> getAllUserByWeight(int weight);
	Department getDepById(int id);
}
