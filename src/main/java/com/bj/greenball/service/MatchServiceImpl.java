package com.bj.greenball.service;

import java.util.List;


import org.springframework.transaction.annotation.Transactional;
import com.bj.greenball.dao.MatchDAO;
import com.bj.greenball.dao.TournamentDAO;
import com.bj.greenball.model.Match;
import com.bj.greenball.model.Player;
import com.bj.greenball.model.Tournament;



//@Service("userService")
//@Transactional
public class MatchServiceImpl implements MatchService {
	
	//@Autowired
	private MatchDAO matchDAO;
	//private TransactionTemplate transactionManager;
	
	private TournamentDAO tournamentDAO;
	

	//public void setTransactionManager(TransactionTemplate transactionManager) {
		//this.transactionManager = transactionManager;
	//}
	@Transactional
	public void setMatchDAO(MatchDAO matchDAO) {
		this.matchDAO = matchDAO;
	}
	
	@Transactional
	public void setTournamentDAO(TournamentDAO tournamentDAO) {
		this.tournamentDAO = tournamentDAO;
	}

	@Override
	@Transactional
	public void addMatch(Match p) {
		this.matchDAO.addMatch(p);
	}

	@Override
	@Transactional
	public void updateMatch(Match p) {
		this.matchDAO.updateMatch(p);
	}

	@Override
	@Transactional
	public List<Match> listMatch() {
		return this.matchDAO.listMatch();
	}
	
	@Override
	@Transactional
	public List<Match> listMatch(int tournament) {
		return this.matchDAO.listMatch(tournament);
	}

	@Override
	@Transactional
	public Match getMatchById(int id) {
		return this.matchDAO.getMatchById(id);
	}

	@Override
	@Transactional
	public void removeMatch(int id) {
		this.matchDAO.removeMatch(id);
	}
	
	@Override
	@Transactional
	public List<Match> listMatchOnCategory(int idTournament, int category){
		return this.matchDAO.listMatchOnCategory(idTournament, category);
	}
	
	@Override
	@Transactional
	public List<Match> listMatchByTourCat(int tournament, int category){
		return this.matchDAO.listMatchByTourCat(tournament, category);
	}

	public Match getMatchByKeys(int tournament, int category, Player p1, Player p2){
		return this.matchDAO.getMatchByKeys(tournament, category, p1, p2);
	}
	
	public Match getMaxMatchNumber(int tournament, int category){
		return this.matchDAO.getMaxMatchNumber(tournament, category);
	}

}
