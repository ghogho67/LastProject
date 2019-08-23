package kr.or.ddit.category.category.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.category.category.model.CategoryVo;
import kr.or.ddit.testenv.LogicTestEnv;





public class CategoryDaoTest extends LogicTestEnv{

	@Resource(name = "categoryDao")
	private ICategoryDao categoryDao;
	
	CategoryVo categoryVo = new CategoryVo();
	
	
	@Test
	public void getCategoryList() {

	/***Given***/
	

	/***When***/
		List<CategoryVo> appList = categoryDao.getCategoryList();

	/***Then***/
		assertEquals(200, appList.size());
	}
	
	
	@Test
	public void getMajorCategoryList() {

	/***Given***/
	

	/***When***/

	/***Then***/
	}
	
	@Test
	public void getMinorCategoryList() {
		
		/***Given***/
<<<<<<< HEAD
=======
		
>>>>>>> 2983d2a0f8c0f174ebd75205a974751037d6d481
		int cate_paerent_id;
		/***When***/
		
		/***Then***/
	}


}
