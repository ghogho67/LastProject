package kr.or.ddit.category.category.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.category.dao.ICategoryDao;
import kr.or.ddit.category.category.model.CategoryVo;

@Service
public class CategoryService implements ICategoryService {
	@Resource(name = "categoryDao")
	private ICategoryDao categoryDao;

	@Override
	public List<CategoryVo> getCategoryList() {
		return categoryDao.getCategoryList();
	}

	@Override
	public List<CategoryVo> getMajorCategoryList() {
		// TODO Auto-generated method stub
		return categoryDao.getMajorCategoryList();
	}

	@Override
	public List<CategoryVo> getMinorCategoryList(int cate_paerent_id) {
		// TODO Auto-generated method stub
		return categoryDao.getMinorCategoryList(cate_paerent_id);
	}

	@Override
	public int deleteMajorCategory(int cate_id) {
		return categoryDao.deleteMajorCategory(cate_id);
	}

	@Override
	public int deleteMinorCategory(int cate_id) {
		return categoryDao.deleteMinorCategory(cate_id);
	}
	
	
	@Override
	public int useMajorCategory(int cate_id) {
		return categoryDao.useMajorCategory(cate_id);
	}

	@Override
	public int useMinorCategory(int cate_id) {
		return categoryDao.useMinorCategory(cate_id);
	}

	@Override
	public int updateCategoryTitle(CategoryVo categoryVo) {
		return categoryDao.updateCategoryTitle(categoryVo);
	}
	
}
