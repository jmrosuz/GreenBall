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
@Table(name="matchs")
@Validated
public class Match {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int id;

	@ManyToOne
	@JoinColumn(name="tournamentDetailId")
	public TournamentDetails tournamentDetailId;
	
	@ManyToOne
	@JoinColumn(name="category")
	private Category category;
	
	@Column(name="round")
	private int round;
	
	@Column(name="field")
	private String field;
	
	@ManyToOne
    @JoinColumn(name = "player1")
    public Player player1;
	
	@ManyToOne
    @JoinColumn(name = "player2")
    public Player player2;
	
	@ManyToOne
    @JoinColumn(name = "player1d")
    public Player player1d;
	
	@ManyToOne
    @JoinColumn(name = "player2d")
    public Player player2d;
	
	@Column(name="date")
	private Timestamp date;
	
	@Column(name="matchNumber")
	private int matchNumber;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	public int getRound() {
		return round;
	}

	public void setRound(int round) {
		this.round = round;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public Player getPlayer1() {
		return player1;
	}

	public void setPlayer1(Player player1) {
		this.player1 = player1;
	}

	public Player getPlayer2() {
		return player2;
	}

	public void setPlayer2(Player player2) {
		this.player2 = player2;
	}

	public Player getPlayer1d() {
		return player1d;
	}

	public void setPlayer1d(Player player1d) {
		this.player1d = player1d;
	}

	public Player getPlayer2d() {
		return player2d;
	}

	public void setPlayer2d(Player player2d) {
		this.player2d = player2d;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public int getMatchNumber() {
		return matchNumber;
	}

	public void setMatchNumber(int matchNumber) {
		this.matchNumber = matchNumber;
	}
	
	
	
	

}
