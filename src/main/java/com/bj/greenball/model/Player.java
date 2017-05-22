package com.bj.greenball.model;

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
@Table(name="player")
@Validated
public class Player {
	
	@Id
	@Column(name="id_player")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idPlayer;
	
	@Column(name="name")
	@NotEmpty
	@Pattern(regexp="^[a-zA-Z0-9][a-zA-Z0-9 ]*$")
	private String name;
	
	@Column(name="middle_name")
	@NotEmpty
	@Pattern(regexp="^[a-zA-Z0-9][a-zA-Z0-9 ]*$")
	private String middleName;
	
	
	@Column(name="last_name")
	@Pattern(regexp="|^[a-zA-Z0-9][a-zA-Z0-9 ]*$")
	private String lastName;
	
	@Column(name="club")
	@NotEmpty
	private String club;
	
	@Column(name="sex")
	private char sex;
	
	@Column(name="is_kid", nullable = false)
	@Type(type = "org.hibernate.type.NumericBooleanType")
	private boolean kid;
	
	@Column(name="telephone")
	private String telephone;
	
	
	@Column(name="email")
	@Email
	private String email;
	
	@ManyToOne
    @JoinColumn(name = "singlesCategory")
    public Category singlesCategory;
	
	@ManyToOne
    @JoinColumn(name = "doublesCategory")
    public Category doublesCategory;
	
	@ManyToOne
    @JoinColumn(name = "mixesCategory")
    public Category mixesCategory;
	
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinTable(name = "tournament_players", joinColumns={ @JoinColumn(name = "id_player", referencedColumnName="id_player")}, 
//			inverseJoinColumns={@JoinColumn(name="id_tournament", referencedColumnName="id")})
//	private transient Tournament tournament;
//	
//	public Player(Tournament tournament){
//		this.tournament = tournament;
//	}
//	
//	public Player(){}

	public int getIdPlayer() {
		return idPlayer;
	}

	public void setIdPlayer(int idPlayer) {
		this.idPlayer = idPlayer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getClub() {
		return club;
	}

	public void setClub(String club) {
		this.club = club;
	}

	public char getSex() {
		return sex;
	}

	public void setSex(char sex) {
		this.sex = sex;
	}

	public boolean getKid() {
		return kid;
	}

	public void setKid(boolean kid) {
		this.kid = kid;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Category getSinglesCategory() {
		return singlesCategory;
	}

	public void setSinglesCategory(Category singlesCategory) {
		this.singlesCategory = singlesCategory;
	}

	public Category getDoublesCategory() {
		return doublesCategory;
	}

	public void setDoublesCategory(Category doublesCategory) {
		this.doublesCategory = doublesCategory;
	}

	public Category getMixesCategory() {
		return mixesCategory;
	}

	public void setMixesCategory(Category mixesCategory) {
		this.mixesCategory = mixesCategory;
	}
	
	

//	public Tournament getTournamente() {
//		return tournament;
//	}
//
//	public void setTournament(Tournament tournament) {
//		this.tournament = tournament;
//	}
	
	

}
