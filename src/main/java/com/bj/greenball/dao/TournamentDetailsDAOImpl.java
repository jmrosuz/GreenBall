package com.bj.greenball.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bj.greenball.model.TournamentDetails;


@Repository
public class TournamentDetailsDAOImpl implements TournamentDetailsDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(TournamentDetailsDAOImpl.class);
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;	
	}
	
	@Override
	public void addTournamentDetails(TournamentDetails u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(u);
		session.flush();
		logger.info("User saved successfully, Tournament Details="+u);
	}

	@Override
	public void updateTournamentDetails(TournamentDetails u) {
		Session session = this.sessionFactory.getCurrentSession();
		
		//session.merge(u);
		//
		session.saveOrUpdate(u);
		
		//session.flush();
		logger.info("User updated successfully, User Details="+u);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<TournamentDetails> listTournamentDetails() {
		Session session = this.sessionFactory.getCurrentSession();
		List<TournamentDetails> TournamentList = session.createQuery("from TournamentDetails").list();
		for(TournamentDetails u : TournamentList){
			logger.info("User List::"+u);
		}
		return TournamentList;
	}

	@Override
	public TournamentDetails getTournamentDetailsById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		TournamentDetails u = (TournamentDetails) session.load(TournamentDetails.class, id);
		logger.info("User loaded successfully, Player details="+u);
		return u;
	}
	
	
	
	@Override
	public void removeTournamentDetails(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		TournamentDetails u = (TournamentDetails) session.load(TournamentDetails.class, id);
		if(null != u){
			session.delete(u);
		}
		logger.info("User deleted successfully, User details="+u);
	}

}
