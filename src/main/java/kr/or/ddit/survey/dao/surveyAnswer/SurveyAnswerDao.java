package kr.or.ddit.survey.dao.surveyAnswer;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.survey.model.SurveyAnswerVo;

@Repository
public class SurveyAnswerDao implements ISurveyAnswerDao{

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertQuestionAns(SurveyAnswerVo surveyAnswerVo) {
		return sqlSession.insert("survey.insertQuestionAns",surveyAnswerVo);
	}
	
}
