package kr.or.ddit.category.category.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.category.dao.ICategoryDao;

@Service
public class CategoryService implements ICategoryService{
	@Resource(name = "categoryDao")
	private ICategoryDao categoryDao;
}
