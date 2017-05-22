package com.bj.greenball.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bj.greenball.model.Category;
import com.bj.greenball.model.UserRoles;


@Repository
public class CategoryDAOImpl implements CategoryDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryDAOImpl.class);
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;	
	}
	
	@Override
	public void addCategory(Category u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(u);
		session.flush();
		logger.info("User saved successfully, User Details="+u);
	}

	@Override
	public void updateCategory(Category u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(u);
		logger.info("User updated successfully, User Details="+u);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Category> listCategory(int tournament) {
		Session session = this.sessionFactory.getCurrentSession();
		//List<UserRoles> UsersList = session.createQuery("from UserRoles where username = '" + username + "'").list();
		//for(UserRoles u : UsersList){
			//logger.info("User List::"+u);
		//}
		
		 //Query<UserRoles> query=session.createQuery("from UserRoles as ur INNER JOIN ur.username as u WHERE u.username= :user");
//		 Query<UserRoles> query=session.createQuery("from UserRoles u where u.username = :user  ");
//				    query.setParameter("user", username);
//				    System.out.println("UserRoles2.0");
//				    List<UserRoles> UsersList = query.list();
//				    System.out.println("UserRoles2");
//				    for(UserRoles u : UsersList){
//						logger.info("User List::"+u);
//					}
//				    System.out.println("UserRoles3");
//				    
				    
				    TypedQuery<Category> query = session.createQuery("from Category u where u.username = :user  ");
				    //query.setParameter("user", username);
				    List<Category> UsersList = query.getResultList();
		
		return UsersList;
	}

	@Override
	public Category getCategoryById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Category u = (Category) session.load(Category.class, new Integer(id));
		logger.info("Category loaded successfully, User details="+u);
		return u;
	}
	
	@Override
	public void removeCategory(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Category u = (Category) session.load(Category.class, new Integer(id));
		if(null != u){
			session.delete(u);
		}
		logger.info("User deleted successfully, User details="+u);
	}

}
