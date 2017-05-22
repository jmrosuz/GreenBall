package com.bj.greenball.service;

import java.util.List;

import com.bj.greenball.model.Tournament;


public interface TournamentService {
	
	public void addTournament(Tournament u);
	public void updateTournament(Tournament u);
	public List<Tournament> listTournament();
	public Tournament getTournamentById(int id);
	public Tournament getTournamentByShortName(String shortName);
	public void removeTournament(int id);

}
