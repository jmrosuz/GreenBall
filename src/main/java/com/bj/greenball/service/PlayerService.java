package com.bj.greenball.service;

import java.util.List;

import com.bj.greenball.model.Player;


public interface PlayerService {
	
	public void addPlayer(Player u);
	public void updatePlayer(Player u);
	public List<Player> listPlayer();
	public List<Player> listPlayer(int tournament);
	public Player getPlayerById(int id);
	public void removePlayer(int id);
	public List<Player> listPlayerOnCategory(int idTournament, String mode, int category);

}
