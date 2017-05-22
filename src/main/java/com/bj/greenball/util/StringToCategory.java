package com.bj.greenball.util;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.convert.converter.Converter;

import com.bj.greenball.model.Category;
import com.bj.greenball.service.CategoryService;

public class StringToCategory implements Converter<String, Category> {

	private CategoryService categoryService;
	
	@Autowired(required=true)
	@Qualifier(value="categoryService")
	public void setCategoryService(CategoryService ps){
		this.categoryService = ps;
	}

@Override
public Category convert(final String categoryIdStr) {
    return categoryService.getCategoryById(Integer.valueOf(categoryIdStr));
}

}
