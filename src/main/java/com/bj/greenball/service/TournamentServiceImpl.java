package com.bj.greenball.service;

import java.util.List;


import org.springframework.transaction.annotation.Transactional;
import com.bj.greenball.dao.TournamentDAO;
import com.bj.greenball.model.Tournament;



//@Service("userService")
//@Transactional
public class TournamentServiceImpl implements TournamentService {
	
	//@Autowired
	private TournamentDAO tournamentDAO;
	//private TransactionTemplate transactionManager;
	
	
	

	//public void setTransactionManager(TransactionTemplate transactionManager) {
		//this.transactionManager = transactionManager;
	//}
	@Transactional
	public void setTournamentDAO(TournamentDAO tournamentDAO) {
		this.tournamentDAO = tournamentDAO;
	}

	@Override
	@Transactional
	public void addTournament(Tournament p) {
		this.tournamentDAO.addTournament(p);
	}

	@Override
	@Transactional
	public void updateTournament(Tournament p) {
		this.tournamentDAO.updateTournament(p);
	}

	@Override
	@Transactional
	public List<Tournament> listTournament() {
		return this.tournamentDAO.listTournament();
	}

	@Override
	@Transactional
	public Tournament getTournamentById(int id) {
		return this.tournamentDAO.getTournamentById(id);
	}
	
	@Override
	@Transactional
	public Tournament getTournamentByShortName(String shortName) {
		return this.tournamentDAO.getTournamentByShortName(shortName);
	}

	@Override
	@Transactional
	public void removeTournament(int id) {
		this.tournamentDAO.removeTournament(id);
	}
	

}
