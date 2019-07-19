package kr.or.ddit.survey.question.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDao implements IQuestionDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
	
}
