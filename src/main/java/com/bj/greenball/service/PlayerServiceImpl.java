package com.bj.greenball.service;

import java.util.List;


import org.springframework.transaction.annotation.Transactional;
import com.bj.greenball.dao.PlayerDAO;
import com.bj.greenball.dao.TournamentDAO;
import com.bj.greenball.model.Player;
import com.bj.greenball.model.Tournament;



//@Service("userService")
//@Transactional
public class PlayerServiceImpl implements PlayerService {
	
	//@Autowired
	private PlayerDAO playerDAO;
	//private TransactionTemplate transactionManager;
	
	private TournamentDAO tournamentDAO;
	

	//public void setTransactionManager(TransactionTemplate transactionManager) {
		//this.transactionManager = transactionManager;
	//}
	@Transactional
	public void setPlayerDAO(PlayerDAO playerDAO) {
		this.playerDAO = playerDAO;
	}
	
	@Transactional
	public void setTournamentDAO(TournamentDAO tournamentDAO) {
		this.tournamentDAO = tournamentDAO;
	}

	@Override
	@Transactional
	public void addPlayer(Player p) {
		this.playerDAO.addPlayer(p);
	}

	@Override
	@Transactional
	public void updatePlayer(Player p) {
		this.playerDAO.updatePlayer(p);
	}

	@Override
	@Transactional
	public List<Player> listPlayer() {
		return this.playerDAO.listPlayer();
	}
	
	@Override
	@Transactional
	public List<Player> listPlayer(int tournament) {
		return this.playerDAO.listPlayer(tournament);
	}

	@Override
	@Transactional
	public Player getPlayerById(int id) {
		return this.playerDAO.getPlayerById(id);
	}

	@Override
	@Transactional
	public void removePlayer(int id) {
		this.playerDAO.removePlayer(id);
	}
	
	@Override
	@Transactional
	public List<Player> listPlayerOnCategory(int idTournament, String mode, int category){
		return this.playerDAO.listPlayerOnCategory(idTournament, mode, category);
	}


}
