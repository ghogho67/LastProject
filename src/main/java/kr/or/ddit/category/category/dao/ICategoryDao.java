package kr.or.ddit.category.category.dao;

import java.util.List;

import kr.or.ddit.category.category.model.CategoryVo;
import kr.or.ddit.matching.matching.model.MatchingVo;

public interface ICategoryDao {

	/**
	 * Method : getCategoryList
	 * 작성자 : 오도아
	 * 변경이력 :
	 * @return
	 * Method 설명  카테고리 전체 불러오기 
	 */
	List<CategoryVo> getCategoryList();
	
	/**
	 * Method : getCategoryList
	 * 작성자 : 오도아
	 * 변경이력 :
	 * @return
	 * Method 설명  카테고리 대분류 불러오기 
	 */
	List<CategoryVo> getMajorCategoryList();
	
	/**
	 * Method : getCategoryList
	 * 작성자 : 오도아
	 * 변경이력 :
	 * @return
	 * Method 설명  카테고리 중분류 불러오기 
	 */
	List<CategoryVo> getMinorCategoryList(int cate_paerent_id);
	
	
	int deleteMajorCategory(int cate_id);
	int deleteMinorCategory(int cate_id);
	int useMajorCategory(int cate_id);
	int useMinorCategory(int cate_id);
	

	int updateCategoryTitle(CategoryVo categoryVo);
	
}
