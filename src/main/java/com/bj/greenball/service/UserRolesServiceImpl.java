package com.bj.greenball.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.bj.greenball.model.UserRoles;
import com.bj.greenball.dao.UserRolesDAO;






public class UserRolesServiceImpl implements UserRolesService {
	
	private com.bj.greenball.dao.UserRolesDAO UserRolesDAO;
	//private TransactionTemplate transactionManager;
	
	
	

	//public void setTransactionManager(TransactionTemplate transactionManager) {
		//this.transactionManager = transactionManager;
	//}
	@Transactional
	public void setUserRolesDAO(UserRolesDAO userRolesDAO) {
		this.UserRolesDAO = userRolesDAO;
	}

	@Override
	@Transactional
	public void addUserRoles(UserRoles p) {
		this.UserRolesDAO.addUserRoles(p);
	}

	@Override
	@Transactional
	public void updateUserRoles(UserRoles p) {
		this.UserRolesDAO.updateUserRoles(p);
	}

	@Override
	@Transactional
	public List<UserRoles> listUsersRoles(String username) {
		return this.UserRolesDAO.listUsersRoles(username);
	}

	@Override
	@Transactional
	public UserRoles getUserRolesById(int id) {
		return this.UserRolesDAO.getUserRolesById(id);
	}

	@Override
	@Transactional
	public void removeUserRoles(int id) {
		this.UserRolesDAO.removeUserRoles(id);
	}


}
