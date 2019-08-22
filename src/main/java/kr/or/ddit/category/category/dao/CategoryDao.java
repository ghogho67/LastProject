package kr.or.ddit.category.category.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.category.category.model.CategoryVo;
import kr.or.ddit.matching.report.model.ReportVo;

@Repository
public class CategoryDao implements ICategoryDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CategoryVo> getCategoryList() {

			return sqlSession.selectList("category.getCategoryList");
		}

	@Override
	public List<CategoryVo> getMajorCategoryList() {
		return sqlSession.selectList("category.getMajorCategoryList");
	}

	@Override
	public List<CategoryVo> getMinorCategoryList(int cate_paerent_id) {
		return sqlSession.selectList("category.getMinorCategoryList",cate_paerent_id);
	}

	



	@Override
	public int deleteMajorCategory(int cate_id) {
		return 	sqlSession.update("category.deleteMajorCategory",cate_id);
	}
	@Override
	public int deleteMinorCategory(int cate_id) {
		return 	sqlSession.update("category.deleteMinorCategory",cate_id);
	}


	
	
	@Override
	public int useMajorCategory(int cate_id) {
		return 	sqlSession.update("category.useMajorCategory",cate_id);
	}
	@Override
	public int useMinorCategory(int cate_id) {
		return 	sqlSession.update("category.useMinorCategory",cate_id);
	}

	
	
	@Override
	public int updateCategoryTitle(CategoryVo categoryVo) {
		return 	sqlSession.update("category.updateCategoryTitle",categoryVo);
	}

	
	
	
	@Override
	public int InsertCategory(CategoryVo categoryVo) {
		return 	sqlSession.update("category.InsertCategory",categoryVo);
	}

	@Override
	public CategoryVo getCategory(int cate_id) {
		return 	sqlSession.selectOne("category.getCategory",cate_id);
	}

	@Override
	public List<CategoryVo> sideBarList(int cate_id) {
		return sqlSession.selectList("category.sideBarList",cate_id);
	}

	@Override
	public List<CategoryVo> getCategoryList2() {
		return sqlSession.selectList("category.getCategoryList2");
	}

	@Override
	public int maxLevel() {
		return sqlSession.selectOne("category.maxLevel");
	}

	
	
}
