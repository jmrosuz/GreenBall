package com.bj.greenball.dao;

import java.util.List;

import com.bj.greenball.model.Groups;

import com.bj.greenball.model.Player;

public interface GroupsDAO {
	
	public void addGroup(Groups p);
	public void updateGroup(Groups p);
	public List<Groups> listGroup();
	public Groups getGroupById(int id);
	public void removeGroup(int id);
	public List<Groups> listGroup(int idTournament);
	public List<Groups> listGroupOnCategory(int idTournament, int category);
	public List<Groups> listGroupByTourCat(int tournament, int category);
	public Groups getGroupByKeys(int tournament, int category, Player p1);
}
