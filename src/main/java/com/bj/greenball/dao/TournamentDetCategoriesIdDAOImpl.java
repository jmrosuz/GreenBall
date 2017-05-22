package com.bj.greenball.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bj.greenball.model.TournamentDetCategories;
import com.bj.greenball.model.TournamentDetCategoriesId;


@Repository
public class TournamentDetCategoriesIdDAOImpl implements TournamentDetCategoriesIdDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(TournamentDetCategoriesIdDAOImpl.class);
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;	
	}
	

	@Override
	public int getTournamentDetailsByCategory(int id){
		Session session = this.sessionFactory.getCurrentSession();
		
		int tdl = (Integer) session.createQuery("select td.id.idTournamentDet "+
				"from TournamentDetCategories td  " +
				"where td.id.idCategory = :category")
				.setParameter("category", id)
				.uniqueResult();
		
		
		
		return tdl;
	}
	
	
	

}
