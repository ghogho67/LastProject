package kr.or.ddit.surveyPart.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyPartDao implements ISurveyPartDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
}
