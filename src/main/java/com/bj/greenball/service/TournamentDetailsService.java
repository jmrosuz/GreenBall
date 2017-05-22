package com.bj.greenball.service;

import java.util.List;

import com.bj.greenball.model.Tournament;
import com.bj.greenball.model.TournamentDetails;


public interface TournamentDetailsService {
	
	public void addTournamentDetails(TournamentDetails u);
	public void updateTournamentDetails(TournamentDetails u);
	public List<TournamentDetails> listTournamentDetails();
	public TournamentDetails getTournamentDetailsById(int id);
	public void removeTournamentDetails(int id);

}
