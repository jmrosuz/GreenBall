package com.bj.greenball.service;

import java.util.List;


import org.springframework.transaction.annotation.Transactional;
import com.bj.greenball.dao.TournamentDetailsDAO;
import com.bj.greenball.model.TournamentDetails;




public class TournamentDetailsServiceImpl implements TournamentDetailsService {
	
	//@Autowired
	private TournamentDetailsDAO tournamentDetailsDAO;
	//private TransactionTemplate transactionManager;
	
	
	

	//public void setTransactionManager(TransactionTemplate transactionManager) {
		//this.transactionManager = transactionManager;
	//}
	@Transactional
	public void setTournamentDetailsDAO(TournamentDetailsDAO tournamentDetailsDAO) {
		this.tournamentDetailsDAO = tournamentDetailsDAO;
	}

	@Override
	@Transactional
	public void addTournamentDetails(TournamentDetails p) {
		this.tournamentDetailsDAO.addTournamentDetails(p);
	}

	@Override
	@Transactional
	public void updateTournamentDetails(TournamentDetails p) {
		this.tournamentDetailsDAO.updateTournamentDetails(p);
	}

	@Override
	@Transactional
	public List<TournamentDetails> listTournamentDetails() {
		return this.tournamentDetailsDAO.listTournamentDetails();
	}

	@Override
	@Transactional
	public TournamentDetails getTournamentDetailsById(int id) {
		return this.tournamentDetailsDAO.getTournamentDetailsById(id);
	}

	@Override
	@Transactional
	public void removeTournamentDetails(int id) {
		this.tournamentDetailsDAO.removeTournamentDetails(id);
	}
	

}
