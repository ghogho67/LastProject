package kr.or.ddit.survey.survey.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyDao implements ISurveyDao{
	
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

}
