package com.bj.greenball.dao;

import java.util.List;

import com.bj.greenball.model.UserRoles;

public interface UserRolesDAO {
	
	public void addUserRoles(UserRoles u);
	public void updateUserRoles(UserRoles u);
	public List<UserRoles> listUsersRoles(String username);
	public UserRoles getUserRolesById(int id);
	public void removeUserRoles(int id);
}
