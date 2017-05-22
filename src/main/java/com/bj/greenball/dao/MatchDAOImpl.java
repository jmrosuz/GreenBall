package com.bj.greenball.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bj.greenball.model.Match;
import com.bj.greenball.model.Player;


@Repository
@Transactional
public class MatchDAOImpl implements MatchDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(MatchDAOImpl.class);
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;	
	}
	
	@Override
	public void addMatch(Match u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(u);
		logger.info("User saved successfully, Match Details="+u);
	}

	@Override
	public void updateMatch(Match u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(u);
		logger.info("User updated successfully, Match Details="+u);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Match> listMatch() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Match> MatchList = session.createQuery("from Match").list();
		for(Match u : MatchList){
			logger.info("User List::"+u);
		}
		return MatchList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Match> listMatchByTourCat(int tournament, int category) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Match> MatchList = session.createQuery("from Match where tournamentDetailId.id = :tournament and category.id = :category order by matchNumber")
				.setParameter("tournament", tournament)
				.setParameter("category", category)
				.list();
		for(Match u : MatchList){
			logger.info("User List::"+u);
		}
		return MatchList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Match> listMatch(int idTournament) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Match> MatchList = session.createQuery("select play " +
				"from Player play, TournamentPlayers tp " +
				"where play.idPlayer = tp.id.idPlayer and tp.id.idTournament = :tournament")
				.setParameter("tournament", idTournament)
				.list();
		for(Match u : MatchList){
			logger.info("User List::"+u);
		}
		return MatchList;
	}
	

	@Override
	public Match getMatchById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Match u = (Match) session.load(Match.class, id);
		logger.info("User loaded successfully, Player details="+u);
		return u;
	}
	
	@Override
	public void removeMatch(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Match u = (Match) session.load(Match.class, id);
		if(null != u){
			session.delete(u);
		}
		logger.info("User deleted successfully, User details="+u);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Match> listMatchOnCategory(int idTournament,  int category) {
		Session session = this.sessionFactory.getCurrentSession();
		boolean isKid = false;
		String sex = "M";
		String query = "select play " +
				"from Player play, TournamentPlayers tp " +
				"where play.idPlayer = tp.id.idPlayer and tp.id.idTournament = :tournament";
		
		
		System.out.println(query);
		List<Match> MatchList = session.createQuery(query)
				.setParameter("tournament", idTournament)
				.setParameter("category", category)
				.setParameter("sex", sex.charAt(0))
				.setParameter("isKid", isKid)
				.list();
		for(Match u : MatchList){
			logger.info("Match List::"+u);
		}
		return MatchList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Match getMatchByKeys(int tournament, int category, Player p1, Player p2) {
		Session session = this.sessionFactory.getCurrentSession();
		Match MatchList = (Match) session.createQuery("from Match where tournamentDetailId.id = :tournament and category.id = :category "
				+ " and player1 = :player1 and player2 = :player2")
				.setParameter("tournament", tournament)
				.setParameter("category", category)
				.setParameter("player1", p1)
				.setParameter("player2", p2)
				.uniqueResult();
		
		return MatchList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Match getMaxMatchNumber(int tournament, int category) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Match> MatchList =  session.createQuery("from Match where tournamentDetailId.id = :tournament  order by matchNumber DESC" )
				.setParameter("tournament", tournament)
				.list();
		
		Match Match = null;
		if (MatchList.size() >0){
			 Match = MatchList.get(0);
		}
		
		
		return Match;
	}

}
