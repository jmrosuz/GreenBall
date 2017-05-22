package com.bj.greenball.dao;

import java.util.List;

import com.bj.greenball.model.TournamentDetails;

public interface TournamentDetailsDAO {
	
	public void addTournamentDetails(TournamentDetails p);
	public void updateTournamentDetails(TournamentDetails p);
	public List<TournamentDetails> listTournamentDetails();
	public TournamentDetails getTournamentDetailsById(int id);
	public void removeTournamentDetails(int id);

}
