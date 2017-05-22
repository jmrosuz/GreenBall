package com.bj.greenball.dao;

import java.util.List;

import com.bj.greenball.model.Tournament;

public interface TournamentDAO {
	
	public void addTournament(Tournament p);
	public void updateTournament(Tournament p);
	public List<Tournament> listTournament();
	public Tournament getTournamentById(int id);
	public void removeTournament(int id);
	public Tournament getTournamentByShortName(String shortName);
}
