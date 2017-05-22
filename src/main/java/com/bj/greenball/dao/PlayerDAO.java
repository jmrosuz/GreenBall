package com.bj.greenball.dao;

import java.util.List;

import com.bj.greenball.model.Player;

public interface PlayerDAO {
	
	public void addPlayer(Player p);
	public void updatePlayer(Player p);
	public List<Player> listPlayer();
	public Player getPlayerById(int id);
	public void removePlayer(int id);
	public List<Player> listPlayer(int idTournament);
	public List<Player> listPlayerOnCategory(int idTournament, String mode, int category);
}
