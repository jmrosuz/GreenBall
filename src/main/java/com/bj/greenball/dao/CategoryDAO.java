package com.bj.greenball.dao;

import java.util.List;

import com.bj.greenball.model.Category;
import com.bj.greenball.model.UserRoles;

public interface CategoryDAO {
	
	public void addCategory(Category u);
	public void updateCategory(Category u);
	public List<Category> listCategory(int tournament);
	public Category getCategoryById(int id);
	public void removeCategory(int id);
}
