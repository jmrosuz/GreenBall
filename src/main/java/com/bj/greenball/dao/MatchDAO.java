package com.bj.greenball.dao;

import java.util.List;

import com.bj.greenball.model.Match;
import com.bj.greenball.model.Player;

public interface MatchDAO {
	
	public void addMatch(Match p);
	public void updateMatch(Match p);
	public List<Match> listMatch();
	public Match getMatchById(int id);
	public void removeMatch(int id);
	public List<Match> listMatch(int idTournament);
	public List<Match> listMatchOnCategory(int idTournament, int category);
	public List<Match> listMatchByTourCat(int tournament, int category);
	public Match getMatchByKeys(int tournament, int category, Player p1, Player p2);
	public Match getMaxMatchNumber(int tournament, int category);
}
