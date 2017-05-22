package com.bj.greenball.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bj.greenball.model.Player;


@Repository
public class PlayerDAOImpl implements PlayerDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(PlayerDAOImpl.class);
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;	
	}
	
	@Override
	public void addPlayer(Player u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(u);
		logger.info("User saved successfully, User Details="+u);
	}

	@Override
	public void updatePlayer(Player u) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(u);
		logger.info("User updated successfully, User Details="+u);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Player> listPlayer() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Player> PlayersList = session.createQuery("from Player").list();
		for(Player u : PlayersList){
			logger.info("User List::"+u);
		}
		return PlayersList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Player> listPlayer(int idTournament) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Player> PlayersList = session.createQuery("select play " +
				"from Player play, TournamentPlayers tp " +
				"where play.idPlayer = tp.id.idPlayer and tp.id.idTournament = :tournament")
				.setParameter("tournament", idTournament)
				.list();
		for(Player u : PlayersList){
			logger.info("User List::"+u);
		}
		return PlayersList;
	}
	

	@Override
	public Player getPlayerById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Player u = (Player) session.load(Player.class, id);
		logger.info("User loaded successfully, Player details="+u);
		return u;
	}
	
	@Override
	public void removePlayer(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Player u = (Player) session.load(Player.class, id);
		if(null != u){
			session.delete(u);
		}
		logger.info("User deleted successfully, User details="+u);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Player> listPlayerOnCategory(int idTournament, String mode, int category) {
		Session session = this.sessionFactory.getCurrentSession();
		boolean isKid = false;
		String sex = "M";
		String query = "select play " +
				"from Player play, TournamentPlayers tp " +
				"where play.idPlayer = tp.id.idPlayer and tp.id.idTournament = :tournament";
		if (mode.equals("SM")){
			query = query + " and play.singlesCategory.id = :category and play.sex = :sex and play.kid = :isKid";
		}
		else if (mode.equals("SMN")){
			query = query + " and play.singlesCategory.id = :category and play.sex = :sex and play.kid = :isKid";
			isKid = true;
		}
		if (mode.equals("SW")){
			query = query + " and play.singlesCategory.id = :category and play.sex = :sex and play.kid = :isKid";
			sex= "F";
		}
		else if (mode.equals("SWN")){
			query = query + " and play.singlesCategory.id = :category and play.sex = :sex and play.kid = :isKid";
			isKid = true;
			sex= "F";
		}
		else if(mode.equals("D")){
			query = query + " and play.doublesCategory.id = :category and play.sex != :sex";
			sex = "P";
		}else if (mode.equals("M")){
			query = query +" and play.mixesCategory.id = :category and play.sex != :sex";
			sex = "P";
		}
		
		System.out.println(query);
		System.out.println("Tournament:"+idTournament + "   category:"+ category + "   sex:"+sex.charAt(0) + "    isKid:"+isKid);
		
		Map<String, Object> pars = new HashMap<String, Object>();
		pars.put("tournament", idTournament);
		pars.put("category", category);
		pars.put("isKid", isKid);
		pars.put("sex", sex.charAt(0));
		
		Query q = session.createQuery(query);
		
		for (String p : q.getNamedParameters()){
			q.setParameter(p, pars.get(p));
		}
		
		List<Player> PlayersList = q.list();
		
//		List<Player> PlayersList = session.createQuery(query)
//				.setParameter("tournament", idTournament)
//				.setParameter("category", category)
//				.setParameter("isKid", isKid)
//				.setParameter("sex", sex.charAt(0))
//				.list();
		for(Player u : PlayersList){
			logger.info("User List::"+u);
		}
		return PlayersList;
	}

}
