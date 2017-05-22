package com.bj.greenball.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class TournamentPlayersId implements Serializable {
	
	@Column(name="id_player")
	private int idPlayer;
	
	
	@Column(name="id_tournament")
	private int idTournament;

	public int getIdPlayer() {
		return idPlayer;
	}

	public void setIdPlayer(int idPlayer) {
		this.idPlayer = idPlayer;
	}

	public int getIdTournament() {
		return idTournament;
	}

	public void setIdTournament(int idTournament) {
		this.idTournament = idTournament;
	}

}
