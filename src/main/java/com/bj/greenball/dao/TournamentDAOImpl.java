package com.bj.greenball.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bj.greenball.model.Tournament;
import com.bj.greenball.model.UserRoles;


@Repository
public class TournamentDAOImpl implements TournamentDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(TournamentDAOImpl.class);
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;	
	}
	
	@Override
	public void addTournament(Tournament u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(u);
		logger.info("User saved successfully, User Details="+u);
	}

	@Override
	public void updateTournament(Tournament u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(u);
		logger.info("User updated successfully, User Details="+u);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Tournament> listTournament() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Tournament> TournamentList = session.createQuery("from Tournament").list();
		for(Tournament u : TournamentList){
			logger.info("User List::"+u);
		}
		return TournamentList;
	}

	@Override
	public Tournament getTournamentById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Tournament u = (Tournament) session.load(Tournament.class, id);
		logger.info("User loaded successfully, Player details="+u);
		return u;
	}
	
	@Override
	public Tournament getTournamentByShortName(String shortName) {
		Session session = this.sessionFactory.getCurrentSession();
		
		
		
		TypedQuery<Tournament> query = session.createQuery("from Tournament t where t.shortName = :shortName  ");
	    query.setParameter("shortName", shortName);
	    Tournament f = (Tournament) query.getSingleResult();
		
		logger.info("User loaded successfully, Player details="+f);
		return f;
	}
	
	@Override
	public void removeTournament(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Tournament u = (Tournament) session.load(Tournament.class, id);
		if(null != u){
			session.delete(u);
		}
		logger.info("User deleted successfully, User details="+u);
	}

}
