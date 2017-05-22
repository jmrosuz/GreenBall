package com.bj.greenball.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bj.greenball.model.Groups;
import com.bj.greenball.model.Match;
import com.bj.greenball.model.Player;


@Repository
@Transactional
public class GroupsDAOImpl implements GroupsDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(GroupsDAOImpl.class);
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;	
	}
	
	@Override
	public void addGroup(Groups u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(u);
		logger.info("User saved successfully, Match Details="+u);
	}

	@Override
	public void updateGroup(Groups u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(u);
		logger.info("User updated successfully, Match Details="+u);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Groups> listGroup() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Groups> GroupsList = session.createQuery("from Groups").list();
		for(Groups u : GroupsList){
			logger.info("User List::"+u);
		}
		return GroupsList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Groups> listGroupByTourCat(int tournament, int category) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Groups> GroupsList = session.createQuery("from Groups where tournamentDetailId.id = :tournament and category.id = :category order by group, position")
				.setParameter("tournament", tournament)
				.setParameter("category", category)
				.list();
		for(Groups u : GroupsList){
			logger.info("User List::"+u);
		}
		return GroupsList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Groups> listGroup(int idTournament) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Groups> MatchList = session.createQuery("select play " +
				"from Player play, TournamentPlayers tp " +
				"where play.idPlayer = tp.id.idPlayer and tp.id.idTournament = :tournament")
				.setParameter("tournament", idTournament)
				.list();
		for(Groups u : MatchList){
			logger.info("User List::"+u);
		}
		return MatchList;
	}
	

	@Override
	public Groups getGroupById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Groups u = (Groups) session.load(Groups.class, id);
		logger.info("User loaded successfully, Player details="+u);
		return u;
	}
	
	@Override
	public void removeGroup(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Groups u = (Groups) session.load(Groups.class, id);
		if(null != u){
			session.delete(u);
		}
		logger.info("User deleted successfully, User details="+u);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Groups> listGroupOnCategory(int idTournament,  int category) {
		Session session = this.sessionFactory.getCurrentSession();
		boolean isKid = false;
		String sex = "M";
		String query = "select play " +
				"from Player play, TournamentPlayers tp " +
				"where play.idPlayer = tp.id.idPlayer and tp.id.idTournament = :tournament";
		
		
		System.out.println(query);
		List<Groups> MatchList = session.createQuery(query)
				.setParameter("tournament", idTournament)
				.setParameter("category", category)
				.setParameter("sex", sex.charAt(0))
				.setParameter("isKid", isKid)
				.list();
		for(Groups u : MatchList){
			logger.info("Match List::"+u);
		}
		return MatchList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Groups getGroupByKeys(int tournament, int category, Player p1) {
		Session session = this.sessionFactory.getCurrentSession();
		Groups MatchList = (Groups) session.createQuery("from Match where tournamentDetailId.id = :tournament and category.id = :category "
				+ " and player1 = :player1 ")
				.setParameter("tournament", tournament)
				.setParameter("category", category)
				.setParameter("player1", p1)
				.uniqueResult();
		
		return MatchList;
	}

}
