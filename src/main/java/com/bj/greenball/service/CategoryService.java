package com.bj.greenball.service;

import java.util.List;

import com.bj.greenball.model.Category;


public interface CategoryService {
	
	public void addCategory(Category u);
	public void updateCategory(Category u);
	public List<Category> listCategory(int tournament);
	public Category getCategoryById(int id);
	public void removeCategory(int id);

}
