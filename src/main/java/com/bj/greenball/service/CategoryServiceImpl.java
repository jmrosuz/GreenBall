package com.bj.greenball.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.bj.greenball.model.Category;
import com.bj.greenball.dao.CategoryDAO;
import com.bj.greenball.dao.TournamentDAO;






public class CategoryServiceImpl implements CategoryService {
	
	private com.bj.greenball.dao.CategoryDAO categoryDAO;
	//private TransactionTemplate transactionManager;
	
	private TournamentDAO tournamentDAO;
	

	//public void setTransactionManager(TransactionTemplate transactionManager) {
		//this.transactionManager = transactionManager;
	//}
	@Transactional
	public void setCategoryDAO(CategoryDAO userRolesDAO) {
		this.categoryDAO = userRolesDAO;
	}
	
	@Transactional
	public void setTournamentDAO(TournamentDAO tournamentDAO) {
		this.tournamentDAO = tournamentDAO;
	}

	@Override
	@Transactional
	public void addCategory(Category p) {
		this.categoryDAO.addCategory(p);
	}

	@Override
	@Transactional
	public void updateCategory(Category p) {
		this.categoryDAO.updateCategory(p);
	}

	@Override
	@Transactional
	public List<Category> listCategory(int tournamente) {
		return this.categoryDAO.listCategory(tournamente);
	}

	@Override
	@Transactional
	public Category getCategoryById(int id) {
		return this.categoryDAO.getCategoryById(id);
	}

	@Override
	@Transactional
	public void removeCategory(int id) {
		this.categoryDAO.removeCategory(id);
	}


}
