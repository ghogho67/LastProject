package kr.or.ddit.matching.grade.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class GradeDao implements IGradeDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
	/**
	 * Method : cwGradeAvg
	 * 작성자 : PC21
	 * 변경이력 : 
	 * @return
	 * Method 설명 : 요양사마이페이지 평점 측정
	 */
	public String cwGradeAvg(String mem_id) {
		 
		return sqlSession.selectOne("grade.cwGradeAvg",mem_id);
	}

}
