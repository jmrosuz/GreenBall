package com.bj.greenball.service;

import java.util.List;

import com.bj.greenball.model.Groups;
import com.bj.greenball.model.Player;


public interface GroupsService {
	
	public void addGroup(Groups u);
	public void updateGroup(Groups u);
	public List<Groups> listGroup();
	public List<Groups> listGroup(int tournament);
	public Groups getGroupById(int id);
	public void removeGroup(int id);
	public List<Groups> listGroupOnCategory(int idTournament, int category);
	public List<Groups> listGroupByTourCat(int tournament, int category);
	public Groups getGroupByKeys(int tournament, int category, Player p1);

}
