package kr.or.ddit.category.category.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.category.category.model.CategoryVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class CategoryDaoTest extends LogicTestEnv {

	@Resource(name = "categoryDao")
	private ICategoryDao categoryDao;

	CategoryVo categoryVo = new CategoryVo();

	@Test
	public void getCategoryList() {

		/*** Given ***/

		/*** When ***/
		List<CategoryVo> appList = categoryDao.getCategoryList();

		/*** Then ***/
		assertEquals(29, appList.size());
	}
	
	

	@Test
	public void getCategoryList2() {

		/*** Given ***/

		/*** When ***/
		List<CategoryVo> appList = categoryDao.getCategoryList2();

		/*** Then ***/
		assertEquals(23, appList.size());
	}
	
	
	


	@Test
	public void getMajorCategoryList() {

		/*** Given ***/

		/*** When ***/
		List<CategoryVo> appList = categoryDao.getMajorCategoryList();

		/*** Then ***/
		assertEquals(8, appList.size());
	}

	@Test
	public void getMinorCategoryList() {

		/*** Given ***/
		int cate_paerent_id = 30007;

		/*** When ***/
		List<CategoryVo> appList = categoryDao.getMinorCategoryList(cate_paerent_id);

		/*** Then ***/
		assertEquals(1, appList.size());
	}

	
	@Test
	public void sideBarList() {

		/*** Given ***/
		int cate_id = 30007;

		/*** When ***/
		List<CategoryVo> appList = categoryDao.sideBarList(cate_id);

		/*** Then ***/
		assertEquals(0, appList.size());
	}
	
	
	@Test
	public void getCategory() {

		/*** Given ***/
		int cate_id = 30019;

		/*** When ***/
		CategoryVo appList = categoryDao.getCategory(cate_id);

		/*** Then ***/
		assertEquals("Y", appList.getCate_usage());
	}

	
	
	
	
	@Test
	public void InsertCategory() {
		
		/***Given***/
		CategoryVo categoryVo = new CategoryVo("테스트", 30002, "dkskqk00");

		/***When***/
				int insertDonation_nonCnt = categoryDao.InsertCategory(categoryVo);
	/***Then***/
		assertEquals(1,insertDonation_nonCnt);
	}
	
	
	
	
	

}
