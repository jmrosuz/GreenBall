package com.bj.greenball.model;

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
import javax.validation.Valid;

@Entity
@Table(name="tournament_details")
public class TournamentDetails {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="mode")
	private String mode;
	
	@Column(name="points")
	private String points;
	
	@Column(name="format")
	private String format;
	
	@Column(name="matchDuration")
	private int matchDuration;
	
	@Column(name="drawSize")
	private int drawSize;
	
	@Column(name="groupsSize")
	private int groupsSize;
	
	@Column(name="advanceFirst")
	private int advanceFirst;
	
	
	@OneToMany(cascade=CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinTable(name="tournamentdet_categories", joinColumns={@JoinColumn(name ="idtournamentdet")},
			inverseJoinColumns={@JoinColumn(name ="idcategory")})
	private Set<Category> categories;
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getPoints() {
		return points;
	}

	public void setPoints(String points) {
		this.points = points;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public int getMatchDuration() {
		return matchDuration;
	}

	public void setMatchDuration(int matchDuration) {
		this.matchDuration = matchDuration;
	}

	public int getDrawSize() {
		return drawSize;
	}

	public void setDrawSize(int drawSize) {
		this.drawSize = drawSize;
	}

	public int getGroupsSize() {
		return groupsSize;
	}

	public void setGroupsSize(int groupsSize) {
		this.groupsSize = groupsSize;
	}

	public int getAdvanceFirst() {
		return advanceFirst;
	}

	public void setAdvanceFirst(int advanceFirst) {
		this.advanceFirst = advanceFirst;
	}

	public int getAdvanceSecond() {
		return advanceSecond;
	}

	public void setAdvanceSecond(int advanceSecond) {
		this.advanceSecond = advanceSecond;
	}

	public int getAdvanceThird() {
		return advanceThird;
	}

	public void setAdvanceThird(int advanceThird) {
		this.advanceThird = advanceThird;
	}

	public String getFieldSize() {
		return fieldSize;
	}

	public void setFieldSize(String fieldSize) {
		this.fieldSize = fieldSize;
	}

	public String getBallSize() {
		return ballSize;
	}

	public void setBallSize(String ballSize) {
		this.ballSize = ballSize;
	}

	public String getServeMode() {
		return serveMode;
	}

	public void setServeMode(String serveMode) {
		this.serveMode = serveMode;
	}


	public Set<Category> getCategories() {
		return categories;
	}

	public void setCategories(Set<Category> categories) {
		this.categories = categories;
	}
	
	public TournamentDetails copy(TournamentDetails tournamentDetails){
		this.setMode(tournamentDetails.getMode());
		this.setFormat(tournamentDetails.getFormat());
		this.setAdvanceSecond(tournamentDetails.getAdvanceSecond());
		this.setAdvanceThird(tournamentDetails.getAdvanceThird());
		this.setFieldSize(tournamentDetails.getFieldSize());
		this.setBallSize(tournamentDetails.getBallSize());
		this.setServeMode(tournamentDetails.getServeMode());
		this.setGroupsSize(tournamentDetails.getGroupsSize());
		this.setDrawSize(tournamentDetails.getDrawSize());
		this.setMatchDuration(tournamentDetails.getMatchDuration());
		this.setCategories(tournamentDetails.getCategories());
		this.setPoints(tournamentDetails.getPoints());
		
		return this;
	}


	public TournamentDetails (String format){
		this.format = format;
	}
	public TournamentDetails (){
	}


	@Column(name="advanceSecond")
	private int advanceSecond;
	
	@Column(name="advanceThird")
	private int advanceThird;
	
	@Column(name="fieldSize")
	private String fieldSize;
	
	@Column(name="ballSize")
	private String ballSize;
	
	@Column(name="serveMode")
	private String serveMode;
	
	
	
	
	

}
