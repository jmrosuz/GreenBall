package com.bj.greenball.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.bj.greenball.dao.UserDAO;
import com.bj.greenball.model.User;



//@Service("userService")
//@Transactional
public class UserServiceImpl implements UserService {
	
	//@Autowired
	private UserDAO UserDAO;
	//private TransactionTemplate transactionManager;
	
	
	

	//public void setTransactionManager(TransactionTemplate transactionManager) {
		//this.transactionManager = transactionManager;
	//}
	@Transactional
	public void setUserDAO(UserDAO UserDAO) {
		this.UserDAO = UserDAO;
	}

	@Override
	@Transactional
	public void addUser(User p) {
		this.UserDAO.addUser(p);
	}

	@Override
	@Transactional
	public void updateUser(User p) {
		this.UserDAO.updateUser(p);
	}

	@Override
	@Transactional
	public List<User> listUsers() {
		return this.UserDAO.listUsers();
	}

	@Override
	@Transactional
	public User getUserById(String username) {
		System.out.println("en el service");
		return this.UserDAO.getUserById(username);
	}

	@Override
	@Transactional
	public void removeUser(String username) {
		this.UserDAO.removeUser(username);
	}


}
