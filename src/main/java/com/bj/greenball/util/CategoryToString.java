package com.bj.greenball.util;

import org.springframework.core.convert.converter.Converter;

import com.bj.greenball.model.Category;


public class CategoryToString implements Converter<Category, String> {

@Override
public String convert(final Category category) {
    return String.valueOf(category.getId());
}

}
