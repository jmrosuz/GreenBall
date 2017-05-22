package com.bj.greenball.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class TournamentCategoriesId implements Serializable {
	
	@Column(name="id_category")
	private int idCategory;
	
	
	@Column(name="id_tournament")
	private int idTournament;

	public int getIdCategory() {
		return idCategory;
	}

	public void setIdPlayer(int idPlayer) {
		this.idCategory = idPlayer;
	}

	public int getIdTournament() {
		return idTournament;
	}

	public void setIdTournament(int idTournament) {
		this.idTournament = idTournament;
	}

}
