package com.bj.greenball.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bj.greenball.model.User;


@Repository
public class UserDAOImpl implements UserDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;	
	}
	
	@Override
	public void addUser(User u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(u);
		logger.info("User saved successfully, User Details="+u);
	}

	@Override
	public void updateUser(User u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(u);
		logger.info("User updated successfully, User Details="+u);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> listUsers() {
		Session session = this.sessionFactory.getCurrentSession();
		List<User> UsersList = session.createQuery("from User").list();
		for(User u : UsersList){
			logger.info("User List::"+u);
		}
		return UsersList;
	}

	@Override
	public User getUserById(String username) {
		System.out.println("en el dao 1");
		Session session = this.sessionFactory.getCurrentSession();
		
		System.out.println("en el dao 2");
		User u = (User) session.load(User.class, new String(username));
		System.out.println("en el dao 3");
		logger.info("User loaded successfully, User details="+u);
		return u;
	}
	
	@Override
	public void removeUser(String usarname) {
		Session session = this.sessionFactory.getCurrentSession();
		User u = (User) session.load(User.class, usarname);
		if(null != u){
			session.delete(u);
		}
		logger.info("User deleted successfully, User details="+u);
	}

}
