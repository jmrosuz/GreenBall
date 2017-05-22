package com.bj.greenball.service;

import java.util.List;


import org.springframework.transaction.annotation.Transactional;

import com.bj.greenball.dao.TournamentDetCategoriesIdDAO;
import com.bj.greenball.dao.TournamentDetailsDAO;
import com.bj.greenball.model.TournamentDetCategoriesId;
import com.bj.greenball.model.TournamentDetails;




public class TournamentDetCategoriesIdServiceImpl implements TournamentDetCategoriesIdService {
	
	//@Autowired
	private TournamentDetCategoriesIdDAO tournamentDetCategoriesIdDAO;
	//private TransactionTemplate transactionManager;
	
	@Transactional
	public void setTournamentDetCategoriesIdDAO(TournamentDetCategoriesIdDAO tournamentDetCategoriesIdDAO) {
		this.tournamentDetCategoriesIdDAO = tournamentDetCategoriesIdDAO;
	}
	

	//public void setTransactionManager(TransactionTemplate transactionManager) {
		//this.transactionManager = transactionManager;
	//}


	@Override
	@Transactional
	public int getTournamentDetailsByCategory(int id) {
		return this.tournamentDetCategoriesIdDAO.getTournamentDetailsByCategory(id);
	}



}
