package com.bj.greenball.model;


import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author pankaj
 *
 */
@Entity
@Table(name="category")
public class Category {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="sex")
	private String sex;
	
	@OneToMany(mappedBy="singlesCategory")
	private Collection<Player> singlesPlayers;
	
	@OneToMany(mappedBy="doublesCategory")
	private Collection<Player> doublesPlayers;
	
	@OneToMany(mappedBy="mixesCategory")
	private Collection<Player> mixesPlayers;

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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Collection<Player> getSinglesPlayers() {
		return singlesPlayers;
	}

	public void setSinglesPlayers(Collection<Player> singlesPlayers) {
		this.singlesPlayers = singlesPlayers;
	}

	public Collection<Player> getDoublesPlayers() {
		return doublesPlayers;
	}

	public void setDoublesPlayers(Collection<Player> doublesPlayers) {
		this.doublesPlayers = doublesPlayers;
	}

	public Collection<Player> getMixesPlayers() {
		return mixesPlayers;
	}

	public void setMixesPlayers(Collection<Player> mixesPlayers) {
		this.mixesPlayers = mixesPlayers;
	}
	
	
	
	
	
	
}
