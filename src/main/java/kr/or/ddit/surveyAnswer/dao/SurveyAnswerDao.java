package kr.or.ddit.surveyAnswer.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyAnswerDao implements ISurveyAnswerDao{

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
}
