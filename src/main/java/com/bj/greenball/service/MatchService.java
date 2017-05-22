package com.bj.greenball.service;

import java.util.List;

import com.bj.greenball.model.Match;
import com.bj.greenball.model.Player;


public interface MatchService {
	
	public void addMatch(Match u);
	public void updateMatch(Match u);
	public List<Match> listMatch();
	public List<Match> listMatch(int tournament);
	public Match getMatchById(int id);
	public void removeMatch(int id);
	public List<Match> listMatchOnCategory(int idTournament, int category);
	public List<Match> listMatchByTourCat(int tournament, int category);
	public Match getMatchByKeys(int tournament, int category, Player p1, Player p2);
	public Match getMaxMatchNumber(int tournament, int category);

}
