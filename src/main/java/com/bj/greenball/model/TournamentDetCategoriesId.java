package com.bj.greenball.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.Table;

@Embeddable
//@Entity
//@Table(name="tournamentdet_categories")
public class TournamentDetCategoriesId implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Column(name="idcategory")
	private int idCategory;
	
	
	@Column(name="idtournamentdet")
	private int idTournamentDet;

	public int getIdCategory() {
		return idCategory;
	}

	public int getIdTournamentDet() {
		return idTournamentDet;
	}

	public void setIdTournamentDet(int idTournamentDet) {
		this.idTournamentDet = idTournamentDet;
	}

	public void setIdCategory(int idCategory) {
		this.idCategory = idCategory;
	}

	

}
