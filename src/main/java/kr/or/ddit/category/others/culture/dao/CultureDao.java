package kr.or.ddit.category.others.culture.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.category.others.culture.model.CultureVo;

@Repository
public class CultureDao implements ICultureDao {
	
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public int InsertCulture(CultureVo cultureVo) {
		
		return sqlSession.insert("lecture.InsertCulture",cultureVo);
	}

}
