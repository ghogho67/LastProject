package kr.or.ddit.survey.dao.question;

import java.util.List;

import kr.or.ddit.survey.model.QuestionChoiceVo;
import kr.or.ddit.survey.model.QuestionVo;

public interface IQuestionDao {

	List<QuestionVo> getQuestions(int sur_id);
	List<QuestionChoiceVo> getQuestionsAndChoices(int sur_id);
	
}
