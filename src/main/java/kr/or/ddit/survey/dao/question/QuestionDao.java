package kr.or.ddit.survey.dao.question;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.survey.model.QuestionChoiceVo;
import kr.or.ddit.survey.model.QuestionVo;

@Repository
public class QuestionDao implements IQuestionDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QuestionVo> getQuestions(int sur_id) {
		
		return sqlSession.selectList("survey.getQuestions",sur_id);
	}

	@Override
	public List<QuestionChoiceVo> getQuestionsAndChoices(int sur_id) {
		return sqlSession.selectList("survey.getQuestionsAndChoices",sur_id);
	}
	
	
}
