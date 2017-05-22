package com.bj.greenball.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author pankaj
 *
 */
@Entity
@Table(name="tournament")
public class Tournament {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String name;
	
//	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
//	@JoinTable(name="tournament_players", joinColumns={@JoinColumn(name ="id_tournament", referencedColumnName ="id")},
//			inverseJoinColumns={@JoinColumn(name ="id_player", referencedColumnName ="id_player")})
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name="tournament_players", joinColumns={@JoinColumn(name ="id_tournament")},
			inverseJoinColumns={@JoinColumn(name ="id_player")})
	@Valid
	private Set<Player> players;
	
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name="tournament_categories", joinColumns={@JoinColumn(name ="id_tournament")},
			inverseJoinColumns={@JoinColumn(name ="id_category")})
	@Valid
	private Set<Category> categories;
	
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name="tour_tourdetails", joinColumns={@JoinColumn(name ="idTournament")},
			inverseJoinColumns={@JoinColumn(name ="idTournamentDetails")})
	@Valid
	private Set<TournamentDetails> tournamentDetails;
	
	@Column(name="shortName")
	@NotEmpty
	@Pattern(regexp="^[a-zA-Z0-9][a-zA-Z0-9 ]*$")
	private String shortName;
	
	@Column(name="referee")
	@NotEmpty
	@Pattern(regexp="^[a-zA-Z0-9][a-zA-Z0-9 ]*$")
	private String referee;
	
	@Column(name="startDate")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date startDate;
	
	@Column(name="endDate")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date endDate;
	
	@Column(name="numPersons")
	private int numPersons;
	
	@Column(name="dirStreet")
	@NotEmpty
	@Pattern(regexp="^[a-zA-Z0-9][a-zA-Z0-9 ]*$")
	private String dirStreet;
	
	@Column(name="dirCP")
	private int dirCP;
		
	@Column(name="dirState")
	@NotEmpty
	@Pattern(regexp="^[a-zA-Z0-9][a-zA-Z0-9 ]*$")
	private String dirState;
	
	@Column(name="club")
	@NotEmpty
	@Pattern(regexp="^[a-zA-Z0-9][a-zA-Z0-9 ]*$")
	private String club;
	
	@Column(name="telephone")
	private String telephone;
	
	@Column(name="dirNeighborhood")
	@NotEmpty
	@Pattern(regexp="^[a-zA-Z0-9][a-zA-Z0-9 ]*$")
	private String dirNeighborhood;
	
	@Column(name="activo", nullable = false)
	@Type(type = "org.hibernate.type.NumericBooleanType")
	private boolean activo;
	
	@Column(name="dirNumber")
	@NotEmpty
	private String dirNumber;
	
	@Column(name="dirCountry")
	@NotEmpty
	private String dirCountry;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Player> getPlayers() {
		return players;
	}

	public void setPlayers(Set<Player> players) {
		this.players = players;
	}
	
	public Set<Category> getCategories() {
		return categories;
	}

	public void setCategories(Set<Category> categories) {
		this.categories = categories;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public String getReferee() {
		return referee;
	}

	public void setReferee(String referee) {
		this.referee = referee;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getNumPersons() {
		return numPersons;
	}

	public void setNumPersons(int numPersons) {
		this.numPersons = numPersons;
	}

	public String getDirStreet() {
		return dirStreet;
	}

	public void setDirStreet(String dirStreet) {
		this.dirStreet = dirStreet;
	}

	public int getDirCP() {
		return dirCP;
	}

	public void setDirCP(int dirCP) {
		this.dirCP = dirCP;
	}

	public String getDirState() {
		return dirState;
	}

	public void setDirState(String dirState) {
		this.dirState = dirState;
	}

	public String getClub() {
		return club;
	}

	public void setClub(String club) {
		this.club = club;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getDirNeighborhood() {
		return dirNeighborhood;
	}

	public void setDirNeighborhood(String dirNeighborhood) {
		this.dirNeighborhood = dirNeighborhood;
	}

	public boolean getActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public String getDirNumber() {
		return dirNumber;
	}

	public void setDirNumber(String dirNumber) {
		this.dirNumber = dirNumber;
	}

	public String getDirCountry() {
		return dirCountry;
	}

	public void setDirCountry(String dirCountry) {
		this.dirCountry = dirCountry;
	}

	public Set<TournamentDetails> getTournamentDetails() {
		return tournamentDetails;
	}

	public void setTournamentDetails(Set<TournamentDetails> tournamentDetails) {
		this.tournamentDetails = tournamentDetails;
	}
	
	
	
	
	
	

}
