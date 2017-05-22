package com.bj.greenball.dao;

import java.util.List;

import com.bj.greenball.model.User;

public interface UserDAO {
	
	public void addUser(User u);
	public void updateUser(User u);
	public List<User> listUsers();
	public User getUserById(String username);
	public void removeUser(String username);
}
