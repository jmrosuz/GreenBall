package com.bj.greenball.model;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.validation.annotation.Validated;
import com.bj.greenball.model.Category;



/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author pankaj
 *
 */
@Entity
@Table(name="groups")
@Validated
public class Groups {
	

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int id;
	
	@ManyToOne
	@JoinColumn(name="idTournamentDetails")
	public TournamentDetails tournamentDetailId;
	
	@ManyToOne
	@JoinColumn(name="idCategory")
	private Category category;
	
	@Column(name="grupo")
	private int group;
	
	@Column(name="pos")
	private int position;
	
	@ManyToOne
    @JoinColumn(name = "idPlayer")
    public Player player;
	
	@ManyToOne
    @JoinColumn(name = "idPlayerD")
    public Player playerD;

	public TournamentDetails getTournamentDetailId() {
		return tournamentDetailId;
	}

	public void setTournamentDetailId(TournamentDetails tournamentDetailId) {
		this.tournamentDetailId = tournamentDetailId;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public int getGroup() {
		return group;
	}

	public void setGroup(int group) {
		this.group = group;
	}

	public int getPosition() {
		return position;
	}

	public void setPosition(int position) {
		this.position = position;
	}

	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Player getPlayerD() {
		return playerD;
	}

	public void setPlayerD(Player playerD) {
		this.playerD = playerD;
	}
	
	
	
	
	

	}
