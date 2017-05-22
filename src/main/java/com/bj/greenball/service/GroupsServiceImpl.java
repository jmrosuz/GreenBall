package com.bj.greenball.service;

import java.util.List;


import org.springframework.transaction.annotation.Transactional;

import com.bj.greenball.dao.GroupsDAO;
import com.bj.greenball.dao.MatchDAO;
import com.bj.greenball.dao.TournamentDAO;
import com.bj.greenball.model.Groups;
import com.bj.greenball.model.Match;
import com.bj.greenball.model.Player;
import com.bj.greenball.model.Tournament;



//@Service("userService")
//@Transactional
public class GroupsServiceImpl implements GroupsService {
	
	//@Autowired
	private GroupsDAO groupsDAO;
	//private TransactionTemplate transactionManager;
	
	private TournamentDAO tournamentDAO;
	

	//public void setTransactionManager(TransactionTemplate transactionManager) {
		//this.transactionManager = transactionManager;
	//}
	@Transactional
	public void setGroupsDAO(GroupsDAO groupsDAO) {
		this.groupsDAO = groupsDAO;
	}
	
	@Transactional
	public void setTournamentDAO(TournamentDAO tournamentDAO) {
		this.tournamentDAO = tournamentDAO;
	}

	@Override
	@Transactional
	public void addGroup(Groups p) {
		this.groupsDAO.addGroup(p);
	}

	@Override
	@Transactional
	public void updateGroup(Groups p) {
		this.groupsDAO.updateGroup(p);
	}

	@Override
	@Transactional
	public List<Groups> listGroup() {
		return this.groupsDAO.listGroup();
	}
	
	@Override
	@Transactional
	public List<Groups> listGroup(int tournament) {
		return this.groupsDAO.listGroup(tournament);
	}

	@Override
	@Transactional
	public Groups getGroupById(int id) {
		return this.groupsDAO.getGroupById(id);
	}

	@Override
	@Transactional
	public void removeGroup(int id) {
		this.groupsDAO.removeGroup(id);
	}
	
	@Override
	@Transactional
	public List<Groups> listGroupOnCategory(int idTournament, int category){
		return this.groupsDAO.listGroupOnCategory(idTournament, category);
	}
	
	@Override
	@Transactional
	public List<Groups> listGroupByTourCat(int tournament, int category){
		return this.groupsDAO.listGroupByTourCat(tournament, category);
	}

	public Groups getGroupByKeys(int tournament, int category, Player p1){
		return this.groupsDAO.getGroupByKeys(tournament, category, p1);
	}

}
