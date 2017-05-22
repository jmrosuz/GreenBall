package com.bj.greenball.service;

import java.util.List;

import com.bj.greenball.model.UserRoles;


public interface UserRolesService {
	
	public void addUserRoles(UserRoles u);
	public void updateUserRoles(UserRoles u);
	public List<UserRoles> listUsersRoles(String username);
	public UserRoles getUserRolesById(int id);
	public void removeUserRoles(int id);

}
